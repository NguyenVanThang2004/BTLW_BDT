using BTLW_BDT.Models;
using Microsoft.AspNetCore.Mvc;
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

        public IActionResult Index()
        {
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
