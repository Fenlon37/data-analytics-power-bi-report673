CREATE OR REPLACE VIEW store_type_summary AS
SELECT 
    store_type,
    SUM(total_sales) AS total_sales,
    SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER () AS percentage_of_total_sales,
    SUM(count_of_orders) AS order_count
FROM salessummary
GROUP BY store_type;
