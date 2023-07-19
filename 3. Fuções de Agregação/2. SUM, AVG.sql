-- Função de agregação

-- SUM 

-- Somar receita total para status concluído
SELECT ROUND(SUM(sale_price), 2) AS receita
FROM bigquery-public-data.thelook_ecommerce.order_items
WHERE status='Complete';

-- Somar receita total para status concluído por mês
SELECT 
  ROUND(SUM(sale_price), 2) AS receita,
  EXTRACT(month FROM created_at) AS mes
FROM bigquery-public-data.thelook_ecommerce.order_items
WHERE status='Complete'
GROUP BY mes;

SELECT 
  ROUND(SUM(sale_price), 2) AS receita,
  FORMAT_DATE('%Y-%m', created_at) AS mes
FROM bigquery-public-data.thelook_ecommerce.order_items
WHERE status='Complete'
GROUP BY mes;

-- Contabilizar os usuários do Brasil
SELECT COUNT(*) as qnt_users_Brasil
FROM bigquery-public-data.thelook_ecommerce.users
WHERE country='Brasil';

SELECT 
  SUM(
    IF(country='Brasil', 1, 0)
  ) as qnt_users_Brasil,
  COUNT(
    CASE
      WHEN country='Brasil' THEN id
    END
  )as qnt_users_Brasil2
FROM bigquery-public-data.thelook_ecommerce.users;

-- AVG

-- Valor médio de cada produto por mês 
SELECT 
  ROUND(AVG(sale_price), 2) AS media_receita,
  FORMAT_DATE('%Y-%m', created_at) AS mes
FROM bigquery-public-data.thelook_ecommerce.order_items
WHERE status='Complete'
GROUP BY mes;