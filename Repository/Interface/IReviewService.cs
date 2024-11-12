using BTLW_BDT.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BTLW_BDT.Repository.Interface
{
    public interface IReviewService
    {
        Task<ReviewViewModel> GetReviewViewModel(string productId, string username);
        Task<List<ReviewViewModel>> GetProductReviews(string productId);
        Task<bool> SaveReview(ReviewViewModel model, string username);
        Task<bool> DeleteReview(string productId, string username);
        Task<bool> HasUserPurchasedProduct(string productId, string username);
        Task<bool> HasUserReviewed(string productId, string username);
    }
} 