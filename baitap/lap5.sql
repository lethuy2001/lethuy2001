use QLBH
go

--Bài 1

select * from KHACHHANG --a

select top 10 MaKH, HoTen , Email , DienThoai from KHACHHANG --b

select MaSP , TenSP , DonGia* SoLuong as TongTienTonKho --c
from SANPHAM

select MaKH , DiaChi, HoTen --d
from KHACHHANG
where HoTen like 'H%'

select *   --e
from KHACHHANG
where DiaChi = N'Đà Nẵng'

select SoLuong --f
from SANPHAM
where SoLuong between 10 and 50

select *    --g
from HOADON
where TrangThai = N'Đã thanh toán' and YEAR(NgayMuaHang) = 2020

select *  --h
from HOADON
where MaKH like 'KH00[136]%'

--Bài 2
select COUNT(MaKH) as SoLuongKhachHang --a
from KHACHHANG

select MAX(DonGia) as DonGiaMax --b
from SANPHAM

select MIN(SoLuong) as SoLuongMin --c
from SANPHAM

select sum(SoLuong) as TongSoSP  --d
from SANPHAM

select *   --e
from HOADON
where YEAR(NgayMuaHang) = 2020 and MONTH(NgayMuaHang) = 12 and TrangThai = N'Đã thanh toán'

select COUNT(MaSP) as SoLoaiSP , MaHD --f
from HOADONCHITIET
group by MaHD

select COUNT(MaSP) as SoLoaiSP , MaHD --g
from HOADONCHITIET
group by MaHD
having COUNT(MaSP) >= 1

select MaHD ,NgayMuaHang , MaKH --h
from HOADON
order by NgayMuaHang desc
