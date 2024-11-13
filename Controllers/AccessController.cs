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
                else
                {
                    ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không đúng.";
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

           

           

            if (ModelState.IsValid)
            {
                // Kiểm tra trùng tên đăng nhập trong cơ sở dữ liệu
                var existingAccount = db.TaiKhoans.FirstOrDefault(x => x.TenDangNhap == model.TaiKhoan);
                if (existingAccount != null)
                {
                    ModelState.AddModelError("TaiKhoan", "Tên đăng nhập đã tồn tại.");
                    return View(model);  // Nếu tên đăng nhập đã tồn tại, trả về view với thông báo lỗi
                }

                // Kiểm tra tính hợp lệ của số điện thoại
                //bool isPhoneValid = model.IsPhoneValid();
                //if (!isPhoneValid)
                //{
                //    ModelState.AddModelError("DienThoai", "Số điện thoại không hợp lệ.");
                //    return View(model);  // Nếu số điện thoại không hợp lệ, trả về view với thông báo lỗi
                //}

                //// Kiểm tra tính hợp lệ của email
                //bool isEmailValid = model.IsEmailValid();
                //if (!isEmailValid)
                //{
                //    ModelState.AddModelError("Email", "Email không hợp lệ hoặc không thể gửi .");
                //    return View(model);  // Nếu email không hợp lệ, trả về view với thông báo lỗi
                //}
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


            return View(model);



        }



        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ForgotPassword(ForgotPasswordVM model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var user = db.KhachHangs.SingleOrDefault(x => x.Email == model.Email);
            if (user != null)
            {
                // Tạo mã xác thực
                var code = GenerateResetCode();

                // Lưu mã xác thực và thời gian hết hạn vào bảng KhachHang
                user.ResetCode = code;
               // user.ResetCodeExpiry = DateTime.Now.AddMinutes(30); // Mã sẽ hết hạn sau 30 phút
                db.SaveChanges();

                // Gửi mã qua email
                SendResetCodeEmail(model.Email, code);

                // Thông báo thành công
                TempData["SuccessMessage"] = "Mã đặt lại mật khẩu đã được gửi đến email của bạn.";
            }
            else
            {
                // Nếu không tìm thấy email, thông báo lỗi
                ModelState.AddModelError(string.Empty, "Email không tồn tại.");
            }

            return View(model);
        }

        [HttpPost]
        public IActionResult ResetPassword(string email, int code, string newPassword)
        {
            var user = db.KhachHangs.SingleOrDefault(x => x.Email == email && x.ResetCode == code);
            if (user != null)
            {

                var account = db.TaiKhoans.SingleOrDefault(x=>x.TenDangNhap.Equals(user.TenDangNhap));
               
                db.SaveChanges();

                TempData["SuccessMessage"] = "Mật khẩu của bạn đã được thay đổi thành công!";
                return RedirectToAction("Login");
            }
            else
            {
                TempData["ErrorMessage"] = "Mã xác thực không hợp lệ hoặc đã hết hạn.";
                return View();
            }
        }

        private void SendResetCodeEmail(string email, int code)
        {
            var fromAddress = new MailAddress("thangdepzai38@gmail.com", "Your App Name");
            var toAddress = new MailAddress(email);
            const string fromPassword = "your-email-password";
            const string subject = "Reset mật khẩu - Mã xác thực";
            string body = $"Mã xác thực của bạn là: {code}";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }
        private int GenerateResetCode()
        {
            var rng = new Random();
            var code = rng.Next(100000, 999999); // Tạo mã ngẫu nhiên 6 chữ số
            return code;
        }

        







    }
}
