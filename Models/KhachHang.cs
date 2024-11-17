using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class KhachHang
{
    public string MaKhachHang { get; set; } = null!;

    public string? TenKhachHang { get; set; }

    public DateOnly? NgaySinh { get; set; }

    public string? SoDienThoai { get; set; }

    public string? LoaiKhachHang { get; set; }

    public string? GhiChu { get; set; }

    public string? AnhDaiDien { get; set; }

    public string? TenDangNhap { get; set; }

    public string? Email { get; set; }

    public int? ResetCode { get; set; }

    public string? DiaChiChiTiet { get; set; }

    public string? DiaChiPhuongXa { get; set; }

    public string? DiaChiQuanHuyen { get; set; }

    public string? DiaChiTinhThanh { get; set; }

    public decimal? DiaChiLatitude { get; set; }

    public decimal? DiaChiLongitude { get; set; }

    public virtual ICollection<HoaDonBan> HoaDonBans { get; set; } = new List<HoaDonBan>();

    public virtual TaiKhoan? TenDangNhapNavigation { get; set; }

    public virtual ICollection<TinNhan> TinNhans { get; set; } = new List<TinNhan>();
}
