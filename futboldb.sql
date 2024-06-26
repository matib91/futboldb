DROP DATABASE IF EXISTS futboldb;

CREATE DATABASE IF NOT EXISTS futboldb;

USE futboldb ;

CREATE TABLE pais(
	pais_id INT NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(255) NOT NULL ,
    PRIMARY KEY(pais_id)
);

CREATE TABLE ciudad(
	ciudad_id INT NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(255) NOT NULL ,
	pais_id INT NOT NULL,
    PRIMARY KEY(ciudad_id)
);

CREATE TABLE equipo(
	equipo_id INT NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(255) NOT NULL ,
	ciudad_id INT NOT NULL ,
	PRIMARY KEY(equipo_id)
);

CREATE TABLE competencia(
	competencia_id INT NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(255) NOT NULL ,
	pais_id  INT NOT NULL ,
    PRIMARY KEY(competencia_id)
);

CREATE TABLE jugadores(
	jugador_id INT NOT NULL AUTO_INCREMENT ,
	nombre VARCHAR(255) NOT NULL ,
	apellido VARCHAR(255) NOT NULL ,
	equipo_id INT NOT NULL ,
	pais_id INT NOT NULL ,
	posicion VARCHAR(50) NOT NULL ,
	fecha_nac DATE NOT NULL ,
	altura DECIMAL(4,2) NOT NULL ,
	peso DECIMAL(5,2) NOT NULL ,
	pierna_habil VARCHAR(10) NOT NULL ,
    PRIMARY KEY(jugador_id)
);


CREATE TABLE equipo_competencia(
	equipo_competencia_id INT NOT NULL AUTO_INCREMENT ,
	equipo_id INT NOT NULL ,
	competencia_id INT NOT NULL ,
    PRIMARY KEY(equipo_competencia_id)
);

CREATE TABLE posiciones(
	posicion_id INT NOT NULL AUTO_INCREMENT ,
	posicion INT NOT NULL ,
	puntos INT NOT NULL ,
	equipo_competencia_id INT NOT NULL ,
    PRIMARY KEY(posicion_id)
);

CREATE TABLE partido(
	partido_id INT NOT NULL AUTO_INCREMENT ,
	fecha DATE NOT NULL ,
	equipo_local_id INT NOT NULL ,
	equipo_visitante_id INT NOT NULL ,
	resultado VARCHAR(50) NOT NULL ,
	competencia_id INT NOT NULL ,
    PRIMARY KEY(partido_id)
);

CREATE TABLE estadisticas_jugador(
	estadistica_id INT NOT NULL AUTO_INCREMENT ,
	partido_id INT NOT NULL ,
	jugador_id INT NOT NULL ,
	goles INT NOT NULL ,
	asistencias INT NOT NULL ,
	minutos_jugados DECIMAL(5,2) NOT NULL ,
	tarj_roja BOOLEAN NOT NULL ,
	tarj_amarilla BOOLEAN NOT NULL,
	PRIMARY KEY(estadistica_id)
);



ALTER TABLE ciudad
	ADD CONSTRAINT fk_pais_id
    FOREIGN KEY(pais_id) REFERENCES pais(pais_id);
    
ALTER TABLE equipo
	ADD CONSTRAINT fk_ciudad_id
    FOREIGN KEY(ciudad_id) REFERENCES ciudad(ciudad_id);
    
ALTER TABLE competencia
	ADD CONSTRAINT fk_pais_id_competencia
    FOREIGN KEY(pais_id) REFERENCES pais(pais_id);
    
ALTER TABLE partido
	ADD CONSTRAINT fk_equipo_local_id
    FOREIGN KEY(equipo_local_id) REFERENCES equipo(equipo_id);
    
ALTER TABLE partido
	ADD CONSTRAINT fk_equipo_visitante_id
    FOREIGN KEY(equipo_visitante_id) REFERENCES equipo(equipo_id);
    
ALTER TABLE partido
	ADD CONSTRAINT fk_partido_competencia_id
    FOREIGN KEY(competencia_id) REFERENCES competencia(competencia_id);
    
ALTER TABLE jugadores
	ADD CONSTRAINT fk_jugadores_equipo_id
    FOREIGN KEY(equipo_id) REFERENCES equipo(equipo_id);
    
ALTER TABLE jugadores
	ADD CONSTRAINT fk_jugadores_pais_id
    FOREIGN KEY(pais_id) REFERENCES pais(pais_id);
    
ALTER TABLE estadisticas_jugador
	ADD CONSTRAINT fk_estadisticas_partido_id
    FOREIGN KEY(partido_id) REFERENCES partido(partido_id);
    
ALTER TABLE estadisticas_jugador
	ADD CONSTRAINT fk_estadisticas_jugador_id
    FOREIGN KEY(jugador_id) REFERENCES jugadores(jugador_id);
    
ALTER TABLE equipo_competencia
	ADD CONSTRAINT fk_equipo_comp_equipo_id
    FOREIGN KEY(equipo_id) REFERENCES equipo(equipo_id);
    
ALTER TABLE equipo_competencia
	ADD CONSTRAINT fk_equipo_comp_competencia_id
    FOREIGN KEY(competencia_id) REFERENCES competencia(competencia_id);
    
ALTER TABLE posiciones
	ADD CONSTRAINT fk_posic_equipo_competencia_id
    FOREIGN KEY(equipo_competencia_id) REFERENCES equipo_competencia(equipo_competencia_id);
    
