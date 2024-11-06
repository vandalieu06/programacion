-- PASO 1
CREATE TABLE camioner(
    camionerId  NUMBER,
    dni         NUMBER,
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
-- PASO 2
CREATE TABLE provenca(
    provencaId  NUMBER,
    codi_postal NUMBER,
    nom         VARCHAR(50),

    CONSTRAINT pk_provenca_id PRIMARY KEY (provencaID)
);

-- PASO 3
CREATE TABLE paquet (
    paquetId    NUMBER,
    camionerId  NUMBER,
    provencaId    NUMBER,
    codi        NUMBER,
    descripcio  VARCHAR(200),
    destinatari VARCHAR(100),
    adreca      VARCHAR(200),
    
    CONSTRAINT pk_paquet_id PRIMARY KEY (paquetId),
    CONSTRAINT fk_camioner_id FOREIGN KEY (camionerId) REFERENCES camioner(camionerId),
    CONSTRAINT fk_provenca_id FOREIGN KEY (provencaId) REFERENCES provenca(provencaId)
);

--PASO 4

CREATE TABLE CAMIO(
    camioId     NUMBER,
    matricula   VARCHAR(10),
    camioModel  VARCHAR(50),
    tipus       VARCHAR(50),
    potencia    VARCHAR(50),
    
    CONSTRAINT pk_camio_id PRIMARY KEY (camioId),
    CONSTRAINT uk_matricula UNIQUE (matricula) 
);

-- PASO 5
CREATE TABLE condueix(
    condueixId  NUMBER,
    camioId     NUMBER,
    camionerId  NUMBER,
    fecha       DATE,
    
    CONSTRAINT pk_condueix_id PRIMARY KEY (condueixId),
    CONSTRAINT fk_camio_id FOREIGN KEY (camioId) REFERENCES camio(camioId),
    CONSTRAINT fk_camioner_id FOREIGN KEY (camionerId) REFERENCES camioner(camionerId)

);