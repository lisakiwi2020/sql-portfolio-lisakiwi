-- 1. Total Revenue by Month
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(quantity * list_price) AS total_revenue
FROM orders
JOIN order_items USING(order_id)
GROUP BY month
ORDER BY month;

-- 2. Top 10 Customers by Total Spend
SELECT 
    customer_id,
    SUM(quantity * list_price) AS total_spent
FROM orders
JOIN order_items USING(order_id)
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- 3. Best-Selling Products by Quantity
SELECT 
    product_id,
    SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 10;

-- 4. Sales by Store and Staff
SELECT 
    s.store_name,
    st.first_name || ' ' || st.last_name AS staff_name,
    SUM(oi.quantity * oi.list_price) AS sales_total
FROM stores s
JOIN staff st ON s.store_id = st.store_id
JOIN orders o ON st.staff_id = o.staff_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_name, staff_name
ORDER BY sales_total DESC;

-- 5. Customers Inactive for Over 90 Days (Churn Simulation)
WITH last_orders AS (
  SELECT customer_id, MAX(order_date) AS last_order
  FROM orders
  GROUP BY customer_id
)
SELECT * FROM last_orders
WHERE last_order < DATE('now', '-90 day');
