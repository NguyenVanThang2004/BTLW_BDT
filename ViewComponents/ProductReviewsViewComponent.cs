using Microsoft.AspNetCore.Mvc;
using BTLW_BDT.Repository;
using BTLW_BDT.Repository.Interface;
using System.Threading.Tasks;

namespace BTLW_BDT.ViewComponents
{
    public class ProductReviewsViewComponent : ViewComponent
    {
        private readonly IReviewService _reviewService;

        public ProductReviewsViewComponent(IReviewService reviewService)
        {
            _reviewService = reviewService;
        }

        public async Task<IViewComponentResult> InvokeAsync(string productId)
        {
            var reviews = await _reviewService.GetProductReviews(productId);
            return View(reviews);
        }
    }
} 