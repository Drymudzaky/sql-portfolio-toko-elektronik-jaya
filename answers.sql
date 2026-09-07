-- ============================================================
-- PROJECT: TokoElektronikJaya - SQL Portfolio Project
-- Author : Muhammad Dary Mudzaky
-- Deskripsi: Kumpulan query SQL untuk menjawab pertanyaan bisnis
-- dari studi kasus toko elektronik online, menggunakan SELECT,
-- WHERE, LIKE, ORDER BY, LIMIT, GROUP BY, HAVING, JOIN, dan Aliasing.
-- Database: MySQL (toko_elektronik_jaya)
-- ============================================================


-- ============================================================
-- A. SELECT, WHERE, ALIASING
-- ============================================================

-- 1. Tampilkan nama pelanggan dan kota, beri alias
SELECT
    customer_name AS nama_pelanggan,
    city AS kota
FROM customers;

-- 2. Tampilkan semua produk dengan kategori 'Laptop'
SELECT *
FROM products
WHERE category = 'Laptop';

-- 3. Tampilkan semua produk dengan harga di atas 1.000.000
SELECT *
FROM products
WHERE price > 1000000;

-- 4. Tampilkan semua order dengan status 'Dibatalkan'
SELECT *
FROM orders
WHERE status = 'Dibatalkan';

-- 5. Tampilkan produk kategori 'Aksesoris' dengan harga di bawah 500.000
SELECT *
FROM products
WHERE category = 'Aksesoris' AND price < 500000;


-- ============================================================
-- B. LIKE
-- ============================================================

-- 6. Cari produk yang NAMA-nya mengandung kata "Laptop"
SELECT *
FROM products
WHERE product_name LIKE '%Laptop%';

-- 7. Cari pelanggan dengan email domain mail.com dan nama diawali huruf 'A'
SELECT *
FROM customers
WHERE email LIKE '%mail.com' AND customer_name LIKE 'A%';

-- 8. Cari produk dengan kategori mengandung kata "Print"
SELECT *
FROM products
WHERE category LIKE '%Print%';


-- ============================================================
-- C. ORDER BY, LIMIT
-- ============================================================

-- 9. Tampilkan 5 produk termahal
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- 10. Tampilkan 5 pelanggan yang paling baru bergabung
SELECT *
FROM customers
ORDER BY join_date DESC
LIMIT 5;

-- 11. Tampilkan 10 order pertama, urut dari tanggal order terlama
SELECT *
FROM orders
ORDER BY order_date ASC
LIMIT 10;


-- ============================================================
-- D. GROUP BY, ALIASING PADA AGREGASI
-- ============================================================

-- 12. Hitung jumlah produk per kategori
SELECT
    category,
    COUNT(*) AS total_produk
FROM products
GROUP BY category;

-- 13. Hitung total quantity terjual per product_id
SELECT
    product_id,
    SUM(quantity) AS total_terjual
FROM order_items
GROUP BY product_id;

-- 14. Hitung rata-rata harga produk per kategori
SELECT
    category,
    AVG(price) AS rata_rata_harga
FROM products
GROUP BY category;

-- 15. Hitung jumlah order per status
SELECT
    status,
    COUNT(*) AS jumlah_order
FROM orders
GROUP BY status;

-- 16. Hitung jumlah order per payment_method, urutkan dari yang paling banyak
SELECT
    payment_method,
    COUNT(*) AS jumlah_order
FROM orders
GROUP BY payment_method
ORDER BY jumlah_order DESC;


-- ============================================================
-- E. HAVING
-- ============================================================

-- 17. Kategori produk dengan lebih dari 3 produk
SELECT
    category,
    COUNT(*) AS jumlah_produk
FROM products
GROUP BY category
HAVING COUNT(*) > 3;

-- 18. product_id dengan total quantity terjual lebih dari 3 unit
SELECT
    product_id,
    SUM(quantity) AS total_terjual
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > 3;

-- 19. Kategori dengan rata-rata harga di atas 1.000.000
SELECT
    category,
    AVG(price) AS rata_rata_harga
FROM products
GROUP BY category
HAVING AVG(price) > 1000000;


-- ============================================================
-- F. KOMBINASI (JOIN + WHERE/GROUP BY/HAVING/ORDER BY/LIMIT)
-- ============================================================

-- 20. Top 5 produk terlaris (berdasarkan total quantity terjual)
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_terjual
FROM products AS p
JOIN order_items AS oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_terjual DESC
LIMIT 5;

-- 21. Total revenue per kategori, hanya order dengan status 'Selesai'
SELECT
    p.category,
    SUM(oi.quantity * oi.price_at_purchase) AS total_pendapatan
FROM order_items AS oi
JOIN products AS p ON oi.product_id = p.product_id
JOIN orders AS o ON oi.order_id = o.order_id
WHERE o.status = 'Selesai'
GROUP BY p.category
ORDER BY total_pendapatan DESC;

-- 22. Pelanggan loyal: sudah order lebih dari 2 kali
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS jumlah_order
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2
ORDER BY jumlah_order DESC;

-- 23. Order dari pelanggan kota 'Bandung' dengan status 'Selesai', 10 terbaru
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    c.city
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
WHERE c.city = 'Bandung' AND o.status = 'Selesai'
ORDER BY o.order_date DESC
LIMIT 10;
