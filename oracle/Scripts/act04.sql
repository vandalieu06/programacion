/*Borra tablas*/
DROP TABLE linea CASCADE CONSTRAINTS PURGE;
DROP TABLE producte CASCADE CONSTRAINTS PURGE;
DROP TABLE stock CASCADE CONSTRAINTS PURGE;
DROP TABLE historial CASCADE CONSTRAINTS PURGE;
DROP TABLE comanda CASCADE CONSTRAINTS PURGE;

/*Creacion de tablas*/

CREATE TABLE linea (
    lineaId     NUMBER,
    codi        VARCHAR2(20),
    capacitatDiaria     NUMBER,
    estat       VARCHAR2(30),
    CONSTRAINT pk_linea_id PRIMARY KEY (lineaId)
);

CREATE TABLE producte(
    producteId      NUMBER,
    codi            VARCHAR2(10),
    nom             VARCHAR2(40),
    categoria       VARCHAR2(30),
    preuUnitari     NUMBER,
    CONSTRAINT pk_producte_id PRIMARY KEY(producteId)
);

CREATE TABLE stock (
    stockId         NUMBER,
    tipusUnicorn    VARCHAR2(30),
    quantitat       NUMBER,
    descripcio      VARCHAR2(100),
    CONSTRAINT pk_stock_id PRIMARY KEY(stockId)

);

CREATE TABLE historial(
    historialId         NUMBER,
    lineaId             NUMBER,
    producteId          NUMBER,
    dataProduccio       DATE,
    quantitatGenerada   NUMBER,
    CONSTRAINT pk_historial_id PRIMARY KEY (historialId),
    CONSTRAINT fk_historial_liniea_id FOREIGN KEY (lineaId) REFERENCES linea(lineaID) ON DELETE SET NULL,
    CONSTRAINT fk_historial_producte_id FOREIGN KEY (producteId) REFERENCES producte(producteId) ON DELETE SET NULL
);

CREATE TABLE comanda(
    comandaId               NUMBER,
    stockId                 NUMBER,
    dataComanda              DATE,
    quantitatSolicitada     NUMBER,
    CONSTRAINT pk_comanda_id PRIMARY KEY (comandaId),
    CONSTRAINT fk_comanda_stock_id FOREIGN KEY (stockId) REFERENCES stock(stockId) ON DELETE SET NULL
);

/*Insertar datos Linea*/
INSERT INTO linea (lineaId, codi, capacitatDiaria, estat)
    VALUES (1, 'LP-001', 50, 'Operativa');
INSERT INTO linea (lineaId, codi, capacitatDiaria, estat)
    VALUES (2, 'LP-002', 30, 'En manteniment');
INSERT INTO linea (lineaId, codi, capacitatDiaria, estat)
    VALUES (3, 'LP-003', 40, 'En espera');

/*Insertar datos Stock*/
INSERT INTO stock (stockId, tipusUnicorn, quantitat, descripcio)
    VALUES(1, 'Unicorn Arc de Sant Martí', 15, 'Unicorns amb banyes brillants i poder de curació.');
INSERT INTO stock (stockId, tipusUnicorn, quantitat, descripcio)
    VALUES(2, 'Unicorn negre', 15, 'Unicorns de carn tendre i poder màgic ocult.');
INSERT INTO stock (stockId, tipusUnicorn, quantitat, descripcio)
    VALUES(3, 'Unicorn Celestial', 10, 'Unicorns amb ales que es poden usar en rituals.');
INSERT INTO stock (stockId, tipusUnicorn, quantitat, descripcio)
    VALUES(4, 'Unicorn Daurat', 5, 'Unicorns amb banyes d’or, ideals per a ornamentació.');

/*Insertar datos Productos*/
INSERT INTO producte (producteId, codi, nom, categoria)
    VALUES (1, 'P-001', 'Filets d''Unicorn', 'Carn');
INSERT INTO producte (producteId, codi, nom, categoria)
    VALUES (2, 'P-002', 'Banya Polida d''Unicorn', 'Adorn');
INSERT INTO producte (producteId, codi, nom, categoria)
    VALUES (3, 'P-003', 'Sopa Màgica d''Unicorn', 'Alimentació');
INSERT INTO producte (producteId, codi, nom, categoria)
    VALUES (4, 'P-004', 'Pols d''Unicorn', 'Ingredient Màgic');


