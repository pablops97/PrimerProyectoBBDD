DROP TABLE SUSCRIPCION CASCADE CONSTRAINT;
DROP TABLE PRECIO CASCADE CONSTRAINT;
DROP TABLE ANIME CASCADE CONSTRAINT;
DROP TABLE USUARIO CASCADE CONSTRAINT;
DROP TABLE CONTENIDO CASCADE CONSTRAINT;
DROP TABLE MANGA CASCADE CONSTRAINT;
DROP TABLE GENERO CASCADE CONSTRAINT;
DROP TABLE TIPO CASCADE CONSTRAINT;
DROP TABLE TIPO_SUSCRIPCION CASCADE CONSTRAINT;
DROP TABLE Biblioteca_usuario CASCADE CONSTRAINT;
DROP VIEW RANKING_USUARIO_MANGA;
DROP VIEW RANKING_USUARIO_ANIME;
DROP VIEW Ranking_general_anime;
DROP VIEW Ranking_general_manga;




CREATE TABLE Suscripcion (
	id_usuario SMALLINT NOT NULL,
	id_suscripcion SMALLINT NOT NULL,
	fecha_suscripcion DATE NOT NULL,
	CONSTRAINT PK_Fecha_suscripcion35 PRIMARY KEY (id_usuario)
	);

CREATE TABLE Precio (
	id_precio SMALLINT NOT NULL,
	precio NUMBER (5) NOT NULL,
	CONSTRAINT PK_Precio4 PRIMARY KEY (id_precio)
	);

CREATE TABLE Anime (
	id_anime SMALLINT NOT NULL,
	estudio_animacion VARCHAR2 (100) NOT NULL,
	CONSTRAINT PK_Anime33 PRIMARY KEY (id_anime)
	);

CREATE TABLE Usuario (
	id_usuario SMALLINT NOT NULL,
	nombre_usuario VARCHAR2 (25) NOT NULL,
	contrasena VARCHAR2 (25) NOT NULL,
	correo_electronico VARCHAR2 (25),
	fecha_registro DATE NOT NULL,
	CONSTRAINT PK_Usuario0 PRIMARY KEY (id_usuario),
	CONSTRAINT TC_Usuario1 CHECK (LENGTH(contrasena) > 8)
	);

CREATE TABLE Contenido (
	id_contenido SMALLINT NOT NULL,
	id_tipo SMALLINT NOT NULL,
	titulo VARCHAR2 ( 25 ) NOT NULL,
	descripcion VARCHAR2 ( 200 ) NOT NULL,
	fecha_lanzamiento DATE NOT NULL,
	id_genero SMALLINT NOT NULL,
	CONSTRAINT PK_Contenido29 PRIMARY KEY (id_contenido),
	CONSTRAINT TC_Contenido160 UNIQUE (id_contenido)
	);

CREATE TABLE Manga (
	id_manga SMALLINT NOT NULL,
	editorial VARCHAR2 ( 100 ) NOT NULL,
	id_precio SMALLINT NOT NULL,
	mangaka VARCHAR2 ( 25 ) NOT NULL,
	CONSTRAINT PK_Mangas32 PRIMARY KEY (id_manga)
	);

CREATE TABLE Tipo (
	id_tipo SMALLINT NOT NULL,
	tipo VARCHAR2 ( 25 ) NOT NULL,
	CONSTRAINT PK_tipo27 PRIMARY KEY (id_tipo),
	CONSTRAINT TC_tipo152 UNIQUE (id_tipo)
	);

CREATE TABLE Tipo_suscripcion (
	id_suscripcion SMALLINT NOT NULL,
	tipo_suscripcion VARCHAR2 ( 25 ) NOT NULL,
	precio NUMBER(2),
	porcentaje_descuento SMALLINT NOT NULL,
	CONSTRAINT PK_Suscripcion34 PRIMARY KEY (id_suscripcion),
	CONSTRAINT TC_Suscripcion304 UNIQUE (id_suscripcion)
	);

