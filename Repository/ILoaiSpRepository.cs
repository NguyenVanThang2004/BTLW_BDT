using BTLW_BDT.Models;
namespace BTLW_BDT.Repository
{
    public interface ILoaiSpRepository
    {
        SanPham Add(SanPham loaiSp);
        SanPham Update(SanPham loaiSp);
        SanPham Delete(SanPham maloaiSp);
        SanPham GeSanPham(SanPham maloaiSp);
        IEnumerable<SanPham> GetAllLoaiSp();
    }
}
