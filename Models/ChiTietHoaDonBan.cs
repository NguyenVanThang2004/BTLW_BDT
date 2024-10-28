using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class ChiTietHoaDonBan
{
    public int? SoLuongBan { get; set; }

    public decimal? DonGiaCuoi { get; set; }

    public string? MaHoaDon { get; set; }

    public string? MaSanPham { get; set; }

    public virtual HoaDonBan? MaHoaDonNavigation { get; set; }

    public virtual SanPham? MaSanPhamNavigation { get; set; }
}
