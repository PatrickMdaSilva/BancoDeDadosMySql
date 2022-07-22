/*Para facilitar a leitura estamos utilizando o underline seria interessante utilizar na descrição dos atributos o camel case Ex: atributoExNome */

/*Comando para criação de banco de dados*/
CREATE DATABASE nome_do_banco;

/*Comando para importação de banco de dados deve ser executado no arquivo de origem pai*/
source nome_do_banco.sql 

/*Comando para deletar banco de dados OBS: não há como recuperar os dados*/
DROP DATABASE nome_do_banco;

/* Comando para Mostrar os bancos*/
SHOW DATABASE  nome_do_banco;

/* Comando para usar o bancos*/
USE nome_do_banco;

/*Comando para criação de tabelas com chave primária e atributos */
CREATE TABLE `nome_do_banco`.`nome_da_tabela` (
    `id_chave_primária` INT(11) NOT NULL AUTO_INCREMENT ,
    `atributo_ex_nome` VARCHAR(30) NOT NULL , 
    `atributo_ex_nascimento` DATE NOT NULL , 
    PRIMARY KEY (`id_chave_primária`)
);

/* Comando para deletar tabelas OBS: não há como recuperar os dados deletados, utilizar parâmetro WHERE para definir localização*/
DROP TABLE nome_da_tabela;

/* Comando para inserir dados nas  tabelas OBS: não há como recuperar os dados*/
INSERT INTO nome_da_tabela (atributo_ex_nome, atributo_ex_nascimento) VALUES ('Nome', '1999-09-09');

/*Comando para selecionar todos atributos da tabela*/
SELECT  FROM nome_da_tabela;

/*Comando para selecionar atributos da tabela*/
SELECT atributo_ex_nome, atributo_ex_nascimento FROM nome_da_tabela;

/* Comando para atulizar atributos OBS: não há como recuperar os dados atualizados, dessa forma todos os nomes serão atualizados. Utilizar parâmetro WHERE para definir localização*/
UPDATE nome_da_tabela SET atributo_ex_nome = `novo_nome`;

/*Exemplo com WHERE utilizando id como indentificador PRIMARY */
UPDATE nome_da_tabela SET atributo_ex_nome = `novo_nome` WHERE id_chave_primária = 1;

/* Comando para deletar dados do atributo OBS: não há como recuperar os dados deletados, utilizar parâmetro WHERE para definir localização*/
DELETE FROM nome_da_tabela;

/*Exemplo com WHERE utilizando id como indentificador PRIMARY */
DELETE FROM nome_da_tabela WHERE id_chave_primária = 1;

/*Comando para ordenar atributos da tabela forma crescente e decrescente*/
SELECT * FROM nome_da_tabela ORDER BY atributo_ex_nome ASC;   -- Crescente
SELECT * FROM nome_da_tabela ORDER BY atributo_ex_nome DESC;  --Decrescente

/*Comando para adicionar mais uma coluna da tabela*/
ALTER TABLE `nome_da_tabela` ADD `atributo_ex_rg` VARCHAR(10) NOT NULL AFTER `nome_da_tabela`;

/*Comando para contar e agrupar valores dos atributos */
SELECT COUNT(id_chave_primária), atributo_ex_nome FROM nome_da_tabela GROUP BY atributo_ex_nome; 
-- retornaria quais e quantos são os nomes repetidos

/* Busca com Join com segmento de chave estrangeira  OBS: ver criação arquivo exercicio1 linha 117*/
SELECT * FROM nome_da_tabela_1 JOIN nome_da_tabela_2 ON nome_da_tabela_1.fk_atributo = nome_da_tabela_2.id_atributo

--Comando para selecionar o banco
SELECT

-- Comando para localizar o banco
WHERE

-- Atributos de comparação 
SELECT  * FROM nome_da_tabela WHERE atributo_da_tabela >, <, >=, <=, = VALOR 

BETWEEN -- entre intervalos faixa de valores
SELECT * FROM nome_da_tabela WHERE atributo_da_tabela BETWEEN 'descrição1' AND 'descrição2';

LIKE    -- por meio de algum padrão
SELECT * FROM nome_da_tabela WHERE atributo_da_tabela LIKE "%descrição%";

IN      -- entre conjunto de valores específicos lista
SELECT * FROM nome_da_tabela WHERE atributo_da_tabela IN('descrição1', 'descrição2', 'por diante')

-- Variação de valores
SELECT DISTINCT atributo_da_tabela FROM nome_da_tabela;

-- Operadores lógicos 
AND -- atende duas condições 
OR  -- atende uma condição
NOT -- inverte a cláusula "nega o valor do atributo"

-- Consulta uma quantidade determinada 
SELECT * FROM nome_da_tabela ORDER BY atributo_da_tabela LIMIT valor_int;

-- Funções SQL

