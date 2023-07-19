-- Funções Matemáticas 

-- ABS 
SELECT 100, -23, abs(100), abs(-23);

-- RAND
SELECT RAND(), 100*RAND();

SELECT id, email, RAND() AS valor_aleatorio
FROM bigquery-public-data.thelook_ecommerce.users
ORDER BY valor_aleatorio
LIMIT 10;

-- SQRT
SELECT sqrt(16), sqrt(81);

-- POW
SELECT POW(3, 2), POW(10, -2);

-- LOG
SELECT LOG(49, 7), LOG(100, 0.01);

-- ROUND
SELECT
  ROUND(1.64, 1) AS r1,
  ROUND(1.65, 1) AS r2,
  ROUND(1.66, 1) AS r3,
  ROUND(numeric "1.65", 1) AS r4


SELECT 
  AVG(retail_price) AS media_preco,
  ROUND(AVG(retail_price), 2) as t1, 
  ROUND(AVG(retail_price), 0) as t2, 
  ROUND(CAST(AVG(retail_price) AS NUMERIC), 7) as t4, 
FROM bigquery-public-data.thelook_ecommerce.products

-- MOD
SELECT MOD(4,2), MOD(-10, 5), MOD(7, 3)


SELECT id, email,
  CASE
    WHEN MOD(id, 2)=0 THEN 'Par' 
    WHEN MOD(id, 2)!=0 THEN 'Impar'
  end AS value
FROM bigquery-public-data.thelook_ecommerce.users
ORDER BY id