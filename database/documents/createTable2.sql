/*Comentario texto
multilinia*/
-- Comentario de texto, una linia

---- Creación tabla con constrains abreviadas----

CREATE TABLE orca(
    id_orca NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    peso    NUMBER,
    fecha_nacimiento    DATE
);

--- Creacion tabla con constrains personalizadas ---
CREATE TABLE pinguino(
    id_pinguino NUMBER,
    nombre    VARCHAR2(200),
    altura    NUMBER,
    peso      NUMBER,
    fecha_nacimiento DATE,
    id_orca NUMBER,
    -- Se definen restricciones, cada una de ellas se le asignara un nombre para identificarlas y luego ya se dira que hacen --
    CONSTRAINT pk_pinguino PRIMARY KEY (id_pinguino), -- Le esta creando una restricción, para que id_pinguino sea la primary key de la tabla pinguino. Se hace con restriccion, porque luego a nivel de gestion es mas sencillo--
    CONSTRAINT fk_pinguino_orca FOREIGN KEY (id_orca) REFERENCES ORCA(id_orca), -- Restriccion, que id_orca situada en tabla pinguino, hara referencia a id_orca de la tabla orca --
    CONSTRAINT uk_pingu_nombre  UNIQUE (nombre),-- Le esta creando una restricción, para que el nombre sea de tipo unico, es decir que no haya ningun otro igual --
    CONSTRAINT ck_pingu_peso CHECK (peso > 0), -- Para comprovar que peso es mayor que 0 --
    CONSTRAINT ck_pingu_nombre CHECK (nombre IS NOT NULL) -- Para mirar que no este vacio, se puede hacer como arriba o con un check --
);

CREATE TABLE cueva(
    id_cueva      NUMBER,
    numero        NUMBER,
    dimensiones   NUMBER,
    CONSTRAINT pk_cueva PRIMARY KEY (id_cueva)
);

CREATE TABLE pingu_cueva(
    id_pingu_cueva  NUMBER,
    fecha_e         DATE,
    fecha_s         DATE,
    id_pinguino     NUMBER,
    id_cueva        NUMBER,

    CONSTRAINT pk_pi_cu PRIMARY KEY (id_pingu_cueva),
    CONSTRAINT fk_pi_cu_pinguino FOREIGN KEY (id_pinguino) REFERENCES PINGUINO (id_pinguino),
    CONSTRAINT fk_pi_cu_cueva FOREIGN KEY (id_cueva) REFERENCES CUEVA (id_cueva)
);

-- Eliminación de tablas --
DROP TABLE pinguino CASCADE CONSTRAINTS PURGE; -- El cascade es para que se eliminen las foren key que apuntan a la tabla, el purgue es para que no se quede en la papelera --
DROP TABLE orca CASCADE CONSTRAINTS PURGE;
DROP TABLE cueva CASCADE CONSTRAINTS PURGE;
DROP TABLE pingu_cueva CASCADE CONSTRAINTS PURGE;


-- Modificar tablas (ALTER)  --
-- ALTER TABLE nombre_tabla MODIFICADORES --
-- Añadir columna SEXO a PINGUINO --
ALTER TABLE pinguino ADD sexo VARCHAR2(1);

-- Modificar amaño (o tipo) de la columna SEXO --
ALTER TABLE pinguino MODIFY sexo VARCHAR2(9);

-- Añadir condiciones de SEXO pinguino  NOT NULL --
ALTER TABLE pinguino ADD CONSTRAINT ck_pinguino_sexo CHECK (sexo IS NOT NULL);

-- Verificar que el valor del sexo sea masculino o femenino --
ALTER TABLE pinguino ADD CONSTRAINT ck_pinguino_sexo2 CHECK (sexo = 'MASCULINO' OR sexo = 'FEMENINO');
    -- Alternativa de la condicion anterior --
    -- CHECK    (sexo IN ('MASCULINO', 'FEMENINO' ) ); --

-- Eliminar una constraint (ck_pinguino_sexo) --
ALTER TABLE pinguino DROP CONSTRAINT ck_pinguino_sexo;

-- Eliminar columna sexo de pinguino --
ALTER TABLE pinguino DROP COLUMN sexo;

-- Renombrar columna PESO de PINGUINO a PES --
ALTER TABLE pinguino RENAME COLUMN peso TO pes;
