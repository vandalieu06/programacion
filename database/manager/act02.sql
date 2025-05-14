-- 1. Crea un usuari anomenat ASIX amb els següents paràmetres:
--    • PASS: 1234
--    • TABLESPACE USERS
--    • QUOTA DE 700K
--    • TABLESPACE TEMPORAL TEMP
CREATE USER asix IDENTIFIED BY 1234 
DEFAULT TABLESPACE users 
QUOTA 700K ON users 
TEMPORARY TABLESPACE temp;

-- 2. Crea un rol anomenat BASIC_PRIVS que permeti:
--    • Connectar-se a la BBDD
--    • Crear objectes sobre el propi esquema.
CREATE ROLE basic_privs;
GRANT create session TO basic_privs;
GRANT create table, create view TO basic_privs;
-- SELECT * FROM dba_roles;
-- SELECT * FROM dba_sys_privs WHERE grantee = 'BASIC_PRIVS';

-- 3. Atorga a ASIX el rol BASIC_PRIVS
GRANT basic_privs TO asix;
-- SELECT username, granted_role FROM user_role_privs;
-- SELECT grantee, granted_role FROM dba_role_privs WHERE grantee = 'ASIX';

-- 4. Amb l'usuari ASIX, crea dues taules vinculades (Relació 1-N).
CONNECT ASIX/1234;
CREATE TABLE library (
  library_id   NUMBER,
  name         VARCHAR2(100),
  
  CONSTRAINT pk_library_id PRIMARY KEY (library_id)
);
CREATE TABLE book (
  book_id      NUMBER,
  title        VARCHAR2(100),
  author       VARCHAR2(100),
  library_id   NUMBER,

  CONSTRAINT pk_book_id PRIMARY KEY (book_id),
  CONSTRAINT fk_library_id FOREIGN KEY (library_id) REFERENCES library(library_id)
);

-- 5. Sobre les taules anteriors:
--    • Insereix dos registres sobre la taula principal.
--    • Insereix dos registres per cada registre anterior sobre la taula secundaria.
--    • Per exemple, sobre la BBDD HR seria
--      → 2 DEPARTAMENTS i 2 EMPLEATS a cada DEPARTAMENT
INSERT INTO asix.library (library_id, name) VALUES (1, 'Biblioteca Central');
INSERT INTO asix.library (library_id, name) VALUES (2, 'Biblioteca Nord');

INSERT INTO asix.book (book_id, title, author, library_id) VALUES (1, '1984', 'George Orwell', 1);
INSERT INTO asix.book (book_id, title, author, library_id) VALUES (2, 'Brave New World', 'Aldous Huxley', 1);

INSERT INTO asix.book (book_id, title, author, library_id) VALUES (3, 'Fahrenheit 451', 'Ray Bradbury', 2);
INSERT INTO asix.book (book_id, title, author, library_id) VALUES (4, 'The Giver', 'Lois Lowry', 2);

-- 6. Crea l'usuari SMX amb password 1234.
CREATE USER smx IDENTIFIED BY 1234;

-- 7. Dóna-li permisos per:
--    • Connectar-se.
--    • Crear vistes sobre ASIX.
--    • Seleccionar dades de les taules d'ASIX.
--    • Modificar 1 columna d'una de les taules creades a ASIX.
GRANT CREATE SESSION TO smx;
GRANT CREATE VIEW TO smx;

CONNECT ASIX/1234;
GRANT SELECT ON book TO smx;
GRANT SELECT ON library TO smx;
GRANT UPDATE(title) ON book TO smx;


-- 8. Des de l'usuari SMX crea una vista a l'esquema ASIX que mostri totes les dades de les
--    dues taules.
--    • Per exemple, sobre la BBDD HR seria
--      → Vista que mostri tota la informació dels empleats amb tota la informació del
--        seu departament.
CONNECT smx/1234;
CREATE VIEW vista_books_library AS
SELECT lib.library_id, lib.name AS library_name, bk.book_id, bk.title, bk.author
FROM asix.library lib
  JOIN asix.book bk ON lib.library_id = bk.library_id;

-- 9. Intenta seleccionar tota la informació de la nova vista amb l'usuari HR.
CONNECT hr/1234;
SELECT * FROM smx.vista_books_library; 

-- 10. Intenta seleccionar tota la informació de la nova vista amb l'usuari ASIX.
CONNECT asix/1234;
SELECT * FROM smx.vista_books_library;

-- 11. Intenta seleccionar tota la informació de la nova vista amb l'usuari SMX.
CONNECT smx/1234;
SELECT * FROM vista_books_library;

-- 12. Amb l'usuari SMX, comprova que pots modificar dades de la columna d'ASIX on té
--     permisos. I comprova que no pots modificar la resta de columnes.
CONNECT smx/1234;
UPDATE asix.book SET title = 'Nou Títol per Llibre 1' WHERE book_id = 1;
UPDATE asix.book SET author = 'Lorem' WHERE book_id = 1;
SELECT * FROM asix.book;

-- 13. Treu-li a SMX el permís per modificar la columna anterior, i comprova que ja no pots fer
--     modificacions.
CONNECT asix/1234;
REVOKE UPDATE ON book FROM smx;
CONNECT smx/1234;
UPDATE asix.book SET title = 'Nou Títol per Llibre 1' WHERE book_id = 1;
SELECT * FROM asix.book;


-- 14. Mostra les vistes de diccionari on es mostrin:
-- Els usuaris creats.
SELECT * FROM dba_users WHERE username IN ('ASIX', 'SMX');
-- Els rols creats.
SELECT * FROM dba_roles WHERE role = 'BASIC_PRIVS';
-- Els privilegis del/s rol/s creats.
SELECT * FROM dba_sys_privs WHERE grantee = 'BASIC_PRIVS';
-- Els privilegis dels usuaris creats.
SELECT * FROM dba_sys_privs WHERE grantee IN ('ASIX', 'SMX');
-- Els rols otorgats als usuaris creats.
SELECT * FROM dba_role_privs WHERE grantee IN ('ASIX', 'SMX');
