-- ----------------------------------------------------------
-- 🍕 CATEGORY & SIZE PERFORMANCE
-- ----------------------------------------------------------

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
