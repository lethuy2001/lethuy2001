--LT5: Ngôn ngữ truy vấn trên 1 bảng

--I. Cú pháp
	--SELECT [distinct/ top n ]ten_Cot1,ten_cot2,...
	--FROM	Ten_bang
	--[WHERE	nơi đặt đk bình thường vd: diem >5]
	--[GROUP BY ten_cot1_can_nhom, ten_cot2_can_nhom,...]
	--[HAVING	nơi đặt điều kiện thống kê(điều kiện có sử dụng hàm thống kê) vd avg(diem)>5]
	--[ORDER BY ten_cot1_can_sap_xep asc/desc, ten_cot2_can_sap_xep asc/desc...]

--trong đó:
--	thành phần trong [] là không bắt buộc
--	distinct : loại bỏ dữ liệu trùng
--	top n: vd top 5 (lấy n dòng dữ liệu)
--	Khi nào có group by?: Nếu trong mệnh đề select có dùng các hàm thống kê (sum, count, max, min...)
--	thì chúng ta phải nhóm (group by) theo tất cả các cột không sử dụng hàm thống kê.

--sử dụng CSDL Northwind trả lời các câu hỏi sau.
use Northwind
go

--1. Lấy các thông tin về nhân viên (Employees)
	select *
	from Employees

-- 2. Giống câu 1, sắp tăng dần theo tên (FirstName)
	select *
	from Employees
	order by FirstName asc  -- sắp tăng dùng asc, hoặc không nói gì

--cách 2:
	select *
	from Employees
	order by FirstName   -- sắp tăng dùng asc, hoặc không nói gì

-- 3. Giống câu 1, sắp giảm dần theo tên (FirstName)
	select *
	from Employees
	order by FirstName desc

-- 4. Lấy thông tin các nhân viên, có họ [LastName]bắt đầu là D, và
--sắp dữ liệu giảm dần theo tên
	select *
	from Employees
	where LastName like 'D%'  -- dùng like khi so sánh chuỗi
	order by FirstName desc		-- % đại diện cho 1 nhóm ký tự.

-- 5. Lấy thông tin về họ tên nhân viên (nối họ với tên thành họ tên)
	select FirstName + ' '+ LastName as Hoten --as: đặt tên cột
	from Employees							  -- dấu +: nối chuỗi

--6. Lấy thông tin về họ của nhân viên, loại bỏ các dòng kết quả trùng
	SELECT distinct LastName --distinct: loại bỏ dữ liệu trùng
	from Employees ;

-- 7. Hiển thị 5 dòng đầu tiên trong bảng nhân viên
	select top 5 *
	from  Employees

-- 8. Hiển thị 10% dòng đầu tiên trong Chi tiết đặt hàng (Order Details)
	SELECT TOP 10 PERCENT *  -- xem slide bài 5 trang 13
	FROM  [Order Details]


