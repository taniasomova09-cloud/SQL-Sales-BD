--Выручка, ср.чек, наполненность по категориям

SELECT pc.category,
       COUNT (DISTINCT p.purchase_key) AS purchases_count,
	   SUM (prod.price*p.quantity) AS total,
       SUM (prod.price*p.quantity)/COUNT (DISTINCT p.purchase_key) AS avg_check,
	   ROUND (SUM (p.quantity)::numeric/COUNT (DISTINCT p.purchase_key),2) AS fullness
FROM Purchase AS p 
INNER JOIN Product AS prod ON p.product_key = prod.product_key
INNER JOIN ProductCategory AS pc ON prod.category_key = pc.category_key
GROUP BY pc.category
ORDER BY fullness DESC;