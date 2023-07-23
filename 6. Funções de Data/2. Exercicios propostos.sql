-- Exercícios Propostos – Módulo 9

-- 1) Procure o dataset “thelook_ecommerce”. Calcule o tempo em dias da data de cadastro até a última compra de cada usuário.
SELECT 
  users.first_name, 
  MAX(TIMESTAMP_DIFF(orders.created_at, users.created_at, day)) AS num_dias_cadastro_ultima_compra
FROM bigquery-public-data.thelook_ecommerce.users AS users
  JOIN bigquery-public-data.thelook_ecommerce.orders AS orders
  ON users.id = orders.user_id
GROUP BY users.first_name
ORDER BY 2;

-- 2) Na mesma tabela, calcule o tempo em dias entre a primeira e a última compra de cada usuário.
SELECT users.first_name, TIMESTAMP_DIFF(MAX(orders.created_at), MIN(orders.created_at), day) AS num_dias_primeira_ultima_compra
FROM bigquery-public-data.thelook_ecommerce.users AS users
  JOIN bigquery-public-data.thelook_ecommerce.orders AS orders
  ON users.id = orders.user_id
GROUP BY users.first_name
ORDER BY 2;

-- 3) No mesmo dataset, e tabela de eventos, traga a quantidade de registros para cada usuário entre 06 de maio de 2023 
-- menos 73 dias e 09 de maio de 2023, nos eventos de carrinho e compra. Ordene por usuário e tipo do evento.
SELECT 
  user_id,
  event_type,
  COUNT(id)
FROM bigquery-public-data.thelook_ecommerce.events
WHERE 
  DATE(created_at) BETWEEN DATE_SUB('2023-05-06', INTERVAL 73 day) AND '2023-05-06'
  AND (event_type = 'cart' OR event_type = 'purchase')
  AND user_id IS NOT NULL
GROUP BY 1, 2
ORDER BY 1, 2;

-- 4) Ache o dataset “catalonian_mobile_coverage” e calcule a quantidade de sinais 4G recebidos no mês de março de 2016
SELECT COUNT(*) qnt_4g
FROM bigquery-public-data.catalonian_mobile_coverage_eu.mobile_data_2015_2017 AS mobile
WHERE
  UPPER(net) LIKE '%4G%'
  AND EXTRACT(month FROM mobile.date) = 03
  AND EXTRACT(year FROM mobile.date) = 2016;
  -- net = '4G' AND FORMAT_DATE('%Y-%m', date) = '2016-03' 