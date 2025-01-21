SELECT 
    dd.month_name, 
    dd.month_number,
    SUM(dp.sale_price * o.product_quantity) AS total_revenue
FROM 
    orders o
JOIN 
    dim_date dd ON dd.date = o.order_date
JOIN 
    dim_products dp ON dp.product_code = o.product_code
WHERE 
    dd.year = 2022  
GROUP BY 
    dd.month_name, 
    dd.month_number
ORDER BY 
    total_revenue DESC
LIMIT 1;
