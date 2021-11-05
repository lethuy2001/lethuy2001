use QLS
go

select *
from SINHVIEN
where HoTen like N'Lê%' and MaKN like 'K001'

select avg(SoTrang) as SoTrangLN 
from SACH

select count(MaSach) as TongSach
from SACH
where year(NgayNhap) = 2015

select count(MaSach) as TongSach
from SACH
where NgayNhap < '1-1-2017' 

select MaLop , count(MSSV) as SoPhieuMuon 
from PHIEUMUON
group by MaLop

select MaLop , count(MSSV) as SoPhieuMuon 
from PHIEUMUON
group by MaLop
having COUNT(MSSV) > 5 --having là đặt điều kiện có sự tham gia của hàm thống kê
