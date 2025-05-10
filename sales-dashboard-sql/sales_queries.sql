-- Total Sales by Month
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(quantity * unit_price) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;
