--Процент выручки топ-5 покупателей от общей выручки 
--(анализ зависимости продаж от ключевых клиентов)

WITH total_revenue AS (
  SELECT SUM (prod.price*p.quantity) AS total
  FROM Purchase AS p
  INNER JOIN Product AS prod ON  p.product_key = prod.product_key
),

customers_top AS (
  SELECT c.customer_key,
         SUM (prod.price*p.quantity) AS customer_revenue
  FROM Customer AS c
  INNER JOIN Purchase AS p ON c.customer_key = p.customer_key 
  INNER JOIN Product AS prod ON p.product_key = prod.product_key
  GROUP BY c.customer_key
  ORDER BY customer_revenue DESC
  LIMIT 5
),

revenue_top5 AS (
  SELECT SUM (prod.price*p.quantity) AS total_top5
  FROM Purchase AS p 
  INNER JOIN Product AS prod ON p.product_key = prod.product_key
  WHERE p.customer_key IN (
     SELECT customer_key FROM customers_top)
)
SELECT total_top5,
       total,
       ROUND ((total_top5 * 100.0 / total)::numeric,2) AS percentage_of_revenue
FROM revenue_top5,total_revenue;
