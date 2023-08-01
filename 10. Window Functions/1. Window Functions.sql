-- Window Functions

-- First Value
SELECT
  o.user_id,
  order_id,
  o.created_at,
  FIRST_VALUE(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS data_primeiro_pedido
FROM bigquery-public-data.thelook_ecommerce.orders AS o
ORDER BY user_id, created_at;

-- Last Value
SELECT
  o.user_id,
  order_id,
  o.created_at,
  LAST_VALUE(created_at) 
    OVER(PARTITION BY user_id 
      ORDER BY created_at ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS data_ultimo_pedido
FROM bigquery-public-data.thelook_ecommerce.orders AS o
ORDER BY user_id, created_at;

-- LAG

-- Retorna a data do pedido anterior

SELECT
  o.user_id,
  order_id,
  o.created_at,
  LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS data_pedido_anterior
FROM bigquery-public-data.thelook_ecommerce.orders AS o
ORDER BY user_id, created_at;


-- Retorna a diferença de dias entre a data do pedido atual e do pedido anterior
SELECT
  o.user_id,
  order_id,
  o.created_at,
  LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS data_pedido_anterior,
  TIMESTAMP_DIFF(
    created_at,
    LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at),
    day
  ) AS diff_dias
FROM bigquery-public-data.thelook_ecommerce.orders AS o
ORDER BY user_id, created_at;

-- LEAD

-- Retorna a data do próximo pedido
SELECT
  o.user_id,
  order_id,
  o.created_at,
  LEAD(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS data_prox_pedido
FROM bigquery-public-data.thelook_ecommerce.orders AS o
ORDER BY user_id, created_at;

-- RANK E ROW_NUMBER
SELECT
  distribution_center_id,
  RANK() OVER(ORDER BY distribution_center_id) AS rank_prod,
  ROW_NUMBER() OVER(ORDER BY distribution_center_id) AS num_linha
FROM bigquery-public-data.thelook_ecommerce.products
ORDER BY 1, 3;

-- Funções de agregação
SELECT
  o.user_id,
  order_id,
  o.created_at,
  MIN(created_at) OVER(PARTITION BY user_id) AS data_primeiro_compra,
  MAX(created_at) OVER(PARTITION BY user_id) AS data_ultima_compra,
  COUNT(order_id) OVER(PARTITION BY user_id) AS numeros_compra,
FROM bigquery-public-data.thelook_ecommerce.orders AS o
ORDER BY user_id, created_at;
