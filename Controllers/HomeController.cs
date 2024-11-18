using BTLW_BDT.Models;
using BTLW_BDT.Models.Cart;
using Azure;
using BTLW_BDT.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using X.PagedList;

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

        private int GetCartCount(string userId)
        {
            if (string.IsNullOrEmpty(userId)) return 0;

            var gioHang = db.GioHangs.FirstOrDefault(g => g.TenDangNhap == userId);
            if (gioHang == null) return 0;

            return db.ChiTietGioHangs
                .Where(c => c.MaGioHang == gioHang.MaGioHang)
                .Sum(c => c.SoLuong) ?? 0; // Thêm ?? 0 để xử lý trường hợp null
        }

        public IActionResult Index()
        {
            string userId = HttpContext.Session.GetString("Username");
            ViewBag.CartCount = GetCartCount(userId);
            var lstSanPham = db.SanPhams.ToList();
            return View(lstSanPham);
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
        //public IActionResult ProductDetail(string maSp, string? maMau = null, string? maRom = null)
        //{
        //    var sanPham = db.SanPhams.SingleOrDefault(x => x.MaSanPham == maSp) ?? new SanPham();
        //    var anhSanPham = db.AnhSanPhams.Where(x => x.MaSanPham == maSp).ToList();
        //    var mauSanPham = db.MauSacs.Where(x => x.MaSanPham == maSp).ToList();
        //    var romSanPham = db.Roms.Where(x => x.MaSanPham == maSp)
        //                .OrderBy(x => x.Gia)  // Sắp xếp theo giá tăng dần
        //                .ToList();

        //    // Lấy màu đầu tiên
        //    var firstColor = mauSanPham.FirstOrDefault()?.MaMau;
        //    var firstColorImages = anhSanPham.Where(x => x.MaMau == firstColor).ToList();

        //    // Lấy ROM nhỏ nhất (rẻ nhất)
        //    var smallestRom = romSanPham.FirstOrDefault();

        //    // Lấy danh sách đánh giá
        //    var reviews = db.DanhGia.Where(r => r.MaHoaDon == maSp).ToList();

        //    var detailView = new ProductDetailViewModel
        //    {
        //        dmSp = sanPham,
        //        dmAnhSp = firstColorImages,
        //        dmMauSp = mauSanPham,
        //        dmRomSp = romSanPham,
        //        SelectedColor = firstColor,
        //        SelectedRom = smallestRom?.MaRom,
        //        CurrentPrice = sanPham.DonGiaBanRa, // Giá ban đầu với ROM nhỏ nhất
        //        Reviews = reviews
        //    };
        //    return View(detailView);
        //}
        public IActionResult ProductDetail(string maSp, string? maMau = null, string? maRom = null)
        {
            var sanPham = db.SanPhams.SingleOrDefault(x => x.MaSanPham == maSp) ?? new SanPham();
            var anhSanPham = db.AnhSanPhams.Where(x => x.MaSanPham == maSp).ToList();
            var mauSanPham = db.MauSacs.Where(x => x.MaSanPham == maSp).ToList();
            var romSanPham = db.Roms.Where(x => x.MaSanPham == maSp)
                        .OrderBy(x => x.Gia)
                        .ToList();

            // Sử dụng màu được chọn từ giỏ hàng nếu có, nếu không thì lấy màu đầu tiên
            var selectedColor = !string.IsNullOrEmpty(maMau)
                ? maMau
                : mauSanPham.FirstOrDefault()?.MaMau;

            // Lấy ảnh theo màu được chọn
            var selectedColorImages = anhSanPham.Where(x => x.MaMau == selectedColor).ToList();

            // Sử dụng ROM được chọn từ giỏ hàng nếu có, nếu không thì lấy ROM đầu tiên
            var selectedRom = !string.IsNullOrEmpty(maRom)
                ? romSanPham.FirstOrDefault(r => r.MaRom == maRom)
                : romSanPham.FirstOrDefault();

            // Tính giá dựa trên ROM được chọn
            var baseRom = romSanPham.FirstOrDefault();
            decimal? currentPrice = null;
            if (selectedRom != null && baseRom != null)
            {
                currentPrice = sanPham.DonGiaBanRa + (selectedRom.Gia - baseRom.Gia);
            }

            var reviews = db.DanhGia.Where(r => r.MaHoaDon == maSp).ToList();

            var detailView = new ProductDetailViewModel
            {
                dmSp = sanPham,
                dmAnhSp = selectedColorImages,  // Sử dụng ảnh của màu được chọn
                dmMauSp = mauSanPham,
                dmRomSp = romSanPham,
                SelectedColor = selectedColor,  // Đặt màu được chọn
                SelectedRom = selectedRom?.MaRom,  // Đặt ROM được chọn
                CurrentPrice = currentPrice ?? sanPham.DonGiaBanRa,
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
        }
    }
