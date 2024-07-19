-- user membuat order baru dan membeli 3 produk dengan order yang sama
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

-- user 1 dapat melihat transaksi beserta total produk yang dibeli
SELECT o.id AS order_id, o.order_date, o.order_expired, p.title, oi.price, oi.discount, oi.total_price
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.user_id = (SELECT id FROM users WHERE username = 'peter');

-- Sebagai pengguna, saya ingin melihat daftar produk beserta detailnya (gambar, harga, deskripsi) sehingga saya dapat memilih produk yang ingin dibeli
SELECT p.title, p.slug, p.description, p.price, p.discount, pi.image_path
FROM products p
JOIN product_images pi ON p.id = pi.product_id;

-- Sebagai pengguna, saya ingin mencari produk berdasarkan kata kunci atau filter kategori tertentu sehingga saya dapat dengan mudah menemukan produk yang saya butuhkan
SELECT p.title, p.slug, p.description, p.price, p.discount
FROM products p
WHERE p.title ILIKE '%Bluetooth%' OR p.description ILIKE '%Bluetooth%';

-- Sebagai pengguna, saya ingin melakukan checkout dan memilih metode pembayaran untuk menyelesaikan pesanan.
UPDATE orders
SET payment_method = 'CC', status = 'PAID'
WHERE id = (SELECT id FROM orders ORDER BY order_date DESC LIMIT 1);

-- Sebagai pengguna, saya ingin memperbarui informasi akun saya, seperti nama, email, dan alamat pengiriman.
-- > Update user information
UPDATE users
SET nama = 'Peter Jack Kambey Updated', email = 'peter.updated@example.com'
WHERE username = 'peter';

-- > Update user details
UPDATE user_details
SET address = 'New Address Jakarta', phone = '087654321098', postal_code = '54321'
WHERE user_id = (SELECT id FROM users WHERE username = 'peter');

-- Sebagai admin, saya ingin menambahkan produk baru ke dalam aplikasi sehingga dapat memperluas katalog produk yang ditawarkan.
INSERT INTO products (title, slug, description, price, discount)
VALUES ('Smartwatch Pro', 'smartwatch-pro', 'Advanced smartwatch with health tracking features.', 500000, 100000)
ON CONFLICT (slug) DO NOTHING;

-- Sebagai admin, saya ingin melihat daftar pesanan dan mengelola status pesanan (misalnya belum dibayar, sedang diproses, dikirim).
-- > View all orders
SELECT id, order_date, status, user_id
FROM orders;

-- > Update order status
UPDATE orders
SET status = 'SENDING'
WHERE id = (SELECT id FROM orders ORDER BY order_date DESC LIMIT 1);

-- Sebagai admin, saya ingin melihat laporan penjualan dan data pengguna untuk menganalisis kinerja aplikasi dan perilaku pengguna.
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