CREATE TABLE Genero (
	id_genero SMALLINT NOT NULL,
	genero VARCHAR2 ( 25 ) NOT NULL,
	CONSTRAINT PK_genero31 PRIMARY KEY (id_genero),
	CONSTRAINT TC_genero174 UNIQUE (id_genero)
	);

CREATE TABLE Biblioteca_usuario (
	id_usuario SMALLINT NOT NULL,
	id_contenido SMALLINT NOT NULL,
	puntuacion SMALLINT,
	fecha_inicio DATE,
	fecha_fin DATE,
	completado NUMBER(1,0) NOT NULL,
	favorito NUMBER(1,0) NOT NULL,
	pendiente NUMBER(1,0) NOT NULL,
	CONSTRAINT PK_Biblioteca_usuario30 PRIMARY KEY (id_usuario, id_contenido)
	);

ALTER TABLE Suscripcion ADD CONSTRAINT FK_Fecha_suscripcion69 FOREIGN KEY (id_suscripcion) REFERENCES Tipo_suscripcion (id_suscripcion);
ALTER TABLE Suscripcion ADD CONSTRAINT FK_Fecha_suscripcion68 FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario);
ALTER TABLE Anime ADD CONSTRAINT FK_Anime56 FOREIGN KEY (id_anime) REFERENCES Contenido (id_contenido);
ALTER TABLE Contenido ADD CONSTRAINT FK_Contenido53 FOREIGN KEY (id_genero) REFERENCES Genero (id_genero);
ALTER TABLE Contenido ADD CONSTRAINT FK_Contenido50 FOREIGN KEY (id_tipo) REFERENCES Tipo (id_tipo);
ALTER TABLE Manga ADD CONSTRAINT FK_Mangas55 FOREIGN KEY (id_manga) REFERENCES Contenido (id_contenido);
ALTER TABLE Manga ADD CONSTRAINT FK_Mangas54 FOREIGN KEY (id_precio) REFERENCES Precio (id_precio);
ALTER TABLE Biblioteca_usuario ADD CONSTRAINT FK_Biblioteca_usuario52 FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario);
ALTER TABLE Biblioteca_usuario ADD CONSTRAINT FK_Biblioteca_usuario51 FOREIGN KEY (id_contenido) REFERENCES Contenido (id_contenido);







/*  Implementacion de los insert


/  tabla usuario */

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (1, 'pablops12', '12345SADASD', 'pablopablito@gmail.com', '12/03/2019');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (2, 'Jose45', 'joselito21', 'jose@gmail.com', '21/05/2020');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (3, 'RedFlower', '12pap34ASDDS', 'redflower24@gmail.com', '01/02/2021');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (4, 'Margarita2', '1234556ASDSD', 'marga125@gmail.com', '15/06/2019');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (5, 'rubenninja', 'jinjajsqSDSD', '12rubenito@hotmail.com', '29/09/2017');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (6, 'Miguel', 'miguelitomiguel', 'miguelito@yahoo.es', '28/02/2020');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (7, 'ChickenNuget', 'pipiripiASDASD', 'mayigu@gmail.com', '01/01/2021');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (8, 'Kimikuri', 'abscr234DSDSD', 'hofjs@hotmail.com', '16/09/2018');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (9, 'RicardoGom', '12345678FF', 'peterpetito@gmail.com', '03/12/2022');

INSERT INTO Usuario (id_usuario, nombre_usuario, contrasena, correo_electronico, fecha_registro)
VALUES (10, 'ajptlink', 'sadj124mvksdj', 'ajptlink1@yahoo.es', '20/05/2023');




/* / / Tabla Suscripcion */

INSERT INTO TIPO_SUSCRIPCION (id_suscripcion, tipo_suscripcion, precio, porcentaje_descuento)
VALUES (1, 'Vip', '5', 5);


