USE mysql;


-- Generación superusuario: con todos los permisos para todas las bases disponibles.

DROP USER 'super_admin'@'%';

CREATE USER IF NOT EXISTS 'super_admin'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON *.* TO 'super_admin'@'%' WITH GRANT OPTION;

ALTER USER 'super_admin'@'%' IDENTIFIED BY 'admin2024'
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LOCK_TIME 1;

FLUSH PRIVILEGES;

-- Creación de un usuario con todos los permisos, excepto el de creación de usuarios, para la base futboldb

DROP USER 'admin_futboldb'@'%';

CREATE USER IF NOT EXISTS 'admin_futboldb'@'%' IDENTIFIED BY 'futbol123';
GRANT ALL PRIVILEGES ON futboldb.* TO 'admin_futboldb'@'%';

FLUSH PRIVILEGES;


-- Creación de roles

USE futboldb;

DROP ROLE IF EXISTS role_select_tablas;
DROP ROLE IF EXISTS role_crud_futbol;

-- Otorgamos permisos de visualización de todas las tablas y vistas de la base de datos

CREATE ROLE role_select_tablas ;

GRANT SELECT ON futboldb.* TO role_select_tablas;
GRANT SELECT ON futboldb.view_cantidad_jugadores_equipo TO role_select_tablas;
GRANT SELECT ON futboldb.view_goleadores_liga_argentina TO role_select_tablas;
GRANT SELECT ON futboldb.view_jugadores_lazio TO role_select_tablas;
GRANT SELECT ON futboldb.view_promedio_edad_altura_peso_posicion TO role_select_tablas;
GRANT SELECT ON futboldb.view_punteros_distintas_ligas TO role_select_tablas;


-- Otorgamos permisos de CRUD en tablas específicas

CREATE ROLE role_crud_futbol ;

GRANT SELECT, INSERT, UPDATE, DELETE ON futboldb.jugadores TO role_crud_futbol;
GRANT SELECT, INSERT, UPDATE, DELETE ON futboldb.estadisticas_jugador TO role_crud_futbol;
GRANT SELECT, INSERT, UPDATE, DELETE ON futboldb.partido TO role_crud_futbol;



 
-- Creación de usuarios y asignación de roles.

DROP USER IF EXISTS 'cuerpo_tecnico'@'%';
DROP USER IF EXISTS 'interno_club'@'%';

CREATE USER 'cuerpo_tecnico'@'%' IDENTIFIED BY '123';
CREATE USER 'interno_club'@'%' IDENTIFIED BY '456';


GRANT role_select_tablas TO 'cuerpo_tecnico'@'%' ;
GRANT role_crud_futbol TO 'interno_club'@'%';
 

SET DEFAULT ROLE role_select_tablas TO 'cuerpo_tecnico'@'%';
SET DEFAULT ROLE role_crud_futbol TO 'interno_club'@'%';

FLUSH PRIVILEGES ;



















