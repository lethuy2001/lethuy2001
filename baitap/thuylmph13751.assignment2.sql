use QLS
go

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

use QLBH
go

select HOADON.MaHD , MaKH , TrangThai , MaSP , SoLuong , NgayMuaHang --a 
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD

select HOADON.MaHD , MaKH , TrangThai , MaSP , SoLuong , NgayMuaHang --b
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
where MaKH = 'KH001'

select HOADON.MaHD , NgayMuaHang , TenSP , DonGia , HOADONCHITIET.SoLuong , DonGia * HOADONCHITIET.SoLuong as ThanhTien --c
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
            inner join SANPHAM on HOADONCHITIET.MaSP = SANPHAM.MaSP

select HoTen , Email , DienThoai , HOADON.MaHD , HOADON.TrangThai , HOADONCHITIET.SoLuong * DonGia as TongTien --d
from KHACHHANG inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH
               inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
			   inner join SANPHAM on SANPHAM.MaSP = HOADONCHITIET.MaSP
where TrangThai = N'Đã thanh toán'

select HOADON.MaHD , NgayMuaHang ,Sum (HOADONCHITIET.SoLuong * DonGia ) as TongTien --e
from HOADON inner join HOADONCHITIET on HOADON.MaHD = HOADONCHITIET.MaHD
            inner join SANPHAM on HOADONCHITIET.MaSP = SANPHAM.MaSP 
group by HOADON.MaHD , NgayMuaHang 
having Sum( HOADONCHITIET.SoLuong * DonGia ) >= 500000 
order by Sum(HOADONCHITIET.SoLuong * DonGia ) desc
