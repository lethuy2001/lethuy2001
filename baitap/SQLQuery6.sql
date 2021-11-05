create database QLBDS
go

use QLBDS
go

create table CSH(
   MaCSH nvarchar(10),
   TenCSH nvarchar(50) ,
   DiaChi nvarchar(50) ,
   DienThoai nvarchar(15) ,
   email nvarchar(50) ,
   CMND nvarchar(15) ,
   primary key (MaCSH) 
)
go

create table BDS(
   MaBDS nvarchar(10) ,
   TenBDS nvarchar(50) ,
   DiaChi nvarchar(50) ,
   MaVP nvarchar(10) ,
   MaCSH nvarchar(10) ,
   primary key (MaBDS) ,
   foreign key(MaCSH ) references CSH(MaCSH) 
)
go

create table VANPHONG(
    MaVP nvarchar(10) ,
	TenVP nvarchar(50) ,
	DienThoai nvarchar(15) ,
	Email nvarchar(40) ,
	MaNV nvarchar(10) ,
	MaBDS nvarchar(10) ,
	primary key (MaVP ) ,
	foreign key(MaBDS) references BDS(MaBDS)
)
go

create table DIADIEM(
   MaVP nvarchar(10) ,
   DiaDiem nvarchar(50) ,
   primary key( MaVP , DiaDiem),
   foreign key(MaVP ) references VANPHONG (MaVP) 
)
go

create table NHANVIEN (
   MaNV nvarchar(10) ,
   HoTen nvarchar(50) ,
   MaVP nvarchar(10) ,
   NgaySinh datetime ,
   GioiTinh nvarchar(5) ,
   email nvarchar(50) ,
   SoDT nvarchar(15) ,
   CNND nvarchar(15) ,
   primary key( MaNV) ,
   foreign key(MaVP) references VANPHONG(MaVP) 
)
go

create table NHANTHAN( 
   MaNhanThan nvarchar(10) ,
   MaNV nvarchar(10) ,
   HoTen nvarchar(50) ,
   NgaySinh datetime ,
   MoiLienHe nvarchar(50) ,
   primary key(MaNhanThan) ,
   foreign key(MaNV) references NHANVIEN(MaNV) 
)
go



