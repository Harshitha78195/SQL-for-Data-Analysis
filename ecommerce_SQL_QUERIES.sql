CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 899.99, 20),
('Smartphone', 'Electronics', 699.99, 50),
('Headphones', 'Electronics', 199.99, 30),
('Keyboard', 'Electronics', 49.99, 100),
('Mouse', 'Electronics', 29.99, 120),
('Monitor', 'Electronics', 249.99, 15),
('TV', 'Electronics', 499.99, 10),
('Refrigerator', 'Appliances', 999.99, 5),
('Microwave', 'Appliances', 199.99, 25),
('Toaster', 'Appliances', 29.99, 60),
('Blender', 'Appliances', 89.99, 40),
('Dishwasher', 'Appliances', 349.99, 12),
('Washing Machine', 'Appliances', 499.99, 8),
('Sofa', 'Furniture', 799.99, 4),
('Dining Table', 'Furniture', 499.99, 7),
('Chair', 'Furniture', 99.99, 60),
('Bed', 'Furniture', 599.99, 3),
('Lamp', 'Furniture', 49.99, 80),
('Coffee Table', 'Furniture', 129.99, 20);

SELECT product_name, price
FROM products
WHERE price > 100
ORDER BY price DESC;

SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO sales (product_id, quantity, sale_date) VALUES
(1, 5, '2025-04-10'),
(2, 3, '2025-04-10'),
(3, 10, '2025-04-09'),
(4, 2, '2025-04-08'),
(5, 6, '2025-04-07');

SELECT p.product_name, s.quantity
FROM products p
INNER JOIN sales s ON p.product_id = s.product_id;


SELECT p.product_name, s.quantity
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id;

SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT SUM(p.price * s.quantity) AS total_revenue
FROM products p
INNER JOIN sales s ON p.product_id = s.product_id;

SELECT AVG(price) AS average_price
FROM products;

CREATE VIEW product_sales AS
SELECT p.product_name, p.price, SUM(s.quantity) AS total_sales
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_name, p.price;

CREATE INDEX idx_category ON products(category);







