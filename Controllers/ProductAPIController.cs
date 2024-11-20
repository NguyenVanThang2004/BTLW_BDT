using BTLW_BDT.Models;
using BTLW_BDT.Models.PhoneModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.EntityFrameworkCore;

namespace BTLW_BDT.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductAPIController : ControllerBase
    {
        private readonly BtlLtwQlbdtContext db;

        public ProductAPIController(BtlLtwQlbdtContext context)
        {
            db = context;
        }

        // GET: api/ProductAPI/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<SanPham>> GetProduct(string id)
        {
            var product = await db.SanPhams
                .Include(p => p.Roms)
                .Include(p => p.MauSacs)
                .Include(p => p.AnhSanPhams)
                .FirstOrDefaultAsync(p => p.MaSanPham == id);

            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }

        // PUT: api/ProductAPI/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProduct(string id, SanPham sanPham)
        {
            if (id != sanPham.MaSanPham)
            {
                return BadRequest();
            }

            try
            {
                // Xóa các ROM, màu sắc và ảnh cũ
                var existingRoms = await db.Roms.Where(r => r.MaSanPham == id).ToListAsync();
                var existingMausacs = await db.MauSacs.Where(m => m.MaSanPham == id).ToListAsync();
                var existingAnhs = await db.AnhSanPhams.Where(a => a.MaSanPham == id).ToListAsync();

                db.Roms.RemoveRange(existingRoms);
                db.MauSacs.RemoveRange(existingMausacs);
                db.AnhSanPhams.RemoveRange(existingAnhs);

                // Cập nhật thông tin sản phẩm
                db.Entry(sanPham).State = EntityState.Modified;

                // Thêm ROM, màu sắc và ảnh mới
                if (sanPham.Roms != null)
                    db.Roms.AddRange(sanPham.Roms);
                if (sanPham.MauSacs != null)
                    db.MauSacs.AddRange(sanPham.MauSacs);
                if (sanPham.AnhSanPhams != null)
                    db.AnhSanPhams.AddRange(sanPham.AnhSanPhams);

                await db.SaveChangesAsync();
                return NoContent();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
                {
                    return NotFound();
                }
                throw;
            }
        }

        private bool ProductExists(string id)
        {
            return db.SanPhams.Any(e => e.MaSanPham == id);
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
