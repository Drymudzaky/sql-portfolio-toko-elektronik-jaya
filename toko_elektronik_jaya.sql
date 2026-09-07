-- ============================================================
-- PROJECT: TokoElektronikJaya - Sales Database
-- Portofolio Project untuk latihan SQL (SELECT, WHERE, GROUP BY,
-- ORDER BY, HAVING, LIKE, LIMIT, Aliasing)
-- Compatible dengan SQLite, MySQL, PostgreSQL (sedikit adjust
-- untuk tipe data AUTOINCREMENT/SERIAL kalau perlu)
-- ============================================================

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name TEXT NOT NULL,
    gender        TEXT,
    city          TEXT,
    email         TEXT,
    join_date     DATE
);

CREATE TABLE products (
    product_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name  TEXT NOT NULL,
    category      TEXT,
    price         INTEGER,
    stock         INTEGER
);

CREATE TABLE orders (
    order_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id    INTEGER NOT NULL,
    order_date     DATE,
    payment_method TEXT,
    status         TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id          INTEGER NOT NULL,
    product_id        INTEGER NOT NULL,
    quantity          INTEGER NOT NULL,
    price_at_purchase INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
-- DATA: customers
-- ============================================================
INSERT INTO customers (customer_name, gender, city, email, join_date) VALUES
('Andi Saputra', 'L', 'Bandung', 'andi.saputra@mail.com', '2024-01-12'),
('Budi Hartono', 'L', 'Jakarta', 'budi.hartono@mail.com', '2024-01-20'),
('Citra Dewi', 'P', 'Surabaya', 'citra.dewi@mail.com', '2024-02-03'),
('Dedi Kurniawan', 'L', 'Bandung', 'dedi.kurniawan@mail.com', '2024-02-15'),
('Eka Putri', 'P', 'Yogyakarta', 'eka.putri@mail.com', '2024-02-28'),
('Fajar Ramadhan', 'L', 'Jakarta', 'fajar.ramadhan@mail.com', '2024-03-05'),
('Gita Lestari', 'P', 'Semarang', 'gita.lestari@mail.com', '2024-03-18'),
('Hendra Wijaya', 'L', 'Bandung', 'hendra.wijaya@mail.com', '2024-03-25'),
('Indah Permata', 'P', 'Jakarta', 'indah.permata@mail.com', '2024-04-02'),
('Joko Susilo', 'L', 'Malang', 'joko.susilo@mail.com', '2024-04-10'),
('Kartika Sari', 'P', 'Surabaya', 'kartika.sari@mail.com', '2024-04-22'),
('Lukman Hakim', 'L', 'Bandung', 'lukman.hakim@mail.com', '2024-05-01'),
('Maya Anggraini', 'P', 'Jakarta', 'maya.anggraini@mail.com', '2024-05-14'),
('Nanda Pratama', 'L', 'Yogyakarta', 'nanda.pratama@mail.com', '2024-05-30'),
('Oki Setiawan', 'L', 'Semarang', 'oki.setiawan@mail.com', '2024-06-08'),
('Putri Wulandari', 'P', 'Bandung', 'putri.wulandari@mail.com', '2024-06-19'),
('Qori Amelia', 'P', 'Jakarta', 'qori.amelia@mail.com', '2024-07-01'),
('Rian Firmansyah', 'L', 'Malang', 'rian.firmansyah@mail.com', '2024-07-15'),
('Sinta Marlina', 'P', 'Surabaya', 'sinta.marlina@mail.com', '2024-07-27'),
('Taufik Hidayat', 'L', 'Bandung', 'taufik.hidayat@mail.com', '2024-08-09');

-- ============================================================
-- DATA: products
-- ============================================================
INSERT INTO products (product_name, category, price, stock) VALUES
('Mouse Wireless Logitech M170', 'Aksesoris', 150000, 120),
('Keyboard Mechanical Rexus MX9', 'Aksesoris', 450000, 65),
('Headset Gaming HyperX Cloud II', 'Aksesoris', 899000, 40),
('Webcam Logitech C920', 'Aksesoris', 750000, 30),
('Laptop Asus Vivobook 14', 'Laptop', 7500000, 15),
('Laptop Lenovo IdeaPad Slim 3', 'Laptop', 6800000, 18),
('Laptop Acer Aspire 5', 'Laptop', 7200000, 12),
('Laptop MacBook Air M1', 'Laptop', 13500000, 8),
('Monitor LG 24 inch Full HD', 'Monitor', 1650000, 25),
('Monitor Samsung 27 inch Curved', 'Monitor', 2900000, 14),
('Monitor ViewSonic 22 inch', 'Monitor', 1250000, 20),
('SSD Samsung 500GB', 'Storage', 650000, 50),
('SSD WD Blue 1TB', 'Storage', 1100000, 35),
('HDD Seagate 2TB', 'Storage', 850000, 40),
('Flashdisk Sandisk 64GB', 'Storage', 95000, 200),
('RAM Corsair Vengeance 16GB', 'Komponen', 750000, 45),
('RAM V-Gen 8GB DDR4', 'Komponen', 380000, 60),
('Power Bank Anker 10000mAh', 'Aksesoris', 350000, 70),
('Printer Canon Pixma G2010', 'Printer', 1950000, 22),
('Printer Epson L3210', 'Printer', 2150000, 18),
('Router TP-Link Archer C6', 'Networking', 480000, 33),
('Router ASUS RT-AX55', 'Networking', 950000, 20),
('Speaker Bluetooth JBL Go 3', 'Aksesoris', 420000, 55),
('Tablet Samsung Galaxy Tab A9', 'Tablet', 2450000, 16),
('Smartwatch Xiaomi Redmi Watch 3', 'Aksesoris', 599000, 28);

-- ============================================================
-- DATA: orders  (50 orders, berbagai status & metode bayar)
-- ============================================================
INSERT INTO orders (customer_id, order_date, payment_method, status) VALUES
(1, '2025-01-05', 'Transfer Bank', 'Selesai'),
(2, '2025-01-06', 'E-Wallet', 'Selesai'),
(3, '2025-01-08', 'COD', 'Selesai'),
(4, '2025-01-10', 'Transfer Bank', 'Dibatalkan'),
(5, '2025-01-12', 'Kartu Kredit', 'Selesai'),
(1, '2025-01-15', 'E-Wallet', 'Selesai'),
(6, '2025-01-16', 'Transfer Bank', 'Selesai'),
(7, '2025-01-18', 'COD', 'Selesai'),
(8, '2025-01-20', 'E-Wallet', 'Diproses'),
(9, '2025-01-22', 'Transfer Bank', 'Selesai'),
(10, '2025-01-25', 'Kartu Kredit', 'Selesai'),
(2, '2025-01-27', 'Transfer Bank', 'Selesai'),
(11, '2025-01-29', 'E-Wallet', 'Selesai'),
(12, '2025-02-01', 'COD', 'Dibatalkan'),
(13, '2025-02-03', 'Transfer Bank', 'Selesai'),
(3, '2025-02-05', 'E-Wallet', 'Selesai'),
(14, '2025-02-07', 'Kartu Kredit', 'Selesai'),
(15, '2025-02-09', 'Transfer Bank', 'Diproses'),
(6, '2025-02-11', 'COD', 'Selesai'),
(16, '2025-02-13', 'E-Wallet', 'Selesai'),
(17, '2025-02-15', 'Transfer Bank', 'Selesai'),
(4, '2025-02-17', 'Kartu Kredit', 'Selesai'),
(18, '2025-02-19', 'E-Wallet', 'Selesai'),
(19, '2025-02-21', 'COD', 'Selesai'),
(20, '2025-02-23', 'Transfer Bank', 'Selesai'),
(9, '2025-02-25', 'E-Wallet', 'Dibatalkan'),
(5, '2025-02-27', 'Transfer Bank', 'Selesai'),
(7, '2025-03-01', 'COD', 'Selesai'),
(8, '2025-03-03', 'Kartu Kredit', 'Selesai'),
(10, '2025-03-05', 'E-Wallet', 'Selesai'),
(11, '2025-03-07', 'Transfer Bank', 'Diproses'),
(12, '2025-03-09', 'COD', 'Selesai'),
(13, '2025-03-11', 'E-Wallet', 'Selesai'),
(14, '2025-03-13', 'Transfer Bank', 'Selesai'),
(15, '2025-03-15', 'Kartu Kredit', 'Selesai'),
(16, '2025-03-17', 'E-Wallet', 'Selesai'),
(1, '2025-03-19', 'Transfer Bank', 'Selesai'),
(17, '2025-03-21', 'COD', 'Selesai'),
(18, '2025-03-23', 'E-Wallet', 'Selesai'),
(19, '2025-03-25', 'Transfer Bank', 'Dibatalkan'),
(20, '2025-03-27', 'Kartu Kredit', 'Selesai'),
(2, '2025-03-29', 'E-Wallet', 'Selesai'),
(3, '2025-03-31', 'Transfer Bank', 'Selesai'),
(6, '2025-04-02', 'COD', 'Selesai'),
(9, '2025-04-04', 'E-Wallet', 'Selesai'),
(13, '2025-04-06', 'Transfer Bank', 'Selesai'),
(4, '2025-04-08', 'Kartu Kredit', 'Diproses'),
(20, '2025-04-10', 'E-Wallet', 'Selesai'),
(7, '2025-04-12', 'Transfer Bank', 'Selesai'),
(15, '2025-04-14', 'COD', 'Selesai');

-- ============================================================
-- DATA: order_items (detail produk per order)
-- ============================================================
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 5, 1, 7500000),
(1, 1, 1, 150000),
(2, 9, 1, 1650000),
(3, 12, 2, 650000),
(4, 6, 1, 6800000),
(5, 8, 1, 13500000),
(6, 2, 1, 450000),
(6, 16, 1, 750000),
(7, 19, 1, 1950000),
(8, 3, 1, 899000),
(9, 24, 1, 2450000),
(10, 7, 1, 7200000),
(10, 13, 1, 1100000),
(11, 10, 1, 2900000),
(12, 15, 3, 95000),
(13, 21, 1, 480000),
(14, 5, 1, 7500000),
(15, 4, 1, 750000),
(15, 17, 2, 380000),
(16, 25, 1, 599000),
(17, 8, 1, 13500000),
(18, 11, 1, 1250000),
(19, 2, 2, 450000),
(20, 14, 1, 850000),
(21, 20, 1, 2150000),
(22, 6, 1, 6800000),
(23, 22, 1, 950000),
(24, 1, 3, 150000),
(25, 9, 1, 1650000),
(26, 24, 1, 2450000),
(27, 3, 1, 899000),
(27, 18, 1, 350000),
(28, 7, 1, 7200000),
(29, 13, 2, 1100000),
(30, 12, 1, 650000),
(31, 5, 1, 7500000),
(32, 15, 5, 95000),
(33, 21, 2, 480000),
(34, 8, 1, 13500000),
(35, 10, 1, 2900000),
(36, 2, 1, 450000),
(37, 25, 2, 599000),
(38, 19, 1, 1950000),
(39, 6, 1, 6800000),
(40, 4, 1, 750000),
(41, 22, 1, 950000),
(42, 9, 1, 1650000),
(43, 1, 2, 150000),
(44, 14, 1, 850000),
(45, 20, 1, 2150000),
(46, 24, 1, 2450000),
(47, 7, 1, 7200000),
(47, 16, 1, 750000),
(48, 3, 1, 899000),
(49, 11, 1, 1250000),
(50, 5, 1, 7500000),
(50, 17, 1, 380000);
