SELECT
    DATE(p.created_at) as Payment_Date,
    o.id as order_id,
    o.order_type as order_type,
    SUM(p.total_amount) as Total_Revenue
FROM orders as o
INNER JOIN payments as p
ON o.id = p.order_id
WHERE p.status = 'completed'
GROUP BY
    DATE (p.created_at),
    o.id,
    o.order_type
ORDER BY o.id DESC;
