﻿using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class ChiTietGioHang
{
    public int? SoLuong { get; set; }

    public string MaGioHang { get; set; } = null!;

    public string MaSanPham { get; set; } = null!;

    public virtual GioHang MaGioHangNavigation { get; set; } = null!;

    public virtual SanPham MaSanPhamNavigation { get; set; } = null!;
}
