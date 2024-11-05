
using BTLW_BDT.Models;
using BTLW_BDT.Models.BieuDo;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks.Dataflow;
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
            ViewBag.MaHang = new SelectList(db.Hangs.ToList(), "MaHang", "TenHang");
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

            ViewBag.MaHang = new SelectList(db.Hangs.ToList(), "MaHang", "TenHang");
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
        //[Route("DashBoard")]
        
        //public IActionResult DashBoard()
        //{
        //    var count_product = db.SanPhams.Count();
        //    var count_CTHDB = db.ChiTietHoaDonBans.Count();
        //    var count_CTGH= db.ChiTietGioHangs.Count();
        //    ViewBag.CountProduct = count_product;
        //    ViewBag.CountCTHDB=count_CTHDB;
        //    ViewBag.CountCTGH=count_CTGH;
        //    return View();
        //}
        [HttpPost("GetChartData")]
        public async Task<IActionResult> GetChartData()
        {
            var data = await (from hdb in db.HoaDonBans join cthdb in db.ChiTietHoaDonBans on hdb.MaHoaDon equals cthdb.MaHoaDon
                                                 join sp in db.SanPhams on cthdb.MaSanPham equals sp.MaSanPham
                                                 join ctgh in db.ChiTietGioHangs on sp.MaSanPham equals ctgh.MaSanPham
                                                 join gh in db.GioHangs on ctgh.MaGioHang equals gh.MaGioHang
                       select new BieuDo
                       {
                           
                           NgayBan=hdb.ThoiGianLap,
                           SoLuongBan=cthdb.SoLuongBan,
                           TongTien = hdb.TongTien,
                           LoiNhuan=cthdb.DonGiaCuoi
                       }).ToListAsync();
            return Json(data);

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

            var rom = db.Roms.Where(x => x.MaSanPham == maSanPham);
            if (rom.Any()) db.RemoveRange(rom);

            var mausac = db.MauSacs.Where(x => x.MaSanPham == maSanPham);
            if (mausac.Any()) db.RemoveRange(mausac);
            db.Remove(db.SanPhams.Find(maSanPham));
            db.SaveChanges();
            TempData["Message"] = "San pham da duoc xoa";
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        }
    }
}
