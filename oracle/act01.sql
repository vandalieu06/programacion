-- ACTIVITAT 08 DDL
-- EX 1 --
CREATE TABLE camioner(
    camionerId  NUMBER,
    dni         VARCHAR(9),
    nom         VARCHAR(50),
    cognom      VARCHAR(50),
    poblacio    VARCHAR(100),
    adreca      VARCHAR(200),
    mobil       NUMBER,
    salari      NUMBER,
    
    CONSTRAINT pk_camioner_id PRIMARY KEY (camionerId),
    CONSTRAINT uk_camioner_dni UNIQUE (dni),
    CONSTRAINT ck_camioner_salari CHECK (salari > 0 AND salari IS NOT NULL)
);

CREATE TABLE provenca(
    provencaId  NUMBER,
    codi_postal NUMBER,
    nom         VARCHAR(50),

    CONSTRAINT pk_provenca_id PRIMARY KEY (provencaID)
);

CREATE TABLE paquet (
    paquetId    NUMBER,
    camionerId  NUMBER,
    provencaId 	NUMBER,
    codi        VARCHAR(10),
    descripcio  VARCHAR(200),
    destinatari VARCHAR(100),
    adreca      VARCHAR(200),
    
    CONSTRAINT pk_paquet_id PRIMARY KEY (paquetId),
    CONSTRAINT fk_paquet_camioner_id FOREIGN KEY (camionerId) REFERENCES camioner(camionerId) ON DELETE SET NULL,
    CONSTRAINT fk_paquet_provenca_id FOREIGN KEY (provencaId) REFERENCES provenca(provencaId)
);



CREATE TABLE camio(
    camioId     NUMBER,
    matricula   VARCHAR(10),
    camioModel  VARCHAR(50),
    tipus       VARCHAR(50),
    potencia    VARCHAR(50),
    
    CONSTRAINT pk_camio_id PRIMARY KEY (camioId),
    CONSTRAINT uk_matricula UNIQUE (matricula) 
);

CREATE TABLE condueix(
    condueixId  	NUMBER,
    camioId     	NUMBER,
    camionerId  	NUMBER,
    data_inicial   	DATE,
    data_final		DATE,
    
    CONSTRAINT pk_condueix_id PRIMARY KEY (condueixId),
    CONSTRAINT fk_condueix_camio_id FOREIGN KEY (camioId) REFERENCES camio(camioId),
    CONSTRAINT fk_condueix_camioner_id FOREIGN KEY (camionerId) REFERENCES camioner(camionerId) ON DELETE SET NULL
);

-- EX 2 --
-- Camioneros
INSERT INTO camioner (camionerId, dni, nom, cognom, poblacio, mobil, salari)
	VALUES (10, '12345678X', 'Joan', 'Garcia', 'Sabadell', 666777888, 3500);
INSERT INTO camioner (camionerId, dni, nom, cognom, poblacio, mobil, salari)
	VALUES (11, '87654321Z', 'Marti', 'Govern', 'Terrassa', 111222333, 2900);
INSERT INTO camioner (camionerId, dni, nom, cognom, poblacio, mobil, salari)
	VALUES (12, '17284376A', 'Alex', 'Gomez', 'Barcelona', 657345768, 1500);
INSERT INTO camioner (camionerId, dni, nom, cognom, poblacio, mobil, salari)
	VALUES (13, '65836564S', 'Guti', 'Gutierrez', 'Sabadell', 647645828, 2500);

-- Provincias
INSERT INTO provenca (provencaId, codi_postal, nom)
	VALUES (1, '08204', 'Sabadell');
INSERT INTO provenca (provencaId, codi_postal, nom)
	VALUES (2, '08210', 'Terrassa');

-- Paquetes
INSERT INTO paquet (paquetId, camionerId, provencaId, codi, descripcio, destinatari, adreca)
	VALUES (1, 10, 1, 'PAQ101', 'Paqeute que contiene figuras anime', 'Miquel Segon Soler', 'Carrer de Nadal 57 bis');
INSERT INTO paquet (paquetId, camionerId, provencaId, codi, descripcio, destinatari, adreca)
	VALUES (2, 13, 2, 'PAQ102', 'Paqeute que contiene libros con tematica anime', 'Joan Garcia Lopez', 'Carrer de Nadal 57 bis');

-- Camiones
INSERT INTO camio (camioId, matricula, camioModel, tipus, potencia)
	VALUES (1, '1234ABC', 'Seat', 'Grande', 100);
INSERT INTO camio (camioId, matricula, camioModel, tipus, potencia)
	VALUES (2, '4321CVB', 'Mercedes', 'Grande', 150);
INSERT INTO camio (camioId, matricula, camioModel, tipus, potencia)
	VALUES (3, '7253CVC', 'Seat', 'Grande', 200);

-- Que camion conduce el conductor
INSERT INTO condueix (condueixId, camionerId, camioId, data_inicial)
	VALUES (1, 10, 1, '06-11-2024');
INSERT INTO condueix (condueixId, camionerId, camioId, data_inicial)
	VALUES (2, 11, 2, '07-11-2024');
INSERT INTO condueix (condueixId, camionerId, camioId, data_inicial)
	VALUES (3, 12, 3, '05-11-2024');
INSERT INTO condueix (condueixId, camionerId, camioId, data_inicial)
	VALUES (4, 13, 2, '03-11-2024');

--SELECT * FROM condueix;


-- EX 3
ALTER TABLE camioner ADD data_neixement DATE;

-- EX 4
UPDATE camioner 
	SET data_neixement = '25-10/1986' 
	WHERE camionerId = 10; 
UPDATE camioner
	SET data_neixement = '15-04-1977'
	WHERE camionerId = 11;
UPDATE camioner
	SET data_neixement = '06-02-2006'
	WHERE camionerId = 12;
UPDATE camioner
	SET data_neixement = '14-01-1999'
	WHERE camionerId = 13;

-- EX 5
UPDATE paquet SET provencaId = 1;

-- EX 6
--Poner a null las ref al camionero 10 o eliminarlas.
--OOOooooooo modificar las fk a camionero con un ON DELETE SET NULL
-- ON DELETE SET NULL en las tablas condueix y paquet

DELETE FROM camioner
	WHERE camionerId = 10;

-- EX 7
/*
DROP TABLE camioner CASCADE CONSTRAINTS PURGE;
DROP TABLE provenca CASCADE CONSTRAINTS PURGE;
DROP TABLE paquet CASCADE CONSTRAINTS PURGE;
DROP TABLE camio CASCADE CONSTRAINTS PURGE;
DROP TABLE condueix CASCADE CONSTRAINTS PURGE;
*/

--SELECT de las tablas

SELECT * FROM camioner;
SELECT * FROM provenca;
SELECT * FROM paquet;
SELECT * FROM camio;
SELECT * FROM condueix;










