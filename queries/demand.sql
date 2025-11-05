--ТОП-5 товаров по количеству продаж - спрос

SELECT prod.name, 
       pc.category,
       COUNT (DISTINCT p.purchase_key) AS count
FROM Product AS prod
INNER JOIN Purchase AS p ON prod.product_key = p.product_key
INNER JOIN ProductCategory AS pc ON prod.category_key = pc.category_key
GROUP BY prod.name, pc.category
ORDER BY count DESC 
LIMIT 5;