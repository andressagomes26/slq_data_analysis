# <h1 align="center"><font color = #119fbf>SQL para Análise de Dados </font></h1>
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
END
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

## Funções Matemáticas

⭐ ```ABS```: Calcula o valor absoluto;

⭐ ```RAND```: Retorna um valor aleatório entre  0 e 1, não considerando 1;

⭐ ```SQRT```: Calcula a raiz quadrada;

⭐ ```POW```: Retorna a primeira entrada elevada à segunda entrada;

⭐ ```LOG```: Retorna o logarítmo da primeira entrada na base da segunda entrada;

⭐ ```ROUND```: Arrendonda o valor para o número de casas decimais escolhido;

⭐ ```MOD```: Retorna o resto da divisão da primeira entrada pela segunda;

⭐ ```SIN```: Retorna o seno de um ângulos (radianos).

## Funções de Texto
⭐ ```CONCAT```: Concatena uma ou mais strings;

⭐ ```STARTS_WITH```: Verifica se a string começa com a segunda entrada;

⭐ ```LOWER```: Transforma todos os caracteres da string em minúsculas;

⭐ ```UPPER```: Transforma todos os caracteres da string em maiúsculas;

⭐ ```SPLIT```: Separa a string em uma ou mais strings, baseando-se em um delimitador;

⭐ ```TRIM```: Remove os caracteres iniciais e finais da string correspondentes a segunda entrada;

⭐ ```REPLACE```: Substitui parte da string por outro valor;

⭐ ```CHAR_LENGTH```: Retorna o número de caracteres presentes na string.

## Funções de Data
⭐ ```DATE```, ```DATETIME```, ```TIMESTAMP```: Cria um objeto data ou data+hora.

⭐ ```CURRENT_DATE```, ```CURRENT_DATETIME```, ```CURRENT_TIMESTAMP```: Verifica a data/data+hora atual, em qualquer fuso horário;

⭐ ```EXTRACT```: Extrai infomação de uma data: Ano, Semana, Dia, Hora, Segundo, etc;

⭐ ```DATE_ADD```, ```DATETIME_ADD```, ```TIMESTAMP_ADD```: Soma um intervalo à uma data ou data e hora;

⭐ ```DATE_SUB```, ```DATETIME_SUB```, ```TIMESTAMP_SUB```: Subtrai um intervalo à data ou data+hora;

⭐ ```DATE_DIFF```, ```DATETIME_DIFF```, ```TIMESTAMP_DIFF```: Retorna um intervalo de diferenças entre datas ou datas+horas;

⭐ ```FORMAT_DATE```, ```FORMAT_DATETIME```,  ```FORMAT_TIMESTAMP```: Formata uma data ou data+hora para o formato de tempo desejado;

## Funções Geográficas

⭐ ```ST_GEOGPOINT```: Cria um ponto no espaçõ com a longitude na primeira entrada e a latitude na segunda entrada

⭐ ```ST_DITANCE```: Calcula a distância, em metros, entre dois pontos;

⭐ ```ST_X```: Retorna a longitude de um ponto no espaço;

⭐ ```ST_Y```: Retorna a latitude de um ponto no espaço.

## Relacionamento de Tabelas
⭐ ```JOIN``` ou ```INNER JOIN``` : Permite o relacionamento de duas tabelas através de uma chave;

⭐ ```LEFT JOIN```: Junção à esquerda;

⭐ ```RIGHT JOIN```: Junção à direita;

⭐ ```FULL JOIN```: Junção completa;

## Window Functions
⭐ ```FIRST_VALUE``` : Retorna o primeiro valor da variável desejada, considerando a partição agrupada ou ordenada;

⭐ ```LAST_VALUE``` : Retorna o último valor da variável desejada, considerando a partição agrupada ou ordenada;

⭐ ```LAG``` : Retorna o valor da variável desejada de uma linha anterior, considerando a partição agrupada ou ordenada;

⭐ ```LEAD``` : Retorna o valore da variável desejada de uma linha subsequente, considerando a partição agrupada ou ordenada;

⭐ ```RANK``` : Retorna uma classificação numerada de cada partição, onde a ordenação é obrigatória;

⭐ ```ROW_NUMBER``` : Retorna o número de cada linha para cada partição, mas a ordenação não é obrigatória.

###  Verificação
- Código Credencial: [https://www.udemy.com/certificate/UC-4d91015f-040c-4cd0-befb-534f91535dae/](https://www.udemy.com/certificate/UC-4d91015f-040c-4cd0-befb-534f91535dae/)
