create database Cine_paraiso
use Cine_Paraiso
go

-- Crear tabla Sucursal
CREATE TABLE Sucursal (
    id INT PRIMARY KEY,
    ciudad VARCHAR(255)
);

-- Crear tabla Sala
CREATE TABLE Sala (
    id INT PRIMARY KEY,
    numero INT,
    capacidad INT,
    id_sucursal INT,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id)
);

-- Crear tabla Genero
CREATE TABLE Genero (
    id INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Crear tabla Pelicula
CREATE TABLE Pelicula (
    id INT PRIMARY KEY,
    titulo VARCHAR(255),
    id_genero INT,
	FOREIGN KEY (id_genero) REFERENCES Genero(id)
);

-- Crear tabla Funcion
CREATE TABLE Funcion (
    id INT PRIMARY KEY,
    id_sala INT,
    id_pelicula INT,
	dia DATE,
    precio DECIMAL(5,2),
    horario TIME,
    FOREIGN KEY (id_sala) REFERENCES Sala(id),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id)
);


-- Crear tabla Ticket
CREATE TABLE Ticket (
    id INT PRIMARY KEY,
    id_funcion INT,
    asiento INT,
    FOREIGN KEY (id_funcion) REFERENCES Funcion(id)
);

-- carga de datos: Sucursales
select * from Sucursal

INSERT INTO Sucursal
VALUES 
	(1,'Rosario'),
	(2,'Córdoba'),
	(3,'La Plata');

-- carga de datos: Salas
select * from Sala

--Suc. Rosario
INSERT INTO Sala 
VALUES 
	(1, 1, 300, 1),
	(2, 2, 300, 1),
	(3, 3, 300, 1),
	(4, 4, 350, 1),
	(5, 5, 350, 1),
	(6, 6, 350, 1),
	(7, 7, 200, 1),
	(8, 8, 200, 1),
	(9, 9, 200, 1),
	(10, 10, 400, 1);

--Suc. Córdoba
INSERT INTO Sala 
VALUES 
	(11, 1, 300, 2),
	(12, 2, 300, 2),
	(13, 3, 350, 2),
	(14, 4, 350, 2),
	(15, 5, 200, 2),
	(16, 6, 200, 2),
	(17, 7, 400, 2);

--Suc. La plata
INSERT INTO Sala 
VALUES 
	(18, 1, 380, 3),
	(19, 2, 380, 3),
	(20, 3, 380, 3),
	(21, 4, 400, 3),
	(22, 5, 400, 3),
	(23, 6, 400, 3),
	(24, 7, 200, 3),
	(25, 8, 200, 3),
	(26, 9, 500, 3);

--carga de generos:
select * from Genero;

INSERT INTO Genero
VALUES 
	(1, 'Drama'),
	(2, 'Ciencia Ficción'),
	(3, 'Western'),
	(4, 'Crimen'),
	(5, 'Acción'),
	(6, 'Aventuras'),
	(7, 'Animación'),
	(8, 'Terror'),
	(9, 'Documental'),
	(10,'Musical');

--carga de peliculas:
select * from Pelicula;

INSERT INTO Pelicula
VALUES 
	(1, 'Argentina, 1985', 1),
	(2, 'Interstellar', 2),
	(3, 'The Shawshank Redemption', 1),
	(4, 'The Godfather', 4),
	(5, 'The Dark Knight', 5),
	(6, 'Pulp Fiction', 4),
	(7, 'The Good, the Bad and the Ugly', 3),
	(8, 'The Lord of the Rings: The Return of the King', 6),
	(9, 'Once Upon a Time in the West', 3),
	(10, 'Goodfellas', 4);

--carga de funciones:

