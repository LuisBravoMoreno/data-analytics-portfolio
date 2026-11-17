SELECT 
o.id as order_id,
o.order_type as order_type,
og.guest_number as guest_number,
p.name as product_name,
oi.quantity as quantity,
oi.unit_price as unit_price,
(oi.quantity*oi.unit_price) as total
FROM orders as o
INNER JOIN order_guests as og
ON o.id=og.order_id
INNER JOIN order_items as oi
ON og.id=oi.guest_id
INNER JOIN products as p
ON oi.product_id=p.id
WHERE o.status='closed' AND oi.status = 'sent'
ORDER BY order_id DESC, guest_number ASC;
