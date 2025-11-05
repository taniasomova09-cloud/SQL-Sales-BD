--ARPPU - Средний доход с платящего пользователя

SELECT COUNT (DISTINCT p.customer_key) AS paying_customers,
       SUM (prod.price * p.quantity)::numeric AS total_revenue,
	  (SUM (prod.price * p.quantity) / COUNT (DISTINCT p.customer_key))::numeric AS ARPPU
FROM Purchase AS p
INNER JOIN Product AS prod ON p.product_key = prod.product_key;
