-- Exercícios Propostos – Módulo 8

-- 1) Ache a tabela “users” no dataset “thelook_ecommerce”, no projeto de dados públicos do BigQuery. Traga como resultado um único campo distinto com as 
-- informações de forma organizada dos campos street_address + city + state +  country + postal_code.
SELECT 
  CONCAT(
    'Rua: ', street_address,
    ' Estado: ', state, 
    ' País: ', country, 
    ' Caixa Postal: ', postal_code) AS endereco_completo
FROM bigquery-public-data.thelook_ecommerce.users;

-- 2) Ache a tabela “top_terms” no dataset “google_trends”, e descubra os termos, suas posições no rank e áreas de pesquisa para os termos começados com “N”
-- no dia 2023-04-30. Obs.: não se esqueça de colocar essa restrição de data no  where, pois a tabela é grande e particionada (processa somente a data que você 
-- colocar). Ordene por rank.
SELECT term, rank, dma_name
FROM bigquery-public-data.google_trends.top_terms
WHERE DATE(week)='2023-04-30' AND STARTS_WITH(UPPER(term), 'N')
ORDER BY 2;

-- 3) Ache a tabela “stations” do dataset “new_york_subway” e substitua no campo “station_name”, a palavra “St” por “Street” nos casos em que o final do nome 
-- da estação termine em “St” e “Av” por “Avenue” nos casos em que o final do  nome da estação termine em “Av”. Traga como resultado somente o campo 
-- “station_name” de forma distinta e restringindo apenas as linhas que tenham “St” ou “Av” no nome.

SELECT DISTINCT REPLACE(REPLACE(station_name, 'St', 'Street'), 'Av', 'Avenue')
FROM bigquery-public-data.new_york_subway.stations
WHERE station_name like '%St' OR station_name like '%Av';

SELECT DISTINCT 
  CASE
    WHEN station_name LIKE '%St' THEN REPLACE(station_name, 'St', 'Street')
    WHEN station_name LIKE '%Av' THEN REPLACE(station_name, 'Av', 'Avenue')
  END
FROM bigquery-public-data.new_york_subway.stations
WHERE station_name like '%St' OR station_name like '%Av';

-- 4) [DESAFIO] No mesmo dataset do item anterior e tabela “stop_times”, extraia somente o nome do dia da semana do campo “trip_id”, considerando somente 
-- sábado e domingo como resposta (utilize como restrição no where, usando  lower e upper também). Traga também o “trip_id” no select
SELECT DISTINCT
  trip_id,
  SPLIT(trip_id, '-')[ordinal(3)] as dia_da_semana
FROM bigquery-public-data.new_york_subway.stop_times
WHERE 
  SPLIT(LOWER(trip_id), '-')[ordinal(3)]='sunday' OR
  SPLIT(UPPER(trip_id), '-')[ordinal(3)]='SATURDAY'
ORDER BY trip_id;

SELECT DISTINCT
  trip_id,
  CASE 
    WHEN SPLIT(trip_id, '-')[ordinal(3)] = 'Sunday' THEN SPLIT(trip_id, '-')[ordinal(3)]
    WHEN SPLIT(trip_id, '-')[ordinal(3)] = 'Saturday' THEN SPLIT(trip_id, '-')[ordinal(3)]
    ELSE SPLIT(trip_id, '-')[ordinal(4)]
  END as dia_da_semanA
FROM bigquery-public-data.new_york_subway.stop_times
WHERE 
  LOWER(trip_id) LIKE '%sunday%' OR
  UPPER(trip_id) LIKE '%SATURDAY%'
ORDER BY trip_id;
