-- Creating Database

-- DROP DATABASE QLCuaHangDienThoaiDb
CREATE DATABASE QLCuaHangDienThoaiDb
GO
USE QLCuaHangDienThoaiDb
GO


--Creating tables

CREATE TABLE TaiKhoan(
	TenTaiKhoan varchar(50) PRIMARY KEY,
	MatKhau varchar(50),
	HoTen nvarchar(50),
	GioiTinh bit,
	SoDienThoai varchar(15),
	Email varchar(50),
	DiaChi nvarchar(255),
	IsAdmin bit
)
GO

CREATE TABLE LoaiDienThoai (
	Id int PRIMARY KEY identity(1, 1),
	Ten nvarchar(100),
	MoTa nvarchar(200)
)
GO

CREATE TABLE DienThoai(
	Id int PRIMARY KEY identity(1, 1),
	Ten nvarchar(100),
	MoTa nvarchar(1000),
	SoLuong int check(SoLuong > 0),
	UrlHinhAnh varchar(200),
	Gia int,
	IdLoaiDienThoai int REFERENCES LoaiDienThoai(Id)
)
GO


CREATE TABLE GioHang(
	Id int PRIMARY KEY identity(1, 1),
	TaiKhoan varchar(50) REFERENCES TaiKhoan(TenTaiKhoan),
	IdDienThoai int REFERENCES DienThoai(Id),
	DaDatHang bit default 0,
	NgayThem date,
)
GO

CREATE TABLE DatHang(
	Id int PRIMARY KEY identity(1, 1),
	TaiKhoan varchar(50) REFERENCES TaiKhoan(TenTaiKhoan),
	IdDienThoai int REFERENCES DienThoai(Id),
	TrangThai int check(TrangThai >= 1 and TrangThai <= 3), --['Chưa thanh toán', 'Đã thanh toán', 'Đã huỷ']
	NgayTao date,
	TongTien int
)
GO


-- Creating triggers
Create trigger deleteTaiKhoan on TaiKhoan instead of delete
as
begin
	declare @TaiKhoan varchar(50)
	select @TaiKhoan=TenTaiKhoan from deleted


	Delete from HoaDon where TaiKhoan=@TaiKhoan
	Delete from GioHang where TaiKhoan=@TaiKhoan
	Delete from TaiKhoan where TenTaiKhoan=@TaiKhoan
end
GO

Create trigger deleteLoaiDienThoai on LoaiDienThoai instead of delete
as
begin
	declare @IdLoaiDienThoai int
	select @IdLoaiDienThoai=Id from deleted


	Delete from DienThoai where IdLoaiDienThoai=@IdLoaiDienThoai
	Delete from LoaiDienThoai where Id=@IdLoaiDienThoai
end
GO

Create trigger deleteDienThoai on DienThoai instead of delete
as
begin
	declare @IdDienThoai int
	select @IdDienThoai=Id from deleted


	Delete from GioHang where IdDienThoai=@IdDienThoai
	Delete from DatHang where IdDienThoai=@IdDienThoai
	Delete from DienThoai where Id=@IdDienThoai
end
GO

Create trigger insertDatHang on DatHang for insert
as
begin
	declare @IdDienThoai int
	select @IdDienThoai=IdDienThoai from inserted

	Delete from GioHang where IdDienThoai=@IdDienThoai
end
GO



-- Creating procedures
Create proc spDangNhap @tenTK varchar(50), @matKhau varchar(50)
as
begin
	select * from TaiKhoan where TenTaiKhoan=@tenTK and MatKhau=@matKhau 
end
GO


--Inserting default data
Insert into TaiKhoan values
('Kbao', '123456', N'Hoàng Kim Bảo', 1, '0123455678', 'kimbaob@gmail.com', N'Ngõ 1 Phạm Văn Đồng', 1),
('Lminh', '123456', N'Lê Nguyên Minh', 1, '0123455678', 'Leminh@gmail.com', N'Ngõ 1 Phạm Văn Đồng', 1),
('Nminh', '123456', N'Trần Nhật Minh', 1, '0123455678', 'Nminh@gmail.com', N'Ngõ 1 Phạm Văn Đồng', 1),
('Tgiang', '123456', N'Nguyễn Trường Giang', 1, '0123455678', 'Truonggiang@gmail.com', N'Ngõ 1 Phạm Văn Đồng', 1),
('admin', '123456', N'Admin', 1, '0123455678', 'admin@gmail.com', N'Ngõ 1 Phạm Văn Đồng', 1),
('User', '123456', N'Khách Hàng 1', 0, '012345678', 'user@gmail.com', N'Ngõ 1 Phạm Văn Đồng', 0)
GO

