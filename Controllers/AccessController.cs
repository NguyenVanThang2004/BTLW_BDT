using BTLW_BDT.Helpers;
using BTLW_BDT.Models;
using BTLW_BDT.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace BTLW_BDT.Controllers
{
    public class AccessController : Controller
    {
        //BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();
        private readonly BtlLtwQlbdtContext db;
   
        public AccessController(BtlLtwQlbdtContext context)
        {
            db = context;

        }


        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("Username") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public IActionResult Login(TaiKhoan user)
        {
            if (HttpContext.Session.GetString("Username") == null)
            {
                string hashedPassword = user.MatKhau.ToSHA256Hash("MySaltKey");


                var userInfo = (from tk in db.TaiKhoans
                                join kh in db.KhachHangs on tk.TenDangNhap equals kh.TenDangNhap
                                where tk.TenDangNhap == user.TenDangNhap && tk.MatKhau == hashedPassword
                                select new
                                {
                                    tk.TenDangNhap,
                                    kh.AnhDaiDien,
                                    kh.TenKhachHang
                                }).FirstOrDefault();

                if (userInfo != null)
                {
                    HttpContext.Session.SetString("Username", userInfo.TenDangNhap);
                    HttpContext.Session.SetString("HoTen", userInfo.TenKhachHang);
                    HttpContext.Session.SetString("Avatar", Url.Content("~/Images/Customer/" + userInfo.AnhDaiDien)); // Lưu đường dẫn ảnh vào Session
                    return RedirectToAction("Index", "Home");
                }

                
            }

            return View();
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("Username");
            return RedirectToAction("Login", "Access");
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        public IActionResult Register(RegisterVM  model, IFormFile Hinh)
        {
            if(ModelState.IsValid)
            {
                try
                {
                    var khachHang = new KhachHang
                    {
                        MaKhachHang = MyUtil.GenerateRamdomKey(),
                        TenKhachHang = model.HoTen,
                        NgaySinh = model.NgaySinh,
                        SoDienThoai = model.DienThoai,
                        DiaChi = model.DiaChi,
                        TenDangNhap = model.TaiKhoan 
                    };

                    
                    string hashedPassword = model.MatKhau.ToSHA256Hash("MySaltKey");

                    
                    var taiKhoan = new TaiKhoan
                    {
                        TenDangNhap = model.TaiKhoan,
                        MatKhau = hashedPassword,
                        LoaiTaiKhoan = "Customer" 
                    };

                    if (Hinh != null)
                    {
                        khachHang.AnhDaiDien = MyUtil.UploadHinh(Hinh, "Customer");
                    }
                    db.KhachHangs.Add(khachHang);
                    db.TaiKhoans.Add(taiKhoan);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", $"Error: {ex.Message}");
                }
            }
            return View(model);
        }
    }
}
