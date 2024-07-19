## Uji Kompetensi Basis data - Kelompok 15
### Anggota
- Hans Jeffrey Hanggara Mukti (19230081)
- Saddam Satria Ardhi (12210403)
- Muhammad Zidane Sc (19231022)
- Citra Dwi Maharani (12211116)

### Tema basis data yang diambil
Pada awalnya kami mempunyai 2 pilihan tema database yaitu HRIS dan E-commerce dengan alasan masing-masing memiliki kompleksitas dan relevansi yang tinggi dan mempunyai banyak ruang untuk eksplorasi. Setelah mempertimbangkan kedua pilihan tersbut, kami memutuskan untuk memilih tema E-commerce karena lebih familiar. Berikut alasan lengkapnya:
- **Relevansi dan Familiaritas:** E-commerce adalah industri yang sangat relevan dan sedang berkembang pesat. Tema ini familiar bagi banyak orang karena kebanyakan dari kita telah berinteraksi dengan platform e-commerce, baik sebagai pelanggan maupun sebagai pemilik bisnis.
- **Kompleksitas Data:** Sistem e-commerce mencakup berbagai jenis data seperti produk, kategori, pengguna, transaksi, ulasan, dan inventaris. Hal ini memberikan peluang untuk mempelajari dan mengelola berbagai aspek manajemen data yang kompleks.
- **Banyak resource:** Ada banyak contoh database e-commerce open-source yang dapat digunakan sebagai referensi dan sumber belajar. Ini memudahkan pengumpulan data dan pengembangan proyek.

