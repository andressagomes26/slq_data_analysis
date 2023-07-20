-- Funções de Texto

-- CONCAT
SELECT id, 
  first_name, 
  last_name, 
  CONCAT(first_name, ' ', last_name) AS nome_completo
FROM bigquery-public-data.thelook_ecommerce.users;

SELECT 
  orders.order_id,
  CONCAT('Quantidade total de itens no pedid: ',
    AVG(orders.num_of_item), ' - ',
    'Receita total do pedido: ',
    ROUND(SUM(sale_price), 2)
  ) AS detalhe
FROM bigquery-public-data.thelook_ecommerce.orders AS orders
  JOIN bigquery-public-data.thelook_ecommerce.order_items AS items
  ON orders.order_id = items.order_id 
GROUP BY 1
ORDER BY 1;

-- STARTS_WITH
SELECT 
  STARTS_WITH('Ciência de Dados', 'C') as t1,
  STARTS_WITH('Ciência de Dados', 'c') as t2,
  STARTS_WITH('Ciência de Dados', 'Ciê') as t3;

SELECT id, first_name
FROM bigquery-public-data.thelook_ecommerce.users
WHERE STARTS_WITH(first_name, 'An') is TRUE;

-- LOWER e UPPER
SELECT repo_name
FROM bigquery-public-data.github_repos.sample_repos
WHERE LOWER(repo_name) LIKE '%python%' OR UPPER(repo_name) LIKE '%PYTHON%';

-- INITCAP
SELECT id, 
  first_name, 
  last_name, 
  INITCAP(CONCAT('clienTE', ' ', first_name, ' ', last_name)) AS nome_completo
FROM bigquery-public-data.thelook_ecommerce.users;

-- SPLIT
SELECT 
  SPLIT('Frase de exemplo!', ' ') AS splitt,
  SPLIT('Frase de exemplo!', ' ')[ordinal(1)] AS prim_posic,
  SPLIT('Frase de exemplo!', ' ')[ordinal(2)] AS seg_posic

SELECT DISTINCT SPLIT(email, '@')[ordinal(2)] AS dominio
FROM bigquery-public-data.thelook_ecommerce.users;

--TRIM
SELECT 
  TRIM('CPF: 123.456.789-00', 'CPF: '),
  LTRIM(' 123.456.789-00', ' '),
  RTRIM('123.456.789-00 ', ' ');

-- REPLACE
SELECT *,
  REPLACE(name, '/New Jersey NY/NJ', ' NY'),
  REPLACE(REPLACE(name, '/New Jersey NY/NJ', 'NY'), 'Authority', '')
FROM bigquery-public-data.thelook_ecommerce.distribution_centers;