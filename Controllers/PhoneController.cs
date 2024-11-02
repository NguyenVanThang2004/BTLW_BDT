using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text.RegularExpressions;
using BTLW_BDT.Models;
using BTLW_BDT.Models.PhoneModels;
using System.Linq;

namespace BTLW_BDT.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PhoneController : Controller
    {
        BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();
        [HttpGet("GetPhoneByRam")]
        public IActionResult GetPhoneByRam([FromQuery] string rams, int page = 1, int pageSize = 12)
        {
            var ramList = rams.Split(',').Select(r => r.Trim()).ToList();
            var query = db.SanPhams.Where(p => ramList.Contains(p.Ram));
            
            var totalItems = query.Count();
            var totalPages = (int)Math.Ceiling(totalItems / (double)pageSize);
            
            var phones = query.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            
            var viewModel = new
            {
                Products = phones,
                TotalPages = totalPages,
                CurrentPage = page
            };
            
            return Json(viewModel);
        }
        [HttpGet("GetRamOptions")]
        public IActionResult GetRamOptions()
        {
            var ramOptions = db.SanPhams.Select(p => p.Ram).Distinct().OrderBy(r => r).ToList();
            return Ok(ramOptions);
        }
        [HttpGet("GetAllPhones")]
        public IActionResult GetAllPhones(int page = 1, int pageSize = 12)
        {
            var query = db.SanPhams;
            
            var totalItems = query.Count();
            var totalPages = (int)Math.Ceiling(totalItems / (double)pageSize);
            
            var phones = query.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            
            var viewModel = new
            {
                Products = phones,
                TotalPages = totalPages,
                CurrentPage = page
            };
            
            return Json(viewModel);
        }
        [HttpGet("GetFilteredPhones")]
        public IActionResult GetFilteredPhones([FromQuery] string rams = "", decimal? minPrice = null, decimal? maxPrice = null, string searchQuery = "", string brand = "", int page = 1, int pageSize = 12)
        {
            var ramList = string.IsNullOrEmpty(rams) ? new List<string>() : rams.Split(',').Select(r => r.Trim()).ToList();
            var query = db.SanPhams.AsQueryable();

            // Lọc theo RAM
            if (ramList.Any() && !ramList.Contains("all"))
            {
                query = query.Where(p => ramList.Contains(p.Ram));
            }

            // Lọc theo giá
            if (minPrice.HasValue)
            {
                query = query.Where(p => p.DonGiaBanRa >= minPrice.Value);
            }
            if (maxPrice.HasValue)
            {
                query = query.Where(p => p.DonGiaBanRa <= maxPrice.Value);
            }

            // Lọc theo tên sản phẩm
            if (!string.IsNullOrEmpty(searchQuery))
            {
                query = query.Where(p => p.TenSanPham.Contains(searchQuery));
            }

            // Lọc theo hãng
            if (!string.IsNullOrEmpty(brand))
            {
                query = query.Where(p => p.MaHang == brand);
            }

            var totalItems = query.Count();
            var totalPages = (int)Math.Ceiling(totalItems / (double)pageSize);

            var phones = query.Skip((page - 1) * pageSize).Take(pageSize).ToList();

            var viewModel = new
            {
                Products = phones,
                TotalPages = totalPages,
                CurrentPage = page
            };

            return Json(viewModel);
        }
        [HttpGet("GetBrands")]
        public IActionResult GetBrands()
        {
            var brands = db.Hangs.Select(h => new { h.MaHang, h.TenHang }).ToList();
            return Ok(brands);
        }
    }
}
