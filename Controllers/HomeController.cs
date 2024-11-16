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
                return View();
            }
        }
    }
