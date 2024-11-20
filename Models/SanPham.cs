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
    public string? TenSanPham { get; set; }

    [Range(0, 60, ErrorMessage = "Thời gian bảo hành phải từ 0 đến 60 tháng")]
    public int? ThoiGianBaoHanh { get; set; }

    [Range(0, int.MaxValue, ErrorMessage = "Số lượng tồn kho không được âm")]
    public int? SoLuongTonKho { get; set; }

    [Range(0, double.MaxValue, ErrorMessage = "Đơn giá bán gốc không được âm")]
    [Column(TypeName = "decimal(18,2)")]
    public decimal? DonGiaBanGoc { get; set; }

    [Range(0, double.MaxValue, ErrorMessage = "Đơn giá bán ra không được âm")]
    [Column(TypeName = "decimal(18,2)")]
    public decimal? DonGiaBanRa { get; set; }

    [Range(0, 50, ErrorMessage = "Khuyến mãi phải từ 0 đến 50%")]
    [Column(TypeName = "decimal(18,2)")]
    public decimal? KhuyenMai { get; set; }

    [StringLength(100)]
    public string? DanhBa { get; set; }

    [StringLength(100)]
    public string? DenFlash { get; set; }

    [StringLength(100)]
    public string? CongNgheManHinh { get; set; }

    [Range(0, 10000, ErrorMessage = "Độ sáng tối đa phải từ 0 đến 10000 nits")]
    public int? DoSangToiDa { get; set; }

    [StringLength(100)]
    public string? LoaiPin { get; set; }

    [StringLength(200)]
    public string? BaoMatNangCao { get; set; }

    [StringLength(100)]
    public string? GhiAmMacDinh { get; set; }

    [StringLength(100)]
    public string? JackTaiNghe { get; set; }

    [StringLength(100)]
    public string? MangDiDong { get; set; }

    [StringLength(100)]
    public string? Sim { get; set; }

    public string? MaHang { get; set; }

    [StringLength(200)]
    public string? ManHinh { get; set; }

    [StringLength(100)]
    public string? Pin { get; set; }

    [StringLength(200)]
    public string? Camera { get; set; }

    [StringLength(100)]
    public string? KichThuoc { get; set; }

    [StringLength(100)]
    public string? Chip { get; set; }

    [StringLength(50)]
    public string? Ram { get; set; }

    [StringLength(200)]
    public string? AnhDaiDien { get; set; }

    public virtual ICollection<AnhSanPham> AnhSanPhams { get; set; } = new List<AnhSanPham>();

    public virtual ICollection<ChiTietGioHang> ChiTietGioHangs { get; set; } = new List<ChiTietGioHang>();

    public virtual ICollection<ChiTietHoaDonBan> ChiTietHoaDonBans { get; set; } = new List<ChiTietHoaDonBan>();

    public virtual Hang? MaHangNavigation { get; set; }

    public virtual ICollection<MauSac> MauSacs { get; set; } = new List<MauSac>();

    public virtual ICollection<Rom> Roms { get; set; } = new List<Rom>();
}