INSERT INTO TIPO_SUSCRIPCION (id_suscripcion, tipo_suscripcion, precio, porcentaje_descuento)
VALUES (2, 'Silver', '12', 10);


INSERT INTO TIPO_SUSCRIPCION (id_suscripcion, tipo_suscripcion, precio, porcentaje_descuento)
VALUES (3, 'Gold', '20', 15);


INSERT INTO TIPO_SUSCRIPCION (id_suscripcion, tipo_suscripcion, precio, porcentaje_descuento)
VALUES (4, 'Diamond', '30', 20);


INSERT INTO TIPO_SUSCRIPCION (id_suscripcion, tipo_suscripcion, precio, porcentaje_descuento)
VALUES (5, 'Premium', '50', 30);


/* TABLA Precio */
INSERT INTO Precio (id_precio,precio) VALUES (1,7);
INSERT INTO Precio (id_precio,precio) VALUES (2,9);
INSERT INTO Precio (id_precio,precio) VALUES (3,10);
INSERT INTO Precio (id_precio,precio) VALUES (4,14);
INSERT INTO Precio (id_precio,precio) VALUES (5,17);
INSERT INTO Precio (id_precio,precio) VALUES (6,18);
INSERT INTO Precio (id_precio,precio) VALUES (7,20);

/* TABLA Suscripcion */
INSERT INTO Suscripcion (id_usuario,id_suscripcion,fecha_suscripcion) VALUES (1,2,'03/09/2023');
INSERT INTO Suscripcion (id_usuario,id_suscripcion,fecha_suscripcion) VALUES (2,4,'05/09/2023');
INSERT INTO Suscripcion (id_usuario,id_suscripcion,fecha_suscripcion) VALUES (4,1,'03/10/2023');
INSERT INTO Suscripcion (id_usuario,id_suscripcion,fecha_suscripcion) VALUES (6,5,'05/10/2023');
INSERT INTO Suscripcion (id_usuario,id_suscripcion,fecha_suscripcion) VALUES (8,4,'11/10/2022');
INSERT INTO Suscripcion (id_usuario,id_suscripcion,fecha_suscripcion) VALUES (10,2,'05/05/2023');

/* TABLA Tipo */
INSERT INTO Tipo (id_tipo,tipo) VALUES (1,'Anime');
INSERT INTO Tipo (id_tipo,tipo) VALUES (2,'Manga');
INSERT INTO Tipo (id_tipo,tipo) VALUES (3,'Novela');
INSERT INTO Tipo (id_tipo,tipo) VALUES (4,'Comic');
INSERT INTO Tipo (id_tipo,tipo) VALUES (5,'Pelicula');



/* TABLA Genero */
INSERT INTO Genero (id_genero,genero) VALUES (1,'Shonen');
INSERT INTO Genero (id_genero,genero) VALUES (2,'Seinen');
INSERT INTO Genero (id_genero,genero) VALUES (3,'Terror');
INSERT INTO Genero (id_genero,genero) VALUES (4,'Romance');
INSERT INTO Genero (id_genero,genero) VALUES (5,'Isekai');
INSERT INTO Genero (id_genero,genero) VALUES (6,'Aventura');
INSERT INTO Genero (id_genero,genero) VALUES (7,'Misterio');
INSERT INTO Genero (id_genero,genero) VALUES (8,'Comedia');
INSERT INTO Genero (id_genero,genero) VALUES (9,'Policial');
INSERT INTO Genero (id_genero,genero) VALUES (10,'Fantasia');
INSERT INTO Genero (id_genero,genero) VALUES (11,'Accion');

/* contenido */

INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (1,1,'Shingeki no kyojin','Anime de titanes','02/01/2006',1);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (2,1,'Boku no hero','Anime de heroes','07/04/2012',1);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (3,1,'Sakamoto desu ga','Anime de risas','03/08/2016',8);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (4,2,'Jagaan','Manga de accion','06/12/2018',11);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (5,2,'One Piece','Manga de dios','03/12/1998',1);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (6,1,'One Piece','Anime de dios','03/12/1999',1);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (7,1,'Slime DataKen','Anime de slimes','03/09/2014',5);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (8,2,'Sun/Ken Rock','Manga de puñetazos','05/03/2017',2);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (9,1,'Detective conan','Anime de policias','12/05/2009',9);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (10,2,'20th Century Boys','Manga de niños','02/04/2001',7);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (11,1,'Hunter x Hunter','Manga de aventuras','08/03/1999',6);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (12,3,'Overlord','Novela de Isekai','12/05/2005',5);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (13,4,'Spiderman','Comic de superheroes','11/06/1993',11);
INSERT INTO Contenido (id_contenido,id_tipo,titulo,descripcion,fecha_lanzamiento,id_genero) VALUES (14,2,'Kimetsu no Yaiba','Manga de fantasia','07/05/2007',10);




/* Biblioteca usuario */

INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (1,2,10,'07/03/2021',NULL,0,1,1);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (1,4,8,NULL,NULL,1,1,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (1,8,6,'10/10/2020','10/10/2021',1,1,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (2,6,5,NULL,'05/10/2020',1,0,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (2,7,6,'05/02/2023','05/08/2023',1,1,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (3,1,10,'05/07/2016',NULL,0,1,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (3,3,3,NULL,NULL,1,1,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (4,2,6,'09/07/2018',NULL,0,0,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (5,5,9,'04/02/2000',NULL,0,1,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (6,9,NULL,NULL,NULL,0,0,1);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (9,2,3,'04/05/2022','12/05/2022',1,0,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (9,5,NULL,NULL,NULL,0,0,1);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (10,2,7,'05/07/2019','12/05/2021',1,0,0);
INSERT INTO Biblioteca_usuario (id_usuario,id_contenido,puntuacion,fecha_inicio,fecha_fin,completado,favorito,pendiente) VALUES (10,5,8,'09/02/2021',NULL,0,1,1);



/* Anime */

INSERT INTO Anime (id_anime,estudio_animacion) VALUES (1,'Mappa');
INSERT INTO Anime (id_anime,estudio_animacion) VALUES (2,'Bones');
INSERT INTO Anime (id_anime,estudio_animacion) VALUES (3,'Willy');
INSERT INTO Anime (id_anime,estudio_animacion) VALUES (6,'Luffy');
INSERT INTO Anime (id_anime,estudio_animacion) VALUES (7,'Komito');
INSERT INTO Anime (id_anime,estudio_animacion) VALUES (9,'Popo');
INSERT INTO Anime (id_anime,estudio_animacion) VALUES (11,'Maki');


/* Manga */

INSERT INTO Manga (id_manga,editorial,id_precio,mangaka) VALUES (4,'Don escritor',1,'Katsui Minamoto');
INSERT INTO Manga (id_manga,editorial,id_precio,mangaka) VALUES (5,'Planeta vision',2,'Eichiro Oda');
INSERT INTO Manga (id_manga,editorial,id_precio,mangaka) VALUES (8,'Ubisoft',4,'Miyazaki');
INSERT INTO Manga (id_manga,editorial,id_precio,mangaka) VALUES (10,'Cometa',2,'Homero Steve');
INSERT INTO Manga (id_manga,editorial,id_precio,mangaka) VALUES (14,'Ubisoft',3,'Asashi Fujitora');




/* VISTAS PARA LOS RANKING */


CREATE VIEW Ranking_usuario_manga(id_usuario, id_contenido, puntuacion) AS
SELECT Biblioteca_usuario.id_usuario, Contenido.titulo, Biblioteca_usuario.puntuacion FROM Biblioteca_usuario, Contenido
where Biblioteca_usuario.id_contenido IN  (SELECT id_contenido FROM Contenido
                                            WHERE id_tipo IN (SELECT id_tipo from TIPO
                                                                        where tipo like 'Manga'))
and Contenido.id_contenido = Biblioteca_usuario.id_contenido
AND Biblioteca_usuario.puntuacion IS NOT NULL
order by puntuacion;


CREATE VIEW Ranking_general_anime(titulo, media) AS
SELECT Contenido.titulo, AVG(Biblioteca_usuario.puntuacion) FROM Biblioteca_usuario, Contenido
WHERE Biblioteca_usuario.id_contenido IN (SELECT id_contenido FROM Contenido
                                            WHERE id_tipo IN (SELECT id_tipo from TIPO
                                                                        where tipo like 'Anime'))
AND Biblioteca_usuario.id_contenido = Contenido.id_contenido
AND Biblioteca_usuario.puntuacion IS NOT NULL
GROUP BY Contenido.titulo
ORDER BY AVG(Biblioteca_usuario.puntuacion);


CREATE VIEW Ranking_usuario_anime(id_usuario, id_contenido, puntuacion) AS
SELECT Biblioteca_usuario.id_usuario, Contenido.titulo, Biblioteca_usuario.puntuacion FROM Biblioteca_usuario, Contenido
where Biblioteca_usuario.id_contenido IN  (SELECT id_contenido FROM Contenido
                                            WHERE id_tipo IN (SELECT id_tipo from TIPO
                                                                        where tipo like 'Anime'))
and Contenido.id_contenido = Biblioteca_usuario.id_contenido
AND Biblioteca_usuario.puntuacion IS NOT NULL
order by puntuacion;


CREATE VIEW Ranking_general_manga(titulo, media) AS
SELECT Contenido.titulo, AVG(Biblioteca_usuario.puntuacion) FROM Biblioteca_usuario, Contenido
WHERE Biblioteca_usuario.id_contenido IN (SELECT id_contenido FROM Contenido
                                            WHERE id_tipo IN (SELECT id_tipo from TIPO
                                                                        where tipo like 'Manga'))
AND Biblioteca_usuario.id_contenido = Contenido.id_contenido
AND Biblioteca_usuario.puntuacion IS NOT NULL
GROUP BY Contenido.titulo
ORDER BY AVG(Biblioteca_usuario.puntuacion);



SELECT * FROM SUSCRIPCION;
SELECT * FROM PRECIO;
SELECT * FROM ANIME;
SELECT * FROM USUARIO;
SELECT * FROM CONTENIDO;
SELECT * FROM MANGA;
SELECT * FROM GENERO;
SELECT * FROM TIPO;
SELECT * FROM TIPO_SUSCRIPCION;
SELECT * FROM Biblioteca_usuario;



/* CONSULTAS */


-- EXISTE UN MANGA DE UN ANIME

/* Muestra el nombre y el genero de los mangas que tengan una version animada USANDO LA CLAUSULA
INTERSECT*/


SELECT CONTENIDO.TITULO, GENERO.GENERO FROM CONTENIDO, GENERO
WHERE CONTENIDO.ID_GENERO = GENERO.ID_GENERO
AND CONTENIDO.id_tipo IN (SELECT id_tipo FROM TIPO
							WHERE TIPO LIKE 'Manga')
INTERSECT
SELECT CONTENIDO.TITULO, GENERO.GENERO FROM CONTENIDO, GENERO
WHERE CONTENIDO.ID_GENERO = GENERO.ID_GENERO
AND CONTENIDO.id_tipo IN (SELECT id_tipo FROM TIPO
							WHERE TIPO LIKE 'Anime');





/* Muestra el nombre y el genero de los animes hechos por el estudio Mappa usando la clausula
EXISTS*/

SELECT CONTENIDO.TITULO, GENERO.GENERO FROM CONTENIDO, GENERO
WHERE CONTENIDO.ID_GENERO = GENERO.ID_GENERO
AND EXISTS (SELECT ID_ANIME FROM ANIME
			WHERE ANIME.ID_ANIME = CONTENIDO.id_contenido
			AND ESTUDIO_ANIMACION LIKE 'Mappa');



/* Elimina de la tabla Manga aquellos mangas cuyo precio es superior a 10 euros usando la clausula ANY*/

DELETE FROM MANGA
WHERE ID_PRECIO > ANY (SELECT ID_PRECIO FROM PRECIO
                       WHERE PRECIO = 10);


/*Muestra, por cada usuario que ha votado, la nota media de todas las puntuaciones que ha dado
y que superen el valor de 5*/


SELECT USUARIO.NOMBRE_USUARIO, AVG(PUNTUACION)"PUNTUACION MEDIA" FROM BIBLIOTECA_USUARIO, USUARIO
WHERE BIBLIOTECA_USUARIO.ID_USUARIO = USUARIO.ID_USUARIO(+)
GROUP BY USUARIO.NOMBRE_USUARIO
HAVING AVG(PUNTUACION) > 5
ORDER BY USUARIO.NOMBRE_USUARIO;


/*Muestra, por cada titulo de manga, la media de la puntuacion que le han dado los usuarios*/


SELECT Contenido.titulo, AVG(Biblioteca_usuario.puntuacion) FROM Biblioteca_usuario, Contenido
WHERE Biblioteca_usuario.id_contenido IN (SELECT id_contenido FROM Contenido
                                            WHERE id_tipo IN (SELECT id_tipo from TIPO
                                                                        where tipo like 'Manga'))
AND Biblioteca_usuario.id_contenido = Contenido.id_contenido
AND Biblioteca_usuario.puntuacion IS NOT NULL
GROUP BY Contenido.titulo
HAVING AVG(Biblioteca_usuario.puntuacion) > 5




/* Muestra el nombre de los usuarios junto con el tipo de suscripcion que tiene contratada,
incluso si no tiene suscripcion, Usando un OUTER JOIN */


SELECT USUARIO.NOMBRE_USUARIO, TIPO_SUSCRIPCION.TIPO_SUSCRIPCION FROM USUARIO, SUSCRIPCION, TIPO_SUSCRIPCION
WHERE USUARIO.ID_USUARIO = SUSCRIPCION.ID_USUARIO(+)
AND TIPO_SUSCRIPCION.ID_SUSCRIPCION(+) = SUSCRIPCION.ID_SUSCRIPCION
;







/* INFORME RECOPILANDO DATOS SOBRE LAS PUNTUACIONES QUE LE HA DADO CADA USUARIO
AL CONTENIDO QUE HA CONSUMIDO (YA SEA MANGA O ANIME)*/


SET HEADSEP |

TTITLE CENTER 'Informe sobre la media de puntuacion de cada usuario en su biblioteca'

COLUMN NOMBRE_USUARIO HEADING 'Nombre usuario'
COLUMN NOMBRE_USUARIO TRUNCATED
COLUMN TITULO HEADING 'Titulo'
COLUMN PUNTUACION HEADING 'Puntuacion'



SET LINESIZE 200
SET PAGESIZE 50
SET NEWPAGE 0

BREAK ON USUARIO.NOMBRE_USUARIO SKIP 1
COMPUTE AVG OF Biblioteca_usuario.PUNTUACION ON USUARIO.NOMBRE_USUARIO


SELECT USUARIO.NOMBRE_USUARIO, CONTENIDO.TITULO, BIBLIOTECA_USUARIO.PUNTUACION FROM USUARIO, CONTENIDO, BIBLIOTECA_USUARIO
WHERE USUARIO.ID_USUARIO = BIBLIOTECA_USUARIO.ID_USUARIO
AND CONTENIDO.id_contenido = BIBLIOTECA_USUARIO.id_contenido
AND PUNTUACION IS NOT NULL
ORDER BY USUARIO.NOMBRE_USUARIO;

CLEAR BREAKS
CLEAR COMPUTES
CLEAR COLUMNS

TTITLE OFF