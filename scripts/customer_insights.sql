-- ----------------------------------------------------------
-- 👥 CUSTOMER INSIGHTS
-- ----------------------------------------------------------

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
