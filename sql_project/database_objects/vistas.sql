USE futboldb;

-- VISTA : view_jugadores_Lazio
-- Esta vista nos mostrará los jugadores que integran el plantel de Lazio, su posición y a qué país pertenecen

CREATE VIEW 
	futboldb.view_jugadores_Lazio AS 
SELECT 
		j.nombre
	,	j.apellido
    ,	j.posicion
    ,	p.nombre AS nacionalidad
FROM futboldb.jugadores AS j
JOIN futboldb.pais AS p
ON j.pais_id = p.pais_id
WHERE j.equipo_id = 14
ORDER BY posicion;


-- VISTA: view_cantidad_jugadores_equipo
-- Esta vista nos dará información acerca de la cantidad de jugadores que componen cada plantel y país al que pertenece dicho equipo presente en la base de datos

CREATE VIEW 
	futboldb.view_cantidad_jugadores_equipo AS
SELECT	
	e.nombre AS equipo
, 	p.nombre AS pais
,	COUNT(j.jugador_id) AS cantidad_jugadores
FROM futboldb.equipo AS e
LEFT JOIN futboldb.jugadores AS j
ON e.equipo_id = j.equipo_id
LEFT JOIN futboldb.ciudad AS c
ON e.ciudad_id = c.ciudad_id
LEFT JOIN futboldb.pais AS p
ON c.pais_id = p.pais_id
GROUP BY e.equipo_id, e.nombre, p.nombre
ORDER BY cantidad_jugadores DESC;
    


-- VISTA : view_promedio_edad_altura_peso_posicion
-- La creación de esta vista nos resulta útil para conocer los promedios de edad, peso y altura por posición con los que cuenta cada plantel
-- NOTA: Para el cálculo de la edad se toma en cuenta el día 23-06-01 para hacer el cálculo ya que la base de datos cuenta con partidos de este año.

CREATE VIEW
	futboldb.view_promedio_edad_altura_peso_posicion AS
SELECT
	e.nombre AS equipo
,	j.posicion
,	ROUND(AVG(TIMESTAMPDIFF(YEAR, j.fecha_nac, '2023-06-01')),2) AS promedio_edad
,	ROUND(AVG(j.altura),2) AS promedio_altura
,	ROUND(AVG(j.peso),2) AS promedio_peso
FROM equipo AS e
JOIN jugadores AS j
ON e.equipo_id = j.equipo_id
GROUP BY e.nombre, j.posicion;


-- VISTA: view_goleadores_liga_argentina
-- Esta vista mostrará los 5 máximos goleadores de la Liga Profesional Argentina

CREATE VIEW 
	futboldb.view_goleadores_liga_argentina AS
SELECT
	j.nombre
,	j.apellido
,	e.nombre AS equipo
,	SUM(es.goles) AS total_goles
FROM estadisticas_jugador AS es
JOIN jugadores AS j
ON es.jugador_id = j.jugador_id
JOIN partido AS p
ON es.partido_id = p.partido_id
JOIN competencia AS c
ON p.competencia_id = c.competencia_id
JOIN equipo AS e
ON j.equipo_id = e.equipo_id
WHERE c.nombre = 'Liga Profesional Argentina'
GROUP BY j.jugador_id, j.nombre, j.apellido , e.nombre
ORDER BY total_goles DESC
LIMIT 5 ;


-- VISTA : view_punteros_distintas_ligas
-- Esta vista tiene el objetivo de visualizar quienes son los punteros de cada liga presente incluyendo los puntos respectivos con los que cuenta en la competencia

CREATE VIEW	
	futboldb.view_punteros_distintas_ligas AS
SELECT 
    c.nombre AS liga,
    e.nombre AS equipo,
    p.puntos
FROM posiciones AS p
JOIN equipo_competencia AS ec
ON p.equipo_competencia_id = ec.equipo_competencia_id
JOIN equipo AS e
ON ec.equipo_id = e.equipo_id
JOIN competencia AS c
ON ec.competencia_id = c.competencia_id
WHERE p.posicion = 1
ORDER BY c.nombre ;


				