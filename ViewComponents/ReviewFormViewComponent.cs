using Microsoft.AspNetCore.Mvc;
using BTLW_BDT.Repository;
using BTLW_BDT.Repository.Interface;

namespace YourProject.ViewComponents
{
    public class ReviewFormViewComponent : ViewComponent
    {
        private readonly IReviewService _reviewService;

        public ReviewFormViewComponent(IReviewService reviewService)
        {
            _reviewService = reviewService;
        }

        public async Task<IViewComponentResult> InvokeAsync(string productId)
        {
            var username = HttpContext.Session.GetString("Username");
            var model = await _reviewService.GetReviewViewModel(productId, username);
            return View(model);
        }
    }
} 