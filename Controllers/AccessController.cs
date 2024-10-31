using BTLW_BDT.Models;
using BTLW_BDT.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Crypto;
using BTLW_BDT.Helpers;
using AutoMapper;

namespace BTLW_BDT.Controllers
{
    public class AccessController : Controller
    {
        //BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();
        private readonly BtlLtwQlbdtContext db;
        private readonly IMapper _mapper;

        // Sử dụng Dependency Injection để inject db và _mapper
        public AccessController(BtlLtwQlbdtContext context, IMapper mapper)
        {
            db = context;
            _mapper = mapper;
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
                var u = db.TaiKhoans.Where(x => x.TenDangNhap.Equals(user.TenDangNhap) && x.MatKhau.Equals(user.MatKhau)).FirstOrDefault();
                if (u != null)
                {
                    HttpContext.Session.SetString("Username", u.TenDangNhap.ToString());
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

        [HttpPost]
        public IActionResult Register(RegisterVM model, IFormFile Hinh)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var khachHang = _mapper.Map<KhachHang>(model);
                    khachHang.TenDangNhap = MyUtil.GenerateRamdomKey();
                    //khachHang.M = model.MatKhau.ToMd5Hash(khachHang.RandomKey);
                    //khachHang.HieuLuc = true;//sẽ xử lý khi dùng Mail để active
                    //khachHang.VaiTro = 0;
                    if (Hinh != null)
                    {
                        khachHang.AnhDaiDien = MyUtil.UploadHinh(Hinh, "KhachHang");
                    }
                    db.Add(khachHang);
                    db.SaveChanges();
                    return RedirectToAction("Index", "HangHoa");
                }
                catch (Exception ex)
                {
                    var mess = $"{ex.Message} shh";
                }
            }
            return View();
        }
    }
}
