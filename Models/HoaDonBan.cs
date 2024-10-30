using System;
using System.Collections.Generic;

namespace BTLW_BDT.Models;

public partial class HoaDonBan
{
    public string MaHoaDon { get; set; } = null!;

    public string? PhuongThucThanhToan { get; set; }

    public decimal? TongTien { get; set; }

    public decimal? KhuyenMai { get; set; }

    public DateTime? ThoiGianLap { get; set; }

    public string? MaNhanVien { get; set; }

    public string? MaKhachHang { get; set; }

    public virtual ICollection<ChiTietHoaDonBan> ChiTietHoaDonBans { get; set; } = new List<ChiTietHoaDonBan>();

    public virtual ICollection<DanhGium> DanhGia { get; set; } = new List<DanhGium>();

    public virtual KhachHang? MaKhachHangNavigation { get; set; }

    public virtual NhanVien? MaNhanVienNavigation { get; set; }
}
