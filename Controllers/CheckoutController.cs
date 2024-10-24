using Microsoft.AspNetCore.Mvc;
using BTLW_BDT.Models.Cart;

namespace BTLW_BDT.Controllers
{
    public class CheckoutController : Controller
    {
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
    }
}
