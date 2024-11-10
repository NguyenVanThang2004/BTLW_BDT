using BTLW_BDT.Helpers;
using BTLW_BDT.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace BTLW_BDT.Controllers
{
    public class UserController : Controller
    {
        private readonly BtlLtwQlbdtContext _context;

        public UserController(BtlLtwQlbdtContext context)
        {
            _context = context;
        }

        // Action hiển thị trang Profile
        [HttpGet]
        public IActionResult Profile()
        {
            return View();
        }

        // Action hiển thị trang chỉnh sửa thông tin khách hàng
        [HttpGet]
        public IActionResult EditProfile()
        {
            // Lấy thông tin từ Session và hiển thị
            var model = new KhachHang
            {
                MaKhachHang = HttpContext.Session.GetString("MaKhachHang"),
                TenKhachHang = HttpContext.Session.GetString("HoTen"),
                NgaySinh = DateOnly.Parse(HttpContext.Session.GetString("NgaySinh") ?? DateOnly.MinValue.ToString()),
                SoDienThoai = HttpContext.Session.GetString("SoDienThoai"),
                DiaChi = HttpContext.Session.GetString("DiaChi"),
                Email = HttpContext.Session.GetString("Email"),
                GhiChu = HttpContext.Session.GetString("GhiChu"),
                AnhDaiDien = HttpContext.Session.GetString("Avatar")
            };
            return View(model);
        }

        // Action lưu thông tin chỉnh sửa của khách hàng
        [HttpPost]
        public async Task<IActionResult> EditProfile(KhachHang khachHang, IFormFile Hinh)
        {
            if (ModelState.IsValid)
            {
                var existingCustomer = await _context.KhachHangs.FindAsync(khachHang.MaKhachHang);
                if (existingCustomer != null)
                {
                    // Chỉ cập nhật các trường có thay đổi
                    if (existingCustomer.TenKhachHang != khachHang.TenKhachHang)
                        existingCustomer.TenKhachHang = khachHang.TenKhachHang;

                    if (existingCustomer.NgaySinh != khachHang.NgaySinh)
                        existingCustomer.NgaySinh = khachHang.NgaySinh;

                    if (existingCustomer.SoDienThoai != khachHang.SoDienThoai)
                        existingCustomer.SoDienThoai = khachHang.SoDienThoai;

                    if (existingCustomer.DiaChi != khachHang.DiaChi)
                        existingCustomer.DiaChi = khachHang.DiaChi;

                    if (existingCustomer.Email != khachHang.Email)
                        existingCustomer.Email = khachHang.Email;

                    if (existingCustomer.GhiChu != khachHang.GhiChu)
                        existingCustomer.GhiChu = khachHang.GhiChu;

                    // Kiểm tra nếu người dùng chọn ảnh mới
                    if (Hinh != null && Hinh.Length > 0)
                    {
                        // Upload ảnh mới và cập nhật đường dẫn ảnh
                        string newAvatarPath = MyUtil.UploadHinh(Hinh, "Customer");
                        existingCustomer.AnhDaiDien = newAvatarPath;

                        // Cập nhật session Avatar nếu có ảnh mới
                        HttpContext.Session.SetString("Avatar", Url.Content("~/Images/Customer/" + newAvatarPath));
                    }

                    // Lưu thay đổi vào database
                    await _context.SaveChangesAsync();

                    // Cập nhật lại các thông tin khác trong session
                    HttpContext.Session.SetString("HoTen", existingCustomer.TenKhachHang);
                    HttpContext.Session.SetString("NgaySinh", existingCustomer.NgaySinh.ToString());
                    HttpContext.Session.SetString("SoDienThoai", existingCustomer.SoDienThoai);
                    HttpContext.Session.SetString("DiaChi", existingCustomer.DiaChi);
                    HttpContext.Session.SetString("Email", existingCustomer.Email);
                    HttpContext.Session.SetString("GhiChu", existingCustomer.GhiChu ?? "");

                    return RedirectToAction("Profile");
                }
            }

            // Trả về view nếu model không hợp lệ
            return View(khachHang);
        }
    }

}
