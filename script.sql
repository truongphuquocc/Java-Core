USE [QLSieuThiDienTu]
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 6/2/2024 6:16:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[MaHD] [varchar](6) NOT NULL,
	[MaSP] [varchar](6) NOT NULL,
	[SoLuongBan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 6/2/2024 6:16:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHD] [varchar](6) NOT NULL,
	[MaNV] [varchar](6) NULL,
	[MaKH] [varchar](6) NULL,
	[NgayThanhToan] [date] NULL,
	[PhuongThucThanhToan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 6/2/2024 6:16:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [varchar](6) NOT NULL,
	[TenKH] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAISANPHAM]    Script Date: 6/2/2024 6:16:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAISANPHAM](
	[MaLoaiSP] [varchar](5) NOT NULL,
	[TenLoaiSanPham] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 6/2/2024 6:16:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [varchar](6) NOT NULL,
	[TenNV] [nvarchar](255) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 6/2/2024 6:16:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [varchar](6) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[MaLoaiSP] [varchar](5) NULL,
	[SoLuongTrongKho] [int] NULL,
	[GiaBan] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHITIETHOADON] ([MaHD], [MaSP], [SoLuongBan]) VALUES (N'HD001', N'SP001', 1)
INSERT [dbo].[CHITIETHOADON] ([MaHD], [MaSP], [SoLuongBan]) VALUES (N'HD001', N'SP003', 1)
INSERT [dbo].[CHITIETHOADON] ([MaHD], [MaSP], [SoLuongBan]) VALUES (N'HD002', N'SP002', 2)
INSERT [dbo].[CHITIETHOADON] ([MaHD], [MaSP], [SoLuongBan]) VALUES (N'HD002', N'SP005', 1)
INSERT [dbo].[CHITIETHOADON] ([MaHD], [MaSP], [SoLuongBan]) VALUES (N'HD003', N'SP004', 1)
GO
INSERT [dbo].[HOADON] ([MaHD], [MaNV], [MaKH], [NgayThanhToan], [PhuongThucThanhToan]) VALUES (N'HD001', N'NV001', N'KH001', CAST(N'2023-01-01' AS Date), N'Tien Mat')
INSERT [dbo].[HOADON] ([MaHD], [MaNV], [MaKH], [NgayThanhToan], [PhuongThucThanhToan]) VALUES (N'HD002', N'NV002', N'KH002', CAST(N'2023-02-02' AS Date), N'The Tien Dung')
INSERT [dbo].[HOADON] ([MaHD], [MaNV], [MaKH], [NgayThanhToan], [PhuongThucThanhToan]) VALUES (N'HD003', N'NV003', N'KH003', CAST(N'2023-03-03' AS Date), N'Chuyen Khoan')
INSERT [dbo].[HOADON] ([MaHD], [MaNV], [MaKH], [NgayThanhToan], [PhuongThucThanhToan]) VALUES (N'HD004', N'NV001', N'KH001', CAST(N'2021-01-01' AS Date), N'Tien Mat')
INSERT [dbo].[HOADON] ([MaHD], [MaNV], [MaKH], [NgayThanhToan], [PhuongThucThanhToan]) VALUES (N'HD005', N'NV002', N'KH002', CAST(N'2021-02-02' AS Date), N'The Tien Dung')
INSERT [dbo].[HOADON] ([MaHD], [MaNV], [MaKH], [NgayThanhToan], [PhuongThucThanhToan]) VALUES (N'HD006', N'NV003', N'KH003', CAST(N'2021-03-03' AS Date), N'Tien Mat')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SoDienThoai], [NgaySinh], [DiaChi]) VALUES (N'KH001', N'Nguyen Van A', N'0123456789', CAST(N'1980-01-01' AS Date), N'123 Nguyen Trai, Ha Noi')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SoDienThoai], [NgaySinh], [DiaChi]) VALUES (N'KH002', N'Tran Thi B', N'0987654321', CAST(N'1990-02-02' AS Date), N'456 Le Loi, Ho Chi Minh')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SoDienThoai], [NgaySinh], [DiaChi]) VALUES (N'KH003', N'Le Van C', N'0912345678', CAST(N'1985-03-03' AS Date), N'789 Phan Chau Trinh, Da Nang')
GO
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [TenLoaiSanPham]) VALUES (N'LSP01', N'Dien Thoai')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [TenLoaiSanPham]) VALUES (N'LSP02', N'Laptop')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [TenLoaiSanPham]) VALUES (N'LSP03', N'Tablet')
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi]) VALUES (N'NV001', N'Nguyen Thi D', CAST(N'1985-04-04' AS Date), N'123 Hai Ba Trung, Ha Noi')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi]) VALUES (N'NV002', N'Pham Van E', CAST(N'1990-05-05' AS Date), N'456 Tran Hung Dao, Ho Chi Minh')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi]) VALUES (N'NV003', N'Do Thi F', CAST(N'1995-06-06' AS Date), N'789 Nguyen Hue, Da Nang')
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP001', N'iPhone 12', N'LSP01', 50, CAST(799.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP002', N'Samsung Galaxy S21', N'LSP01', 30, CAST(699.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP003', N'MacBook Pro', N'LSP02', 20, CAST(1299.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP004', N'Dell XPS 13', N'LSP02', 15, CAST(999.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP005', N'iPad Pro', N'LSP03', 25, CAST(899.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP006', N'iPhone 16', N'LSP01', 2, CAST(799.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP007', N'Samsung Galaxy S22', N'LSP01', 1, CAST(699.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP008', N'MacBook Pro 4', N'LSP02', 3, CAST(1299.99 AS Decimal(18, 2)))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MaLoaiSP], [SoLuongTrongKho], [GiaBan]) VALUES (N'SP009', N'Dell XPS 16', N'LSP02', 4, CAST(999.99 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOADON] ([MaHD])
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LOAISANPHAM] ([MaLoaiSP])
GO
