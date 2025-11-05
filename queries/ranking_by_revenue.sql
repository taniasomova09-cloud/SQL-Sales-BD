--Ранжирование товаров по выручке внутри катрегорий

WITH ranked_products AS (
  SELECT prod.name,
         pc.category,
		 SUM(prod.price * p.quantity) AS revenue,
		 RANK () OVER (PARTITION BY pc.category ORDER BY SUM(prod.price * p.quantity) DESC) AS rank_in_category
  FROM Product prod
  INNER JOIN Purchase p ON prod.product_key = p.product_key
  INNER JOIN ProductCategory pc ON prod.category_key = pc.category_key
  GROUP BY prod.name, pc.category
)
SELECT name, category, revenue, rank_in_category
FROM ranked_products
ORDER BY category,rank_in_category;
