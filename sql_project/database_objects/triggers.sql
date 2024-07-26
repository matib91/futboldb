USE futboldb;

-- TRIGGER : after_insert_trigger
-- Registra la inserción de un nuevo jugador en la tabla log_nuevos_registros
-- Tabla afectada: Jugadores
-- Acción : Insert
-- Información registrada : fecha, id_jugador,nombre, apellido, equipo_id, usuario que realiza la inserción.
-- Ejemplo : Se inserta un  nuevo jugador y el trigger registra la acción en la tabla log_nuevos_registros con los detalles .


-- Creamos la tabla donde se registrarán las nuevas inserciones

CREATE TABLE log_nuevos_registros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_jugador INT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    equipo_id INT,
    usuario VARCHAR(255)
);


-- Creamos el TRIGGER 

DELIMITER //

CREATE TRIGGER after_insert_trigger
AFTER INSERT ON jugadores
FOR EACH ROW
BEGIN
    DECLARE usuario_actual VARCHAR(255);
    SET usuario_actual = CURRENT_USER();
    
    INSERT INTO log_nuevos_registros (id_jugador, nombre, apellido, equipo_id, usuario)
    VALUES (NEW.jugador_id, NEW.nombre, NEW.apellido, NEW.equipo_id, usuario_actual);
END //

DELIMITER ;



-- Realizamos la inserción de un nuevo registro en la tabla Jugadores y corroboramos que quede asentado en la tabla log_nuevos_registros gracias al trigger.

INSERT INTO jugadores (nombre, apellido, equipo_id, pais_id, posicion, fecha_nac, altura, peso, pierna_habil)
VALUES ('Agustín', 'Ruberto', 1, 1, 'Delantero', '2006-01-14', 1.80, 74.00, 'Derecha');

-- Revisamos el contenido de la nueva tabla log_nuevos_registros

SELECT * FROM log_nuevos_registros;



-- TRIGGER: before_insert_trigger
-- Este trigger está diseñado para ejecutarse antes de la operación de inserción (donde una incorrecta inserción de datos en la tabla jugadores como ser nombre y apellido todo en mayúsculas o
-- todo en minúscula lo convertirá al formato correspondiente).
-- Tabla afectada: Jugadores


-- Creamos el trigger

DELIMITER //

CREATE TRIGGER before_insert_trigger
BEFORE INSERT ON jugadores
FOR EACH ROW
BEGIN
    SET NEW.nombre = CONCAT(UPPER(SUBSTRING(NEW.nombre, 1, 1)), LOWER(SUBSTRING(NEW.nombre, 2)));
    SET NEW.apellido = CONCAT(UPPER(SUBSTRING(NEW.apellido, 1, 1)), LOWER(SUBSTRING(NEW.apellido, 2)));
END //

DELIMITER ;

-- Probamos el funcionamiento mediante la inserción de 2 nuevos jugadores, uno con nombre y apellido todo en mayúsculas y el restante en minúscula.alter

INSERT INTO jugadores (nombre, apellido, equipo_id, pais_id, posicion, fecha_nac, altura, peso, pierna_habil) 
VALUES ('LUCAS', 'BERMUDEZ', 2, 2, 'Defensor', '1989-08-05', 1.87, 83.00, 'Derecha');


INSERT INTO jugadores (nombre, apellido, equipo_id, pais_id, posicion, fecha_nac, altura, peso, pierna_habil) 
VALUES ('juan', 'rodriguez', 5, 3, 'Portero', '1988-02-07', 1.95, 83.00, 'Derecha');

-- Chequeamos en la tabla jugadores 
SELECT * 
FROM jugadores;

-- Corroboramos también en la tabla que almacena los nuevos registros.

SELECT *
FROM log_nuevos_registros;

