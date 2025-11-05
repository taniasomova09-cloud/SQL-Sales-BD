--ТОП-5 товаров по выручке - доходность

SELECT prod.name, 
       pc.category,
       SUM (prod.price * p.quantity) AS total_price
FROM Product AS prod
INNER JOIN Purchase AS p ON prod.product_key = p.product_key
INNER JOIN ProductCategory AS pc ON prod.category_key = pc.category_key
GROUP BY prod.name, pc.category
ORDER BY total_price DESC 
LIMIT 5;