/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [FashionShop]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 3/13/2018 11:50:52 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 3/13/2018 11:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Seqid] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/13/2018 11:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
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
/****** Object:  Table [dbo].[Orders]    Script Date: 3/13/2018 11:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [uniqueidentifier] NOT NULL,
	[SeqId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [uniqueidentifier] NULL,
	[PaymentMethodId] [int] NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[EmailAdress] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[LineAddress] [nvarchar](250) NOT NULL,
	[District] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](250) NULL,
	[OrderStatusId] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[AmountPaint] [decimal](18, 0) NOT NULL,
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
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 3/13/2018 11:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 3/13/2018 11:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/13/2018 11:50:52 PM ******/
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
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 3/13/2018 11:50:52 PM ******/
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
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 3/13/2018 11:50:52 PM ******/
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
/****** Object:  Table [dbo].[ShipmentMethods]    Script Date: 3/13/2018 11:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentMethods](
	[Shipment] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 3/13/2018 11:50:52 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 3/13/2018 11:50:52 PM ******/
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
/****** Object:  Table [dbo].[UserTypes]    Script Date: 3/13/2018 11:50:52 PM ******/
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
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'dcd20b15-4e28-40ea-8ddd-064d41c0a990', 11, N'00ce7451-8660-41ae-a66f-c56342b00ddb', 15, 1, CAST(450000 AS Decimal(18, 0)), CAST(N'2018-03-03T11:20:50.330' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:20:50.330' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'968e9abe-f015-45f9-bcd7-25e341b39f01', 10, N'00ce7451-8660-41ae-a66f-c56342b00ddb', 36, 1, CAST(250000 AS Decimal(18, 0)), CAST(N'2018-03-03T11:20:50.330' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:20:50.330' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c1d3e4e7-126d-4621-8f59-3170d94c6aae', 18, N'935b6ba8-1418-4375-a699-170fb3524af4', 1, 10, CAST(500000 AS Decimal(18, 0)), CAST(N'2018-03-13T23:47:34.833' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-13T23:47:34.833' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'b43bd02d-57f5-440e-abb0-a46001674217', 17, N'3f63f51f-4b0d-4781-ad75-5198c71b48aa', 15, 1, CAST(450000 AS Decimal(18, 0)), CAST(N'2018-03-03T12:43:37.207' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T12:43:37.207' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'7996d19e-5c6b-46cb-a53f-a80b0e971dd7', 15, N'be35e8bc-9b9f-49bc-afcc-a00c340728ba', 15, 1, CAST(450000 AS Decimal(18, 0)), CAST(N'2018-03-03T11:37:18.523' AS DateTime), N'm@gmail.com', CAST(N'2018-03-03T11:37:18.523' AS DateTime), N'm@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'78455abb-c040-41b2-9979-b8ef4fcc07ee', 16, N'3f63f51f-4b0d-4781-ad75-5198c71b48aa', 37, 1, CAST(250000 AS Decimal(18, 0)), CAST(N'2018-03-03T12:43:37.207' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T12:43:37.207' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'a6d25f97-ed9c-4792-a0a7-d514fec5a003', 14, N'c70dd8d5-0553-43dc-8fea-c26ea53cf9d9', 23, 1, CAST(360000 AS Decimal(18, 0)), CAST(N'2018-03-03T11:26:33.590' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:26:33.590' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd31fce36-83c3-41b6-b5cd-d8ed43b522b3', 13, N'51f03097-aada-4698-aa20-5c07b0989834', 36, 1, CAST(250000 AS Decimal(18, 0)), CAST(N'2018-03-03T11:21:22.843' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:21:22.843' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [SeqId], [OrderId], [ProductVariantId], [Quantity], [UnitPrice], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'30137677-44ff-429c-b083-e412ed0061fc', 12, N'51f03097-aada-4698-aa20-5c07b0989834', 15, 1, CAST(450000 AS Decimal(18, 0)), CAST(N'2018-03-03T11:21:22.843' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:21:22.843' AS DateTime), N'minh@gmail.com')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [SeqId], [CustomerId], [PaymentMethodId], [FullName], [EmailAdress], [Phone], [LineAddress], [District], [City], [Note], [OrderStatusId], [Amount], [AmountPaint], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (N'935b6ba8-1418-4375-a699-170fb3524af4', 11, NULL, 1, N'asdf', N'minh@gmail.com', N'12', N'd', N'aa', N'a', N'a', 1, CAST(5000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2018-03-13T23:47:34.830' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-13T23:47:34.830' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[Orders] ([OrderId], [SeqId], [CustomerId], [PaymentMethodId], [FullName], [EmailAdress], [Phone], [LineAddress], [District], [City], [Note], [OrderStatusId], [Amount], [AmountPaint], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (N'3f63f51f-4b0d-4781-ad75-5198c71b48aa', 10, NULL, 1, N'minh', N'minh@gmail.com', N'minh', N'minh', N'minh', N'minh', N'ship', 1, CAST(700000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2018-03-03T12:43:37.207' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T12:43:37.207' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[Orders] ([OrderId], [SeqId], [CustomerId], [PaymentMethodId], [FullName], [EmailAdress], [Phone], [LineAddress], [District], [City], [Note], [OrderStatusId], [Amount], [AmountPaint], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (N'51f03097-aada-4698-aa20-5c07b0989834', 7, NULL, 1, N'm', N'minh@gmail.com', N'm', N'm', N'm', N'm', N'ship', 1, CAST(700000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2018-03-03T11:21:22.843' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:21:22.843' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[Orders] ([OrderId], [SeqId], [CustomerId], [PaymentMethodId], [FullName], [EmailAdress], [Phone], [LineAddress], [District], [City], [Note], [OrderStatusId], [Amount], [AmountPaint], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (N'be35e8bc-9b9f-49bc-afcc-a00c340728ba', 9, NULL, 1, N'm', N'm@gmail.com', N'm', N'm', N'm', N'm', N'm', 1, CAST(450000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2018-03-03T11:37:18.523' AS DateTime), N'm@gmail.com', CAST(N'2018-03-03T11:37:18.523' AS DateTime), N'm@gmail.com')
INSERT [dbo].[Orders] ([OrderId], [SeqId], [CustomerId], [PaymentMethodId], [FullName], [EmailAdress], [Phone], [LineAddress], [District], [City], [Note], [OrderStatusId], [Amount], [AmountPaint], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c70dd8d5-0553-43dc-8fea-c26ea53cf9d9', 8, NULL, 1, N'moon', N'minh@gmail.com', N'm', N'm', N'm', N'm', N'mon', 1, CAST(360000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2018-03-03T11:26:33.587' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:26:33.587' AS DateTime), N'minh@gmail.com')
INSERT [dbo].[Orders] ([OrderId], [SeqId], [CustomerId], [PaymentMethodId], [FullName], [EmailAdress], [Phone], [LineAddress], [District], [City], [Note], [OrderStatusId], [Amount], [AmountPaint], [CreatedDate], [CreateBy], [ModifiedDate], [ModifiedBy]) VALUES (N'00ce7451-8660-41ae-a66f-c56342b00ddb', 6, NULL, 1, N'm', N'minh@gmail.com', N'm', N'm', N'm', N'm', N'ship', 1, CAST(700000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2018-03-03T11:20:50.327' AS DateTime), N'minh@gmail.com', CAST(N'2018-03-03T11:20:50.327' AS DateTime), N'minh@gmail.com')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([OrderStatusId], [OrderStatusName]) VALUES (1, N'New       ')
INSERT [dbo].[OrderStatuses] ([OrderStatusId], [OrderStatusName]) VALUES (2, N'In Progress')
INSERT [dbo].[OrderStatuses] ([OrderStatusId], [OrderStatusName]) VALUES (3, N'Done')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([PaymentMethodId], [PaymentMethodName], [Description]) VALUES (1, N'COD', N'Chuyen tien khi nhan hang')
INSERT [dbo].[PaymentMethods] ([PaymentMethodId], [PaymentMethodName], [Description]) VALUES (2, N'Transfer', N'Chuyen tien qua tai khoan ngan hang')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
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

INSERT [dbo].[ProductVariants] ([ProductVariantId], [ProductId], [Code], [SizeId], [ColorId], [Quantity], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 6, N'SP10001', 1, 1, 90, CAST(N'2018-01-22T22:48:07.217' AS DateTime), N'Admin', CAST(N'2018-03-13T23:47:34.830' AS DateTime), N'minh@gmail.com')
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
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetail_OrderDetailId]  DEFAULT (newid()) FOR [OrderDetailId]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetail_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_OrderId]  DEFAULT (newid()) FOR [OrderId]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
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
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductVariants] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([ProductVariantId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_ProductVariants]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatuses] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_OrderStatuses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentMethods] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_PaymentMethods]
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
