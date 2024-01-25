USE banhang ;

SELECT * FROM KHACHHANG ;

SELECT count(DISTINCT  HOADON.SOHD)AS SLHD -- SLHD so luong hoa don
FROM HOADON 
JOIN CTHD ON HOADON.SOHD =CTHD.SOHD 
JOIN SANPHAMS ON CTHD.MASP =SANPHAMS.MASP 
WHERE SANPHAMS.NUOCSX = 'Singapore';


-- co bn san pham khac nhau duoc ban ra trong nam 2023 ?

SELECT count(DISTINCT MASP)AS so_luong 
FROM CTHD 
JOIN HOADON ON CTHD.SOHD =HOADON.SOHD 
WHERE YEAR (NGHD) =2023;

-- gia tri hoa don cao nhat ? thapnhat?
SELECT max(TRIGIA) AS max ,
min(TRIGIA) AS min 
FROM HOADON ;
-- TRUNG BINH TRI GIA NAM 2023
SELECT avg(TRIGIA)FROM HOADON 
WHERE YEAR (NGHD) =2023;

-- ho ten khach hang muahoadon co tri gia cao nhat nam 2023
SELECT KHACHHANG.HOTEN AS TEN_KHACH_HANG, MAX(HOADON.TRIGIA) AS TRI_GIA_MAX
FROM HOADON
JOIN KHACHHANG ON HOADON.MAKH = KHACHHANG.MAKH
WHERE YEAR(HOADON.NGHD) = 2023
GROUP BY KHACHHANG.HOTEN
ORDER BY TRI_GIA_MAX DESC
LIMIT 1;


-- LOI KO IN RA DOANH THU CAO NHAT ---
-- IN DANH SACH 3 KHACH HANG CO DOANH SO CAO NHAT
SELECT KHACHHANG.MAKH, KHACHHANG.HOTEN, MAX(KHACHHANG.DOANHSO) AS CHECK_DOANHSO
FROM KHACHHANG
GROUP BY KHACHHANG.MAKH, KHACHHANG.HOTEN  -- Thêm các cột khác nếu có
ORDER BY CHECK_DOANHSO DESC
LIMIT 3;

-- Danh sách sản phẩm có giá bán bằng một trong 3 mức giá cao nhất
SELECT MASP, TENSP, GIA
FROM SANPHAMS
ORDER BY GIA DESC
LIMIT 3;

-- In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có
-- giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
-- THAY THAI LAN = china ;
SELECT MASP , TENSP 
FROM SANPHAMS
WHERE NUOCSX ='China'
ORDER BY GIA DESC 

LIMIT 3 ;

-- in danh sach 3 khach hang doanh so cao nhat 
-- In ra danh sách 3 khách hàng có doanh số cao nhất
SELECT MAKH, HOTEN, DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC
LIMIT 3;
-- Tính tổng số sản phẩm do “Trung Quốc” sản xuất
SELECT COUNT(*) AS TONG_SO_SAN_PHAM
FROM SANPHAMS
WHERE NUOCSX = 'China';

-- tinh tong so san pham tung nuoc san xuat 
SELECT  COUNT(*),NUOCSX  AS TONG_SP 
FROM SANPHAMS
GROUP BY NUOCSX ;

-- TINH TONG SO LUONG TUNG SAN PHAM BAN RA TRONG 10/2006 - THANG 11-2023
-- Tính tổng số lượng của từng sản phẩm được bán ra trong khoảng thời gian
SELECT SANPHAMS.MASP, SANPHAMS.TENSP, SUM(CTHD.SL) AS TONG_SO_LUONG
FROM CTHD
JOIN SANPHAMS ON CTHD.MASP = SANPHAMS.MASP
JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
WHERE HOADON.NGHD  BETWEEN '2006-10-01' AND '2023-11-30'
GROUP BY SANPHAMS.MASP, SANPHAMS.TENSP;


-- Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất
SELECT KHACHHANG.MAKH, KHACHHANG.HOTEN, MAX(HOADON.SOHD) AS SO_LAN_MUA
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
GROUP BY KHACHHANG.MAKH, KHACHHANG.HOTEN
ORDER BY SO_LAN_MUA DESC
LIMIT 1;
-- Tìm nước sản xuất có ít nhất 3 sản phẩm có giá khác nhau
SELECT NUOCSX
FROM SANPHAMS
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3;



-- Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất
SELECT KHACHHANG.MAKH, KHACHHANG.HOTEN, MAX(HOADON.SOHD) AS SO_LAN_MUA
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
GROUP BY KHACHHANG.MAKH, KHACHHANG.HOTEN
ORDER BY MAX(HOADON.TRIGIA) DESC
LIMIT 10;


