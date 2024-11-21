DROP TABLE taula CASCADE CONSTRAINTS PURGE;
DROP TABLE elf CASCADE CONSTRAINTS PURGE;
DROP TABLE joguines CASCADE CONSTRAINTS PURGE;


/*CREACION DE LA TABLAS*/
CREATE TABLE taula (
	taulaId		NUMBER,
	codi 		VARCHAR(20),
	nom			VARCHAR(30),
	dimensions	NUMBER,
	tipus		VARCHAR(20),
	categoria	VARCHAR(2),

	CONSTRAINT pk_id_taula PRIMARY KEY (taulaId),
	CONSTRAINT uk_codi_taula UNIQUE(codi),
	CONSTRAINT ck_categoria_taula CHECK (categoria IN ('A', 'B', 'C', 'D'))
);

CREATE TABLE elf (
	elfId			NUMBER,
	taulaId			NUMBER,
	responsableId	NUMBER,
	nom				VARCHAR(20),
	alzada			NUMBER,
	pes				NUMBER,
	color_preferit	VARCHAR(20),
	categoria		VARCHAR(20),

	CONSTRAINT pk_id_elf PRIMARY KEY (elfId),
	CONSTRAINT fk_id_taula_elf FOREIGN KEY (taulaId) REFERENCES taula(taulaId),
	CONSTRAINT fk_id_responsable_elf FOREIGN KEY (responsableId) REFERENCES elf(elfId),
	CONSTRAINT ck_nom_elf CHECK (nom IS NOT NULL),
	CONSTRAINT ck_categoria_elf CHECK (categoria IN ('A', 'B', 'C', 'D'))
);

CREATE TABLE joguines (
	joguinesId		NUMBER,
	taulaId			NUMBER,
	nom				VARCHAR(20),
	pes				NUMBER,
	temps_fabrica	NUMBER,
	descripcio		VARCHAR(100),

	CONSTRAINT pk_id_joguines PRIMARY KEY (joguinesId),
	CONSTRAINT fk_id_taula_joguines FOREIGN KEY (taulaId) REFERENCES taula(taulaId)
);

/*INSERT DE DATOS EN LAS TABLAS*/
/*TAULA*/
INSERT INTO taula (taulaId, codi, nom, dimensions, tipus, categoria)
	VALUES(1, 'taula1', 'InfoTaula', 10, 'Info', 'A');
INSERT INTO taula (taulaId, codi, nom, dimensions, tipus, categoria)
	VALUES(2, 'taula2', 'LA Taula', 20, 'Fusta', 'A');
INSERT INTO taula (taulaId, codi, nom, dimensions, tipus, categoria)
	VALUES(3, 'taula3', 'MecaTaula', 15, 'Mecànic', 'B');
INSERT INTO taula (taulaId, codi, nom, dimensions, tipus, categoria)
	VALUES(4, 'taula4', 'WonkaTab', 10, 'Dolç', 'B');
INSERT INTO taula (taulaId, codi, nom, dimensions, tipus, categoria)
	VALUES(5, 'taula5', 'MiniMeca', 10, 'Mecanic', 'C');
INSERT INTO taula (taulaId, codi, nom, dimensions, tipus, categoria)
	VALUES(6, 'taula6', 'La mini taula', 5, 'Fusta', 'C');
INSERT INTO taula (taulaId, codi, nom, dimensions, tipus, categoria)
	VALUES(7, 'taula7', 'SntaTrex', 25, 'Textil', 'C');

/*ELF*/
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (1, 1, 'Gelbin', 0.6, 10, 'Verd', 'A');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (2, 2, 'Sicco', 0.7, 8,'Groc', 'A');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (3, 2, 'Erbag', 0.65, 12, 'Vermell', 'A');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (4, 3, 'Indus', 0.8, 10, 'Vermell', 'A');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (5, 3, 'Silas', 0.7, 9, 'Blau', 'B');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (6, 5, 'Wilfred', 0.6, 8, 'Blanc', 'B');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (7, 7, 'Linken',0.45, 9, 'Taronja', 'C');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (8, 7, 'Narain', 0.78, 10, 'Blau', 'B');
INSERT INTO elf (elfId, taulaId, nom, alzada, pes, color_preferit, categoria)
	VALUES (9, 7, 'Tsohley', 0.69, 11, 'Vermell', 'A');

/*JOGUINES*/
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (1, 1, 'PCToy', 2, 60, 'Pc molón');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (2, 1, 'GamePad', 0.9, 50, 'Tablet per no estudiar');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (3, 2, 'Soldat', 0.2, 5, 'Soldadet de fusta');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (4, 3, 'Ironman', 0.3, 3, 'Joguina d’acció');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (5, 4, 'Piruleta', 0.07, 1, 'Sabor cirera');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (6, 4, 'Carbó', 0.05, 1, 'De sucre');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (7, 4, 'Emanems', 0.01, 1, 'De tots colors');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (8, 5, 'Rayo mcqueen', 0.2, 6, 'Cachao!');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (9, 6, 'Jenga', 0.9, 8, '50 peces');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (10, 6, 'LegoWood', 0.8, 6, 'Inflamable');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (11, 7, 'Samarreta', 0.1, 4, 'Suuuper molona');
INSERT INTO joguines (joguinesId, taulaId, nom, pes, temps_fabrica, descripcio)
	VALUES (12, 7, 'Mitjons', 0.08, 2, 'Vermells, molt vermells');


