# <h1 align="center"><font color = #119fbf>PSQL para Análise de Dados </font></h1>
Repositório destinado às práticas realizadas no Curso SQL para Análise de Dados (2023).

## Comandos DDL
⭐ ```CREATE TABLE nome_tabela```: Cria uma tabela;

⭐ ```CREATE DATABASE nome_database```: Cria um database;

⭐ ```DROP TABLE nome_tabela```: Remover uma tabela;

⭐ ```DROP DATABASE nome_database```: Remover um database;

⭐ ```ALTER TABLE nome_tabela```: Alterar uma tabela;

- ```ADD```: Adicionar coluna;
    
- ```REMOVE```: Adicionar coluna;
    
- ```MODIFY```: Adicionar coluna;

## Comandos DML
⭐ ```SELECT```: Comando de seleção;

- ```FROM```: Especifica a tabela da seleção;

⭐ ```INSERT INTO```: Comando de inserção de valores;

⭐ ```UPDATE```: Comando de atualização de valores;

⭐ ```DELETE```: Comando de exclusão de valores;


## Comandos de restrição 
⭐ ```WHERE```: Filtra linhas não agrupadas;

- Operadores aritméticos: +, -, *, /
  
- Operadores Lógicos: NOT, AND, OR
  
- IS: IS NULL, IS TRUE, IS FALSE
  
- Operadores de comparação: <, >, <=, >=, !=
  
- Between; Like; IN; ANY; ALL; EXISTS.

⭐ ```HAVING```: Filtra linhas agrupadas;

## Alias 
⭐ ```AS```: Apelido;

## Comandos Condicionais
⭐ ```CASE```: Se a primeira condição for verdadeira não analisa as outras condições;

```SQL
CASE 
    WHEN condição1 THEN faça
    WHEN condição2 THEN faça
    ELSE faça
```

⭐ ```IF```: Aceita condições aninhadas;

```SQL
IF(condição1, faça caso seja True,  faça caso seja False)
```

⭐ ```COALESCE```: Retorna o primeiro parâmetro não nulo;

```SQL
COALESCE(para1, se para1 for nulo faça)
```

## Comandos de Ordenação 
⭐ ```ORDER BY```: Ordenação;

- Ordenar resultados

- Nome da coluna ou posição dela no SELECT

- ASC ou DESC

- Ordem alfabética ou numérica

## Comandos de Agrupamento 
⭐ ```GROUP BY```: Agrupamento;

- Agrupar e sumarizar resultados

- Nome da coluna ou posição no SELECT

- Usado em funções de agregação

- Pode ser usado também com função similar ao DISTINCT

## Funções de Agregação
⭐ ```COUNT```: Retorna o número de linhas de um grupo de valores ou expressão;

⭐ ```MAX```: Retorna o valor máximo de um grupo de valores ou expressão;

⭐ ```MIN```:  Retorna o valor mínimo de um grupo de valores ou expressão;

⭐ ```SUM```:  Retorna a soma de um grupo de valores ou expressão;

⭐ ```AVG```:  Retorna a média de um grupo de valores ou expressão;

## Relacionamento de Tabelas
⭐ ```JOIN```: Permite o relacionamento de duas tabelas através de uma chave.

