USE [BTL_LTW_QLBDT]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[TenFile] [nvarchar](255) NOT NULL,
	[ViTri] [nvarchar](255) NULL,
	[MaSanPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_AnhSanPham] PRIMARY KEY CLUSTERED 
(
	[TenFile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[SoLuong] [int] NULL,
	[MaGioHang] [nvarchar](50) NOT NULL,
	[MaSanPham] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChiTietGioHang] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonBan]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonBan](
	[SoLuongBan] [int] NULL,
	[DonGiaCuoi] [decimal](18, 2) NULL,
	[MaHoaDon] [nvarchar](50) NOT NULL,
	[MaSanPham] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[NoiDung] [nvarchar](255) NULL,
	[Rate] [int] NULL,
	[TenDangNhap] [nvarchar](100) NOT NULL,
	[MaHoaDon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [nvarchar](50) NOT NULL,
	[TongTien] [decimal](18, 2) NULL,
	[TenDangNhap] [nvarchar](100) NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHoaDon] [nvarchar](50) NOT NULL,
	[PhuongThucThanhToan] [nvarchar](100) NULL,
	[TongTien] [decimal](18, 2) NULL,
	[KhuyenMai] [decimal](18, 2) NULL,
	[ThoiGianLap] [datetime] NULL,
	[MaNhanVien] [nvarchar](50) NULL,
	[MaKhachHang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [nvarchar](50) NOT NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[LoaiKhachHang] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](255) NULL,
	[AnhDaiDien] [nvarchar](255) NULL,
	[TenDangNhap] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuHoatDong]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuHoatDong](
	[MaHoatDong] [nvarchar](50) NOT NULL,
	[LoaiHoatDong] [nvarchar](100) NULL,
	[ThoiGianThucHien] [datetime] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[TenDangNhap] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoatDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [nvarchar](50) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [nvarchar](50) NOT NULL,
	[TenNhanVien] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[ChucVu] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](255) NULL,
	[AnhDaiDien] [nvarchar](255) NULL,
	[TenDangNhap] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROM]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROM](
	[MaROM] [nvarchar](50) NOT NULL,
	[ThongSo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaROM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](50) NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[ThoiGianBaoHanh] [int] NULL,
	[SoLuongTonKho] [int] NULL,
	[DonGiaBanGoc] [decimal](18, 2) NULL,
	[DonGiaBanRa] [decimal](18, 2) NULL,
	[KhuyenMai] [decimal](18, 2) NULL,
	[Hang] [nvarchar](100) NULL,
	[ManHinh] [nvarchar](100) NULL,
	[Pin] [nvarchar](50) NULL,
	[Camera] [nvarchar](50) NULL,
	[KichThuoc] [nvarchar](100) NULL,
	[Chip] [nvarchar](50) NULL,
	[MaMau] [nvarchar](50) NULL,
	[RAM] [nvarchar](50) NULL,
	[MaROM] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [nvarchar](100) NOT NULL,
	[MatKhau] [nvarchar](100) NULL,
	[LoaiTaiKhoan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a16-1.jpg', NULL, N'op013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a16-2.jpg', NULL, N'op013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a16-3.jpg', NULL, N'op013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a17k-1.jpg', NULL, N'op018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a17k-2.jpg', NULL, N'op018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a17k-3.jpg', NULL, N'op018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a18-1.jpg', NULL, N'op014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a18-2.jpg', NULL, N'op014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a18-3.jpg', NULL, N'op014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a54-1.jpg', NULL, N'op012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a54-2.jpg', NULL, N'op012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a54-3.jpg', NULL, N'op012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a57-1.jpg', NULL, N'op007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a57-2.jpg', NULL, N'op007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a57-3.jpg', NULL, N'op007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a58-1.jpg', NULL, N'op015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a58-2.jpg', NULL, N'op015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a58-3.jpg', NULL, N'op015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a77s-1.jpg', NULL, N'op003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a77s-2.jpg', NULL, N'op003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a77s-3.jpg', NULL, N'op003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a78-1.jpg', NULL, N'op019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a78-2.jpg', NULL, N'op019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a78-3.jpg', NULL, N'op019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a96-1.jpg', NULL, N'op005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a96-2.jpg', NULL, N'op005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a96-3.jpg', NULL, N'op005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a98-1.jpg', NULL, N'op017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a98-2.jpg', NULL, N'op017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'a98-3.jpg', NULL, N'op017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findn2-1.jpg', NULL, N'op006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findn2-2.jpg', NULL, N'op006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findn2-3.jpg', NULL, N'op006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findx3pro-1.jpg', NULL, N'op011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findx3pro-2.jpg', NULL, N'op011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findx3pro-3.jpg', NULL, N'op011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findx5pro-1.jpg', NULL, N'op001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findx5pro-2.jpg', NULL, N'op001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'findx5pro-3.jpg', NULL, N'op001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a12-1.jpg', NULL, N'ss019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a12-2.jpg', NULL, N'ss019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a12-3.jpg', NULL, N'ss019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a32-1.jpg', NULL, N'ss017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a32-2.jpg', NULL, N'ss017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a32-3.jpg', NULL, N'ss017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a34-1.jpg', NULL, N'ss010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a34-2.jpg', NULL, N'ss010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a34-3.jpg', NULL, N'ss010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a52_5g-1.jpg', NULL, N'ss014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a52_5g-2.jpg', NULL, N'ss014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a52_5g-3.jpg', NULL, N'ss014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a54-1.jpg', NULL, N'ss003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a54-2.jpg', NULL, N'ss003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a54-3.jpg', NULL, N'ss003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a72-1.jpg', NULL, N'ss013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a72-2.jpg', NULL, N'ss013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a72-3.jpg', NULL, N'ss013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a73-1.jpg', NULL, N'ss007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a73-2.jpg', NULL, N'ss007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_a73-3.jpg', NULL, N'ss007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_m32-1.jpg', NULL, N'ss016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_m32-2.jpg', NULL, N'ss016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_m32-3.jpg', NULL, N'ss016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_m53-1.jpg', NULL, N'ss008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_m53-2.jpg', NULL, N'ss008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_m53-3.jpg', NULL, N'ss008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_note20_ultra-1.jpg', NULL, N'ss006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_note20_ultra-2.jpg', NULL, N'ss006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_note20_ultra-3.jpg', NULL, N'ss006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s20_fe-1.jpg', NULL, N'ss015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s20_fe-2.jpg', NULL, N'ss015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s20_fe-3.jpg', NULL, N'ss015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s21_fe-1.jpg', NULL, N'ss009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s21_fe-2.jpg', NULL, N'ss009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s21_fe-3.jpg', NULL, N'ss009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s21_ultra-1.jpg', NULL, N'ss012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s21_ultra-2.jpg', NULL, N'ss012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s21_ultra-3.jpg', NULL, N'ss012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s22_ultra-1.jpg', NULL, N'ss004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s22_ultra-2.jpg', NULL, N'ss004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s22_ultra-3.jpg', NULL, N'ss004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s23-1.jpg', NULL, N'ss001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s23-2.jpg', NULL, N'ss001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_s23-3.jpg', NULL, N'ss001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zflip5-1.jpg', NULL, N'ss005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zflip5-2.jpg', NULL, N'ss005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zflip5-3.jpg', NULL, N'ss005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zfold4-1.jpg', NULL, N'ss011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zfold4-2.jpg', NULL, N'ss011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zfold4-3.jpg', NULL, N'ss011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zfold5-1.jpg', NULL, N'ss002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zfold5-2.jpg', NULL, N'ss002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'galaxy_zfold5-3.jpg', NULL, N'ss002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11-1.jpg', NULL, N'ip006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11-2.jpg', NULL, N'ip006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11-3.jpg', NULL, N'ip006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11pro-1.jpg', NULL, N'ip007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11pro-2.jpg', NULL, N'ip007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11pro-3.jpg', NULL, N'ip007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11promax-1.jpg', NULL, N'ip008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11promax-2.jpg', NULL, N'ip008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone11promax-3.jpg', NULL, N'ip008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12-1.jpg', NULL, N'ip009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12-2.jpg', NULL, N'ip009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12-3.jpg', NULL, N'ip009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12mini-1.jpg', NULL, N'ip010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12mini-2.jpg', NULL, N'ip010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12mini-3.jpg', NULL, N'ip010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12pro-1.jpg', NULL, N'ip011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12pro-2.jpg', NULL, N'ip011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12pro-3.jpg', NULL, N'ip011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12promax-1.jpg', NULL, N'ip012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12promax-2.jpg', NULL, N'ip012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone12promax-3.jpg', NULL, N'ip012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13-1.jpg', NULL, N'ip013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13-2.jpg', NULL, N'ip013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13-3.jpg', NULL, N'ip013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13mini-1.jpg', NULL, N'ip014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13mini-2.jpg', NULL, N'ip014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13mini-3.jpg', NULL, N'ip014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13pro-1.jpg', NULL, N'ip015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13pro-2.jpg', NULL, N'ip015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13pro-3.jpg', NULL, N'ip015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13promax-1.jpg', NULL, N'ip016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13promax-2.jpg', NULL, N'ip016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone13promax-3.jpg', NULL, N'ip016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone14-1.jpg', NULL, N'ip017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone14-2.jpg', NULL, N'ip017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone14-3.jpg', NULL, N'ip017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone14pro-1.jpg', NULL, N'ip018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone14pro-2.jpg', NULL, N'ip018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone14pro-3.jpg', NULL, N'ip018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone15-1.jpg', NULL, N'ip019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone15-2.jpg', NULL, N'ip019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone15-3.jpg', NULL, N'ip019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone16-1.jpg', NULL, N'ip020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone16-2.jpg', NULL, N'ip020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone16-3.jpg', NULL, N'ip020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone8-1.jpg', NULL, N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone8-2.jpg', NULL, N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone8-3.jpg', NULL, N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone8plus-1.jpg', NULL, N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone8plus-2.jpg', NULL, N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphone8plus-3.jpg', NULL, N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonex-1.jpg', NULL, N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonex-2.jpg', NULL, N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonex-3.jpg', NULL, N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonexs-1.jpg', NULL, N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonexs-2.jpg', NULL, N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonexs-3.jpg', NULL, N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonexsmax-1.jpg', NULL, N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonexsmax-2.jpg', NULL, N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'iphonexsmax-3.jpg', NULL, N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'mi11-1.jpg', NULL, N'xm010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'mi11-2.jpg', NULL, N'xm010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'mi11-3.jpg', NULL, N'xm010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'mi11lite-1.jpg', NULL, N'xm011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'mi11lite-2.jpg', NULL, N'xm011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'mi11lite-3.jpg', NULL, N'xm011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_1_3-1.jpg', NULL, N'n014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_1_3-2.jpg', NULL, N'n014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_1_3-3.jpg', NULL, N'n014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_1_4-1.jpg', NULL, N'n013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_1_4-2.jpg', NULL, N'n013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_1_4-3.jpg', NULL, N'n013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_2_3-1.jpg', NULL, N'n015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_2_3-2.jpg', NULL, N'n015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_2_3-3.jpg', NULL, N'n015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_2_4-1.jpg', NULL, N'n007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_2_4-2.jpg', NULL, N'n007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_2_4-3.jpg', NULL, N'n007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_3_2-1.jpg', NULL, N'n019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_3_2-2.jpg', NULL, N'n019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_3_2-3.jpg', NULL, N'n019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_3_4-1.jpg', NULL, N'n006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_3_4-2.jpg', NULL, N'n006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_3_4-3.jpg', NULL, N'n006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_5_3-1.jpg', NULL, N'n016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_5_3-2.jpg', NULL, N'n016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_5_3-3.jpg', NULL, N'n016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_5_4-1.jpg', NULL, N'n005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_5_4-2.jpg', NULL, N'n005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_5_4-3.jpg', NULL, N'n005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_6_1_plus-1.jpg', NULL, N'n017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_6_1_plus-2.jpg', NULL, N'n017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_6_1_plus-3.jpg', NULL, N'n017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_6_2-1.jpg', NULL, N'n012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_6_2-2.jpg', NULL, N'n012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_6_2-3.jpg', NULL, N'n012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_7_2-1.jpg', NULL, N'n011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_7_2-2.jpg', NULL, N'n011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_7_2-3.jpg', NULL, N'n011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_8_1-1.jpg', NULL, N'n018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_8_1-2.j`pg', NULL, N'n018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_8_1-3.jpg', NULL, N'n018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_8_3-1.jpg', NULL, N'n010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_8_3-2.jpg', NULL, N'n010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_8_3-3.jpg', NULL, N'n010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_c20-1.jpg', NULL, N'n008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_c20-2.jpg', NULL, N'n008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_c20-3.jpg', NULL, N'n008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_c30-1.jpg', NULL, N'n009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_c30-2.jpg', NULL, N'n009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_c30-3.jpg', NULL, N'n009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_g10-1.jpg', NULL, N'n001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_g10-2.jpg', NULL, N'n001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_g10-3.jpg', NULL, N'n001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_g20-1.jpg', NULL, N'n002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_g20-2.jpg', NULL, N'n002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_g20-3.jpg', NULL, N'n002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_x10-1.jpg', NULL, N'n003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_x10-2.jpg', NULL, N'n003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_x10-3.jpg', NULL, N'n003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_x20-1.jpg', NULL, N'n004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_x20-2.jpg', NULL, N'n004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'nokia_x20-3.jpg', NULL, N'n004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'pocom6-1.jpg', NULL, N'xm012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'pocom6-2.jpg', NULL, N'xm012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'pocom6-3.jpg', NULL, N'xm012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmi13-1.jpg', NULL, N'xm019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmi13-2.jpg', NULL, N'xm019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmi13-3.jpg', NULL, N'xm019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmi14c-1.jpg', NULL, N'xm020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmi14c-2.jpg', NULL, N'xm020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmi14c-3.jpg', NULL, N'xm020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmia3-1.jpg', NULL, N'xm013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmia3-2.jpg', NULL, N'xm013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redmia3-3.jpg', NULL, N'xm013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote10-1.jpg', NULL, N'xm016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote10-2.jpg', NULL, N'xm016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote10-3.jpg', NULL, N'xm016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote10s-1.jpg', NULL, N'xm017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote10s-2.jpg', NULL, N'xm017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote10s-3.jpg', NULL, N'xm017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote11-1.jpg', NULL, N'xm018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote11-2.jpg', NULL, N'xm018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote11-3.jpg', NULL, N'xm018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote12-1.jpg', NULL, N'xm008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote12-2.jpg', NULL, N'xm008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote12-3.jpg', NULL, N'xm008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote12pro-1.jpg', NULL, N'xm007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote12pro-2.jpg', NULL, N'xm007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'redminote12pro-3.jpg', NULL, N'xm007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno11-1.jpg', NULL, N'op008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno11-2.jpg', NULL, N'op008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno11-3.jpg', NULL, N'op008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno5-1.jpg', NULL, N'op020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno5-2.jpg', NULL, N'op020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno5-3.jpg', NULL, N'op020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno6-1.jpg', NULL, N'op016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno6-2.jpg', NULL, N'op016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno6-3.jpg', NULL, N'op016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno6pro-1.jpg', NULL, N'op009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno6pro-2.jpg', NULL, N'op009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno6pro-3.jpg', NULL, N'op009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno7z-1.jpg', NULL, N'op004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno7z-2.jpg', NULL, N'op004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno7z-3.jpg', NULL, N'op004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno8pro-1.jpg', NULL, N'op002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno8pro-2.jpg', NULL, N'op002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno8pro-3.jpg', NULL, N'op002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno8t5g-1.jpg', NULL, N'op010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno8t5g-2.jpg', NULL, N'op010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'reno8t5g-3.jpg', NULL, N'op010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v19-1.jpg', NULL, N'vivo008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v19-2.jpg', NULL, N'vivo008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v19-3.jpg', NULL, N'vivo008')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v21_5g-1.jpg', NULL, N'vivo001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v21_5g-2.jpg', NULL, N'vivo001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v21_5g-3.jpg', NULL, N'vivo001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v23_5g-1.jpg', NULL, N'vivo002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v23_5g-2.jpg', NULL, N'vivo002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v23_5g-3.jpg', NULL, N'vivo002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v29e-1.jpg', NULL, N'vivo005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v29e-2.jpg', NULL, N'vivo005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v29e-3.jpg', NULL, N'vivo005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v30-1.jpg', NULL, N'vivo015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v30-2.jpg', NULL, N'vivo015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v30-3.jpg', NULL, N'vivo015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v5s-1.jpg', NULL, N'vivo019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v5s-2.jpg', NULL, N'vivo019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_v5s-3.jpg', NULL, N'vivo019')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x50-1.jpg', NULL, N'vivo010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x50-2.jpg', NULL, N'vivo010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x50-3.jpg', NULL, N'vivo010')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x60_pro-1.jpg', NULL, N'vivo011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x60_pro-2.jpg', NULL, N'vivo011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x60_pro-3.jpg', NULL, N'vivo011')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x70_pro-1.jpg', NULL, N'vivo003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x70_pro-2.jpg', NULL, N'vivo003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x70_pro-3.jpg', NULL, N'vivo003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x80-1.jpg', NULL, N'vivo004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x80-2.jpg', NULL, N'vivo004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_x80-3.jpg', NULL, N'vivo004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y12-1.jpg', NULL, N'vivo012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y12-2.jpg', NULL, N'vivo012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y12-3.jpg', NULL, N'vivo012')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y15-1.jpg', NULL, N'vivo013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y15-2.jpg', NULL, N'vivo013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y15-3.jpg', NULL, N'vivo013')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y15a-1.jpg', NULL, N'vivo014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y15a-2.jpg', NULL, N'vivo014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y15a-3.jpg', NULL, N'vivo014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y17s-1.jpg', NULL, N'vivo018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y17s-2.jpg', NULL, N'vivo018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y17s-3.jpg', NULL, N'vivo018')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y21-1.jpg', NULL, N'vivo007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y21-2.jpg', NULL, N'vivo007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y21-3.jpg', NULL, N'vivo007')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y30-1.jpg', NULL, N'vivo009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y30-2.jpg', NULL, N'vivo009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y30-3.jpg', NULL, N'vivo009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y33s-1.jpg', NULL, N'vivo006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y33s-2.jpg', NULL, N'vivo006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y33s-3.jpg', NULL, N'vivo006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y36-1.jpg', NULL, N'vivo017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y36-2.jpg', NULL, N'vivo017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y36-3.jpg', NULL, N'vivo017')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y55-1.jpg', NULL, N'vivo020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y55-2.jpg', NULL, N'vivo020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y55-3.jpg', NULL, N'vivo020')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y71-1.jpg', NULL, N'vivo016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y71-2.jpg', NULL, N'vivo016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'vivo_y71-3.jpg', NULL, N'vivo016')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi11lite5g-1.jpg', NULL, N'xm015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi11lite5g-2.jpg', NULL, N'xm015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi11lite5g-3.jpg', NULL, N'xm015')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi11tpro-1.jpg', NULL, N'xm009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi11tpro-2.jpg', NULL, N'xm009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi11tpro-3.jpg', NULL, N'xm009')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12-1.jpg', NULL, N'xm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12-2.jpg', NULL, N'xm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12-3.jpg', NULL, N'xm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12pro-1.jpg', NULL, N'xm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12pro-2.jpg', NULL, N'xm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12pro-3.jpg', NULL, N'xm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12t-1.jpg', NULL, N'xm006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12t-2.jpg', NULL, N'xm006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi12t-3.jpg', NULL, N'xm006')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13-1.jpg', NULL, N'xm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13-2.jpg', NULL, N'xm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13-3.jpg', NULL, N'xm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13lite-1.jpg', NULL, N'xm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13lite-2.jpg', NULL, N'xm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13lite-3.jpg', NULL, N'xm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13pro-1.jpg', NULL, N'xm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13pro-2.jpg', NULL, N'xm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi13pro-3.jpg', NULL, N'xm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi14-1.jpg', NULL, N'xm014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi14-2.jpg', NULL, N'xm014')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [ViTri], [MaSanPham]) VALUES (N'xiaomi14-3.jpg', NULL, N'xm014')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH002', N'ip002')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH002', N'n002')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH003', N'n003')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH004', N'ip004')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH004', N'n004')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (3, N'GH005', N'ip005')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (2, N'GH005', N'n005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(8991000.00 AS Decimal(18, 2)), N'HD011', N'ip001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(11950800.00 AS Decimal(18, 2)), N'HD011', N'ip002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, CAST(26991000.00 AS Decimal(18, 2)), N'HD011', N'n001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (3, CAST(11950800.00 AS Decimal(18, 2)), N'HD012', N'ip002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(31270800.00 AS Decimal(18, 2)), N'HD012', N'n002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(14240500.00 AS Decimal(18, 2)), N'HD013', N'ip003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, CAST(47490500.00 AS Decimal(18, 2)), N'HD013', N'n003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(16730700.00 AS Decimal(18, 2)), N'HD014', N'ip004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(52191000.00 AS Decimal(18, 2)), N'HD014', N'n004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, CAST(18390800.00 AS Decimal(18, 2)), N'HD015', N'ip005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(37590600.00 AS Decimal(18, 2)), N'HD015', N'n005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(13491000.00 AS Decimal(18, 2)), N'HD016', N'ip006')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(28490500.00 AS Decimal(18, 2)), N'HD016', N'n006')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, CAST(18990500.00 AS Decimal(18, 2)), N'HD017', N'ip007')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(23240700.00 AS Decimal(18, 2)), N'HD017', N'n007')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(21610600.00 AS Decimal(18, 2)), N'HD018', N'ip008')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, CAST(17991000.00 AS Decimal(18, 2)), N'HD018', N'n008')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(15291000.00 AS Decimal(18, 2)), N'HD019', N'ip009')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(21840500.00 AS Decimal(18, 2)), N'HD019', N'n009')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, CAST(19100900.00 AS Decimal(18, 2)), N'HD020', N'ip010')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, CAST(67991500.00 AS Decimal(18, 2)), N'HD020', N'n010')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Dịch vụ tốt, sản phẩm chất lượng!', 5, N'user11', N'HD011')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Chất lượng sản phẩm không như mong đợi.', 3, N'user13', N'HD013')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Giao hàng nhanh chóng, nhưng sản phẩm bị lỗi.', 2, N'user14', N'HD014')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Tôi không hài lòng với dịch vụ hỗ trợ.', 1, N'user15', N'HD015')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Rất hài lòng, sản phẩm xịn!', 5, N'user16', N'HD016')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Dịch vụ khách hàng rất tốt!', 4, N'user17', N'HD017')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Sản phẩm như mô tả, tôi hài lòng!', 4, N'user18', N'HD018')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Sản phẩm giao chậm nhưng chất lượng ổn.', 3, N'user19', N'HD019')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Chất lượng sản phẩm tốt nhưng giá hơi cao.', 3, N'user20', N'HD020')
