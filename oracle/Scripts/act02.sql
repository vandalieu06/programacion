-- ELIMINAR TABLAS
/*
DROP TABLE suite CASCADE CONSTRAINTS PURGE;
DROP TABLE pollastre CASCADE CONSTRAINTS PURGE;
DROP TABLE tractament CASCADE CONSTRAINTS PURGE;
DROP TABLE reserva CASCADE CONSTRAINTS PURGE;
*/


-- CREAR TABLAS
CREATE TABLE suite (
	suiteId		NUMBER,
	codi 		VARCHAR(10),
	lloc		VARCHAR(50),
	tipus		VARCHAR(20),
	estat		VARCHAR(20),
	
	CONSTRAINT pk_suite_id PRIMARY KEY (suiteId),
	CONSTRAINT uk_suite_codi UNIQUE (codi)
	--CONSTdRAINT ck_estat CHECK (estat IN ('Lliure', 'Manteniment', 'Ocupat'))
);
CREATE TABLE pollastre(
	pollastreId		NUMBER,
	suiteId			NUMBER,
	codi			VARCHAR(10),
	nom				VARCHAR(30),
	data_naixement	DATE,
	sexe			VARCHAR(1),
	raza			VARCHAR(40),
	color			VARCHAR(20),
	
	CONSTRAINT pk_pollastre_id PRIMARY KEY(pollastreId),
	CONSTRAINT fk_pollastre_suite_id FOREIGN KEY (suiteId) REFERENCES SUITE(suiteId) ON DELETE SET NULL,
	CONSTRAINT uk_pollastre_codi UNIQUE(codi)
);

CREATE TABLE tractament(
	tractamentId	NUMBER,
	codi 			VARCHAR(10),
	nom				VARCHAR(50),
	durada			NUMBER,
	
	CONSTRAINT pk_tractament_id PRIMARY KEY(tractamentID),
	CONSTRAINT uk_tractament_codi UNIQUE(codi)
);

CREATE TABLE reserva(
	reservaId		NUMBER,
	pollastreId		NUMBER,
	tractamentId	NUMBER,
	data_reserva	DATE,
	
	CONSTRAINT pk_reserva_id PRIMARY KEY (reservaID),
	CONSTRAINT fk_reserva_pollastre_id FOREIGN KEY (pollastreId) REFERENCES POLLASTRE(pollastreId) ON DELETE SET NULL,
	CONSTRAINT fk_reserva_tractament_id FOREIGN KEY (tractamentId) REFERENCES TRACTAMENT(tractamentId) ON DELETE SET NULL	
);

-- INSERTAR DATOS
INSERT INTO suite (suiteid, codi, lloc, tipus, estat)
	VALUES (1, 'S413', 'Planta 4 Porta 13', 'Luxe', 'Lliure');
INSERT INTO suite (suiteid, codi, lloc, tipus, estat)
	VALUES (2, 'S112', 'Planta 1 Porta 12', 'Standard', 'Manteniment');
INSERT INTO suite (suiteid, codi, lloc, tipus, estat)
	VALUES (3, 'S532', 'Planta 5 Porta 32', 'Gran Luxe', 'Ocupada');

--Pollastre
INSERT INTO pollastre (pollastreId, suiteId, codi, nom, data_naixement, sexe, raza, color)
	VALUES (1, 1, 'XC2312', 'Leonidas', '25-04-2005', 'M', 'Combatiente Español', 'Blanc');
INSERT INTO pollastre (pollastreId, suiteId, codi, nom, data_naixement, sexe, raza, color)
	VALUES (2, 2, 'AB3256', 'Amaya', '12-03-2010', 'F', 'Euskal Oiloa', 'Marró');
INSERT INTO pollastre (pollastreId, suiteId, codi, nom, data_naixement, sexe, raza, color)
	VALUES (3, 3, '12BD32', 'Gazpacho', '10-10-2012', 'M', 'Sureña', 'Marró');
INSERT INTO pollastre (pollastreId, suiteId, codi, nom, data_naixement, sexe, raza, color)
	VALUES (4, 1, 'SP34MN', 'Cristina', '25-12-2014', 'F', 'Utrerana', 'Blau');

--Tractament
INSERT INTO tractament (tractamentId, codi, nom, durada)
	VALUES (1, 'T001', 'Neteja de plomes amb banys de sal', 15);
INSERT INTO tractament (tractamentId, codi, nom, durada)
	VALUES (2, 'T002', 'Massatge de xocolata', 45);
INSERT INTO tractament (tractamentId, codi, nom, durada)
	VALUES (3, 'T003', 'Massatge balinès', 45);
INSERT INTO tractament (tractamentId, codi, nom, durada)
	VALUES (4, 'T004', 'Massatge descontracturant', 30);

-- Reserva
INSERT INTO reserva (reservaId, pollastreId, tractamentId, data_reserva)
	VALUES (1, 1, 1, '29-11-2017');
INSERT INTO reserva (reservaId, pollastreId, tractamentId, data_reserva)
	VALUES (2, 3, 2, '30-11-2017');
INSERT INTO reserva (reservaId, pollastreId, tractamentId, data_reserva)
	VALUES (3, 2, 3, '30-11-2017');
INSERT INTO reserva (reservaId, pollastreId, tractamentId, data_reserva)
	VALUES (4, 1, 4, '02-12-2017');	


--UPDATE
UPDATE pollastre
	SET codi = 'ZP4512'
	WHERE pollastreId = 2;
UPDATE tractament 
	SET durada = 50
	WHERE tractamentId = 3;
UPDATE reserva
	SET data_reserva = '1-12-2017'
	WHERE tractamentId = 4;

--SELECT
SELECT * FROM suite;
SELECT * FROM pollastre;
SELECT * FROM tractament;
SELECT * FROM reserva;











