-- Active: 1745315382560@@127.0.0.1@1521@XE@SYSTEM
CREATE USER jv IDENTIFIED BY 1234;
SELECT * FROM dba_role_privs WHERE UPPER(grantee) = 'JV';
SELECT * FROM dba_roles;

--Asignar permisos a un usuario en uan tabla concreta
GRANT select ON hr.employees TO jv;
GRANT delete ON hr.employees TO jv;
GRANT alter ON hr.employees TO jv;
GRANT select ON hr.employees TO jv WITH GRANT OPTION; 
-- Permito que el usuario no solo tenga el permiso, sino que se lo pueda dar a otros usuarios.

SELECT * FROM dba_tab_privs WHERE UPPER(grantee) = 'JV';
REVOKE alter ON hr.employees FROM jv;

CREATE ROLE rol_alumne;
GRANT create table TO rolalumne;
CREATE ROLE rol_profe;
GRANT create table, alter any table, drop any table TO rol_profe;
DROP ROLE rol_alumne;
DROP ROLE rol_profe;
--
GRANT rol_alumne TO alumne01;
GRANT rol_profe TO profe01;
SELECT * FROM dba_sys_privs WHERE UPPER(grantee) IN ('ROL_ALUMNE', 'ROL_PROFE'); 
SELECT * FROM dba_tab_privs WHERE UPPER(grantee) IN ('ROL_ALUMNE', 'ROL_PROFE');
SELECT * FROM dba_col_privs WHERE UPPER(grantee) IN ('ROL_ALUMNE', 'ROL_PROFE'); -- EXTRA
GRANT update(salary) ON hr.employees TO rol_profe; -- EXTRA
REVOKE update ON hr.employees FROM rol_profe; -- EXTRA
