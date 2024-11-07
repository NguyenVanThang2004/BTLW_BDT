using Microsoft.AspNetCore.Mvc;
using BTLW_BDT.Models.Cart;
using BTLW_BDT.Models;
using Microsoft.AspNetCore.Authorization;
using BTLW_BDT.Services;
using BTLW_BDT.Models.VnPay;
using BTLW_BDT.Models.Order;


namespace BTLW_BDT.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly BtlLtwQlbdtContext _context;
        private readonly IVnPayService _vnPayService;

        public CheckoutController(BtlLtwQlbdtContext context, IVnPayService vnPayService)
        {
            _context = context;
            _vnPayService = vnPayService;
        }

        public IActionResult DetailCheckout()
        {
            ViewData["Page"] = "Checkout";
            var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();

            return View(cartItems);
        }

        [HttpPost]
        public IActionResult PlaceOrder(string paymentMethod)
        {
            ViewData["Page"] = "Checkout";
            var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();


            if (!cartItems.Any())
            {
                return RedirectToAction("DetailCheckout");
            }


            if (paymentMethod == "Pay at store")
            {
                // Truy vấn mã hóa đơn lớn nhất hiện tại trong bảng `hoadon`
                var lastHoaDon = _context.HoaDonBans
                                        .Where(h => h.MaHoaDon.StartsWith("HD"))
                                        .AsEnumerable() // Chuyển dữ liệu từ database sang bộ nhớ
                                        .OrderByDescending(h => int.Parse(h.MaHoaDon.Substring(2))) // Sắp xếp trên bộ nhớ
                                        .FirstOrDefault();


                // Tạo mã hóa đơn mới
                string newMaHoaDon;
                if (lastHoaDon != null)
                {
                    int lastNumber = int.Parse(lastHoaDon.MaHoaDon.Substring(2));
                    lastNumber += 1;

                    // Xử lý định dạng cho mã hóa đơn dựa trên giá trị của lastNumber
                    if (lastNumber >= 10000)
                    {
                        newMaHoaDon = "HD" + lastNumber.ToString("D5"); // Định dạng 5 chữ số
                    }
                    else if (lastNumber >= 1000)
                    {
                        newMaHoaDon = "HD" + lastNumber.ToString("D4"); // Định dạng 4 chữ số
                    }
                    else
                    {
                        newMaHoaDon = "HD" + lastNumber.ToString("D3"); // Định dạng 3 chữ số
                    }
                }
                else
                {
                    // Khởi tạo mã hóa đơn đầu tiên
                    newMaHoaDon = "HD001";
                }


                var order = new HoaDonBan
                {
                    MaHoaDon =newMaHoaDon,
                    PhuongThucThanhToan = paymentMethod,
                    TongTien = cartItems.Sum(item => item.DonGia * item.SoLuong),
                    ThoiGianLap = DateTime.Now

                };

                _context.HoaDonBans.Add(order);

                foreach (var item in cartItems)
                {
                    var orderDetail = new ChiTietHoaDonBan
                    {
                        SoLuongBan = item.SoLuong,
                        DonGiaCuoi = item.DonGia,
                        MaHoaDon = order.MaHoaDon,
                        MaSanPham = item.MaSanPham
                    };
                    _context.ChiTietHoaDonBans.Add(orderDetail);
                }

                _context.SaveChanges();
                // Gọi UpdateInventory để cập nhật số lượng tồn kho
                UpdateInventory();

                TempData["Message"] = "Thanh toan tai cua hang";
                return RedirectToAction("OrderSuccess");
            }
            else
            {
                var vnPayModel = new VnPaymentRequestModel
                {
                    Amount = cartItems.Sum(item => (double)(item.DonGia * item.SoLuong)),
                    CreatedDate = DateTime.Now,
                    Description = "Thông tin đơn hàng",
                    FullName = "Khách hàng",
                    OrderId = new Random().Next(1000, 100000)
                };

                var paymentUrl = _vnPayService.CreatePaymentUrl(HttpContext, vnPayModel);
                return Redirect(paymentUrl);
            }
        }

        public IActionResult OrderSuccess()
        {
            var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();
            return View(cartItems);
        }

       
        public IActionResult PaymentCallBack()
        {
            var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();
            var response = _vnPayService.PaymentExecute(Request.Query);

            if (response == null || response.VnPayResponseCode != "00")
            {
                TempData["Message"] = $"Lỗi thanh toán VN Pay: {response?.VnPayResponseCode}";
                return RedirectToAction("PaymentFail");
            }
            
            // Truy vấn mã hóa đơn lớn nhất hiện tại trong bảng `hoadon`
            var lastHoaDon = _context.HoaDonBans
                                    .Where(h => h.MaHoaDon.StartsWith("HD"))
                                    .AsEnumerable() // Chuyển dữ liệu từ database sang bộ nhớ
                                    .OrderByDescending(h => int.Parse(h.MaHoaDon.Substring(2))) // Sắp xếp trên bộ nhớ
                                    .FirstOrDefault();


           
          


            // Tạo mã hóa đơn mới
            string newMaHoaDon;
            if (lastHoaDon != null)
            {
                int lastNumber = int.Parse(lastHoaDon.MaHoaDon.Substring(2));
                lastNumber += 1;

                // Xử lý định dạng cho mã hóa đơn dựa trên giá trị của lastNumber
                if (lastNumber >= 10000)
                {
                    newMaHoaDon = "HD" + lastNumber.ToString("D5"); // Định dạng 5 chữ số
                }
                else if (lastNumber >= 1000)
                {
                    newMaHoaDon = "HD" + lastNumber.ToString("D4"); // Định dạng 4 chữ số
                }
                else
                {
                    newMaHoaDon = "HD" + lastNumber.ToString("D3"); // Định dạng 3 chữ số
                }
            }
            else
            {
                // Khởi tạo mã hóa đơn đầu tiên
                newMaHoaDon = "HD001";
            }







            var order = new HoaDonBan
            {
                MaHoaDon = newMaHoaDon,
                PhuongThucThanhToan = "QR",
                TongTien = cartItems.Sum(item => item.DonGia * item.SoLuong),
                ThoiGianLap = DateTime.Now
            };

            _context.HoaDonBans.Add(order);

            foreach (var item in cartItems)
            {

                var orderDetail = new ChiTietHoaDonBan
                {
                    SoLuongBan = item.SoLuong,
                    DonGiaCuoi = item.DonGia,
                    MaHoaDon = order.MaHoaDon,
                    MaSanPham = item.MaSanPham
                };
                _context.ChiTietHoaDonBans.Add(orderDetail);
            }

           

            _context.SaveChanges();

            // Gọi UpdateInventory để cập nhật số lượng tồn kho
            UpdateInventory();
            TempData["Message"] = "Thanh toan QR";

            return RedirectToAction("OrderSuccess");


            
        }
        public IActionResult UpdateInventory()
        {
            // Lấy giỏ hàng từ session
            var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();

            // Duyệt qua từng sản phẩm trong giỏ hàng để cập nhật số lượng tồn kho
            foreach (var item in cartItems)
            {
                // Lấy sản phẩm từ cơ sở dữ liệu dựa trên mã sản phẩm
                var product = _context.SanPhams.FirstOrDefault(p => p.MaSanPham == item.MaSanPham);

                if (product != null)
                {
                    // Trừ số lượng từ giỏ hàng ra khỏi số lượng tồn kho hiện tại
                    product.SoLuongTonKho -= item.SoLuong;

                    // Đảm bảo số lượng tồn kho không âm
                    if (product.SoLuongTonKho < 0)
                    {
                        product.SoLuongTonKho = 0;
                    }
                }
            }

            // Lưu thay đổi vào cơ sở dữ liệu
            _context.SaveChanges();

            TempData["Message"] = "Đã cập nhật số lượng tồn kho thành công";
            return RedirectToAction("OrderSuccess");
        }


        public IActionResult ClearCart()
        {
            // Xóa session giỏ hàng
            HttpContext.Session.Remove("GioHang");

            // Chuyển hướng về trang giỏ hàng hoặc một trang khác, ví dụ là trang chủ
            return RedirectToAction("Home", "Index");
        }


        public IActionResult PaymentFail()
        {
            return View();
        }
    }
}
