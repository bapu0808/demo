DROP DATABASE IF EXISTS billing_demo;
CREATE DATABASE billing_demo;
USE billing_demo;


CREATE TABLE products (
    product_id      INT PRIMARY KEY AUTO_INCREMENT,
    product_name    VARCHAR(60) NOT NULL,
    category        VARCHAR(30) ,
    price           DECIMAL(8, 2) NOT NULL,
    stock           INT NOT NULL DEFAULT 0
);

CREATE TABLE bills (
    bill_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(60) NOT NULL,
    phone        VARCHAR(15) NOT NULL,
    payment_mode ENUM('Cash', 'Card', 'UPI') NOT NULL,
    bill_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

CREATE TABLE bill_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    bill_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(8, 2) NOT NULL,
    line_total DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES bills(bill_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
);

ALTER TABLE bills AUTO_INCREMENT = 1001;

INSERT INTO products (product_name, category, price, stock) VALUES 
    ('Classmate Notebook 200 pg', 'Notebooks', 60.00, 120),
    ('Long Notebook 100 pg', 'Notebooks', 35.00, 150),
    ('Blue Ball Pen', 'Pens', 10.00, 300),
    ('Gel Pen (Black)', 'Pens', 20.00, 200),
    ('HB Pencil (Pack of 10)', 'Pencils', 50.00, 80),
    ('Geometry Box', 'Instruments', 180.00, 40),
    ('Scientific Calculator', 'Instruments', 650.00, 15),
    ('A4 Sheets (100)', 'Paper', 120.00, 60),
    ('Highlighter Set', 'Art', 90.00, 50),
    ('School Bag', 'Bags', 899.00, 10);

SELECT 'products' AS tableName, COUNT(*) AS row_count FROM products
UNION ALL SELECT 'bills' , COUNT(*) FROM bills
UNION ALL SELECT 'bill_items' , COUNT(*) FROM bill_items;








