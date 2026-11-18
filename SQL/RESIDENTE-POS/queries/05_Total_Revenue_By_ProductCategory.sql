SELECT
    c.name as Category_Product,
    SUM(oi.quantity) as total_quantity,
    SUM(oi.quantity * oi.unit_price) as total_revenue
FROM order_items as oi
INNER JOIN products as p
ON oi.product_id = p.id
INNER JOIN categories as c
ON p.category_id = c.id
WHERE oi.status = 'sent'
GROUP BY c.name
ORDER BY total_revenue DESC;
