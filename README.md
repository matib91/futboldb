
# <center>Estructuración Base de Datos futboldb: Organización y Análisis de Información Deportiva</center>

**Alumno:** Blotta Matías

**Comisión:** #57190

**Tutor:** Ariel Annone

**Profesor:** Anderson M.Torres

**Lenguaje Utilizado:** SQL



---


## Descripción de la Temática

La base de datos que estamos desarrollando se centra en el mundo del fútbol. Ésta base de datos busca organizar y relacionar datos relevantes para facilitar el análisis y la gestión de información relacionada con este apasionante deporte.
En la base de datos, cada país puede tener varias ciudades, y cada ciudad puede albergar uno o más equipos de fútbol. Los equipos, a su vez, participan en diversas competencias, tanto nacionales como internacionales, lo que implica una relación compleja entre países, ciudades, equipos y competencias.
Cada competencia cuenta con una serie de partidos, donde los equipos compiten entre sí. Además, se registran las estadísticas individuales de los jugadores en cada partido, como la cantidad de goles anotados, asistencias y tarjetas. Esta información permite un análisis detallado del desempeño de los jugadores y equipos a lo largo de las competencias.

Problemas que soluciona la creación de esta Base de Datos
La creación de esta base de datos viene a solucionar varios problemas clave en el ámbito del fútbol:

**1.	Desorganización de Datos:** Actualmente, la información sobre equipos, jugadores, competencias y estadísticas está dispersa en diferentes fuentes y formatos, lo que dificulta su acceso y análisis. Esta base de datos centraliza toda la información relevante, facilitando su manejo y consulta.

**2.	Análisis Ineficiente:** Sin una estructura de datos bien organizada, es complicado realizar análisis detallados sobre el desempeño de jugadores y equipos. Con esta base de datos, es posible realizar análisis complejos y obtener insights valiosos sobre el rendimiento en diferentes competencias.

**3.	Gestión de Información:** Los clubes, asociaciones y federaciones de fútbol requieren una gestión eficiente de la información para la toma de decisiones y la planificación estratégica. Esta base de datos proporciona una herramienta robusta para gestionar y acceder a información clave de manera rápida y eficiente.

**4.	Seguimiento de Desempeño:** Permite un seguimiento detallado y preciso del desempeño de jugadores y equipos a lo largo del tiempo, proporcionando datos históricos que son esenciales para la evaluación y mejora continua.

**5.	Compatibilidad Internacional:** Dada la naturaleza global del fútbol, es crucial tener una base de datos que pueda manejar información de competencias internacionales, facilitando la comparación y análisis de datos a nivel mundial.



En resumen, esta base de datos tiene como objetivo principal almacenar y organizar información relevante para el seguimiento y análisis del mundo del fútbol, brindando una plataforma sólida para la gestión de datos relacionados con este deporte a nivel nacional e internacional. Esto no solo mejora la eficiencia en la gestión de información, sino que también potencia la capacidad de análisis y toma de decisiones en el ámbito del fútbol.

## Diagrama de Entidad- Relación (DER) 

