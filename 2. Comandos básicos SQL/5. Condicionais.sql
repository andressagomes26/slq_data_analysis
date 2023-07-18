-- Condicionais

-- Case
SELECT name,
  CASE 
    WHEN name='Esporte e Lazer' THEN 'Categoria de esporte e lazer'
  END AS case1
FROM ecommerce.categories;


-- Case + Else
SELECT name,
  CASE 
    WHEN name='Esporte e Lazer' THEN 'Categoria de esporte e lazer'
    WHEN name='Celulares' THEN 'Categoria Celulares'
    ELSE 'Categoria não identificada'
  END AS case1
FROM ecommerce.categories;

-- Case: Se a primeira condição for verdadeira
-- não analisa as outras condições
SELECT id, name,
  CASE 
    WHEN id BETWEEN 0 AND 5 THEN 'Primeira condição'
    WHEN id BETWEEN 3 AND 6 THEN 'Segunda condição'
    WHEN id BETWEEN 3 AND 10 THEN 'Terceira condição'
  END AS case2
FROM bigquery-public-data.thelook_ecommerce.distribution_centers;

-- IF (cond1, caso cond1=True, caso cond1=False)
SELECT name,
IF(name='Esporte e Lazer', 'Categoria de esporte e lazer', 
  IF(name='Celulares','Categoria Celulares', 'Categoria não identificada')
) as if1
FROM ecommerce.categories;

-- COALESCE(param, caso param seja nulo)
SELECT id, first_name, additionals,
COALESCE(additionals, 'Parâmetro additionals é nulo') as complemento
FROM ecommerce.customers;
