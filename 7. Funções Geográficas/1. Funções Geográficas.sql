-- Funções Geográficas
SELECT
  trip_id,
  -- Estação de partida
  start_station_latitude,
  start_station_longitude,
  start_station_geom, 
  ST_GEOGPOINT(start_station_longitude, start_station_latitude) AS ponto_geog_start,
  -- Estação de chegada
  end_station_latitude,
  end_station_longitude,
  end_station_geom, 
  ST_GEOGPOINT(end_station_longitude, end_station_latitude) AS ponto_geog_end,
  -- Distância e velocidade média (m/s)
  ROUND(ST_DISTANCE(start_station_geom, end_station_geom), 0) AS distancia_metros,
  ROUND(ST_DISTANCE(start_station_geom, end_station_geom)/duration_sec, 0) AS vel_media, 
  -- ST_X e ST_Y
  ST_X(start_station_geom) AS long,
  ST_Y(start_station_geom) AS latit,
  ST_MAKELINE(start_station_geom, end_station_geom) AS rota
FROM bigquery-public-data.san_francisco_bikeshare.bikeshare_trips
WHERE start_station_latitude IS NOT NULL
  AND start_station_longitude IS NOT NULL
  AND end_station_latitude IS NOT NULL
  AND end_station_longitude IS NOT NULL
  AND ROUND(ST_DISTANCE(start_station_geom, end_station_geom), 0) > 0
ORDER BY RAND()
LIMIT 100;

SELECT
  trip_id,
  ST_MAKELINE(start_station_geom, end_station_geom) AS rota
FROM bigquery-public-data.san_francisco_bikeshare.bikeshare_trips
WHERE ROUND(ST_DISTANCE(start_station_geom, end_station_geom), 0) > 0
ORDER BY RAND()
LIMIT 10;