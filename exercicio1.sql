CREATE TABLE `dataBaseYt`.`videos` ( --criando primeira entidade e atributos
    `id_video` INT NOT NULL AUTO_INCREMENT ,
    `fk_author` INT NOT NULL , -- Atributo de vinculo de chave estrangeira com  segunda entidade
    `title` VARCHAR(30) NOT NULL , 
    `likes` INT NOT NULL , 
    `dislikes` INT NOT NULL , 
    PRIMARY KEY (`id_video`)
);

INSERT INTO videos (  -- entidade 1
    fk_author,  --atributo 1
    title,      --atributo 2
    likes,      --atributo 3
    dislikes    --atributo 4 
) VALUES (
    0,          -- valor atributo 1
    'MySql',    -- valor atributo 2
    10,         -- valor atributo 3
    2           -- valor atributo 4
);

INSERT INTO videos (  
    fk_author,     
    title,      
    likes,      
    dislikes 
) VALUES (
    0,    
    'HTML',    
    30,         
    1           
);

INSERT INTO videos (  
    fk_author,     
    title,      
    likes,      
    dislikes 
) VALUES (
    0,    
    'CSS',    
    10,         
    3           
);

INSERT INTO videos (  
    fk_author,     
    title,      
    likes,      
    dislikes 
) VALUES (
    0,    
    'JavaScript',    
    15,         
    8          
);

INSERT INTO videos (  
    fk_author,     
    title,      
    likes,      
    dislikes 
) VALUES (
    0,    
    'Python',    
    50,         
    0           
);

CREATE TABLE `dataBaseYt`.`author` (    --criando segunda entidade e atributos
    `id_author` INT NOT NULL AUTO_INCREMENT , 
    `nome` VARCHAR(30) NOT NULL , 
    `born` DATE NOT NULL , 
    PRIMARY KEY (`id_author`)
);

INSERT INTO author (  -- entidade 2
    nome,      --atributo 1
    born      --atributo 2
) VALUES (
    'Maria',    -- valor atributo 1
    '1992-04-19'    -- valor atributo 2
);

INSERT INTO author (
    nome,   
    born   
) VALUES (
    'Pedro 2000-10-17',    
    '1998-04-09'    
);

INSERT INTO author (
    nome,   
    born   
) VALUES (
    'João',    
    '1998-04-09'    
);

INSERT INTO author (
    nome,   
    born   
) VALUES (
    'Flávia',    
    '2000-12-05'    
);

/* vincular id da segunda entidade com a primeira entidade */
UPDATE videos SET fk_author = 1 WHERE id_video =1;
UPDATE videos SET fk_author = 1 WHERE id_video =2;
UPDATE videos SET fk_author = 1 WHERE id_video =3;
UPDATE videos SET fk_author = 2 WHERE id_video =4;
UPDATE videos SET fk_author = 3 WHERE id_video =5;

/* criando vinculo de chave estrangeira  OBS: haverá erro se não houver vinculado valores a foreign key*/
ALTER TABLE `videos` 
ADD CONSTRAINT `fk_author` 
FOREIGN KEY (`fk_author`) 
REFERENCES `author`(`id_author`) 
ON DELETE CASCADE ON UPDATE CASCADE;

SELECT * FROM videos JOIN author ON videos.fk_author= author.id_author;


SELECT videos.title, author.nome FROM videos JOIN author ON videos.fk_author = author.id_author;

CREATE TABLE `dataBaseYt`.`seo` (     -- criando terceira entidade e atributo
    `id_seo` INT NOT NULL AUTO_INCREMENT , 
    `category` VARCHAR(20) NOT NULL , 
    PRIMARY KEY (`id_seo`)
);


INSERT INTO seo ( -- entidade 3
    category   -- atributo 1
) VALUES (
    'Frontend'  -- valor atributo 1
);

INSERT INTO seo ( 
    category   
) VALUES (
    'Backend'  
);

ALTER TABLE `videos` ADD `fk_seo` INT NOT NULL AFTER `title`;

UPDATE videos SET fk_seo = 1 WHERE id_video = 2;
UPDATE videos SET fk_seo = 1 WHERE id_video = 3;
UPDATE videos SET fk_seo = 1 WHERE id_video = 4;
UPDATE videos SET fk_seo = 2 WHERE id_video = 1;
UPDATE videos SET fk_seo = 2 WHERE id_video = 6;
UPDATE videos SET fk_seo = 2 WHERE id_video = 7;

/* criando vinculo de chave estrangeira  OBS: haverá erro se não houver vinculado valores a foreign*/
ALTER TABLE `videos` 
ADD CONSTRAINT `fk_seo` 
FOREIGN KEY (`fk_seo`) 
REFERENCES `seo`(`id_seo`) 
ON DELETE CASCADE ON UPDATE CASCADE;

SELECT * FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;

SELECT videos.title, seo.category FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;

SELECT videos.title, author.nome, seo.category FROM videos JOIN seo ON videos.fk_seo = seo.id_seo JOIN author ON videos.fk_author = author.id_author;  -- join vinculando as três tabelas.

/* relação de N para N "muito para muitos" */

CREATE TABLE `dataBaseYt`.`playlist` (
    `id_playlist` INT NOT NULL AUTO_INCREMENT , 
    `name_pl` VARCHAR(30) NOT NULL , 
    PRIMARY KEY (`id_playlist`)
);

INSERT INTO playlist (name_pl) VALUES ('HTML + CSS');
INSERT INTO playlist (name_pl) VALUES ('HTML + PHP + JS');
INSERT INTO playlist (name_pl) VALUES ('Python + PHP');