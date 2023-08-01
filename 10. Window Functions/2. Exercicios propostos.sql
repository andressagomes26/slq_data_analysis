-- Exercícios Propostos – Módulo 13

-- 1) Ache o dataset “thelook_ecommerce” nos dados públicos do BigQuery. Para cada pedido do usuário, calcule a diferença,
-- em dias, entre a data da compra atual e a data da primeira compra do usuário.
SELECT 
  user_id, order_id, created_at,
  FIRST_VALUE(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS primeira_compra1,
  MIN(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS primeira_compra,
  TIMESTAMP_DIFF(created_at, MIN(created_at) OVER(PARTITION BY user_id ORDER BY created_at), day) AS diferenca_atual_prim_compra
FROM bigquery-public-data.thelook_ecommerce.orders
ORDER BY 1, 2;

-- 2) Calcule também a receita acumulada dos usuários, a cada pedido
SELECT 
  user_id, order_id, sale_price,
  SUM(sale_price) OVER(PARTITION BY user_id ORDER BY user_id) AS soma_receita
FROM bigquery-public-data.thelook_ecommerce.order_items;

--
SELECT 
  o.user_id, o.order_id, oi.id, o.created_at,
  SUM(sale_price) OVER(
    PARTITION BY o.user_id ORDER BY o.created_at, oi.id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS receita_acumulada,
  SUM(sale_price) OVER(PARTITION BY o.user_id ORDER BY o.user_id) AS soma_receita
FROM bigquery-public-data.thelook_ecommerce.orders AS o
JOIN bigquery-public-data.thelook_ecommerce.order_items AS oi
  ON oi.order_id = o.order_id
ORDER BY 1, 4, 3;

-- 3) Retorne o tempo em dias entre uma compra e outra para cada usuário. Traga, depois, o usuário com maior tempo.
SELECT 
  user_id, order_id, created_at,
  TIMESTAMP_DIFF(
    created_at, 
    LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at), day
  ) AS dias_entre_compras,
FROM bigquery-public-data.thelook_ecommerce.orders
ORDER BY 1, 3;

-- 
SELECT *
FROM (
  SELECT 
    user_id, order_id, created_at,
    TIMESTAMP_DIFF(
      created_at, 
      LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at), day
    ) AS dias_entre_compras,
  FROM bigquery-public-data.thelook_ecommerce.orders
  ORDER BY 1, 3
) AS T1
JOIN (
  SELECT MAX(dias_entre_compras) AS max_dif_dias
  FROM(
    SELECT
      user_id, order_id, created_at,
      TIMESTAMP_DIFF(
        created_at, 
        LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at), day
      ) AS dias_entre_compras,
    FROM bigquery-public-data.thelook_ecommerce.orders
    ORDER BY 1, 3
  ) AS T2
) AS T3 ON T3.max_dif_dias = T1.dias_entre_compras

-- 4) Descubra uma forma de retornar os usuários com compras recorrentes (mais de 1 compra) com window functions
SELECT DISTINCT user_id
FROM(
  SELECT 
    user_id, order_id, created_at,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at) AS num_compra 
  FROM bigquery-public-data.thelook_ecommerce.orders
  ORDER BY 1,3
) AS T
WHERE num_compra > 1;
