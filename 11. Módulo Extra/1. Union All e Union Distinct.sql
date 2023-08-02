-- Módulo Extra

-- UNION ALL 
SELECT id, first_name, last_name
FROM `curso-sql-dados.ecommerce.customers`
WHERE id BETWEEN 1 AND 5

UNION ALL

SELECT id, first_name, last_name
FROM `curso-sql-dados.ecommerce.customers`
WHERE id BETWEEN 4 AND 6

ORDER BY id;

-- UNION DISTINCT
SELECT id, first_name, last_name
FROM `curso-sql-dados.ecommerce.customers`
WHERE id BETWEEN 1 AND 5

UNION DISTINCT

SELECT id, first_name, last_name
FROM `curso-sql-dados.ecommerce.customers`
WHERE id BETWEEN 4 AND 6

ORDER BY id;