INSERT INTO Funcion
VALUES 
--id, id_sala, id_pelicula, precio, horario, dia
	(1, 1, 1, 750, '20:00:00', '2022/10/24'),	
	(2, 11, 2, 900, '19:30:00', '2022/10/25'),
	(3, 18, 8, 900, '18:00:00', '2022/10/26'),
	(4, 2, 10, 750, '18:00:00', '2022/10/24'),
	(5, 12, 7, 750, '19:30:00', '2022/10/25'),
	(6, 19, 3, 900, '20:00:00', '2022/10/26'),
	(7, 1, 8, 750, '22:00:00', '2022/10/30'),
	(8, 3, 1, 750, '18:00:00', '2022/10/30'),
	(9, 13, 10, 900, '16:00:00', '2022/10/31'),
	(10, 20, 9, 900, '22:00:00', '2022/10/31'),
	(11, 1, 1, 750, '22:30:00', '2022/10/24'),
	(12, 1, 1, 700, '22:30:00', '2022/10/24'),
	(13, 1, 1, 600, '23:45:00', '2022/10/24'),
	(14, 4, 1, 750, '11:30:00', '2022/10/24'),
	(15, 5, 1, 700, '12:30:00', '2022/10/24'),
	(16, 6, 1, 600, '15:45:00', '2022/10/24'),
	(17, 16, 1, 750, '22:30:00', '2022/10/24'),
	(18, 17, 1, 700, '22:30:00', '2022/10/24'),
	(19, 18, 1, 600, '23:45:00', '2022/10/24'),
	(20, 24, 1, 750, '11:30:00', '2022/10/24'),
	(21, 25, 1, 700, '12:30:00', '2022/10/24'),
	(22, 26, 1, 600, '15:45:00', '2022/10/24'),
	(23, 2, 2, 750, '22:30:00', '2022/10/26'),
	(24, 7, 2, 700, '20:30:00', '2022/10/30'),
	(25, 1, 2, 700, '21:00:00', '2022/10/31');

INSERT INTO Ticket
VALUES --id , id_funcion, asiento
	(13, 22, 10),
	(14, 1, 11),
	(15, 8, 12),
	(16, 7, 13),
	(17, 15, 35),
	(18, 9, 36),
	(19, 9, 100),
	(20, 9, 111),
	(21, 9, 75),
	(22, 9, 76),
	(23, 1, 77),
	(24, 1, 78);


------- 4).
--a. ¿Cuántas funciones hay en la sucursal La Plata(no importa si la función ocurió o no)?

SELECT COUNT(*) AS "Cantidad de funciones en La Plata" 
FROM Funcion
WHERE id_sala in (
		SELECT id 
		FROM sala 
		WHERE id_sucursal = (
				SELECT id 
				FROM Sucursal 
				WHERE ciudad = 'La Plata'
		)
);

--b. ¿Cuáles son las películas en cartelera en una fecha determinada (fije la fecha que prefiera) en la sucursal Córdoba?

DECLARE @fecha_cartelera DATE = '2022/10/24' ;

SELECT titulo AS 'Cartelera para el 2022/10/24 en Córdoba'
FROM Funcion
JOIN Sala
	ON Funcion.id_sala = Sala.id
JOIN Sucursal
	ON Sala.id_sucursal = id_sucursal
JOIN Pelicula
	ON Funcion.id_pelicula = Pelicula.id
WHERE ciudad = 'Córdoba'
AND dia = @fecha_cartelera
ORDER BY dia ASC;

--c. ¿Cuales son los horarios disponibles para ver la pelıcula Argentina, 1985 
-------en una fecha determinada (fije la fecha) en la sucursal Rosario?
--

SELECT Funcion.horario AS 'Horarios para "Argentina,1985" el 24/10/2022 en Rosario'
FROM Funcion
JOIN Sala
	ON Funcion.id_sala = Sala.id
JOIN Sucursal
	ON Sala.id_sucursal = id_sucursal
JOIN Pelicula
	ON Funcion.id_pelicula = Pelicula.id
WHERE ciudad = 'Rosario'
AND titulo = 'Argentina, 1985'
AND dia = '2022-10-24'
ORDER BY horario ASC;

