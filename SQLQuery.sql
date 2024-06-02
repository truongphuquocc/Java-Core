-- cau 3 :
SELECT * FROM NhanVien nv WHERE YEAR(nv.NgaySinh) = 2000 AND nv.DiaChi LIKE '%Nam Dinh%'
-- cau 4 :
select s.MaSP, s.TenSP, l.TenLoaiSanPham, s.SoLuongTrongKho, s.GiaBan
from SANPHAM as s
left join LOAISANPHAM as l on s.MaLoaiSP = l.MaLoaiSP
where SoLuongTrongKho < 4
-- cau 5
SELECT 
    NV.MaNV, 
    NV.TenNV, 
    HD.MaHD, 
    HD.NgayThanhToan
FROM 
    HOADON HD
JOIN 
    NHANVIEN NV ON HD.MaNV = NV.MaNV
WHERE 
    YEAR(HD.NgayThanhToan) = 2021
    AND HD.PhuongThucThanhToan = 'Chuyen khoan'
ORDER BY 
    HD.NgayThanhToan ASC, 
    NV.MaNV DESC;

-- cau 6 : 
--6a
SELECT DISTINCT DiaChi
FROM KHACHHANG;
-- 6b
SELECT DiaChi
FROM KHACHHANG
GROUP BY DiaChi;
-- Câu 6 sai: Khách hàng thân thiết là phải ít nhất mua hàng 1 lần ( Thiếu điều kiện)
--Cach 1

SELECT DISTINCT kh.DiaChi FROM KhachHang kh LEFT JOIN HoaDon hd ON kh.MaKH = hd.MaKH WHERE hd.MaHD IS NOT NULL

--Cach 2

SELECT kh.DiaChi FROM KhachHang kh LEFT JOIN HoaDon hd ON kh.MaKH = hd.MaKH WHERE hd.MaHD IS NOT NULL GROUP BY kh.DiaChi
-- cau 7

WITH TiviProducts AS (
    SELECT MaSP
    FROM SANPHAM SP
    JOIN LOAISANPHAM LSP ON SP.MaLoaiSP = LSP.MaLoaiSP
    WHERE LSP.TenLoaiSanPham = 'Tivi'
),

FirstHalfSales AS (
    SELECT DISTINCT MaSP
    FROM CHITIETHOADON CT
    JOIN HOADON HD ON CT.MaHD = HD.MaHD
    WHERE YEAR(HD.NgayThanhToan) = 2021 AND MONTH(HD.NgayThanhToan) BETWEEN 1 AND 6
),

SecondHalfSales AS (
    SELECT DISTINCT MaSP
    FROM CHITIETHOADON CT
    JOIN HOADON HD ON CT.MaHD = HD.MaHD
    WHERE YEAR(HD.NgayThanhToan) = 2021 AND MONTH(HD.NgayThanhToan) BETWEEN 7 AND 12
)

SELECT SP.*
FROM SANPHAM SP
JOIN TiviProducts TP ON SP.MaSP = TP.MaSP
JOIN SecondHalfSales SHS ON SP.MaSP = SHS.MaSP
WHERE SP.MaSP NOT IN (SELECT MaSP FROM FirstHalfSales);

--========================================================
-- Làm dễ hiểu thôi
SELECT sp.*
FROM HoaDon hd
JOIN ChiTietHoaDon ct ON hd.MaHD = ct.MaHD
JOIN SanPham sp ON sp.MaSP = ct.MaSP
JOIN LoaiSanPham l ON l.MaLoaiSP = sp.MaLoaiSP
WHERE l.TenLoaiSanPham = 'Tivi'
  AND YEAR(hd.NgayThanhToan) = 2020
  AND MONTH(hd.NgayThanhToan) >= 7
  AND MONTH(hd.NgayThanhToan) <= 12
  AND sp.MaSP NOT IN
    (SELECT sp.MaSP
     FROM HoaDon hd
     JOIN ChiTietHoaDon ct ON hd.MaHD = ct.MaHD
     JOIN SanPham sp ON sp.MaSP = ct.MaSP
     JOIN LoaiSanPham l ON l.MaLoaiSP = sp.MaLoaiSP
     WHERE l.TenLoaiSanPham = 'Tivi'
       AND YEAR(hd.NgayThanhToan) = 2020
       AND MONTH(hd.NgayThanhToan) >= 1
       AND MONTH(hd.NgayThanhToan) <= 6 )

