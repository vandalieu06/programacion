-- CREATE USER
CREATE USER vaca IDENTIFIED BY 1234;

-- DICTIONARY
SELECT * FROM DBA_USERS;

-- DELETE USER
DROP USER vaca;

-- GIve permissions SYSTEM for connect
GRANT create session TO vaca;
GRANT create table TO vaca;
GRANT create view TO vaca WITH ADMIN OPTION;

-- DICTONARY - Consult before privilegies
SELECT * FROM DBA_USERS WHERE user = 'VACA';
SELECT * FROM dba_sys_privs WHERE GRANTEE = 'VACA'; 

-- CREATE ROL
CREATE ROLE animales;

-- GIVE PRIVS ROL
GRANT insert ON hr.employees TO animales;
GRANT delete ON hr.employees TO animales; 
GRANT update(salary) ON hr.employees TO animales; 

-- LIST ROLES
SELECT * FROM dba_roles WHERE role = 'ANIMALES'; 
SELECT * FROM dba_tab_privs WHERE grantee = 'ANIMALES'; 
SELECT * FROM dba_col_privs WHERE grantee = 'ANIMALES'; 

-- CREATE USER
CREATE USER conejo IDENTIFIED BY 1234;
GRANT animales TO conejo;
SELECT * FROM ROLE_SYS_PRIVS WHERE privilege = 'CREATE SESSION';
GRANT connect TO conejo;
SELECT * FROM DBA_ROLE_PRIVS WHERE grantee = 'CONEJO';
UPDATE hr.employees SET salary = 1000 WHERE employee_id = 1000;
SELECT * FROM hr.employees;

-- REVOKE
REVOKE animales FROM conejo;
REVOKE select ON hr.employees FROM animales;