--d. ¿Cuáles son los horarios disponibles para ver la película Argentina, 1985 
--en una fecha determinada (fije la fecha) para cada sucursal? 
--Muestre estos resultados ordenados cronológicamente de forma creciente.

SELECT Funcion.horario, Sucursal.ciudad, Pelicula.titulo FROM Funcion
JOIN Pelicula ON Funcion.id_pelicula = Pelicula.id
JOIN Sala ON Funcion.id_sala = Sala.id
JOIN Sucursal ON Sala.id_sucursal = Sucursal.id
WHERE dia = '2022-10-24'
AND id_sala IN(
		SELECT id
		FROM Sala
		WHERE id_pelicula IN(
				SELECT id 
				FROM Pelicula
				WHERE titulo = 'Argentina, 1985'
		)
)
ORDER BY horario ASC
;

--e. ¿Cuáles películas de ciencia ficción hay en cartelera 
------la semana del 24 de octubre de 2022 en la sucursal Rosario? * desde el 24 al 30 /10

SELECT  Sucursal.ciudad ,Pelicula.titulo , funcion.dia 
FROM Funcion
JOIN Pelicula ON Funcion.id_pelicula = Pelicula.id
JOIN Sala ON Funcion.id_sala = Sala.id
JOIN Sucursal ON Sala.id_sucursal = Sucursal.id
WHERE dia >= '2022-10-24' AND dia <= '2022-10-30'
AND Sucursal.ciudad = 'Rosario'
AND id_pelicula IN(
			SELECT id 
			FROM Pelicula
			WHERE id_genero IN (
					SELECT id
					FROM Genero
					WHERE nombre = 'Ciencia Ficción'
					)
			)
ORDER BY dia ASC
;

--f. ¿Cuáles son las butacas vendidas para ver Argentina, 1985 en Córdoba en una función
-----determinada (fije la función)?

SELECT Funcion.id AS 'id´s de funciones de "Argentina..." en Córdoba'
FROM Funcion
WHERE id_sala in (
		SELECT id 
		FROM Sala
		WHERE id_sucursal in (
				SELECT id
				FROM Sucursal
				WHERE ciudad = 'Córdoba'
		)
);

SELECT Ticket.asiento as 'butacas vendidas...'
FROM Funcion
JOIN Ticket ON Funcion.id = Ticket.id_funcion
JOIN Pelicula ON Funcion.id_pelicula = Pelicula.id
JOIN Sala ON Funcion.id_sala = Sala.id
JOIN Sucursal ON Sala.id_sucursal = Sucursal.id
WHERE Funcion.id = 9

--g. ¿Cuáles son las butacas libres para ver Argentina, 1985 en Córdoba 
------ en una función determinada (fije la función)?

--TABLA TEMPORAL: almacenará los asientos disponibles para una función determinada.
DROP TABLE IF EXISTS #asientos_disponibles
CREATE TABLE #asientos_disponibles (
	numero_asiento INT IDENTITY,
);

--VARIABLE TEMPORAL: almacenará la capacidad maxima de una sala/funcion.
DECLARE @cantidad_asientos int
SELECT  @cantidad_asientos = s.capacidad
FROM funcion AS f, sala AS s
WHERE f.id = 9
AND f.id_sala = s.id;

--Mediante bucle, se agregan a la tabla temporal la cantidad 
--de asientos disponibles por defecto en la sala de la función consultada.
DECLARE @contador INT = 1;
WHILE (@contador <= @cantidad_asientos)
BEGIN
    INSERT INTO  #asientos_disponibles DEFAULT VALUES
    SET @contador= @contador + 1;
END

