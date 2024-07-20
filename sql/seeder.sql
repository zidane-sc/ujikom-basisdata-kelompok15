-- Insert data into users table with UPSERT
INSERT INTO users (id, name, email, username, password, role) VALUES
(1, 'Peter Jack Kambey', 'peter@example.com', 'peter', 'admin#1234', 'ADMIN'),
(2, 'Hans Jeffrey', 'hans.jeffrey@example.com', 'hans', 'admin#1234', 'CUSTOMER'),
(3, 'Zidane Sc', 'zidane.sc@example.com', 'zidane', 'admin#1234', 'CUSTOMER'),
(4, 'Saddam Satria', 'saddam.satria@example.com', 'saddam', 'admin#1234', 'CUSTOMER'),
(5, 'Citra Dwi', 'citra.dwi@example.com', 'citra', 'admin#1234', 'CUSTOMER')
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
INSERT INTO orders (id, order_date, order_expired, tracking_number, payment_method, payment_proof, status, order_status, user_id) VALUES
(1, '2024-07-01 10:00:00', '2024-07-07 10:00:00', 'TRACK123456', 'BANK', 'https://picsum.photos/200', 'PAID', 'VERIFICATION', 2),
(2, '2024-07-02 11:00:00', '2024-07-08 11:00:00', 'TRACK789012', 'CC', 'https://picsum.photos/200', 'PAID', 'SENDING', 2),
(3, '2024-07-03 12:00:00', '2024-07-09 12:00:00', NULL, 'BANK', 'https://picsum.photos/200', 'UNPAID', 'VERIFICATION', 3),
(4, '2024-07-04 13:00:00', '2024-07-10 13:00:00', 'TRACK345678', 'CC', 'https://picsum.photos/200', 'PAID', 'SENDING', 4),
(5, '2024-07-05 14:00:00', '2024-07-11 14:00:00', 'TRACK901234', 'BANK', 'https://picsum.photos/200', 'PAID', 'SENT', 5)
ON CONFLICT (id) DO NOTHING;

-- Insert data into order_items table with UPSERT
INSERT INTO order_items (id, type, price, discount, total_price, quantity, order_id, product_id) VALUES
(1, 'PRODUCT', 150000, 20000, 130000, 1, 1, 1),
(2, 'PRODUCT', 3000000, 250000, 2750000, 1, 2, 2),
(3, 'PRODUCT', 750000, 100000, 650000, 1, 3, 3),
(4, 'PRODUCT', 12000000, 1500000, 10500000, 1, 4, 4),
(5, 'PRODUCT', 5000000, 500000, 4500000, 1, 5, 5)
ON CONFLICT (id) DO NOTHING;

-- Update sequence for all tables
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('user_details_id_seq', (SELECT MAX(id) FROM user_details));
SELECT setval('products_id_seq', (SELECT MAX(id) FROM products));
SELECT setval('product_images_id_seq', (SELECT MAX(id) FROM product_images));
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM orders));
SELECT setval('order_items_id_seq', (SELECT MAX(id) FROM order_items));
