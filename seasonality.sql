--Сезонность 

SELECT EXTRACT (YEAR FROM p.date) AS year,
       EXTRACT (MONTH FROM p.date) AS month,
	   SUM (prod.price*p.quantity) AS monthly_revenue 
FROM Purchase AS  p
INNER JOIN Product AS prod ON p.product_key = prod.product_key
GROUP BY year, month
ORDER BY year, month;