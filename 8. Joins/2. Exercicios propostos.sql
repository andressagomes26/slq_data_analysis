-- Exercícios Propostos – Módulo 11

-- 1) Ache o dataset “thelook_ecommerce” nos dados públicos do BigQuery. Traga os  usuários que não tem compra em dezembro de 2022.
SELECT DISTINCT
  users.id, 
  orders.order_id,
  orders.user_id,
  FORMAT_DATE('%Y-%m', orders.created_at)
FROM bigquery-public-data.thelook_ecommerce.users AS users
  LEFT JOIN bigquery-public-data.thelook_ecommerce.orders AS orders
  ON users.id = orders.user_id AND DATE(orders.created_at) between '2022-12-01' AND '2022-12-31'
WHERE orders.user_id IS NULL;               -- WHERE FORMAT_DATE('%Y-%m', orders.shipped_at) = '2020-12' AND orders.user_id IS NULL;

-- 2) No mesmo dataset, traga informações resumidas sobre os usuários (de todos, tendo ou não compras). Id do usuário, quantidade de compras realizadas, 
-- quantidade de itens comprados, ticket médio, quantidade de produtos distintos comprados, centro de distribuições dos quais o usuário recebeu produtos, 
-- quantidade de criações de carrinho.

SELECT
  users.id AS id_usuario, 
  COUNT(DISTINCT orders.order_id) AS qnt_compras,
  COUNT(DISTINCT order_items.id) AS qnt_itens_comprados,
  CASE
    WHEN COUNT(DISTINCT orders.order_id) > 0 THEN SUM(order_items.sale_price)/COUNT(DISTINCT orders.order_id) 
    ELSE 0
  END AS ticket_medio,
  COUNT(DISTINCT products.id) AS qnt_produtos_distintos_comprados,
  products.distribution_center_id AS centro_distribuicao,
  COUNT(DISTINCT events.id) AS carrinho
FROM bigquery-public-data.thelook_ecommerce.users AS users
  LEFT JOIN bigquery-public-data.thelook_ecommerce.orders AS orders
    ON users.id = orders.user_id
  LEFT JOIN bigquery-public-data.thelook_ecommerce.order_items AS order_items
    ON order_items.order_id = orders.order_id
  LEFT JOIN bigquery-public-data.thelook_ecommerce.products AS products
    ON products.id = order_items.user_id
  LEFT JOIN bigquery-public-data.thelook_ecommerce.events AS events
    ON events.user_id = users.id AND event_type='cart'
GROUP BY users.id, products.distribution_center_id
ORDER BY 1;
