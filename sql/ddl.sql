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