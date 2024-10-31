USE [master]
GO
/****** Object:  Database [ProductDB]    Script Date: 10/31/2024 9:54:03 PM ******/
CREATE DATABASE [ProductDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CHIKHANG\MSSQL\DATA\ProductDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CHIKHANG\MSSQL\DATA\ProductDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProductDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ProductDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProductDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProductDB', N'ON'
GO
ALTER DATABASE [ProductDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProductDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProductDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/31/2024 9:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cat_id] [int] NOT NULL,
	[Cat_Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/31/2024 9:54:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pro_id] [int] NOT NULL,
	[pro_name] [varchar](255) NOT NULL,
	[pro_image] [varchar](255) NULL,
	[pro_price] [varchar](50) NOT NULL,
	[pro_description] [text] NULL,
	[pro_title] [varchar](50) NULL,
	[cat_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([cat_id], [Cat_Name]) VALUES (1, N'Fruit')
INSERT [dbo].[Category] ([cat_id], [Cat_Name]) VALUES (2, N'Vegetable')
INSERT [dbo].[Category] ([cat_id], [Cat_Name]) VALUES (3, N'Juice')
GO
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (1, N'Dragon fruit', N'image/fruit/Thanhlong.png', N'79000', N'Red peel, white or red flesh with a mildly sweet taste.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (2, N'Hoa Loc Mango', N'image/fruit/xoai.png', N'65000', N'Thin peel with a fragrant, sweet taste.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (3, N'Lo Ren Milk Fruit', N'image/fruit/Vusua.jpg', N'105000', N'Thin peel with a lightly fragrant, sweet flesh.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (4, N'Rambutan', N'image/fruit/chomchom.jpg', N'45000', N'Red peel with soft spines, mildly sweet.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (5, N'Hung Yen Longan', N'image/fruit/nhan.jpg', N'40000', N'Small fruit, crunchy and sweet flesh.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (6, N'Ri6 Durian', N'image/fruit/saurieng.png', N'160000', N'Thick, fragrant, creamy sweet flesh.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (7, N'Lychee', N'image/fruit/vaithieu.png', N'50000', N'Red peel, juicy, sweet, and fragrant.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (8, N'Apricot', N'image/fruit/MO.png', N'35000', N'Sweet and rich in vitamin C, perfect for summer desserts.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (9, N'Pineapple', N'image/fruit/Dua-thom.jpg', N'14000', N'Sweet, crispy, perfect for salads and smoothies.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (10, N'Papaya', N'image/fruit/du Du.jpg', N'40000', N'Soft, sweet, rich in vitamin C and fiber.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (11, N'Duong Tangerine', N'image/fruit/Quyt Duong.jpg', N'25000', N'Fragrant, sweet tangerine rich in vitamin C, boosting immunity.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (12, N'Pear Guava', N'image/fruit/oile.jpg', N'25000', N'Crunchy and sweet with a distinct flavor.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (13, N'Seedless Lemon', N'image/fruit/Chanhkhonghat.jpg', N'28000', N'Fresh, rich in vitamin C, ideal for drinks and seasoning.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (14, N'Envy Apple', N'image/fruit/taoenvy.png', N'199000', N'Crispy, sweet, visually appealing, and healthy.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (15, N'Korean Pear', N'image/fruit/lehanquoc.jpg', N'90000', N'Golden peel, crispy, juicy, and mildly sweet.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (16, N'American Black Grapes', N'image/fruit/nhoden.jpg', N'135000', N'Large, seedless, sweet, and fragrant.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (17, N'Chilean Cherry', N'image/fruit/cherry.jpg', N'140000', N'Small, sweet, juicy, perfect for desserts.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (18, N'Australian Tangerine', N'image/fruit/quytuc.jpg', N'130000', N'Sweet, easy to peel, rich in juice.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (19, N'Peruvian Pomegranate', N'image/fruit/lulu.png', N'299000', N'Juicy, sweet and sour, rich in vitamins and minerals.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (20, N'New Zealand Golden Kiwi', N'image/fruit/kiwi.jpg', N'275000', N'Thin peel, golden flesh, sweet and soft, rich in vitamin C.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (21, N'Japanese Melon', N'image/fruit/dualuoinhatban.jpg', N'120000', N'Sweet, fragrant, and refreshing.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (22, N'Hass Avocado', N'image/fruit/bohass.jpg', N'90000', N'Rough skin, creamy flesh, perfect for smoothies and dishes.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (23, N'Thai Jackfruit', N'image/fruit/mitthai.jpg', N'80000', N'Sweet with a strong fragrance, a favorite snack.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (24, N'American Blueberries', N'image/fruit/vietquatmy.png', N'198000', N'Small, sweet, and juicy, perfect for salads.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (25, N'Indian Pomegranate', N'image/fruit/luuan.jpg', N'198000', N'Bright red, sweet, and sour, rich in nutrients.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (26, N'Egyptian Orange', N'image/fruit/camaicai.jpg', N'91500', N'Sweet, juicy, and easy to peel, ideal for breakfast.', N'good', 1)
INSERT [dbo].[Product] ([pro_id], [pro_name], [pro_image], [pro_price], [pro_description], [pro_title], [cat_id]) VALUES (27, N'Chinese cabbage', N'image/vegetable/bapcaithao.jpg', N'15000', N'Fresh, crispy cabbage', N'good', 2)
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('good') FOR [pro_title]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cat_id])
REFERENCES [dbo].[Category] ([cat_id])
GO
USE [master]
GO
ALTER DATABASE [ProductDB] SET  READ_WRITE 
GO