--cau 8
Select TOP 5 c.MaSP, s.TenSP, c.SoLuongBan
from SANPHAM as s
join CHITIETHOADON as c on s.MaSP = c.MaSP
join HOADON as h on c.MaHD = h.MaHD
where year(h.NgayThanhToan) = 2021

-- cau 9

select h.MaHD, h.MaNV, h.MaKH, h.NgayThanhToan, h.PhuongThucThanhToan, SUM(s.GiaBan*c.SoLuongBan) as TongTien
from HOADON as h
join CHITIETHOADON as c on h.MaHD = c.MaHD
join SANPHAM as s on c.MaSP = s.MaSP
GROUP BY 
h.MaHD, h.MaNV, h.MaKH, h.NgayThanhToan, h.PhuongThucThanhToan
ORDER BY h.MaHD;
--=======================
SELECT hd.MaHD,
       hd.MaNV,
       hd.MaKH,
       hd.NgayThanhToan,
       ct.TongTien
FROM HoaDon hd
JOIN
  (SELECT hd.MaHD,
          SUM((ct.SoLuongBan*sp.GiaBan)) AS TongTien
   FROM HoaDon hd
   JOIN ChiTietHoaDon ct ON hd.MaHD = ct.MaHD
   JOIN SanPham sp ON sp.MaSP = ct.MaSP
   GROUP BY hd.MaHD) AS ct ON ct.MaHD = hd.MaHD

-- cau 10

-- Step 1: Identify products not sold in Q3 2020
WITH NotSoldInQ32020 AS (
    SELECT MaSP
    FROM CHITIETHOADON CT
    JOIN HOADON HD ON CT.MaHD = HD.MaHD
    WHERE YEAR(HD.NgayThanhToan) = 2020 AND MONTH(HD.NgayThanhToan) BETWEEN 7 AND 9
    GROUP BY MaSP
),

-- Step 2: Identify products sold at least 4 times in 2021
SoldAtLeast4TimesIn2021 AS (
    SELECT MaSP
    FROM CHITIETHOADON CT
    JOIN HOADON HD ON CT.MaHD = HD.MaHD
    WHERE YEAR(HD.NgayThanhToan) = 2021
    GROUP BY MaSP
    HAVING SUM(CT.SoLuongBan) >= 4
)

-- Step 3: Select products that meet both criteria
SELECT SP.*
FROM SANPHAM SP
WHERE SP.MaSP NOT IN (SELECT MaSP FROM NotSoldInQ32020)
AND SP.MaSP IN (SELECT MaSP FROM SoldAtLeast4TimesIn2021);

--============
--===========================
SELECT *
FROM SanPham sp
WHERE sp.MaSP IN
    (SELECT DISTINCT sp.MaSP
     FROM SanPham sp
     JOIN ChiTietHoaDon ct ON sp.MaSP = ct.MaSP
     JOIN HoaDon hd ON hd.MaHD = ct.MaHD
     WHERE DATEPART(QUARTER, hd.NgayThanhToan) != 3
       AND YEAR(hd.NgayThanhToan) =2020
       AND sp.MaSP IN
         (SELECT sp.MaSP
          FROM SanPham sp
          JOIN ChiTietHoaDon ct ON sp.MaSP = ct.MaSP
          JOIN HoaDon hd ON hd.MaHD = ct.MaHD
          WHERE YEAR(hd.NgayThanhToan) = 2021
          GROUP BY sp.MaSP
          HAVING COUNT(*) >= 4) )

-- cau 11 : Liệt kê MaLoaiSP, TenLoaiSanPham, DoanhThu. Trong đó Doanh thu của mã loại sản 
--phẩm là số tiền thu được từ việc bán ra các sản phẩm thuộc mã loại sản phẩm đó trong năm 2021. 
--Sắp xếp thứ tự tăng dần theo DoanhThu

SELECT s.MaLoaiSP, l.TenLoaiSanPham, SUM(s.GiaBan*ct.SoLuongBan) as DoanhThu
FROM  LOAISANPHAM as l
JOIN SANPHAM as s on l.MaLoaiSP = s.MaLoaiSP
JOIN CHITIETHOADON as ct on ct.MaSP = s.MaSP
Group by s.MaLoaiSP,  l.TenLoaiSanPham;

