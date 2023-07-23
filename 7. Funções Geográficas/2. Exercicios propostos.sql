-- Exercícios Propostos – Módulo 10

-- 1) Ache o dataset “austin_crime” no conjunto de dados públicos do BigQuery. Pegue 10 incidentes aleatórios com latitude e longitude não nulas. Crie os pontos 
-- geográficos. Vá até o Google Maps e selecione uma coordenada qualquer na cidade de Austin, EUA (pesquise como fazer) e calcule a distância (em km) entre
-- cada ponto desses incidentes à coordenada escolhida. Crie também as rotas de cada incidente à coordenada.
SELECT 
  unique_key,
  longitude,
  latitude, 
  ST_GEOGPOINT(longitude, latitude) AS pontos_geog,
  ST_GEOGPOINT(-97.742023, 30.289279) AS coord_austin,
  CONCAT(
    ROUND(ST_DISTANCE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.742023, 30.289279))/ 1000, 2), ' ', 'km'
  ) AS distancia,
  ST_MAKELINE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.742023, 30.289279)) AS rotas
FROM bigquery-public-data.austin_crime.crime
WHERE latitude IS NOT NULL
  AND longitude IS NOT NULL
ORDER BY RAND()
LIMIT 10;

-- 2) Calcule a mínima e a máxima distância do resultado da query acima
SELECT 
  --unique_key,
  MAX(ROUND(ST_DISTANCE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.742023, 30.289279))/ 1000, 2)) AS distancia_MAX,
  MIN(ROUND(ST_DISTANCE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.742023, 30.289279))/ 1000, 2)) AS distancia_MIN
FROM bigquery-public-data.austin_crime.crime
WHERE latitude IS NOT NULL
  AND longitude IS NOT NULL
--GROUP BY 1
ORDER BY RAND()
LIMIT 10;


WITH cons1 AS(
  SELECT 
    unique_key,
    longitude,
    latitude, 
    ST_GEOGPOINT(longitude, latitude) AS pontos_geog,
    ST_GEOGPOINT(-97.742023, 30.289279) AS coord_austin,
    CONCAT(
      ROUND(ST_DISTANCE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.742023, 30.289279))/ 1000, 2), ' ', 'km'
    ) AS distancia,
    ST_MAKELINE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.742023, 30.289279)) AS rotas
  FROM bigquery-public-data.austin_crime.crime
  WHERE latitude IS NOT NULL
    AND longitude IS NOT NULL
  ORDER BY RAND()
  LIMIT 10
)
SELECT 
  MIN(distancia) AS distancia_MIN, 
  MAX(distancia) AS distancia_MAX
FROM cons1