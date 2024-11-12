using BTLW_BDT.Models;
using BTLW_BDT.Repository.Interface;
using BTLW_BDT.ViewModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BTLW_BDT.Repository
{
    public class ReviewService : IReviewService
    {
        private readonly BtlLtwQlbdtContext _context;

        public ReviewService(BtlLtwQlbdtContext context)
        {
            _context = context;
        }

        public async Task<ReviewViewModel> GetReviewViewModel(string productId, string username)
        {
            
            if (string.IsNullOrEmpty(username))
            {
                Console.WriteLine("Debug - Username is empty");
                return new ReviewViewModel 
                { 
                    MaSanPham = productId,
                    RequiresLogin = true,
                    RequiresPurchase = true,
                    HasReviewed = false
                };
            }

            // Kiểm tra xem người dùng đã mua sản phẩm chưa
            var hasPurchased = await HasUserPurchasedProduct(productId, username);
            
            // Kiểm tra xem đã có review chưa
            var existingReview = await GetReview(productId, username);
            
            if (existingReview == null)
            {
                return new ReviewViewModel 
                { 
                    MaSanPham = productId,
                    TenDangNhap = username,
                    RequiresLogin = false, // Đã đăng nhập
                    RequiresPurchase = !hasPurchased, // Chỉ false khi đã mua hàng
                    HasReviewed = false
                };
            }

            return new ReviewViewModel
            {
                MaSanPham = existingReview.MaSanPham,
                TenDangNhap = existingReview.TenDangNhap,
                Rate = existingReview.Rate,
                NoiDung = existingReview.NoiDung,
                ThoiGianDanhGia = existingReview.ThoiGianDanhGia,
                RequiresLogin = false,
                RequiresPurchase = false,
                IsEdit = true,
                HasReviewed = true
            };
        }

        public async Task<bool> SaveReview(ReviewViewModel model, string username)
        {
            var danhGia = new DanhGium
            {
                MaSanPham = model.MaSanPham,
                TenDangNhap = username,
                Rate = model.Rate,
                NoiDung = model.NoiDung,
                ThoiGianDanhGia = DateTime.Now
            };

            return await SaveReview(danhGia);
        }

        public async Task<DanhGium> GetReview(string productId, string username)
        {
            return await _context.DanhGia
                .FirstOrDefaultAsync(r => r.MaSanPham == productId && r.TenDangNhap == username);
        }

        public async Task<bool> SaveReview(DanhGium model)
        {
            var existingReview = await _context.DanhGia
                .FirstOrDefaultAsync(r => r.MaSanPham == model.MaSanPham && r.TenDangNhap == model.TenDangNhap);

            if (existingReview == null)
            {
                model.ThoiGianDanhGia = DateTime.Now;
                _context.DanhGia.Add(model);
            }
            else
            {
                existingReview.NoiDung = model.NoiDung;
                existingReview.Rate = model.Rate;
                existingReview.ThoiGianDanhGia = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteReview(string productId, string username)
        {
            var review = await _context.DanhGia
                .FirstOrDefaultAsync(r => r.MaSanPham == productId && r.TenDangNhap == username);

            if (review != null)
            {
                _context.DanhGia.Remove(review);
                await _context.SaveChangesAsync();
                return true;
            }

            return false;
        }

        public async Task<bool> HasUserPurchasedProduct(string productId, string username)
        {
            // Tìm tài khoản theo username
            var taiKhoan = await _context.TaiKhoans
                .Include(tk => tk.KhachHangs)
                    .ThenInclude(kh => kh.HoaDonBans)
                        .ThenInclude(hd => hd.ChiTietHoaDonBans)
                .FirstOrDefaultAsync(tk => tk.TenDangNhap == username);

            if (taiKhoan == null || taiKhoan.KhachHangs == null)
                return false;

            // Changed from accessing HoaDonBans directly to handling KhachHangs as a collection
            return taiKhoan.KhachHangs.Any(kh => 
                kh.HoaDonBans.Any(hd => 
                    hd.ChiTietHoaDonBans.Any(ct => ct.MaSanPham == productId)
                )
            );
        }

        public async Task<bool> HasUserReviewed(string productId, string username)
        {
            return await _context.DanhGia
                .AnyAsync(r => r.MaSanPham == productId && r.TenDangNhap == username);
        }

        public async Task<List<ReviewViewModel>> GetProductReviews(string productId)
        {
            var reviews = await _context.DanhGia
                .Where(r => r.MaSanPham == productId)
                .OrderByDescending(r => r.ThoiGianDanhGia)
                .Select(r => new ReviewViewModel
                {
                    MaSanPham = r.MaSanPham,
                    TenDangNhap = r.TenDangNhap,
                    NoiDung = r.NoiDung,
                    Rate = r.Rate,
                    ThoiGianDanhGia = r.ThoiGianDanhGia
                })
                .ToListAsync();

            return reviews;
        }
    }
} 