/*Inseratdo datos con referencia
    - Inserir dues produccions de "Filets d'Unicorn". (Historial)
    - Inserir una producció de "Pols d'Unicorn". (Historial)
    - Inserir una comanda per a un "Unicorn Celestial".
    - Inserir una comanda per a un "Unicorn Daurat".
    - Inserir una comanda per a un "Unicorn Negre".
*/

/*Insert de Historial (Produccions)*/
INSERT INTO historial (historialId, lineaId, producteId, dataProduccio, quantitatGenerada)
    VALUES (1, 1, 1, '20-05-2022', 23);
INSERT INTO historial (historialId, lineaId, producteId, dataProduccio, quantitatGenerada)
    VALUES (2, 3, 1, '21-05-2022', 25);
INSERT INTO historial (historialId, lineaId, producteId, dataProduccio, quantitatGenerada)
    VALUES (3, 2, 4, '20-05-2022', 20);

/*Insertado de Comanda*/
INSERT INTO comanda (comandaId, stockId, dataComanda, quantitatSolicitada)
    VALUES (1, 3, '25-05-2022', 5);
INSERT INTO comanda (comandaId, stockId, dataComanda, quantitatSolicitada)
    VALUES (2, 4, '25-05-2022', 2);
INSERT INTO comanda (comandaId, stockId, dataComanda, quantitatSolicitada)
    VALUES (3, 2, '25-05-2022', 15);

/*Modificacio de dades
    - Incrementa en 20, la “capacitat diària” de producció de totes les línies.
    - Actualitza la quantitat de “Unicorn Celestial” a 51.
    - Modifica el codi de producte “P-004” per P-016”.
    - Assigna un preu_unitari per cada producte.
*/

UPDATE historial SET quantitatGenerada = quantitatGenerada + 20;
SELECT * FROM stock WHERE tipusUnicorn = 'Unicorn Celestial';
UPDATE stock SET quantitat = 51 WHERE stockID = 3;
SELECT * FROM producte WHERE codi = 'P-004';
UPDATE producte SET codi = 'P-016' WHERE producteId = 4;
UPDATE producte SET preuUnitari = 25 WHERE producteId IN (1, 3);
UPDATE producte SET preuUnitari = 20 WHERE producteId IN (2, 4);

/*MODIFICACIO DE TAULES*/
-- Afegir la columna Descripcio a la taula Línia de Producció.
ALTER TABLE historial ADD descripcio VARCHAR2(100);
SELECT * FROM historial;
-- Incrementar la longitud de la columna Codi a la taula.
ALTER TABLE producte MODIFY codi VARCHAR2(20);
-- Afegir una restricció perquè els codis de la taula Producte siguin únics.
ALTER TABLE producte ADD CONSTRAINT uk_producte_codi UNIQUE(codi);
-- Relacionar la taula Historial_Producció amb la taula Estoc_Unicorn mitjançant una clau forana.
ALTER TABLE historial ADD stockId NUMBER;
ALTER TABLE historial ADD CONSTRAINT pk_historial_stock_id FOREIGN KEY (stockId) REFERENCES stock(stockId) ON DELETE SET NULL;
-- Afegir una restricció CHECK per garantir que la columna Quantitat a la taula Estoc_Unicorn sigui sempre positiva.
ALTER TABLE stock ADD CONSTRAINT ck_stock_quantitat CHECK(quantitat > 0);
-- Eliminar la columna Categoria de la taula Producte.
ALTER TABLE producte DROP COLUMN categoria;
SELECT * FROM producte;
-- Renombrar la columna “Preu_unitari” de la taula Producte a “Preu”.
ALTER TABLE producte RENAME COLUMN preuUnitari TO  preu;
-- Afegir una columna a la taula Comanda_Unicorn amb un valor predeterminat que indiqui la data de creació.
ALTER TABLE comanda ADD dataCreacio DATE DEFAULT '12-06-2022';
SELECT * FROM comanda;
-- Afegir una restricció perquè els codis de LINIES siguin obligatoris.
ALTER TABLE linea ADD CONSTRAINT ck_linea_codi CHECK(codi IS NOT NULL);
-- Afegir una restricció perquè el PREU de PRODUCTE hagi d’estar entre 0 y 50000.
ALTER TABLE producte ADD CONSTRAINT ck_producte_preu CHECK(preu > 0 AND preu < 5000);
-- Afegir una restricció perquè l’estat de les LINIES només pugui ser “Operativa”, “En manteniment” o “En espera”.
ALTER TABLE linea ADD CONSTRAINT ck_linea_estat CHECK(estat IN ('Operativa', 'En manteniment', 'En espera'));
