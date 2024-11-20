using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BTLW_BDT.Models;

public partial class SanPham
{
    [Required(ErrorMessage = "Mã sản phẩm không được để trống")]
    [StringLength(50, ErrorMessage = "Mã sản phẩm không được vượt quá 50 ký tự")]
    public string MaSanPham { get; set; } = null!;

    [Required(ErrorMessage = "Tên sản phẩm không được để trống")]
    [StringLength(200, ErrorMessage = "Tên sản phẩm không được vượt quá 200 ký tự")]
    public string TenSanPham { get; set; } = null!;

    [Required(ErrorMessage = "Thời gian bảo hành không được để trống")]
    [Range(0, 60, ErrorMessage = "Thời gian bảo hành phải từ 0 đến 60 tháng")]
    public int ThoiGianBaoHanh { get; set; }

    [Required(ErrorMessage = "Số lượng tồn kho không được để trống")]
    [Range(0, int.MaxValue, ErrorMessage = "Số lượng tồn kho không được âm")]
    public int SoLuongTonKho { get; set; }

    [Required(ErrorMessage = "Đơn giá bán gốc không được để trống")]
    [Range(0, double.MaxValue, ErrorMessage = "Đơn giá bán gốc không được âm")]
    [Column(TypeName = "decimal(18,2)")]
    public decimal DonGiaBanGoc { get; set; }

    [Required(ErrorMessage = "Đơn giá bán ra không được để trống")]
    [Range(0, double.MaxValue, ErrorMessage = "Đơn giá bán ra không được âm")]
    [Column(TypeName = "decimal(18,2)")]
    public decimal DonGiaBanRa { get; set; }

    [Required(ErrorMessage = "Khuyến mãi không được để trống")]
    [Range(0, 50, ErrorMessage = "Khuyến mãi phải từ 0 đến 50%")]
    [Column(TypeName = "decimal(18,2)")]
    public decimal KhuyenMai { get; set; }

    [Required(ErrorMessage = "Danh bạ không được để trống")]
    [StringLength(100, ErrorMessage = "Danh bạ không được vượt quá 100 ký tự")]
    public string DanhBa { get; set; } = null!;

    [Required(ErrorMessage = "Đèn flash không được để trống")]
    [StringLength(100, ErrorMessage = "Đèn flash không được vượt quá 100 ký tự")]
    public string DenFlash { get; set; } = null!;

    [Required(ErrorMessage = "Công nghệ màn hình không được để trống")]
    [StringLength(100, ErrorMessage = "Công nghệ màn hình không được vượt quá 100 ký tự")]
    public string CongNgheManHinh { get; set; } = null!;

    [Required(ErrorMessage = "Độ sáng tối đa không được để trống")]
    [Range(0, 10000, ErrorMessage = "Độ sáng tối đa phải từ 0 đến 10000 nits")]
    public int DoSangToiDa { get; set; }

    [Required(ErrorMessage = "Loại pin không được để trống")]
    [StringLength(100, ErrorMessage = "Loại pin không được vượt quá 100 ký tự")]
    public string LoaiPin { get; set; } = null!;

    [Required(ErrorMessage = "Bảo mật nâng cao không được để trống")]
    [StringLength(200, ErrorMessage = "Bảo mật nâng cao không được vượt quá 200 ký tự")]
    public string BaoMatNangCao { get; set; } = null!;

    [Required(ErrorMessage = "Ghi âm mặc định không được để trống")]
    [StringLength(100, ErrorMessage = "Ghi âm mặc định không được vượt quá 100 ký tự")]
    public string GhiAmMacDinh { get; set; } = null!;

    [Required(ErrorMessage = "Jack tai nghe không được để trống")]
    [StringLength(100, ErrorMessage = "Jack tai nghe không được vượt quá 100 ký tự")]
    public string JackTaiNghe { get; set; } = null!;

    [Required(ErrorMessage = "Mạng di động không được để trống")]
    [StringLength(100, ErrorMessage = "Mạng di động không được vượt quá 100 ký tự")]
    public string MangDiDong { get; set; } = null!;

    [Required(ErrorMessage = "Sim không được để trống")]
    [StringLength(100, ErrorMessage = "Sim không được vượt quá 100 ký tự")]
    public string Sim { get; set; } = null!;

    [Required(ErrorMessage = "Mã hãng không được để trống")]
    public string MaHang { get; set; } = null!;

    [Required(ErrorMessage = "Màn hình không được để trống")]
    [StringLength(200, ErrorMessage = "Màn hình không được vượt quá 200 ký tự")]
    public string ManHinh { get; set; } = null!;

    [Required(ErrorMessage = "Pin không được để trống")]
    [StringLength(100, ErrorMessage = "Pin không được vượt quá 100 ký tự")]
    public string Pin { get; set; } = null!;

    [Required(ErrorMessage = "Camera không được để trống")]
    [StringLength(200, ErrorMessage = "Camera không được vượt quá 200 ký tự")]
    public string Camera { get; set; } = null!;

    [Required(ErrorMessage = "Kích thước không được để trống")]
    [StringLength(100, ErrorMessage = "Kích thước không được vượt quá 100 ký tự")]
    public string KichThuoc { get; set; } = null!;

    [Required(ErrorMessage = "Chip không được để trống")]
    [StringLength(100, ErrorMessage = "Chip không được vượt quá 100 ký tự")]
    public string Chip { get; set; } = null!;

    [Required(ErrorMessage = "RAM không được để trống")]
    [StringLength(50, ErrorMessage = "RAM không được vượt quá 50 ký tự")]
    public string Ram { get; set; } = null!;

    [Required(ErrorMessage = "Ảnh đại diện không được để trống")]
    [StringLength(200, ErrorMessage = "Đường dẫn ảnh đại diện không được vượt quá 200 ký tự")]
    public string AnhDaiDien { get; set; } = null!;

    public virtual ICollection<AnhSanPham> AnhSanPhams { get; set; } = new List<AnhSanPham>();

    public virtual ICollection<ChiTietGioHang> ChiTietGioHangs { get; set; } = new List<ChiTietGioHang>();

    public virtual ICollection<ChiTietHoaDonBan> ChiTietHoaDonBans { get; set; } = new List<ChiTietHoaDonBan>();

    public virtual Hang? MaHangNavigation { get; set; }

    public virtual ICollection<MauSac> MauSacs { get; set; } = new List<MauSac>();

    public virtual ICollection<Rom> Roms { get; set; } = new List<Rom>();
}
