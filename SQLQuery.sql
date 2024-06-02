-- cau 3 :
select * from NHANVIEN where YEAR(NgaySinh) = 2000 and DiaChi Like 'Nam Dinh'
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


-- cau 13
select s.MaSP, s.TenSP, l.TenLoaiSanPham, (s.SoLuongTrongKho - ct.SoLuongBan) as SoLuongConLai
from SANPHAM as S
join CHITIETHOADON as ct on S.MaSP = ct.MaSP
join LOAISANPHAM as l on S.MaLoaiSP = l.MaLoaiSP

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