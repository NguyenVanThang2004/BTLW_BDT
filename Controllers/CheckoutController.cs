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
                string maHoaDon = "HD" + new Random().Next(100, 999);

                var order = new HoaDonBan
                {
                    MaHoaDon = maHoaDon,
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
                TempData["Message"] = "Thanh toan tai cua hang";
                HttpContext.Session.Remove("GioHang");
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

            string maHoaDon = "HD" + new Random().Next(100, 999);

            var order = new HoaDonBan
            {
                MaHoaDon = maHoaDon,
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
            TempData["Message"] = "Thanh toan QR";
            HttpContext.Session.Remove("GioHang");
            return RedirectToAction("OrderSuccess");





            
            
        }

        public IActionResult PaymentFail()
        {
            return View();
        }
    }
}
