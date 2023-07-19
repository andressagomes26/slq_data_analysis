-- Exercícios Propostos – Módulo 7

-- 1) [DESAFIO] Ache o conjunto de dados público do BigQuery “san_francisco_trees”, tabela “street_trees”. Essa tabela traz informações de várias árvores na cidade 
-- de São Francisco, nos EUA. Retorne uma amostra de 100 árvores, sendo 50 da espécie “Persea americana” e 50 da espécie “Magnolia grandiflora”. Precisa 
-- retornar essas amostras na MESMA consulta. Pesquise como fazer isso.DICA: pesquisar sobre WITH e sobre UNION ALL (esses dois comandos também 
-- serão explicados mais pra frente, já é uma antecipação de conhecimento)

SELECT DISTINCT species
FROM bigquery-public-data.san_francisco_trees.street_trees
WHERE 
    species LIKE ('Persea americana%')
    OR species LIKE ('Magnolia grandiflora%')
ORDER BY species;

-- SOLUÇÃO 1
WITH esp_parsea AS (
    SELECT species
    FROM bigquery-public-data.san_francisco_trees.street_trees
    WHERE species LIKE 'Persea americana%'
    LIMIT 50
),
esp_magnolia AS (
    SELECT species
    FROM bigquery-public-data.san_francisco_trees.street_trees
    WHERE species LIKE 'Magnolia grandiflora%'
    LIMIT 50
)
SELECT species
FROM esp_parsea
UNION ALL
SELECT species
FROM esp_magnolia;