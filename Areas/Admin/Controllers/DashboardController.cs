using BTLW_BDT.Models;
using Microsoft.AspNetCore.Mvc;

namespace BTLW_BDT.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Route("Dashboard")]
    public class DashboardController : Controller
    {
        BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();
        //private readonly IWebHostEnvironment _webHostEnvironment;
        private DashboardController(BtlLtwQlbdtContext context)
        {
            db= context;
           // _webHostEnvironment= webHostEnvironment;
        }
        public IActionResult DashBoard()
        {
            var count_product = db.SanPhams.Count();
            var count_CTHDB = db.ChiTietHoaDonBans.Count();
            var count_CTGH = db.ChiTietGioHangs.Count();
            ViewBag.CountProduct = count_product;
            ViewBag.CountCTHDB = count_CTHDB;
            ViewBag.CountCTGH = count_CTGH;
            return View();
        }
    }
}
