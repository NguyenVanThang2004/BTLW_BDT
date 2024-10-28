using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class SanPham
{
    public string MaSanPham { get; set; } = null!;

    public string? TenSanPham { get; set; }

    public int? ThoiGianBaoHanh { get; set; }

    public int? SoLuongTonKho { get; set; }

    public decimal? DonGiaBanGoc { get; set; }

    public decimal? DonGiaBanRa { get; set; }

    public decimal? KhuyenMai { get; set; }

    public string? Hang { get; set; }

    public string? ManHinh { get; set; }

    public string? Pin { get; set; }

    public string? Camera { get; set; }

    public string? KichThuoc { get; set; }

    public string? Chip { get; set; }

    public string? MaMau { get; set; }

    public string? Ram { get; set; }

    public string? MaRom { get; set; }

    public string? AnhDaiDien { get; set; }

    public virtual MauSac? MaMauNavigation { get; set; }

    public virtual Rom? MaRomNavigation { get; set; }
}
