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

                // Tạo đường dẫn đến thư mục lưu file
                var uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "PhoneImages", "Images");
                
                // Tạo thư mục nếu chưa tồn tại
                if (!Directory.Exists(uploadPath))
                    Directory.CreateDirectory(uploadPath);

                // Tạo tên file độc nhất để tránh trùng lặp
                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                var filePath = Path.Combine(uploadPath, fileName);

                // Lưu file
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                // Trả về tên file để lưu vào database
                return Ok(new { fileName = fileName });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
