using BTLW_BDT.Models;
using BTLW_BDT.Models.PhoneModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.IO;

namespace BTLW_BDT.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductAPIController : ControllerBase
    {
        BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();
        [HttpGet]
        public IEnumerable<Phone> GetAllProducts()
        {
            var sanPham = (from p in db.SanPhams
                           select new Phone
                           {
                               MaSanPham = p.MaSanPham,
                               TenSanPham = p.TenSanPham,
                               DonGiaBanGoc = p.DonGiaBanGoc,
                               DonGiaBanRa = p.DonGiaBanRa,
                               KhuyenMai = p.KhuyenMai,
                               Ram = p.Ram,
                               Pin = p.Pin,
                               AnhDaiDien = string.IsNullOrEmpty(p.AnhDaiDien) ? "" : p.AnhDaiDien.Trim()
                           }).ToList();
            return sanPham;
        }

        //Lấy product theo loại sản phẩm
        [HttpGet("{mahang}")]
        public IEnumerable<Phone> GetProductsByCategory(string maHang)
        {
            var sanPham = (from p in db.SanPhams
                           where p.MaHang == maHang
                           select new Phone
                           {
                               MaSanPham = p.MaSanPham,
                               TenSanPham = p.TenSanPham,
                               DonGiaBanGoc = p.DonGiaBanGoc,
                               DonGiaBanRa = p.DonGiaBanRa,
                               KhuyenMai = p.KhuyenMai,
                               Ram = p.Ram,
                               Pin = p.Pin,
                               AnhDaiDien = p.AnhDaiDien ?? ""
                           }).ToList();
            return sanPham;
        }

        [HttpPost("UploadImage")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            try
            {
                if (file == null || file.Length == 0)
                    return BadRequest("No file uploaded");

                // Đường dẫn tới thư mục lưu ảnh
                string uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "PhoneImages", "Images");
                
                // Tạo tên file độc nhất
                string uniqueFileName = Guid.NewGuid().ToString() + "_" + file.FileName;
                
                // Đường dẫn đầy đủ
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                // Đảm bảo thư mục tồn tại
                if (!Directory.Exists(uploadsFolder))
                    Directory.CreateDirectory(uploadsFolder);

                // Lưu file
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(fileStream);
                }

                return Ok(new { fileName = uniqueFileName });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        }
    }
}
