using BTLW_BDT.Models;
using BTLW_BDT.Models.Cart;
using Azure;
using BTLW_BDT.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using X.PagedList;
using Microsoft.Data.SqlClient;
using Dapper;
using Microsoft.Extensions.Caching.Memory;

namespace BTLW_BDT.Controllers
{
    public class HomeController : Controller
    {
        BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();

        private readonly ILogger<HomeController> _logger;
        private readonly IConfiguration _configuration;
        private readonly IMemoryCache _cache;
        private readonly string _connectionString;

        public HomeController(ILogger<HomeController> logger, IConfiguration configuration, IMemoryCache cache)
        {
            _logger = logger;
            _configuration = configuration;
            _cache = cache;
            _connectionString = _configuration.GetConnectionString("DefaultConnection");
        }

        public int CartCount()

        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang") ?? new List<CartItem>();
            return cart.Count;
        }
        public IActionResult Index(int? page)
        {
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            ViewBag.CartCount = CartCount();  // Truyền số lượng sản phẩm vào ViewBag

            // Lấy danh sách sản phẩm bán chạy
            var sanPhamBanChay = GetSanPhamBanChay();
            ViewBag.SanPhamBanChay = sanPhamBanChay;

            return View();
        }

        public IActionResult SanPhamTheoHang(string mahang, int ? page)
        {
            int pageSize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.SanPhams.AsNoTracking().Where(x => x.MaHang == mahang).OrderBy(x => x.TenSanPham).ToList();

            PagedList<SanPham> lst = new PagedList<SanPham>(lstsanpham, pageNumber, pageSize);
            ViewBag.mahang = mahang;
            return View(lst);
        }

        public IActionResult Shop(int? page)
        {
            int pageSize = 9;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.SanPhams.AsNoTracking().OrderBy(x => x.TenSanPham);
            PagedList<SanPham> lst = new PagedList<SanPham>
                (lstsanpham, pageNumber, pageSize);
            return View(lst);
        }
        public IActionResult ProductDetail(string maSp)
        {
            var sanPham = db.SanPhams.SingleOrDefault(x => x.MaSanPham == maSp) ?? new SanPham();
            var anhSanPham = db.AnhSanPhams.Where(x => x.MaSanPham == maSp).ToList();
            var mauSanPham = db.MauSacs.Where(x => x.MaSanPham == maSp).ToList();
            var romSanPham = db.Roms.Where(x => x.MaSanPham == maSp)
                        .OrderBy(x => x.Gia)  // Sắp xếp theo giá tăng dần
                        .ToList();
        
            // Lấy màu đầu tiên
            var firstColor = mauSanPham.FirstOrDefault()?.MaMau;
            var firstColorImages = anhSanPham.Where(x => x.MaMau == firstColor).ToList();
        
            // Lấy ROM nhỏ nhất (rẻ nhất)
            var smallestRom = romSanPham.FirstOrDefault();
        
            // Lấy danh sách đánh giá
            var reviews = db.DanhGia.Where(r => r.MaSanPham == maSp).ToList();

            var detailView = new ProductDetailViewModel
            {
                dmSp = sanPham,
                dmAnhSp = firstColorImages,
                dmMauSp = mauSanPham,
                dmRomSp = romSanPham,
                SelectedColor = firstColor,
                SelectedRom = smallestRom?.MaRom,
                CurrentPrice = sanPham.DonGiaBanRa, // Giá ban đầu với ROM nhỏ nhất
                Reviews = reviews
            };
            return View(detailView);
        }
        public IActionResult GetColorImages(string maSp, string maMau)
        {
            var anhSanPham = db.AnhSanPhams.Where(x => x.MaSanPham == maSp && x.MaMau == maMau).ToList();
            return PartialView("_ColorImagesPartial", anhSanPham);
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

        [HttpGet]
        public IActionResult GetRomPrice(string maSp, string maRom)
        {
            var sanPham = db.SanPhams.SingleOrDefault(x => x.MaSanPham == maSp);
            var romList = db.Roms.Where(x => x.MaSanPham == maSp)
                    .OrderBy(x => x.Gia)
                    .ToList();
        
            var selectedRom = romList.FirstOrDefault(x => x.MaRom == maRom);
            var baseRom = romList.FirstOrDefault(); // ROM nhỏ nhất
        
            if (selectedRom == null || baseRom == null || sanPham == null)
                return Json(new { success = false });
            
            // Tính giá mới = Giá cơ bản + (Giá ROM đã chọn - Giá ROM nhỏ nhất)
            var newPrice = sanPham.DonGiaBanRa + (selectedRom.Gia - baseRom.Gia);
        
            string formattedPrice;

            if (newPrice.HasValue)
            {
                formattedPrice = newPrice.Value.ToString("#,##0") + " VNĐ";
            }
            else
            {
                formattedPrice = "Giá không khả dụng";
            }
        
            // Sử dụng formattedPrice ở đây
            return Json(new { 
                success = true, 
                price = newPrice,
                formattedPrice = formattedPrice
            });
        }
        public IActionResult Contact()
        {
            // Kiểm tra xem người dùng đã đăng nhập chưa
            var username = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(username))
            {
                return RedirectToAction("Login", "Access");
            }
            
            return View();
        }

