--Bài 4. Ngôn ngữ định nghĩa dữ liệu
--1. Nhắc lại các lệnh tạo csdl (create database), tạo bảng (create table), kiểu dữ liệu 
--2. Các lệnh thay đổi cấu trúc bảng (alter table)
--a. Thêm 1 cột vào bảng:
	alter table Ten_bang
	add tencot kiểu dl

--VD: Thêm cột email vào bảng Khachhang
	alter table KHACHHANG
	add email nvarchar(30)

--b. Xóa cột trong bảng
	alter table ten_bang
	drop column ten_cot

-- VD: Xóa cột email trong bảng Khachhang
	alter table KhachHang
	drop column email

--II. Thêm các ràng buộc vào bảng
--1. Thêm ràng buộc check (kiểm tra miền giá trị)
	alter table ten_bang
	add constraint ten_rang_buoc check(dieu_kien)

-- VD1: Thêm ràng buộc check số tiên >100 cho bảng TaiKhoan
	alter table taikhoan
	add constraint CK_Taikhoan_sotien check(sotien>100)

--2. Thêm ràng buộc khóa chính vào bảng
	alter table ten_bang
	add constraint ten_rang_buoc primary key(ten_cot)

--VD: nếu bảng Khachhang khi tạo bảng ta chưa tạo khóa chính,
-- thì ta có thể dùng cú pháp sau để tạo khóa chính cho bảng khachhang
	alter table KHACHHANG
	add constraint PK_KHACHHANG	primary key(MaKH)

--3. Thêm ràng buộc khóa ngoại (đứng ở bảng nhiều / tạo cho bảng nhiều).
	alter table ten_bang
	add constraint ten_rang_buoc foreign key(cot_chung) references Bang1(cot_chung)

-- Tạo khóa ngoại cho bảng TaiKhoan (đứng ở bảng TaiKhoan)
	alter table Taikhoan
	add constraint FK_TaiKhoan_Khachhang foreign key(MaKH) references Khachhang(MaKH)

--4. Thêm ràng buộc duy nhất
	alter table ten_bang
	add constraint ten_rang_buoc unique(ten_cot)

-- VD: Thêm ràng buộc số ĐT là duy nhất trong bảng khachhang
	alter table Khachhang
	add constraint UQ_Khachhang_soDT unique(SoDienThoai)



--III. Lệnh Drop (xóa cấu trúc)
	drop table Ten_bang -- Xóa bảng
	drop database ten_CSDL -- xóa CSDL

-- VD: xóa CSDL
	drop database QLSach2

-- xóa bảng
	drop table GIAODICH
	drop table TAIKHOAN
