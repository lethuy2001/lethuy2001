use QLBH
go

-- Bài 1

select HOADON.MaHD , MaKH , TrangThai , SoLuong , NgayMuaHang  -- a
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
go

select HOADON.MaHD , MaKH , TrangThai , SoLuong , NgayMuaHang  -- b
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
where MaKH like 'KH001'
go

select HOADON.MaHD , NgayMuaHang , TenSP , DonGia , HOADONCHITIET.SoLuong , DonGia * HOADONCHITIET.SoLuong as ThanhTien  --c
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
            inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
go

select HoTen , Email , DienThoai , HOADON.MaHD , TrangThai , Sum(DonGia * HOADONCHITIET.SoLuong ) as TongTien --d
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
            inner join KHACHHANG on KHACHHANG.MaKH = HOADON.MaKH
			inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
where TrangThai like N'Đã Thanh Toán'
group by HoTen , Email , DienThoai , TrangThai , HOADON.MaHD
go

select HOADON.MaHD , NgayMuaHang , sum(DonGia * HOADONCHITIET.SoLuong) as TongTien --e
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
            inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
group by NgayMuaHang , HOADON.MaHD
having Sum(DonGia * HOADONCHITIET.SoLuong ) >= 300000.00
order by TongTien desc

-- Bài 2

select KHACHHANG.MaKH , HoTen , DiaChi , Email , DienThoai  -- a
from KHACHHANG left outer join HOADON on HOADON.MaKH = KHACHHANG.MaKH
where TrangThai is null and NgayMuaHang > '01-01-2016'
go

select top 1 SANPHAM.MaSP , TenSP , count(HOADONCHITIET.SoLuong) as TongTien --b
from HOADON inner join HOADONCHITIET on HOADONCHITIET.MaHD = HOADON.MaHD
            inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
where YEAR(NgayMuaHang) = 2016 and MONTH(NgayMuaHang ) = 1 
group by TenSP , SANPHAM.MaSP
order by TongTien desc 
go

select top 5 HoTen, DiaChi , Email , DienThoai , sum(HOADONCHITIET.SoLuong * DonGia ) as TongTien --c
from HOADON inner join HOADONCHITIET on HOADONCHITIET.MaHD = HOADON.MaHD
            inner join KHACHHANG on KHACHHANG.MaKH = HOADON.MaKH
			inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
where YEAR(NgayMuaHang) = 2016 
group by HoTen , DiaChi , Email , DienThoai
order by TongTien desc 
go

select HoTen , DiaChi , Email , DienThoai  --d
from HOADON inner join HOADONCHITIET on HOADONCHITIET.MaHD = HOADON.MaHD
            inner join KHACHHANG on KHACHHANG.MaKH = HOADON.MaKH
			inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
where TenSP = 'Iphone 7 32GB' and DiaChi = N'Hà Nội' and MONTH(NgayMuaHang) = 12 and YEAR(NgayMuaHang) = 2016
go

select  SanPham.MaSanPham,TenSP, count(hoaDonChiTiet.masanpham) as solan --e
from SanPham left join HoaDonChiTiet on SanPham.MaSanPham= HoaDonChiTiet.MaSanPham
group by SanPham.MaSanPham,TenSP
having count(hoaDonChiTiet.masanpham)  < (select COUNT(masanpham)
										  from HoaDonChiTiet)
												/
												(select COUNT(MaSanPham)
												 from SanPham)