create database QLDA
go

use QLDA
go

create table DUAN(
      MaDuAn nvarchar(10) , 
	  TenDuAn nvarchar(50) ,
	  DiaChi nvarchar(150) , 
	  primary key (MaDuAn)
)

create table NHANVIEN (
     MaNhanVien nvarchar(10) ,
	 HoTen nvarchar(50), 
	 NgaySinh datetime  ,
	 QueQuan nvarchar(100) ,
	 SDT nvarchar(13) ,
	 HeSoLuong int ,
	 primary key (MaNhanVien)
)

create table NV_DA(
    MaNhanVien nvarchar(10) ,
	MaDuAn nvarchar(10) , 
	NgayThamGia datetime , 
	NgayKetThuc datetime 
	primary key (MaNhanVien , MaDuAn ) ,
	foreign key (MaNhanVien) references NHANVIEN(MaNhanVien) ,
	foreign key (MaDuAn) references DUAN (MaDuAn) 
)

insert into DUAN(MaDuAn , TenDuAn , DiaChi )
values ( 'KH01' , N'Bán Đất'  , N'196 Phùng hưng TP.Hà Nội') ,
       ( 'KH02' , N'Bán Kẹo'  , N'32 Xuân Phươn TP.Hà Nội') ,
	   ( 'KH03' , N'Làm Đường'  , N'48 Lý Thường Kiệt TP.Đà Nẵng') ,
	   ( 'KH04' , N'Trồng rừng'  , N'142 Khuất duy tiến TP.Thanh Hóa') ,
	   ( 'KH05' , N'Xây Cầu'  , N'196 Phùng hưng TP.Hà Nội') ;
go

insert into NHANVIEN( MaNhanVien , HoTen , NgaySinh , QueQuan , SDT , HeSoLuong )
values ('HT01' , N'Lê Minh Thụy' , '1-6-2001' , N'Hà Nội' , '014155669' , 2) ,
       ('HT02' , N'Đào Văn Đức' , '6-2-2000' , N'Hà Nội' , '014185669' , 3) ,
	   ('HT03' , N'Lê Văn Sơn' , '2-6-1999' , N'Hà Nội' , '014155625' , 1) ,
	   ('HT04' , N'Tạ Văn Thực' , '11-10-2001' , N'Hà Nội' , '0141551459' , 2) ,
	   ('HT05' , N'Lê Quang Hải' , '12-12-2000' , N'Hà Nội' , '014155149' , 1) ;
go

insert into NV_DA (MaNhanVien , MaDuAn , NgayThamGia , NgayKetThuc )
values ('HT01' , 'KH02' , '2-2-2015' , '9-9-2016') ,
       ('HT01' , 'KH04' , '1-12-2009' , '1-1-2010') ,
	   ('HT03' , 'KH02' , '2-2-2012' , '3-2-2016') ,
	   ('HT04' , 'KH04' , '6-9-2011' , '2-9-2019') ,
	   ('HT05' , 'KH05' , '5-4-2016' , '9-3-2017') ;
go

--Bài 1 

select MaNhanVien , HoTen , NgaySinh  --1
from NHANVIEN
where YEAR(NgaySinh) = 1990 
go

select NHANVIEN.*  --2
from NHANVIEN inner join NV_DA on NHANVIEN.MaNhanVien = NV_DA.MaNhanVien 
where MaDuAn = 'DA01' or MaDuAn = 'DA02'
go

 select HoTen , count(MaDuAn) as SoDuAnThamGia --3
 from NHANVIEN left outer join NV_DA on NHANVIEN.MaNhanVien = NV_DA.MaNhanVien
 group by HoTen
 go

select NHANVIEN.*
from DUAN left outer join NV_DA on NV_DA.MaDuAn = DUAN.MaDuAn
where MaNV is null
go


select HoTen , QueQuan , HeSoLuong , HeSoLuong * 900 + 1000 as LuongThucLinh --5
from NHANVIEN
order by LuongThucLinh desc
go

update NHANVIEN  -- 6
set HoTen = N'Nguyễn Lan Hương'
where MaNhanVien like 'NV001'



--Câu 1. In danh sách mã nhân viên, họ tên, ngày sinh của nhân viên sinh năm 1990 
select MaNV,Hoten,NgaySinh
from NhanVien
where YEAR(NgaySinh) = 1990

--Câu 2. Tìm thông tin nhân viên đã tham gia dự án có mã “DA01” , “DA02” 
select NhanVien.*
from NhanVien inner join DA_NV on NhanVien.MaNV=DA_NV.MaNV
where MaDA like 'DA001' or MaDA like 'DA002'

--Câu 3. Thống kê số dự án đã tham gia của từng nhân viên, kể cả những nhân 
--viên chưa tham gia dự án nào (Đưa ra thông tin: Tên nhân viên, số dự án tham gia) 

select Hoten,COUNT(DA_NV.MaNV) as solanthamgia
from NhanVien left outer join DA_NV on NhanVien.MaNV=DA_NV.MaNV
group by Hoten

--Câu 4. Đưa ra thông tin dự án chưa có nhân viên nào tham gia?

select DuAn.*
from DuAn  left outer join DA_NV on DuAn.MaDA=DA_NV.MaDA
where MaNV is null

--Câu 5.  Đưa ra họ tên,quê quán, hệ số lương, lương thực lĩnh của tất cả các nhân viên 
--(biết Lương thực lĩnh=hệ số lương * 900+ 1000) và sắp xếp theo lương thực lĩnh giảm dần

select Hoten,QueQuan,HeSoLuong,HeSoLuong*900+1000 as Luongthuclinh
from NhanVien
order by Luongthuclinh desc

--Câu 6. Sửa tên của nhân viên có mã “NV001” thành “Nguyễn Lan Hương” 

update NhanVien
set Hoten = N'Nguyễn Lan Hương'
where MaNV like 'NV001'