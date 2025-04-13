/*
	Enunciado: Eres el encargado de crear la base de datos para una biblioteca que gestiona 
  contenido de anime y manga. Define las tablas necesarias y sus relaciones para almacenar 
  la siguiente información:
  
	- Usuarios: Las personas que acceden a la biblioteca para consultar contenido.
    	id (clave primaria, entero).
			nombre (texto, no nulo).
      email (texto, único, no nulo).
      fecha_registro (fecha).
	- Contenido: Anime y manga disponibles en la biblioteca.
			id (clave primaria, entero).
      titulo (texto, no nulo).
      tipo (texto, valores posibles: 'anime', 'manga').
      autor (texto, no nulo).
      genero (texto).
      fecha_lanzamiento (fecha).

	- Valoraciones: Opiniones de los usuarios sobre el contenido.
			id (clave primaria, entero).
      usuario_id (entero, clave foránea hacia la tabla Usuarios).
      contenido_id (entero, clave foránea hacia la tabla Contenido).
      puntuacion (entero, del 1 al 10).
      comentario (texto).
      fecha_valoracion (fecha, no nula).

	- Progreso de Visualización: Registra qué contenido ha visto un usuario.
			id (clave primaria, entero).
      usuario_id (entero, clave foránea hacia la tabla Usuarios).
      contenido_id (entero, clave foránea hacia la tabla Contenido).
      estado (texto, valores posibles: 'pendiente', 'en progreso', 'completado').
      fecha_ultima_actualizacion (fecha).

	Tareas: Escribe las instrucciones SQL para crear las tablas descritas arriba, 
  asegurando que las claves foráneas sean configuradas correctamente.

  Agrega restricciones como:
		- tipo debe aceptar solo los valores 'anime' o 'manga'.
    - estado debe aceptar solo los valores 'pendiente', 'en progreso' o 'completado'.
    - puntuacion debe estar en el rango 1-10.  
*/

-- DROP TABLES

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS content;
DROP TABLE IF EXISTS raiting;
DROP TABLE IF EXISTS visualisation;


-- CREATE TABLES
CREATE TABLE users(
	id_user 		INTEGER,
  first_name	TEXT,
  email				TEXT,
  hire_date		TEXT,
  
  CONSTRAINT pk_id_user PRIMARY KEY (id_user),
  CONSTRAINT ck_first_name_users CHECK (first_name IS NOT NULL),
  CONSTRAINT ck_email_users CHECK (email IS NOT NULL),
  CONSTRAINT uk_email_users UNIQUE(email),
  CONSTRAINT ck_hire_date_users CHECK (hire_date IS NOT NULL)  
);

CREATE TABLE content (
	id_content 		INTEGER,
  title					TEXT,
  type					TEXT,
	author				TEXT,
  genre					TEXT,
  release_date	TEXT,
  
  CONSTRAINT pk_id_content PRIMARY KEY(id_content),
  CONSTRAINT ck_title_content CHECK(title IS NOT NULL),
  CONSTRAINT ck_type_content CHECK(type IS NOT NULL AND type IN ('anime', 'manga')),
  CONSTRAINT ck_author_content CHECK(author IS NOT NULL)
);

CREATE TABLE raiting(
	id_raiting			INTEGER,
  id_user					INTEGER,
  id_content			INTEGER,
  score						INTEGER,
  comment					TEXT,
  raiting_date		TEXT,
  
  CONSTRAINT pk_id_raiting PRIMARY KEY(id_raiting),
  CONSTRAINT fk_id_user_raiting FOREIGN KEY(id_user) REFERENCES users(id_user),
  CONSTRAINT fk_id_content_raiting FOREIGN KEY(id_content) REFERENCES content(id_content),
  CONSTRAINT ck_score_raiting CHECK(score >= 1 AND score <= 10),
  CONSTRAINT ck_raiting_date CHECK(raiting_date)
  
);

CREATE TABLE visualisation(
	id_visualisation		INTEGER,
  id_user 						INTEGER,
  id_content					INTEGER,
  state								TEXT,
  last_date						TEXT,
  
  CONSTRAINT pk_id_visualisation PRIMARY KEY(id_visualisation),
  CONSTRAINT fk_id_user_visualisation FOREIGN KEY(id_user) REFERENCES users(id_user) ON DELETE SET NULL,
  CONSTRAINT fk_id_content_visualisation FOREIGN KEY(id_content) REFERENCES content(id_content) ON DELETE SET NULL,
  CONSTRAINT ck_state_visualisation CHECK(state IN ('pendiente', 'en progreso', 'completado'))
);

/*
Inserta los siguientes datos de ejemplo:
		- Usuario: Nombre "Juan", Email "juan@example.com", registrado el 2025-01-01.
    - Contenido: Título "Naruto", tipo "anime", autor "Masashi Kishimoto", género "Shounen", lanzamiento el 2002-10-03.
    - Valoración: Usuario Juan, Contenido Naruto, puntuación 9, comentario "¡Muy emocionante!".
    - Progreso: Usuario Juan, Contenido Naruto, estado "en progreso", actualizado el 2025-01-20.
	
  Consulta: Escribe una consulta para obtener todos los usuarios que hayan valorado contenido con una puntuación mayor a 8.
*/

-- INSERTS

INSERT INTO users(first_name, email, hire_date)
	VALUES ('Juan', 'juan@example.com', '2025-01-01');

SELECT * FROM users;
SELECT date(hire_date) FROM 
