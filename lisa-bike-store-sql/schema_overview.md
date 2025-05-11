# 🗂️ Schema Overview – Bike Store SQL Project

This document outlines the tables and relationships in the **Bike Store** sample database used for SQL reporting and analytics.

---

## 🧱 Core Tables & Relationships

### 1. `customers`
- **Primary Key:** `customer_id`
- Stores basic customer info including name, phone, email, and address

### 2. `orders`
- **Primary Key:** `order_id`
- **Foreign Keys:** `customer_id`, `staff_id`, `store_id`
- Header table for each purchase; linked to customers and staff

### 3. `order_items`
- **Primary Key:** Composite (`order_id`, `item_id`)
- **Foreign Key:** `order_id`, `product_id`
- Contains line-item details of each product sold in a transaction

### 4. `products`
- **Primary Key:** `product_id`
- **Foreign Keys:** `brand_id`, `category_id`
- Details of products available in the store

### 5. `brands`
- **Primary Key:** `brand_id`
- Lookup table for product brands

### 6. `categories`
- **Primary Key:** `category_id`
- Lookup table for product categories (e.g., bikes, clothing, accessories)

### 7. `stores`
- **Primary Key:** `store_id`
- Represents physical store locations

### 8. `staff`
- **Primary Key:** `staff_id`
- **Foreign Key:** `store_id`
- Salespeople who handle orders; linked to store

---

## 🔗 Key Relationships (ER Overview)

- A **customer** can have many **orders**
- An **order** has multiple **order_items**
- Each **order_item** references a **product**
- A **product** belongs to one **brand** and one **category**
- A **staff member** handles multiple **orders**
- A **staff member** works in one **store**

---

## 🛠️ Used For

- Sales trend analysis
- Top customers and products
- Store and staff performance
- Churn analysis (inactive customers)

---

📂 _This schema supports all queries found in `queries.sql` and provides a strong foundation for demonstrating SQL analytics skills in a realistic business context._
