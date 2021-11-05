create database KT
go

use KT
go

create table THELOAI(
   MaTheLoai nvarchar(10) not null ,
   TenTheLoai nvarchar(50) not null ,
   primary key (MaTheLoai) 
)
go

create table TINHTRANGSACH(
   MaTinhTrang nvarchar(5) ,
   TenTinhTrang nvarchar(50) ,
   primary key (MaTinhTrang) 
)
go

create table SACH(
   MaSach nvarchar(5) ,
   TenSach nvarchar(50) ,
   MaTheLoai nvarchar(10) not null ,
   MaTinhTrang nvarchar(5) ,
   TacGia nvarchar(50) ,
   NXB nvarchar(50) ,
   SoTrang int ,
   KichThuoc float ,
   TrongLuong float ,
   GiaBia money ,
   GiaBan money ,
   SoLanXem int ,
   primary key (MaSach) ,
   foreign key(MaTheLoai) references THELOAI(MaTheLoai) ,
   foreign key(MaTinhTrang) references TINHTRANGSACH(MaTinhTrang) ,
   check( SoTrang > 10 ),
   check(GiaBia > 0 ) ,
   check( GiaBan > GiaBia) 
)
go
 
Insert into THELOAI(MaTheLoai , TenTheLoai) 
values ('k001' , N'Kinh dị' ) ;

Insert into TINHTRANGSACH( MaTinhTrang , TenTinhTrang ) 
values ( 'h002' , N'HaHa' ) ;

Insert into SACH( MaSach , TenSach , MaTheLoai , MaTinhTrang , TacGia , NXB , SoTrang , KichThuoc , TrongLuong , GiaBia , GiaBan , SoLanXem)
values ('KH01' , N'Doremon' , 'k001' , 'h002' , N'Lê Minh Thụy' , N'Kim đồng' , 300 , 156 , 15 , 3333 , 33363, 55) ;

select*from THELOAI
select*from TINHTRANGSACH
select *from SACH

select TenSach , MaSach , MaTheLoai from SACH

