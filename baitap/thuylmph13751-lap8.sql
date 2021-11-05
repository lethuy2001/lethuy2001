create database QLNV
go

use QLNV
go

create table PHONGBAN(
      mapb nvarchar(6) ,
	  tenpb nvarchar(20) , 
	  primary key (mapb)
)

create table CHUCVU (
      macv nvarchar(6) ,
	  tencv nvarchar(50) ,
	  phucap_cv int  , 
	  primary key (macv) 
)

create table NHANVIEN (
      manv nvarchar(6) ,
	  hodem nvarchar(20) , 
	  ten nvarchar(10) ,
	  gioiTinh nvarchar(5) ,
	  ngaysinh datetime ,
	  diachi nvarchar(50) ,
	  hsl float ,
	  mapb nvarchar(6) ,
	  macv nvarchar(6) ,
	  primary key (manv) , 
	  foreign key (mapb) references PHONGBAN(mapb) ,
	  foreign key (macv) references CHUCVU (macv) 
)

Insert into PHONGBAN (mapb , tenpb ) 
values ('PB01' , N'Kế Toán' ) ,
       ('PB02' , N'Hành Chính' ) ,
	   ('PB03' , N'Phát Triển' ) ,
	   ('PB04' , N'Kế Hoạch' ) ,
	   ('PB05' , N'Kinh Doanh ' ) ,
	   ('PB06' , N'Công Trình' ) ;
go

insert into CHUCVU (macv , tencv  , phucap_cv )
values ('CV01' , N'Giám Đôc' , 5000000 ) ,
       ('CV02' , N'Phó Giám Đốc' , 4000000 ) ,
	   ('CV03' , N'Trưởng Phòng' , 3000000 ) ,
	   ('CV04' , N'Tổ Trưởng' , 1500000 ) ,
	   ('CV05' , N'Nhân viên' , 500000 ) ;
go

insert into NHANVIEN( manv , hodem , ten , gioiTinh , ngaysinh , diachi , hsl , mapb , macv)
values ('NV01' , N'Lê Minh' , N'THụy' , N'Nam' , '8-5-2001' , N'Nguyễn Trãi Hà Nội' , 2.5  , 'PB01' , 'CV02'), 
       ('NV02' , N'Đào Văn' , N'Sơn' , N'Nam' , '2-4-1989' , N'Nguyễn Trãi Hà Nam' , 2.5  , 'PB03' , 'CV02'), 
	   ('NV03' , N'Đinh thị' , N'Văn' , N'Nữ' , '8-5-1999' , N'Nguyễn Trãi Tây Ninh' , 2.5  , 'PB02' , 'CV03'), 
	   ('NV04' , N'Tạ Văn' , N'Thực' , N'Nam' , '9-12-2000' , N'Hồ Chí Minh' , 2.5  , 'PB06' , 'CV04'), 
	   ('NV05' , N'Lê Quanh' , N'huy' , N'Nam' , '10-10-2001' , N'Thái Bình' , 2.5  , 'PB02' , 'CV05');
go


--Bài Tập

--1.	Hiển thị thông tin gồm: MaNV, Hoten, gioiTinh, ngaySinh, tuoi, phucap, tencv 
select manv, hodem + ' ' + ten as HoTen, gioiTinh, ngaySinh, year(GETDATE()) - year(ngaysinh)as tuoi , phucap_cv, tencv --1 
from NHANVIEN inner join CHUCVU on NHANVIEN.macv = CHUCVU.macv 
go

--2.	Hiển thị thông tin Nhân viên có hsl<4.6: MaNV, hoten, hsl, phucap
select CHUCVU.macv ,  hodem + ' ' + ten as HoTen , hsl , phucap_cv --2
from NHANVIEN inner join CHUCVU on CHUCVU.macv = NHANVIEN.macv
where hsl < 4.6
go

--3.	Cập nhật lại hsl của NV0001 thành 4.6
update NHANVIEN --3
set hsl = 4.6 
where manv like 'NV0001'
go

--4.	Xóa những NhanVien sinh trước ngày 1/1/1960
delete from NHANVIEN --4
where YEAR(ngaysinh) < 1960 
go

--5.	Hiển thị thông tin các Nhân viên sinh tháng 11: MaNV, hoten, ngaysinh, tenpb
select manv, hodem + ' ' + ten as HoTen , ngaysinh, tenpb --5 
from NHANVIEN inner join PHONGBAN on PHONGBAN.mapb = NHANVIEN.mapb
where MONTH(ngaysinh) = 11 
go

--6.	Hiển thị thông tin các Nhân viên Nữ họ Đỗ
select *  --6
from NHANVIEN
where hodem like N'%Đỗ%' and gioiTinh like N'Nữ'
go


--7.	Hiển thị thông tin các Nhân viên tên bắt đầu là H.
select *  --7
from NHANVIEN
where ten like N'H%'
go

