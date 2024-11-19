using BTLW_BDT.Models;
using BTLW_BDT.Models.PhoneModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

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
                               AnhDaiDien = p.AnhDaiDien
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
                               AnhDaiDien = p.AnhDaiDien
                           }).ToList();
            return sanPham;
        }
    }
}