SELECT MIN(atributo_da_tabela) FROM nome_da_tabela; -- menor valor
SELECT MAX(atributo_da_tabela) FROM nome_da_tabela; -- maior valor
SELECT AVG(atributo_da_tabela) FROM nome_da_tabela; -- média valor
SELECT SUM(atributo_da_tabela) FROM nome_da_tabela; -- soma  valor


-- Comando para renomear o atributo durante a pesquisa vem sempre após o atributo
AS 
SELECT MAX(atributo_da_tabela) AS renome_da_ tabela FROM nome_da_tabela;

-- Comando conta a contagem quantidade de dados do atributo
SELECT COUNT(*) FROM nome_da_tabela WHERE atributo_da_tabela > ou < ou >= ou <= ou =  VALOR; 

 /*Contraints valor vazio diferente de valor nulo  cuidado a utilizar esse requisito para validação */

NOT NULL -- não pode ser nulo
UNIQUE   -- dado só pode ser inserido uma vez não pode haver repetição do dado
PRIMARY Key -- ser inserido em uma coluna
AUTOINCREMENT -- associado a primaru key
FOREIGN KEY  -- ligação entre tabelas pode impedir remoção de dados ligados nas tabelas

-- Exemplo de tabela com relação chave estrangeira  pai e filho

CREATE TABLE nome_da_tabela1(
    id INT PRIMARY key AUTO_INCREMENT NOT NULL,
    atributo_1_da_tabela VARCHAR(100) NOT NULL,
    atributo_2_da_tabela INT
);

CREATE TABLE nome_da_tabela2(
    id INT PRIMARY key AUTO_INCREMENT NOT NULL,
    atributo_1_da_tabela VARCHAR(100),
    atributo_2_da_tabela VARCHAR(10),
    atributo_id_da_tabela INT NOT NULL,
    FOREIGN KEY (atributo_id_da_tabela) REFERENCES nome_da_tabela1(id) --realiza ligação com nome_da_tabela1 e seu id
);

INSERT INTO nome_da_tabela1 (
    atributo_1_da_tabela, 
    atributo_2_da_tabela
) VALUES (
    'nome', 
    30
);

INSERT INTO nome_da_tabela2 (
    atributo_1_da_tabela, 
    atributo_2_da_tabela, 
    atributo_id_da_tabela
) VALUES (
    'Rua tal',
    '123-B',
    1     -- valor do id nome_da_tabela1
);

-- Adicionando e deletando índice torna a pesquisa mais rápida 

CREATE INDEX index_novo_nome
ON nome_da_tabela(atributo_da_tabela);

DROP INDEX index_novo_nome
ON nome_da_tabela;

--Comando para criar parãmetros da busca onde há relação
ON

--Comando para para unir consultas  geralmente existe relações entre as tabelas
JOIN, INNER JOIN, 

SELECT nome_da_tabela_1.atributo_1_da_tabela, nome_da_tabela_1.atributo_2_da_tabela, nome_da_tabela_2.atributo_1_da_tabela,
FROM nome_da_tabela_1
INNER JOIN nome_da_tabela_2
ON nome_da_tabela_1.id = nome_da_tabela_2.id;

RIGHT JOIN --retorna todos os dados da tabela da direita  e os necessários da esquerda
RIGHT OUTER JOIN -- outro nome

SELECT nome_da_tabela1.atributo_1_da_tabela, nome_da_tabela2.*
FROM nome_da_tabela1
RIGHT JOIN nome_da_tabela2
ON nome_da_tabela1.id = nome_da_tabela2.atributo_id_vinculo_chave_estrangeira

LEFT JOIN --retorna todos os dados da tabela da esquerda  e os necessários da direita
LEFT OUTER JOIN -- outro nome

SELECT nome_da_tabela1.atributo_1_da_tabela, nome_da_tabela2.*
FROM nome_da_tabela1
LEFT JOIN nome_da_tabela2
ON nome_da_tabela1.id = nome_da_tabela2.atributo_id_vinculo_chave_estrangeira

-- Comando Union para combinar o resultado de 2 ou mais selects. Union all cuidado para não trazer dados com redundância

SELECT atributo_id FROM nome_da_tabela1
UNION SELECT atributo_id FROM nome_da_tabela2

-- Agrupar resultados 
GROUP BY 
SELECT atributo, COUNT(atributo) AS "Quanatidade"
FROM nome_da_tabela
GROUP BY atributo;

/*Comando having ideal para utilizar com GROUP BY similar a where utilizado com aggregate sum, avg , group, by etc */

--Exemplo 1 
SELECT atributo, COUNT(atributo) AS "Quanatidade"
FROM nome_da_tabela
GROUP BY atributo;
HAVING COUNT(atributo > 100)

--Exemplo 2
SELECT atributo, COUNT(atributo) AS "Quanatidade"
FROM nome_da_tabela
GROUP BY atributo;
HAVING COUNT(atributo > 50)
ORDER BY COUNT(atributo) DESC;

