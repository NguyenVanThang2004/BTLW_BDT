using BTLW_BDT.Helpers;
using BTLW_BDT.Models;
using BTLW_BDT.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using System.Net.Mail;
using System.Net;

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
                                    kh.MaKhachHang,
                                    kh.TenKhachHang,
                                    kh.NgaySinh,
                                    kh.SoDienThoai,
                                    kh.DiaChi, 
                                    kh.Email,
                                    kh.GhiChu
                                }).FirstOrDefault();

                if (userInfo != null)
                {
                    HttpContext.Session.SetString("Username", userInfo.TenDangNhap);
                    HttpContext.Session.SetString("MaKhachHang", userInfo.MaKhachHang);
                    HttpContext.Session.SetString("HoTen", userInfo.TenKhachHang);
                    HttpContext.Session.SetString("NgaySinh", $"{userInfo.NgaySinh}");
                    HttpContext.Session.SetString("SoDienThoai", userInfo.SoDienThoai);
                    HttpContext.Session.SetString("DiaChi", userInfo.DiaChi);
                    HttpContext.Session.SetString("Email", userInfo.Email);
                    if (!string.IsNullOrEmpty(userInfo.GhiChu))
                    {
                        HttpContext.Session.SetString("GhiChu", userInfo.GhiChu);
                    }
                    else
                    {
                        HttpContext.Session.SetString("GhiChu", ""); // hoặc đặt giá trị mặc định nếu cần
                    }
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
            HttpContext.Session.Remove("MaKhachHang");
            HttpContext.Session.Remove("HoTen");
            HttpContext.Session.Remove("NgaySinh");
            HttpContext.Session.Remove("SoDienThoai");
            HttpContext.Session.Remove("DiaChi");
            HttpContext.Session.Remove("Email");
            HttpContext.Session.Remove("GhiChu");
            HttpContext.Session.Remove("Avatar");
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
                        Email = model.Email,
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
                    //else
                    //{
                    //    khachHang.AnhDaiDien = "default-avatar.jpg"; // Set default avatar if no image uploaded
                    //}
                    db.KhachHangs.Add(khachHang);
                    db.TaiKhoans.Add(taiKhoan);
                    db.SaveChanges();


                    HttpContext.Session.SetString("HoTen", khachHang.TenKhachHang);
                    HttpContext.Session.SetString("NgaySinh", khachHang.NgaySinh.ToString());
                    HttpContext.Session.SetString("SoDienThoai", khachHang.SoDienThoai);
                    HttpContext.Session.SetString("DiaChi", khachHang.DiaChi);
                    HttpContext.Session.SetString("Email", khachHang.Email);
                    if (!string.IsNullOrEmpty(khachHang.GhiChu))
                    {
                        HttpContext.Session.SetString("GhiChu", khachHang.GhiChu);
                    }
                    else
                    {
                        HttpContext.Session.SetString("GhiChu", "");
                    }

                    HttpContext.Session.SetString("Avatar", Url.Content("~/Images/Customer/" + khachHang.AnhDaiDien));

                    return RedirectToAction("Index", "Home");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", $"Error: {ex.Message}");
                }


            }
            return View(model);
        }

        [HttpGet]
        public IActionResult ForgotPassword()
        {
            return View();
        }

        //[HttpPost]
        //public IActionResult ForgotPassword(ForgotPasswordVM model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        // Kiểm tra email có tồn tại trong hệ thống không
        //        var khachHang = db.KhachHangs.FirstOrDefault(kh => kh.Email == model.Email);
        //        if (khachHang == null)
        //        {
        //            ModelState.AddModelError("", "Email này không tồn tại trong hệ thống.");
        //            return View(model);
        //        }

        //        // Tạo mã xác thực ngẫu nhiên
        //        var code = new Random().Next(100000, 999999).ToString();

        //        // Lưu mã xác thực vào hệ thống, có thể lưu vào bảng mã xác thực
        //        //khachHang.ResetCode = code;  // cần có cột `ResetCode` trong bảng KhachHang
        //        //db.SaveChanges();

        //        // Gửi mã xác thực qua email
        //        try
        //        {
        //            //SendResetCodeEmail(model.Email, code);
        //            TempData["Message"] = "Mã xác thực đã được gửi đến email của bạn. Vui lòng kiểm tra email.";
        //        }
        //        catch (Exception ex)
        //        {
        //            ModelState.AddModelError("", "Không thể gửi mã xác thực. Vui lòng thử lại.");
        //            return View(model);
        //        }

        //        return RedirectToAction("VerifyResetCode"); // Điều hướng đến trang nhập mã xác thực
        //    }
        //    return View(model);
        //}

        //private void SendResetCodeEmail(string email, string code)
        //{
        //    var fromAddress = new MailAddress("your-email@example.com", "Your App Name");
        //    var toAddress = new MailAddress(email);
        //    const string fromPassword = "your-email-password"; // Mật khẩu email của bạn
        //    const string subject = "Reset mật khẩu - Mã xác thực";
        //    string body = $"Mã xác thực của bạn là: {code}";

        //    var smtp = new SmtpClient
        //    {
        //        Host = "smtp.gmail.com",
        //        Port = 587,
        //        EnableSsl = true,
        //        DeliveryMethod = SmtpDeliveryMethod.Network,
        //        UseDefaultCredentials = false,
        //        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
        //    };
        //    using (var message = new MailMessage(fromAddress, toAddress)
        //    {
        //        Subject = subject,
        //        Body = body
        //    })
        //    {
        //        smtp.Send(message);
        //    }
        //}

       
    }
}
