/*Para facilitar a leitura estamos utilizando o underline seria interessante utilizar na descrição dos atributos o camel case Ex: atributoExNome */

/*Comando para criação de banco de dados*/
CREATE DATABASE nome_do_banco;

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
SELECT * FROM nome_da_tabela ORDER BY atributo_ex_nome;  -- Crescente
SELECT * FROM nome_da_tabela ORDER BY atributo_ex_nome DESC;  --Decrescente

/*Comando para adicionar mais uma coluna da tabela*/
ALTER TABLE `nome_da_tabela` ADD `atributo_ex_rg` VARCHAR(10) NOT NULL AFTER `nome_da_tabela`;

/*Comando para contar e agrupar valores dos atributos */
SELECT COUNT(id_chave_primária), atributo_ex_nome FROM nome_da_tabela GROUP BY atributo_ex_nome; 
-- retornaria quais e quantos são os nomes repetidos

/* Busca com Join com segmento de chave estrangeira  OBS: ver criação arquivo exercicio1 linha 117*/
SELECT * FROM nome_da_tabela_1 JOIN nome_da_tabela_2 ON nome_da_tabela_1.fk_atributo = nome_da_tabela_2.id_atributo

--Comando ON para criar parãmetros da busca
ON
