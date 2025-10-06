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

------------------------------------------------------------
-- 🧾 SALES OVERVIEW
------------------------------------------------------------

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

------------------------------------------------------------
-- 🍕 CATEGORY & SIZE PERFORMANCE
------------------------------------------------------------

-- ✅ Highest Revenue by Pizza Category
SELECT pizza_category, 
       SUM(total_price) AS pizza_rev
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pizza_rev DESC
LIMIT 1;

-- ✅ Most Popular Pizza Size by Revenue
SELECT pizza_size, 
       SUM(total_price) AS size_wise_rev
FROM pizza_sales
GROUP BY pizza_size
ORDER BY size_wise_rev DESC
LIMIT 1;

-- ✅ Most Popular Pizza Size by Quantity Sold
SELECT pizza_size, 
       SUM(quantity) AS size_wise_volume
FROM pizza_sales
GROUP BY pizza_size
ORDER BY size_wise_volume DESC
LIMIT 1;

------------------------------------------------------------
-- 🏆 TOP & 👎 BOTTOM PERFORMERS
------------------------------------------------------------

-- ✅ Top 5 Pizzas by Revenue
SELECT pizza_name_id, 
       SUM(total_price) AS name_wise_rev
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY name_wise_rev DESC
LIMIT 5;

-- ✅ Top 5 Pizzas by Quantity Sold
SELECT pizza_name_id, 
       SUM(quantity) AS name_wise_volume
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY name_wise_volume DESC
LIMIT 5;

-- ✅ Top 5 Pizzas by Number of Orders
SELECT pizza_name_id, 
       COUNT(order_id) AS name_wise_order_count
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY name_wise_order_count DESC
LIMIT 5;

-- 👎 Bottom 5 Pizzas by Revenue
SELECT pizza_name_id, 
       SUM(total_price) AS name_wise_rev
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY name_wise_rev
LIMIT 5;

-- 👎 Bottom 5 Pizzas by Quantity Sold
SELECT pizza_name_id, 
       SUM(quantity) AS name_wise_volume
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY name_wise_volume
LIMIT 5;

-- 👎 Bottom 5 Pizzas by Orders
SELECT pizza_name_id, 
       COUNT(order_id) AS name_wise_order_count
FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY name_wise_order_count
LIMIT 5;

------------------------------------------------------------
-- ⏰ TIME-BASED TRENDS
------------------------------------------------------------

-- ✅ Daily Sales Trend (to analyze growth or decline)
SELECT order_date,
       SUM(total_price) AS daily_sales
FROM pizza_sales
GROUP BY order_date
ORDER BY daily_sales DESC;

-- ✅ Weekly Sales Trend (busiest day of the week)
SELECT DAYNAME(order_date) AS day_name, 
       SUM(total_price) AS day_sales
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY day_sales DESC;

-- ✅ Hourly Sales Trend (peak ordering times)
SELECT HOUR(order_time) AS hour_of_day,
       SUM(quantity) AS total_quantity,
       SUM(total_price) AS total_sales,
       COUNT(order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY hour_of_day;

------------------------------------------------------------
-- 👥 CUSTOMER INSIGHTS
------------------------------------------------------------

-- ✅ Average Pizzas per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS avg_pizzas_per_order 
FROM pizza_sales;

-- ✅ Monthly Demand Trend
SELECT MONTHNAME(order_date) AS month_name,
       SUM(quantity) AS monthly_volume
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY monthly_volume DESC;

-- ✅ Quarterly Demand Trend
SELECT QUARTER(order_date) AS quarter_,
       SUM(quantity) AS quarter_volume
FROM pizza_sales
GROUP BY QUARTER(order_date)
ORDER BY quarter_;
