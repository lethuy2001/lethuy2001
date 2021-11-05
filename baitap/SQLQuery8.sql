create database LT2
go

use LT2
go
create table KHACHHANG
(
	MaKH nvarchar(5) not null,
	HotenKH nvarchar(50) not null,
	Diachi nvarchar(50),
	SoDT nvarchar(15),
	primary key(MaKH)
)
go
create table TAIKHOAN
(
	SoTK nvarchar(15) not null,
	MaKH nvarchar(5) not null,
	NgayMoTK datetime,
	SoTien money,
	primary key (SoTK),
	foreign key (MaKH) references KhachHang(MaKH),
	check (SoTien>=0)
)
go
create table GIAODICH
(
	MaGD nvarchar(5) not null,
	SoTK nvarchar(15) not null,
	ThoigianGD datetime,
	SotienGD money,
	MotaGD nvarchar(100),
	SoDuTaiKhoan money,
	primary key (MaGD),
	foreign key (SoTK) references TAIKHOAN(SoTK),
	check (SotienGD >=10)
)
go
insert into KHACHHANG(MaKH,HotenKH,Diachi,SoDT)
values('KH1',N'Nguyễn Quốc Khánh',N'304 Hồ Tùng Mậu','0866819514');
insert into KHACHHANG(MaKH,HotenKH,Diachi,SoDT)
values('KH2',N'Lê Minh Thụy',N'102 Thái Hà','096522665');
insert into KHACHHANG(MaKH,HotenKH,Diachi,SoDT)
values('KH3',N'Lê Minh Thụy',N'102 Thái Hà','096522665');
insert into KHACHHANG(MaKH,HotenKH,Diachi,SoDT)
values('KH4',N'Lê Minh Thụy',N'102 Thái Hà','096522665');
insert into KHACHHANG(MaKH,HotenKH,Diachi,SoDT)
values('KH5',N'Lê Minh Thụy',N'102 Thái Hà','096522665');
go

insert into TAIKHOAN(SoTK,MaKH,NgayMoTK,SoTien)
values('00001','KH1','2017/05/16',450);
insert into TAIKHOAN(SoTK,MaKH,NgayMoTK,SoTien)
values('00002','KH2','2018/03/20',100);
insert into TAIKHOAN(SoTK,MaKH,NgayMoTK,SoTien)
values('00003','KH3','2017/05/16',40);
insert into TAIKHOAN(SoTK,MaKH,NgayMoTK,SoTien)
values('00004','KH4','2017/05/16',420);
insert into TAIKHOAN(SoTK,MaKH,NgayMoTK,SoTien)
values('00005','KH5','2017/05/16',1000);
go

insert into GIAODICH(MaGD,SoTK,ThoigianGD,SotienGD,MotaGD,SoDuTaiKhoan)
values('00001','00001','2020/04/14','50','khach ck','1');
insert into GIAODICH(MaGD,SoTK,ThoigianGD,SotienGD,MotaGD,SoDuTaiKhoan)
values('00002','00002','2020/04/14','50','khach ck','1');
insert into GIAODICH(MaGD,SoTK,ThoigianGD,SotienGD,MotaGD,SoDuTaiKhoan)
values('00003','00003','2020/04/14','50','khach ck','1');
insert into GIAODICH(MaGD,SoTK,ThoigianGD,SotienGD,MotaGD,SoDuTaiKhoan)
values('00004','00004','2020/04/14','50','khach ck','1');
insert into GIAODICH(MaGD,SoTK,ThoigianGD,SotienGD,MotaGD,SoDuTaiKhoan)
values('00005','00005','2020/04/14','50','khach ck','1');
go



select*from KHACHHANG
select*from TAIKHOAN
select*from GIAODICH

