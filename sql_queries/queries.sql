-- Total sales by region
SELECT
    region,
    ROUND(CAST(SUM(sales) AS numeric), 2) AS total_sales
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

-- Monthly sales trend
SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    ROUND(CAST(SUM(sales) AS numeric), 2) AS total_sales
FROM superstore_sales
GROUP BY order_month
ORDER BY order_month;

-- Top 10 customers by sales
SELECT
    customer_name,
    ROUND(CAST(SUM(sales) AS numeric), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Average order value by month
SELECT
    DATE_TRUNC
('month', order_date) AS order_month,ROUND
(CAST
(SUM
(sales) AS numeric) / COUNT
(DISTINCT order_id), 2) AS avg_order_value
FROM superstore_sales
GROUP BY order_month
ORDER BY order_month;