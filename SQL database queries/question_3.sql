SELECT
    ds.store_type
    SUM(dp.sale_price * o.product_quantity) AS total_revenue
FROM 
    orders o
JOIN 
    dim_products dp ON o.product_code = dp.product_code
JOIN 
    dim_stores ds ON o.store_code = ds.store_code
JOIN 
    dim_date dd ON o.order_date = dd.date
WHERE 
    ds.country = 'Germany' AND dd.year = 2022
GROUP BY 
    ds.store_type
ORDER BY 
    total_revenue DESC
LIMIT 1;
