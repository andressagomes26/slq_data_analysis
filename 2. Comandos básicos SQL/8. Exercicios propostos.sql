-- 1. Utilize o dataset público “thelook_ecommerce”, que está presente no projeto “bigquery-public-data” para trazer 
-- o identificador único dos usuários, o primeiro nome, email e idade, ordernados pela data de criação do cadastro.

SELECT id, first_name, email, age, created_at
FROM bigquery-public-data.thelook_ecommerce.users
ORDER BY created_at;

-- 2. No mesmo dataset do exercício anterior, extraia os pedidos que tenham status “Shipped” ou “Processing”

SELECT order_id, status
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE status = 'Shipped' OR status = 'Processing';

SELECT order_id, status
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE status in ('Shipped', 'Processing');

-- 3. Considerando o mesmo exercício anterior, traga os pedidos que sejam foram  criados no dia “2022-04-05” 
-- e, ao mesmo tempo, tenham status “Cancelled”.
SELECT order_id, status, DATE(created_at) AS data
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE DATE(created_at) = '2022-04-05' AND status='Cancelled';

-- 4. O time de marketing deseja fazer uma campanha em um país específico, com o mesmo dataset dos itens anteriores. 
-- Para isso, eles te pedem os e-mails de todos os clientes que moram no Brasil.
SELECT email, country
FROM bigquery-public-data.thelook_ecommerce.users
WHERE country = 'Brasil' AND email IS NOT NULL;

-- 5. No mesmo dataset anterior, traga o nome dos usuários e o id de seus pedidos
SELECT users.first_name, users.id, orders.order_id
FROM bigquery-public-data.thelook_ecommerce.users
  JOIN bigquery-public-data.thelook_ecommerce.orders 
  ON users.id = orders.user_id

--6. Vá ao dataset público “baseball” e na tabela “schedules” traga os identificadores únicos, 
-- o nome do time da casa e o nome do time de fora de casa dos jogos em que a duração foi maior 
-- ou igual a 250 minutos e menos de 25 mil espectadores.
SELECT 
  gameId AS id, 
  homeTeamName AS time_casa,
  awayTeamName AS time_fora,
  duration_minutes, attendance
FROM bigquery-public-data.baseball.schedules
WHERE (duration_minutes >= 250) AND (attendance < 25000);

-- 7. No mesmo dataset e tabela, retorne os jogos que começaram entre maio e junho de 2016
SELECT *
FROM bigquery-public-data.baseball.schedules
WHERE DATE(startTime) BETWEEN '2016-05-01' AND '2016-06-30';

SELECT *
FROM bigquery-public-data.baseball.schedules
WHERE startTime BETWEEN '2016-05-01 00:00:00' AND '2016-06-30 23:59:59';

-- 8. DESAFIO: No mesmo dataset anterior, descubra o nome dos times que tenham somente 6 caracteres, usando o like. Retorne de forma única
SELECT DISTINCT homeTeamName
FROM bigquery-public-data.baseball.schedules
WHERE homeTeamName LIKE '______';

SELECT homeTeamName
FROM bigquery-public-data.baseball.schedules
WHERE homeTeamName LIKE '______'
GROUP BY homeTeamName;
