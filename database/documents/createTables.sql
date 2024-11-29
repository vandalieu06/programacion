/* CLASSE 1 - CREAR TABLAS */

-- 1. CREACION TABLA con CONTRAINS DIRECTA "ABREVIADAS"
CREATE TABLE orca(
    idOrca              NUMBER PRIMARY KEY,
    nombre              VARCHAR2(100) NOT NULL,
    peso                NUMBER,
    fecha_nacimineto    DATE
);

-- 2. CREACION TABLA CON CONSTRAINS PERSONALIZADAS
CREATE TABLE pinguino(
    idPinguino  NUMBER,
    nombre      VARCHAR2(100),
    peso        NUMBER,
    altura      NUMBER,
    fecha_nacimiento       DATE,
    idOrca      NUMBER,
    CONSTRAINT  pk_pinguino PRIMARY KEY (idPinguino),
    CONSTRAINT  fk_pinguino_orca FOREIGN KEY (idOrca) REFERENCES ORCA(idOrca),
    CONSTRAINT  uk_pingu_nombre UNIQUE (nombre),
    CONSTRAINT  ck_pingu_peso CHECK (peso > 0),
    CONSTRAINT  ck_pingu_nombre CHECK (nombre IS NOT NULL) -- IS --> es igual a == y IS NOT NULL es igual a !=
);

-- 3. ELIMINACION DE TABLAS
CREATE TABLE cueva(
    idCueva NUMBER,
    numero  NUMBER,
    tamany    NUMBER,
    CONSTRAINT  pk_cova PRIMARY KEY (idCueva)
);


-- 4. ELIMINACION DE TABLAS
DROP TABLE pinguino CASCADE CONSTRAINTS PURGE; -- ELIMINAR UNA TABLA SIN QUE ESTE EN LA PAPELERA
DROP TABLE orca CASCADE CONSTRAINTS PURGE;
DROP TABLE cueva CASCADE CONSTRAINTS PURGE;

-- APUNTS AL DML (PPT9)
/*
    TIPOS DE INSTRUCCIONES
        - INSERT - Insertar datos 
        - UPDATE - Mofificar datos
        - DELATE - Eliminar datos
*/
/* INSERTAR DATOS
    -- Opcion 1 (Infromar TODAS las columnas en el orden correcto)
    INSERT INTO tabla
        VALUES val_col1, val_col2 [,...];
    -- Opcion 2 (No hace falta TODAS las columnas)
    INSERT INTO tabla (col1, col2 [,...])
        VALUES val_col1, val_col2 [,...];
*/
--PINGUINOS
INSERT INTO pinguino 
    VALUES (1, 'Alex', 20,1.0,'13/07/2009',null);
SELECT * FROM pinguino;

INSERT INTO pinguino (idPinguino, nombre, peso, altura, fecha_nacimiento)
    VALUES (3, 'Black', 12, 0.5,'20/03/2001');
INSERT INTO pinguino (idPinguino, nombre, peso, idOrca)
    VALUES (10, 'Will', 50, 1);

-- ORCAS    
INSERT INTO orca (idOrca, nombre, peso, fecha_nacimineto)
    VALUES (1, 'Willy', 320.5, '13/02/2000');
COMMIT;
ROLLBACK;

-- CUEVA

-- EXTRA : 
/*
    guardar cambios - COMMIT;
    deshacer cambios DML - ROLLBACK;
    mostrar datos SELECT * FROM tabla;
*/

SELECT * FROM pinguino;
SELECT * FROM orca;

/* MODIFICAR DATOS
    UPDATE nombre_tabla
    SET columna = valor [, colx = valorx,...]
    WHERE condiciones;
*/
-- SImulacion de update malo
UPDATE pinguino
    SET peso = 20;

    













