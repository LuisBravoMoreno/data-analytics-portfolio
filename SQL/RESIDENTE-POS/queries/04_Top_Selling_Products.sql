SELECT 
  p.id AS product_id, 
  p.name AS product_name,
  SUM(oi.quantity) AS total_quantity, 
  SUM(oi.quantity * oi.unit_price) AS total_revenue 
  FROM products as p 
  INNER JOIN order_items as oi 
  ON p. id=oi.product_id 
  WHERE oi.status='sent' 
  GROUP BY p.id,p.name 
  ORDER BY total_quantity 
  DESC LIMIT 5;
