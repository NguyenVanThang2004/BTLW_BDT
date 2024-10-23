using BTLW_BDT.Models;
using BTLW_BDT.Models.Cart;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace BTLW_BDT.Controllers
{
    public class HomeController : Controller
    {
        private readonly BtlLtwQlbdtContext _context;

        private readonly ILogger<HomeController> _logger;

        public HomeController(BtlLtwQlbdtContext context, ILogger<HomeController> logger)
        {
            _logger = logger;
            _context = context;
        }

        public int CartCount
        {
            get
            {
                return Carts.Count(); // Đếm tổng số lượng sản phẩm trong giỏ
            }
        }

        public IActionResult Index()
        {
            ViewBag.CartCount = CartCount; // Truyền số lượng sản phẩm vào ViewBag
            var lstSanPham = _context.SanPhams.ToList();
       
            return View(lstSanPham);
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
            ViewBag.CartCount = CartCount; // Truyền số lượng sản phẩm vào ViewBag
            ViewData["Page"] = "Shopping Cart";
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
                    MaSanPham = id,  
                    TenSanPham = hangHoa.TenSanPham,
                    DonGia = hangHoa.DonGiaBanRa.HasValue ? hangHoa.DonGiaBanRa.Value : 0,  
                    SoLuong = 1,
                    Anh = hangHoa.AnhDaiDien  
                };
                myCart.Add(item);
            }
            else
            {
               
                item.SoLuong++;
            }

            // Lưu giỏ hàng lại vào session
            HttpContext.Session.Set("GioHang", myCart);

           

            return RedirectToAction("Index");  // Điều hướng về trang giỏ hàng
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



       
        public IActionResult Checkout()
        {
            ViewData["Page"] = "Checkout";
            return View();
        }



        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
