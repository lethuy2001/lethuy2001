create database QLS
go

use QLS
go

create table KHOANGHANh(
    MaKN nvarchar(10) ,
	TenKN nvarchar(50) ,
	primary key (MaKN) 
)
go

create table SINHVIEN(
    MSSV nvarchar(10) not null,
	HoTen nvarchar(25) not null,
	MaKN nvarchar(10) ,
	CMND nvarchar(15) not null,
	DienThoai nvarchar(15) ,
	email nvarchar(40) ,
	ThoiHanThe int , 
	primary key (MSSV) ,
	foreign key(MaKN) references KHOANGHANH(MaKN) 
)
go

create table PHIEUMUON (
    SoPhieuMuon int ,
	MSSV nvarchar(10) ,
	MaLop nvarchar(10) ,
	NgayMuon datetime ,
	NgayTra datetime ,
	TongSoSachMuon int , 
	TrangThai nvarchar(100) ,
	primary key(SoPhieuMuon) ,
	foreign key(MSSV) references SINHVIEN(MSSV) ,
	check(TongSoSachMuon > 0 ) ,
	check(SoPhieuMuon > 0 ) 
)
go

create table THELOAI(
    MaTheLoai nvarchar(10) ,
	TenTheLoai nvarchar(50) ,
	primary key (MaTheLoai) 
)
go

create table SACH(
   MaSach nvarchar(10) ,
   TenSach nvarchar(50) ,
   NSX datetime ,
   SoTrang int ,
   SoLuong int  ,
   GiaTien money ,
   NgayNhap datetime ,
   ViTriDat nvarchar(50) ,
   MaTheLoai nvarchar(10) ,
   primary key(MaSach) ,
   foreign key(MaTheLoai) references THELOAI(MaTheLoai) ,
   check(SoTrang > 5 ) ,
   check(SoLuong > 1 ) ,
   check(GiaTien > 0 ) 
)
go

create table TACGIA(
   MaTG nvarchar(10) ,
   TenTG nvarchar(25) ,
   SoDT nvarchar(15) ,
   Email nvarchar(50) ,
   primary key(MaTG) ,
)
go

create table SACH_TG(
   MaSach nvarchar(10) ,
   MaTG nvarchar(10) ,
   primary key( MaSach , MaTG) ,
   foreign key (MaTG) references TACGIA(MaTG) ,
   foreign key(MaSach) references SACH(MaSach) 
)
go

create table CTMUON(
   SoPhieuMuon int ,
   MaSach nvarchar(10) ,
   GhiChu nvarchar(50) ,
   primary key(SoPhieuMuon , MaSach) ,
   foreign key(SoPhieuMuon) references PHIEUMUON(SoPhieuMuon) ,
   foreign key(MaSach) references SACH(MaSach) 
)
go

