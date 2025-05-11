# sql-portfolio-lisakiwi
SQL simulation projects for business analytics – Sales Dashboard, Churn Analysis, and more
# 🏪 Bike Store SQL Project

This project simulates real-world business analysis using a relational database from a fictional bike store. It showcases SQL skills in querying, joining, aggregating, and generating actionable insights from multiple tables (customers, orders, staff, products, etc.).

## 📌 Dataset Overview

The dataset was sourced from Kaggle:  
[Bike Store Sample Database](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database)

It includes the following tables:
- `customers` – customer details
- `orders` – order headers
- `order_items` – detailed products per order
- `products` – product information
- `brands`, `categories` – product grouping
- `staff`, `stores` – employees and locations

---

## 📊 Key Business Questions Answered

1. **Top customers by total spend**
2. **Monthly sales trends**
3. **Best-selling products by quantity**
4. **Revenue performance by store and staff**
5. **Customer churn: inactive customers in the past 90+ days**

---

## 🛠️ Tools Used

- **SQLite** via [DB Browser for SQLite](https://sqlitebrowser.org/)
- SQL (joins, aggregations, window functions)
- GitHub for version control and project sharing

---

## 🧠 Example Query: Top Customers by Order Value

```sql
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_date,
    SUM(oi.quantity * oi.list_price) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, o.order_date
ORDER BY total_order_value DESC
LIMIT 10;
