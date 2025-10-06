DROP DATABASE IF EXISTS pizza_sales_db;
CREATE DATABASE pizza_sales_db;
use pizza_sales_db;

DROP table if EXISTS pizza_sales_db.pizza_sales;

CREATE TABLE pizza_sales (
    pizza_id INT PRIMARY KEY,                -- Unique ID for each pizza item
    order_id INT NOT NULL,                   -- Order identifier
    pizza_name_id VARCHAR(50) NOT NULL,      -- Pizza code/short ID
    quantity INT NOT NULL,                   -- Quantity of pizzas ordered
    order_date DATE NOT NULL,                -- Date of the order
    order_time TIME NOT NULL,                -- Time of the order
    unit_price DECIMAL(6,2) NOT NULL,        -- Price per pizza
    total_price DECIMAL(8,2) NOT NULL,       -- Total price (quantity * unit_price)
    pizza_size VARCHAR(10) NOT NULL,         -- Size (S, M, L, XL, XXL)
    pizza_category VARCHAR(50) NOT NULL,     -- Category (Classic, Supreme, Veggie, etc.)
    pizza_ingredients TEXT,                  -- Ingredients list
    pizza_name VARCHAR(100) NOT NULL         -- Full pizza name
);
