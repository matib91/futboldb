USE futboldb;

DROP PROCEDURE IF EXISTS ingreso_nuevo_jugador ;
DROP PROCEDURE IF EXISTS actualizar_equipo_jugador ;
DROP PROCEDURE IF EXISTS registrar_partido ;

-- SP: ingreso_nuevo_jugador : Inserta un nuevo jugador en la tabla jugadores utilizando los valores proporcionados como parámetros de entrada validando
-- si existe o no el pais, de lo contrario arrojará error.

DELIMITER //

CREATE PROCEDURE ingreso_nuevo_jugador(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_equipo_id INT,
    IN p_pais_id INT,
    IN p_posicion VARCHAR(50),
    IN p_fecha_nac DATE,
    IN p_altura DECIMAL(4,2),
    IN p_peso DECIMAL(5,2),
    IN p_pierna_habil VARCHAR(10)
)
BEGIN
    DECLARE equipo_existe INT;
    DECLARE pais_existe INT;
    DECLARE jugador_existe INT;

    -- Verificamos si el equipo existe
    SELECT COUNT(*) INTO equipo_existe FROM equipo WHERE equipo_id = p_equipo_id;
    IF equipo_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El equipo no existe.';
    END IF;

    -- Verificamos si el país existe
    SELECT COUNT(*) INTO pais_existe FROM pais WHERE pais_id = p_pais_id;
    IF pais_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El país no existe.';
    END IF;

    -- Verificamos si el jugador ya existe
    SELECT COUNT(*) INTO jugador_existe
    FROM jugadores
    WHERE nombre = p_nombre
      AND apellido = p_apellido
      AND fecha_nac = p_fecha_nac
      AND equipo_id = p_equipo_id;

    IF jugador_existe > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El jugador ya existe en la base de datos.';
    END IF;

    -- Insertamos el nuevo jugador si todas las validaciones pasan
    INSERT INTO jugadores (
        nombre,
        apellido,
        equipo_id,
        pais_id,
        posicion,
        fecha_nac,
        altura,
        peso,
        pierna_habil
    ) VALUES (
        p_nombre,
        p_apellido,
        p_equipo_id,
        p_pais_id,
        p_posicion,
        p_fecha_nac,
        p_altura,
        p_peso,
        p_pierna_habil
    );
END //

DELIMITER ;

-- SP : actualizar_equipo_jugador
-- El objetivo de la creación de este procedimiento es la actualización del equipo al que pertenece un jugador. Este SP será realmente útil en época de mercado
-- de pases donde los jugadores son transferidos de un equipo a otro

DELIMITER //

CREATE PROCEDURE actualizar_equipo_jugador(
    IN p_jugador_id INT,
    IN p_nuevo_equipo_id INT
)
BEGIN
    DECLARE jugador_existe INT;
    DECLARE equipo_existe INT;

    -- Verificamos si el jugador existe
    SELECT COUNT(*) INTO jugador_existe FROM jugadores WHERE jugador_id = p_jugador_id;
    IF jugador_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El jugador no existe.';
    END IF;

    -- Verificamos si el nuevo equipo existe
    SELECT COUNT(*) INTO equipo_existe FROM equipo WHERE equipo_id = p_nuevo_equipo_id;
    IF equipo_existe = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nuevo equipo no existe.';
    END IF;

    -- Actualizamos el equipo del jugador
    UPDATE jugadores
    SET equipo_id = p_nuevo_equipo_id
    WHERE jugador_id = p_jugador_id;
END //

DELIMITER ;


-- SP registrar_partido
-- Procedimiento almacenado diseñado para ingresar nuevos registros de partidos y que a su vez se actualiza las posiciones, es decir que si el equipo ganó le sume 3 puntos en la tabla posiciones,
-- si empató le sume 1 y si perdió no sume puntos
-- Nota: Utilizamos las funciones SUBSTRING_INDEX y CAST para extraer y convertir los goles del formato goles_local-goles_visitante.

DELIMITER //

CREATE PROCEDURE registrar_partido(
    IN p_fecha DATE,
    IN p_equipo_local_id INT,
    IN p_equipo_visitante_id INT,
    IN p_resultado VARCHAR(50),
    IN p_competencia_id INT
)
BEGIN
    DECLARE equipo_local_competencia_id INT;
    DECLARE equipo_visitante_competencia_id INT;
    DECLARE goles_local INT;
    DECLARE goles_visitante INT;
    DECLARE puntos_local INT DEFAULT 0;
    DECLARE puntos_visitante INT DEFAULT 0;

    -- Insertamos el nuevo partido
    INSERT INTO partido (fecha, equipo_local_id, equipo_visitante_id, resultado, competencia_id)
    VALUES (p_fecha, p_equipo_local_id, p_equipo_visitante_id, p_resultado, p_competencia_id);

    -- Obtenemos el equipo_competencia_id para el equipo local
    SELECT equipo_competencia_id INTO equipo_local_competencia_id
    FROM equipo_competencia
    WHERE equipo_id = p_equipo_local_id AND competencia_id = p_competencia_id;

    -- Obtenemos el equipo_competencia_id para el equipo visitante
    SELECT equipo_competencia_id INTO equipo_visitante_competencia_id
    FROM equipo_competencia
    WHERE equipo_id = p_equipo_visitante_id AND competencia_id = p_competencia_id;

    -- Extraemos los goles del resultado
    SET goles_local = CAST(SUBSTRING_INDEX(p_resultado, '-', 1) AS UNSIGNED);
    SET goles_visitante = CAST(SUBSTRING_INDEX(p_resultado, '-', -1) AS UNSIGNED);

    -- Determinamos los puntos a sumar en función del resultado
    IF goles_local > goles_visitante THEN
        SET puntos_local = 3;
        SET puntos_visitante = 0;
    ELSEIF goles_local < goles_visitante THEN
        SET puntos_local = 0;
        SET puntos_visitante = 3;
    ELSE
        SET puntos_local = 1;
        SET puntos_visitante = 1;
    END IF;

    -- Actualizamos puntos en la tabla posiciones para el equipo local
    UPDATE posiciones
    SET puntos = puntos + puntos_local
    WHERE equipo_competencia_id = equipo_local_competencia_id;

    -- Actualizamos puntos en la tabla posiciones para el equipo visitante
    UPDATE posiciones
    SET puntos = puntos + puntos_visitante
    WHERE equipo_competencia_id = equipo_visitante_competencia_id;
END //

DELIMITER ;



