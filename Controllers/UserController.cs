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
                GhiChu = HttpContext.Session.GetString("GhiChu"),
                //AnhDaiDien = HttpContext.Session.GetString("AnhDaiDien")
            };
            return View(model);
        }

        // Action lưu thông tin chỉnh sửa của khách hàng
        [HttpPost]
        //public async Task<IActionResult> EditProfile(KhachHang khachHang, IFormFile Hinh)
        public async Task<IActionResult> EditProfile(KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                var existingCustomer = await _context.KhachHangs.FindAsync(khachHang.MaKhachHang);
                if (existingCustomer != null)
                {
                    existingCustomer.TenKhachHang = khachHang.TenKhachHang;
                    existingCustomer.NgaySinh = khachHang.NgaySinh;
                    existingCustomer.SoDienThoai = khachHang.SoDienThoai;
                    existingCustomer.DiaChi = khachHang.DiaChi;
                    existingCustomer.GhiChu = khachHang.GhiChu;

                    //if (Hinh != null)
                    //{
                    //    existingCustomer.AnhDaiDien = MyUtil.UploadHinh(Hinh, "Customer");
                    //}

                    //await _context.SaveChangesAsync();

                    // Cập nhật lại session sau khi lưu
                    HttpContext.Session.SetString("HoTen", khachHang.TenKhachHang);
                    HttpContext.Session.SetString("NgaySinh", khachHang.NgaySinh.ToString());
                    HttpContext.Session.SetString("SoDienThoai", khachHang.SoDienThoai);
                    HttpContext.Session.SetString("DiaChi", khachHang.DiaChi);
                    if (!string.IsNullOrEmpty(khachHang.GhiChu))
                    {
                        HttpContext.Session.SetString("GhiChu", khachHang.GhiChu);
                    }
                    else
                    {
                        HttpContext.Session.SetString("GhiChu", ""); // hoặc đặt giá trị mặc định nếu cần
                    }
                    //HttpContext.Session.SetString("AnhDaiDien", Url.Content("~/Images/Customer/" + khachHang.AnhDaiDien));
                }
                return RedirectToAction("Profile");
            }
            return View(khachHang);
        }
    }

}
