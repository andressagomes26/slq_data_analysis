--- Comandos Aritméticos
SELECT 
  7 + 7 as soma,
  12 - 4 as sub,
  73 * 4 AS mult,
  1 /3 AS divisao;

--- Comandos de Comparação

SELECT 
  5 = 5,      ---true
  1 > 10,     ---false
  8 < 16,     ---true
  9 <= 9,     ---true
  100 >= 3,   ---true
  60 <= 60,   ---true
  17 != 17,    ---false
  10 between 8 and 20; ---true

--- between
SELECT *
FROM ecommerce.products
WHERE price BETWEEN 30 AND 80;

--- like
SELECT *
FROM ecommerce.customers
WHERE first_name like 'J%' AND first_name like '%a'; --inicia com J e termina com a

SELECT *
FROM ecommerce.customers
WHERE first_name like 'J%a'; --inicia com J e termina com a

--- IN
SELECT * 
FROM ecommerce.products 
WHERE products.price IN (10, 11, 15);

SELECT first_name, state
FROM ecommerce.customers
WHERE state IN('Acre', 'Ceara');

--- IS NULL e IS NOT NULL
SELECT *
FROM ecommerce.customers
WHERE street IS NULL;

SELECT *
FROM ecommerce.customers
WHERE street IS NOT NULL;

-- IS TRUE e IS FALSE
SELECT *
FROM bigquery-public-data.chicago_crime.crime
WHERE domestic IS TRUE;

-- IS TRUE e IS FALSE/IS NOT TRUE
SELECT *
FROM bigquery-public-data.chicago_crime.crime
WHERE domestic IS FALSE;