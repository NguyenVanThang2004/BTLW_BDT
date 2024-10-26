using BTLW_BDT.Models;
using BTLW_BDT.Models.Cart;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

    namespace BTLW_BDT.Controllers
    {

        public class HomeController : Controller
        {
            BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();

            private readonly ILogger<HomeController> _logger;

            public HomeController(ILogger<HomeController> logger)
            {
                _logger = logger;
           
            }



        public int CartCount()
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();
            return cart.Count;
        }







        public IActionResult Index()
        {
            ViewBag.CartCount = CartCount();  // Truyền số lượng sản phẩm vào ViewBag
            var lstSanPham = db.SanPhams.ToList();
       
            return View(lstSanPham);
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
