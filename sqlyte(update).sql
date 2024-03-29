USE [master]
GO
/****** Object:  Database [WebAppYte]    Script Date: 1/9/2024 2:46:27 PM ******/
CREATE DATABASE [WebAppYte]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebAppYte', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HE151423\MSSQL\DATA\WebAppYte.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebAppYte_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HE151423\MSSQL\DATA\WebAppYte_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WebAppYte] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebAppYte].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebAppYte] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebAppYte] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebAppYte] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebAppYte] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebAppYte] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebAppYte] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebAppYte] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebAppYte] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebAppYte] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebAppYte] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebAppYte] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebAppYte] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebAppYte] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebAppYte] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebAppYte] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebAppYte] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebAppYte] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebAppYte] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebAppYte] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebAppYte] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebAppYte] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebAppYte] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebAppYte] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebAppYte] SET  MULTI_USER 
GO
ALTER DATABASE [WebAppYte] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebAppYte] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebAppYte] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebAppYte] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebAppYte] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebAppYte] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebAppYte', N'ON'
GO
ALTER DATABASE [WebAppYte] SET QUERY_STORE = OFF
GO
USE [WebAppYte]

GO
/****** Object:  Table [dbo].[GioiTinh]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiTinh](
	[IDGioiTinh] [int] IDENTITY(1,1) NOT NULL,
	[GioiTinh] [nvarchar](6) NULL,
 CONSTRAINT [PK_GioiTinh] PRIMARY KEY CLUSTERED 
(
	[IDGioiTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[IDHoidap] [int] IDENTITY(1,1) NOT NULL,
	[CauHoi] [nvarchar](max) NULL,
	[TraLoi] [nvarchar](max) NULL,
	[IDNguoiDung] [int] NULL,
	[IDQuanTri] [int] NULL,
	[NgayGui] [smalldatetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[IDHoidap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[IDKhoa] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[IDKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichKham]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichKham](
	[IDLichKham] [int] IDENTITY(1,1) NOT NULL,
	[ChuDe] [nvarchar](100) NULL,
	[MoTa] [nvarchar](300) NULL,
	[BatDau] [smalldatetime] NULL,
	[KetThuc] [smalldatetime] NULL,
	[TrangThai] [int] NULL,
	[ZoomInfo] [nvarchar](100) NULL,
	[KetQuaKham] [nvarchar](200) NULL,
	[IDNguoiDung] [int] NULL,
	[IDQuanTri] [int] NULL,
 CONSTRAINT [PK_LichKham] PRIMARY KEY CLUSTERED 
(
	[IDLichKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[IDNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[DienThoai] [nvarchar](max) NULL,
	[TaiKhoan] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[IDGioiTinh] [int] NULL,
	[DiaChiCuThe] [nvarchar](max) NULL,
	[SoCMND] [int] NULL,
	[IDTinh] [int] NULL,
	[NhomMau] [nvarchar](max) NULL,
	[ThongTinKhac] [nvarchar](max) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[IDNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTri]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTri](
	[IDQuanTri] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nchar](50) NULL,
	[MatKhau] [nchar](20) NULL,
	[ThongTinBacSi] [nvarchar](max) NULL,
	[TrinhDo] [nvarchar](50) NULL,
	[IDKhoa] [int] NULL,
	[HoTen] [nvarchar](max) NULL,
	[VaiTro] [int] NULL,
	[AnhBia] [nchar](50) NULL,
	[ThongtinZoom] [nvarchar](100) NULL,
	[TrangThai] [bit] NOT NULL DEFAULT 1,
 CONSTRAINT [PK_QuanTri] PRIMARY KEY CLUSTERED 
(
	[IDQuanTri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solieucovid]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solieudichbenh](
	[IDThongke] [int] IDENTITY(1,1) NOT NULL,
	[Quocgia] [nvarchar](50) NULL,
	[Nam] [int] NULL,
	[Dichbenh] [nchar](50) NULL,
	[Canhiem] [int] NULL,
	[Tuvong] [int] NULL,
 CONSTRAINT [PK_Solieudichbenh] PRIMARY KEY CLUSTERED 
(
	[IDThongke] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhThanh]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanh](
	[IDTinh] [int] IDENTITY(1,1) NOT NULL,
	[TenTinh] [nvarchar](30) NULL,
 CONSTRAINT [PK_TinhThanh] PRIMARY KEY CLUSTERED 
(
	[IDTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tintuc]    Script Date: 1/9/2024 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tintuc](
	[IDTintuc] [int] IDENTITY(1,1) NOT NULL,
	[Tieude] [nvarchar](max) NULL,
	[Noidung] [nvarchar](max) NULL,
	[Hinhanh] [nvarchar](100) NULL,
	[Mota] [nvarchar](max) NULL,
	[Ngaydang] [smalldatetime] NULL,
	[TheLoai] [nchar](20) NULL,
 CONSTRAINT [PK_Tintuc] PRIMARY KEY CLUSTERED 
(
	[IDTintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE TABLE [dbo].[DanhGia](
    [IDDanhGia] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[IDDanhGiaChatLuong] [int] NULL,
	[IDNguoiDung] [int] NULL,
	[IDQuanTri] [int] NULL,
	[IDLichKham] [int] NULL,
	 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[IDDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[DanhGiaChatLuong](
    [IDDanhGiaChatLuong] [int] IDENTITY(1,1) NOT NULL,
	[DanhGiaChatLuong] [nvarchar](10) NULL
 CONSTRAINT [PK_KetQuaDanhGia] PRIMARY KEY CLUSTERED 
(
	[IDDanhGiaChatLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DanhGiaChatLuong] ON 

INSERT [dbo].[DanhGiaChatLuong] ([IDDanhGiaChatLuong], [DanhGiaChatLuong]) VALUES (1, N'Tốt')
INSERT [dbo].[DanhGiaChatLuong] ([IDDanhGiaChatLuong], [DanhGiaChatLuong]) VALUES (2, N'Tệ')
INSERT [dbo].[DanhGiaChatLuong] ([IDDanhGiaChatLuong], [DanhGiaChatLuong]) VALUES (3, N'Hài lòng')
SET IDENTITY_INSERT [dbo].[DanhGiaChatLuong] OFF
GO 
SET IDENTITY_INSERT [dbo].[DanhGia] ON
INSERT [dbo].[DanhGia] ([IDDanhGia], [NoiDung], [IDDanhGiaChatLuong], [IDNguoiDung], [IDQuanTri]) VALUES (1, N'Khám rất chi tiết', 1, 1, 3)
INSERT [dbo].[DanhGia] ([IDDanhGia], [NoiDung], [IDDanhGiaChatLuong], [IDNguoiDung], [IDQuanTri]) VALUES (2, N'Khám chưa tốt', 2, 1, 2)
INSERT [dbo].[DanhGia] ([IDDanhGia], [NoiDung], [IDDanhGiaChatLuong], [IDNguoiDung], [IDQuanTri]) VALUES (3, N'Bác sĩ khám chuẩn bệnh', 3, 1, 3)
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[GioiTinh] ON 

INSERT [dbo].[GioiTinh] ([IDGioiTinh], [GioiTinh]) VALUES (1, N'Nam')
INSERT [dbo].[GioiTinh] ([IDGioiTinh], [GioiTinh]) VALUES (2, N'Nữ')
INSERT [dbo].[GioiTinh] ([IDGioiTinh], [GioiTinh]) VALUES (3, N'Khác')
SET IDENTITY_INSERT [dbo].[GioiTinh] OFF
GO
SET IDENTITY_INSERT [dbo].[HoiDap] ON 

INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (3010, N'Cách phòng tránh dịch bệnh chân tay miệng', N'Nên rửa tay sát khuẩn thường xuyên', 1, 3, CAST(N'2020-07-04T09:04:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (3014, N'Cách phòng tránh dịch bệnh Côvid', N'Nên rửa tay sát khuẩn thường xuyên', 1, 2, CAST(N'2020-07-03T16:39:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (3015, N'Virus thường lây bệnh qua người bằng con đường nào, thời gian lây bệnh đến phát bệnh trong thời gian bao lâu?', N'Virus này lây qua đường không khí, qua giọt bắn nước bọt, qua vật dụng, thời gian ủ bệnh là 14 ngày.', 1, 3, CAST(N'2020-07-03T17:17:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4009, N'Xin bác sĩ cho biết, biểu hiện sớm nhất của bệnh sốt virus là gì, và phân biệt thế nào với các bệnh bình thường khác ạ?', N'Theo hiểu biết hiện nay, kể từ khi người bệnh nhiễm bệnh có thể sớm hơn hoặc nhiều nhất là 1-2 ngày mới có triệu chứng. Các triệu chứng điển hình như sốt, ho, khó thở...', 1, 2, CAST(N'2020-07-04T09:04:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4010, N'Hỏi đáp Khẩu trang y tế bình thường có khả năng cản virus như thế nào?', N'Hiện nay khẩu trang y tế được sử dụng trong việc phòng chống bệnh truyền nhiễm, kể cả bệnh do nCoV. Bộ Y tế khuyến cáo khẩu trang y tế thông thường sử dụng tốt cho người có nguy cơ như làm việc ở cửa khẩu, làm việc ở bệnh viện, đi đến nơi đông người. Khẩu trang N95 sử dụng tốt cho người đi vào ổ dịch, người chăm sóc bệnh nhân tại ổ dịch.', 2, 2, CAST(N'2020-07-04T09:07:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4011, N'Nhóm độ tuổi nào dễ bị mắc chủng mới của virus corona?', N'Người dân ở mọi lứa tuổi đều có thể bị mắc chủng mới của virus corona. Tuy nhiên, người cao tuổi, người có bệnh mãn tính (như hen phế quản, tiểu đường, bệnh tim mạch,…) sẽ dễ bị mắc và bệnh thường nặng hơn. Nguồn: http://thanhtra.com.vn/', 2, 2, CAST(N'2020-07-04T09:09:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4012, N'Cơ chế nCoV lây lan như thế nào?     ', N'Vi-rút này ban đầu xuất hiện từ nguồn động vật nhưng có khả năng lây lan từ người sang người. Điều quan trọng cần lưu ý là sự lây lan từ người sang người có thể xảy ra liên tục. Ở người, virus lây từ người này sang người kia thông qua tiếp xúc với dịch cơ thể của người bệnh. Tùy thuộc vào mức độ lây lan của chủng virus, việc ho, hắt hơi hay bắt tay có thể khiến người xung quanh bị phơi nhiễm. Virus cũng có thể bị lây từ việc ai đó chạm tay vào một vật mà người bệnh chạm vào, sau đó đưa lên miệng, mũi, mắt họ. Những người chăm sóc bệnh nhân cũng có thể bị phơi nhiễm virus khi xử lý các chất thải của người bệnh. Nguồn: https://suckhoedoisong.vn/', 2, 2, CAST(N'2020-07-04T09:10:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (7010, N'Tôi bị sốt liệu rằng có nhiễm CORONA không ?', N'            Không . Điều đó bình thuờng.', 1, NULL, CAST(N'2020-07-05T18:01:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (7019, N'tôi thức khuya ảnh hưởng sức khỏe ko ?', NULL, 1, NULL, CAST(N'2020-07-05T23:49:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (7020, N'Tôi muốn hỏi khi nào có thể tới khám?', NULL, 1, NULL, CAST(N'2020-07-06T01:50:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8020, N'tối muốn hỏi bác sĩ', NULL, 2005, NULL, CAST(N'2020-07-06T10:23:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8021, N'Tôi muốn tư vấn về sức khở.', N'Được mời bạn qua trung tâm hoặc để lại số điện thoại', 1, NULL, CAST(N'2020-07-06T12:02:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8022, N'Số liệu covid', N'400 người nhiễm covid .', 2, NULL, CAST(N'2020-07-06T12:12:00' AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[HoiDap] OFF
GO
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (1, N'Hô hấp', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (2, N'Tai - Mũi - Họng', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (3, N'Mắt', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (4, N'Da liễu', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (5, N'Bệnh Nhiệt Đới', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (6, N'Hỗ trợ COVID-19', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (7, N'Quản lý', NULL)
SET IDENTITY_INSERT [dbo].[Khoa] OFF
GO
SET IDENTITY_INSERT [dbo].[LichKham] ON 

INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (1, N'Tối muốn tư vấn về sức khỏe', NULL, CAST(N'2020-07-06T09:10:00' AS SmallDateTime), CAST(N'2020-07-06T09:20:00' AS SmallDateTime), 2, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09                                  ', N'Bình thường                                                                                                                                                                                             ', 1, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (2, N'khám bệnh', NULL, CAST(N'2020-07-06T11:16:00' AS SmallDateTime), CAST(N'2020-07-06T11:20:00' AS SmallDateTime), 2, NULL, NULL, 1, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (11, N' Tôi muốn tư vấn sức khỏe.', NULL, CAST(N'2020-07-06T12:05:00' AS SmallDateTime), CAST(N'2020-07-06T12:10:00' AS SmallDateTime), 2, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09                                  ', N'Trạng thái bình thường                                                                                                                                                                                  ', 1, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (12, N'Tôi muốn tư vấn sức khỏe.', NULL, CAST(N'2020-07-06T12:13:00' AS SmallDateTime), NULL, 1, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09                                  ', NULL, 2, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (13, N'Tôi  muốn tư vấn 2', NULL, CAST(N'2020-07-06T12:16:00' AS SmallDateTime), CAST(N'2020-07-06T12:18:00' AS SmallDateTime), 2, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09	                                 ', N'Bình thường                                                                                                                                                                                             ', 2, 3)
SET IDENTITY_INSERT [dbo].[LichKham] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (1, N'Phạm Cương', N'phamduycuong2k1@gmail.com                                                                                 ', N'0812883636          ', N'Cuongyd1                                          ', N'123456              ', 1, N'Định tân - Yên Định', 123456789, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2, N'Bệnh nhân', NULL, NULL, N'benhnhan                                          ', N'123456              ', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (1003, N'Phạm Cương', N'phamduycuong2k1@gmail.com                                                                              ', N'0812883636          ', N'admin                                             ', NULL, 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2003, N'Phạm Cương', N'phamduycuong2k1@gmail.com                                                                                ', N'0812883636          ', N'khach1                                            ', N'123456              ', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2004, N'Phạm Cương', N'admin1@gmail.com                                                                                    ', N'0812883636          ', N'Cuong111                                          ', N'123456              ', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2005, N'Phạm Cương', N'Admin222@gmail.com                                                                                  ', N'0812883636          ', N'Cuongyd1111                                       ', N'123456              ', 2, NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[QuanTri] ON 

INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (2, N'admin                                             ', N'123456              ', NULL, N'', 7, N'Phạm Văn Cương', 1, NULL, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09')
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (3, N'Bacsy                                             ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa TP Hà Nội', N'Thạc sỹ', 6, N'BS CK I Nguyễn Văn Hòa', 2, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (4, N'Bacsy2                                            ', N'123456              ', N'Đang làm việc tại bệnh viện Bạch Mai', N'Thạc Sỹ', 1, N'BS Hoa', 2, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (1004, N'Bacsy3                                            ', N'123456              ', N'Đang làm việc tại bệnh viện Hồng Ngọc', N'Thạc sỹ', 2, N'BS Trang', 2, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (1005, N'Bacsy4                                            ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Hà Nội', N'Thạc sỹ', 3, N'BS Cường', 2, NULL, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09')
SET IDENTITY_INSERT [dbo].[QuanTri] OFF
GO
SET IDENTITY_INSERT [dbo].[Solieudichbenh] ON 

INSERT [dbo].[Solieudichbenh] ([IDThongke], [Quocgia], [Nam], [Dichbenh], [Canhiem], [Tuvong]) VALUES (1, N'VIỆT NAM', 2024, N'bệnh dại', 45, 23)
INSERT [dbo].[Solieudichbenh] ([IDThongke], [Quocgia], [Nam], [Dichbenh], [Canhiem], [Tuvong]) VALUES (2, N'VIỆT NAM', 2024, N'COVID-19', 419, null )
INSERT [dbo].[Solieudichbenh] ([IDThongke], [Quocgia], [Nam], [Dichbenh], [Canhiem], [Tuvong]) VALUES (3, N'THẾ GIỚI', 2024, N'COVID-19', 70000, 10000)
SET IDENTITY_INSERT [dbo].[Solieudichbenh] OFF
GO
SET IDENTITY_INSERT TinhThanh ON;
INSERT [dbo].[TinhThanh] ([IDTinh], [TenTinh]) VALUES
(1, N'An Giang'),
(2, N'Bà Rịa–Vũng Tàu'),
(3, N'Bạc Liêu'),
(4, N'Bắc Kạn'),
(5, N'Bắc Giang'),
(6, N'Bắc Ninh'),
(7, N'Bến Tre'),
(8, N'Bình Dương'),
(9, N'Bình Định'),
(10, N'Bình Phước'),
(11, N'Bình Thuận'),
(12, N'Cà Mau'),
(13, N'Cao Bằng'),
(14, N'Cần Thơ'), 
(15, N'Đà Nẵng'), 
(16, N'Đắk Lắk'),
(17, N'Đắk Nông'),
(18, N'Điện Biên'),
(19, N'Đồng Nai'),
(20, N'Đồng Tháp'),
(21, N'Gia Lai'),
(22, N'Hà Giang'),
(23, N'Hà Nam'),
(24, N'Hà Nội'), 
(25, N'Hà Tĩnh'),
(26, N'Hải Dương'),
(27, N'Hải Phòng'), 
(28, N'Hậu Giang'),
(29, N'Hòa Bình'),
(30, N'Hưng Yên'),
(31, N'Khánh Hòa'),
(32, N'Kiên Giang'),
(33, N'Kon Tum'),
(34, N'Lai Châu'),
(35, N'Lâm Đồng'),
(36, N'Lạng Sơn'),
(37, N'Lào Cai'),
(38, N'Long An'),
(39, N'Nam Định'),
(40, N'Nghệ An'),
(41, N'Ninh Bình'),
(42, N'Ninh Thuận'),
(43, N'Phú Thọ'),
(44, N'Phú Yên'),
(45, N'Quảng Bình'),
(46, N'Quảng Nam'),
(47, N'Quảng Ngãi'),
(48, N'Quảng Ninh'),
(49, N'Quảng Trị'),
(50, N'Sóc Trăng'),
(51, N'Sơn La'),
(52, N'Tây Ninh'),
(53, N'Thái Bình'),
(54, N'Thái Nguyên'),
(55, N'Thanh Hóa'),
(56, N'Thừa Thiên Huế'),
(57, N'Tiền Giang'),
(58, N'TP Hồ Chí Minh'), 
(59, N'Trà Vinh'),
(60, N'Tuyên Quang'),
(61, N'Vĩnh Long'),
(62, N'Vĩnh Phúc'),
(63, N'Yên Bái');
SET IDENTITY_INSERT TinhThanh OFF;
GO
SET IDENTITY_INSERT [dbo].[Tintuc] ON 

INSERT [dbo].[Tintuc] ([IDTintuc], [Tieude], [Noidung], [Hinhanh], [Mota], [Ngaydang], [TheLoai]) VALUES (1, N'Bộ Y tế triển khai công tác phòng, chống dịch bệnh năm 2024', N'<p>(25/01/2024 | 11:45 AM)</p>

<p><strong>Sáng ngày 24/01/2024, Bộ Y tế tổ chức hội nghị trực tuyến triển khai công tác phòng, chống dịch bệnh truyền nhiễm.</strong></p>

<p>Tham dự hội nghị có Bộ trưởng Bộ Y tế Đào Hồng Lan; Thứ trưởng Bộ Y tế Nguyễn Thị Liên Hương; đại diện một số Vụ, Cục, Viện, Văn phòng Bộ Y tế; các Bộ/ban/ngành; đại diện Sở Y tế, Trung tâm Kiểm soát bệnh tật, Trung tâm Kiểm dịch y tế biên giới; các cơ quan báo chí, truyền hình thông tấn Trung ương và địa phương dự đưa tin.</p>

<p>&nbsp;</p>

<p><iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" frameborder="0" height="315" src="https://www.youtube.com/embed/NQX8FXo60c8?si=2OhswjA6Kkg4ZeIt" title="YouTube video player" width="560"></iframe></p>

<p>&nbsp;</p>

<p><strong>Nguồn Cổng thông tin điện tử Bộ Y tế</strong></p>
', N'/Images/images/truyen-nhiem.jpg', N' Bộ Y tế triển khai công tác phòng, chống dịch bệnh năm 2024', CAST(N'2024-01-25T00:00:00' AS SmallDateTime), N'new                 ')
INSERT [dbo].[Tintuc] ([IDTintuc], [Tieude], [Noidung], [Hinhanh], [Mota], [Ngaydang], [TheLoai]) VALUES (2, N'Ca mắc cúm A diễn biến nặng tăng cao, nhiều người vẫn chủ quan', N'<h3>Nhiều người dân khi có triệu chứng của cúm A vẫn chủ quan cho rằng chỉ là bệnh cúm nên không đáng lo ngại. Khi có dấu hiệu trở nặng mới đi khám tại các cơ sở y tế.</h3>

<p>(11/01/2024 | 08:41 AM)</p>

<p><strong>Thời gian gần đây, tại một số bệnh viện trên địa bàn TP. Hà Nội đã tiếp nhận nhiều bệnh nhân đủ mọi lứa tuổi đến khám vì có các triệu chứng cúm. Sau khi được xét nghiệm, không ít người được chẩn đoán mắc cúm A.</strong></p>

<p>Bệnh viện Bệnh Nhiệt đới Trung ương đã tiếp nhận nhiều trường hợp nhiễm cúm A, chỉ sau ít ngày đã phải đặt ống thở máy vì tình trạng suy hô hấp diễn biến nặng. Có trường hợp phổi trắng xóa trên phim chụp X-quang, tổn thương phổi tới 60%.</p>

<p>&nbsp;</p>

<p>Với thực trạng nêu trên, nhưng nhiều người dân khi có triệu chứng của cúm A vẫn chủ quan cho rằng chỉ là bệnh cúm nên không đáng lo ngại. Khi bệnh có dấu hiệu trở nặng mới đi khám tại các cơ sở y tế..&nbsp;</p>


<p><img alt="Bệnh viện Bệnh Nhiệt đới Trung ương đã tiếp nhận nhiều trường hợp nhiễm cúm A, chỉ sau ít ngày đã phải đặt ống thở máy vì tình trạng suy hô hấp diễn biến nặng. Ảnh: Quỳnh Mai." id="img_05371260-3e81-11ea-a16d-7169e0724d02" src="https://suckhoedoisong.qltns.mediacdn.vn/thumb_w/640/324455921873985536/2024/1/10/cum-a-17048631782501461323197.jpg" title="Bệnh viện Bệnh Nhiệt đới Trung ương đã tiếp nhận nhiều trường hợp nhiễm cúm A, chỉ sau ít ngày đã phải đặt ống thở máy vì tình trạng suy hô hấp diễn biến nặng. Ảnh: Quỳnh Mai." /></p>

<p>Chị Lê Thị Thu Trang (Hoài Đức, Hà Nội) cho biết, bé nhà chị 10 tháng tuổi, bị mắc cúm A, đang phải điều trị tại Trung tâm Quốc tế của Bệnh viện Nhi Trung ương.</p>

<p>Cách đây khoảng 1 tuần, bé có biểu hiện sốt cao liên tục không thuyên giảm sau 2 ngày, chị cho bé đi khám ở phòng khám tư thì được bác sĩ kết luận mắc cúm A.</p>

<p>Tại Bệnh viện Nhi Trung ương, bé được kết luận bội nhiễm do mắc cúm A nên phải nằm viện để điều trị bằng kháng sinh liều cao.</p>

<p>"Trước đó chồng tôi bị mắc cúm A nhưng cứ nghĩ cảm cúm thông thường nên cũng không đi khám. Sau 4 ngày bệnh không đỡ, đi khám thì mới biết mắc cúm A nên có thể bé bị lây từ bố. Cho con vào viện tôi mới được biết trên thị trường có bán kit test cúm A. Nếu biết trước tôi đã mua về test cho chồng để có hướng cách ly và điều trị kịp thời, tránh lây sang cho con. Chứ để con bị bệnh lâu thế này sốt ruột lắm", chị Thu Trang chia sẻ.</p>

<p>"Dù sao cũng là bệnh cúm, tôi nghĩ trong nhà mà có người có triệu chứng của bệnh cúm thì cứ đeo khẩu trang, nếu bệnh không đỡ thì đi bệnh viện khám. Còn nếu đã có biểu hiện của bệnh cúm thì chỉ có thể là COVID-19 hoặc cúm A, cúm B hoặc cảm cúm thông thường. Cứ vài ngày điều trị triệu chứng, ăn uống tốt để tăng sức đề kháng là được, còn nếu thấy mệt quá thì đi viện", chị Thủy ở quận Thanh Xuân nói.</p>

<p>Thực tế ghi nhận tại các hiệu thuốc trên địa bàn TP. Hà Nội, nhiều cửa hàng cho biết, kit test cúm A bán rất chậm, nhiều người có triệu chứng cúm sẽ chỉ đến để tự kê thuốc về uống./.</p>

<p><em>Nguồn: Suckhoedoisong.vn</em></p>
', N'/Images/images/phong-chong-cum.jpg', N'Ca mắc cúm A diễn biến nặng tăng cao, nhiều người vẫn chủ quan', CAST(N'2024-01-11T00:00:00' AS SmallDateTime), N'hot                 ')
INSERT [dbo].[Tintuc] ([IDTintuc], [Tieude], [Noidung], [Hinhanh], [Mota], [Ngaydang], [TheLoai]) VALUES (1002, N'Bộ Y tế: Thời tiết thay đổi bất thường tiềm ẩn nguy cơ gia tăng các dịch bệnh truyền nhiễm', N'<h3>Theo Bộ Y tế thời gian tới, nhu cầu giao thương, du lịch tăng cao, cùng diễn biến thời tiết thay đổi bất thường là điều kiện thuận lợi cho các tác nhân gây bệnh lây lan, làm gia tăng số mắc, nhất là với trẻ em có sức đề kháng yếu và người cao tuổi có bệnh lý nền, dễ mắc các bệnh truyền nhiễm.</h3>

<p>(23/12/2023 | 11:49 AM)</p>

<p><strong>Sáng 23/12, thông tin từ Bộ Y tế cho biết Bộ Y tế vừa có công văn gửi Chủ tịch UBND các tỉnh, thành phố trực thuộc Trung ương về viẹc tăng cường công tác phòng, chống dịch bệnh mùa Đông Xuân năm 2023-2024.</strong></p>

<p>&nbsp;</p>

<p>Huy động các ban, ngành, đoàn thể, tổ chức chính trị xã hội tham gia phòng chống dịch bệnh.</p>

<p>Theo Bộ Y tế, hiện nay, tại khu vực miền Bắc đang vào giai đoạn mùa Đông Xuân, thời tiết gió mùa lạnh, hanh khô là nguyên nhân các dịch bệnh truyền nhiễm xuất hiện và lây lan, nhất là bệnh lây truyền qua đường hô hấp, tiềm ẩn nguy cơ gia tăng các dịch bệnh truyền nhiễm.</p>

<p><em><img alt="" src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/3/22/dich-benh-truyen-nhiem-bung-phat-16794604769901429333618.jpeg" style="height:596px; width:700px" title="Tại khu vực miền Bắc đang vào giai đoạn mùa Đông Xuân, thời tiết gió mùa lạnh, hanh khô là nguyên nhân các dịch bệnh truyền nhiễm xuất hiện và lây lan, nhất là bệnh lây truyền qua đường hô hấp..." /></em></p>

<p>Các bệnh lưu hành như sốt xuất huyết, tay chân miệng…và một số bệnh có vaccine dự phòng ghi nhận số mắc gia tăng ở nhiều nơi.</p>

<p>Thời gian tới là dịp Tết 2024 và mùa lễ hội đầu năm, nhu cầu giao thương, du lịch tăng cao, cùng diễn biến thời tiết thay đổi bất thường là điều kiện thuận lợi cho các tác nhân gây bệnh lây lan, làm gia tăng số mắc, nhất là với trẻ em có sức đề kháng yếu và người cao tuổi có bệnh lý nền, dễ mắc các bệnh truyền nhiễm.</p>

<p>Để tiếp tục chủ động kiểm soát hiệu quả dịch bệnh truyền nhiễm trong mùa Đông Xuân năm 2023-2024, Bộ Y tế đề nghị Đồng chí Chủ tịch UBND các tỉnh, thành phố quan tâm chỉ đạo các nội dung sau, cụ thể:</p>

<p><em>Chỉ đạo Ủy ban nhân dân các cấp nâng cao vai trò, trách nhiệm trong công tác phòng, chống dịch bệnh truyền nhiễm; đảm bảo kinh phí, nguồn lực và huy động sự tham gia của các ban, ngành, đoàn thể, các tổ chức chính trị xã hội trong phòng, chống dịch bệnh; thường xuyên kiểm tra, giám sát, đôn đốc chỉ đạo các địa phương, đơn vị triển khai hoạt động phòng, chống dịch bệnh trên địa bàn.</em></p>

<p><em>Lấy mẫu, giải trình tự gen phát hiện sớm các biến thể mới, các tác nhân gây bệnh lây truyền qua đường hô hấp.</em></p>

<p>Chỉ đạo Sở Y tế và các đơn vị y tế trên địa bàn thường xuyên, liên tục theo dõi, giám sát chặt chẽ tình hình dịch bệnh, lưu ý theo dõi sự gia tăng các trường hợp mắc bệnh lây qua đường hô hấp, các trường hợp viêm phổi nặng do virus; chuẩn bị sẵn sàng các phương án bảo đảm công tác y tế với mọi tình huống có thể xảy ra của dịch bệnh; chủ động công tác giám sát, tiếp tục triển khai hiệu quả giám sát thường xuyên, giám sát dựa vào sự kiện để phát hiện sớm các ca bệnh ngay tại cửa khẩu, trong cộng đồng và tại các cơ sở y tế để xử lý kịp thời, kiểm soát sự lây lan, hạn chế các trường hợp bệnh nặng, tử vong; duy trì thực hiện tốt chương trình tiêm chủng mở rộng.</p>

<p>Đồng thời, phối hợp chặt chẽ với các Viện Vệ sinh Dịch tễ, Pasteur và các Bệnh viện trực thuộc Bộ Y tế lấy mẫu, giải trình tự gen phát hiện sớm các biến thể mới, các tác nhân gây bệnh, nhất là các tác nhân gây bệnh lây truyền qua đường hô hấp.</p>

<p>Tiếp tục triển khai quyết liệt các biện pháp phòng, chống sốt xuất huyết, thường xuyên tổ chức diệt bọ gậy, lăng quăng; tuyên truyền vận động người dân giảm dụng cụ chứa nước không cần thiết, lật úp, thu gom loại bỏ dụng cụ phế thải. Huy động sự tham gia của chính quyền, các ban, ngành, đoàn thể tại cơ sở để tuyên truyền, giám sát, hướng dẫn việc loại bỏ bọ gậy, lăng quăng tại hộ gia đình với thông điệp "mỗi tuần hãy dành 10 phút để diệt lăng quăng/ bọ gậy".</p>

<p>Cùng đó tiếp tục tổ chức tốt và chuẩn bị sẵn sàng các phương án thu dung, điều trị bệnh nhân; thực hiện nghiêm việc kiểm soát nhiễm khuẩn và phối hợp triển khai hiệu quả công tác chỉ đạo tuyến, nâng cao năng lực chẩn đoán, điều trị;</p>

<p>Chủ động, phối hợp cung cấp và cập nhật thông tin về tình hình dịch bệnh, các khuyến cáo người dân thực hiện các yêu cầu phòng, chống dịch bệnh mùa Đông Xuân, nhất là các bệnh lây truyền qua đường hô hấp; tăng cường truyền thông phòng bệnh nâng cao nhận thức, thay đổi hành vi của người dân trong việc bảo vệ sức khoẻ;</p>

<p>Tiếp tục đảm bảo hậu cần, kinh phí, thuốc, vaccine, sinh phẩm, vật tư, hóa chất, trang thiết bị, nhân lực để sẵn sàng phục vụ công tác phòng, chống dịch bệnh theo phương châm 04 tại chỗ.</p>

<p><em><img alt="" src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2023/10/7/sot-xuat-huyet-16966459944001652499534.jpg" style="height:533px; width:700px" title="Bộ Y tế đề nghị các địa phương tiếp tục triển khai quyết liệt các biện pháp phòng, chống sốt xuất huyết, thường xuyên tổ chức diệt bọ gậy, lăng quăng..." /></em></p>

<p><em>Đảm bảo kinh phí để đáp ứng nhu cầu phòng, chống dịch bệnh</em></p>

<p>Bộ Y tế đề nghị Chủ tịch UBND chỉ đạo các Sở: Giáo dục và Đào tạo, Nông nghiệp và Phát triển nông thôn phối hợp chặt chẽ với ngành Y tế tiếp tục triển khai hiệu quả các hoạt động vệ sinh phòng bệnh, đảm bảo an toàn thực phẩm, cung cấp đủ nước uống, nước sạch và thường xuyên vệ sinh môi trường tại các cơ sở giáo dục, các trường học;</p>

<p>Tổ chức tuyên truyền, giáo dục, nâng cao nhận thức của học sinh, cán bộ, giáo viên về các biện pháp phòng, chống dịch bệnh; Phòng, chống dịch bệnh trên các đàn gia súc, gia cầm, giám sát, phát hiện sớm các ổ dịch ở động vật để xử lý triệt để ổ dịch và phòng, chống dịch bệnh lây từ động vật, thực phẩm sang người.</p>

<p>Chỉ đạo Sở Thông tin và Truyền thông, các cơ quan truyền thông, báo chí và hệ thống truyền thông cơ sở tăng cường hoạt động truyền thông về phòng, chống dịch bệnh mùa Đông Xuân, nhất là các bệnh lây truyền qua đường hô hấp; khuyến cáo, hướng dẫn người dân chủ động thực hiện các biện pháp phòng bệnh cá nhân và thay đổi hành vi để nâng cao sức khỏe.</p>

<p>Chỉ đạo Sở Tài chính đảm bảo kinh phí theo đề xuất của ngành Y tế và các đơn vị liên quan để đảm bảo đáp ứng nhu cầu phòng, chống dịch bệnh</p>
<p><em>Nguồn:Suckhoedoisong.vn</em></p>
', N'/Images/images/cachphongcum.jpeg', N'Bộ Y tế: Thời tiết thay đổi bất thường tiềm ẩn nguy cơ gia tăng các dịch bệnh truyền nhiễm', CAST(N'2023-12-23T00:00:00' AS SmallDateTime), N'hot                 ')
SET IDENTITY_INSERT [dbo].[Tintuc] OFF
GO

ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayGui]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Tintuc] ADD  CONSTRAINT [DF_Tintuc_Ngaydang]  DEFAULT (getdate()) FOR [Ngaydang]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NguoiDung] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NguoiDung]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_QuanTri] FOREIGN KEY([IDQuanTri])
REFERENCES [dbo].[QuanTri] ([IDQuanTri])
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_QuanTri]
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD  CONSTRAINT [FK_LichKham_NguoiDung] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[LichKham] CHECK CONSTRAINT [FK_LichKham_NguoiDung]
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD  CONSTRAINT [FK_LichKham_QuanTri] FOREIGN KEY([IDQuanTri])
REFERENCES [dbo].[QuanTri] ([IDQuanTri])
GO
ALTER TABLE [dbo].[LichKham] CHECK CONSTRAINT [FK_LichKham_QuanTri]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_GioiTinh] FOREIGN KEY([IDGioiTinh])
REFERENCES [dbo].[GioiTinh] ([IDGioiTinh])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_GioiTinh]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_TinhThanh] FOREIGN KEY([IDTinh])
REFERENCES [dbo].[TinhThanh] ([IDTinh])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_TinhThanh]
GO
ALTER TABLE [dbo].[QuanTri]  WITH CHECK ADD  CONSTRAINT [FK_QuanTri_Khoa] FOREIGN KEY([IDKhoa])
REFERENCES [dbo].[Khoa] ([IDKhoa])
GO
ALTER TABLE [dbo].[QuanTri] CHECK CONSTRAINT [FK_QuanTri_Khoa]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_NguoiDung] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_NguoiDung]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_QuanTri] FOREIGN KEY([IDQuanTri])
REFERENCES [dbo].[QuanTri] ([IDQuanTri])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_QuanTri]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_LichKham] FOREIGN KEY([IDLichKham])
REFERENCES [dbo].[LichKham] ([IDLichKham])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_LichKham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_DanhGiaChatLuong] FOREIGN KEY([IDDanhGiaChatLuong])
REFERENCES [dbo].[DanhGiaChatLuong] ([IDDanhGiaChatLuong])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_DanhGiaChatLuong]
GO
USE [master]
GO
ALTER DATABASE [WebAppYte] SET  READ_WRITE 
GO
