/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/



INSERT [dbo].[Products] ([ProductTypeId], [Code], [Name], [Image], [Description], [Price], [Quantity], [Content]) 
VALUES ( 4, 
N'sport4', 
N'QUẦN THỂ THAO SA-SHORT',
 N'/Content/img/sp4.jpg',
  N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.', 
CAST(250000 AS Decimal(18, 0)), 20, 
 N'QUẦN SHORT THỂ THAO PHỐI ĐÔ SAU

Quần short thể thao - sản phẩm mới của Couple TX, thuộc dòng hàng thể thao 30 MIN

Sản phẩm phù hợp với những hoạt động hằng ngày như chạy bộ, tập thể dục, chơi các môn thể thao như cầu lông, tennis.

Điểm nhấn sản phẩm:

+ Chất liệu vải dù mềm mại, phối màu nổi phần đô sau

+ Quần nam túi bên phải có dây kéo miệng túi, đô sau rã coup, dây kéo nhỏ tiện lợi

+ Quần có 2 lớp, lớp lót bên trong bằng lưới mềm mại, đảm bảo an toàn khi sử dụng

Thông điệp: Duy trì vận động 30 phút mỗi ngày để bảo vệ sức khỏe cho bản thân và gia đình')
GO
