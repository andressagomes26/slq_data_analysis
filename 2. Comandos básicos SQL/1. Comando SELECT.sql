SELECT 
  4 AS new_coluna,
  'andressa' AS nome,
	4/2 AS divisao;

SELECT name
FROM ecommerce.categories;

SELECT name
FROM curso-sql-dados.ecommerce.categories;

SELECT name, price
FROM ecommerce.products
LIMIT 5;

SELECT DISTINCT category_id
FROM ecommerce.products;

SELECT DISTINCT first_name
FROM `ecommerce.customers`
LIMIT 20;

SELECT count(distinct first_name) as nomes_distintos
FROM ecommerce.customers;