using BTLW_BDT.Models;
namespace BTLW_BDT.ViewModels
{
    public class ProductDetailViewModel
    {
        public SanPham dmSp { get; set; }
        public List<AnhSanPham> dmAnhSp { get; set;}
        public List<MauSac> dmMauSp { get; set;}
        public List<Rom> dmRomSp { get; set;}
    }
}
