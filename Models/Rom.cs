using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class Rom
{
    public string MaRom { get; set; } = null!;

    public string? ThongSo { get; set; }

    public virtual ICollection<SanPham> SanPhams { get; set; } = new List<SanPham>();
}
