/* -----------------------------------------------------------
   📊 PIZZA SALES ANALYSIS DASHBOARD QUERIES
   -----------------------------------------------------------
   Objective:
   Analyze pizza sales performance across various dimensions:
   - Sales Overview
   - Category & Size Performance
   - Top & Bottom Performers
   - Time-Based Trends
   - Customer Insights
----------------------------------------------------------- */

-- ----------------------------------------------------------
-- 🧾 SALES OVERVIEW
-- ----------------------------------------------------------

-- ✅ Total Revenue (Sum of all sales values)
SELECT SUM(total_price) AS total_revenue 
FROM pizza_sales;

-- ✅ Total Pizzas Sold (Sum of all quantities)
SELECT SUM(quantity) AS total_pizzas_sold 
FROM pizza_sales;

-- ✅ Total Orders (Count of unique order IDs)
SELECT COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales;

-- ✅ Average Order Value (AOV)
-- Formula: Total Revenue / Total Orders
SELECT AVG(order_value) AS average_order_value
FROM (
    SELECT SUM(total_price) AS order_value 
    FROM pizza_sales
    GROUP BY order_id
) p;