-- SUBQUERY

-- 1. SubQuery - COLUNA

-- Número de compras para cada usuário
SELECT 
  users.id, 
  users.name,
  (
    SELECT
      COUNT(compras.id) AS num_compras
    FROM curso-sql-dados.relacionamentos.compras AS compras
    WHERE compras.user_id = users.id
  ) AS num_compras_user
FROM curso-sql-dados.relacionamentos.usuarios AS users;

-- Por left join
SELECT 
  users.id, 
  users.name,
  COUNT(compras.id) AS num_compras_user
FROM curso-sql-dados.relacionamentos.usuarios AS users
LEFT JOIN curso-sql-dados.relacionamentos.compras AS compras
    ON compras.user_id = users.id
GROUP BY 1, 2;

-- Média de acesso para todos os usuários
SELECT 
  AVG((
    SELECT
      COUNT(acessos.id)
    FROM curso-sql-dados.relacionamentos.acessos AS acessos
    WHERE acessos.user_id = users.id
  )) AS media_acessos_users
FROM curso-sql-dados.relacionamentos.usuarios AS users;


-- 2. SubQuery - COLUNA

-- Quantidade de acessos por usuários
SELECT
  AVG(qnt_acessos) AS media_acessos
FROM(
  SELECT
    COUNT(acessos.id) AS qnt_acessos,
    users.id
  FROM curso-sql-dados.relacionamentos.usuarios AS users
  LEFT JOIN curso-sql-dados.relacionamentos.acessos AS acessos
    ON users.id = acessos.user_id
  GROUP BY 2
);
  
-- Calcular o ticket médio por usuário
SELECT  
  user_id,
  ROUND(AVG(receita_por_pedido), 2) AS ticket_medio
FROM(
  SELECT 
    order_id,
    user_id,
    SUM(sale_price) AS receita_por_pedido
  FROM bigquery-public-data.thelook_ecommerce.order_items
  GROUP BY 1,2
)
GROUP BY 1;

-- 3. SubQuery - FILTRO

-- Número de compras para cada usuário, excluindo os usuários que não possuem compras
SELECT 
  users.id, 
  users.name,
  (
    SELECT
      COUNT(compras.id) AS num_compras
    FROM curso-sql-dados.relacionamentos.compras AS compras
    WHERE compras.user_id = users.id
  ) AS num_compras_user
FROM curso-sql-dados.relacionamentos.usuarios AS users
WHERE (
    SELECT
      COUNT(compras.id) AS num_compras
    FROM curso-sql-dados.relacionamentos.compras AS compras
    WHERE compras.user_id = users.id
) > 0;


-- Número de compras e acessos
SELECT 
  users.id, 
  users.name,
  (
    SELECT
      COUNT(compras.id) AS num_compras
    FROM curso-sql-dados.relacionamentos.compras AS compras
    WHERE compras.user_id = users.id
  ) AS num_compras_user,
  acesso as num_acessos_user
FROM curso-sql-dados.relacionamentos.usuarios AS users
LEFT JOIN (
  SELECT
    COUNT(acessos.id) as acesso,
    user_id
  FROM curso-sql-dados.relacionamentos.acessos AS acessos
  GROUP BY 2
) as T ON T.user_id = users.id
WHERE (
    SELECT
      COUNT(compras.id) AS num_compras
    FROM curso-sql-dados.relacionamentos.compras AS compras
    WHERE compras.user_id = users.id
  ) > 0 AND (
    SELECT
      COUNT(acessos.id) as acesso
    FROM curso-sql-dados.relacionamentos.acessos AS acessos
    WHERE acessos.user_id = users.id
  ) > 0;

