
-- ----------------------------------------------------------
-- 🏆 TOP & 👎 BOTTOM PERFORMERS
-- ----------------------------------------------------------

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