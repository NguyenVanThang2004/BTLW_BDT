
﻿using BTLW_BDT.Models;
using BTLW_BDT.Models.Authentication;
using BTLW_BDT.Models.Cart;
using Microsoft.AspNetCore.Mvc;

namespace BTLW_BDT.Controllers
{
    public class CartController : Controller
    {

        private readonly BtlLtwQlbdtContext _context;


        public CartController(BtlLtwQlbdtContext context)
        {
            _context = context;
        }

        public int CartCount
        {
            get
            {
                return Carts.Count();
            }
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



        

        public IActionResult Index()
        {
            ViewBag.CartCount = CartCount; // Truyền số lượng sản phẩm vào ViewBag
            ViewData["Page"] = "Shopping Cart";
            var cart = Carts;

            return View(Carts);
        }
        public IActionResult DetailCart()

        {

            ViewBag.CartCount = CartCount; // Truyền số lượng sản phẩm vào ViewBag
            ViewData["Page"] = "Shopping Cart";
            var cart = Carts;

            return View(Carts);
        }

        // Thêm sản phẩm vào giỏ hàng


        //[Authentication]

        public IActionResult AddToCart(string id)
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();

            // Thêm sản phẩm vào giỏ hàng
            var item = cart.SingleOrDefault(x => x.MaSanPham == id);
            if (item == null)
            {
                var hangHoa = _context.SanPhams.SingleOrDefault(x => x.MaSanPham == id);
                if (hangHoa != null)
                {
                    item = new CartItem
                    {
                        MaSanPham = id,
                        TenSanPham = hangHoa.TenSanPham,
                        DonGia = hangHoa.DonGiaBanRa ?? 0,
                        SoLuong = 1,
                        Anh = hangHoa.AnhDaiDien
                    };
                    cart.Add(item);
                }
            }
            else
            {
                item.SoLuong++;
            }

            HttpContext.Session.Set("GioHang", cart);  // Lưu giỏ hàng lại vào session
            return RedirectToAction("Index","Home");
        }


        [HttpPost]
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


            return RedirectToAction("DetailCart"); // Trở lại trang giỏ hàng

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

            return RedirectToAction("DetailCart"); // Trở lại trang giỏ hàng

        }

        // xoa session
        public IActionResult ClearCart()
        {
            HttpContext.Session.Remove("GioHang");
            return RedirectToAction("Index", "Home");
        }






        public IActionResult Checkout()
        {
            ViewData["Page"] = "Checkout";
            return View();
        }

        

    }
}
