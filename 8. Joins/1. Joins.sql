-- JOINS - RELACIONAMENTO ENTRE TABELAS 

-- INNER JOIN

-- Usuários que possuem acessos e compras
SELECT DISTINCT acessos.name
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  JOIN curso-sql-dados.relacionamentos.compras AS compras
  ON acessos.user_id = compras.user_id;

-- LEFT JOIN

-- Trazer a informação de compras de todos os usuários que possuem acessos
SELECT DISTINCT
  acessos.user_id AS acesso_user_id,
  compras.user_id AS compras_user_id,
  acessos.name,
  compras.revenue AS receita_users_possuem_compras
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  LEFT JOIN curso-sql-dados.relacionamentos.compras AS compras
  ON acessos.user_id = compras.user_id;

-- Usuários que possuem apenas acessos
SELECT DISTINCT
  acessos.user_id AS acesso_user_id,
  compras.user_id AS compras_user_id,
  acessos.name,
  compras.revenue AS receita_users_possuem_compras
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  LEFT JOIN curso-sql-dados.relacionamentos.compras AS compras
  ON acessos.user_id = compras.user_id
WHERE compras.revenue IS NULL;


-- RIGHT JOIN
-- Trazer a informação de ACESSO (se houver) de todos os usuários que possuem COMPRAS

SELECT DISTINCT
  acessos.user_id AS acesso_user_id,
  compras.user_id AS compras_user_id,
  compras.name,
  compras.revenue AS receita_users_possuem_compras
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  RIGHT JOIN curso-sql-dados.relacionamentos.compras AS compras
  ON acessos.user_id = compras.user_id;

-- Apenas os usuários que não possuem acesso (só compras)
SELECT DISTINCT
  acessos.user_id AS acesso_user_id,
  compras.user_id AS compras_user_id,
  compras.name,
  compras.revenue AS receita_users_possuem_compras
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  RIGHT JOIN curso-sql-dados.relacionamentos.compras AS compras
  ON acessos.user_id = compras.user_id
WHERE acessos.user_id IS NULL;

-- FULL JOIN

-- Usuários que possuem acessos ou compras
SELECT DISTINCT
  acessos.user_id AS acesso_user_id,
  acessos.name AS acessos_name,
  compras.user_id AS compras_user_id,
  compras.name AS compras_name,
  compras.revenue AS receita_users_possuem_compras
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  FULL JOIN curso-sql-dados.relacionamentos.compras AS compras
  ON acessos.user_id = compras.user_id;

-- Usuários que possuem acessos ou compras (mas não os dois)
SELECT DISTINCT
  acessos.user_id AS acesso_user_id,
  acessos.name AS acessos_name,
  compras.user_id AS compras_user_id,
  compras.name AS compras_name,
  compras.revenue AS receita_users_possuem_compras
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  FULL JOIN curso-sql-dados.relacionamentos.compras AS compras
  ON acessos.user_id = compras.user_id
WHERE acessos.user_id IS NULL OR compras.user_id IS NULL;

-- FULL JOIN DUPLO

SELECT DISTINCT
  acessos.user_id AS acessos_user_id,
  acessos.name AS acessos_name,
  compras.user_id AS compras_user_id,
  compras.name AS compras_name,
  compras.revenue AS receita_users_possuem_compras,
  usuarios.id AS usuarios_user_id,
  usuarios.name AS usuarios_name,
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  FULL JOIN curso-sql-dados.relacionamentos.compras AS compras
    ON acessos.user_id = compras.user_id
  FULL JOIN curso-sql-dados.relacionamentos.usuarios AS usuarios
    ON usuarios.id = COALESCE(acessos.user_id, compras.user_id);
   

-- Não possuem acessos e nem compras
SELECT DISTINCT
  acessos.user_id AS acessos_user_id,
  acessos.name AS acessos_name,
  compras.user_id AS compras_user_id,
  compras.name AS compras_name,
  compras.revenue AS receita_users_possuem_compras,
  usuarios.id AS usuarios_user_id,
  usuarios.name AS usuarios_name,
FROM curso-sql-dados.relacionamentos.acessos AS acessos
  FULL JOIN curso-sql-dados.relacionamentos.compras AS compras
    ON acessos.user_id = compras.user_id
  FULL JOIN curso-sql-dados.relacionamentos.usuarios AS usuarios
    ON usuarios.id = COALESCE(acessos.user_id, compras.user_id)
WHERE COALESCE(acessos.user_id, compras.user_id) IS NULL;