--8.	Hiển thị các chức vụ không có nhân viên nào.
select * --8
from CHUCVU
where macv not in ( select macv
                    from NHANVIEN
                    ) 
go

--9.	Xóa thông tin các Nhân viên Nữ
delete from NHANVIEN --9
where gioiTinh like N'Nữ'
go

--10.	Hiển thị Top 2 các phòng ban có nhiều nhân viên nhất.
select top 2 NHANVIEN.mapb , tenpb , count( NHANVIEN.mapb) as SoLuongNV --10
from PHONGBAN inner join NHANVIEN on NHANVIEN.mapb = PHONGBAN.mapb
group by NHANVIEN.mapb , tenpb 
order by SoLuongNV desc 
go

--11.	Hiển thị thông tin các nhân viên có độ tuổi từ 18 đến 40, sắp giảm dần theo độ tuổi
select manv, hodem + ' ' + ten as HoTen, gioiTinh, ngaySinh, year(GETDATE()) - year(ngaysinh)as tuoi , diachi , mapb , macv
from NHANVIEN
where year(GETDATE()) - year(ngaysinh) > 18 and year(GETDATE()) - year(ngaysinh) < 40
go 

--12.	Cập nhật phụ cấp của macv “CV01” thành 6000000
update CHUCVU --12
set phucap_cv = 6000000
where macv like 'CV01'
go

--13.	Hiển thị thông tin các sinh viên nam, sinh vào tháng 5 năm 1990
select *  --13
from NHANVIEN
where MONTH(ngaysinh) = 5 and YEAR(ngaysinh) = 1990 and gioiTinh like N'Nam'
go

--14.	Viết lệnh giảm 50% phụ cấp của tất cả các chức vụ
update CHUCVU --14
set phucap_cv = phucap_cv * 0.5 
go

--15.	Xóa các chức vụ không có NhanVien nào.
delete from CHUCVU --15
where macv not in (select macv
                    from NHANVIEN
)
go

--16.	Hiển thị thông tin Nhân viên Nữ có tuổi >20: MaNV, hoten, tuoi, hsl, phucap

select manv,  hodem + ' ' + ten as HoTen, year(GETDATE()) - year(ngaysinh)as tuoi, hsl, phucap_cv --16
from NHANVIEN inner join CHUCVU on CHUCVU.macv = NHANVIEN.macv
where year(GETDATE()) - year(ngaysinh) > 20 and gioiTinh like N'Nữ'
go

--17.	Chèn thêm 1 bản ghi mới vào bảng NhanVien (Không được phép nhập giá trị null).
insert into NHANVIEN( manv , hodem , ten , gioiTinh , ngaysinh , diachi , hsl , mapb , macv)
values ('NV06' , N'Lê Minh' , N'Thúy' , N'Nữ' , '8-5-2001' , N'Nguyễn Trãi Hà Nội' , 2.5  , 'PB02' , 'CV02');

--19.	Hiển thị Mã nhân viên, họ tên (gộp họ đệm và tên), giới tính, địa chỉ của các nhân viên nam 
select manv ,  hodem + ' ' + ten as HoTen , gioiTinh , diachi
from NHANVIEN
where gioiTinh like 'Nam'
go

--20.	Đưa ra họ tên, địa chỉ, hệ số lương, phụ cấp chức vụ, Lương thực lĩnh của tất cả các nhân viên (biết Lương thực lĩnh=hệ số lương * 900+ phụ cấp chức vụ) 

select  hodem + ' ' + ten as HoTen  , diachi , hsl , phucap_cv , hsl * 900 + phucap_cv as LuongThucLinh
from NHANVIEN inner join CHUCVU on CHUCVU.macv = NHANVIEN.macv 
go

--21.	Đếm số nhân viên mỗi phòng ban (Thông tin đưa ra: tên phòng ban, số lượng) 
select tenpb , count (NHANVIEN.mapb) as SoLuong
from PHONGBAN right outer join NHANVIEN on NHANVIEN.mapb = PHONGBAN.mapb 
group by tenpb
go

--22.	Đưa ra tên phòng ban có số lượng nhân viên nhiều nhất 

select TenPB
from PHONGBAN inner join NHANVIEN on PHONGBAN.MaPB=NHANVIEN.MaPB
group by TenPB
having COUNT(MaNV) = (
						select top 1 COUNT(MaNV) -- lấy số nv nhiều nhất
						from PHONGBAN inner join NHANVIEN on PHONGBAN.MaPB=NHANVIEN.MaPB
						group by TenPB
						order by COUNT(MaNV) desc
						)
order by COUNT(MaNV) desc

--23.	Thống kê số nhân viên của mỗi phòng ban 

select tenpb , count (NHANVIEN.mapb) as SoLuong
from PHONGBAN right outer join NHANVIEN on NHANVIEN.mapb = PHONGBAN.mapb 
group by tenpb
go
--24.	Xóa nhân viên có mã NV0101 

delete from NHANVIEN 
where manv like 'NV0101'