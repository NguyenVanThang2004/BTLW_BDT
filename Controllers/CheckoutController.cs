using Microsoft.AspNetCore.Mvc;
using BTLW_BDT.Models.Cart;
using BTLW_BDT.Models;
using BTLW_BDT.Models.Cart;


namespace BTLW_BDT.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly BtlLtwQlbdtContext _context;

        public CheckoutController(BtlLtwQlbdtContext context)
        {
            _context = context;
        } 

        public IActionResult DetailCheckout()
        {
            ViewData["Page"] = "Checkout";
            // Lấy dữ liệu giỏ hàng từ Session đã lưu ở giỏ hàng của trang cart
            var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang");

            if (cartItems == null)
            {
                // Xử lý trường hợp không có giỏ hàng trong session
                cartItems = new List<CartItem>();
            }

            return View(cartItems); 
        }

        [HttpPost]
        public IActionResult PlaceOrder(string paymentMethod)
        {
            ViewData["Page"] = "Checkout";
            if (paymentMethod == "Pay at store")
            {
                // Thực hiện logic đặt hàng nếu cần (lưu dữ liệu đơn hàng, cập nhật trạng thái...)

                // Lấy dữ liệu giỏ hàng từ session
                var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();

                // Kiểm tra nếu giỏ hàng rỗng
                if (!cartItems.Any())
                {
                    // Xử lý nếu giỏ hàng trống
                    return RedirectToAction("DetailCheckout"); // Quay lại nếu giỏ hàng trống
                }
                string maHoaDon = "HD" + new Random().Next(100, 999).ToString();
                // Tạo hóa đơn mới
                var order = new HoaDonBan
                {
                    MaHoaDon = maHoaDon, // Tạo mã hóa đơn
                    PhuongThucThanhToan = paymentMethod,
                    TongTien = cartItems.Sum(item => item.DonGia * item.SoLuong),
                    ThoiGianLap = DateTime.Now
                    // Giả sử có MaNhanVien hoặc mã khách hàng khác có thể thêm vào
                };

                // Lưu hóa đơn vào database
                _context.HoaDonBans.Add(order);

                // Lưu chi tiết hóa đơn
                foreach (var item in cartItems)
                {
                    var orderDetail = new ChiTietHoaDonBan
                    {
                        SoLuongBan = item.SoLuong,
                        DonGiaCuoi = item.DonGia ,
                        MaHoaDon = order.MaHoaDon,
                        MaSanPham = item.MaSanPham,
                    };
                    _context.ChiTietHoaDonBans.Add(orderDetail);
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                _context.SaveChanges();





                // sua session trong gio hang
                // HttpContext.Session.Remove("GioHang");
                // Điều hướng sang trang thành công
                return RedirectToAction("OrderSuccess");
            }
            else
            {
                // Xử lý các phương thức thanh toán khác (nếu có)
            }

            return View("Checkout"); // Quay lại nếu có lỗi
        }

        public IActionResult OrderSuccess()
        {
            var cartItems = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();

            // Truyền cartItems vào view nếu không null
            return View(cartItems);
        }

       
    }
}
