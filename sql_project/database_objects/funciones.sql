USE futboldb;

DROP FUNCTION IF EXISTS cantidad_jugadores_por_pais;
DROP FUNCTION IF EXISTS minutos_disputados_jugador;
DROP FUNCTION IF EXISTS edad_jugador;

-- FUNCIÓN: minutos_disputados_jugador
-- Función para conocer la cantidad de minutos disputados de un jugador X entre determinadas fechas. 

DELIMITER //

CREATE FUNCTION minutos_disputados_jugador(
    p_jugador_id INT,
    p_fecha_inicio DATE,
    p_fecha_fin DATE
) RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_minutos DECIMAL(10,2);

    SELECT SUM(ej.minutos_jugados) INTO total_minutos
    FROM estadisticas_jugador ej
    JOIN partido p ON ej.partido_id = p.partido_id
    WHERE ej.jugador_id = p_jugador_id
      AND p.fecha BETWEEN p_fecha_inicio AND p_fecha_fin;

    RETURN COALESCE(total_minutos, 0);
END //

DELIMITER ;


-- FUNCION cantidad_jugadores_por_pais
-- Función que calcula la cantidad de jugadores en la base de datos de acuerdo a un país al que pertenecen, 
-- y devuelve un mensaje en caso de que no haya jugadores de ese país.

DELIMITER //

CREATE FUNCTION cantidad_jugadores_por_pais(
    p_nombre_pais VARCHAR(255)
) RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE cantidad_jugadores INT;
    DECLARE mensaje VARCHAR(255);

    -- Verificamos si el país existe
    SELECT COUNT(*) INTO cantidad_jugadores
    FROM jugadores j
    JOIN pais p ON j.pais_id = p.pais_id
    WHERE p.nombre = p_nombre_pais;

    -- Preparamos el mensaje de salida
    IF cantidad_jugadores > 0 THEN
        SET mensaje = CONCAT('Cantidad de jugadores del país ', p_nombre_pais, ': ', cantidad_jugadores);
    ELSE
        SET mensaje = CONCAT('No hay datos de jugadores del país ', p_nombre_pais);
    END IF;

    RETURN mensaje;
END //

DELIMITER ;


-- FUNCIÓN edad_jugador
-- Esta función calculará la edad de un jugador en años pasandole como parámetros el nombre, apellido y club al que pertenece. 
-- Nota: Como fecha actual se utiliza el día 2023-06-01 (dado que es el último registro insertado en la base de datos de la temporada 2023). 
-- En caso que no haya coincidencias saldrá el mensaje: No se encontró el jugador o equipo especificado

DELIMITER //

CREATE FUNCTION edad_jugador(
    p_nombre VARCHAR(255),
    p_apellido VARCHAR(255),
    p_nombre_equipo VARCHAR(255)
) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE edad INT;
    DECLARE fecha_actual DATE;
    DECLARE contador INT;

    -- Usamos la fecha más reciente en la base de datos
    SET fecha_actual = '2023-06-01';

    -- Verificamos si hay coincidencias para el jugador y el equipo
    SELECT COUNT(*)
    INTO contador
    FROM jugadores j
    JOIN equipo e ON j.equipo_id = e.equipo_id
    WHERE j.nombre = p_nombre
      AND j.apellido = p_apellido
      AND e.nombre = p_nombre_equipo;

    -- Si no hay coincidencias, levanta un error
    IF contador = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró el jugador o el equipo especificado.';
    END IF;

    -- Calculamos la edad del jugador
    SELECT TIMESTAMPDIFF(YEAR, j.fecha_nac, fecha_actual) INTO edad
    FROM jugadores j
    JOIN equipo e ON j.equipo_id = e.equipo_id
    WHERE j.nombre = p_nombre
      AND j.apellido = p_apellido
      AND e.nombre = p_nombre_equipo;

    -- Devolvemos la edad del jugador
    RETURN edad;
END //

DELIMITER ;
