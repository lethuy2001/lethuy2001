use QLS
go

select TenSach , SACH.MaSach , GiaTien  
from SACH inner join SACH_TG on SACH.MaSach = SACH_TG.MaSach
          inner join TACGIA on SACH_TG.MaTG = TACGIA.MaTG
where TACGIA.MaTG like 'IT'

select MaSach , NgayMuon , SINHVIEN.MSSV , PHIEUMUON.SoPhieuMuon
from PHIEUMUON inner join CTMUON on PHIEUMUON.SoPhieuMuon = CTMUON.SoPhieuMuon
			   inner join SINHVIEN on SINHVIEN.MSSV = PHIEUMUON.MSSV
where year(NgayMuon) = 2009 and MONTH(NgayMuon) = 5

select *
from PHIEUMUON
where TrangThai = N'Tốt'
order by NgayMuon asc