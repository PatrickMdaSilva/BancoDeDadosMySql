/* Criar primeiro as tabelas sem relação de chave estrangeira*/

CREATE DATABASE biblioteca;

CREATE TABLE `biblioteca`.`tbl_Autor` ( 
    `IdAutor` SMALLINT NOT NULL AUTO_INCREMENT , 
    `NomeAuthor` VARCHAR(50) NOT NULL , 
    `SobrenomeAuthor` VARCHAR(60) NOT NULL , 
    PRIMARY KEY (`IdAutor`)
);

CREATE TABLE `biblioteca`.`tbl_Assunto` (
    `IdAssunto` SMALLINT NOT NULL AUTO_INCREMENT , 
    `NomeAssunto` VARCHAR(35) NOT NULL , 
    PRIMARY KEY (`IdAssunto`)
); 

CREATE TABLE `biblioteca`.`tbl_Editora` (
    `IdEditora` SMALLINT NOT NULL AUTO_INCREMENT , 
    `NomeEditora` VARCHAR(50) NOT NULL , 
    PRIMARY KEY (`IdEditora`)
);

CREATE TABLE `biblioteca`.`tbl_Livro` ( 
    `IdLivro` SMALLINT AUTO_INCREMENT PRIMARY KEY , 
    `NomeLivro` VARCHAR(80) NOT NULL , 
    `ISBN` CHAR(13), 
    `PrecoLivro` DECIMAL(6,2) NOT NULL ,
    `NumPaginas` SMALLINT NOT NULL , 
    `Edicao` TINYINT , 
    `DataPub` DATE ,
    `IdEditora` SMALLINT NOT NULL, 
    `IdAssunto` SMALLINT NOT NULL ,
    CONSTRAINT fk_id_editora FOREIGN KEY (IdEditora)
    REFERENCES tbl_Editora(IdEditora)
    ON DELETE CASCADE ON UPDATE CASCADE ,
    CONSTRAINT fk_id_assunto FOREIGN KEY (IdAssunto)
    REFERENCES tbl_Assunto(IdAssunto)
    ON DELETE CASCADE ON UPDATE CASCADE
)  AUTO_INCREMENT = 100; 

-- Chave primária composta     
CREATE TABLE `biblioteca`.`tbl_Autor_Livro` (
    `IdAutor` SMALLINT, 
    `IdLivro` SMALLINT, 
    CONSTRAINT pk_autor_livro PRIMARY KEY(IdAutor, IdLivro),
    CONSTRAINT fk_id_autor FOREIGN KEY (IdAutor)
    REFERENCES tbl_Autor(IdAutor)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_id_livro FOREIGN KEY (Idlivro)
    REFERENCES tbl_Livro(IdLivro)
    ON DELETE CASCADE ON UPDATE CASCADE
);    
    
