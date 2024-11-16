using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Security.Claims;
using BTLW_BDT.Models;
using BTLW_BDT.ViewModels;

namespace BTLW_BDT.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewController : Controller
    {
        BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();

        [HttpGet("CreateReview")]
        public IActionResult CreateReview(string productId)
        {
            if (!User.Identity?.IsAuthenticated ?? false)
            {
                TempData["Message"] = "Bạn cần đăng nhập để đánh giá sản phẩm.";
                return RedirectToAction("Login", "Account");
            }

            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (userId == null)
            {
                TempData["Message"] = "Không thể xác định người dùng.";
                return RedirectToAction("Login", "Account");
            }

            var hasPurchased = db.HoaDonBans.Any(h => h.MaKhachHang == userId && h.ChiTietHoaDonBans.Any(c => c.MaSanPham == productId));

            if (!hasPurchased)
            {
                TempData["Message"] = "Bạn chưa mua sản phẩm này.";
                return RedirectToAction("ProductDetail", "Product", new { id = productId });
            }

            return View();
        }

        [HttpPost("SaveReview")]
        public IActionResult SaveReview(string productId, string content, int rate)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (userId == null)
            {
                TempData["Message"] = "Không thể xác định người dùng.";
                return RedirectToAction("Login", "Account");
            }

            var order = (from cthdb in db.ChiTietHoaDonBans
                         join hdb in db.HoaDonBans on cthdb.MaSanPham equals hdb.MaHoaDon
                         where cthdb.MaSanPham == productId && hdb.MaKhachHang == userId
                         select cthdb.MaSanPham)
                        .FirstOrDefault();

            if (order == null)
            {
                TempData["Message"] = "Không tìm thấy hóa đơn cho sản phẩm này.";
                return RedirectToAction("ProductDetail", "Product", new { id = productId });
            }

            var review = new DanhGium
            {
                NoiDung = content,
                Rate = rate,
                TenDangNhap = userId,
                MaSanPham = order
            };

            db.DanhGia.Add(review);
            db.SaveChanges();

            return RedirectToAction("ProductDetail", "Product", new { id = productId });
        }

        [HttpPost("EditReview")]
        public IActionResult EditReview(int reviewId, string newContent, int newRate)
        {
            var review = db.DanhGia.Find(reviewId);
            if (review != null)
            {
                review.NoiDung = newContent;
                review.Rate = newRate;
                db.SaveChanges();
                return RedirectToAction("ProductDetail", "Product", new { id = review.MaSanPham });
            }
            
            TempData["Message"] = "Không tìm thấy đánh giá.";
            return RedirectToAction("ProductDetail", "Product");
        }

        [HttpPost("DeleteReview")]
        public IActionResult DeleteReview(int reviewId)
        {
            var review = db.DanhGia.Find(reviewId);
            if (review != null)
            {
                var productId = review.MaSanPham;
                if (productId != null)
                {
                    db.DanhGia.Remove(review);
                    db.SaveChanges();
                    return RedirectToAction("ProductDetail", "Product", new { id = productId });
                }
            }
            TempData["Message"] = "Không tìm thấy đánh giá hoặc sản phẩm.";
            return RedirectToAction("ProductDetail", "Product");
        }

        [HttpGet("ProductReview")]
        public IActionResult ProductReview(string productId)
        {
            var reviews = (from dg in db.DanhGia
                           join cthdb in db.ChiTietHoaDonBans on dg.MaSanPham equals cthdb.MaSanPham    
                           where cthdb.MaSanPham == productId
                           select dg).ToList();

            var products = db.SanPhams.Where(p => p.MaSanPham == productId).ToList();

            if (!products.Any())
            {
                return NotFound(new { message = "Sản phẩm không tồn tại." });
            }

            var viewModel = new ProductDetailViewModel
            {
                dmSp = products.FirstOrDefault() ?? new SanPham(),
                Reviews = reviews
            };

            return Ok(viewModel); // Trả về JSON
        }

        [HttpGet("AllReviews")]
        public IActionResult AllReviews()
        {
            var reviews = db.DanhGia.ToList();

            if (!reviews.Any())
            {
                return NotFound(new { message = "Không có đánh giá nào." });
            }

            return Ok(reviews); // Trả về JSON
        }
    }
}
