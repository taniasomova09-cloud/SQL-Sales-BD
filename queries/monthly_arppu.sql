--Динамика ARPPU по месяцам

SELECT EXTRACT (YEAR FROM p.date) AS year,
       EXTRACT (MONTH FROM p.date) AS month,
       COUNT (DISTINCT p.customer_key) AS paying_customers,
       SUM (prod.price * p.quantity)::numeric AS monthly_revenue,
	  (SUM (prod.price * p.quantity) / COUNT (DISTINCT p.customer_key))::numeric AS monthly_arppu
FROM Purchase AS p
INNER JOIN Product AS prod ON p.product_key = prod.product_key
GROUP BY year, month
ORDER BY year, month;