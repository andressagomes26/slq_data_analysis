-- Agrupamento GROUP BY
-- GROUP BY Pode ser usado também com função similar ao DISTINCT

-- DISTINCT
SELECT DISTINCT status
FROM bigquery-public-data.thelook_ecommerce.orders;

-- GROUP BY
SELECT status
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY status;

-- GROUP BY pela posição no SELECT
SELECT status
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY 1;

-- Contar a quantidade de pedidos por dia
SELECT 
  COUNT(DISTINCT order_id) AS numero_pedidos,
  DATE(created_at) AS dia
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY 2
ORDER BY dia DESC;
