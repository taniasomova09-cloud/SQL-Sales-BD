SELECT 
    CASE 
	  WHEN age < 20 THEN 'Меньше 20'
	  WHEN age BETWEEN 20 AND 29 THEN '20-29'
	  WHEN age BETWEEN 30 AND 39 THEN '30-39'
	  WHEN age BETWEEN 40 AND 49 THEN '40-49'
	  ELSE 'Старше 50'
    END AS age_group,
	COUNT (*) AS customer_count
FROM Customer 
GROUP BY age_group
ORDER BY age_group ASC;
