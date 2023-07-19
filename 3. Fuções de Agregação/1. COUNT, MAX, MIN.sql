-- Função de agregação

-- COUNT: Contabiliza a quantidade de registros (usuários, linhas) em uma tabela
SELECT COUNT(*) AS qnt_users
FROM bigquery-public-data.thelook_ecommerce.users;

SELECT COUNT(*) AS qnt_users, COUNT(id) AS qnt_uses_id
FROM bigquery-public-data.thelook_ecommerce.users;

SELECT COUNT(DISTINCT id) AS qnt_uses_id
FROM bigquery-public-data.thelook_ecommerce.users;

-- Quantidade de estados distintos
SELECT DISTINCT status
FROM bigquery-public-data.thelook_ecommerce.orders;

SELECT COUNT(DISTINCT status) as qnt_status
FROM bigquery-public-data.thelook_ecommerce.orders;


SELECT COUNT(status) AS qnt_status, status
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY status;

-- Quantidade de pedidos por dia
SELECT 
  COUNT(DISTINCT order_id) AS qnt_pedidos, 
  DATE(created_at) AS dia
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY dia
ORDER BY dia DESC;

-- Quantidade de pedidos por ano
SELECT 
  COUNT(DISTINCT order_id) AS qnt_pedidos, 
  EXTRACT(year FROM created_at) AS ano
FROM bigquery-public-data.thelook_ecommerce.orders;
GROUP BY ano
ORDER BY ano DESC;

-- MAX / MIN
SELECT 
  MAX(retail_price) AS preco_max_prod,
  MIN(retail_price) AS preco_min_prod,
FROM bigquery-public-data.thelook_ecommerce.products;

-- Preço máximo e mínimo por centro de distribuição
SELECT 
  MAX(p.retail_price) AS preco_max_prod,
  ROUND(MIN(retail_price), 2) AS preco_min_prod,
  dc.name
FROM bigquery-public-data.thelook_ecommerce.products as p
JOIN bigquery-public-data.thelook_ecommerce.distribution_centers as dc
  ON p.distribution_center_id = dc.id
GROUP BY dc.name;

-- Usuário mais recente e usuário mais antigo
SELECT 
  MAX(created_at) AS user_recente,
  MIN(created_at) AS user_antigo,
FROM bigquery-public-data.thelook_ecommerce.users;