-- Y se muestra los números de asientos que no se vendieron
SELECT numero_asiento AS 'Asientos disponibles' FROM  #asientos_disponibles
WHERE numero_asiento not in (
	SELECT Ticket.asiento as 'butacas vendidas...'
	FROM Funcion
	JOIN Ticket ON Funcion.id = Ticket.id_funcion
	JOIN Pelicula ON Funcion.id_pelicula = Pelicula.id
	JOIN Sala ON Funcion.id_sala = Sala.id
	JOIN Sucursal ON Sala.id_sucursal = Sucursal.id
	WHERE Funcion.id = 9
);


--h.¿Cuántas peliculas por género están o estuvieron en cartelera en el Cine Paraíso?

SELECT Genero.nombre AS 'Género', COUNT(Genero.nombre) AS 'Cantidad de funciones'
FROM Funcion
JOIN Pelicula
	ON Funcion.id_pelicula = Pelicula.id
JOIN Genero
	ON Pelicula.id_genero = Genero.id
GROUP BY Genero.nombre

/*
5. Suponga que, una vez creada la base de datos, se pide hacer una pequeña modificación para
poder guardar información respecto al precio de las entradas. Determine qué alteraciones sería
conveniente realizar en las tablas en los siguientes casos, justificando la respuesta:

a. El precio de la entrada depende únicamente de la sucursal.
	En este primer caso, sería conveniente que el precio de la entrada sea un atributo de la tabla Sucursal. 
	De manera que al ingresar datos se pueda asignar un valor específico para cada sucursal del cine.
	Las relaciones entre las tablas permitira acceder facilmente a este valor.

b. El precio de la entrada depende únicamente de la película.
	Si el precio de la entrada depende solamente de la película, sería conveniente que 
	se almacene direcatamente en la tabla Pelicula. Al asignar una película a una funcion, sería posible acceder al precio.

c. El precio de la entrada depende únicamente de la ubicación de la butaca.
	En este caso sería conveniente clasificar en grupos las butacas y asignarles un valor a cada grupo. 
	En la tabla Sala se podría cambiar el atriubuto cantButacas y crear dos atributos que sean 'asiento_standard' y 'asiento_premium' para precios individuales. 
	Ambos atributos almacenarian datos tipo int IDENTITY con un determinado número de butacas. 
	El atributo del precio seria parte de la tabla Ticket y mostraria el valor asociado al grupo que corresponda el número de la butaca 
	vendida.

*/

/* 6. Suponga ahora que el Cine Paraíso finalmente decide fijar el precio de las entradas únicamente en función de la película. Realice las modificaciones necesarias para que el modelo se
corresponda a este nuevo requerimiento, y escriba consultas SQL que cumplan los siguientes
requisitos:
*/

-- se elimina la columna 'precio' de la tabla funcion.
ALTER TABLE Funcion
DROP COLUMN precio

-- agrego columna 'precio_pelicula' a la tabla pelicula
ALTER TABLE Pelicula
ADD precio_pelicula MONEY ;

SELECT *
FROM Pelicula

-- seteo de precios por pelicula

UPDATE Pelicula SET precio_pelicula = 499.99 WHERE id = '1';
UPDATE Pelicula SET precio_pelicula = 599.99 WHERE id = '2';
UPDATE Pelicula SET precio_pelicula = 599.99 WHERE id = '3';
UPDATE Pelicula SET precio_pelicula = 699.99 WHERE id = '4';
UPDATE Pelicula SET precio_pelicula = 699.99 WHERE id = '5';
UPDATE Pelicula SET precio_pelicula = 499.99 WHERE id = '6';
UPDATE Pelicula SET precio_pelicula = 499.99 WHERE id = '7';
UPDATE Pelicula SET precio_pelicula = 399.99 WHERE id = '8';
UPDATE Pelicula SET precio_pelicula = 399.99 WHERE id = '9';
UPDATE Pelicula SET precio_pelicula = 599.99 WHERE id = '10';

-----------------------------------------------------------------------
/*VISTA GENERAL*/