Insert into KHOANGHANh( MaKN , TenKN )
values ('K001' , N'Thiên Văn');
Insert into KHOANGHANh( MaKN , TenKN )
values ('K002' , N'Thiên Văn Học');
Insert into KHOANGHANh( MaKN , TenKN )
values ('K003' , N'Toán');
Insert into KHOANGHANh( MaKN , TenKN )
values ('K004' , N'Văn Học');
Insert into KHOANGHANh( MaKN , TenKN )
values ('K005' , N'Siêu Nhân');
go

Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H001' , N'Lê Minh Thụy' , 'K001' , '15584284325' , '015458452' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H002' , N'Lê Minh Sơn' , 'K001' , '15584848425' , '01548522' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H003' , N'Lê Minh Văn' , 'K002' , '155855225' , '015221152' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H004' , N'Lưu Thành Vinh' , 'K002' , '1554154325' , '0154128452' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H005' , N'Siêu Văn Nhân' , 'K003' , '1558545225' , '015558452' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H006' , N'Lò Văn Sửu' , 'K003' , '158524625' , '015458452' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H007' , N'Lê thành Cu' , 'K004' , '1558485425' , '015458452' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H008' , N'Tạ Văn Ba' , 'K004' , '155451545' , '015458452' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H009' , N'Lê Hoa Mai' , 'K005' , '1558844525' , '015458452' , N'LeMinhThuy@gmail.com' , 5); 
Insert into SINHVIEN(MSSV , HoTen , MaKN , CMND , DienThoai , email , ThoiHanThe )
values ('H010' , N'Cao kỳ Thủ' , 'K005' , '155855225' , '015458452' , N'LeMinhThuy@gmail.com' , 5); 
go

Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (1 , 'H001' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values ( 2, 'H002' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (3 , 'H003' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (4 , 'H004' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (5 , 'H005' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (6 , 'H006' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (7 , 'H007' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (8 , 'H008' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (9 , 'H009' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
Insert into PHIEUMUON(SoPhieuMuon , MSSV , MaLop , NgayMuon , NgayTra , TongSoSachMuon , TrangThai )
values (10 , 'H010' , 'KH01' , '5-6-2009' , '6-25-2018' , 6 , N'Tốt' );
go

Insert into THELOAI( MaTheLoai , TenTheLoai)
values ('KH10' , N'Kinh Dị');
Insert into THELOAI( MaTheLoai , TenTheLoai)
values ('KH11' , N'Hài');
Insert into THELOAI( MaTheLoai , TenTheLoai)
values ('KH12' , N'Tài Liệu');
Insert into THELOAI( MaTheLoai , TenTheLoai)
values ('KH13' , N'Hoạt Hình');
Insert into THELOAI( MaTheLoai , TenTheLoai)
values ('KH14' , N'Siêu Nhân');
go

Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT01' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH10' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT02' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH10' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT03' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH11' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT04' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH11' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT05' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH12' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT06' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH12' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT07' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH13' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT08' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH13' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT09' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH14' );
Insert into SACH( MaSach , TenSach , NSX , SoTrang , SoLuong , GiaTien , NgayNhap , ViTriDat , MaTheLoai )
values ('KT10' , N'Người Về Từ Lòng đát' , '5-3-2018' , 25 , 55555 , 88888 , '5-9-2015' , N'Trên Kệ' , 'KH14' );
go


Insert into TACGIA( MaTG , TenTG , SoDT , Email )
values ('TU01' , N'Lê Minh Thụy' , '015482545' , N'LeMinhThuy@gmail.com');
Insert into TACGIA( MaTG , TenTG , SoDT , Email )
values ('TU02' , N'Lê Minh Thụy' , '015482545' , N'LeMinhThuy@gmail.com');
Insert into TACGIA( MaTG , TenTG , SoDT , Email )
values ('TU03' , N'Lê Minh Thụy' , '015482545' , N'LeMinhThuy@gmail.com');
Insert into TACGIA( MaTG , TenTG , SoDT , Email )
values ('TU04' , N'Lê Minh Thụy' , '015482545' , N'LeMinhThuy@gmail.com');
Insert into TACGIA( MaTG , TenTG , SoDT , Email )
values ('TU05' , N'Lê Minh Thụy' , '015482545' , N'LeMinhThuy@gmail.com');
go

Insert into SACH_TG(MaSach , MaTG ) 
values ('KT01' , 'TU01' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT02' , 'TU01' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT03' , 'TU02' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT04' , 'TU02' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT05' , 'TU03' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT06' , 'TU03' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT07' , 'TU04' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT08' , 'TU04' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT09' , 'TU05' );
Insert into SACH_TG(MaSach , MaTG ) 
values ('KT10' , 'TU05' );
go


Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (1 , 'KT01' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (2 , 'KT02' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (3 , 'KT03' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (4 , 'KT04' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (5 , 'KT05' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (6 , 'KT06' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (7 , 'KT07' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (8 , 'KT08' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (9 , 'KT09' , N'Siêu Nhân' ) ;
Insert into CTMUON( SoPhieuMuon , MaSach , GhiChu )
values (10 , 'KT10' , N'Siêu Nhân' ) ;
go

select * from KHOANGHANh
select * from SINHVIEN
select * from PHIEUMUON
select * from THELOAI
select * from SACH
select * from TACGIA
select * from SACH_TG
select * from CTMUON


select TenSach ,SACH.MaSach , GiaTien , TenTG --6.1
from SACH inner join SACH_TG on SACH.MaSach = SACH_TG.MaSach
          inner join TACGIA on TACGIA.MaTG = SACH_TG.MaTG 
where MaTheLoai like 'KH%' 

select MaSach , PHIEUMUON.SoPhieuMuon , NgayMuon , MSSV  --6.2
from PHIEUMUON inner join CTMUON on PHIEUMUON.SoPhieuMuon = CTMUON.SoPhieuMuon
where MONTH( NgayMuon ) = 1 and YEAR( NgayMuon ) = 2017

select *   --6.3
from PHIEUMUON
where TrangThai = N'Chưa Trả'
order by NgayMuon asc

select THELOAI.MaTheLoai , TenTheLoai , sum( SoLuong ) as TongSach --6.4
from SACH inner join THELOAI on SACH.MaTheLoai = THELOAI.MaTheLoai
group by THELOAI.MaTheLoai , TenTheLoai

select sum(SoPhieuMuon) as SoLuotMuon --6.5
from CTMUON

select *
from SACH
where TenSach like 'SQL' --6.6
go


select SINHVIEN.MSSV , HoTen , PHIEUMUON.SoPhieuMuon , TenSach , NgayMuon , NgayTra    --6.7 
from SINHVIEN inner join PHIEUMUON on PHIEUMUON.MSSV = SINHVIEN.MSSV 
              inner join CTMUON on PHIEUMUON.SoPhieuMuon = CTMUON.SoPhieuMuon
			  inner join SACH on SACH.MaSach = CTMUON.MaSach
order by NgayMuon asc 
go

select TenSach , count(CTMUON.MaSach) as SoLan   --6.8
from  SACH inner join CTMUON on CTMUON.MaSach = SACH.MaSach
group by TenSach
having count(CTMUON.MaSach) > 20
go

update SACH   --6.9
set GiaTien = GiaTien * 0.7 
where year(NgayNhap) < 2014
go

update PHIEUMUON --6.10
set  TrangThai = N'Chưa Trả'
where MSSV like 'PD12301'
go

select CTMUON.SoPhieuMuon , HoTen , email , SACH.MaSach , TenSach , NgayMuon  --6.11
from SINHVIEN inner join PHIEUMUON on SINHVIEN.MSSV = PHIEUMUON.MSSV
              inner join CTMUON on CTMUON.SoPhieuMuon = PHIEUMUON.SoPhieuMuon
			  inner join SACH on SACH.MaSach = CTMUON.MaSach
where TrangThai like N'%Chưa Trả%'
go

update SACH   --6.12
set SoLuong = SoLuong + 5 
where MaSach in (
                 select MaSach
				 from CTMUON
				 group by MaSach
				 having count(CTMUON.MaSach) > 9
				 )
go

DELETE FROM CTMUON--6.13
WHERE SoPhieuMuon IN (
                      SELECT SOPHIEUMUON 
					  FROM PHIEUMUON
                      WHERe NgayMuon < '12-1-2017')

DELETE FROM PHIEUMUON
WHERE NgayMuon < '12-1-2017'