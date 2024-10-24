using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text.RegularExpressions;
using BTLW_BDT.Models;
using BTLW_BDT.Models.PhoneModels;

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
        //BtlLtwQlbdtContext db = new BtlLtwQlbdtContext();
        //[HttpGet]
        //public ActionResult<IEnumerable<Phone>> GetAllPhones()
        //{
        //    try
        //    {
        //        var phones = (from p in db.SanPhams
        //                      select new Phone
        //                      {
        //                          MaSanPham = p.MaSanPham,
        //                          TenSanPham = p.TenSanPham,
        //                          DonGiaBanGoc = p.DonGiaBanGoc,
        //                          DonGiaBanRa = p.DonGiaBanRa,
        //                          KhuyenMai = p.KhuyenMai,
        //                          Ram = p.Ram,
        //                          Pin = p.Pin,
        //                          AnhDaiDien = p.AnhDaiDien
        //                      }).ToList();
        //        return Ok(phones);
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log the exception
        //        return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the database");
        //    }
        //}
        //[HttpGet("{ttyc}")]
        //public IEnumerable<Phone> GetPhoneByTT(string ttyc)
        //{
        //    var phones = (from p in db.SanPhams
        //                  where p.Ram == ttyc || p.Pin.Contains(ttyc) || p.TenSanPham.Contains(ttyc)
        //                  select new Phone
        //                  {
        //                      MaSanPham = p.MaSanPham,
        //                      TenSanPham = p.TenSanPham,
        //                      DonGiaBanGoc = p.DonGiaBanGoc,
        //                      DonGiaBanRa = p.DonGiaBanRa,
        //                      KhuyenMai = p.KhuyenMai,
        //                      Ram = p.Ram,
        //                      Pin = p.Pin,
        //                      AnhDaiDien = p.AnhDaiDien
        //                  }).ToList();
        //    return phones;
        //}
    }
}
