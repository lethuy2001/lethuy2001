-- Dùng CSDL QLSach
use QLSach2
go

-- VD1:Lấy thông tin sV họ nguyễn, học ngành K13.1-MUL
	select *
	from SINHVIEN
	where Hoten like N'Nguyễn%' and MaKN like 'K13.1-MUL'

-- Xem lý thuyết mệnh đề where tại slide Buổi 5 trang 14, 15

-- II. Các hàm thống kê cơ bản (sum,count, max, min...) - Xem slide 18.
-- VD1: Cho biết số trang lớn nhất trong bảng sách
	select max(sotrang) as SoTrangLonNhat
	from SACH
 
 -- VD2: Cho biết số trang Trung bình của NXB Giáo dục
	select avg(sotrang) as SoTrangTB
	from SACH
	where NXB like N'NXB Giáo D?c'



 -- VD3. Cho biết tổng số đầu sách nhập trong năm 2017
 	select count(Masach) as TongsoDausach
	from SACH
	where YEAR(NgayNhap) = 2017

-- VD4: cho biết tổng số đầu sách nhập trước 1/1/2017
	select count(TenSach) as TongSoDauSach
	from SACH
	where NgayNhap <'04-10-2017'
	 

-- VD5: Thống kê số SV mượn sách của các lớp: malop, số SV mượn
	select  malop, count(masv) as sosv
	from PHIEUMUON
	group by malop


	select * from PHIEUMUON
-- VD5: giống câu 5, nhưng chỉ hiển thị những lớp có số sv mượn >=5
	select  malop, count(masv) as sosv
	from PHIEUMUON
	group by malop
	having count(masv) >=5

	
	--select * from sach