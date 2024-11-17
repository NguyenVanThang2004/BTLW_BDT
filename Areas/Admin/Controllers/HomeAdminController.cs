using Azure;
using BTLW_BDT.Models;
using BTLW_BDT.Models.BieuDo;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Threading.Tasks.Dataflow;
using X.PagedList;
using X.PagedList.Extensions;

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
        public IActionResult DanhMucSanPham(string searchQuery, int? page)
        {
            int pageSize = 15;
            int pageNumber = page ?? 1;

            // Store searchQuery in ViewData to retain it in the view
            ViewData["searchQuery"] = searchQuery;

            // Initialize the product list and apply filters based on the searchQuery
#pragma warning disable CS8602 // Dereference of a possibly null reference.
            var lstSanPham = db.SanPhams.AsNoTracking()
                .Where(x => string.IsNullOrEmpty(searchQuery)
                            || x.MaSanPham.Contains(searchQuery)
                            || x.TenSanPham.Contains(searchQuery)
                            || x.AnhDaiDien.Contains(searchQuery)
                            || x.ThoiGianBaoHanh.ToString().Contains(searchQuery)
                            || x.SoLuongTonKho.ToString().Contains(searchQuery)
                            || x.DonGiaBanGoc.ToString().Contains(searchQuery)
                            || x.DonGiaBanRa.ToString().Contains(searchQuery)
                            || x.KhuyenMai.ToString().Contains(searchQuery)
                            || x.DanhBa.Contains(searchQuery)
                            || x.DenFlash.Contains(searchQuery)
                            || x.CongNgheManHinh.Contains(searchQuery)
                            || x.DoSangToiDa.ToString().Contains(searchQuery)
                            || x.LoaiPin.Contains(searchQuery)
                            || x.BaoMatNangCao.Contains(searchQuery)
                            || x.GhiAmMacDinh.Contains(searchQuery)
                            || x.JackTaiNghe.Contains(searchQuery)
                            || x.MangDiDong.Contains(searchQuery)
                            || x.Sim.Contains(searchQuery)
                            || x.MaHang.Contains(searchQuery) // Assuming MaHang is a string
                            || x.ManHinh.Contains(searchQuery)
                            || x.Pin.Contains(searchQuery)
                            || x.Camera.Contains(searchQuery)
                            || x.KichThuoc.Contains(searchQuery)
                            || x.Chip.Contains(searchQuery)
                            || x.Ram.Contains(searchQuery))
                .OrderBy(x => x.TenSanPham);
#pragma warning restore CS8602 // Dereference of a possibly null reference.

            PagedList<SanPham> lst = new PagedList<SanPham>(lstSanPham, pageNumber, pageSize);

            // Load the list of brands for the dropdown
            ViewBag.MaHang = new SelectList(db.Hangs.ToList(), "MaHang", "TenHang");

            return View(lst);
        }

        //[Route("ThemSanPhamMoi")]
        //[HttpGet]
        //public IActionResult ThemSanPhamMoi()
        //{
        //    ViewBag.MaHang = new SelectList(db.Hangs.ToList(), "MaHang", "TenHang");
        //    return View();
        //}
        //[Route("ThemSanPhamMoi")]
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public IActionResult ThemSanPhamMoi(SanPham sanPham)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.SanPhams.Add(sanPham);
        //        db.SaveChanges();
        //        return RedirectToAction("DanhMucSanPham");
        //    }
        //    return View(sanPham);
        //}
        //[Route("SuaSanPham")]
        //[HttpGet]
        //public IActionResult SuaSanPham(string maSanPham)
        //{

        //    ViewBag.MaHang = new SelectList(db.Hangs.ToList(), "MaHang", "TenHang");
        //    var sanPham = db.SanPhams.Find(maSanPham);
        //    return View(sanPham);
        //}
        //[Route("SuaSanPham")]
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public IActionResult SuaSanPham(SanPham sanPham)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(sanPham).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("DanhMucSanPham");
        //    }
        //    return View(sanPham);
        //}
        [Route("DashBoard")]
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

        [HttpPost]
        public Task<IActionResult> GetChartData()
        {
            var data = (from hdb in db.HoaDonBans
                        join cthdb in db.ChiTietHoaDonBans on hdb.MaHoaDon equals cthdb.MaHoaDon
                        join sp in db.SanPhams on cthdb.MaSanPham equals sp.MaSanPham
                        join ctgh in db.ChiTietGioHangs on sp.MaSanPham equals ctgh.MaSanPham
                        join gh in db.GioHangs on ctgh.MaGioHang equals gh.MaGioHang
                        select new BieuDo
                        {
                            NgayBan = hdb.ThoiGianLap,
                            SoLuongBan = cthdb.SoLuongBan,
                            TongTien = hdb.TongTien,
                            LoiNhuan = cthdb.DonGiaCuoi
                        }).Select(x => new
                        {
                            date = x.NgayBan.ToString("yyyy-MM-dd"),
                            sold = x.SoLuongBan,
                            quantity = x.TongTien,
                            profit = x.LoiNhuan
                        }).ToList();
            Console.WriteLine(JsonConvert.SerializeObject(data));
            return Task.FromResult<IActionResult>(Json(data));

        }
        [HttpPost]
        [Route("GetChartDataBySelect")]
        public Task<IActionResult> GetChartDataBySelect(DateTime startDate, DateTime endDate)
        {
            var data = (from hdb in db.HoaDonBans
                        join cthdb in db.ChiTietHoaDonBans on hdb.MaHoaDon equals cthdb.MaHoaDon
                        join sp in db.SanPhams on cthdb.MaSanPham equals sp.MaSanPham
                        join ctgh in db.ChiTietGioHangs on sp.MaSanPham equals ctgh.MaSanPham
                        join gh in db.GioHangs on ctgh.MaGioHang equals gh.MaGioHang
                        select new BieuDo
                        {
                            NgayBan = hdb.ThoiGianLap,
                            SoLuongBan = cthdb.SoLuongBan,
                            TongTien = hdb.TongTien,
                            LoiNhuan = cthdb.DonGiaCuoi
                        }).Where(x => x.NgayBan >= startDate && x.NgayBan <= endDate).
                        Select(x => new
                        {
                            date = x.NgayBan.ToString("yyyy-MM-dd"),
                            sold = x.SoLuongBan,
                            quantity = x.TongTien,
                            profit = x.LoiNhuan
                        }).ToList();
            Console.WriteLine(JsonConvert.SerializeObject(data));
            return Task.FromResult<IActionResult>(Json(data));

        }
        //[Route("XoaSanPham")]
        //[HttpGet]
        //public IActionResult XoaSanPham(string maSanPham)
        //{
        //    TempData["Message"] = "";

        //    var CTGH = db.ChiTietGioHangs.Where(x => x.MaSanPham == maSanPham).ToList();
        //    if (CTGH.Any()) db.RemoveRange(CTGH);
        //    var CTHDB = db.ChiTietHoaDonBans.Where(x => x.MaSanPham == maSanPham).ToList();
        //    if (CTHDB.Any()) db.RemoveRange(CTHDB);

        //    var anhSanPhams = db.AnhSanPhams.Where(x => x.MaSanPham == maSanPham);
        //    if (anhSanPhams.Any()) db.RemoveRange(anhSanPhams);

        //    var rom = db.Roms.Where(x => x.MaSanPham == maSanPham);
        //    if (rom.Any()) db.RemoveRange(rom);

        //    var mausac = db.MauSacs.Where(x => x.MaSanPham == maSanPham);
        //    if (mausac.Any()) db.RemoveRange(mausac);
        //    db.Remove(db.SanPhams.Find(maSanPham));
        //    db.SaveChanges();
        //    TempData["Message"] = "San pham da duoc xoa";
        //    return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        //}

        [Route("QuanLyHoaDon")]
        public IActionResult QuanLyHoaDon(string searchQuery, int? page)
        {
            int pageSize = 15;
            int pageNumber = page ?? 1;

            // Truyền giá trị searchQuery vào ViewData để sử dụng trong view
            ViewData["searchQuery"] = searchQuery;

            DateTime? searchDate = null;
            if (DateTime.TryParse(searchQuery, out DateTime parsedDate))
            {
                searchDate = parsedDate.Date; // Lấy chỉ phần ngày, bỏ giờ phút giây
            }

#pragma warning disable CS8602 // Dereference of a possibly null reference.
            var lstSanPham = from hdb in db.HoaDonBans
                             join kh in db.KhachHangs on hdb.MaKhachHang equals kh.MaKhachHang
                             where string.IsNullOrEmpty(searchQuery)
                                   || hdb.MaHoaDon.Contains(searchQuery)  // Tìm theo Mã Hóa Đơn
                                   || kh.TenKhachHang.Contains(searchQuery)  // Tìm theo Tên Khách Hàng
                                   || hdb.PhuongThucThanhToan.Contains(searchQuery)  // Tìm theo Phương thức thanh toán
                                   || hdb.KhuyenMai.ToString().Contains(searchQuery)  // Tìm theo Khuyến Mại
                                   || hdb.TongTien.ToString().Contains(searchQuery)  // Tìm theo Tổng Tiền
                                   || (searchDate.HasValue && hdb.ThoiGianLap.Date == searchDate.Value)
                                   || db.ChiTietHoaDonBans.Where(cthdb => cthdb.MaHoaDon == hdb.MaHoaDon).Any(cthdb => cthdb.MaSanPham.Contains(searchQuery)) // Tìm theo Mã sản phẩm
                                   || kh.SoDienThoai.Contains(searchQuery)
                                   || kh.DiaChi.Contains(searchQuery)
                                   || hdb.MaNhanVien.Contains(searchQuery)
                             select new
                             {
                                 MaHDB = hdb.MaHoaDon,
                                 PTTT = hdb.PhuongThucThanhToan,
                                 TT = hdb.TongTien,
                                 KM = hdb.KhuyenMai,
                                 Time = hdb.ThoiGianLap,
                                 MaNV = hdb.MaNhanVien,
                                 TenKH = kh.TenKhachHang,
                                 SDT = kh.SoDienThoai,
                                 DC = kh.DiaChi,
                                 ProductDetails = db.ChiTietHoaDonBans
                                                    .Where(cthdb => cthdb.MaHoaDon == hdb.MaHoaDon)
                                                    .Select(cthdb => new
                                                    {
                                                        SL = cthdb.SoLuongBan,
                                                        MaSp = cthdb.MaSanPham
                                                    }).ToList()
                             };
#pragma warning restore CS8602 // Dereference of a possibly null reference.

            var pagedList = lstSanPham.ToPagedList(pageNumber, pageSize);
            return View(pagedList);
        }



        //public IActionResult QuanLyHoaDon(int? page)
        //{
        //    int pageSize = 15;
        //    int pageNumber = page == null || page < 0 ? 1 : page.Value;

        //    var lstSanPham = from hdb in db.HoaDonBans
        //                     join kh in db.KhachHangs on hdb.MaKhachHang equals kh.MaKhachHang
        //                     select new
        //                     {
        //                         MaHDB = hdb.MaHoaDon,
        //                         PTTT = hdb.PhuongThucThanhToan,
        //                         TT = hdb.TongTien,
        //                         KM = hdb.KhuyenMai,
        //                         Time = hdb.ThoiGianLap,
        //                         MaNV = hdb.MaNhanVien,
        //                         TenKH = kh.TenKhachHang,
        //                         SDT = kh.SoDienThoai,
        //                         DC = kh.DiaChi,
        //                         ProductDetails = db.ChiTietHoaDonBans
        //                                            .Where(cthdb => cthdb.MaHoaDon == hdb.MaHoaDon)
        //                                            .Select(cthdb => new
        //                                            {
        //                                                SL = cthdb.SoLuongBan,
        //                                                MaSp = cthdb.MaSanPham
        //                                            }).ToList()
        //                     };

        //    var pagedList = lstSanPham.ToPagedList(pageNumber, pageSize);
        //    return View(pagedList);
        //}

        [Route("Chat")]
        public async Task<IActionResult> Chat()
        {
            var customers = await db.KhachHangs
                .Include(k => k.TenDangNhapNavigation) // Include thông tin TaiKhoan
                .Include(k => k.TinNhans) // Include tin nhắn
                .Select(k => new KhachHang
                {
                    MaKhachHang = k.MaKhachHang,
                    TenKhachHang = k.TenKhachHang,
                    AnhDaiDien = k.AnhDaiDien,
                    TenDangNhapNavigation = k.TenDangNhapNavigation, // Map thông tin TaiKhoan
                    LastMessage = k.TinNhans
                        .OrderByDescending(t => t.ThoiGian)
                        .FirstOrDefault()
                })
                .ToListAsync();

            return View(customers);
        }

        [Route("Profile")]
        public async Task<IActionResult> Profile()
        {
            var username = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(username))
            {
                return RedirectToAction("Login", "Access", new { area = "" });
            }

            var nhanVien = await db.NhanViens
                .Include(nv => nv.TenDangNhapNavigation)
                .FirstOrDefaultAsync(nv => nv.TenDangNhap == username);

            return View(nhanVien);
        }

    }
}
