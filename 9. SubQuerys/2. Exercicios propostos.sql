-- Exercícios Propostos – Módulo 12

-- 1) Ache o dataset “thelook_ecommerce” nos dados públicos do BigQuery. Calcule a contagem distinta de sessões de tipo de evento = ‘cart’ e também de tipo de 
-- evento = ‘purchase’, para cada usuário cadastrado, como subqueries de coluna.
SELECT 
  users.id,
  users.first_name,
  (
    SELECT
      COUNT(DISTINCT events.session_id)
    FROM bigquery-public-data.thelook_ecommerce.events AS events
    WHERE events.user_id = users.id AND events.event_type = 'cart'
  ) AS qnt_sessoes_cart,
  (
    SELECT
      COUNT(DISTINCT events.session_id)
    FROM bigquery-public-data.thelook_ecommerce.events AS events
    WHERE events.user_id = users.id AND events.event_type = 'purchase'
  ) AS qnt_sessoes_purchase
FROM bigquery-public-data.thelook_ecommerce.users AS users
GROUP BY 1, 2;

-- 2) Na consulta da questão anterior, adicione uma subquery de tabela que calculará 
-- a quantidade de itens feitos por usuário e traga como coluna na query principal.
SELECT 
  users.id,
  users.first_name,
  (
    SELECT
      COUNT(DISTINCT events.session_id)
    FROM bigquery-public-data.thelook_ecommerce.events AS events
    WHERE events.user_id = users.id AND events.event_type = 'cart'
  ) AS qnt_sessoes_cart,
  (
    SELECT
      COUNT(DISTINCT events.session_id)
    FROM bigquery-public-data.thelook_ecommerce.events AS events
    WHERE events.user_id = users.id AND events.event_type = 'purchase'
  ) AS qnt_sessoes_purchase,
  qnt_itens
FROM  bigquery-public-data.thelook_ecommerce.users AS users
LEFT JOIN (
  SELECT 
    user_id,
    COUNT(id) AS qnt_itens
  FROM bigquery-public-data.thelook_ecommerce.order_items AS order_items
  GROUP BY 1
) AS cons_tab ON users.id = cons_tab.user_id;

---
SELECT 
  users.id,
  users.first_name,
  COUNT(DISTINCT order_id) as qnt_itens
FROM  bigquery-public-data.thelook_ecommerce.users AS users
JOIN bigquery-public-data.thelook_ecommerce.order_items AS order_items
  ON users.id = order_items.user_id
GROUP BY 1, 2
ORDER BY 3 DESC;
 
-- 3) Na consulta da questão anterior, adicione uma subquery de filtro que fará com que as sessões de tipo de evento = ‘cart’ sejam menores que a quantidade de 
-- itens feitos por usuário
SELECT 
  users.id,
  users.first_name,
  (
    SELECT
      COUNT(DISTINCT events.session_id)
    FROM bigquery-public-data.thelook_ecommerce.events AS events
    WHERE events.user_id = users.id AND events.event_type = 'cart'
  ) AS qnt_sessoes_cart,
  (
    SELECT
      COUNT(DISTINCT events.session_id)
    FROM bigquery-public-data.thelook_ecommerce.events AS events
    WHERE events.user_id = users.id AND events.event_type = 'purchase'
  ) AS qnt_sessoes_purchase,
  qnt_itens
FROM  bigquery-public-data.thelook_ecommerce.users AS users
LEFT JOIN (
  SELECT 
    user_id,
    COUNT(id) AS qnt_itens
  FROM bigquery-public-data.thelook_ecommerce.order_items AS order_items
  GROUP BY 1
) AS cons_tab ON users.id = cons_tab.user_id
WHERE (
  SELECT
      COUNT(DISTINCT events.session_id)
    FROM bigquery-public-data.thelook_ecommerce.events AS events
    WHERE events.user_id = users.id AND events.event_type = 'cart'
) < qnt_itens;