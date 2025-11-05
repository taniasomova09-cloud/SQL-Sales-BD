--Топ-5 покупателей по выручке

SELECT c.name,(
     SELECT SUM (prod.price*p.quantity)
	 FROM Purchase AS p
	 INNER JOIN Product AS prod ON p.product_key = prod.product_key
	 WHERE c.customer_key = p.customer_key 
) AS total_spent 
FROM Customer AS c 
ORDER BY total_spent DESC
LIMIT 5;