use QLBH 
go

/*a*/

select *from KHACHHANG 

select top 10 MaKH , HoTen , Email , DienThoai
from KHACHHANG

select MaSP , TenSP ,DonGia * SoLuong as TongTien
from SANPHAM

select MaKH , HoTen , DiaChi 
from KHACHHANG
where HoTen = 'H%'
group by HoTen 

select DiaChi
from KHACHHANG 
where DiaChi = N'Hà Nội' 

select SoLuong 
from SANPHAM
where SoLuong between 10 and 40

select *
from HOADON
where YEAR(NgayMuaHang) < 2021 and TrangThai like N'Đã thanh toán'

select * 
from HOADON
where MaHD = 'HD001' or MaHD = 'HD002' or MaHD = 'HD004'

select count(MaKH)
from KHACHHANG

select Max(DonGia)
from SANPHAM

select Min(SoLuong)
from SANPHAM

select sum(SoLuong)
from SANPHAM

select COUNT(MaHD) as SoHoaDon
from HOADON 
where MONTH(NgayMuaHang) = 12 and YEAR(NgayMuaHang) = 2020 and TrangThai = N'Đã thanh toán'

select count(MaSP) as SoLoaiSanPham, MaHD
from HOADONCHITIET
group by MaHD

select count(MaSP) as SoLoaiSanPham, MaHD
from HOADONCHITIET
group by MaHD 
having count(MaSP) >= 1

select MaHD , NgayMuaHang , MaKH 
from HOADON
order by NgayMuaHang desc

select *
from HOADON
where MaKH like 'KH00[136]'