/*SELECT */
SELECT * FROM taula;
SELECT * FROM elf;
SELECT * FROM joguines;


/*MODICAR RESPONSABLES TABLA ELFOS*/
UPDATE elf SET responsableId = 2 WHERE elfId IN (2, 3);
UPDATE elf SET responsableId = 3 WHERE elfId IN (4, 5);
UPDATE elf SET responsableId = 4 WHERE elfId IN (6, 7);
UPDATE elf SET responsableId = 5 WHERE elfId IN (8, 9);


-- Canvia la categoria de les taules 3,5 i 7 perquè siguin de categoria D.
UPDATE taula SET categoria = 'D' WHERE taulaId IN (2, 5, 7);

-- Canvia el pes de l’elf “Silas” a 11.
UPDATE elf SET pes = 11 WHERE elfID = 5;

-- Modifica la joguina d’Ironman perquè es fabriqui a la taula5.
UPDATE joguines SET taulaId = 5 WHERE joguinesId = 4;

-- Modifica la joguina LegoWood perquè pesi 1.2, el temps de fabricació sigui de 4 i la descripció sigui “De fusta i inflamable”.
UPDATE joguines SET pes = 1.2, temps_fabrica = 4, descripcio = 'De fusta i inflamable' WHERE joguinesId = 10;

-- Elimina la joguina “mitjons”.
SELECT joguinesId FROM joguines WHERE nom = 'Mitjons';
DELETE FROM joguines WHERE joguinesId= 12;

-- Elimina a l’elf “Narain”.
SELECT elfId FROM elf WHERE nom = 'Narain';
DELETE FROM elf WHERE elfId = 8;

-- Elimina a l’elf “Gelbin”. Si no pots, modifica la foregin key de responsable per aplicar un “on delete set null”.
-- > Torna a provar-ho i mira que ha passat amb els elfs que tenien a Gelbin de responsable.
SELECT elfid FROM elf WHERE nom = 'Gelbin';
DELETE FROM elf WHERE elfId = 1;


-- Elimina la taula 7 de fabricació. Si no pots, modifica la foreign key de joguines a taules per aplicar un “on delete cascade”.
-- > Torna a provar-ho i mira que ha passat amb la joguina “Samarreta”.
ALTER TABLE joguines DROP CONSTRAINT fk_id_taula_joguines;
ALTER TABLE joguines ADD CONSTRAINT fk_id_taula_joguines FOREIGN KEY (taulaId) REFERENCES taula(taulaId) ON DELETE SET NULL;
ALTER TABLE elf DROP CONSTRAINT fk_id_taula_elf;
ALTER TABLE elf ADD CONSTRAINT fk_id_taula_elf FOREIGN KEY (taulaId) REFERENCES taula(taulaId) ON DELETE SET NULL;


SELECT taulaId FROM taula WHERE codi = 'taula7';
DELETE FROM taula WHERE taulaId = 7;

-- Llista d’elfs: nom, color preferit i categoria
-- > Les columnes han de tenir el mateix nom que es demana a l’enunciat.
SELECT nom, color_preferit, categoria FROM elf;

-- Elfs amb Responsable.
SELECT * FROM elf WHERE responsableId IS NOT NULl;

-- Elfs sense Responsable.
SELECT * FROM elf WHERE responsableId IS NULL;

-- Elfs que pesen més de 9 Quilos.
SELECT * FROM elf WHERE pes > 9;

-- Elfs que mesuren entre 0,6 i 0,7 metres d’alçada.
SELECT * FROM elf WHERE pes > 0.6 AND pes < 0.7;

-- Taules de categoria B i C.
SELECT * FROM taula WHERE categoria IN ('B', 'C');

-- Joguines que pesen menys de 0,5 quilos.
SELECT * FROM joguines WHERE pes < 0.5;

-- Joguines que triguen més de 8 minuts a ser fabricades.
SELECT * FROM joguines WHERE temps_fabrica > 8;

-- En una sola columna ha d’aparèixer la frase.
-- > La taula <nom> mesura <dimensions> metres quadrats i és de categoria <categoria>.
-- > La columna ha de tenir el nom “taules”.
SELECT 'La taula ' || nom || ' mesura ' || dimensions || ' metres quadrats i es de categoria ' || categoria AS taules FROM taula;

-- Elfs de categoria A i C.
SELECT * FROM elf WHERE categoria IN ('A', 'C');