-- Sub querry select dentro de outro 
SELECT atributo, (
    SELECT SUM (atributo)
    FROM nome_da_tabela2
    WHERE nome_da_tabela1.id = nome_da_tabela2.id
) AS novo_nome 
FROM nome_da_tabela1;

-- Comando exist analisar sub querrys
SELECT id, atributo1, atributo2(
    SELECT SUM (atributo_da_tabela_2)
    FROM nome_da_tabela2
    WHERE nome_da_tabela1.id = nome_da_tabela2.id
) AS novo_nome 
FROM nome_da_tabela1
WHERE EXISTS (
    SELECT SUM(atributo_da_tabela_2)
    FROM nome_da_tabela_2
    WHERE nome_da_tabela_1.id = nome_da_tabela_2.id
    HAVING SUM(nome_da_tabela_2)
);

-- Comando any analisar sub querrys verifica se é verdadeiro
SELECT atributo 
FROM nome_da_tabela1
WHERE id = ANY (
    SELECT id
    FROM nome_da_tabela2
    WHERE atributo_da_tabela_2 > 150000
);

/* Funções em strings */
SELECT atributo, CHAR_LENGTH(atributo), atributo2, CHAR_LENGTH(atributo2) 
AS qtd_chars FROM nome_da_tabela;

--Comando Concat
SELECT CONCAT(atributo1, "Tem", atributo2, "anos de idade") As nome_e_idade
From nome_da_tabela;

-- Comando concat_WS adiciona separador
SELECT CONCAT_WS( ",", atributo1, atributo2,) 
From nome_da_tabela;

-- Comando format comando para formatar casas decimais 
SELECT atributo_id, atributo1, FORMAT(atributo1,1)
FROM nome_da_tabela;

--Comando instr para retornar a posição do caracter
SELECT atributo, INSTR(atributo, "referência")
FROM nome_da_tabela;

--Comando lcase para retornar letras em caixa baixa 
SELECT atributo_id, atributo1, LCASE(CONCAT(atributo1,"", atributo2))
AS novo_nome
FROM nome_da_tabela;

--Comando Ucase para retornar letras em caixa alta
SELECT atributo_id, atributo1, UCASE(CONCAT(atributo1,"", atributo2))
AS novo_nome
FROM nome_da_tabela;

--Comando left extrai uma quantidade de caracteres de uma string
SELECT atributo, LEFT(atributo, 8)
FROM nome_da_tabela 
WHERE atributo_id = 1; 

--Comando right extrai uma quantidade de caracteres de uma string
SELECT atributo, RIGHT(atributo, 8)
FROM nome_da_tabela 
WHERE atributo_id = 1; 

--Comando substr extrai uma quantidade de caracteres com parâmetros.
SELECT atributo, SUBSTR(atributo, 8, 2)
FROM nome_da_tabela 
WHERE atributo_id = 1; 

--Comando replace troca uma parte da string port outra
SELECT REPLACE (atributo, "dado", "novo_dado")
FROM nome_da_tabela; 

/* Funções em números */

--Comando ceil para arredondar números para cima
SELECT atributo, CEIL(atributo) AS arredondar
FROM nome_da_tabela;

--Comando floor para arredondar números para baixo
SELECT atributo, FLOOR(atributo) AS arredondar
FROM nome_da_tabela;

--Comando count para contar rersultados ou registros
SELECT COUNT(*)
FROM nome_da_tabela;

--Comando max busca o maior valor do atributo
SELECT MAX(atributo)
FROM nome_da_tabela;

--Comando min busca o menor valor do atributo
SELECT MIN(atributo) AS menor_valor
FROM nome_da_tabela;

--Comando Sum soma todo valor inserido naquele atributo
SELECT SUM(atributo) AS Soma_total
FROM nome_da_tabela;

/* Funções DATE */

--Comando adddate adiciona ou remove horas, dias, meses ou anos.
SELECT atributo, ADDDATE(atributo, "5 days"), -- ou
ADDDATE(atributo, INTERVAL 2 MONTH), -- ou
ADDDATE(atributo, INTERVAL -3 MONTH) 
FROM nome_da_tabela;

--Comando datediff diferença entre duas datas 
SELECT DATEDIFF(ADDDATE(atributo, INTERVAL  1 YEAR), atributo) From nome_da_tabela;

--Comando addtime adiciona ou remove tempo
SELECT ADDTIME(atributo, "5 03:00:00")
FROM nome_da_tabela
WHERE atributo_id > 10;

--Comando para fgormatar data com um padrão indicado
SELECT DATE_FORMAT(atributo, "%Y") AS ano, --ou
DATE_FORMAT (atributo,%d/%m/%Y) AS data_formatada

--Copmando retorna o dia da data
SELECT atributo, DAY(atributo) AS dia
FROM nome_da_tabela;

--Comando para verificar o dia da semana
SELECT atributo, DAYOFWEEK(atributo)
FROM nome_da_tabela;