Insert into LoaiDienThoai values
('IPhone', N'iPhone là mẫu smartphone của hãng điện tử Mỹ Apple Inc. Phiên bản iPhone đầu tiên ra mắt ngày 09 tháng 01 năm 2007 và lên kệ bán vào ngày 29 tháng 6 năm 2007.'),
('SamSung', N'Samsung đang kinh doanh các dòng điện thoại như: Galaxy A, Galaxy J, Galaxy S và mới đây là là Galaxy M. Tuy nhiên, nổi bật nhất vẫn là các sản phẩm cao cấp Galaxy Galaxy S10.'),
('Nokia', N'uhm...Nokia phones?'),
('OPPO', N'Sản phẩm đầu tiên đánh dấu sự xuất hiện của OPPO tại thị trường Việt Nam là chiếc smartphone OPPO Find 5, xuất hiện vào cuối năm 2012 với mức giá khoảng 10 triệu đồng.'),
('Vertu', N'Vertu là dòng điện thoại sang trọng và đẳng cấp với mức giá đắt đỏ bậc nhất thế giới. Đây là dòng điện thoại kém người dùng, thường chỉ được những doanh nhân hay đại gia ưa chuộng.')
GO

Insert into DienThoai values
('IPhone 10', N'iPhone là mẫu smartphone của hãng điện tử Mỹ Apple Inc', 100, 'Images/iphone_10.jpg', 25000000, 1),
('IPhone 11', N'iPhone là mẫu smartphone của hãng điện tử Mỹ Apple Inc', 100, 'Images/iphone_11.jpg', 25000000, 1),
('IPhone 12', N'iPhone là mẫu smartphone của hãng điện tử Mỹ Apple Inc', 100, 'Images/iphone12.jpg', 25000000, 1),
('IPhone 13', N'iPhone là mẫu smartphone của hãng điện tử Mỹ Apple Inc', 100, 'Images/iphone_13.jpg', 25000000, 1),
('IPhone 14', N'iPhone là mẫu smartphone của hãng điện tử Mỹ Apple Inc', 100, 'Images/iphone_14.jpg', 25000000, 1),
('IPhone 15', N'iPhone là mẫu smartphone của hãng điện tử Mỹ Apple Inc', 100, 'Images/iphone_15.jpg', 25000000, 1),
('SamSung J2', N'Samsung đang kinh doanh các dòng điện thoại như: Galaxy J.', 70, 'Images/ss_j2.jpg', 2500000, 2),
('SamSung J7', N'Samsung đang kinh doanh các dòng điện thoại như: Galaxy J.', 70, 'Images/ss_j7.jpg', 5000000, 2),
('SamSung A50', N'Samsung đang kinh doanh các dòng điện thoại như: Galaxy A.', 70, 'Images/ss_A50.jpg', 7000000, 2),
('SamSung S20', N'Samsung đang kinh doanh các dòng điện thoại như: Galaxy S.', 70, 'Images/ss_S20.jpg', 25000000, 2),
('SamSung M35', N'Samsung đang kinh doanh các dòng điện thoại như: Galaxy M.', 70, 'Images/ss_m35.jpg', 7500000, 2),
('Nokia 5000', N'Nokia đang kinh doanh các dòng điện thoại', 70, 'Images/N_5000.jpg', 250000, 3),
('Nokia 150 MUSIC', N'Nokia đang kinh doanh các dòng điện thoại', 70, 'Images/n_150.jpg', 250000, 3),
('Nokia 6310', N'Nokia đang kinh doanh các dòng điện thoại', 70, 'Images/n_6310.jpg', 250000, 3),
('Nokia G310', N'Nokia đang kinh doanh các dòng điện thoại', 70, 'Images/n_g310.jpg', 2500000, 3),
('Nokia C32', N'Nokia đang kinh doanh các dòng điện thoại', 70, 'Images/n_c32.jpg', 3500000, 3),
('OPPO A5s', N'Sản phẩm đầu tiên đánh dấu sự xuất.', 50, 'Images/OPPO_A5s.jpg', 5000000, 4),
('OPPO A60', N'Sản phẩm đầu tiên đánh dấu sự xuất.', 50, 'Images/oppo_a60.jpg', 9000000, 4),
('OPPO FX8', N'Sản phẩm đầu tiên đánh dấu sự xuất.', 50, 'Images/oppo_fx8.jpg', 10000000, 4),
('OPPO F7', N'Sản phẩm đầu tiên đánh dấu sự xuất.', 50, 'Images/oppo_f7.jpg', 5000000, 4),
('OPPO F9', N'Sản phẩm đầu tiên đánh dấu sự xuất.', 50, 'Images/oppo_F9.jpg', 3000000, 4),
('Vertu Aster', N'Vertu', 50, 'Images/v_aster.jpg', 400000000, 5),
('Vertu Signature V', N'Vertu', 50, 'Images/v_sigv.jpg', 700000000, 5),
('Vertu Ascent', N'Vertu', 50, 'Images/v_ascent.jpg', 300000000, 5),
('Vertu Constellation 2006', N'Vertu', 50, 'Images/v_c2006.jpg', 800000000, 5),
('Vertu Constellation Quest', N'Sản phẩm đầu tiên đánh dấu sự xuất.', 50, 'Images/v_cq.jpg', 1000000000, 5)
GO
