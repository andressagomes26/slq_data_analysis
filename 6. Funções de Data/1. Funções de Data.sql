-- Funções de Data

--CURRENT_DATE, CURRENT_DATETIME,  CURRENT_TIMESTAMP
SELECT 
  CURRENT_DATE() AS h1,
  CURRENT_TIMESTAMP() AS h2,
  CURRENT_DATETIME() AS h3,
  CURRENT_DATETIME('America/Sao_Paulo') AS h4,
  CURRENT_DATE('Asia/Tokyo') AS h5,
  CURRENT_TIMESTAMP AS h6;

-- Pedidos de 5 dias atràs
SELECT *
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE DATE(created_at) = CURRENT_DATE() - INTERVAL 5 day;

SELECT *
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE DATE(created_at) = DATE_SUB(CURRENT_DATE(), INTERVAL 5 day);

-- Pedidos desde 5 dias atràs
SELECT *
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE DATE(created_at) >= CURRENT_DATE() - INTERVAL 5 day;

-- DATE, DATETIME, TIMESTAMP
SELECT
  DATE '1998-10-26' AS ex1,
  DATE(1998, 10, 26) AS ex2,
  DATETIME '1998-10-26 12:20:00' AS ex3,
  DATETIME(1998, 10, 26, 12, 20, 59) AS ex4,
  DATETIME '1998-10-26T12:20:00' AS ex5,
  DATETIME(CURRENT_TIMESTAMP()) AS ex6,
  DATETIME(CURRENT_TIMESTAMP, 'America/Sao_Paulo') AS ex7,
  DATETIME(CURRENT_DATE()) AS ex8;

SELECT
  TIMESTAMP '1998-10-26 12:20:00' AS ex1,
  TIMESTAMP '1998-10-26 12:20:00 America/Sao_Paulo' AS ex2,
  TIMESTAMP(CURRENT_DATETIME()) AS ex3,
  TIMESTAMP(CURRENT_DATE()) AS ex4;

-- EXTRACT
SELECT 
  CURRENT_DATE() AS ex1,
  EXTRACT(month FROM CURRENT_DATE) AS mes,
  EXTRACT(dayofyear FROM CURRENT_DATE) AS dayofyear, 
  CURRENT_TIMESTAMP() AS ex2,
  EXTRACT(hour FROM CURRENT_TIMESTAMP) AS hour;

SELECT
  COUNT(order_id) as pedido,
  EXTRACT(quarter FROM created_at) as trimestre
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE DATE(created_at) BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY 2
ORDER BY 2;

-- DATE_ADD, DATETIME_ADD, TIMESTAMP_ADD
SELECT 
  CURRENT_DATE() AS t1,
  DATE_ADD(CURRENT_DATE, INTERVAL 10 day) AS t2,
  DATE_ADD(CURRENT_DATE, INTERVAL 1 month) AS t3,
  CURRENT_TIMESTAMP() AS t4,
  TIMESTAMP_ADD(CURRENT_TIMESTAMP, INTERVAL 2 hour) AS t5

-- DATE_SUB, DATETIME_SUB, TIMESTAMP_SUB
SELECT 
  CURRENT_DATE() AS t1,
  DATE_SUB(CURRENT_DATE, INTERVAL 10 day) AS t2,
  DATE_SUB(CURRENT_DATE, INTERVAL 1 month) AS t3,
  CURRENT_TIMESTAMP() AS t4,
  TIMESTAMP_SUB(CURRENT_TIMESTAMP, INTERVAL 2 hour) AS t5

-- Número de itens nos últimos 5 dias
SELECT SUM(num_of_item) as qnt_itens
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE DATE(created_at) >= DATE_SUB(CURRENT_DATE, INTERVAL 5 DAY)

SELECT SUM(num_of_item) as qnt_itens
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE DATE(created_at) BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 5 DAY) AND CURRENT_DATE;

-- DATE_DIFF, DATETIME_DIFF, TIMESTAMP_DIFF
SELECT 
  DATE_DIFF('2022-10-05', '2022-10-01', day) AS day,
  DATETIME_DIFF('2022-10-05T21:00:00', '2022-10-05T14:00:00', hour) AS hour,
  TIMESTAMP_DIFF('2022-10-05 21:30:00', '2022-10-05 21:00:00', minute) AS minute

-- Quantos dias o usuário leva para fazer a primeria compra
SELECT 
  u.id,
  MIN(TIMESTAMP_DIFF(o.created_at, u.created_at, day)) AS qnt_dias
FROM bigquery-public-data.thelook_ecommerce.orders AS o
JOIN bigquery-public-data.thelook_ecommerce.users AS u
  ON u.id = o.user_id
GROUP BY 1
ORDER BY 2;

WITH dias as(
  SELECT 
    u.id,
    MIN(TIMESTAMP_DIFF(o.created_at, u.created_at, day)) AS qnt_dias
  FROM bigquery-public-data.thelook_ecommerce.orders AS o
  JOIN bigquery-public-data.thelook_ecommerce.users AS u
    ON u.id = o.user_id
  GROUP BY 1
  ORDER BY 2
)
SELECT AVG(qnt_dias) as media_dias
FROM dias;

-- FORMAT_DATE, FORMAT_DATETIME,  FORMAT_TIMESTAMP
SELECT
  FORMAT_DATE('%Y-%m', current_date()) AS moth,
  FORMAT_TIMESTAMP('%R', current_timestamp()) AS horario

-- Contagem de usuário por mês de cadastro
SELECT
  COUNT(id) usuarios,
  FORMAT_TIMESTAMP('%Y-%m', created_at) AS mes_cadastro
FROM bigquery-public-data.thelook_ecommerce.users
GROUP BY 2
ORDER BY 2 DESC;
