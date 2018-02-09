/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [FashionShop]    Script Date: 2/9/2018 10:22:38 PM ******/
CREATE DATABASE [FashionShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FashionShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FashionShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FashionShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FashionShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FashionShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FashionShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FashionShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FashionShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FashionShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FashionShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FashionShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FashionShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FashionShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FashionShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FashionShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FashionShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FashionShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FashionShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FashionShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FashionShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FashionShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FashionShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FashionShop] SET  MULTI_USER 
GO
ALTER DATABASE [FashionShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FashionShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FashionShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FashionShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FashionShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FashionShop', N'ON'
GO
ALTER DATABASE [FashionShop] SET QUERY_STORE = OFF
GO
USE [FashionShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FashionShop]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Seqid] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[LineAddress] [nvarchar](250) NULL,
	[District] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [uniqueidentifier] NOT NULL,
	[SeqId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [uniqueidentifier] NULL,
	[PaymentMethodId] [int] NOT NULL,
	[Phone] [int] NOT NULL,
	[LineAddress] [nvarchar](250) NOT NULL,
	[District] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](250) NULL,
	[OrderStatusId] [int] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[PaymentAmount] [decimal](18, 0) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [uniqueidentifier] NOT NULL,
	[SeqId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductVariantId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariants](
	[ProductVariantId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[SizeId] [int] NOT NULL,
	[ColorId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductVariants] PRIMARY KEY CLUSTERED 
(
	[ProductVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentMethods]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentMethods](
	[Shipment] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[SeqId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2/9/2018 10:22:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1, N'Trắng')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (2, N'Đỏ')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, N'nam2', N'ÁO KHOÁC OC-WOVEN 1', N'/Content/img/nam2.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(450000 AS Decimal(18, 0)), 2, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, N'nam3', N'ÁO KHOÁC-OH-KNIT 9', N'/Content/img/nam3.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(200000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, N'nam4', N'ÁO KHOÁC-OH-KNIT 8', N'/Content/img/nam4.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(250000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 1, N'nam5', N'ĐÔI KẾT HỢP CPS-FA 24', N'/Content/img/nam5.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(250000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 1, N'nam6', N'ĐÔI KẾT HỢP CPS-FA 24', N'/Content/img/nam6.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(500000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 1, N'nam7', N'Mu', N'/Content/img/nam7.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(400000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 1, N'nam8', N'ÁO KHOÁC-OH-KNIT 8', N'/Content/img/nam8.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(450000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 1, N'nam9', N'ÁO KHOÁC-OH-KNIT 8', N'/Content/img/nam9.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(700000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 2, N'nu1', N'ÁO KHOÁC POJ-KNIT 20', N'/Content/img/nu1.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(360000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 2, N'nu2', N'ÁO KHOÁC POJ-KNIT 20', N'/Content/img/nu2.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(500000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 2, N'nu3', N'ÁO KHOÁC POJ-KNIT 20', N'/Content/img/nu3.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(350000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 2, N'nu4', N'ÁO KHOÁC POJ-KNIT 20', N'/Content/img/nu4.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(650000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 2, N'nu5', N'ÁO KHOÁC OJ-KNIT 20', N'/Content/img/nu5.jpg', N'Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.', CAST(350000 AS Decimal(18, 0)), 20, 1, N'-Áo thun gia đình với chất liệu 100% Cotton, độ co giãn tốt, tạo sự thoải mái cho cả gia đình trong những chuyến vui chơi, dã ngoại.

-Kỹ thuật in phủ bề mặt tạo sự mới lạ và hấp dẫn cho thị giác.

-Áo nam, kid form cơ bản. Áo nữ nhấn phần lai bầu tạo sự trẻ trung, mới lạ.', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 3, N'kid1', N'ÁO POLO CPO-STRIPES 10', N'/Content/img/kid1.jpg', N'ÁO THUN POLO CẶP ĐÔI IN TẤM
- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch', CAST(250000 AS Decimal(18, 0)), 20, 1, N'ÁO THUN POLO CẶP ĐÔI IN TẤM

- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch

- Logo cách điệu thêu ngực trái, vải pique 4 chiều thoải
mái

- Áo polo thanh lịch, đơn giản, dễ kết hợp với các loại quần, váy, phù hợp đi làm, đi học hay cuối tuần đi chơi, dạo phố', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 3, N'kid2', N'ÁO POLO CPO-STRIPES 10', N'/Content/img/kid2.jpg', N'ÁO THUN POLO CẶP ĐÔI IN TẤM
- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch', CAST(250000 AS Decimal(18, 0)), 20, 1, N'ÁO THUN POLO CẶP ĐÔI IN TẤM

- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch

- Logo cách điệu thêu ngực trái, vải pique 4 chiều thoải
mái

- Áo polo thanh lịch, đơn giản, dễ kết hợp với các loại quần, váy, phù hợp đi làm, đi học hay cuối tuần đi chơi, dạo phố', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 3, N'kid3', N'KIDS', N'/Content/img/kid3.jpg', N'ÁO THUN POLO CẶP ĐÔI IN TẤM- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch', CAST(250000 AS Decimal(18, 0)), 20, 1, N'ÁO THUN POLO CẶP ĐÔI IN TẤM- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch- Logo cách điệu thêu ngực trái, vải pique 4 chiều thoảimái- Áo polo thanh lịch, đơn giản, dễ kết hợp với các loại quần, váy, phù hợp đi làm, đi học hay cuối tuần đi chơi, dạo phố', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 3, N'kid4', N'ÁO POLO CPO-STRIPES 10', N'/Content/img/kid4.jpg', N'ÁO THUN POLO CẶP ĐÔI IN TẤM
- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch', CAST(250000 AS Decimal(18, 0)), 20, 1, N'ÁO THUN POLO CẶP ĐÔI IN TẤM

- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch

- Logo cách điệu thêu ngực trái, vải pique 4 chiều thoải
mái

- Áo polo thanh lịch, đơn giản, dễ kết hợp với các loại quần, váy, phù hợp đi làm, đi học hay cuối tuần đi chơi, dạo phố', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 3, N'kid5', N'ÁO POLO CPO-STRIPES 10', N'/Content/img/kid5.jpg', N'ÁO THUN POLO CẶP ĐÔI IN TẤM
- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch', CAST(250000 AS Decimal(18, 0)), 20, 1, N'ÁO THUN POLO CẶP ĐÔI IN TẤM

- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch

- Logo cách điệu thêu ngực trái, vải pique 4 chiều thoải
mái

- Áo polo thanh lịch, đơn giản, dễ kết hợp với các loại quần, váy, phù hợp đi làm, đi học hay cuối tuần đi chơi, dạo phố', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 3, N'kid6', N'ÁO POLO CPO-STRIPES 10', N'/Content/img/kid6.jpg', N'ÁO THUN POLO CẶP ĐÔI IN TẤM
- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch', CAST(250000 AS Decimal(18, 0)), 20, 1, N'ÁO THUN POLO CẶP ĐÔI IN TẤM

- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch

- Logo cách điệu thêu ngực trái, vải pique 4 chiều thoải
mái

- Áo polo thanh lịch, đơn giản, dễ kết hợp với các loại quần, váy, phù hợp đi làm, đi học hay cuối tuần đi chơi, dạo phố', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, 4, N'sport1', N'ÁO POLO CPO-STRIPES 10', N'/Content/img/sp1.jpg', N'ÁO THUN POLO CẶP ĐÔI IN TẤM
- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch', CAST(250000 AS Decimal(18, 0)), 20, 1, N'ÁO THUN POLO CẶP ĐÔI IN TẤM

- Họa tiết cách điệu in tấm tràn thân áo kết hợp bo sọc nhã nhặn, thanh lịch

- Logo cách điệu thêu ngực trái, vải pique 4 chiều thoải
mái

- Áo polo thanh lịch, đơn giản, dễ kết hợp với các loại quần, váy, phù hợp đi làm, đi học hay cuối tuần đi chơi, dạo phố', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, 4, N'sport3', N'ÁO POLO CPO-STRIPES 10', N'/Content/img/sp3.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(250000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, 4, N'sport4', N'QUẦN THỂ THAO SA-SHORT', N'/Content/img/sp4.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(250000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, 4, N'sport5', N'QUẦN THỂ THAO SA-SHORT', N'/Content/img/sp5.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(250000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, 4, N'sport6', N'QUẦN THỂ THAO SA-SHORT', N'/Content/img/sp6.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(350000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, 4, N'sport7', N'QUẦN THỂ THAO SA-SHORT', N'/Content/img/sp7.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(30000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, 5, N'phukien1', N'NÓN AOH-HAT 4', N'/Content/img/pk1.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(300000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, 5, N'phukien2', N'NÓN AOH-HAT ', N'/Content/img/pk2.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(300000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
INSERT [dbo].[Products] ([ProductId], [ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [IsActive], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, 5, N'phukien3', N'NÓN AOH-HAT ', N'/Content/img/pk3.jpg', N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', CAST(300000 AS Decimal(18, 0)), 20, 1, N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.213' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description]) VALUES (1, N'Men', NULL)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description]) VALUES (2, N'Women', NULL)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description]) VALUES (3, N'Kid', NULL)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description]) VALUES (4, N'Sports', NULL)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description]) VALUES (5, N'Asscesories', NULL)
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
SET IDENTITY_INSERT [dbo].[ProductVariants] ON 

INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 6, N'SP10001', 1, 1, 100, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 6, N'SP10002', 2, 1, 20, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 6, N'SP10003', 3, 1, 40, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 6, N'SP10004', 1, 2, 50, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 6, N'SP10005', 2, 2, 4, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 2, N'SP100100', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, 3, N'SP100101', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, 4, N'SP100102', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, 5, N'SP100105', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, 6, N'SP100106', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, 7, N'SP100107', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, 8, N'SP100108', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, 9, N'SP100109', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, 10, N'SP1001010', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, 11, N'SP1001011', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, 12, N'SP1001012', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, 13, N'SP1001013', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, 14, N'SP1001014', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, 16, N'SP1001016', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, 12, N'SP1001012', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, 17, N'SP1001017', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, 18, N'SP1001018', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, 19, N'SP1001019', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, 20, N'SP1001020', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, 21, N'SP1001021', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, 22, N'SP1001022', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, 24, N'SP1001023', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, 25, N'SP1001025', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, 26, N'SP1001026', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, 27, N'SP1001028', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, 29, N'SP1001029', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, 30, N'SP1001030', 1, 1, 200, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[ProductVariants] OFF
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (1, N'XS')
INSERT [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (2, N'S')
INSERT [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (3, N'M')
INSERT [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (4, N'L')
INSERT [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (5, N'XL')
INSERT [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (6, N'XXL')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeName]) VALUES (1, N'User')
INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeName]) VALUES (2, N'Admin')
INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeName]) VALUES (3, N'Finance')
INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeName]) VALUES (4, N'Support')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_CustomerId]  DEFAULT (newid()) FOR [CustomerId]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderId]  DEFAULT (newid()) FOR [OrderId]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_OrderDetailId]  DEFAULT (newid()) FOR [OrderDetailId]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ProductVariants] ADD  CONSTRAINT [DF_ProductVariants_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductVariants] ADD  CONSTRAINT [DF_ProductVariants_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserId]  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatuses] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatuses]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentMethods] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentMethods]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentStatus]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductVariants] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([ProductVariantId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductVariants]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([ColorId])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Colors]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Products]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Sizes] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([SizeId])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Sizes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Customers] FOREIGN KEY([UserId])
REFERENCES [dbo].[Customers] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Customers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([UserTypeId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [FashionShop] SET  READ_WRITE 
GO
