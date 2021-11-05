==use QLBH
go

--Bài 1 
--a 


Insert into KHACHHANG( MaKH , HoTen , DiaChi , Email , DienThoai)
values  ( 'KH001'  , N'Nguyễn Thị Nga' , N'15 Quang Trung TP Đà Nẵng' , 'ngant@gmail.com' , '0912345670') , 
        ( 'KH002'  , N'Trần Công Thành' , N'234 Lê Lợi Quảng Nam' , 'thanhtc@gmail.com' , '16109423443') , 
        ( 'KH003'  , N'Lê Hoàng Nam ' , N'23 Trần Phú TP Huế' , 'namlh@gmail.com' , '0989354556') , 
		( 'KH004'  , N'Vũ Ngọc Hiền ' , N'37 Nguyễn Thị Thập TP Đà Nẵng ' , 'hienvn@gmail.com' , '0894545435') ;
go

insert into SANPHAM ( MoTa , SoLuong , DonGia , TenSP )
values  ( N'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền' , '800' , '6.600.000' , N'Samsung Galaxy J7 Pro '),
         (N'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)' , '100' , '700' , N'Nokia 3100');
go


Insert into HOADONCHITIET ( MaHD , MaSP , SoLuong )
values ( '120954 '  , 2 , 30 ) ; 
Insert into HOADONCHITIET ( MaHD , MaSP , SoLuong )
values  ( '120954 ' , 1 , 20 ) ;
Insert into HOADONCHITIET ( MaHD , MaSP , SoLuong )
values ( '120955 ' , 2 , 100 ) ;
Insert into HOADONCHITIET ( MaHD , MaSP , SoLuong )
values ( '120956 ' , 4 , 6 ) ;
Insert into HOADONCHITIET ( MaHD , MaSP , SoLuong )
values ( '120956 ' , 2 , 60 ) ;  
Insert into HOADONCHITIET ( MaHD , MaSP , SoLuong )
values ( '120956 ' , 1 , 100 ) ;
go

--b

select * into KHACHHANG_DaNang
from KHACHHANG
where DiaChi like N'%Đà Nẵng%'

--Bài 2 

update KHACHHANG   --a
set DienThoai = '16267788989'
where MaKH like 'KH02'
go

update SANPHAM --b
set SoLuong = SoLuong + 200 
where MaSP = 3

update SANPHAM  --c
set DonGia = DonGia * 0.95 
go

update HOADONCHITIET   --d
set SoLuong = SoLuong + 100 
where MaSP in (select top 1 MaSP 
               from HOADONCHITIET inner join HOADON on HOADON.MaHD = HOADONCHITIET.MaHD
               where YEAR(NgayMuaHang) = 2016 and MONTH(NgayMuaHang) = 12
               group by MaSP
               order by sum(SoLuong) desc)
go



update SANPHAM --e
set DonGia = DonGia * 0.9 
where MaSP in (select top 2 MaSP 
               from HOADONCHITIET inner join HOADON on HOADON.MaHD = HOADONCHITIET.MaHD
               where YEAR(NgayMuaHang) = 2016 
               group by MaSP
               order by sum(SoLuong) asc)
go

update HOADON  --f
set TrangThai = N'Đã Thanh Toán'
where MaHD = '120956'
go

delete from HOADONCHITIET  --g
where MaSP = 2 and MaSP in ( select MaSP
                from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
				where  .HOADONCHITIET.MaHD = '120956' and TrangThai = N'Chưa Thanh Toán'
				)
go


delete from KHACHHANG  --h
where MaKH in ( select KHACHHANG.MaKH
                from KHACHHANG inner join HOADON on KHACHHANG.MaKH = HOADON.MaKH
				where NgayMuaHang < '1-1-2016'
                 )