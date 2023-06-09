USE [master]
GO
/****** Object:  Database [TechnoShop]    Script Date: 27/3/2022 5:21:57 PM ******/
CREATE DATABASE [TechnoShop]


begin
EXEC [TechnoShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechnoShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechnoShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechnoShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechnoShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechnoShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechnoShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TechnoShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechnoShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechnoShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechnoShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechnoShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechnoShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechnoShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechnoShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechnoShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechnoShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechnoShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechnoShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechnoShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechnoShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechnoShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechnoShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechnoShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechnoShop] SET  MULTI_USER 
GO
ALTER DATABASE [TechnoShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechnoShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechnoShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechnoShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechnoShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechnoShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TechnoShop', N'ON'
GO
ALTER DATABASE [TechnoShop] SET QUERY_STORE = OFF
GO
USE [TechnoShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27/3/2022 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](255) NULL,
	[Image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 27/3/2022 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/3/2022 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[Created_Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27/3/2022 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Description] [ntext] NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NOT NULL,
	[Image] [varchar](255) NULL,
	[PercentOfDiscount] [float] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 27/3/2022 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/3/2022 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](255) NOT NULL,
	[Last_Name] [varchar](255) NOT NULL,
	[Role_ID] [int] NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [varchar](24) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__Users__206D91908F86B728] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