CREATE VIEW vista_general
AS
SELECT  f.id AS 'id_funcion',
		f.horario AS 'horario',
		f.dia AS 'dia',
		t.id AS 'id_ticket',
		t.asiento AS 'asiento',
		p.id AS 'id_pelicula',
		p.precio_pelicula AS 'precio',
		p.titulo AS 'titulo',
		g.id AS 'id_genero',
		g.nombre AS 'genero',
		s.id AS 'id_sala',
		s.capacidad AS 'capacidad_sala',
		s.numero AS 'numero_sala',
		suc.id AS 'id_sucursal',
		suc.ciudad AS 'ciudad'
FROM Funcion AS f
LEFT JOIN Ticket AS t ON f.id = t.id_funcion
LEFT JOIN Pelicula AS p ON f.id_pelicula = p.id
LEFT JOIN Genero AS g ON g.id = p.id_genero
LEFT JOIN Sala AS s ON f.id_sala = s.id
LEFT JOIN Sucursal AS suc ON s.id_sucursal = suc.id

-----------------------------------------------------------------------

--a. Precio total racaudado por función

CREATE VIEW vista_recaudacion_funcion
AS
SELECT  f.id AS 'id función',
		SUM(p.precio_pelicula) AS 'total recaudado', 
		COUNT(t.asiento) AS 'cant. entradas vendidas'
FROM Funcion AS f
JOIN Ticket as t
	 ON f.id = t.id_funcion
JOIN Pelicula AS p
	ON p.id = f.id_pelicula
GROUP BY f.id;

--b. Promedio recaudado por función para cada película.

SELECT  p.titulo AS 'película',
		AVG(v.[total recaudado]) AS 'promedio recaudado por función'
FROM vista_recaudacion_funcion AS v
JOIN Funcion AS f
	ON v.[id función] = f.id
JOIN Pelicula AS p
	ON p.id = f.id_pelicula
GROUP BY p.titulo 

--c Porcentaje de entradas vendidas por función, mostrar --> pelicula, sucursal, hora y día
---solo aquellas en las que se vendió menos del %x.

DECLARE @porcentaje_ventas INT = 10;
SELECT v.[id función] AS 'id función',
	(s.capacidad / 100) * v.[cant. entradas vendidas] AS 'porcentaje de ventas',
	p.titulo AS 'película',
	suc.ciudad AS 'ciudad',
	f.horario AS 'hora',
	f.dia AS 'día'
FROM vista_recaudacion_funcion AS v
JOIN Funcion AS f
	ON f.id = v.[id función]
JOIN Pelicula AS p
	ON p.id = f.id_pelicula
JOIN Sala AS s
	ON s.id = f.id_sala 
JOIN Sucursal AS suc
	ON suc.id = s.id_sucursal
WHERE (s.capacidad / 100) * v.[cant. entradas vendidas] <= @porcentaje_ventas

--d. Para cada película ¿cuál fue la funcion que más recaudó?
------------------------------------------------------------------
/* crecaion de vista con las peliculas con su recaudacion máxima */
CREATE VIEW vista_peli_maxima_recaudacion
AS
SELECT  MAX([total recaudado]) AS 'recaudacion',
		p.titulo AS 'pelicula'
FROM vista_recaudacion_funcion AS v
JOIN Funcion AS f ON v.[id función] = f.id
JOIN Pelicula AS p ON f.id_pelicula = p.id 
GROUP BY p.titulo


-------------------------------------------------------------------
/* consulta de las peliculas (con id de funcion y recaudacion) con mayor recaudacion  */
SELECT	v.[id función] AS 'id funcion',
		p.titulo AS 'película',
		v.[total recaudado] AS 'recaudacion'		
FROM Pelicula AS p
LEFT JOIN Funcion AS f ON f.id_pelicula = p.id 
LEFT JOIN vista_recaudacion_funcion AS v ON f.id = v.[id función]
WHERE v.[id función] NOT LIKE 'NULL'
AND v.[total recaudado] in (
		SELECT vmax.recaudacion 
		FROM vista_peli_maxima_recaudacion AS vmax)


