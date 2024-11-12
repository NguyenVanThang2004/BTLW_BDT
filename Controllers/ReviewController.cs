using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using BTLW_BDT.Models;
using BTLW_BDT.Repository.Interface;
using BTLW_BDT.ViewModels;

namespace BTLW_BDT.Controllers
{
    public class ReviewController : Controller
    {
        private readonly IReviewService _reviewService;
        
        public ReviewController(IReviewService reviewService)
        {
            _reviewService = reviewService ?? throw new ArgumentNullException(nameof(reviewService));
        }

        [HttpGet]
        public IActionResult GetReviewForm(string productId)
        {
            var username = HttpContext.Session.GetString("Username");
            
            if (string.IsNullOrEmpty(username))
            {
                return PartialView("_LoginRequired");
            }

            if (string.IsNullOrEmpty(productId))
            {
                return BadRequest("Product ID is required");
            }

            var model = _reviewService.GetReviewViewModel(productId, username);
            return PartialView("_ReviewFormPartial", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SaveReview(ReviewViewModel model, string action)
        {
            if (HttpContext.Session.GetString("Username") == null)
            {
                return Json(new { success = false, message = "User not logged in" });
            }

            if (model == null)
            {
                return BadRequest("Model is required");
            }

            if (!ModelState.IsValid)
            {
                return PartialView("_ReviewFormPartial", model);
            }

            try
            {
                var username = HttpContext.Session.GetString("Username");
                model.IsEdit = (action == "update");
                _reviewService.SaveReview(model, username);
                return Json(new { success = true, redirectUrl = Url.Action("Detail", "Product", new { id = model.MaSanPham }) });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(string productId)
        {
            if (HttpContext.Session.GetString("Username") == null)
            {
                return Json(new { success = false, message = "User not logged in" });
            }

            if (string.IsNullOrEmpty(productId))
            {
                return BadRequest("Product ID is required");
            }

            try
            {
                var username = HttpContext.Session.GetString("Username");
                _reviewService.DeleteReview(productId, username);
                return Json(new { success = true, redirectUrl = Url.Action("Detail", "Product", new { id = productId }) });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
    }
}
