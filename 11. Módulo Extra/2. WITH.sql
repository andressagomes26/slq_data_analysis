-- Módulo Extra

-- WITH
WITH tabela1 AS (
  SELECT 
    COUNT(DISTINCT customer_id) AS compradores,
    DATE(created_at) AS dia
  FROM ecommerce.orders
  GROUP BY 2
),
tabela2 AS (
  SELECT 
    COUNT(DISTINCT id) AS compras,
    DATE(created_at) AS dia
  FROM ecommerce.orders
  GROUP BY 2
)
SELECT T1.compradores, T2.compras, T1.dia
FROM tabela1 AS T1
JOIN tabela2 AS T2 ON T1.dia = T2.dia
WHERE T1.dia between '2020-01-01' AND '2020-01-31'
ORDER BY 3 ASC;
