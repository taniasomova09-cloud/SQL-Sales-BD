--Выручка по категориям: сравнение год к году 

WITH revenue_2023 AS ( 
    SELECT pc.category,
	       SUM (prod.price*p.quantity)::numeric AS revenue_2023
	FROM Purchase AS p
	INNER JOIN Product AS prod ON p.product_key = prod.product_key
	INNER JOIN ProductCategory AS pc ON prod.category_key = pc.category_key
	WHERE EXTRACT (YEAR FROM p.date) = '2023'
	GROUP BY pc.category
),
     revenue_2024 AS (
    SELECT pc.category,
	       SUM (prod.price*p.quantity)::numeric AS revenue_2024
	FROM Purchase AS p
	INNER JOIN Product AS prod ON p.product_key = prod.product_key
	INNER JOIN ProductCategory AS pc ON prod.category_key = pc.category_key
	WHERE EXTRACT (YEAR FROM p.date) = '2024'
	GROUP BY pc.category
	 )
SELECT COALESCE (r23.category, r24.category) AS category,
       r23.revenue_2023,
	   r24.revenue_2024,
	   ROUND (((r24.revenue_2024 - r23.revenue_2023)/r23.revenue_2023*100)::numeric,2) AS percent_YoY
FROM revenue_2023 AS r23
FULL OUTER JOIN revenue_2024 AS r24 ON r23.category = r24.category
ORDER BY percent_YoY DESC NULLS
LAST;
