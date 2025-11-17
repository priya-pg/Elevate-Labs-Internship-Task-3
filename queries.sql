-- 1. All Female customers above age 30 

SELECT customer_name, age, city
FROM customers
WHERE gender = 'Female'
  AND age > 30;
  
-- 2. Top 10 highest priced products 

SELECT DISTINCT p.product_name, p.price
FROM products p
ORDER BY p.price DESC
LIMIT 10;

-- 3. Total Revenue by product type 
SELECT product_type, SUM(total_price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY product_type
ORDER BY revenue DESC;

-- 4. (Inner Join) Show customer name, order date, product name and total price 
SELECT 
    c.customer_name,
    o.order_date,
    p.product_name,
    s.total_price
FROM sales s
INNER JOIN orders o ON s.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
LIMIT 20;

-- 5. (Left Join) Customers who have never placed an order 
SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 6. Products priced above average price 
SELECT DISTINCT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 7. Daily Revenue trend 
SELECT 
    o.order_date,
    SUM(s.total_price) AS daily_revenue
FROM sales s
JOIN orders o ON s.order_id = o.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 8. VIEW for total order value (per order)
CREATE VIEW order_totals AS
SELECT 
    o.order_id,
    o.customer_id,
    SUM(s.total_price) AS total_amount
FROM orders o
JOIN sales s ON o.order_id = s.order_id
GROUP BY o.order_id;
-- (using the view) 
SELECT * FROM order_totals WHERE total_amount > 500;

-- 9. Creating indexes
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_sales_order_id ON sales(order_id);
CREATE INDEX idx_sales_product_id ON sales(product_id);
CREATE INDEX idx_products_type ON products(product_type);
-- (checking to see its usability)
EXPLAIN SELECT * 
FROM sales 
WHERE product_id = 10;