![image](https://github.com/matib91/futboldb/assets/112019483/dc53e6ac-7c47-479d-9bc3-d6a8250cab7c)




## Listado de tablas

En este apartado se hará mención de cada una de las tablas junto a una breve
descripción de las mismas.

**1-	Tabla País:** Contiene información del nombre de los países involucrados en la base de datos. Ésta tabla se relaciona por medio de su Primary Key (PK) con las tablas CIUDAD, JUGADORES y COMPETENCIA siendo una Foreign Key (FK) en éstas.
```
| Tabla               | Columna               | Tipo de Datos                         | Tipo de Clave
| --------------------| --------------------- | --------------------------------------|--------------
| Pais                | pais_id               | INT NOT NULL AUTO_INCREMENT           | PK
|                     | nombre                | VARCHAR(255) NOT NULL                 |
```

 

**2-	Tabla Ciudad:** Contiene nombres de ciudades que pertenecen a distintos países en las cuales se localizan los distintos equipos. Se relaciona con la tabla PAÍS (por intermedio de la FK pais_id) y con la tabla EQUIPO (por intermedio de su PK que se presenta como FK en la tabla equipo).

```
| Tabla                | Columna              | Tipo de Datos                         | Tipo de Clave
| -------------------- | -------------------- | --------------------------------------|--------------
| Ciudad               | ciudad_id            | INT NOT NULL AUTO_INCREMENT           | PK
|                      | nombre               | VARCHAR(255) NOT NULL                 |
|                      | pais_id              | INT NOT NULL                          | FK
```


**3-	Tabla Equipo:** Incluye información sobre los equipos de fútbol involucrados. Se relaciona con la tabla CIUDADES (por intermedio de la FK ciudad_id) y con la tabla EQUIPOCOMPETENCIA (por intermedio de su PK equipo_id), con la tabla JUGADORES (a través de su PK equipo_id que se presenta como FK en la tabla JUGADORES) y con la tabla PARTIDO (gracias a su PK equipo_id que se presenta como FK en las columnas equipo_local_id y equipo_visitante_id de la tabla PARTIDO).

```
| Tabla                | Columna              | Tipo de Datos                         | Tipo de Clave
| -------------------- | -------------------- | --------------------------------------|--------------
| Equipo               | equipo_id            | INT NOT NULL AUTO_INCREMENT           | PK
|                      | nombre               | VARCHAR(255) NOT NULL                 |
|                      | ciudad_id            | INT NOT NULL                          | FK
```



**4-	Tabla Competencia:** Contiene información sobre las distintas competencias/ligas. Se relaciona con la tabla PAÍS (por intermedio de la FK pais_id), con la tabla EQUIPO_COMPETENCIA (por intermedio de su PK competencia_id ) y con la tabla PARTIDOS (ya que su PK competencia_id se presenta como FK en la tabla PARTIDO).

```
| Tabla                | Columna              | Tipo de Datos                         | Tipo de Clave
| -------------------- | -------------------- | --------------------------------------|--------------
| Competencia          | competencia_id       | INT NOT NULL AUTO_INCREMENT           | PK
|                      | nombre               | VARCHAR(255) NOT NULL                 |
|                      | pais_id              | INT NOT NULL                          | FK
```


**5-	Tabla Partido:** Posee información sobre los partidos de fútbol disputados, fecha del encuentro, a que competencia pertenece y resultado del mismo. Se relaciona con la tabla EQUIPO (por intermedio de las FKs equipo_local_id y equipo_visitante_id), con la tabla COMPETENCIA (por intermedio de la FK competencia_id) y con la tabla ESTADÍSTICAS_JUGADOR (por intermedio de su PK partido_id que se presenta como FK en la tabla ESTADÍSTICAS_JUGADOR).

```
| Tabla                | Columna              | Tipo de Datos                         | Tipo de Clave
| -------------------- | -------------------- | --------------------------------------|--------------
| Partido              | partido_id           | INT NOT NULL AUTO_INCREMENT           | PK
|                      | fecha                | DATE NOT NULL                         |
|                      | equipo_local_id      | INT NOT NULL                          | FK
|                      | equipo_visitante_id  | INT NOT NULL                          | FK
|                      | resultado            | VARCHAR(50) NOT NULL                  | 
|                      | competencia_id       | INT NOT NULL                          | FK
```


**6-	Tabla Jugadores:** Guarda información sobre los jugadores de fútbol, así como a qué equipo y país pertenecen. Se relaciona con la tabla EQUIPO (por intermedio de la FK equipo_id) y con la tabla PAÍS (por intermedio de la FK pais_id) y con la tabla ESTADÍSTICAS_JUGADOR (por intermedio de su PK jugador_id que se presenta como FK en la tabla ESTADÍSTICAS_JUGADOR).

```
| Tabla                | Columna              | Tipo de Datos                         | Tipo de Clave
| -------------------- | -------------------- | --------------------------------------|--------------
| Jugadores            | jugador_id           | INT NOT NULL AUTO_INCREMENT           | PK
|                      | nombre               | VARCHAR(255) NOT NULL                 |
|                      | apellido             | VARCHAR(255) NOT NULL                 | 
|                      | equipo_id            | INT NOT NULL                          | FK
|                      | pais_id              | INT NOT NULL                          | FK
|                      | posicion             | VARCHAR(50) NOT NULL                  | 
|                      | fecha_nac            | DATE NOT NULL                         | 
|                      | altura               | DECIMAL (4,2) NOT NULL                | 
|                      | peso                 | DECIMAL (5,2) NOT NULL                | 
|                      | pierna_habil         | VARCHAR(10) NOT NULL	              | 
```

 

**7-	Tabla Estadísticas_Jugador:** Contiene estadísticas de los jugadores en los partidos (minutos jugados, asistencias, goles y tarjetas recibidas). Se relaciona con la tabla JUGADORES (por intermedio de la FK jugador_id) y con la tabla PARTIDO (por intermedio de la FK partido_id).

```
| Tabla                | Columna              | Tipo de Datos                         | Tipo de Clave
| -------------------- | -------------------- | --------------------------------------|--------------
| Estadisticas_Jugador | estadistica_id       | INT NOT NULL AUTO_INCREMENT           | PK
|                      | partido_id           | INT NOT NULL                          | FK
|                      | jugador_id           | INT NOT NULL                          | FK
|                      | goles                | INT NOT NULL                          | 
|                      | asistencias          | INT NOT NULL                          | 
|                      | minutos_jugados      | DECIMAL (5,2) NOT NULL                | 
|                      | tarj_roja            | BOOLEAN NOT NULL                      | 
|                      | tarj_amarilla        | BOOLEAN NOT NULL                      | 
```


**8-	Tabla Equipo_competencia:** Tabla intermedia que contiene la relación entre equipos y competencias creada para eliminar la relación muchos a muchos. Se relaciona con la tabla EQUIPO (por intermedio de la FK equipo_id), con la tabla COMPETENCIA (por intermedio de la FK competencia_id) y con la tabla POSICIONES (por intermedio de su PK equipo_competencia_id que se presenta como FK en la tabla POSICIONES).

```
| Tabla                | Columna               | Tipo de Datos                         | Tipo de Clave
| -------------------- | --------------------- | --------------------------------------|--------------
| Equipo_competencia   | equipo_competencia_id | INT NOT NULL AUTO_INCREMENT           | PK
|                      | equipo_id             | INT NOT NULL                          | FK
|                      | competencia_id        | INT NOT NULL                          | FK
```



**9-	Tabla Posiciones:** Contiene la posición y puntos obtenidos de cada equipo en cada competencia. Se relaciona con la tabla Equipo_Competencia mediante la FK equipo_competencia_id.

```
| Tabla                | Columna               | Tipo de Datos                         | Tipo de Clave
| -------------------- | --------------------- | --------------------------------------|--------------
| Posiciones           | posicion_id           | INT NOT NULL AUTO_INCREMENT           | PK
|                      | equipo_competencia_id | INT NOT NULL                          | FK
|                      | posicion              | INT NOT NULL                          | 
|                      | puntos                | INT NOT NULL                          | 
```






