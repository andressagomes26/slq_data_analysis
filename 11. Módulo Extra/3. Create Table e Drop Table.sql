-- Módulo Extra

-- CREATE TABLE
CREATE TABLE ecommerce.teste (
  id INTEGER, 
  idade INTEGER,
  nome STRING
);

--
CREATE OR REPLACE TABLE ecommerce.teste (
  id INTEGER, 
  idade INTEGER,
  nome STRING
);

--
CREATE OR REPLACE TABLE ecommerce.teste as (
  SELECT
    COUNT(DISTINCT id) AS pedidos,
    DATE(created_at) AS dia
  FROM `curso-sql-dados.ecommerce.orders`
  GROUP BY 2
  ORDER BY 1
);

-- DROP TABLE
DROP TABLE ecommerce.teste;
