﻿using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class DanhGium
{
    public string? NoiDung { get; set; }

    public int? Rate { get; set; }

    public string TenDangNhap { get; set; } = null!;

    public string MaHoaDon { get; set; } = null!;

    public virtual HoaDonBan MaHoaDonNavigation { get; set; } = null!;

    public virtual TaiKhoan TenDangNhapNavigation { get; set; } = null!;
}
