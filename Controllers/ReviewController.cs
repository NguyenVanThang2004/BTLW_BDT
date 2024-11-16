using BTLW_BDT.Models;
using BTLW_BDT.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace BTLW_BDT.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewController : Controller
    {
        private readonly BtlLtwQlbdtContext _context;

        public ReviewController(BtlLtwQlbdtContext context)
        {
            _context = context;
        }

        [HttpGet("productreview/{productId}")]
        public IActionResult ProductReview(string productId)
        {
            var username = HttpContext.Session.GetString("Username");
            var reviews = from r in _context.DanhGia
                         join kh in _context.KhachHangs on r.TenDangNhap equals kh.TenDangNhap
                         where r.MaSanPham == productId
                         orderby r.ThoiGianDanhGia descending
                         select new Models.ReviewViewModel
                         {
                             TenDangNhap = r.TenDangNhap,
                             MaSanPham = r.MaSanPham,
                             Rate = (int)r.Rate,
                             NoiDung = r.NoiDung,
                             ThoiGianDanhGia = r.ThoiGianDanhGia,
                             IsCurrentUser = r.TenDangNhap == username
                         };

            var product = _context.SanPhams.FirstOrDefault(p => p.MaSanPham == productId);

            return Json(new { reviews, dmSp = product });
        }

        [HttpGet("CreateReview/{productId}")]
        public IActionResult CreateReview(string productId)
        {
            var username = HttpContext.Session.GetString("Username");
            var existingReview = _context.DanhGia
                .FirstOrDefault(r => r.TenDangNhap == username && r.MaSanPham == productId);

            return PartialView("_ReviewForm", new ReviewFormViewModel 
            { 
                MaSanPham = productId,
                ExistingReview = existingReview
            });
        }

        [HttpPost("submitreview")]
        public IActionResult SubmitReview([FromBody] Models.ReviewCreateModel model)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var username = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(username))
                return Json(new { success = false, message = "Vui lòng đăng nhập để đánh giá" });

            var review = new DanhGium
            {
                TenDangNhap = username,
                MaSanPham = model.MaSanPham,
                Rate = model.Rate,
                NoiDung = model.NoiDung,
                ThoiGianDanhGia = DateTime.Now
            };

            _context.DanhGia.Add(review);
            _context.SaveChanges();

            return Json(new { success = true });
        }

        [HttpPost("updatereview")]
        public IActionResult UpdateReview([FromBody] Models.ReviewUpdateModel model)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var username = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(username))
                return Json(new { success = false, message = "Vui lòng đăng nhập để đánh giá" });

            var existingReview = _context.DanhGia
                .FirstOrDefault(r => r.TenDangNhap == username && r.MaSanPham == model.MaSanPham);

            if (existingReview == null)
                return Json(new { success = false, message = "Không tìm thấy đánh giá" });

            existingReview.Rate = model.Rate;
            existingReview.NoiDung = model.NoiDung;
            existingReview.ThoiGianDanhGia = DateTime.Now;

            _context.SaveChanges();
            return Json(new { success = true });
        }

        [HttpPost("deletereview/{productId}")]
        public IActionResult DeleteReview(string productId)
        {
            var username = HttpContext.Session.GetString("Username");
            if (string.IsNullOrEmpty(username))
                return Json(new { success = false, message = "Vui lòng đăng nhập để xóa đánh giá" });

            var review = _context.DanhGia
                .FirstOrDefault(r => r.TenDangNhap == username && r.MaSanPham == productId);

            if (review == null)
                return Json(new { success = false, message = "Không tìm thấy đánh giá" });

            _context.DanhGia.Remove(review);
            _context.SaveChanges();
            return Json(new { success = true });
        }
    }
}
