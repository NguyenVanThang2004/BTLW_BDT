--create database BTL_LTW_QLBDT
--USE [BTL_LTW_QLBDT]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 10/27/2024 5:20:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[TenFile] [nvarchar](255) NOT NULL,
	[MaMau] [nvarchar](255) NULL,
	[MaSanPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_AnhSanPham] PRIMARY KEY CLUSTERED 
(
	[TenFile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDonBan]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[DanhGia]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[GioHang]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[Hang]    Script Date: 10/27/2024 5:20:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[LichSuHoatDong]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[MauSac]    Script Date: 10/27/2024 5:20:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [nvarchar](255) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
	[MaSanPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_MauSac] PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Table [dbo].[ROM]    Script Date: 10/27/2024 5:20:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROM](
	[MaROM] [nvarchar](255) NOT NULL,
	[ThongSo] [nvarchar](50) NULL,
	[Gia] [decimal](18, 2) NULL,
	[MaSanPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_ROM] PRIMARY KEY CLUSTERED 
(
	[MaROM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/27/2024 5:20:44 PM ******/
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
	[DanhBa] [nvarchar](255) NULL,
	[DenFlash] [nvarchar](255) NULL,
	[CongNgheManHinh] [nvarchar](255) NULL,
	[DoSangToiDa] [int] NULL,
	[LoaiPin] [nvarchar](255) NULL,
	[BaoMatNangCao] [nvarchar](255) NULL,
	[GhiAmMacDinh] [nvarchar](255) NULL,
	[JackTaiNghe] [nvarchar](255) NULL,
	[MangDiDong] [nvarchar](255) NULL,
	[Sim] [nvarchar](255) NULL,
	[MaHang] [nvarchar](50) NULL,
	[ManHinh] [nvarchar](100) NULL,
	[Pin] [nvarchar](50) NULL,
	[Camera] [nvarchar](50) NULL,
	[KichThuoc] [nvarchar](100) NULL,
	[Chip] [nvarchar](50) NULL,
	[RAM] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](255) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/27/2024 5:20:44 PM ******/
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
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxya05s-1.jpg', N'mss1001', N'ss001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxya05s-2.jpg', N'mss1001', N'ss001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxya05s-3.jpg', N'mss1001', N'ss001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxya15-1.jpg', N'mss2005', N'ss002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxya15-2.jpg', N'mss2005', N'ss002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxya15-3.jpg', N'mss2005', N'ss002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxys24ultra-1.jpg', N'mss3m001', N'ss003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxys24ultra-2.jpg', N'mss3m001', N'ss003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxys24ultra-3.jpg', N'mss3m001', N'ss003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxyzflip6-1.jpg', N'mss4m001', N'ss004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxyzflip6-2.jpg', N'mss4m001', N'ss004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxyzflip6-3.jpg', N'mss4m001', N'ss004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxyzfold6-1', N'mss5m003', N'ss005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxyzfold6-2', N'mss5m003', N'ss005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'galaxyzfold6-3', N'mss5m003', N'ss005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13proden-1.jpg', N'mip35003', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13proden-2.jpg', N'mip35003', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13proden-3.jpg', N'mip35003', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13protrang-1.jpg', N'mip45004', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13protrang-2.jpg', N'mip45004', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13protrang-3.jpg', N'mip45004', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13provang-1.jpg', N'mip55005', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13provang-2.jpg', N'mip55005', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13provang-3.jpg', N'mip55005', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13proxanh-1.jpg', N'mip15001', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13proxanh-2.jpg', N'mip15001', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13proxanh-3.jpg', N'mip15001', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13xanhla-1.jpg', N'mip25002', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13xanhla-2.jpg', N'mip25002', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone13xanhla-3.jpg', N'mip25002', N'ip005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15den-1.jpg', N'mip33003', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15den-2.jpg', N'mip33003', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15den-3.jpg', N'mip33003', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15hong-1.jpg', N'mip23002', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15hong-2.jpg', N'mip23002', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15hong-3.jpg', N'mip23002', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmden-1.jpg', N'mip34003', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmden-2.jpg', N'mip34003', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmden-3.jpg', N'mip34003', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmtrang-1.jpg', N'mip44004', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmtrang-2.jpg', N'mip44004', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmtrang-3.jpg', N'mip44004', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmtt-1.jpg', N'mip54005', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmtt-2.jpg', N'mip54005', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmtt-3.jpg', N'mip54005', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmxanh-1.jpg', N'mip14001', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmxanh-2.jpg', N'mip14001', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15prmxanh-3.jpg', N'mip14001', N'ip004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15vang-1.jpg', N'mip53005', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15vang-2.jpg', N'mip53005', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15vang-3.jpg', N'mip53005', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15xanh-1.jpg', N'mip13001', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15xanh-2.jpg', N'mip13001', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15xanh-3.jpg', N'mip13001', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15xanhla-1.jpg', N'mip43004', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15xanhla-2.jpg', N'mip43004', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone15xanhla-3.jpg', N'mip43004', N'ip003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16den-1.jpg', N'mip32003', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16den-2.jpg', N'mip32003', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16den-3.jpg', N'mip32003', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16hong-1.jpg', N'mip22002', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16hong-2.jpg', N'mip22002', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16hong-3.jpg', N'mip22002', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prm-1.jpg', N'mip11001', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prm-2.jpg', N'mip11001', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prm-3.jpg', N'mip11001', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmden-1.jpg', N'mip31003', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmden-2.jpg', N'mip31003', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmden-3.jpg', N'mip31003', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmsm-1.jpg', N'mip51005', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmsm-2.jpg', N'mip51005', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmsm-3.jpg', N'mip51005', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmtt-1.jpg', N'mip41004', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmtt-2.jpg', N'mip41004', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16prmtt-3.jpg', N'mip41004', N'ip001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16trang-1.jpg', N'mip42004', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16trang-2.jpg', N'mip42004', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16trang-3.jpg', N'mip42004', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16xanh-1.jpg', N'mip12001', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16xanh-2.jpg', N'mip12001', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16xanh-3.jpg', N'mip12001', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16xanhla-1.jpg', N'mip52005', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16xanhla-2.jpg', N'mip52005', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'iphone16xanhla-3.jpg', N'mip52005', N'ip002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppoa3x-1.jpg', N'mop1m001', N'op001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppoa3x-2.jpg', N'mop1m001', N'op001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppoa3x-3.jpg', N'mop1m001', N'op001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppoa60-1.jpg', N'mop2m005', N'op002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppoa60-2.jpg', N'mop2m005', N'op002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppoa60-3.jpg', N'mop2m005', N'op002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppofindn3-1.jpg', N'mop3m004', N'op003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppofindn3-2.jpg', N'mop3m004', N'op003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'oppofindn3-3.jpg', N'mop3m004', N'op003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'opporeno11-1.jpg', N'mop4m005', N'op004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'opporeno11-2.jpg', N'mop4m005', N'op004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'opporeno11-3.jpg', N'mop4m005', N'op004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'opporeno12-1.jpg', N'mop5m004', N'op005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'opporeno12-2.jpg', N'mop5m004', N'op005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'opporeno12-3.jpg', N'mop5m004', N'op005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc51-1.jpg', N'mrm1001', N'rm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc51-2.jpg', N'mrm1001', N'rm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc51-3.jpg', N'mrm1001', N'rm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc60-1.jpg', N'mrm2001', N'rm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc60-2.jpg', N'mrm2001', N'rm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc60-3.jpg', N'mrm2001', N'rm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc65-1.jpg', N'mrm3001', N'rm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc65-2.jpg', N'mrm3001', N'rm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc65-3.jpg', N'mrm3001', N'rm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc67-1.jpg', N'mrm4001', N'rm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc67-2.jpg', N'mrm4001', N'rm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmc67-3.jpg', N'mrm4001', N'rm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmnote20-1.jpg', N'mrm5001', N'rm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmnote20-2.jpg', N'mrm5001', N'rm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'rmnote20-3.jpg', N'mrm5001', N'rm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivov29-1.jpg', N'mvv1001', N'vv001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivov29-2.jpg', N'mvv1001', N'vv001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivov29-3.jpg', N'mvv1001', N'vv001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy17s-1.jpg', N'mvv2001', N'vv002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy17s-2.jpg', N'mvv2001', N'vv002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy17s-3.jpg', N'mvv2001', N'vv002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy18-1.jpg', N'mvv3001', N'vv003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy18-2.jpg', N'mvv3001', N'vv003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy18-3.jpg', N'mvv3001', N'vv003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy28-1.jpg', N'mvv4002', N'vv004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy28-2.jpg', N'mvv4002', N'vv004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy28-3.jpg', N'mvv4002', N'vv004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy36-1.jpg', N'mvv5001', N'vv005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy36-2.jpg', N'mvv5001', N'vv005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'vivoy36-3.jpg', N'mvv5001', N'vv005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14-1.jpg', N'mxm1004', N'xm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14-2.jpg', N'mxm1004', N'xm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14-3.jpg', N'mxm1004', N'xm001')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14c-1.jpg', N'mxm2003', N'xm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14c-2.jpg', N'mxm2003', N'xm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14c-3.jpg', N'mxm2003', N'xm002')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14ultra-1.jpg', N'mxm3003', N'xm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14ultra-2.jpg', N'mxm3003', N'xm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomi14ultra-3.jpg', N'mxm3003', N'xm003')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomia3-1.jpg', N'mxm4001', N'xm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomia3-2.jpg', N'mxm4001', N'xm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaomia3-3.jpg', N'mxm4001', N'xm004')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaominote13-1.jpg', N'mxm5004', N'xm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaominote13-2.jpg', N'mxm5004', N'xm005')
GO
INSERT [dbo].[AnhSanPham] ([TenFile], [MaMau], [MaSanPham]) VALUES (N'xiaominote13-3.jpg', N'mxm5004', N'xm005')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH002', N'ip002')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH002', N'ip004')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH002', N'vv002')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH002', N'xm002')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH003', N'op003')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH003', N'xm003')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH004', N'ip004')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH004', N'ip005')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH004', N'op004')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (1, N'GH004', N'vv004')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (3, N'GH005', N'ip003')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (3, N'GH005', N'ip005')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (2, N'GH005', N'vv005')
GO
INSERT [dbo].[ChiTietGioHang] ([SoLuong], [MaGioHang], [MaSanPham]) VALUES (2, N'GH005', N'xm005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD011', N'ip001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD011', N'ip002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD011', N'ip003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD011', N'ip005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD011', N'vv001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD011', N'vv002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (3, NULL, N'HD012', N'ip002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (3, NULL, N'HD012', N'ip004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD012', N'xm002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD012', N'xm004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD013', N'ip003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD013', N'ip005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD013', N'op003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD013', N'vv003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD014', N'ip004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD014', N'op004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD014', N'vv004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD014', N'xm004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD015', N'ip001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD015', N'ip005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD015', N'op005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD015', N'xm005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD016', N'ip002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD016', N'op002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD016', N'vv003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD016', N'xm001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD017', N'ip003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD017', N'ip004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD017', N'op005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD017', N'vv004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD018', N'ip001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD018', N'ip005')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD018', N'vv001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD018', N'vv002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD019', N'ip003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD019', N'ip004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD019', N'op004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD019', N'vv002')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD020', N'ip001')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (1, NULL, N'HD020', N'ip003')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD020', N'op004')
GO
INSERT [dbo].[ChiTietHoaDonBan] ([SoLuongBan], [DonGiaCuoi], [MaHoaDon], [MaSanPham]) VALUES (2, NULL, N'HD020', N'vv002')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Dịch vụ tốt, sản phẩm chất lượng!', 5, N'user11', N'HD011')
GO
INSERT [dbo].[DanhGia] ([NoiDung], [Rate], [TenDangNhap], [MaHoaDon]) VALUES (N'Dịch vụ tốt, sản phẩm chất lượng!', 5, N'user12', N'HD012')
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
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'ap', N'Apple')
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'op', N'Oppo')
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'rm', N'Realme')
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'ss', N'SamSung')
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'vv', N'Vivo')
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'xm', N'Xiaomi')
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
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip11001', N'xanh', N'ip001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip12001', N'xanh', N'ip002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip13001', N'xanh', N'ip003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip14001', N'xanh', N'ip004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip15001', N'xanh', N'ip005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip21002', N'tím', N'ip001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip22002', N'tím', N'ip002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip23002', N'tím', N'ip003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip24002', N'tím', N'ip004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip25002', N'tím', N'ip005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip31003', N'đen', N'ip001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip32003', N'đen', N'ip002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip33003', N'đen', N'ip003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip34003', N'đen', N'ip004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip35003', N'đen', N'ip005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip41004', N'trắng', N'ip001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip42004', N'trắng', N'ip002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip43004', N'trắng', N'ip003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip44004', N'trắng', N'ip004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip45004', N'trắng', N'ip005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip51005', N'vàng', N'ip001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip52005', N'vàng', N'ip002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip53005', N'vàng', N'ip003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip54005', N'vàng', N'ip004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mip55005', N'vàng', N'ip005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mop1001', N'xanh', N'op001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mop2005', N'vàng', N'op002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mop3004', N'trắng', N'op003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mop4005', N'vàng', N'op004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mop5004', N'trắng', N'op005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mrm1001', N'xanh', N'rm001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mrm2001', N'xanh', N'rm002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mrm3001', N'xanh', N'rm003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mrm4001', N'xanh', N'rm004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mrm5001', N'xanh', N'rm005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mss1001', N'xanh', N'ss001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mss2005', N'vàng', N'ss002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mss3001', N'xanh', N'ss003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mss4001', N'xanh', N'ss004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mss5003', N'đen', N'ss005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mvv1001', N'xanh', N'vv001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mvv2001', N'xanh', N'vv002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mvv3001', N'xanh', N'vv003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mvv4002', N'tím', N'vv004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mvv5001', N'xanh', N'vv005')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mxm1004', N'trắng', N'xm001')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mxm2003', N'đen', N'xm002')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mxm3003', N'đen', N'xm003')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mxm4001', N'xanh', N'xm004')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau], [MaSanPham]) VALUES (N'mxm5004', N'trắng', N'xm005')
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
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip1003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ip001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip1004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'ip001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip1005', N'1TB', CAST(1200000.00 AS Decimal(18, 2)), N'ip001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip2003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ip002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip2004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'ip002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip2005', N'1TB', CAST(1200000.00 AS Decimal(18, 2)), N'ip002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip3003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ip003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip3004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'ip003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip3005', N'1TB', CAST(1200000.00 AS Decimal(18, 2)), N'ip003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip4002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'ip004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip4003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ip004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip4004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'ip004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip5001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'ip005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip5002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'ip005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roip5003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ip005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop1001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'op001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop1002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'op001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop1003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'op001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop2003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'op002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop2004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'op002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop2005', N'1TB', CAST(1200000.00 AS Decimal(18, 2)), N'op002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop3001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'op003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop3002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'op003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop3003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'op003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop4002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'op004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop4003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'op004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop4004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'op004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop5002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'op005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop5003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'op005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roop5004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'op005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm1001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'rm001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm1002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'rm001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm2001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'rm002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm2002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'rm002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm2003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'rm002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm3002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'rm003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm3003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'rm003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm3004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'rm003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm4002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'rm004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm4003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'rm004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm4004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'rm004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm5002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'rm005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm5003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'rm005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rorm5005', N'1TB', CAST(1200000.00 AS Decimal(18, 2)), N'rm005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross1002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'ss001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross1003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ss001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross1004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'ss001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross2002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'ss002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross2003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ss002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross3001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'ss003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross3002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'ss003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross4001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'ss004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross4002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'ss004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross4003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'ss004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross5001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'ss005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'ross5002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'ss005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv1002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'vv001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv1003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'vv001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv1004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'vv001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv2001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'vv002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv2002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'vv002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv2003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'vv002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv3001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'vv003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv3002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'vv003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv3003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'vv003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv4001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'vv004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv4002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'vv004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv4003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'vv004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv5001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'vv005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv5002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'vv005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv5003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'vv005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv5004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'vv005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'rovv5005', N'1TB', CAST(1200000.00 AS Decimal(18, 2)), N'vv005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm1001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'xm001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm1002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'xm001')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm2001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'xm002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm2002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'xm002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm2003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'xm002')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm3001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'xm003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm3002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'xm003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm3003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'xm003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm3004', N'512GB', CAST(1000000.00 AS Decimal(18, 2)), N'xm003')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm4001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'xm004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm4002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'xm004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm4003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'xm004')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm5001', N'64GB', CAST(200000.00 AS Decimal(18, 2)), N'xm005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm5002', N'128GB', CAST(400000.00 AS Decimal(18, 2)), N'xm005')
GO
INSERT [dbo].[ROM] ([MaROM], [ThongSo], [Gia], [MaSanPham]) VALUES (N'roxm5003', N'256GB', CAST(600000.00 AS Decimal(18, 2)), N'xm005')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ip001', N'iPhone 16 Pro Max', 12, 50, CAST(34990000.00 AS Decimal(18, 2)), CAST(36739500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Có', N'Có', N'OLED', 1200, N'Li-ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ap', N'6.7 inch', N'4500 mAh', N'48 MP', N'160.8 x 78.1 x 7.7 mm', N'A16 Bionic', N'12GB', N'ip16prm.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ip002', N'iPhone 16', 12, 100, CAST(30000000.00 AS Decimal(18, 2)), CAST(33000000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'OLED', 1000, N'Li-ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ap', N'6.1 inch', N'4000 mAh', N'12 MP', N'146.7 x 71.5 x 7.7 mm', N'A16 Bionic', N'8GB', N'ip16.png')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ip003', N'iPhone 15', 12, 80, CAST(22990000.00 AS Decimal(18, 2)), CAST(26438500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Có', N'Có', N'OLED', 1000, N'Li-ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ap', N'6.1 inch', N'4000 mAh', N'12 MP', N'146.7 x 71.5 x 7.8 mm', N'A15 Bionic', N'6GB', N'ip15.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ip004', N'iPhone 15 Pro Max', 12, 40, CAST(28390000.00 AS Decimal(18, 2)), CAST(30661200.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'Có', N'Có', N'OLED', 1200, N'Li-ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ap', N'6.7 inch', N'4500 mAh', N'48 MP', N'160.8 x 78.1 x 7.8 mm', N'A15 Bionic', N'8GB', N'ip15prm.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ip005', N'iPhone 13', 12, 120, CAST(11000000.00 AS Decimal(18, 2)), CAST(12320000.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Có', N'Có', N'OLED', 1000, N'Li-ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ap', N'6.1 inch', N'3300 mAh', N'12 MP', N'146.7 x 71.5 x 7.6 mm', N'A14 Bionic', N'4GB', N'ip13.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'op001', N'Oppo A3x', 12, 90, CAST(2599000.00 AS Decimal(18, 2)), CAST(2988850.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Có', N'Có', N'LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'op', N'6.5 inch', N'4230 mAh', N'13 MP', N'163.6 x 75.5 x 8.3 mm', N'MediaTek Helio P60', N'4GB', N'oppoa3x.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'op002', N'Oppo A60', 12, 70, CAST(3990000.00 AS Decimal(18, 2)), CAST(4389000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'op', N'6.56 inch', N'5000 mAh', N'50 MP', N'163.8 x 75.1 x 8.1 mm', N'MediaTek Dimensity 6020', N'8GB', N'oppoa60.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'op003', N'Oppo Find N3', 24, 50, CAST(14990000.00 AS Decimal(18, 2)), CAST(15739500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 1200, N'Li-Ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'op', N'7.1 inch', N'4805 mAh', N'50 MP', N'162.4 x 75.7 x 9.2 mm', N'Snapdragon 8 Gen 2', N'12GB', N'oppo_find_n3.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'op004', N'Oppo Reno 11', 12, 60, CAST(5990000.00 AS Decimal(18, 2)), CAST(6589000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 800, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'op', N'6.7 inch', N'4700 mAh', N'64 MP', N'158.2 x 73.4 x 7.6 mm', N'Snapdragon 778G', N'8GB', N'opporeno11.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'op005', N'Oppo Reno 12', 12, 55, CAST(5590000.00 AS Decimal(18, 2)), CAST(6428500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 900, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'op', N'6.7 inch', N'4500 mAh', N'108 MP', N'160.6 x 73.5 x 8.3 mm', N'MediaTek Dimensity 920', N'8GB', N'opporeno12.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'rm001', N'Realme C51', 12, 100, CAST(2990000.00 AS Decimal(18, 2)), CAST(3438500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'rm', N'6.7 inch', N'5000 mAh', N'50 MP', N'164.2 x 75.6 x 8.1 mm', N'Unisoc T612', N'4GB', N'realme_c51.jpeg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'rm002', N'Realme C60', 12, 80, CAST(2590000.00 AS Decimal(18, 2)), CAST(2849000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'rm', N'6.7 inch', N'5000 mAh', N'50 MP', N'164.2 x 75.6 x 8.1 mm', N'MediaTek Helio G88', N'4GB', N'realme_c60.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'rm003', N'Realme C65', 12, 70, CAST(2890000.00 AS Decimal(18, 2)), CAST(3034500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'rm', N'6.5 inch', N'5000 mAh', N'64 MP', N'164.4 x 75.0 x 8.1 mm', N'MediaTek Helio G85', N'6GB', N'realme_c65.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'rm004', N'Realme C67', 12, 60, CAST(3990000.00 AS Decimal(18, 2)), CAST(4389000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'rm', N'6.6 inch', N'5000 mAh', N'64 MP', N'164.4 x 75.0 x 8.1 mm', N'MediaTek Helio G85', N'6GB', N'realme_c67.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'rm005', N'Realme Note 20', 12, 50, CAST(4990000.00 AS Decimal(18, 2)), CAST(4990000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'rm', N'6.6 inch', N'5000 mAh', N'108 MP', N'159.9 x 75.4 x 8.8 mm', N'MediaTek Dimensity 800', N'8GB', N'realme_note20.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ss001', N'Galaxy A05s', 12, 100, CAST(3500000.00 AS Decimal(18, 2)), CAST(3850000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'PLS LCD', 800, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'ss', N'6.5 inch', N'5000 mAh', N'13 MP', N'165.5 x 76.1 x 9.1 mm', N'Exynos 850', N'4GB', N'galaxya05s.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ss002', N'Galaxy A15', 12, 80, CAST(4000000.00 AS Decimal(18, 2)), CAST(4600000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Có', N'Có', N'TFT LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'ss', N'6.6 inch', N'5000 mAh', N'50 MP', N'167.5 x 76.1 x 8.5 mm', N'Exynos 1330', N'6GB', N'galaxya15.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ss003', N'Galaxy S24 Ultra', 24, 50, CAST(1200000.00 AS Decimal(18, 2)), CAST(1260000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Có', N'Có', N'Dynamic AMOLED', 1750, N'Li-Ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ss', N'6.8 inch', N'5000 mAh', N'200 MP', N'162.3 x 79.3 x 8.9 mm', N'Snapdragon 8 Gen 2', N'12GB', N'galaxys24ultra.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ss004', N'Galaxy Z Flip 6', 12, 30, CAST(999000.00 AS Decimal(18, 2)), CAST(999000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Có', N'Có', N'Dynamic AMOLED', 1200, N'Li-Ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ss', N'6.7 inch', N'3700 mAh', N'12 MP', N'165.2 x 71.9 x 6.9 mm', N'Snapdragon 8 Gen 2', N'8GB', N'galaxyzflip6.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'ss005', N'Galaxy Z Fold 6', 12, 25, CAST(1799000.00 AS Decimal(18, 2)), CAST(1978900.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'Dynamic AMOLED', 1200, N'Li-Ion', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'ss', N'7.6 inch', N'4400 mAh', N'50 MP', N'154.9 x 129.9 x 6.3 mm', N'Snapdragon 8 Gen 2', N'12GB', N'galaxyzfold6.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'vv001', N'Vivo V29', 12, 100, CAST(6000000.00 AS Decimal(18, 2)), CAST(6600000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 1200, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'vv', N'6.7 inch', N'4600 mAh', N'50 MP', N'164.1 x 74.3 x 7.6 mm', N'Snapdragon 778G', N'8GB', N'vivov29.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'vv002', N'Vivo Y17s', 12, 80, CAST(2590000.00 AS Decimal(18, 2)), CAST(2978500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'vv', N'6.56 inch', N'5000 mAh', N'50 MP', N'163.8 x 75.6 x 8.3 mm', N'MediaTek Helio G85', N'4GB', N'vivoy17s.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'vv003', N'Vivo Y18', 12, 70, CAST(5990000.00 AS Decimal(18, 2)), CAST(6708800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'vv', N'6.4 inch', N'5000 mAh', N'50 MP', N'160.7 x 74.2 x 8.4 mm', N'MediaTek Helio G80', N'4GB', N'vivoy18.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'vv004', N'Vivo Y28', 12, 60, CAST(2190000.00 AS Decimal(18, 2)), CAST(2474700.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'vv', N'6.2 inch', N'4000 mAh', N'13 MP', N'144.4 x 72.8 x 8.5 mm', N'MediaTek MT6582', N'1GB', N'vivoy28.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'vv005', N'Vivo Y36', 12, 50, CAST(3990000.00 AS Decimal(18, 2)), CAST(4189500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Có', N'Có', N'IPS LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'vv', N'6.6 inch', N'5000 mAh', N'50 MP', N'161.5 x 75.5 x 8.2 mm', N'MediaTek Helio G88', N'8GB', N'vivoy36.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'xm001', N'Xiaomi 14', 12, 100, CAST(2190900.00 AS Decimal(18, 2)), CAST(2190900.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 1200, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'xm', N'6.73 inch', N'4500 mAh', N'50 MP', N'152.8 x 71.5 x 8.2 mm', N'Snapdragon 8 Gen 2', N'8GB', N'xiaomi_14.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'xm002', N'Xiaomi 14C', 12, 80, CAST(3190000.00 AS Decimal(18, 2)), CAST(3349500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Có', N'Có', N'LCD', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'xm', N'6.67 inch', N'5000 mAh', N'50 MP', N'158.5 x 71.5 x 7.8 mm', N'MediaTek Dimensity 6100+', N'6GB', N'xiaomi_14c.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'xm003', N'Xiaomi 14 Ultra', 12, 70, CAST(29990000.00 AS Decimal(18, 2)), CAST(28490500.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 1200, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'xm', N'6.73 inch', N'5000 mAh', N'200 MP', N'161.1 x 74.3 x 9.6 mm', N'Snapdragon 8 Gen 2', N'12GB', N'xiaomi_14ultra.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'xm004', N'Xiaomi A3', 12, 50, CAST(2490000.00 AS Decimal(18, 2)), CAST(2863500.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 600, N'Li-Po', N'Có', N'Có', N'3.5mm', N'4G', N'Nano SIM', N'xm', N'6.09 inch', N'4030 mAh', N'48 MP', N'153.1 x 71.9 x 8.5 mm', N'Snapdragon 665', N'4GB', N'xiaomi_a3.jpg')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [ThoiGianBaoHanh], [SoLuongTonKho], [DonGiaBanGoc], [DonGiaBanRa], [KhuyenMai], [DanhBa], [DenFlash], [CongNgheManHinh], [DoSangToiDa], [LoaiPin], [BaoMatNangCao], [GhiAmMacDinh], [JackTaiNghe], [MangDiDong], [Sim], [MaHang], [ManHinh], [Pin], [Camera], [KichThuoc], [Chip], [RAM], [AnhDaiDien]) VALUES (N'xm005', N'Xiaomi Note 13', 12, 60, CAST(5290000.00 AS Decimal(18, 2)), CAST(5554500.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Có', N'Có', N'AMOLED', 1200, N'Li-Po', N'Có', N'Có', N'3.5mm', N'5G', N'Nano SIM', N'xm', N'6.67 inch', N'5000 mAh', N'108 MP', N'158.9 x 74.4 x 8.1 mm', N'MediaTek Dimensity 1080', N'8GB', N'xiaomi_note13.jpg')
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
ALTER TABLE [dbo].[MauSac]  WITH CHECK ADD  CONSTRAINT [FK_MauSac_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MauSac] CHECK CONSTRAINT [FK_MauSac_SanPham]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[ROM]  WITH CHECK ADD  CONSTRAINT [FK_ROM_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ROM] CHECK CONSTRAINT [FK_ROM_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Hang] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Hang]
GO
/****** Object:  Trigger [dbo].[theoDoiCustomerGioHang]    Script Date: 10/27/2024 5:20:44 PM ******/
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
/****** Object:  Trigger [dbo].[TinhTienHDB]    Script Date: 10/27/2024 5:20:45 PM ******/
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
/****** Object:  Trigger [dbo].[theoDoiCustomerDanhGia]    Script Date: 10/27/2024 5:20:45 PM ******/
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
/****** Object:  Trigger [dbo].[theoDoiCustomerMuaSanPham]    Script Date: 10/27/2024 5:20:45 PM ******/
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
/****** Object:  Trigger [dbo].[theoDoiAdminSanPham]    Script Date: 10/27/2024 5:20:45 PM ******/
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
