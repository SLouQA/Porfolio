CREATE TABLE respuestas (
idUsuario varchar(15),
idEncuesta int NOT NULL,
idPregunta int NOT NULL,
textoRespuesta varchar(255),
PRIMARY KEY (idUsuario, idEncuesta, idPregunta));

CREATE TABLE encuestas (
idEncuesta int NOT NULL,
nombre varchar(255),
PRIMARY KEY (idEncuesta));

CREATE TABLE preguntasEncuestas (
idEncuesta int NOT NULL,
idPregunta int NOT NULL,
textoPregunta varchar(255),
PRIMARY KEY (idEncuesta, idPregunta));

insert into encuestas values (1, 'Encuesta de satisfacción');
insert into encuestas values (2, 'Encuesta clima laboral');
insert into encuestas values (3, '¿Cómo catalogaría el servicio prestado por la mesa de ayuda?');
insert into respuestas values ('aRodriguez',1,1,'Si');
insert into respuestas values ('aRodriguez',1,2,'Muy bueno');
insert into respuestas values ('aRodriguez',1,3,'Excelente servicio');
insert into respuestas values ('aRodriguez',2,1,'Nunca');
insert into respuestas values ('pVazquez',1,1,'Si');
insert into respuestas values ('pVazquez',1,2,'Regular');
insert into respuestas values ('pVazquez',2,1,'Alguna vez');
insert into respuestas values ('pVazquez',2,2,'Si');

insert into preguntasEncuestas values (1,1,'¿El curso colmó sus expectativas?');
insert into preguntasEncuestas values (1,2,'¿Los materiales fueron adecuados?');
insert into preguntasEncuestas values (1,3,'¿Cómo fue el servicio brindado por mesa de ayuda?');
insert into preguntasEncuestas values (2,1,'¿Asistió a reuniones de esparcimiento del equipo de trabajo?');
insert into preguntasEncuestas values (2,2,'¿El líder de equipo fomenta este tipo de reuniones?');
insert into preguntasEncuestas values (2,3, '¿Cómo catalogaría el servicio prestado por la mesa de ayuda?');


Select r.idUsuario, r.idEncuesta, e.nombre as nombre_encuesta, count (idPregunta) as cantidad_de_respuestas 
From respuestas r JOIN encuestas e ON r.idEncuesta = e.idEncuesta 
GROUP BY r.idUsuario, r.idEncuesta;


SELECT r.idUsuario, r.idPregunta, p.textoPregunta AS pregunta, r.textoRespuesta AS 'texto de la respuesta' 
FROM respuestas r JOIN preguntasEncuestas p ON r.idPregunta = p.idPregunta AND r.idEncuesta = p.idEncuesta
ORder BY r.idUsuario;


insert into encuestas values (4, 'Comida de fin de año');
insert into preguntasEncuestas values (4,1,'¿Qué horario te conviene? ¿Mediodía o Noche?');
insert into respuestas values ('sLoureiro',4,1,'Mediodía');

SELECT r.idUsuario, e.nombre AS 'Nombre de la encuesta', p.textoPregunta AS 'Texto de la pregunta', r.textoRespuesta AS 'Valor de la respuesta'
FROM respuestas r 
JOIN encuestas e ON r.idencuesta = e.idencuesta
JOIN preguntasEncuestas p ON r.idEncuesta = p.idEncuesta and  r.idPregunta = p.idPregunta
where e.nombre = 'Comida de fin de año';