        private List<SanPhamBanChayViewModel> GetSanPhamBanChay()
        {
            const string cacheKey = "SanPhamBanChay";

#pragma warning disable CS8603 // Possible null reference return.
            return _cache.GetOrCreate(cacheKey, entry =>
            {
                entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromHours(1);
                
                // Kiểm tra xem có dữ liệu bán hàng không
                var hasOrders = db.ChiTietHoaDonBans.Any();
                
                // Thêm log để kiểm tra
                System.Diagnostics.Debug.WriteLine($"Has orders: {hasOrders}");

                if (hasOrders)
                {
                    var query = from sp in db.SanPhams
                               join ct in db.ChiTietHoaDonBans on sp.MaSanPham equals ct.MaSanPham
                               where ct.SoLuongBan > 0 && ct.DonGiaCuoi > 0
                               group new { sp, ct } by new 
                               { 
                                   sp.MaSanPham,
                                   sp.TenSanPham,
                                   sp.DonGiaBanGoc,
                                   sp.DonGiaBanRa,
                                   sp.KhuyenMai,
                                   sp.AnhDaiDien
                               } into g
                               select new SanPhamBanChayViewModel
                               {
                                   MaSanPham = g.Key.MaSanPham,
                                   TenSanPham = g.Key.TenSanPham,
                                   DonGiaBanGoc = g.Key.DonGiaBanGoc,
                                   DonGiaBanRa = g.Key.DonGiaBanRa,
                                   KhuyenMai = g.Key.KhuyenMai,
                                   AnhDaiDien = g.Key.AnhDaiDien,
                                   TongSoLuongBan = g.Sum(x => x.ct.SoLuongBan ?? 0),
                                   DoanhThu = g.Sum(x => (x.ct.SoLuongBan ?? 0) * (x.ct.DonGiaCuoi ?? 0))
                               };

                    var result = query.OrderByDescending(x => x.TongSoLuongBan)
                                   .ThenByDescending(x => x.DoanhThu)
                                   .Take(8)
                                   .ToList();

                    if (result.Any())
                    {
                        System.Diagnostics.Debug.WriteLine("Returning best-selling products");
                        result.ForEach(p => System.Diagnostics.Debug.WriteLine($"Product: {p.TenSanPham}, Sales: {p.TongSoLuongBan}"));
                        return result;
                    }
                }

                System.Diagnostics.Debug.WriteLine("Returning newest products by price");
                var newestProducts = db.SanPhams
                        .OrderByDescending(x => x.DonGiaBanRa)
                        .Take(8)
                        .Select(sp => new SanPhamBanChayViewModel
                        {
                            MaSanPham = sp.MaSanPham,
                            TenSanPham = sp.TenSanPham,
                            DonGiaBanGoc = sp.DonGiaBanGoc,
                            DonGiaBanRa = sp.DonGiaBanRa,
                            KhuyenMai = sp.KhuyenMai,
                            AnhDaiDien = sp.AnhDaiDien,
                            TongSoLuongBan = 0,
                            DoanhThu = 0
                        })
                        .ToList();

                newestProducts.ForEach(p => System.Diagnostics.Debug.WriteLine($"Product: {p.TenSanPham}, Price: {p.DonGiaBanRa}"));
                return newestProducts;
            });
#pragma warning restore CS8603 // Possible null reference return.
        }
    }
}
