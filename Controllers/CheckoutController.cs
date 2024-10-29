using Microsoft.AspNetCore.Mvc;
using BTLW_BDT.Models.Cart;
using BTLW_BDT.Models;
using BTLW_BDT.Models.Cart;
using BTLW_BDT.Models.Order;

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
            return View(); // Trả về trang Order Success
        }

        [HttpPost]
        public IActionResult ProcessCheckout(OrderModel model)
        {

            if(ModelState.IsValid)
            {
                Random random = new Random();
                string maKhachHang = "KH" + random.Next(1000, 9999);

                var khachHang = new KhachHang
                {
                    MaKhachHang = maKhachHang,
                    TenKhachHang = model.TenKhachHang,
                    NgaySinh = model.NgaySinh,
                    SoDienThoai = model.SoDienThoai,
                    DiaChi = model.DiaChi,
                    LoaiKhachHang = model.LoaiKhachHang,
                    GhiChu = model.GhiChu

                };
                _context.KhachHangs.Add(khachHang);
                _context.SaveChanges();

            }

            return RedirectToAction("Index","Home"); 
        }
    }
}
