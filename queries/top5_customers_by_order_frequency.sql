--Топ-5 покупателей по количеству совершенных заказов 

SELECT c.name,(
     SELECT COUNT (DISTINCT p.purchase_key) 
	 FROM Purchase AS p
	 INNER JOIN Product AS prod ON p.product_key = prod.product_key
	 WHERE c.customer_key = p.customer_key 
) AS count
FROM Customer AS c 
ORDER BY count DESC
LIMIT 5;