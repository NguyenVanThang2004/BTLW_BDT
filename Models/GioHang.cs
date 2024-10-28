using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class GioHang
{
    public string MaGioHang { get; set; } = null!;

    public decimal? TongTien { get; set; }

    public string? TenDangNhap { get; set; }

    public virtual TaiKhoan? TenDangNhapNavigation { get; set; }
}
