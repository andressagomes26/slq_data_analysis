-- Exercícios Propostos – Módulo 6

-- 1. Retorne em uma só consulta os valores de média, máximo, mínimo, contagem e 
-- soma do campo “attendance” da tabela “schedules”, dataset “baseball”, mesmo 
-- que a contagem e a soma de torcedores nos estádios não tenham significado para análise de negócio.

SELECT 
  ROUND(AVG(attendance), 2) AS media,
  MAX(attendance) AS maximo,
  MIN(attendance) AS minimo,
  COUNT(attendance) AS quant
FROM bigquery-public-data.baseball.schedules
WHERE status='closed';

-- 2. No mesmo dataset e tabela do exercício anterior, retornar a quantidade de jogos 
-- disputados por cada time em casa por ano e também a soma de minutos jogados
-- em casa por ano. Ordenar de forma decrescente pelo ano e depois crescente pelo nome do time.

SELECT 
  homeTeamName, 
  COUNT(gameId) AS quant_jogos_casa,
  EXTRACT(year FROM created) AS ano,
  SUM(duration_minutes) AS soma_min
FROM bigquery-public-data.baseball.schedules
WHERE status='closed'
GROUP BY homeTeamName, ano
ORDER BY ano DESC, homeTeamName ASC;

-- 3. No dataset “austin_bikeshare”, descubra qual a quantidade de viagens 
-- realizadas em 2017 com duração de 30 minutos ou mais, somente de estações 
-- (tanto de partida quanto de chegada) que estão atualmente ativas.
SELECT 
  COUNT(trip_id) as qnt_viagens
FROM bigquery-public-data.austin_bikeshare.bikeshare_trips AS trips
  JOIN bigquery-public-data.austin_bikeshare.bikeshare_stations AS si
    ON trips.start_station_id=si.station_id
  JOIN bigquery-public-data.austin_bikeshare.bikeshare_stations AS sf
    ON trips.end_station_id=cast(sf.station_id as string)
WHERE EXTRACT (year from trips.start_time) = 2017 
  AND duration_minutes >= 30
  AND si.status='active'
  AND sf.status='active';


-- 4. No mesmo dataset anterior, calcule a média de duração das viagens por tipo de 
-- cliente (“subscriber_type”) por ano
SELECT 
  subscriber_type,
  EXTRACT (year from trips.start_time) AS ano,
  ROUND(AVG(duration_minutes), 1) as media_viagens
FROM bigquery-public-data.austin_bikeshare.bikeshare_trips AS trips
WHERE subscriber_type IS NOT NULL
GROUP BY subscriber_type, ano
ORDER BY subscriber_type
