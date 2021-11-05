use QLBH
go

select HOADON.MaHD , MaKH , TrangThai , MaSP ,  SoLuong , NgayMuaHang  -- a
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD 

select HOADON.MaHD , MaKH , TrangThai , MaSP ,  SoLuong , NgayMuaHang  --b
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD 
where MaKH = 'KH001'


select HOADON.MaHD , NgayMuaHang , TenSP , DonGia , HOADONCHITIET.SoLuong , DonGia * HOADONCHITIET.SoLuong as 'Thành Tiền ' --c
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD 
            inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP

select HoTen , Email , DienThoai , HOADON.MaHD , TrangThai , 
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD 
            inner join KHACHHANG on KHACHHANG.MaKH = HOADON.MaKH 
where TrangThai like N'Đã Thanh Toán'


select KHACHHANG.MaKH , HoTen , MaHD , NgayMuaHang
from KHACHHANG inner join HOADON on KHACHHANG.MaKH = HOADON.MaKH
where YEAR(NgayMuaHang) = 2019 and MONTH(NgayMuaHang) = 9
order by MaKH desc 

select  HoTen , DiaChi , COUNT(MaHD) as N'So Lần Mua'
from KHACHHANG inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH
where DiaChi like N'Hà Nội' 
group by HoTen , DiaChi 

select top 1 SANPHAM.MaSP , TenSP , COUNT(MaHD) as solanmua
from SANPHAM inner join HOADONCHITIET on SANPHAM.MaSP = HOADONCHITIET.MaSP
group by  TenSP , SANPHAM.MaSP
order by solanmua desc


select SANPHAM.MaSP , TenSP , DonGia , HOADONCHITIET.SoLuong 
from SANPHAM left outer join HOADONCHITIET on HOADONCHITIET.MaSP = SANPHAM.MaSP
where DonGia = null

select KHACHHANG.MaKH , HoTen , DiaChi , DienThoai
from KHACHHANG left outer join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
               inner join HOADONCHITIET on HOADONCHITIET.MaHD = HOADON.MaHD
where SoLuong = null


