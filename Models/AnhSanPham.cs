using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class AnhSanPham
{
    public string TenFile { get; set; } = null!;

    public string? ViTri { get; set; }

    public string? MaSanPham { get; set; }
}
