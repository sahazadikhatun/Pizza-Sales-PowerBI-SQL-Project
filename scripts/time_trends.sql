-- ----------------------------------------------------------
-- ⏰ TIME-BASED TRENDS
-- ----------------------------------------------------------

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