### Source Database
kami menggunakan sumber database dari [GitHub - Jize](https://github.com/chiqors/Jize) dengan alasan database ini menyediakan struktur data yang komprehensif dan mendetail yang mencakup berbagai aspek penting dalam e-commerce, seperti manajemen produk, pengguna, pesanan, dan pembayaran. Struktur ini memudahkan kami untuk memahami dan mengelola data yang relevan dengan skenario bisnis nyata.

### Tools yang digunakan
- #### Postgresql (DBMS)
   - **Penjelasan:** PostgreSQL adalah sistem manajemen basis data relasional (RDBMS) yang bersifat open-source dan memiliki fitur yang lengkap. PostgreSQL mendukung standar SQL penuh dan menawarkan fitur-fitur lanjutan seperti replikasi, indexing, dan full-text search.
   - **Alasan penggunaan:** 
      - Performa Tinggi: Dengan optimisasi query yang baik dan dukungan untuk berbagai jenis indexing, PostgreSQL memberikan performa yang sangat baik untuk aplikasi dengan kebutuhan query kompleks.
      - Komunitas dan Dukungan: Sebagai proyek open-source, PostgreSQL didukung oleh komunitas besar yang aktif, menyediakan dokumentasi yang lengkap dan berbagai sumber daya pembelajaran.
      - Ekstra Poin: Penggunaan PostgreSQL dalam tugas ini memberikan poin ekstra dalam penilaian.
- #### psql (Database Client) 
  - **Penjelasan**
    - psql adalah command line interface (CLI) untuk PostgreSQL. Dengan psql, pengguna dapat menjalankan perintah SQL, mengelola basis data, dan melakukan berbagai operasi lainnya secara langsung melalui terminal.     
  - **Alasan penggunaan**
    - Efisiensi: psql memungkinkan eksekusi perintah SQL dengan cepat tanpa perlu antarmuka grafis, yang dapat menghemat waktu dan mempercepat proses pengelolaan 
    - Ekstra Poin: Penggunaan psql dalam tugas ini memberikan poin ekstra dalam penilaian.
  - **Notes**: Walaupun psql adalah alat utama yang digunakan, pekerjaan ini juga bisa dilakukan dengan baik menggunakan database client lain seperti pgAdmin4, yang menawarkan antarmuka grafis jika diperlukan.
- #### Linux (OS)
    - **Penjelasan**
        - Linux adalah sistem operasi open-source yang dikenal karena stabilitas dan keamanannya. Linux banyak digunakan di server dan dalam pengembangan perangkat lunak.  
  - **Alasan penggunaan** 
    - Stabilitas dan Keandalan: Linux dikenal karena stabilitas dan keandalannya, terutama dalam lingkungan server yang membutuhkan uptime tinggi.
    - Performa: Linux menawarkan performa yang tinggi dan efisien dalam mengelola sumber daya sistem, yang sangat penting untuk aplikasi yang membutuhkan kinerja optimal.
    - Ekstra Poin: Penggunaan Linux dalam tugas ini memberikan poin ekstra dalam penilaian.
  - **Notes:** Walaupun Linux dipilih untuk demonstrasi, pekerjaan ini dapat dilakukan dengan baik pada sistem operasi lain seperti Windows, memberikan fleksibilitas dalam pilihan platform. 
- #### draw.io 
  - **Penjelasan**
    -  draw.io adalah alat online untuk membuat diagram yang mendukung berbagai jenis diagram seperti flowchart, ERD dan banyak lagi. Alat ini mudah digunakan dengan antarmuka drag-and-drop dan memiliki berbagai fitur untuk mendukung pembuatan diagram yang kompleks.
  - **Alasan penggunaan**
    - Antarmuka Intuitif: draw.io memiliki antarmuka yang intuitif dan user-friendly, membuatnya mudah digunakan bahkan bagi pengguna yang baru pertama kali membuat diagram.
    - Fleksibilitas: draw.io mendukung berbagai jenis diagram, memberikan fleksibilitas untuk membuat diagram yang sesuai dengan kebutuhan proyek.
    - Kolaborasi: Alat ini mendukung kolaborasi secara real-time, memungkinkan anggota tim untuk bekerja bersama-sama pada diagram yang sama.
    - Ekspor: Diagram yang dibuat di draw.io dapat diekspor ke berbagai format seperti PNG, JPEG, SVG, dan PDF, memudahkan penyertaan diagram dalam dokumentasi dan presentasi.

### Flow aplikasi
<!---
1. Login
    - Pengguna mencari data user berdasarkan `email` dan `password` pada table `users`.
    - Sistem memvalidasi kredensial dengan mencocokkan data dalam tabel Users.
    - Jika data ditemukan maka pengguna berhasil login
2. Registrasi
    - Pengguna memasukkan `nama`, `email`, `password`, dan informasi lain ke dalam tabel users dan user_details.
    - Data registrasi disimpan sebagai entri baru dalam tabel `users`.
3. Jelajahi produk
4. Cari Produk berdasarkan "keyword"
5. Detail produk
6. Checkout
7. Pembayaran
8. Manajemen produk oleh admin
9. Manajemen order oleh admin
-->
![image](https://github.com/user-attachments/assets/1fecc71a-4e95-4a80-a5aa-60ca9283d272)


### UML
![simbad-ecommerce](https://github.com/user-attachments/assets/77f44d11-6807-44d2-a521-ebf33722b049)

### ERD
![image](https://github.com/user-attachments/assets/26de7bc7-a737-4e2f-a9f5-a380f981d43d)


### DDL
```sql
-- Enum Types
CREATE TYPE PaymentMethod AS ENUM ('BANK', 'CC');
CREATE TYPE PaymentStatus AS ENUM ('UNPAID', 'PAID', 'VERIFICATION', 'SENDING', 'SENT');
CREATE TYPE OrderItemType AS ENUM ('PRODUCT', 'EXPEDITION');

-- Table Definitions
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE,
    username VARCHAR(250) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_details (
    id SERIAL PRIMARY KEY,
    address TEXT NOT NULL,
    phone VARCHAR(30) NOT NULL,
    postal_code VARCHAR(15) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    slug VARCHAR(250) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    price DECIMAL(10,0) NOT NULL,
    discount DECIMAL(10,0) NOT NULL
);

CREATE TABLE IF NOT EXISTS product_images (
    id SERIAL PRIMARY KEY,
    image_title VARCHAR(250) NOT NULL,
    image_path VARCHAR(250) NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    order_date TIMESTAMP NOT NULL,
    order_expired TIMESTAMP NOT NULL,
    tracking_number VARCHAR(250) DEFAULT NULL UNIQUE,
    payment_method PaymentMethod DEFAULT NULL,
    payment_proof VARCHAR(250) DEFAULT NULL,
    status PaymentStatus NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    type OrderItemType NOT NULL,
    price DECIMAL(10,0) NOT NULL,
    discount DECIMAL(10,0) NOT NULL,
    total_price DECIMAL(10,0) NOT NULL,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS settings (
    id SERIAL PRIMARY KEY,
    setting_name VARCHAR(250) NOT NULL UNIQUE,
    setting_value TEXT NOT NULL
);
```

### Seed
```sql
-- Insert data into users table with UPSERT
INSERT INTO users (id, nama, email, username, password, role) VALUES
(1, 'Peter Jack Kambey', 'peter@example.com', 'peter', 'admin#1234', 'admin'),
(2, 'Hans Jeffrey', 'hans.jeffrey@example.com', 'hans', 'admin#1234', 'customer'),
(3, 'Zidane Sc', 'zidane.sc@example.com', 'zidane', 'admin#1234', 'customer'),
(4, 'Saddam Satria', 'saddam.satria@example.com', 'saddam', 'admin#1234', 'customer'),
(5, 'Citra Dwi', 'citra.dwi@example.com', 'citra', 'admin#1234', 'customer')
ON CONFLICT (id) DO NOTHING;

-- Insert data into user_details table with UPSERT
INSERT INTO user_details (id, address, phone, postal_code, user_id) VALUES
(1, 'Jakarta', '081234567890', '12345', 1),
(2, 'Bogor', '082345678901', '67890', 2),
(3, 'Bandung', '083456789012', '23456', 3),
(4, 'Bekasi', '084567890123', '34567', 4),
(5, 'Samarinda', '085678901234', '45678', 5)
ON CONFLICT (id) DO NOTHING;

-- Insert data into products table with UPSERT
INSERT INTO products (id, title, slug, description, price, discount) VALUES
(1, 'Bluetooth Speaker', 'bluetooth-speaker', 'Portable Bluetooth speaker with high quality sound.', 150000, 20000),
(2, 'Smartphone X', 'smartphone-x', 'Latest model smartphone with 128GB storage and 8GB RAM.', 3000000, 250000),
(3, 'Wireless Headphones', 'wireless-headphones', 'Noise-cancelling wireless headphones with up to 20 hours battery life.', 750000, 100000),
(4, 'Laptop Pro', 'laptop-pro', 'High-performance laptop with Intel i7 processor and 16GB RAM.', 12000000, 1500000),
(5, '4K Ultra HD TV', '4k-ultra-hd-tv', '50-inch 4K Ultra HD smart TV with HDR support.', 5000000, 500000)
ON CONFLICT (id) DO NOTHING;

-- Insert data into product_images table with UPSERT
INSERT INTO product_images (id, image_title, image_path, product_id) VALUES
(1, 'Bluetooth Speaker Front View', 'https://picsum.photos/200', 1),
(2, 'Smartphone X Overview', 'https://picsum.photos/200', 2),
(3, 'Wireless Headphones Side View', 'https://picsum.photos/200', 3),
(4, 'Laptop Pro Close-Up', 'https://picsum.photos/200', 4),
(5, '4K Ultra HD TV Display', 'https://picsum.photos/200', 5)
ON CONFLICT (id) DO NOTHING;

-- Insert data into orders table with UPSERT
INSERT INTO orders (id, order_date, order_expired, tracking_number, payment_method, payment_proof, status, user_id) VALUES
(1, '2024-07-01 10:00:00', '2024-07-07 10:00:00', 'TRACK123456', 'BANK', 'https://picsum.photos/200', 'PAID', 1),
(2, '2024-07-02 11:00:00', '2024-07-08 11:00:00', 'TRACK789012', 'CC', 'https://picsum.photos/200', 'SENDING', 2),
(3, '2024-07-03 12:00:00', '2024-07-09 12:00:00', NULL, 'BANK', 'https://picsum.photos/200', 'UNPAID', 3),
(4, '2024-07-04 13:00:00', '2024-07-10 13:00:00', 'TRACK345678', 'CC', 'https://picsum.photos/200', 'VERIFICATION', 4),
(5, '2024-07-05 14:00:00', '2024-07-11 14:00:00', 'TRACK901234', 'BANK', 'https://picsum.photos/200', 'SENT', 5)
ON CONFLICT (id) DO NOTHING;

-- Insert data into order_items table with UPSERT
INSERT INTO order_items (id, type, price, discount, total_price, order_id, product_id) VALUES
(1, 'PRODUCT', 150000, 20000, 130000, 1, 1),
(2, 'PRODUCT', 3000000, 250000, 2750000, 2, 2),
(3, 'PRODUCT', 750000, 100000, 650000, 3, 3),
(4, 'PRODUCT', 12000000, 1500000, 10500000, 4, 4),
(5, 'PRODUCT', 5000000, 500000, 4500000, 5, 5)
ON CONFLICT (id) DO NOTHING;

-- Insert data into settings table with UPSERT
INSERT INTO settings (id, setting_name, setting_value) VALUES
(1, 'site_name', 'My E-Commerce Site'),
(2, 'site_url', 'http://example.com'),
(3, 'contact_email', 'support@example.com'),
(4, 'currency', 'IDR'),
(5, 'timezone', 'Asia/Jakarta')
ON CONFLICT (id) DO NOTHING;

-- update sequence for all table
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('user_details_id_seq', (SELECT MAX(id) FROM user_details));
SELECT setval('products_id_seq', (SELECT MAX(id) FROM products));
SELECT setval('product_images_id_seq', (SELECT MAX(id) FROM product_images));
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM orders));
SELECT setval('order_items_id_seq', (SELECT MAX(id) FROM order_items));
SELECT setval('settings_id_seq', (SELECT MAX(id) FROM settings));
```

### DML with User Story
1. user membuat order baru dan membeli 3 produk dengan order yang sama
```sql
-- > Insert new order
WITH new_order AS (
    INSERT INTO orders (order_date, order_expired, tracking_number, payment_method, payment_proof, status, user_id)
    VALUES ('2024-07-10 10:00:00', '2024-07-15 10:00:00', 'TRACK567890', 'BANK', 'https://picsum.photos/200', 'UNPAID', (SELECT id FROM users WHERE username = 'peter'))
    RETURNING id
)
-- > Insert order items
INSERT INTO order_items (type, price, discount, total_price, order_id, product_id)
SELECT 'PRODUCT', 
       p.price, 
       p.discount, 
       p.price - p.discount, 
       no.id AS order_id, 
       p.id
FROM new_order no
JOIN products p ON p.title IN ('Bluetooth Speaker', 'Smartphone X', 'Wireless Headphones');
```
2. user dapat melihat transaksi beserta total produk yang dibeli
```sql
SELECT o.id AS order_id, o.order_date, o.order_expired, p.title, oi.price, oi.discount, oi.total_price
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.user_id = (SELECT id FROM users WHERE username = 'peter');
```
3. Sebagai pengguna, saya ingin melihat daftar produk beserta detailnya (gambar, harga, deskripsi) sehingga saya dapat memilih produk yang ingin dibeli
```sql
SELECT p.title, p.slug, p.description, p.price, p.discount, pi.image_path
FROM products p
JOIN product_images pi ON p.id = pi.product_id;
```
4. Sebagai pengguna, saya ingin mencari produk berdasarkan kata kunci atau filter kategori tertentu sehingga saya dapat dengan mudah menemukan produk yang saya butuhkan
```sql
SELECT p.title, p.slug, p.description, p.price, p.discount
FROM products p
WHERE p.title ILIKE '%Bluetooth%' OR p.description ILIKE '%Bluetooth%';
```
5. Sebagai pengguna, saya ingin melakukan checkout dan memilih metode pembayaran untuk menyelesaikan pesanan.
```sql
UPDATE orders
SET payment_method = 'CC', status = 'PAID'
WHERE id = (SELECT id FROM orders ORDER BY order_date DESC LIMIT 1);
```
6. Sebagai pengguna, saya ingin memperbarui informasi akun saya, seperti nama, email, dan alamat pengiriman.
```sql
-- > Update user information
UPDATE users
SET nama = 'Peter Jack Kambey Updated', email = 'peter.updated@example.com'
WHERE username = 'peter';

UPDATE user_details
SET address = 'New Address Jakarta', phone = '087654321098', postal_code = '54321'
WHERE user_id = (SELECT id FROM users WHERE username = 'peter');
```
7. Sebagai admin, saya ingin menambahkan produk baru ke dalam aplikasi sehingga dapat memperluas katalog produk yang ditawarkan.
```sql
INSERT INTO products (title, slug, description, price, discount)
VALUES ('Smartwatch Pro', 'smartwatch-pro', 'Advanced smartwatch with health tracking features.', 500000, 100000)
ON CONFLICT (slug) DO NOTHING;
```
8. Sebagai admin, saya ingin melihat daftar pesanan dan mengelola status pesanan (misalnya belum dibayar, sedang diproses, dikirim).
```sql
-- > View all orders
SELECT id, order_date, status, user_id
FROM orders;

-- > Update order status
UPDATE orders
SET status = 'SENDING'
WHERE id = (SELECT id FROM orders ORDER BY order_date DESC LIMIT 1);
```
9. Sebagai admin, saya ingin melihat laporan penjualan dan data pengguna untuk menganalisis kinerja aplikasi dan perilaku pengguna.
```sql
-- > View sales report
SELECT p.title, SUM(oi.total_price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.title;

-- > View user data
SELECT u.nama, u.email, COUNT(o.id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id;
```   
