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
                var sanPham = db.SanPhams.SingleOrDefault(x => x.MaSanPham == maSp);
                var anhSanPham = db.AnhSanPhams.Where(x => x.MaSanPham == maSp).ToList();
                var mauSanPham = db.MauSacs.Where(x => x.MaSanPham == maSp).ToList();
                var romSanPham = db.Roms.Where(x => x.MaSanPham == maSp).ToList();
            
                // Lấy màu đầu tiên
                var firstColor = mauSanPham.FirstOrDefault()?.MaMau;
                // Lấy ảnh của màu đầu tiên
                var firstColorImages = anhSanPham.Where(x => x.MaMau == firstColor).ToList();
            
                var detailView = new ProductDetailViewModel
                {
                    dmSp = sanPham,
                    dmAnhSp = firstColorImages, // Chỉ truyền ảnh của màu đầu tiên
                    dmMauSp = mauSanPham,
                    dmRomSp = romSanPham,
                    SelectedColor = firstColor // Thêm thuộc tính này vào ViewModel
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
        }
    }
