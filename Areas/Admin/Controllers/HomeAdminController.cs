using BTLW_BDT.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace BTLW_BDT.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    //[Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("DanhMucSanPham")]
        public IActionResult DanhMucSanPham(int? page)
        {
            int pageSize = 15;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstSanPham = db.SanPhams.AsNoTracking().OrderBy(x => x.TenSanPham);
            PagedList<SanPham> lst = new PagedList<SanPham>(lstSanPham, pageNumber, pageSize);
            return View(lst);
        }
        [Route("ThemSanPhamMoi")]
        [HttpGet]
        public IActionResult ThemSanPhamMoi()
        {
            ViewBag.MaMau = new SelectList(db.MauSacs.ToList(), "MaMau", "TenMau");
            ViewBag.MaRom = new SelectList(db.Roms.ToList(), "MaRom", "ThongSo");
            return View();
        }
        [Route("ThemSanPhamMoi")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPhamMoi(SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.SanPhams.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }
            return View(sanPham);
        }
        [Route("SuaSanPham")]
        [HttpGet]
        public IActionResult SuaSanPham(string maSanPham)
        {

            ViewBag.MaMau = new SelectList(db.MauSacs.ToList(), "MaMau", "TenMau");
            ViewBag.MaRom = new SelectList(db.Roms.ToList(), "MaRom", "ThongSo");
            var sanPham = db.SanPhams.Find(maSanPham);
            return View(sanPham);
        }
        [Route("SuaSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPham(SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }
            return View(sanPham);
        }
        [Route("XoaSanPham")]
        [HttpGet]
        public IActionResult XoaSanPham(string maSanPham)
        {
            TempData["Message"] = "";

            var CTGH = db.ChiTietGioHangs.Where(x => x.MaSanPham == maSanPham).ToList();
            if (CTGH.Any()) db.RemoveRange(CTGH);
            var CTHDB = db.ChiTietHoaDonBans.Where(x => x.MaSanPham == maSanPham).ToList();
            if (CTHDB.Any()) db.RemoveRange(CTHDB);

            var anhSanPhams = db.AnhSanPhams.Where(x => x.MaSanPham == maSanPham);
            if (anhSanPhams.Any()) db.RemoveRange(anhSanPhams);

            db.Remove(db.SanPhams.Find(maSanPham));
            db.SaveChanges();
            TempData["Message"] = "San pham da duoc xoa";
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        }
    }
}
