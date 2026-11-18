SELECT 
  DATE(p.created_at) AS fecha,
  SUM(p.total_amount) AS total_revenue 
FROM payments AS p 
WHERE p.status='completed' 
GROUP BY DATE(p.created_at) 
ORDER BY fecha DESC;
