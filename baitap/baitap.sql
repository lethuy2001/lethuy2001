use QLBH 
go

select *
from SANPHAM inner join HOADONCHITIET on SANPHAM.MaSP = HOADONCHITIET.MaSP

select *
from SANPHAM left outer join HOADONCHITIET on SANPHAM.MaSP = HOADONCHITIET.MaSP


select *
from HOADONCHITIET  right outer join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP

select *
from  HOADONCHITIET inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
             inner join HOADON on HOADONCHITIET.MaHD = HOADON.MaHD

select *
from SANPHAM inner join HOADONCHITIET on SANPHAM.MaSP = HOADONCHITIET.MaSP
             inner join HOADON on  HOADON.MaHD = HOADONCHITIET.MaHD
			 inner join KHACHHANG on KHACHHANG.MaKH = HOADON.MaKH

select HOADON.MaHD, MaKH , TrangThai , MaSP , SoLuong , NgayMuaHang 
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD

select HOADON.MaHD, MaKH , TrangThai , MaSP , SoLuong , NgayMuaHang 
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
where MaKH = 'KH001'

select HOADON.MaHD , NgayMuaHang , TenSP ,DonGia , HOADONCHITIET.SoLuong , DonGia*HOADONCHITIET.SoLuong as  ThanhTien
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
            inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP

select HoTen , Email ,DienThoai ,HOADON.MaHD , TrangThai , DonGia*HOADONCHITIET.SoLuong as  ThanhTien , sum(DonGia * HOADONCHITIET.SoLuong) as TongTien
from KHACHHANG inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH
               inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
			   inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
group by HoTen , Email ,DienThoai ,HOADON.MaHD , TrangThai , DonGia*HOADONCHITIET.SoLuong 
