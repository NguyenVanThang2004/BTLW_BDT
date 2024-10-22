using BTLW_BDT.Models;
using BTLW_BDT.Models.Cart;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Linq;

namespace BTLW_BDT.Controllers
{
    public class CartController : Controller
    {
        private readonly BtlLtwQlbdtContext _context;

        public CartController(BtlLtwQlbdtContext context)
        {
            _context = context;
        }

        
        public List<CartItem> Carts
        {
            get
            {
                var data = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (data == null)
                {
                    data = new List<CartItem>();
                }
                return data;
            }
        }

        
        public IActionResult Cart()
        {
            var cart = Carts;
            return View(Carts);
        }

        // Thêm sản phẩm vào giỏ hàng
        public IActionResult AddToCart(string id)
        {
            var myCart = Carts;

            // Tìm sản phẩm trong giỏ hàng hiện tại
            var item = myCart.SingleOrDefault(x => x.MaSanPham == id);

            if (item == null)
            {
                // Tìm sản phẩm trong CSDL
                var hangHoa = _context.SanPhams.SingleOrDefault(x => x.MaSanPham == id);

                if (hangHoa == null)
                {
                    // Xử lý trường hợp không tìm thấy sản phẩm trong CSDL
                    return NotFound();
                }

                
                

                // Thêm sản phẩm vào giỏ hàng
                item = new CartItem
                {
                    MaSanPham = id,  // Đổi tên cho đúng với CSDL
                    TenSanPham = hangHoa.TenSanPham,
                    DonGia = hangHoa.DonGiaBanRa.HasValue ? hangHoa.DonGiaBanRa.Value : 0,  // Sử dụng giá bán ra
                    SoLuong = 1,
                    Anh = hangHoa.AnhDaiDien  // Lấy ảnh từ AnhSanPham
                };
                myCart.Add(item);
            }
            else
            {
                // Nếu sản phẩm đã có trong giỏ, tăng số lượng
                item.SoLuong++;
            }

            // Lưu giỏ hàng lại vào session
            HttpContext.Session.Set("GioHang", myCart);

            return RedirectToAction("Cart");  // Điều hướng về trang giỏ hàng
        }


        [HttpPost] // Đảm bảo phương thức chỉ nhận yêu cầu POST
        public IActionResult RemoveFromCart(string maSanPham)
        {
            var myCart = Carts;

            // Tìm sản phẩm trong giỏ hàng
            var item = myCart.SingleOrDefault(x => x.MaSanPham == maSanPham);
            if (item != null)
            {
                myCart.Remove(item); // Xóa sản phẩm
            }

            // Lưu giỏ hàng lại vào session
            HttpContext.Session.Set("GioHang", myCart);
            return RedirectToAction("Cart"); // Trở lại trang giỏ hàng
        }

        [HttpPost]
        public IActionResult UpdateQuantity(string maSanPham, int quantity, string action)
        {
            var myCart = Carts;

            // Tìm sản phẩm trong giỏ hàng
            var item = myCart.SingleOrDefault(x => x.MaSanPham == maSanPham);
            if (item != null)
            {
                // Tăng hoặc giảm số lượng dựa trên hành động
                if (action == "increase")
                {
                    item.SoLuong++;
                }
                else if (action == "decrease")
                {
                    // Giảm số lượng, không cho phép số lượng < 1
                    if (item.SoLuong > 1)
                    {
                        item.SoLuong--;
                    }
                }
            }

            // Lưu giỏ hàng lại vào session
            HttpContext.Session.Set("GioHang", myCart);
            return RedirectToAction("Cart"); // Trở lại trang giỏ hàng
        }

    }
}