--
--INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (1, N'SamSung', NULL)
--INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (2, N'Apple', NULL)
--INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (3, N'LG', NULL)
--INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (4, N'Xiaomi', NULL)
--INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (6, N'Oppo', NULL)
--
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (1, N'Macbook', NULL)
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (2, N'Hp', NULL)
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (3, N'Dell', NULL)
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (4, N'Asus', NULL)
INSERT [dbo].[Categories] ([Category_ID], [Category_Name], [Image]) VALUES (6, N'Lenovo', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([Id], [Order_ID], [Product_ID], [Quantity]) VALUES (42, 15, 39, 1)
INSERT [dbo].[Order_Details] ([Id], [Order_ID], [Product_ID], [Quantity]) VALUES (43, 15, 40, 1)
INSERT [dbo].[Order_Details] ([Id], [Order_ID], [Product_ID], [Quantity]) VALUES (44, 16, 39, 1)
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Total], [Status], [Created_Time]) VALUES (15, 3, 31990000, 2, CAST(N'2022-03-27T15:45:55.547' AS DateTime))
INSERT [dbo].[Orders] ([Order_ID], [User_ID], [Total], [Status], [Created_Time]) VALUES (16, 3, 4000000, 2, CAST(N'2022-03-27T16:06:06.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (39, N'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', 
N'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng.
Hiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS .
Đa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm. 
Trang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng.
Chất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc. 
Thiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi. ',
1, 
19690000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_22.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (40, N'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 
N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg.
Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier.
Đa nhiệm mượt mà - Ram 8GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc.
Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits.
Âm thanh sống động - 4 loa tramg bị công nghệ dolby atmos và âm thanh đa chiều.',
1, 
27390000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_m2.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (41, N'Apple MacBook Pro 13 Touch Bar M1 256GB 2020 I Chính hãng Apple Việt Nam', 
N'Xử lý đồ hoạ mượt mà - Chip M1 cho phép thao tác trên các phần mềm AI, Photoshop, Render Video, phát trực tiếp ở độ phân giải 4K
Chất lượng hiển thị sắc nét - Độ phân giải retina màu sắc rực rỡ, tấm nền IPS cho góc nhìn 178 độ
Bảo mật cao - Trang bị cảm biến vân tay cho phép mở máy chỉ với 1 chạm
Mỏng nhẹ cao cấp - Mỏng chỉ 15.6mm, trọng lượng chỉ 1.4kg đồng hành cùng bạn mọi lúc mọi nơi
Cảm giác gõ thoải mái - Bàn phím magic khắc phục hầu hết các nhược điểm củ thế hệ trước',
1, 
27590000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/r/pro_8gb.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (42, N'Apple Macbook Pro 13 M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 
N'Chip M2 mới nhất - hiệu năng hàng đầu, thoải mái sử dụng các phần mềm đồ hoạ hay render video
Màn hình Retina - màu sắc hiển thị sống động tạo ra không gian giải trí đỉnh cao
Thiết kế sang trọng - Trọng lượng máy chỉ 1.4kg, độ dày chỉ 15.6mm giúp bạn dễ dàng mang theo
Âm thanh chân thật - Tích hợp loa kép cùng công nghệ Dolby Atmos mang đến chất lượng âm thanh tuyệt vời',
1, 
30290000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_256.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (43, N'Apple Macbook Air M2 2022 8GB 512GB I Chính hãng Apple Việt Nam', 
N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg
Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier
Đa nhiệm mượt mà - Ram 8GB, SSD 512GB cho phép vừa làm việc, vừa nghe nhạc
Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits
Âm thanh sống động - 4 loa tramg bị công nghệ dolby atmos và âm thanh đa chiều',
1, 
32990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_512.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (44, N'Apple MacBook Pro 13 M2 2022 8GB 512GB I Chính hãng Apple Việt Nam', 
N'Vẻ ngoài sang trọng, siêu mỏng nhẹ - trọng lượng chỉ 1.4kg
Chip Apple M2 chạy mượt các úng dụng đồ hoạ như Phototshop, Premier hay các phần mềm văn phòng Word, Exel, Powerpoint
Ram 8GB - Đa nhiệm mượt mà, mở cùng lúc nhiều ứng dụng hay tab trình duyệt mà không lo giật lag
Màn hình Retina cùng các công nghệ như True Tone, Wide Color - Màu sắc hiển thị sắc nét, trải nghiệm giải trí tuyệt vời hơn bao giờ hết
Tích hợp touch bar - Các thao tác nhu chụp màn hình, chỉnh âm lượng trở nên dễ dàng hơn
Webcam 720p - Sẵn sàng tham gia các buổi họp trực tuyến hay họp online',
1, 
35490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook13.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (45, N'Apple MacBook Pro 13 M2 2022 16GB 256GB I Chính hãng Apple Việt Nam', 
N'Hiệu năng vượt trội - Chip M2, 10 nhân GPU xử lý tốt các Photoshop, Illustrator, Premiere, xử lý các video 4K
16GB Ram, 512GB - Đa nhiệm tốt, mở cùng lúc trên Safari hay nhiều ứng dụng
Thiết kế mỏng nhẹ tinh tế - Vỏ kim loại, trọng lượng chỉ 1.4kg
Trải nghiệm giải trí cực đã - Màn hình 13.3 inch, độ phân giải 2560 x 1600 cho chất lượng hiển thị cực rõ ràng',
1, 
37490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_pro_m22.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (46, N'MacBook Pro 14 inch M2 Pro 2023 (10 CPU - 16 GPU - 16GB - 512GB)', 
N'Thiết kế sang trọng - Vỏ kim loại cùng trọng lượng chỉ 1.6kg dễ dàng mang theo mọi nơi
Hiển thị chân thật - Kích thước màn hình 14 inch cùng tần số quét lên đến 120Hz
Cấu hình mạnh mẽ - Ram 16GB cùng SSD 512 GB đa nhiệm mượt mà, tránh tình trạng giật lag
Xử lý tốt các tác vụ đồ hoạ - GPU 16 nhân giúp việc render video hay chỉnh sửa ảnh diễn ra một cách nhẹ nhàng.',
1, 
49990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/2/m2_pro_14.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (47, N'Laptop HP 240 G8 1H7F8AV', 
N'Laptop HP 240 G8 1H7F8AV – Laptop nhỏ gọn, hiệu năng ổn định
Một chiếc laptop 14 inch là vừa đủ để bạn sử dụng trong học tập và làm việc. Cộng thêm hiệu năng cao và dung lượng pin lớn là đủ để bạn thoải mái dùng. Chúng tôi xin giới thiệu laptop HP 240 G8 1H7F8AV hội tụ đủ những điều trên!

Hình ảnh độ phân giải cao, lưu trữ ổn định
Laptop HP 240 G8 1H7F8AV sở hữu màn hình có kích thước 14 inch đủ dùng, độ phân giải FHD rõ nét. Tấm nền hiện đại trang bị cùng dải màu rộng lớn đem đến sắc màu chân thực trong từng thước hình.

Laptop được trang bị ổ cứng có dung lượng lớn đến 1TB, sẵn sàng lưu trữ mọi dữ liệu bạn muốn, an toàn và nhanh chóng. Chiếc laptop 14 inch này được trang bị bộ Ram dung lượng 4GB, không lớn nhưng vẫn đáp ứng khả năng đa nhiệm đủ dùng cho khối lượng công việc văn phòng.',
2, 
11790000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/7/1/71hvv3_s1vs._sl1500-001.jpg', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (48, N'Laptop HP 250 G8 389X8PA', 
N'Laptop HP 250 G8 389X8PA – Màu sắc sang trọng, màn hình sắc nét
Laptop HP 250 G8 389X8PA sở hữu thiết kế mỏng nhẹ nhưng không kém phần mạnh mẽ. Màn hình sắc nét, bộ vi xử lý mượt mà cùng dung lượng pin ổn,... Laptop HP Pavilion này hội tụ tất cả những điều bạn cần.

Nhỏ gọn khoẻ khoắn, màn hình 15.6 inch HD sắc nét
Laptop HP 250 G8 389X8PA với thiết kế nhỏ gọn, khoẻ khoắn và hợp thời trang. Ngoại hình được trau chuốt tỉ mỉ từng chi tiết giúp chiếc laptop HP trông vô cùng bắt mắt.',
2, 
11990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/9/19814_laptop_hp_250_g8_389x8pa_22.jpg', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (49, N'Laptop HP Pavilion 15-EG2034TX 6K780PA', 
N'Chip Intel Core i7 - 1260P hiệu năng mạnh mẽ, xử lý tốt mọi tác vụ văn phòng
Geforce MX550 2GB - Thoải mái chỉnh sửa ảnh 2D qua Photoshop, chơi game nhẹ nhàng như LOL, Fifa
SSD 512GB MVME - Lưu trữ tài liệu hay khởi động Windows nhanh hơn
Hình ảnh sống động - Tấm nền IPS, độ phân giải Full HD',
2, 
22490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0002_hp-pavilion-15-eg2055tu-6k785pa_3__2.jpg', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (50,  N'Laptop HP 245 G9 6L1N8PA', 
N'Phù hợp sinh viên - nhân viên văn phòng với thiết kế mỏng nhẹ, màn hình 14 inch Full HD
Cân mọi tác vụ học tập, văn phòng với CPU AMD Ryzen 5-5625U
RAM 8 GB đa nhiệm hỗ trợ mở hàng chục tab duyệt web mà không lo lag, giật
Ổ cứng 256GB SSD thoải mái lưu trữ mọi file, dữ liệu học tập
Camera HD hỗ trợ hình ảnh sắc nét trong các buổi họp, call video, meet,...',
2, 
11990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_d_i_20.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (51, N'Laptop HP Gaming Victus 15-FA0031DX 6503849', 
N'Siêu phẩm laptop Gaming đến từ nhà HP với kích thước 15.6 inch, độ phân giải Full HD đi kèm tần số quét lên đến 144Hz hạn chế giật, xé hình, cho tốc độ mượt mà thao tác mướt mắt.
Máy trang bị CPU Intel Core i5-12450H cùng card đồ họa NVIDIA GeForce GTX 1650 cân mọi tựa game phổ biến hiện nay hay dễ dàng thiết kế, sáng tạo trên Photoshop, Canva, Figma,...
RAM 8GB đa nhiệm cho mọi thao tác mượt mà, mở nhiều tab cùng lúc mà không lo lag, giật. Ổ cứng 512GB PCIE cho không gian lưu trữ rộng rãi, tải game hay lưu trữ dữ liệu học tập, làm việc thoải mái.
Trang bị đầy đủ cổng kết nối như: Ethernet, HDMI 2.1, USB-A, Type-C,... hỗ trợ kết nối, truyền tải dữ liệu nhanh chóng.
Laptop đi kèm đèn bàn phím hỗ trợ game thủ thao tác nhanh gọn trong môi trường thiếu sáng.',
2, 
16790000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-6.jpg', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (52, N'Laptop Dell Vostro 5620 70282719', 
N'Hiệu năng vượt trội, xử lý tốt các tác vụ hằng ngày - Intel Core i5 thế hệ 12
16GB ram cho phép mở cùng lúc nhiều tab trình duyệt
512GB SSD, mở ứng dụng nhanh hơn - thoải mái lưu trữ
Kết nối nhanh chóng - Wifi 6 tốc độ vượt trội',
3, 
22990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/e/dell_2.png', 
0, 
1)


INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (53, N'Laptop Dell Vostro 3500 P112F002ABL', 
N'Chip Core i5-1135G7 cùng card Nvidia MX350 - Không ngán các tác vụ chỉnh sửa đồ hoạ hay các tựa game nặng.
Ram 8GB, SSD 512GB - Khởi động ứng dụng nhanh chóng, đa nhiệm mượt mà.
Khả năng hiển thị rực rỡ - màn hình chuẩn 15.6 inch, độ phân giải Full HD.
Trang bị cảm biến vân tay - Mở khóa máy chỉ với 1 chạm.
Thiết kế vỏ nhựa cứng cáp, nặng 1.78 kg thuận tiện di chuyển, mang theo.
Máy đi kèm Windows 10 bản quyền.',
3, 
20990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/4/24_114.jpg', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (54, N'Laptop Dell Inspiron 15 3520 70296960	', 
N'CPU Intel Core i5-1235U với 10 nhân 12 luồng, xung nhịp lên đến 4.40 GHz cho khả năng xử lý nhanh gọn các tác vụ văn phòng.
Card NVIDIA GeForce MX550 2 GB hỗ trợ chỉnh sửa đồ họa 2D trên Photoshop, Lightroom,... hay giải trí với các tựa game có mức đồ họa từ thấp đến trung bình.
Ram 8 GB cùng bộ nhớ 512 GB SSD cho phép lưu trữ thoải mái, khởi động máy nhanh chóng, truy xuất dữ liệu ổn định.
Hỗ trợ đa dạng cổng kết nối: USB Type-C, HDMI và cả khe đọc thẻ nhớ,... giúp kết nối thuận tiện với nhiều thiết bị.',
3, 
20590000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/4/24_114.jpg', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (55, N'Laptop Dell Inspiron 15 3520 71003262	', 
N'Thiết kế gọn gàng, cơ động sẵn sàng theo bạn đi khắp nơi
Vi xử lý Intel Core i7-1255U hiệu năng xử lý vượt trội cân mọi tác vụ văn phòng một cách hiệu
RAM 8 GB chuẩn DDR4 cho thao tác lướt web nhanh nhạy, mở hàng chục tab mà không lag, giật
Ổ cứng 512GB SSD hỗ trợ mở máy, mở ứng dụng nhanh chóng
Trang bị cổng kết nối hiện đại như: USB 3.2, HDMI,.. giúp truyền tải dữ liệu tốc độ cao
Hệ điều hành Windows 11 mang đến giao diện mới mẻ cho người dùng',
3, 
20590000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_7__66.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (56, N'Laptop Asus Rog Strix Scar 15 G533ZS-LN036W	', 
N'Khoác lên mình bộ áo đen mạnh mẽ, cá tính, mang dáng vóc nhỏ gọn, thuận tiện cho việc di chuyển. Sở hữu bản lề cắt kéo, mang vẻ ngoài đậm chất gaming pha chút khoa viễn tưởng độc đáo.
Kích thước màn hình 15.6 inch kết hợp với tấm nền IPS giúp hình ảnh được tái tạo sắc nét, sống động và cực kì chân thật. Tần số quét 240Hz giúp hình ảnh chuyển động nhanh, mượt và vô cùng rõ nét cân mọi tác vụ game FPS ở thiết lập cao nhất.
Chip Intel Core i9-12900H đẩy nhanh các tác vụ hằng ngày và các tựa game nhẹ. VGA RTX 3080 cho trải nghiệm chơi game mượt mà và nhanh chóng.
RAM 32GB cho phép bạn chạy tất cả các trò chơi và thực hiện đa nhiệm không lo lag, giật.
Ổ cứng lên đến 2TB cho không gian lưu trữ cực lớn để bạn thoải mái lưu trữ mọi tựa game yêu thích.
Trang bị Intel Wi-Fi 6 cực nhanh cho phép bạn chơi game với tốc độ mạng LAN ở bất kỳ đâu bạn có kết nối tương thích.',
4, 
77990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/a/gaming_004_2.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (57, N'Laptop ASUS Rog Zephyrus G15 GA503RS-LN892W	', 
N'ĐẶC ĐIỂM NỔI BẬT
Khoác lên mình lớn màu xám cá tính với mặt A tinh xảo, bản lề gập mở đến 180 độ mang đến khả năng làm việc thuận tiện hơn, tăng khả năng tương tác và trình chiếu đến với người đối diện.
CPU AMD Ryzen 9 6900HS tự tin thể hiện sức mạnh xử lý cùng tốc độ vượt trội trong những tác vụ làm việc liên quan đến edit video, photoshop hình ảnh,...
Card đồ họa RTX 3080 nâng cấp khả năng xử lý đồ họa trong những tựa game lên một tầm cao mới.
32GB RAM đảm bảo khả năng đa nhiệm trên nhiều tác vụ mượt mà cùng bộ nhớ 1TB SSD, vừa giúp lưu trữ dữ liệu vừa tăng tốc quá trình khởi động máy, khởi động ứng dụng.
Màn hình 15.6 inch, tần số quét đạt 240Hz cho khung hình mượt mà, sắc nét giảm thiểu tình trạng xé màn hình, cho ra những khung hình mượt mà nhất.
Kết nối thông dụng với các cổng USB Type-A, Type-C, LAN RJ45, HDMI,...',
4, 
66990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_264_5.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (58, N'Laptop ASUS Zenbook Pro 14 Duo OLED UX8402ZE-M3074W', 
N'Sở hữu diện mạo công thái học vô cùng đẹp mắt với 2 màn hình để trình chiếu, độ phân giải 2.8K cho màu sắc hiển thị chân thực, hệ thống màu đa dạng, màn hình cảm ứng giúp những thao tác trở nên dễ dàng và nhanh chóng hơn.
CPU Intel Core i9-12900H giải quyết mọi tác vụ văn phòng cơ bản đến nâng cao với nhiều phần mềm thiết kế đồ họa như: Photoshop, Illustrator, Lightroom,...
VGA NVIDIA GeForce RTX 3050Ti cho phép xử lý hình ảnh/video với tốc độ mượt mà, sắc nét. 
RAM 32GB LPDDR5 kết hợp ổ cứng SSD 1TB mang lại không gian lưu trữ khổng lồ cũng như hỗ trợ mở máy, mở ứng dụng hay chuyển tab trình duyệt với tốc độ nhanh hơn.
Đảm bảo khả năng kết nối với các thiết bị ngoại vi khác thông qua cổng kết nối thông dụng như: Thunderbolt, USB 3.2 Type-A, HDMI,...',
4, 
60990000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_325_2.png', 
0, 
1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (59, N'Laptop Asus Rog Flow Z13 GZ301ZC-LD110W', 
N'"Chip I7-12700H tinh vi cùng card đồ họa GeForce RTX 3050, chiến game cực mượt, edit đồ hoạ thoải mái
Ram 16GB với 2 khe cắm, nâng cấp tối đa đến 32GB cùng ổ cứng SSD có không gian lưu trữ lên tới 512GB cho tốc độ xử lý mượt mà, nhanh chóng, đa nhiệm
Trang bị màn hình có độ phân giải WUXGA sắc nét cùng tần số 120 Hz trên màn hình 13.4 inches cho trải nghiệm hình ảnh, màu sắc chân thực, sống động
Tích hợp Webcam HD 720p cho phép đàm thoại thông qua video thoải mái
Năng lượng bất tận để chiến đấu cùng các con game chỉ với 4-cell, 56WHrs
Trọng lượng máy 1.18 Kg thuận tiện mang theo, thuận tiện cầm nắm
Máy đi kèm Windows 11 Home SL bản quyền',
4, 
43490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_325_2.png', 
0, 1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (60, N'Laptop ASUS Gaming ROG Strix G15 G513RM-HQ055W', 
N'"Cấu hình vượt trội Chip R7-6800H cùng card đồ họa GeForce RTX 3060 - Trải nghiệm các tựa game hàng đầu ở mức đồ hoạ cao mượt mà
Ổ cứng SSD 512GB, RAM 16GB có thể nâng cấp tối đa đến 32GB cho phép mở cùng lúc nhiều ứng dụng
Độ phân giải QHD sắc nét kết hợp cùng công nghệ Adaptive-Sync trên màn hình 15.6 inches với
Tần số quét 165Hz và độ phủ màu DCI-P3 lên tới 100% - Mượt mà trong từng khung hình, màu sắc sống động
Trang bị 2 loa Dolby Atmos mang lại âm thanh sinh động, chân thực
Hỗ trợ pin 4 Cell 90WHrs cho hiệu suất làm việc bất tận nguyên ngày
Máy đi kèm Windows 11 Home SL bản quyền"',
4, 
36490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/1/11h50.png', 
0, 1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (61, N'Laptop Lenovo Legion 7 16ACHG6 82N600NUVN', 
N'Laptop Lenovo Legion 7 16ACHG6 82N600NUVN – Laptop hiệu năng mạnh mẽ
Laptop Lenovo Legion 7 16ACHG6 82N600NUVN là một sản phẩm thuộc dòng laptop Lenovo gaming với thiết kế ấn tượng cùng hiệu năng vượt trội. Laptop không chỉ thích hợp với các game thủ mà còn nhiều đối tượng người dùng mong muốn một chiếc laptop mạnh mẽ khác.

Thiết kế gọn nhẹ cùng màn hình 16 inch WQXGA
Lenovo Legion 7 16ACHG6 82N600NUVN tuy mà một chiếc laptop gaming như sở hữu một thiết khá thanh thoát. Laptop được trang bị một hệ thống cổng kết nối đa dạng từ USB đến HDMI, Headphone, Ethernet,… nhờ đó người dùng có thể dễ dàng kết nối với nhiều thiết bị ngoại vi khác nhau.',
6, 
48490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0001_lenovo-legion-7-16achg6-82n600nu_2_.jpg', 
0, 1)


INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (62, N'Laptop Lenovo Gaming Legion 5 Pro 16ARH7H 82RG008SVN', 
N'Mang kiểu dáng vô cùng hiện đại với gam màu trắng sang trọng, màn hình 16 inch WQXGA cho chuỗi đồ họa cực nét. Công nghệ chống chói với tấm nền IPS 500nits và độ phủ màu 100% sRGB mang đến hình ảnh đẹp mắt ở mọi góc nhìn.
Bộ vi xử lý AMD Ryzen 7-6800H cho tốc độ xử lý vượt trội, mọi thao tác từ cơ bản đến nâng cao một cách mượt mà. Kết hợp cùng VGA RTX 3060 6GB GDDR6 trải nghiệm đắm chìm hơn vào không gian giải trí với đồ họa sắc nét cân mọi tựa game hiện có trên thị trường.
RAM 16GB DDR5 4800MHz xử lý đa nhiệm một cách trơn tru. Ổ cứng 512GB SSD còn mở ra kho lưu trữ khổng lồ cho tất cả các dữ liệu quan trọng hay những tựa game yêu thích mà không lo cạn kiệt dung lượng.
Chuẩn Wi-Fi 6 11ax thỏa mãn mọi nhu cầu chơi game trực tuyến tốt nhất mà không lo rớt, chậm mạng.',
6, 
38490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_d_i_2__3.png', 
0, 1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (63, N'Laptop Lenovo Gaming Legion 5 15ARH7H 82RD004UVN', 
N'AMD Ryzen 7 6800H - GeForce RTX 3060 Cấu hình chơi game và đồ họa đỉnh cao, cân mọi tựa game.
Dung lượng Ram lớn 16GB + 1 khe trống cho phép nâng cấp tối đa đến 32GB, ổ cứng SSD 512GB mang đến tốc độ xử lý nhanh cùng đa nhiệm mượt mà, mở nhiều trang cùng lúc không bị giật, lag.
Độ phân giải 2K (Quad HD), tấm nền IPS, kích thước chuẩn 15.6 inch, mang lại trải nghiệm hình ảnh chân thật, sắc nét.
Tích hợp webcam 1080p cho phép đàm thoại thông qua video thoải mái.
Bàn phím được tích hợp đèn nền RGB 4 vùng - Thỏa sức làm việc trong môi trường thiếu sáng.
Trọng lượng 2.4 kg mang lại cảm giác cầm chắc tay.
Máy đi kèm Windows 11 bản quyền.',
6, 
37490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/7/_/7_59_1.png', 
0, 1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (64, N'Laptop Lenovo Gaming Legion 5 15ACH6H 82JU00DGVN', 
N'AMD Ryzen 7-5800H - GeForce RTX 3060 Cấu hình chơi game và đồ họa đỉnh cao, cân mọi tựa game.
Ram 8GB + 1 khe trống cho phép nâng cấp tối đa đến 32GB.
Ổ cứng SSD 512GB mang đến tốc độ xử lý nhanh cùng đa nhiệm mượt mà, mở nhiều trang cùng lúc không bị giật, lag.
Màn hình chống lóa, Full HD, tấm nền IPS, kích thước chuẩn 15.6 inch, tần số quét 165Hz mang lại trải nghiệm hình ảnh chân thật, sắc nét.
Tích hợp webcam 720p cho phép đàm thoại thông qua video thoải mái.
Thiết kế vỏ nhựa cao cấp vô cùng cứng cáp, nặng 2.4 kg mang lại cảm giác cầm chắc tay.
Năng lượng bất tận cả ngày với viên pin 4 Cell 80 WHr.
Máy đi kèm Windows 11 bản quyền.',
6, 
36490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/_/5.7_1.jpg', 
0, 1)

INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
VALUES (65, N'Laptop Lenovo Thinkpad P14S G2 T 20VX008GVN', 
N'
Nvidia Quadro T500 4GB - Xử lý các tác vụ đồ hoạ chuyên nghiệp như render video hay đồ hoạ 3D
512GB SSD m.2 - Khởi động ứng dụng nhanh hơn, có thể nâng tối đa 2TB
Ram 8GB onboard + 8GB trên khe - Có thể nâng cấp tối đa 40GB
Thoải mái sử dụng cả trong đêm - tích hợp đèn bàn phím',
6, 
33490000,
3, 
N'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/h/4h30.png', 
0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status])
--VALUES (40, N'Xiaomi 12 Pro Chính Hãng', N'Xiaomi 12 Pro có thiết kế sang trọng, màn hình rộng 6.73 inch, tần số quét 120Hz, bộ 3 camera 50MP chụp ảnh sắc nét, mạnh mẽ với chip Snapdragon 8 Gen 1 đầu tiên trên thế giới, dung lượng pin lớn 4600mAh đi kèm sạc nhanh 120W.', 4, 27990000, 2, N'https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-12-pro-didongviet.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) 
--VALUES
--(41, N'Xiaomi 11 Lite 5G NE (8GB|128GB) Chính Hãng', N'Xiaomi 11 Lite 5G NE (8GB|128GB) có thiết kế sang trọng, màn hình rộng 6,55inch tần số quét 90Hz, camera lên đến 64MP, mạnh mẽ với chip Snapdragon 778G, dung lượng pin lớn 4250mAh đi kèm sạc nhanh 33W.', 4, 7790000, 10, N'https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-11-lite-5g-128gb-didongviet.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES
--(42, N'iPhone 13 128GB Chính Hãng (VN/A)', N'iPhone 13 128GB Chính hãng (VN/A) bán tại Di Động Việt - Đại lý uỷ quyền chính thức của Apple tại Việt Nam, iPhone 13 mini là phiên bản quốc tế 2 sim (Nano + Esim) chính hãng VN/A. Máy chưa Active + nguyên seal hộp, mới 100% (Fullbox)', 2, 21250000, 12, N'https://didongviet.vn/pub/media/catalog/product//i/p/iphone-13-128gb-didongviet_1.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (43, N'iPhone 12 Pro 512GB (VN/A)', N'iPhone 12 Pro 512GB Chính hãng (VN/A) bán tại Di Động Việt - Đại lý uỷ quyền chính thức của Apple tại Việt Nam, là phiên bản quốc tế 2 sim (Nano + Esim) chính hãng VN/A. Máy chưa Active + nguyên seal hộp, mới 100% (Fullbox)', 2, 28490000, 5, N'https://didongviet.vn/pub/media/catalog/product//i/p/iphone-12-pro-256gb-vna-ddv.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (44, N'iPhone 11 64GB Chính Hãng (VN/A)', N'iPhone 11 64GB chính hãng VN/A bán tại Di Động Việt - Đại lý uỷ quyền chính thức của Apple tại Việt Nam, là phiên bản quốc tế 2 sim (Nano + Esim) chính hãng VN/A. Máy chưa Active + nguyên seal hộp, mới 100% (Fullbox).', 2, 12690000, 1, N'https://didongviet.vn/pub/media/catalog/product//i/p/iphone-11-64gb-chinh-hang_3.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (45, N'Samsung Galaxy Z Flip3 5G (8GB|256GB) Chính Hãng', N'Galaxy Z Flip3 5G smartphone cao cấp với thiết kế mới lạ sang trọng, màn hình nhiều nâng cấp với màn hình 6.7 inch, độ phân giải Full HD+. Máy chạy trên hệ điều hành Android 11, One UI 3.5 cùng với nhiều nâng câp đáng tiền. Dung lượng pin đạt đến 3300mAh.', 1, 20990000, 3, N'https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-z-flip-3-cream-didongviet.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (46, N'Samsung Galaxy S21 FE (8GB|128GB) Chính Hãng', N'Galaxy S21 FE 128GB thiết kế khung viền siêu mỏng, có 4 tuỳ chọn màu sắc tươi tắn. Hỗ trợ màn hình có độ lớn 6.41 inch cùng công nghệ AMOLED với tần số làm mới chạm mức 120Hz. Hiệu năng hoạt động dựa trên con chip Exynos 2100 mạnh mẽ, giúp xử lý tác vụ cực mượt. Bộ 3 camera 12MP, camera selfie 32MP. Dung lượng pin 4500mAh, hỗ trợ đi kèm sạc nhanh 25W và sạc không dây 15W.', 1, 13990000, 2, N'https://didongviet.vn/pub/media/catalog/product//g/a/galaxy-s21-fe-8gb-128gb-didongviet.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (47, N'Samsung Galaxy A32 (6GB|128GB) Chính Hãng', N'Samsung Galaxy A32 (6GB|128GB) có thiết kế mới lạ, trẻ trung. Màn hình giọt nước, camera 64 MP, được tích hợp cảm biến vân tay trên màn hình tiện lợi.', 1, 5690000, 1, N'https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-a32-6gb-128gb-didongviet.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (48, N'OPPO Reno7 Z (8GB|128GB) Chính hãng', N'OPPO Reno7 Z 128GB sở hữu thiết kế trẻ trung với màn hình AMOLED rộng 6.43 inch, hiệu năng mạnh mẽ với vi xử lý Snapdragon 695 5G, camera sau 64MP với nhiều chế độ chụp ảnh chuyên nghiệp cùng dung lượng pin 4500mAh hỗ trợ công nghệ sạc nhanh 33W.', 6, 10490000, 5, N'https://didongviet.vn/pub/media/catalog/product//o/p/oppo-reno7-z-128gb-didongviet.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (49, N'OPPO A76 (6GB|128GB) Chính Hãng', N'OPPO A76 128GB sở hữu thiết kế trẻ trung với màn hình IPS LCD rộng 6.56 inch, hiệu năng mạnh mẽ với vi xử lý Snapdragon 680, camera sau 12MP với nhiều chế độ chụp ảnh chuyên nghiệp cùng dung lượng pin 5000mAh hỗ trợ công nghệ sạc nhanh SuperVOOC.', 6, 5990000, 4, N'https://didongviet.vn/pub/media/catalog/product//o/p/oppo-a76-128gb-didongviet.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (50, N'OPPO A95 (8GB/128GB) Chính Hãng', N'OPPO A95 sở hữu thiết kế mỏng nhẹ, lớp vỏ màu Gradient mang cá tính riêng, thiết bị có màn hình AMOLED với độ lớn 6.41 inch, bộ vi xử lý Snapdragon 662 kết hợp với chip đồ hoạ Andreno 610 đem lại hiệu năng mạnh mẽ. Camera chính 48MP hỗ trợ bạn chụp ảnh có độ phân giải sống động', 6, 5990000, 5, N'https://didongviet.vn/pub/media/catalog/product//o/p/oppo-a95-didongviet_1_1.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (51, N'LG V50S ThinQ 5G (8GB|256GB) Hàn Quốc LM-V510N', N'LG V50S ThinQ 5G 256GB Hàn Quốc hiện đang là mẫu smartphone nhận được nhiều đánh giá cao trong tầm giá. Máy không chỉ nổi bật ở hiệu năng mà điểm khiến các dòng LG V50 nổi bật là khả năng trang bị những món phụ kiện ngoài.', 3, 4390000, 4, N'https://www.xtmobile.vn/vnt_upload/product/03_2020/thumbs/600_lg_v50s_thinq_5g_8gb_256gb_han_quoc_like_new.jpg', 0, 1)
--INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Description], [Category_ID], [Price], [Quantity], [Image], [PercentOfDiscount], [Status]) VALUES (52, N'LG V60 ThinQ', N'Chiếc điện thoại LG V60 ThinQ đánh dấu sự trở lại của LG trong năm 2020, smartphone nổi bật với camera có khả năng quay video 8K, pin siêu khủng 5.000 mAh cùng vi xử lý Snapdragon 865 tích hợp modem mạng 5G hiện đại.', 3, 7190000, 1, N'https://cdn.tgdd.vn/Products/Images/42/209537/lg-v60-thinq-600x600-1-600x600.jpg', 0, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (2, N'Manager')
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (3, N'Staff')
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [First_Name], [Last_Name], [Role_ID], [Username], [Password], [Phone], [Address], [Email], [Status]) VALUES (1, N'Duc', N'Trieu Khac', 1, N'admin', N'123456', N'094741568', N'Thanh Tri, Ha Noi', NULL, 1)
INSERT [dbo].[Users] ([User_ID], [First_Name], [Last_Name], [Role_ID], [Username], [Password], [Phone], [Address], [Email], [Status]) VALUES (2, N'Long', N'Hoang Anh', 2, N'user1', N'123456', N'0912731734', N'Ha Noi', NULL, 1)
INSERT [dbo].[Users] ([User_ID], [First_Name], [Last_Name], [Role_ID], [Username], [Password], [Phone], [Address], [Email], [Status]) VALUES (3, N'Manh', N'Nguyen Duy 1', 4, N'user2', N'123456', N'0912384878', N'Ha Noi', NULL, 1)
INSERT [dbo].[Users] ([User_ID], [First_Name], [Last_Name], [Role_ID], [Username], [Password], [Phone], [Address], [Email], [Status]) VALUES (4, N'Long', N'vo', 4, N'long', N'abc', N'0391245642', N'Ha Noi 1', N'True', 1)
INSERT [dbo].[Users] ([User_ID], [First_Name], [Last_Name], [Role_ID], [Username], [Password], [Phone], [Address], [Email], [Status]) VALUES (5, N'Long', N'vo', 4, N'long', N'ge5Gidqb', N'0391245642', N'Ha Noi 1', N'lonhvo@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [PercentOfDiscount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__Status__3B75D760]  DEFAULT ((0)) FOR [Status]
GO
alter TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetail] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_ProductOrderDetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_UserOrder] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_UserOrder]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_CategoryProduct] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([Category_ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_CategoryProduct]
GO
USE [master]
GO
ALTER DATABASE [TechnoShop] SET  READ_WRITE 
GO