-- cau 12
-- Find the employee who sold the most products in terms of quantity in 2021
WITH SalesQuantity AS (
    SELECT 
        HD.MaNV, 
        SUM(CT.SoLuongBan) AS TotalQuantity
    FROM 
        HOADON HD
    JOIN 
        CHITIETHOADON CT ON HD.MaHD = CT.MaHD
    WHERE 
        YEAR(HD.NgayThanhToan) = 2021
    GROUP BY 
        HD.MaNV
)

SELECT 
    NV.*
FROM 
    NHANVIEN NV
JOIN 
    SalesQuantity SQ ON NV.MaNV = SQ.MaNV
WHERE 
    SQ.TotalQuantity = (SELECT MAX(TotalQuantity) FROM SalesQuantity);
--=====================================
SELECT DISTINCT *
FROM NhanVien nv
WHERE nv.MaNV IN
    (SELECT TOP 1 nv.MaNV
     FROM HoaDon hd
     JOIN ChiTietHoaDon ct ON hd.MaHD = ct.MaHD
     JOIN SanPham sp ON ct.MaSP = sp.MaSP
     JOIN NhanVien nv ON hd.MaNV = nv.MaNV
     GROUP BY nv.MaNV
     ORDER BY SUM(ct.SoLuongBan) DESC)
  OR nv.MaNV IN
    (SELECT TOP 1 nv.MaNV
     FROM HoaDon hd
     JOIN ChiTietHoaDon ct ON hd.MaHD = ct.MaHD
     JOIN SanPham sp ON ct.MaSP = sp.MaSP
     JOIN NhanVien nv ON hd.MaNV = nv.MaNV
     GROUP BY nv.MaNV
     ORDER BY SUM((ct.SoLuongBan*sp.GiaBan)) DESC)

-- cau 13
select s.MaSP, s.TenSP, l.TenLoaiSanPham, (s.SoLuongTrongKho - ct.SoLuongBan) as SoLuongConLai
from SANPHAM as S
join CHITIETHOADON as ct on S.MaSP = ct.MaSP
join LOAISANPHAM as l on S.MaLoaiSP = l.MaLoaiSP
--==================================
SELECT sp.MaSP,sp.TenSP,l.TenLoaiSanPham,(sp.SoLuongTrongKho-ct.SoLuongBan) FROM SanPham sp JOIN LoaiSanPham l ON sp.MaLoaiSP = l.MaLoaiSP JOIN 
(
	SELECT sp.MaSP,(SUM(ct.SoLuongBan)) AS SoLuongBan
	FROM ChiTietHoaDon ct JOIN SanPham sp ON ct.MaSP = sp.MaSP GROUP BY sp.MaSP
) AS ct ON ct.MaSP = sp.MaSP

-- cau 14
-- Step 1: Identify customers with an address of "Quang Tri" and at least 3 purchases in 2021
WITH FrequentBuyers AS (
    SELECT 
        KH.MaKH
    FROM 
        KHACHHANG KH
    JOIN 
        HOADON HD ON KH.MaKH = HD.MaKH
    WHERE 
        KH.DiaChi = 'Quang Tri'
        AND YEAR(HD.NgayThanhToan) = 2021
    GROUP BY 
        KH.MaKH
    HAVING 
        COUNT(HD.MaHD) >= 3
)

-- Step 2: Update their address to "Da Nang"
UPDATE KHACHHANG
SET DiaChi = 'Da Nang'
WHERE MaKH IN (SELECT MaKH FROM FrequentBuyers);


-- Step 2: Identify products sold at least 4 times in 2021
    SELECT MaSP
    FROM CHITIETHOADON CT
    JOIN HOADON HD ON CT.MaHD = HD.MaHD
    WHERE YEAR(HD.NgayThanhToan) = 2021
    GROUP BY MaSP
    HAVING SUM(CT.SoLuongBan) <= 3

--==========================
UPDATE KhachHang
SET DiaChi = 'Da Nang'
WHERE DiaChi = 'Quang Tri'
  AND MaKH IN
    (SELECT kh.MaKH
     FROM KhachHang kh
     JOIN HoaDon hd ON kh.MaKH = hd.MaKH
     WHERE YEAR(hd.NgayThanhToan) =2020
     GROUP BY kh.MaKH
     HAVING COUNT(*) >= 2)