WITH product_revenue AS(
    SELECT 
        p.id as product_id,
        p.name as product_name,
        SUM(oi.quantity * oi.unit_price) as total_revenue
    FROM products as p
    INNER JOIN order_items as oi
        ON p.id = oi.product_id
    WHERE oi.status = 'sent'
    GROUP BY p.id,p.name 
),
average_revenue AS(
    SELECT 
        product_id,
        product_name,
        total_revenue,
       ROUND( AVG(total_revenue)OVER(),2) as average_revenue
    FROM product_revenue
)
SELECT *
   FROM average_revenue
   WHERE total_revenue>average_revenue
ORDER BY total_revenue DESC;
