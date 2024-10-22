namespace BTLW_BDT.Models.Cart
{
    public class CartItem
    {
        public string MaSanPham { get; set; }

        public string TenSanPham { get; set; }

        public string Anh {  get; set; }    

        public int SoLuong { get; set; }

        public decimal DonGia { get; set; }
        public decimal TongTien => SoLuong * DonGia;

       
    }
}
