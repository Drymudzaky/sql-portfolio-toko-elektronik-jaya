# SQL Portfolio Project: TokoElektronikJaya

Project SQL untuk latihan penerapan **SELECT, WHERE, LIKE, ORDER BY, LIMIT, GROUP BY, HAVING, JOIN, dan Aliasing** pada studi kasus data penjualan toko elektronik online.

## Latar Belakang

Studi kasus: saya berperan sebagai Data Analyst di **TokoElektronikJaya**, toko online yang menjual perangkat elektronik (laptop, aksesoris, monitor, storage, dll). Project ini berisi 23 pertanyaan bisnis yang dijawab menggunakan query SQL, mulai dari query dasar satu tabel sampai kombinasi multi-tabel dengan JOIN.

## Struktur Database

Database terdiri dari 4 tabel dengan relasi sebagai berikut:

```
customers ──1:N── orders ──1:N── order_items ──N:1── products
```

| Tabel | Kolom |
|---|---|
| `customers` | customer_id, customer_name, gender, city, email, join_date |
| `products` | product_id, product_name, category, price, stock |
| `orders` | order_id, customer_id, order_date, payment_method, status |
| `order_items` | order_item_id, order_id, product_id, quantity, price_at_purchase |

## Isi Repository

- `toko_elektronik_jaya_mysql.sql` — script untuk membuat database beserta seed data (MySQL)
- `answers.sql` — 23 query jawaban lengkap dengan komentar penjelasan
- `README.md` — dokumen ini

## Daftar Pertanyaan & Kategori Fungsi

**A. SELECT, WHERE, Aliasing**
1. Menampilkan nama pelanggan dan kota dengan alias kolom
2. Produk dengan kategori tertentu
3. Produk dengan harga di atas threshold tertentu
4. Order dengan status tertentu
5. Kombinasi filter kategori dan harga (AND)

**B. LIKE**
6. Pencarian produk berdasarkan sebagian nama
7. Kombinasi LIKE untuk filter domain email dan huruf awal nama
8. Pencarian kategori berdasarkan sebagian kata

**C. ORDER BY, LIMIT**
9. Produk termahal (Top N)
10. Pelanggan terbaru bergabung
11. Order terlama dengan batas jumlah baris

**D. GROUP BY**
12–16. Agregasi (COUNT, SUM, AVG) per kategori, status, dan metode pembayaran

**E. HAVING**
17–19. Filter hasil agregasi (kategori dengan jumlah produk tertentu, produk dengan total penjualan tertentu, kategori dengan rata-rata harga tertentu)

**F. Kombinasi (JOIN + WHERE/GROUP BY/HAVING/ORDER BY/LIMIT)**
20. Top 5 produk terlaris
21. Total revenue per kategori (hanya order selesai)
22. Identifikasi pelanggan loyal (frekuensi order)
23. Filter order berdasarkan kota pelanggan dan status, diurutkan dan dibatasi jumlahnya

## Insight yang Didapat

- Kategori **Laptop** menyumbang revenue terbesar meskipun jumlah unit terjualnya tidak paling banyak — karena harga satuannya tinggi.
- Produk **Flashdisk** dan **Mouse Wireless** adalah produk dengan volume penjualan (quantity) tertinggi — konsisten dengan sifat produk aksesoris murah yang sering dibeli berulang.
- Ada 10 dari 20 pelanggan yang tergolong "loyal" (order lebih dari 2 kali), menunjukkan basis pelanggan yang cukup aktif.

## Tools

- MySQL / MySQL Workbench untuk menjalankan query
- Dataset dummy dibuat khusus untuk keperluan latihan portofolio ini

## Cara Menjalankan

1. Import `toko_elektronik_jaya_mysql.sql` ke MySQL (lewat MySQL Workbench atau `mysql -u root -p < toko_elektronik_jaya_mysql.sql`)
2. Jalankan query di `answers.sql` satu per satu untuk melihat hasilnya