GO
INSERT [dbo].[GioHang] ([MaGioHang], [TongTien], [TenDangNhap]) VALUES (N'GH001', CAST(0.00 AS Decimal(18, 2)), N'user06')
GO
INSERT [dbo].[GioHang] ([MaGioHang], [TongTien], [TenDangNhap]) VALUES (N'GH002', CAST(86443200.00 AS Decimal(18, 2)), N'user07')
GO
INSERT [dbo].[GioHang] ([MaGioHang], [TongTien], [TenDangNhap]) VALUES (N'GH003', CAST(75971500.00 AS Decimal(18, 2)), N'user08')
GO
INSERT [dbo].[GioHang] ([MaGioHang], [TongTien], [TenDangNhap]) VALUES (N'GH004', CAST(137843400.00 AS Decimal(18, 2)), N'user09')
GO
INSERT [dbo].[GioHang] ([MaGioHang], [TongTien], [TenDangNhap]) VALUES (N'GH005', CAST(260707200.00 AS Decimal(18, 2)), N'user10')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD011', N'Tiền mặt', NULL, NULL, CAST(N'2024-10-01T00:00:00.000' AS DateTime), N'NV001', N'KH011')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD012', N'Chuyển khoản', NULL, NULL, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'NV002', N'KH012')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD013', N'Thẻ tín dụng', NULL, NULL, CAST(N'2024-10-03T00:00:00.000' AS DateTime), N'NV003', N'KH013')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD014', N'Tiền mặt', NULL, NULL, CAST(N'2024-10-04T00:00:00.000' AS DateTime), N'NV004', N'KH014')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD015', N'Chuyển khoản', NULL, NULL, CAST(N'2024-10-05T00:00:00.000' AS DateTime), N'NV005', N'KH015')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD016', N'Thẻ tín dụng', NULL, NULL, CAST(N'2024-10-06T00:00:00.000' AS DateTime), N'NV001', N'KH016')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD017', N'Tiền mặt', NULL, NULL, CAST(N'2024-10-07T00:00:00.000' AS DateTime), N'NV002', N'KH017')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD018', N'Chuyển khoản', NULL, NULL, CAST(N'2024-10-08T00:00:00.000' AS DateTime), N'NV003', N'KH018')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD019', N'Thẻ tín dụng', NULL, NULL, CAST(N'2024-10-09T00:00:00.000' AS DateTime), N'NV004', N'KH019')
GO
INSERT [dbo].[HoaDonBan] ([MaHoaDon], [PhuongThucThanhToan], [TongTien], [KhuyenMai], [ThoiGianLap], [MaNhanVien], [MaKhachHang]) VALUES (N'HD020', N'Tiền mặt', NULL, NULL, CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'NV005', N'KH020')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH006', N'Nguyễn Văn F', CAST(N'1987-11-15' AS Date), N'0901234566', N'789 Sixth St', N'VIP', N'', NULL, N'user06')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH007', N'Trần Thị G', CAST(N'1991-01-29' AS Date), N'0901234567', N'987 Seventh St', N'VIP', N'', NULL, N'user07')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH008', N'Lê Văn H', CAST(N'1983-03-17' AS Date), N'0901234568', N'111 Eighth St', N'VIP', N'', NULL, N'user08')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH009', N'Phạm Thị I', CAST(N'1998-06-12' AS Date), N'0901234569', N'222 Ninth St', N'VIP', N'', NULL, N'user09')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH010', N'Hoàng Văn J', CAST(N'1994-12-05' AS Date), N'0901234570', N'333 Tenth St', N'VIP', N'', NULL, N'user10')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH011', N'Nguyễn Văn K', CAST(N'1990-07-14' AS Date), N'0901234571', N'444 Eleventh St', N'Regular', N'', NULL, N'user11')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH012', N'Trần Thị L', CAST(N'1986-05-09' AS Date), N'0901234572', N'555 Twelfth St', N'Regular', N'', NULL, N'user12')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH013', N'Lê Văn M', CAST(N'1993-02-22' AS Date), N'0901234573', N'666 Thirteenth St', N'Regular', N'', NULL, N'user13')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH014', N'Phạm Thị N', CAST(N'1989-09-11' AS Date), N'0901234574', N'777 Fourteenth St', N'Regular', N'', NULL, N'user14')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH015', N'Hoàng Văn O', CAST(N'1991-11-23' AS Date), N'0901234575', N'888 Fifteenth St', N'Regular', N'', NULL, N'user15')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH016', N'Nguyễn Văn P', CAST(N'1992-03-10' AS Date), N'0901234576', N'999 Sixteenth St', N'Regular', N'', NULL, N'user16')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH017', N'Trần Thị Q', CAST(N'1985-04-08' AS Date), N'0901234577', N'111 Seventeenth St', N'Regular', N'', NULL, N'user17')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH018', N'Lê Văn R', CAST(N'1997-10-30' AS Date), N'0901234578', N'222 Eighteenth St', N'Regular', N'', NULL, N'user18')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH019', N'Phạm Thị S', CAST(N'1996-08-27' AS Date), N'0901234579', N'333 Nineteenth St', N'Regular', N'', NULL, N'user19')
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'KH020', N'Hoàng Văn T', CAST(N'1993-12-18' AS Date), N'0901234580', N'444 Twentieth St', N'Regular', N'', NULL, N'user20')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'm001', N'xanh')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'm002', N'tim')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'm003', N'den')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'm004', N'vang')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'm005', N'trang')
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [SoDienThoai], [DiaChi], [ChucVu], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'NV001', N'Nguyễn Văn A', CAST(N'1985-02-10' AS Date), N'0909876541', N'123 First St', N'Quản lý', N'', NULL, N'user01')
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [SoDienThoai], [DiaChi], [ChucVu], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'NV002', N'Trần Thị B', CAST(N'1990-06-22' AS Date), N'0909876542', N'456 Second St', N'Nhân viên bán hàng', N'', NULL, N'user02')
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [SoDienThoai], [DiaChi], [ChucVu], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'NV003', N'Lê Văn C', CAST(N'1988-09-15' AS Date), N'0909876543', N'789 Third St', N'Nhân viên kho', N'', NULL, N'user03')
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [SoDienThoai], [DiaChi], [ChucVu], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'NV004', N'Phạm Thị D', CAST(N'1992-11-30' AS Date), N'0909876544', N'321 Fourth St', N'Nhân viên hỗ trợ', N'', NULL, N'user04')
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [SoDienThoai], [DiaChi], [ChucVu], [GhiChu], [AnhDaiDien], [TenDangNhap]) VALUES (N'NV005', N'Hoàng Văn E', CAST(N'1995-04-17' AS Date), N'0909876545', N'654 Fifth St', N'Nhân viên kỹ thuật', N'', NULL, N'user05')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo]) VALUES (N'ro001', N'32GB')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo]) VALUES (N'ro002', N'64GB')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo]) VALUES (N'ro003', N'128GB')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo]) VALUES (N'ro004', N'256GB')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo]) VALUES (N'ro005', N'512GB')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo]) VALUES (N'ro006', N'1TB')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip001', N'iPhone 8', 12, 50, CAST(9990000.00 AS Decimal(18, 2)), CAST(8991000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Apple', N'4.7 inch', N'1821 mAh', N'12 MP', N'138.4 x 67.3 x 7.3 mm', N'Apple A11 Bionic', N'm005', N'6GB', N'ro002', N'iphone8-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip002', N'iPhone 8 Plus', 12, 30, CAST(12990000.00 AS Decimal(18, 2)), CAST(11950800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Apple', N'5.5 inch', N'2691 mAh', N'12 MP', N'158.4 x 78.1 x 7.5 mm', N'Apple A11 Bionic', N'm003', N'6GB', N'ro002', N'iphone8plus-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip003', N'iPhone X', 12, 40, CAST(14990000.00 AS Decimal(18, 2)), CAST(14240500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Apple', N'5.8 inch', N'2716 mAh', N'12 MP', N'143.6 x 70.9 x 7.7 mm', N'Apple A11 Bionic', N'm003', N'6GB', N'ro003', N'iphonex-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip004', N'iPhone XS', 12, 20, CAST(17990000.00 AS Decimal(18, 2)), CAST(16730700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Apple', N'5.8 inch', N'2658 mAh', N'12 MP', N'143.6 x 70.9 x 7.7 mm', N'Apple A12 Bionic', N'm005', N'8GB', N'ro003', N'iphonexs-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip005', N'iPhone XS Max', 12, 25, CAST(19990000.00 AS Decimal(18, 2)), CAST(18390800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Apple', N'6.5 inch', N'3174 mAh', N'12 MP', N'157.5 x 77.4 x 7.7 mm', N'Apple A12 Bionic', N'm002', N'8GB', N'ro003', N'iphonexsmax-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip006', N'iPhone 11', 12, 60, CAST(14990000.00 AS Decimal(18, 2)), CAST(13491000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'3110 mAh', N'12 MP', N'150.9 x 75.7 x 8.3 mm', N'Apple A13 Bionic', N'm003', N'8GB', N'ro003', N'iphone11-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip007', N'iPhone 11 Pro', 12, 35, CAST(19990000.00 AS Decimal(18, 2)), CAST(18990500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Apple', N'5.8 inch', N'3046 mAh', N'12 MP', N'144 x 71.4 x 8.1 mm', N'Apple A13 Bionic', N'm001', N'8GB', N'ro003', N'iphone11pro-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip008', N'iPhone 11 Pro Max', 12, 20, CAST(22990000.00 AS Decimal(18, 2)), CAST(21610600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Apple', N'6.5 inch', N'3969 mAh', N'12 MP', N'158 x 77.8 x 8.1 mm', N'Apple A13 Bionic', N'm004', N'8GB', N'ro003', N'iphone11promax-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip009', N'iPhone 12', 12, 45, CAST(16990000.00 AS Decimal(18, 2)), CAST(15291000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'2815 mAh', N'12 MP', N'146.7 x 71.5 x 7.4 mm', N'Apple A14 Bionic', N'm005', N'8GB', N'ro003', N'iphone12-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip010', N'iPhone 12 Pro', 12, 30, CAST(20990000.00 AS Decimal(18, 2)), CAST(19100900.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'2815 mAh', N'12 MP', N'146.7 x 71.5 x 7.4 mm', N'Apple A14 Bionic', N'm003', N'8GB', N'ro003', N'iphone12pro-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip011', N'iPhone 12 Pro', 12, 30, CAST(21990000.00 AS Decimal(18, 2)), CAST(20450700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'2815 mAh', N'12 MP', N'146.7 x 71.5 x 7.4 mm', N'Apple A14 Bionic', N'm001', N'12GB', N'ro004', N'iphone12pro-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip012', N'iPhone 12 Pro Max', 12, 25, CAST(23990000.00 AS Decimal(18, 2)), CAST(22550600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Apple', N'6.7 inch', N'3687 mAh', N'12 MP', N'160.8 x 78.1 x 7.4 mm', N'Apple A14 Bionic', N'm002', N'12GB', N'ro004', N'iphone12promax-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip013', N'iPhone 13', 12, 55, CAST(19990000.00 AS Decimal(18, 2)), CAST(18390800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'3240 mAh', N'12 MP', N'146.7 x 71.5 x 7.65 mm', N'Apple A15 Bionic', N'm005', N'12GB', N'ro004', N'iphone13-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip014', N'iPhone 13 Mini', 12, 60, CAST(16990000.00 AS Decimal(18, 2)), CAST(15800700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Apple', N'5.4 inch', N'2438 mAh', N'12 MP', N'131.5 x 64.2 x 7.65 mm', N'Apple A15 Bionic', N'm003', N'12GB', N'ro004', N'iphone13mini-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip015', N'iPhone 13 Pro', 12, 35, CAST(23990000.00 AS Decimal(18, 2)), CAST(22550600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'3095 mAh', N'12 MP', N'146.7 x 71.5 x 7.65 mm', N'Apple A15 Bionic', N'm001', N'12GB', N'ro004', N'iphone13pro-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip016', N'iPhone 13 Pro Max', 12, 25, CAST(25990000.00 AS Decimal(18, 2)), CAST(24430600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Apple', N'6.7 inch', N'4352 mAh', N'12 MP', N'160.8 x 78.1 x 7.65 mm', N'Apple A15 Bionic', N'm002', N'12GB', N'ro004', N'iphone13promax-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip017', N'iPhone 14', 12, 50, CAST(21990000.00 AS Decimal(18, 2)), CAST(20450700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'3279 mAh', N'12 MP', N'146.7 x 71.5 x 7.8 mm', N'Apple A15 Bionic', N'm005', N'12GB', N'ro004', N'iphone14-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip018', N'iPhone 14 Pro', 12, 40, CAST(26990000.00 AS Decimal(18, 2)), CAST(24830800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'3200 mAh', N'48 MP', N'147.5 x 71.5 x 7.85 mm', N'Apple A16 Bionic', N'm001', N'12GB', N'ro004', N'iphone14pro-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip019', N'iPhone 15', 12, 60, CAST(23990000.00 AS Decimal(18, 2)), CAST(21591000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'3340 mAh', N'48 MP', N'147.6 x 71.6 x 7.8 mm', N'Apple A16 Bionic', N'm005', N'12GB', N'ro004', N'iphone15-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ip020', N'iPhone 16', 12, 55, CAST(26990000.00 AS Decimal(18, 2)), CAST(25640500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Apple', N'6.1 inch', N'3400 mAh', N'48 MP', N'147.7 x 71.7 x 7.8 mm', N'Apple A17 Pro', N'm005', N'12GB', N'ro004', N'iphone16-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n001', N'Nokia G10', 24, 50, CAST(29990000.00 AS Decimal(18, 2)), CAST(26991000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Nokia', N'6.52 inch', N'5050 mAh', N'13 MP', N'164.9 x 76 x 9.2 mm', N'MediaTek Helio G25', N'm002', N'4GB', N'ro002', N'nokia_g10-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n002', N'Nokia G20', 24, 40, CAST(33990000.00 AS Decimal(18, 2)), CAST(31270800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Nokia', N'6.52 inch', N'5050 mAh', N'48 MP', N'164.9 x 76 x 9.2 mm', N'MediaTek Helio G35', N'm003', N'6GB', N'ro003', N'nokia_g20-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n003', N'Nokia X10', 24, 30, CAST(49990000.00 AS Decimal(18, 2)), CAST(47490500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Nokia', N'6.67 inch', N'4470 mAh', N'48 MP', N'164.9 x 76.2 x 9.1 mm', N'Qualcomm Snapdragon 480', N'm004', N'8GB', N'ro004', N'nokia_x10-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n004', N'Nokia X20', 24, 20, CAST(57990000.00 AS Decimal(18, 2)), CAST(52191000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Nokia', N'6.67 inch', N'4470 mAh', N'64 MP', N'164.9 x 76.3 x 9.1 mm', N'Qualcomm Snapdragon 480', N'm005', N'12GB', N'ro005', N'nokia_x20-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n005', N'Nokia 5.4', 24, 35, CAST(39990000.00 AS Decimal(18, 2)), CAST(37590600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Nokia', N'6.39 inch', N'4000 mAh', N'48 MP', N'161 x 76 x 8.7 mm', N'Qualcomm Snapdragon 662', N'm002', N'8GB', N'ro003', N'nokia_5_4-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n006', N'Nokia 3.4', 24, 45, CAST(29990000.00 AS Decimal(18, 2)), CAST(28490500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Nokia', N'6.39 inch', N'4000 mAh', N'13 MP', N'161 x 76 x 8.7 mm', N'Qualcomm Snapdragon 460', N'm003', N'6GB', N'ro002', N'nokia_3_4-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n007', N'Nokia 2.4', 24, 60, CAST(24990000.00 AS Decimal(18, 2)), CAST(23240700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Nokia', N'6.5 inch', N'4500 mAh', N'13 MP', N'165.9 x 76.3 x 8.7 mm', N'MediaTek Helio P22', N'm004', N'4GB', N'ro002', N'nokia_2_4-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n008', N'Nokia C20', 24, 70, CAST(19990000.00 AS Decimal(18, 2)), CAST(17991000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Nokia', N'6.52 inch', N'3000 mAh', N'5 MP', N'160.9 x 75.8 x 8.8 mm', N'Unisoc SC9863A', N'm005', N'4GB', N'ro001', N'nokia_c20-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n009', N'Nokia C30', 24, 50, CAST(22990000.00 AS Decimal(18, 2)), CAST(21840500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Nokia', N'6.82 inch', N'6000 mAh', N'13 MP', N'174.7 x 79.1 x 9.2 mm', N'Unisoc SC9863A', N'm002', N'6GB', N'ro002', N'nokia_c30-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n010', N'Nokia 8.3 5G', 24, 25, CAST(79990000.00 AS Decimal(18, 2)), CAST(67991500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Nokia', N'6.81 inch', N'4500 mAh', N'64 MP', N'171.9 x 78.6 x 9 mm', N'Qualcomm Snapdragon 765G', N'm003', N'12GB', N'ro005', N'nokia_8_3-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n011', N'Nokia 7.2', 24, 15, CAST(49990000.00 AS Decimal(18, 2)), CAST(45990800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Nokia', N'6.3 inch', N'3500 mAh', N'48 MP', N'159.9 x 75.2 x 8.3 mm', N'Qualcomm Snapdragon 660', N'm004', N'8GB', N'ro004', N'nokia_7_2-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n012', N'Nokia 6.2', 24, 18, CAST(38990000.00 AS Decimal(18, 2)), CAST(35091000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Nokia', N'6.3 inch', N'3500 mAh', N'16 MP', N'159.9 x 75.1 x 8.3 mm', N'Qualcomm Snapdragon 636', N'm005', N'6GB', N'ro003', N'nokia_6_2-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n013', N'Nokia 1.4', 24, 55, CAST(21990000.00 AS Decimal(18, 2)), CAST(20890500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Nokia', N'6.52 inch', N'4000 mAh', N'8 MP', N'166.4 x 76.7 x 8.7 mm', N'Qualcomm Snapdragon 215', N'm002', N'4GB', N'ro001', N'nokia_1_4-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n014', N'Nokia 1.3', 24, 40, CAST(19990000.00 AS Decimal(18, 2)), CAST(17991000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Nokia', N'6.2 inch', N'3000 mAh', N'8 MP', N'157.6 x 75.4 x 8.7 mm', N'Qualcomm Snapdragon 215', N'm003', N'4GB', N'ro001', N'nokia_1_3-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n015', N'Nokia 2.3', 24, 35, CAST(24990000.00 AS Decimal(18, 2)), CAST(23490600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Nokia', N'6.2 inch', N'4000 mAh', N'13 MP', N'157.7 x 75.4 x 8.68 mm', N'MediaTek Helio A22', N'm004', N'6GB', N'ro002', N'nokia_2_3-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n016', N'Nokia 5.3', 24, 20, CAST(34990000.00 AS Decimal(18, 2)), CAST(32190800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Nokia', N'6.55 inch', N'4000 mAh', N'13 MP', N'164.3 x 76.6 x 8.5 mm', N'Qualcomm Snapdragon 665', N'm002', N'8GB', N'ro004', N'nokia_5_3-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n017', N'Nokia 6.1 Plus', 24, 30, CAST(29990000.00 AS Decimal(18, 2)), CAST(26991000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Nokia', N'5.8 inch', N'3060 mAh', N'16 MP', N'147.2 x 71 x 8 mm', N'Qualcomm Snapdragon 636', N'm003', N'6GB', N'ro003', N'nokia_6_1_plus-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n018', N'Nokia 8.1', 24, 12, CAST(69990000.00 AS Decimal(18, 2)), CAST(59491500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Nokia', N'6.18 inch', N'3500 mAh', N'12 MP', N'154.8 x 75.76 x 8 mm', N'Qualcomm Snapdragon 710', N'm002', N'8GB', N'ro004', N'nokia_8_1-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'n019', N'Nokia 2.2', 24, 70, CAST(17990000.00 AS Decimal(18, 2)), CAST(17090500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Nokia', N'5.71 inch', N'3000 mAh', N'13 MP', N'146.2 x 70.56 x 9.3 mm', N'MediaTek Helio A22', N'm004', N'4GB', N'ro002', N'nokia_2_2-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op001', N'Oppo Find X5 Pro', 24, 30, CAST(29990000.00 AS Decimal(18, 2)), CAST(28490500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Oppo', N'6.7 inch', N'5000 mAh', N'50 MP', N'163.7 x 73.9 x 8.5 mm', N'Snapdragon 8 Gen 1', N'm001', N'12GB', N'ro004', N'findx5pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op002', N'Oppo Reno 8 Pro', 24, 40, CAST(18990000.00 AS Decimal(18, 2)), CAST(17091000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.7 inch', N'4500 mAh', N'50 MP', N'161.2 x 74.2 x 7.3 mm', N'Dimensity 8100-Max', N'm002', N'8GB', N'ro004', N'reno8pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op003', N'Oppo A77s', 24, 70, CAST(5990000.00 AS Decimal(18, 2)), CAST(5690500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Oppo', N'6.56 inch', N'5000 mAh', N'48 MP', N'163.8 x 75.1 x 8.0 mm', N'Helio G35', N'm003', N'6GB', N'ro002', N'a77s.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op004', N'Oppo Reno 7 Z 5G', 24, 50, CAST(11990000.00 AS Decimal(18, 2)), CAST(11150700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Oppo', N'6.43 inch', N'4500 mAh', N'64 MP', N'159.9 x 73.2 x 7.5 mm', N'Snapdragon 695', N'm004', N'8GB', N'ro003', N'reno7z.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op005', N'Oppo A96', 24, 60, CAST(7490000.00 AS Decimal(18, 2)), CAST(6741000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.59 inch', N'5000 mAh', N'50 MP', N'164.4 x 75.7 x 8.4 mm', N'Snapdragon 680', N'm001', N'8GB', N'ro002', N'a96.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op006', N'OPPO Find N2 Flip 5G', 24, 20, CAST(36990000.00 AS Decimal(18, 2)), CAST(35140500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Oppo', N'7.1 inch', N'4520 mAh', N'50 MP', N'132.2 x 140.2 x 7.4 mm', N'Snapdragon 8+ Gen 1', N'm002', N'12GB', N'ro004', N'findn2.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op007', N'Oppo A57', 24, 90, CAST(4990000.00 AS Decimal(18, 2)), CAST(4491000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.56 inch', N'5000 mAh', N'13 MP', N'163.8 x 75.1 x 8.0 mm', N'Helio G35', N'm003', N'6GB', N'ro001', N'a57.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op008', N'OPPO Reno11 F 5G', 24, 35, CAST(6990000.00 AS Decimal(18, 2)), CAST(6430800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Oppo', N'6.56 inch', N'5000 mAh', N'48 MP', N'164.0 x 75.1 x 8.0 mm', N'Dimensity 810', N'm005', N'8GB', N'ro003', N'reno11.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op009', N'Oppo Reno 6 Pro 5G', 24, 25, CAST(14990000.00 AS Decimal(18, 2)), CAST(13191200.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'Oppo', N'6.55 inch', N'4500 mAh', N'50 MP', N'160.8 x 72.5 x 7.6 mm', N'Snapdragon 870', N'm004', N'8GB', N'ro003', N'reno6pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op010', N'Oppo Reno 8 T 5G', 24, 45, CAST(10990000.00 AS Decimal(18, 2)), CAST(9891000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.7 inch', N'4800 mAh', N'108 MP', N'162.3 x 74.3 x 7.7 mm', N'Snapdragon 695', N'm002', N'12GB', N'ro003', N'reno8t5g.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op011', N'Oppo Find X3 Pro', 24, 15, CAST(29990000.00 AS Decimal(18, 2)), CAST(28490500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Oppo', N'6.7 inch', N'4500 mAh', N'50 MP', N'163.6 x 74.0 x 8.26 mm', N'Snapdragon 888', N'm003', N'12GB', N'ro004', N'findx3pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op012', N'Oppo A54', 24, 60, CAST(5990000.00 AS Decimal(18, 2)), CAST(5391000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.51 inch', N'5000 mAh', N'13 MP', N'163.6 x 75.7 x 8.4 mm', N'Helio P35', N'm004', N'6GB', N'ro001', N'a54.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op013', N'Oppo A16', 24, 75, CAST(4490000.00 AS Decimal(18, 2)), CAST(4130800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Oppo', N'6.52 inch', N'5000 mAh', N'13 MP', N'163.8 x 75.6 x 8.4 mm', N'Helio G35', N'm003', N'6GB', N'ro001', N'a16.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op014', N'Oppo A18', 24, 50, CAST(12990000.00 AS Decimal(18, 2)), CAST(11691000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.7 inch', N'4500 mAh', N'64 MP', N'162.2 x 74.2 x 7.2 mm', N'Dimensity 920', N'm001', N'8GB', N'ro003', N'a18.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op015', N'Oppo A58', 24, 10, CAST(24990000.00 AS Decimal(18, 2)), CAST(21991200.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'Oppo', N'6.7 inch', N'4260 mAh', N'48 MP', N'165.2 x 74.4 x 8.8 mm', N'Snapdragon 865', N'm002', N'12GB', N'ro004', N'a58.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op016', N'Oppo Reno 6', 24, 40, CAST(10990000.00 AS Decimal(18, 2)), CAST(10220700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Oppo', N'6.43 inch', N'4300 mAh', N'64 MP', N'156.8 x 72.1 x 7.59 mm', N'Dimensity 900', N'm004', N'8GB', N'ro003', N'reno6.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op017', N'Oppo A98', 24, 70, CAST(8490000.00 AS Decimal(18, 2)), CAST(7641000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.43 inch', N'5000 mAh', N'48 MP', N'160.3 x 73.8 x 8.0 mm', N'Snapdragon 662', N'm001', N'8GB', N'ro002', N'a98.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op018', N'Oppo A17K', 24, 85, CAST(4990000.00 AS Decimal(18, 2)), CAST(4590800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Oppo', N'6.56 inch', N'5000 mAh', N'50 MP', N'164.2 x 75.6 x 8.3 mm', N'Helio G35', N'm003', N'6GB', N'ro002', N'a17k.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op019', N'Oppo A78', 24, 50, CAST(7990000.00 AS Decimal(18, 2)), CAST(7191000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Oppo', N'6.56 inch', N'5000 mAh', N'50 MP', N'163.8 x 75.1 x 8.2 mm', N'Dimensity 700', N'm005', N'8GB', N'ro003', N'a78.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'op020', N'Oppo Reno 5', 24, 45, CAST(8990000.00 AS Decimal(18, 2)), CAST(8360700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Oppo', N'6.43 inch', N'4300 mAh', N'64 MP', N'159.1 x 73.3 x 7.7 mm', N'Snapdragon 720G', N'm004', N'8GB', N'ro003', N'reno5.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss001', N'Samsung Galaxy S23', 24, 50, CAST(24990000.00 AS Decimal(18, 2)), CAST(22491000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Samsung', N'6.1 inch', N'3900 mAh', N'50 MP', N'146.3 x 70.9 x 7.6 mm', N'Snapdragon 8 Gen 2', N'm001', N'12GB', N'ro004', N'galaxy_s23-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss002', N'Samsung Galaxy Z Fold 5', 24, 40, CAST(42990000.00 AS Decimal(18, 2)), CAST(39550800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Samsung', N'7.6 inch', N'4400 mAh', N'50 MP', N'129.9 x 155.1 x 6.1 mm', N'Snapdragon 8 Gen 2', N'm002', N'12GB', N'ro004', N'galaxy_zfold5-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss003', N'Samsung Galaxy A54 5G', 24, 70, CAST(10990000.00 AS Decimal(18, 2)), CAST(10440500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Samsung', N'6.4 inch', N'5000 mAh', N'50 MP', N'158.9 x 76.3 x 8.2 mm', N'Exynos 1380', N'm003', N'8GB', N'ro003', N'galaxy_a54-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss004', N'Samsung Galaxy S22 Ultra', 24, 60, CAST(30990000.00 AS Decimal(18, 2)), CAST(28820700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Samsung', N'6.8 inch', N'5000 mAh', N'108 MP', N'163.3 x 77.9 x 8.9 mm', N'Snapdragon 8 Gen 1', N'm004', N'12GB', N'ro005', N'galaxy_s22_ultra-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss005', N'Samsung Galaxy Z Flip 5', 24, 45, CAST(23990000.00 AS Decimal(18, 2)), CAST(22070800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Samsung', N'6.7 inch', N'3700 mAh', N'12 MP', N'165.2 x 71.9 x 6.9 mm', N'Snapdragon 8 Gen 2', N'm005', N'8GB', N'ro003', N'galaxy_zflip5-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss006', N'Samsung Galaxy Note 20 Ultra', 24, 35, CAST(27990000.00 AS Decimal(18, 2)), CAST(24631200.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'Samsung', N'6.9 inch', N'4500 mAh', N'108 MP', N'164.8 x 77.2 x 8.1 mm', N'Exynos 990', N'm001', N'12GB', N'ro005', N'galaxy_note20_ultra-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss007', N'Samsung Galaxy A73 5G', 24, 65, CAST(12490000.00 AS Decimal(18, 2)), CAST(11990400.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'Samsung', N'6.7 inch', N'5000 mAh', N'108 MP', N'163.7 x 76.1 x 7.6 mm', N'Snapdragon 778G', N'm002', N'8GB', N'ro003', N'galaxy_a73-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss008', N'Samsung Galaxy M53 5G', 24, 80, CAST(10990000.00 AS Decimal(18, 2)), CAST(10330600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Samsung', N'6.7 inch', N'5000 mAh', N'108 MP', N'164.7 x 77 x 7.4 mm', N'MediaTek Dimensity 900', N'm003', N'6GB', N'ro002', N'galaxy_m53-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss009', N'Samsung Galaxy S21 FE', 24, 55, CAST(16990000.00 AS Decimal(18, 2)), CAST(15460900.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), N'Samsung', N'6.4 inch', N'4500 mAh', N'12 MP', N'155.7 x 74.5 x 7.9 mm', N'Snapdragon 888', N'm004', N'8GB', N'ro003', N'galaxy_s21_fe-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss010', N'Samsung Galaxy A34 5G', 24, 75, CAST(8990000.00 AS Decimal(18, 2)), CAST(8540500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Samsung', N'6.6 inch', N'5000 mAh', N'48 MP', N'161.3 x 78.1 x 8.2 mm', N'MediaTek Dimensity 1080', N'm002', N'6GB', N'ro002', N'galaxy_a34-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss011', N'Samsung Galaxy Z Fold 4', 24, 30, CAST(42990000.00 AS Decimal(18, 2)), CAST(39980700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Samsung', N'7.6 inch', N'4400 mAh', N'50 MP', N'155.1 x 130.1 x 6.3 mm', N'Snapdragon 8+ Gen 1', N'm001', N'12GB', N'ro005', N'galaxy_zfold4-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss012', N'Samsung Galaxy S21 Ultra', 24, 25, CAST(32990000.00 AS Decimal(18, 2)), CAST(29691000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Samsung', N'6.8 inch', N'5000 mAh', N'108 MP', N'165.1 x 75.6 x 8.9 mm', N'Exynos 2100', N'm002', N'12GB', N'ro005', N'galaxy_s21_ultra-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss013', N'Samsung Galaxy A72', 24, 50, CAST(10990000.00 AS Decimal(18, 2)), CAST(10330600.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'Samsung', N'6.7 inch', N'5000 mAh', N'64 MP', N'165 x 77.4 x 8.4 mm', N'Snapdragon 720G', N'm003', N'8GB', N'ro003', N'galaxy_a72-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss014', N'Samsung Galaxy A52 5G', 24, 65, CAST(10990000.00 AS Decimal(18, 2)), CAST(10440500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Samsung', N'6.5 inch', N'4500 mAh', N'64 MP', N'159.9 x 75.1 x 8.4 mm', N'Snapdragon 750G', N'm001', N'6GB', N'ro003', N'galaxy_a52_5g-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss015', N'Samsung Galaxy S20 FE', 24, 55, CAST(13990000.00 AS Decimal(18, 2)), CAST(12591000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Samsung', N'6.5 inch', N'4500 mAh', N'12 MP', N'159.8 x 74.5 x 8.4 mm', N'Exynos 990', N'm005', N'8GB', N'ro002', N'galaxy_s20_fe-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss016', N'Samsung Galaxy M32', 24, 75, CAST(7490000.00 AS Decimal(18, 2)), CAST(7115500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Samsung', N'6.4 inch', N'6000 mAh', N'64 MP', N'159.3 x 74 x 9.3 mm', N'MediaTek Helio G80', N'm002', N'6GB', N'ro001', N'galaxy_m32-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss017', N'Samsung Galaxy A32', 24, 80, CAST(6990000.00 AS Decimal(18, 2)), CAST(6710400.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'Samsung', N'6.4 inch', N'5000 mAh', N'64 MP', N'158.9 x 73.6 x 8.4 mm', N'MediaTek Helio G80', N'm003', N'6GB', N'ro001', N'galaxy_a32-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss019', N'Samsung Galaxy A12', 24, 60, CAST(6490000.00 AS Decimal(18, 2)), CAST(5970800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Samsung', N'6.5 inch', N'5000 mAh', N'48 MP', N'164 x 75.8 x 8.9 mm', N'MediaTek Helio P35', N'm002', N'6GB', N'ro001', N'galaxy_a12-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss021', N'Samsung Galaxy A05s', 24, 80, CAST(3990000.00 AS Decimal(18, 2)), CAST(3591000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Samsung', N'6.5 inch', N'5000 mAh', N'50 MP', N'167.7 x 77.7 x 9.1 mm', N'Snapdragon 680', N'm004', N'8GB', N'ro002', N'galaxy_a05s-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'ss022', N'Samsung Galaxy S24 Ultra', 24, 50, CAST(31990000.00 AS Decimal(18, 2)), CAST(29430800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Samsung', N'6.8 inch', N'5000 mAh', N'200 MP', N'162.3 x 79 x 8.9 mm', N'Snapdragon 8 Gen 3', N'm005', N'12GB', N'ro003', N'galaxy_s24_ultra-1.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo001', N'Vivo V21 5G', 24, 50, CAST(10990000.00 AS Decimal(18, 2)), CAST(10440500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Vivo', N'6.44 inch', N'4000 mAh', N'64 MP', N'159.7 x 73.9 x 7.3 mm', N'MediaTek Dimensity 800U', N'm001', N'6GB', N'ro002', N'vivo_v21_5g.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo002', N'Vivo V23 5G', 24, 40, CAST(13990000.00 AS Decimal(18, 2)), CAST(12591000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Vivo', N'6.44 inch', N'4200 mAh', N'50 MP', N'157.2 x 73.9 x 7.4 mm', N'MediaTek Dimensity 920', N'm002', N'12GB', N'ro003', N'vivo_v23_5g.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo003', N'Vivo X70 Pro', 24, 30, CAST(24990000.00 AS Decimal(18, 2)), CAST(21241500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Vivo', N'6.56 inch', N'4500 mAh', N'50 MP', N'158.3 x 73.2 x 8.9 mm', N'MediaTek Dimensity 1200', N'm003', N'8GB', N'ro004', N'vivo_x70_pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo004', N'Vivo X80', 24, 50, CAST(21990000.00 AS Decimal(18, 2)), CAST(20890500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Vivo', N'6.56 inch', N'4400 mAh', N'40 MP', N'158.3 x 73.2 x 7.6 mm', N'MediaTek Dimensity 1200', N'm001', N'8GB', N'ro004', N'vivo_x80.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo005', N'Vivo V29e', 24, 60, CAST(10990000.00 AS Decimal(18, 2)), CAST(8792000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Vivo', N'6.44 inch', N'4000 mAh', N'64 MP', N'159.7 x 73.9 x 7.3 mm', N'MediaTek Helio G96', N'm002', N'6GB', N'ro002', N'vivo_v29e.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo006', N'Vivo Y33s', 24, 80, CAST(6990000.00 AS Decimal(18, 2)), CAST(5941500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Vivo', N'6.58 inch', N'5000 mAh', N'50 MP', N'163.6 x 75.2 x 8 mm', N'MediaTek Helio G80', N'm001', N'6GB', N'ro001', N'vivo_y33s.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo007', N'Vivo Y21', 24, 100, CAST(6290000.00 AS Decimal(18, 2)), CAST(5975500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Vivo', N'6.51 inch', N'5000 mAh', N'13 MP', N'164.2 x 76.1 x 8 mm', N'MediaTek Helio P35', N'm003', N'4GB', N'ro001', N'vivo_y21.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo008', N'Vivo V19', 24, 30, CAST(10990000.00 AS Decimal(18, 2)), CAST(9891000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Vivo', N'6.44 inch', N'4500 mAh', N'48 MP', N'159.2 x 75.1 x 8.5 mm', N'Qualcomm Snapdragon 675', N'm002', N'8GB', N'ro003', N'vivo_v19.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo009', N'Vivo Y30', 24, 70, CAST(6490000.00 AS Decimal(18, 2)), CAST(5516500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Vivo', N'6.47 inch', N'5000 mAh', N'13 MP', N'162.04 x 76.61 x 8.00 mm', N'MediaTek Helio P35', N'm001', N'6GB', N'ro002', N'vivo_y30.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo010', N'Vivo X50', 24, 25, CAST(23990000.00 AS Decimal(18, 2)), CAST(22790500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Vivo', N'6.56 inch', N'4200 mAh', N'48 MP', N'158.6 x 73.2 x 7.6 mm', N'Qualcomm Snapdragon 870', N'm003', N'8GB', N'ro004', N'vivo_x50.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo011', N'Vivo X60 Pro', 24, 50, CAST(21990000.00 AS Decimal(18, 2)), CAST(19791000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Vivo', N'6.56 inch', N'4300 mAh', N'48 MP', N'158.6 x 73.2 x 7.3 mm', N'Qualcomm Snapdragon 870', N'm002', N'8GB', N'ro003', N'vivo_x60_pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo012', N'Vivo Y12', 24, 60, CAST(5990000.00 AS Decimal(18, 2)), CAST(5091500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Vivo', N'6.35 inch', N'5000 mAh', N'13 MP', N'159.43 x 76.77 x 8.41 mm', N'MediaTek Helio P22', N'm001', N'4GB', N'ro002', N'vivo_y12.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo013', N'Vivo Y15', 24, 100, CAST(6490000.00 AS Decimal(18, 2)), CAST(5841000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Vivo', N'6.51 inch', N'5000 mAh', N'13 MP', N'163.9 x 75.5 x 8.3 mm', N'MediaTek Helio P35', N'm002', N'6GB', N'ro001', N'vivo_y15.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo014', N'Vivo Y15a', 24, 40, CAST(10990000.00 AS Decimal(18, 2)), CAST(10440500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Vivo', N'5.5 inch', N'3000 mAh', N'20 MP', N'153.8 x 75.7 x 7.6 mm', N'MediaTek MT6750', N'm001', N'6GB', N'ro001', N'vivo_y15a.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo015', N'Vivo V30', 24, 90, CAST(6990000.00 AS Decimal(18, 2)), CAST(5941500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Vivo', N'5.5 inch', N'2500 mAh', N'13 MP', N'153.6 x 75.4 x 7.5 mm', N'Qualcomm Snapdragon 652', N'm002', N'4GB', N'ro001', N'vivo_v30.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo016', N'Vivo Y71', 24, 50, CAST(6490000.00 AS Decimal(18, 2)), CAST(5841000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Vivo', N'6.0 inch', N'3360 mAh', N'13 MP', N'155.9 x 75.7 x 7.8 mm', N'Qualcomm Snapdragon 425', N'm003', N'4GB', N'ro002', N'vivo_y71.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo017', N'Vivo Y36', 24, 100, CAST(5590000.00 AS Decimal(18, 2)), CAST(5310500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Vivo', N'5.0 inch', N'2500 mAh', N'8 MP', N'147.9 x 72.9 x 7.6 mm', N'Qualcomm Snapdragon 425', N'm001', N'6GB', N'ro001', N'vivo_y36.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo018', N'Vivo Y17s', 24, 50, CAST(5290000.00 AS Decimal(18, 2)), CAST(4496500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Vivo', N'5.2 inch', N'2500 mAh', N'8 MP', N'144.5 x 71.4 x 7.6 mm', N'MediaTek MT6737', N'm002', N'4GB', N'ro001', N'vivo_y17s.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo019', N'Vivo V5s', 24, 30, CAST(8990000.00 AS Decimal(18, 2)), CAST(8091000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Vivo', N'5.5 inch', N'3000 mAh', N'20 MP', N'153.8 x 75.7 x 7.6 mm', N'MediaTek MT6750', N'm001', N'6GB', N'ro001', N'vivo_v5s.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'vivo020', N'Vivo Y55', 24, 50, CAST(6590000.00 AS Decimal(18, 2)), CAST(6260500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Vivo', N'5.2 inch', N'2650 mAh', N'13 MP', N'147.9 x 72.9 x 7.5 mm', N'Qualcomm Snapdragon 430', N'm003', N'4GB', N'ro001', N'vivo_y55.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm001', N'Xiaomi 13 Pro', 24, 50, CAST(25990000.00 AS Decimal(18, 2)), CAST(24690500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Xiaomi', N'6.73 inch', N'4820 mAh', N'50 MP', N'152.8 x 71.5 x 8.2 mm', N'Snapdragon 8 Gen 2', N'm001', N'12GB', N'ro004', N'xiaomi13pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm002', N'Xiaomi 13', 24, 70, CAST(22990000.00 AS Decimal(18, 2)), CAST(20691000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Xiaomi', N'6.36 inch', N'4500 mAh', N'50 MP', N'152.8 x 71.5 x 8.1 mm', N'Snapdragon 8 Gen 2', N'm002', N'8GB', N'ro003', N'xiaomi13.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm003', N'Xiaomi 13 Lite', 24, 60, CAST(17990000.00 AS Decimal(18, 2)), CAST(15291500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Xiaomi', N'6.55 inch', N'4500 mAh', N'108 MP', N'152.7 x 71.5 x 7.9 mm', N'Snapdragon 7 Gen 1', N'm003', N'6GB', N'ro002', N'xiaomi13lite.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm004', N'Xiaomi 12 Pro', 24, 40, CAST(23990000.00 AS Decimal(18, 2)), CAST(22790500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Xiaomi', N'6.73 inch', N'4600 mAh', N'50 MP', N'152.7 x 71.5 x 8.2 mm', N'Snapdragon 8 Gen 1', N'm004', N'8GB', N'ro003', N'xiaomi12pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm005', N'Xiaomi 12', 24, 55, CAST(19990000.00 AS Decimal(18, 2)), CAST(17991000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Xiaomi', N'6.28 inch', N'4500 mAh', N'50 MP', N'152.7 x 69.9 x 8.2 mm', N'Snapdragon 8 Gen 1', N'm001', N'12GB', N'ro004', N'xiaomi12.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm006', N'Xiaomi 12T', 24, 50, CAST(18990000.00 AS Decimal(18, 2)), CAST(15192000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Xiaomi', N'6.28 inch', N'4500 mAh', N'50 MP', N'152.7 x 69.9 x 8.2 mm', N'Snapdragon 8 Gen 1', N'm002', N'6GB', N'ro002', N'xiaomi12t.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm007', N'Xiaomi Redmi Note 12 Pro', 24, 80, CAST(10990000.00 AS Decimal(18, 2)), CAST(9341500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'5000 mAh', N'108 MP', N'159.9 x 73.9 x 8.1 mm', N'MediaTek Dimensity 1080', N'm003', N'12GB', N'ro003', N'redminote12pro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm008', N'Xiaomi Redmi Note 12', 24, 75, CAST(7990000.00 AS Decimal(18, 2)), CAST(5992500.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'5000 mAh', N'48 MP', N'159.9 x 73.9 x 8.1 mm', N'MediaTek Dimensity 1080', N'm001', N'12GB', N'ro002', N'redminote12.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm009', N'Xiaomi 11T Pro', 24, 30, CAST(17990000.00 AS Decimal(18, 2)), CAST(16191000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'5000 mAh', N'108 MP', N'164.1 x 76.9 x 8.8 mm', N'Snapdragon 888', N'm002', N'8GB', N'ro003', N'xiaomi11tpro.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm010', N'Xiaomi Mi 11', 24, 65, CAST(15990000.00 AS Decimal(18, 2)), CAST(13591500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Xiaomi', N'6.81 inch', N'4600 mAh', N'108 MP', N'164.3 x 74.6 x 8.1 mm', N'Snapdragon 888', N'm003', N'8GB', N'ro004', N'mi11.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm011', N'Xiaomi Mi 11 Lite', 24, 40, CAST(13990000.00 AS Decimal(18, 2)), CAST(11192000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'4780 mAh', N'108 MP', N'162.6 x 74.8 x 8.9 mm', N'Snapdragon 865', N'm002', N'6GB', N'ro002', N'mi11lite.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm012', N'Xiaomi Poco M6', 24, 50, CAST(10990000.00 AS Decimal(18, 2)), CAST(9891000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'4500 mAh', N'64 MP', N'159.9 x 75.1 x 7.7 mm', N'Snapdragon 870', N'm001', N'12GB', N'ro003', N'pocom6.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm013', N'Xiaomi Redmi A3', 24, 60, CAST(14990000.00 AS Decimal(18, 2)), CAST(12741500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'5500 mAh', N'64 MP', N'162.5 x 75.7 x 8.5 mm', N'MediaTek Dimensity 8100', N'm002', N'6GB', N'ro002', N'redmia3.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm014', N'Xiaomi 14', 24, 35, CAST(24990000.00 AS Decimal(18, 2)), CAST(23740500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'4500 mAh', N'108 MP', N'162.6 x 73.9 x 8.02 mm', N'Snapdragon 888', N'm003', N'8GB', N'ro004', N'xiaomi14.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm015', N'Xiaomi 11 Lite 5G NE', 24, 45, CAST(10990000.00 AS Decimal(18, 2)), CAST(9341500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Xiaomi', N'6.55 inch', N'4250 mAh', N'64 MP', N'158.3 x 88.5 x 6.8 mm', N'Snapdragon 778G', N'm001', N'6GB', N'ro002', N'xiaomi11lite5g.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm016', N'Xiaomi Redmi Note 10', 24, 70, CAST(6990000.00 AS Decimal(18, 2)), CAST(5242500.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), N'Xiaomi', N'6.43 inch', N'5000 mAh', N'48 MP', N'160.5 x 74.5 x 8.3 mm', N'Snapdragon 678', N'm003', N'4GB', N'ro001', N'redminote10.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm017', N'Xiaomi Redmi Note 10S', 24, 50, CAST(8990000.00 AS Decimal(18, 2)), CAST(7641500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Xiaomi', N'6.39 inch', N'3300 mAh', N'48 MP', N'157.5 x 74.67 x 7.61 mm', N'Snapdragon 855', N'm002', N'4GB', N'ro001', N'redminote10s.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm018', N'Xiaomi Redmi Note 11', 24, 30, CAST(14990000.00 AS Decimal(18, 2)), CAST(13491000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'4650 mAh', N'108 MP', N'162.7 x 76.2 x 9.5 mm', N'Snapdragon 888', N'm001', N'6GB', N'ro002', N'redminote11.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm019', N'Xiaomi Redmi 13', 24, 30, CAST(14990000.00 AS Decimal(18, 2)), CAST(13491000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'4650 mAh', N'108 MP', N'162.7 x 76.2 x 9.5 mm', N'Snapdragon 888', N'm002', N'8GB', N'ro004', N'redmi13.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [Hang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [MaMau], [RAM], [MaROM], [AnhDaiDien]) VALUES (N'xm020', N'Xiaomi Redmi 14C', 24, 30, CAST(14990000.00 AS Decimal(18, 2)), CAST(13491000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Xiaomi', N'6.67 inch', N'4650 mAh', N'108 MP', N'162.7 x 76.2 x 9.5 mm', N'Snapdragon 888', N'm001', N'12GB', N'ro004', N'redmi14c.jpg')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user01', N'Ad@123456', N'admin')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user02', N'Ad@123456', N'admin')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user03', N'Ad@123456', N'admin')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user04', N'Ad@123456', N'admin')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user05', N'Ad@123456', N'admin')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user06', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user07', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user08', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user09', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user10', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user11', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user12', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user13', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user14', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user15', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user16', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user17', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user18', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user19', N'Cs@123456', N'customer')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [LoaiTaiKhoan]) VALUES (N'user20', N'Cs@123456', N'customer')
GO
ALTER TABLE [dbo].[AnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_AnhSanPham_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnhSanPham] CHECK CONSTRAINT [FK_AnhSanPham_SanPham]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_GioHang] FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_GioHang]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonBan_HoaDonBan] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDonBan] ([MaHoaDon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan] CHECK CONSTRAINT [FK_ChiTietHoaDonBan_HoaDonBan]
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonBan_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan] CHECK CONSTRAINT [FK_ChiTietHoaDonBan_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_HoaDonBan] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDonBan] ([MaHoaDon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_HoaDonBan]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_TaiKhoan]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_TaiKhoan]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_NhanVien]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_TaiKhoan]
GO
ALTER TABLE [dbo].[LichSuHoatDong]  WITH CHECK ADD  CONSTRAINT [FK_LichSuHoatDong_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[LichSuHoatDong] CHECK CONSTRAINT [FK_LichSuHoatDong_TaiKhoan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_MauSac] FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_MauSac]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ROM] FOREIGN KEY([MaROM])
REFERENCES [dbo].[ROM] ([MaROM])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ROM]
GO
/****** Object:  Trigger [dbo].[theoDoiCustomerGioHang]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[theoDoiCustomerGioHang]
ON [dbo].[ChiTietGioHang]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @LoaiTaiKhoan NVARCHAR(50), @TenDangNhap NVARCHAR(100);
    
    -- Chuyển đổi giá trị SESSION_CONTEXT từ sql_variant sang nvarchar
    SET @LoaiTaiKhoan = CONVERT(NVARCHAR(50), SESSION_CONTEXT(N'LoaiTaiKhoan'));
    SET @TenDangNhap = CONVERT(NVARCHAR(100), SESSION_CONTEXT(N'TenDangNhap'));

    IF @LoaiTaiKhoan = 'customer'
    BEGIN
        -- Thêm vào lịch sử hoạt động
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO LichSuHoatDong (MaHoatDong, LoaiHoatDong, ThoiGianThucHien, GhiChu, TenDangNhap)
            VALUES (NEWID(), 'Thêm hoặc Cập nhật Giỏ hàng', GETDATE(), 'Customer đã thêm hoặc cập nhật sản phẩm trong giỏ hàng', @TenDangNhap);
        END
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO LichSuHoatDong (MaHoatDong, LoaiHoatDong, ThoiGianThucHien, GhiChu, TenDangNhap)
            VALUES (NEWID(), 'Xóa khỏi Giỏ hàng', GETDATE(), 'Customer đã xóa sản phẩm khỏi giỏ hàng', @TenDangNhap);
        END
    END
END;
GO
ALTER TABLE [dbo].[ChiTietGioHang] ENABLE TRIGGER [theoDoiCustomerGioHang]
GO
/****** Object:  Trigger [dbo].[TinhTienHDB]    Script Date: 10/21/2024 7:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TinhTienHDB] on [dbo].[ChiTietHoaDonBan]
for insert, update
as
begin
	declare @mhd nvarchar(10),@msp nvarchar(10)
	select @mhd = MaHoaDon,@msp = MaSanPham from inserted
	update ChiTietHoaDonBan
	set DonGiaCuoi  = s.DonGiaBanRa
	from ChiTietHoaDonBan cthdb
	join inserted on cthdb.MaHoaDon = inserted.MaHoaDon
	join SanPham s on inserted.MaSanPham = s.MaSanPham
	where cthdb.MaHoaDon = @mhd and cthdb.MaSanPham = @msp
end 
GO
ALTER TABLE [dbo].[ChiTietHoaDonBan] ENABLE TRIGGER [TinhTienHDB]
GO
/****** Object:  Trigger [dbo].[theoDoiCustomerDanhGia]    Script Date: 10/21/2024 7:27:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[theoDoiCustomerDanhGia]
ON [dbo].[DanhGia]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @LoaiTaiKhoan NVARCHAR(50), @TenDangNhap NVARCHAR(100);
    
    -- Lấy loại tài khoản và tên đăng nhập từ SESSION_CONTEXT và chuyển đổi kiểu dữ liệu
    SET @LoaiTaiKhoan = CONVERT(NVARCHAR(50), SESSION_CONTEXT(N'LoaiTaiKhoan'));
    SET @TenDangNhap = CONVERT(NVARCHAR(100), SESSION_CONTEXT(N'TenDangNhap'));

    IF @LoaiTaiKhoan = 'customer'
    BEGIN
        -- Thêm vào lịch sử hoạt động
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO LichSuHoatDong (MaHoatDong, LoaiHoatDong, ThoiGianThucHien, GhiChu, TenDangNhap)
            VALUES (NEWID(), 'Thêm hoặc Cập nhật Đánh giá', GETDATE(), 'Customer đã thêm hoặc cập nhật đánh giá', @TenDangNhap);
        END
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO LichSuHoatDong (MaHoatDong, LoaiHoatDong, ThoiGianThucHien, GhiChu, TenDangNhap)
            VALUES (NEWID(), 'Xóa Đánh giá', GETDATE(), 'Customer đã xóa đánh giá', @TenDangNhap);
        END
    END
END;
GO
ALTER TABLE [dbo].[DanhGia] ENABLE TRIGGER [theoDoiCustomerDanhGia]
GO
/****** Object:  Trigger [dbo].[theoDoiCustomerMuaSanPham]    Script Date: 10/21/2024 7:27:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[theoDoiCustomerMuaSanPham]
ON [dbo].[HoaDonBan]
AFTER INSERT
AS
BEGIN
    DECLARE @LoaiTaiKhoan NVARCHAR(50), @TenDangNhap NVARCHAR(100), @MaHoaDon NVARCHAR(50);
    
    -- Lấy loại tài khoản và tên đăng nhập từ SESSION_CONTEXT và chuyển đổi kiểu dữ liệu
    SET @LoaiTaiKhoan = CONVERT(NVARCHAR(50), SESSION_CONTEXT(N'LoaiTaiKhoan'));
    SET @TenDangNhap = CONVERT(NVARCHAR(100), SESSION_CONTEXT(N'TenDangNhap'));

    IF @LoaiTaiKhoan = 'customer'
    BEGIN
        -- Lấy mã hóa đơn từ bảng inserted
        SELECT @MaHoaDon = MaHoaDon FROM inserted;

        -- Ghi vào bảng LichSuHoatDong với chi tiết về hóa đơn mới
        INSERT INTO LichSuHoatDong (MaHoatDong, LoaiHoatDong, ThoiGianThucHien, GhiChu, TenDangNhap)
        VALUES (NEWID(), 'Mua Sản phẩm', GETDATE(), CONCAT('Customer đã mua sản phẩm với Mã hóa đơn: ', @MaHoaDon), @TenDangNhap);
    END
END;
GO
ALTER TABLE [dbo].[HoaDonBan] ENABLE TRIGGER [theoDoiCustomerMuaSanPham]
GO
/****** Object:  Trigger [dbo].[theoDoiAdminSanPham]    Script Date: 10/21/2024 7:27:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[theoDoiAdminSanPham]
ON [dbo].[SanPham]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @LoaiTaiKhoan NVARCHAR(50), @TenDangNhap NVARCHAR(100);
    
    -- Chuyển đổi giá trị SESSION_CONTEXT từ sql_variant sang nvarchar
    SET @LoaiTaiKhoan = CONVERT(NVARCHAR(50), SESSION_CONTEXT(N'LoaiTaiKhoan'));
    SET @TenDangNhap = CONVERT(NVARCHAR(100), SESSION_CONTEXT(N'TenDangNhap'));

    IF @LoaiTaiKhoan = 'admin'
    BEGIN
        -- Thêm vào lịch sử hoạt động
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO LichSuHoatDong (MaHoatDong, LoaiHoatDong, ThoiGianThucHien, GhiChu, TenDangNhap)
            VALUES (NEWID(), 'Thêm hoặc Cập nhật Sản phẩm', GETDATE(), 'Admin đã thêm hoặc cập nhật sản phẩm', @TenDangNhap);
        END
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO LichSuHoatDong (MaHoatDong, LoaiHoatDong, ThoiGianThucHien, GhiChu, TenDangNhap)
            VALUES (NEWID(), 'Xóa Sản phẩm', GETDATE(), 'Admin đã xóa sản phẩm', @TenDangNhap);
        END
    END
END;
GO
ALTER TABLE [dbo].[SanPham] ENABLE TRIGGER [theoDoiAdminSanPham]
GO
