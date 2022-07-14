/*Para facilitar a leitura estamos utilizando o underline seria interessante utilizar na descrição dos atributos com o camel case Ex: atributoExNome */

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
INSERT INTO nome_da_tabela (atributo_ex_nome, atributo_ex_nascimento) VALUES ('Nome 1', '1982-02-03');
INSERT INTO nome_da_tabela (atributo_ex_nome, atributo_ex_nascimento) VALUES ('Nome 2', '1985-03-30');
INSERT INTO nome_da_tabela (atributo_ex_nome, atributo_ex_nascimento) VALUES ('Nome 3', '1995-08-30');

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

/* vinculando chave estrangeira  exemplo tabela videos tabela author  id valores inteiros dio.me
Necessário criar as relações com a chave estrangeira*/

update videos SET author=? WHERE id=?
SELECT * FROM videos JOIN author on videos.fk_author = author.id_author



