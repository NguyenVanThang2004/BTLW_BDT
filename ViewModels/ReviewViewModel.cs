using System;
using System.ComponentModel.DataAnnotations;

namespace BTLW_BDT.ViewModels
{
    public class ReviewViewModel
    {
        public string MaSanPham { get; set; }
        
        public string TenDangNhap { get; set; }
        
        [Required(ErrorMessage = "Vui lòng chọn số sao đánh giá")]
        [Range(1, 5, ErrorMessage = "Số sao đánh giá phải từ 1 đến 5")]
        public int? Rate { get; set; }
        
        [Required(ErrorMessage = "Vui lòng nhập nội dung đánh giá")]
        [StringLength(500, MinimumLength = 10, ErrorMessage = "Nội dung đánh giá phải từ 10 đến 500 ký tự")]
        public string NoiDung { get; set; }
        
        public DateTime ThoiGianDanhGia { get; set; }
        
        public bool IsEdit { get; set; }
        
        public bool RequiresLogin { get; set; }
        
        public bool RequiresPurchase { get; set; }
        
        public bool HasReviewed { get; set; }
    }
} 