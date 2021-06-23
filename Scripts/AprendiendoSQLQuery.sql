--1 Objetivos y alcances del tutORial de Microsoft Sql Server.

--CREATE DATABASE BASeDeDatos

USE BaseDeDatos

GO

--2 - Crear una tabla (CREATE TABLE - sp_tables - sp_columns - DROP TABLE)
IF OBJECT_ID('Usuarios') IS NOT NULL 
DROP TABLE Usuarios 

CREATE TABLE Usuarios ( 
Nombre VARCHAR(30), 
Clave VARCHAR(10) 
) 

EXEC sp_tables @TABLE_owner='dbo' 

EXEC sp_columns Usuarios --Para mostrar una columna llamada Usuarios.

/*CREATE TABLE Usuarios ( --No se pude Crear otra tabla igual que la primera.
Nombre VARCHAR(30),
clave VARCHAR(10)
);*/
   
DROP TABLE Usuarios --Para borrar está la tabla completa.

EXEC sp_tables @TABLE_owner='dbo' --Para mostrar una tabla.

--3 - INSERTAR y recuperar Registros de una tabla (INTERT into - SELECT)
IF OBJECT_ID('Usuarios') IS NOT NULL
DROP TABLE Usuarios --Borrando tabla anterior de la parte 3 para evitar un error.

CREATE TABLE Usuarios( --Aquí se crea otra nueva.
Nombre VARCHAR(30),
Clave VARCHAR(10)
)

INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Mariano','123abc') --INSERTANDO fila.

SELECT * FROM Usuarios --Veamos todos los campos la tabla.

INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Ana','hola123') --INSERTANDO fila otra fila.

SELECT * FROM Usuarios

INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Boca','Luis')

SELECT * FROM usuarios
 
--4 - Tipos de datos básicos
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros --Procedemos a borrar la tabla si existe.

CREATE TABLE Libros( --Procedemos a Crearla nuevamente.
Titulo VARCHAR(80),
Autor VARCHAR(40),
Editorial VARCHAR(30),
Precio float,
Cantidad INTEGER
)

GO

EXEC sp_columns Libros --Procedemos a mostrar las Columnas del procedimiento almacenado.

INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('El aleph','Borges','Emece', 25.50,100)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Matematica estas ahi','Paenza','Siglo XXI',18.8,200)

SELECT * FROM Libros

INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Atlantida',10,200)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Alicia en el Pais','Lewis Carroll','Atlantida',10,200)

SELECT * FROM Libros

--5 - Recuperar algunos campos (SELECT)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros (
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio float,
Cantidad INTEGER
)

EXEC sp_columns Libros --Veamos la estructura de la tabla.

INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('el aleph','Borges','Emece',25.50,200)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Atlentida',10.15,200)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Matematica estas ahi','Paenza','Siglo XXI',18.8,200)

SELECT * FROM Libros --Veamos todos los campos la tabla.

SELECT Titulo, Autor, Editorial 
FROM Libros

SELECT Titulo, Precio 
FROM Libros 

SELECT Editorial, Cantidad 
FROM Libros

--6 - Recuperar algunos Registros (WHERE)
IF OBJECT_ID('Usuarios') IS NOT NULL
DROP TABLE Usuarios

CREATE TABLE Usuarios (
Nombre VARCHAR(30),
Clave VARCHAR(10)
)

EXEC sp_columns Usuarios

INSERT INTO Usuarios(Nombre, Clave)
VALUES('Marcelo','Boca')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('JuanPerez','Juancito')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Susana','River')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Luis','River')

SELECT * FROM Usuarios 
WHERE Nombre = 'Leonardo' --Recuperamos el Nombre de Leonardo.

SELECT Nombre FROM Usuarios 
WHERE Clave = 'River' --Recuperamos la Clave de River.

SELECT Nombre FROM Usuarios 
WHERE Clave = 'Santi' --Recuperamos la Clave de Santi.

--7 - Operadores Relacionales
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Titulo VARCHAR(30),
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio float
)

INSERT INTO Libros(Titulo, Autor, Editorial, Precio)
VALUES('El aleph','Borges','Emece',24.50)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Martin Fierro','Jose Hernandez','Emece',16.00)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Aprenda PHP','Mario Molina','Emece',35.40)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Cervantes y el Quijote','Borges','Paidos',50.90)

SELECT * FROM Libros 
WHERE Autor <> 'Borges'

SELECT Titulo, Precio 
FROM Libros 
WHERE Precio > 20

SELECT * FROM Libros 
WHERE Precio <= 30

--8 - borrar Registros (DELETE)
IF OBJECT_ID('Usuarios') IS NOT NULL
DROP TABLE Usuarios

CREATE TABLE Usuarios(
Nombre VARCHAR(30),
Clave VARCHAR(10)
)

INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Marcelo','River')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Susana','chapita')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('CarlosFuentes','Boca')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('FedericoLopez','Boca')

SELECT * FROM Usuarios

DELETE FROM Usuarios 
WHERE Nombre = 'Marcelo'

SELECT * FROM Usuarios

DELETE FROM Usuarios 
WHERE Nombre = 'Marcelo' --Vamos a Eliminar el registro cuyo Nombre de usuario es "Marcelo".

SELECT * FROM Usuarios

DELETE FROM Usuarios 
WHERE Clave = 'Boca' --Eliminamos todos los Registros cuya clave es 'Boca'.

SELECT * FROM Usuarios --Eliminemos todos los Registros.

DELETE FROM Usuarios --Veamos el contenido de la tabla.

SELECT * FROM Usuarios

--9 - Actualizar Registros (UPDATE)
IF OBJECT_ID('Usuarios') IS NOT NULL
DROP TABLE Usuarios

CREATE TABLE Usuarios(
Nombre VARCHAR(20),
Clave VARCHAR(10)
)

INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Marcelo','River')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Susana','chapita')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Carlosfuentes','Boca')
INSERT INTO Usuarios(Nombre, Clave) 
VALUES('Federicolopez','Boca')

SELECT * FROM Usuarios

UPDATE Usuarios SET Clave = 'RealMadrid'--Cambiaremos los valores 
                                         --de todas las claves, 
										 --por la cadena "RealMadrid".

SELECT * FROM Usuarios

UPDATE Usuarios SET Clave = 'Boca' 
WHERE Nombre = 'FedericoLopez'--Necesitamos cambiar el valor 
                               --de la clave del usuario 
							   --llamado "Federico Lopez" por "Boca".

SELECT * FROM Usuarios --El cambio afectó a todos los Registros, veámoslo.

UPDATE Usuarios SET Clave = 'payaso' 
WHERE Nombre = 'JuanaJuarez' --Vimos que si Microsoft SQL Server 
                              --no encuentra Registros que 
							  --cumplan con la condición no se modifican Registros.
SELECT * FROM Usuarios --Si vemos la tabla veremos que no a cambiado.

UPDATE Usuarios SET Nombre = 'MarceloDuarte', Clave = 'Marce' 
WHERE Nombre = 'Marcelo' --Para actualizar varios campos 
                        --en una sola instrucción empleamos.

SELECT * FROM Usuarios --Si vemos la tabla.

--10 - Comentarios
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Titulo VARCHAR(30),
Autor VARCHAR(20),
Editorial VARCHAR(15)
)

INSERT INTO Libros(Titulo, Autor, Editorial) 
VALUES('El aleph','Borges','Emece')

SELECT * FROM Libros --mostramos los Registros de Libros.

SELECT Titulo, Autor 
FROM Libros --mostramos tútulos y Nombres de los Autores.

--11 - valores NULL (IS NULL)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Titulo VARCHAR(30) NOT NULL,
Autor VARCHAR(30) NOT NULL,
Editorial VARCHAR(15) NULL,
Precio float
)

GO

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('El aleph','Borges','Emece',NULL)
INSERT INTO Libros (Titulo, Autor, Editorial, Precio) 
VALUES('Alicia en el Pais','Lewis Carroll', NULL, 0)
--INTERT into Libros (Titulo, Autor, Editorial, Precio) 
--VALUES(NULL,'Borges','Siglo XXI',25)

EXEC sp_columns Libros

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Uno','Richard Bach','',18.50);
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('','Richard Bach','Planeta',22);

SELECT * FROM Libros --Veamos todos los Registros Ingresados.

SELECT * FROM Libros 
WHERE Editorial IS NULL --Recuperemos los Registros que contengan el valor "NULL" en el campo "Precio".

SELECT * FROM Libros 
WHERE Precio = 0 --con la primera sentencia veremos 
                 --los Libros cuyo Precio es igual a "NULL" (desconocido)
                 --con la segunda, los Libros cuyo Precio es 0.
SELECT * FROM Libros 

WHERE Editorial IS NULL --Recuperemos los Libros cuyo Nombre de Editorial es "NULL".
SELECT * FROM Libros 

WHERE Editorial='' --AhORa veamos los Libros cuya Editorial almacena una cadena vacía.
SELECT * FROM Libros 
WHERE Precio IS NOT NULL --Para recuperar los Libros cuyo Precio no sea nulo tipeamos.

--12 - Clave primaria
IF OBJECT_ID('Usuarios') IS NOT NULL
DROP TABLE Usuarios

CREATE TABLE Usuarios(
Nombre VARCHAR(20),
Clave VARCHAR(10),
PRIMARY KEY(Nombre)
)

EXEC sp_columns Usuarios

INSERT INTO Usuarios(Nombre, Clave) 
VALUES('juanperez','Boca')
INSERT INTO Usuarios (Nombre, Clave) 
VALUES('raulgarcia','River')
--INTERT INTO Usuarios(Nombre, Clave) 
--VALUES('juanperez','payaso') 
--recordemos que cuando un campo es clave primaria, sus valores no se repiten. 
--INTERT INTO Usuarios(Nombre, Clave) 
--VALUES(NULL,'payaso') 
--recordemos que cuando un campo es clave primaria, sus valores no se repiten. 

--UPDATE Usuarios SET Nombre = 'juanperez' 
--WHERE Nombre = 'raulgarcia'  --Intentamos Actualizar un valor de clave primaria existente da un error.

SELECT * FROM Usuarios
  
--13 - Campo con atributo IDENTITY
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio float
)

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('El aleph','Borges','Emece',23)
SELECT * FROM Libros
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Uno','Richard Bach','Planeta',18)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Aprenda PHP', 'Mario Molina','Siglo XXI',45.60)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Alicia en el Pais de maravillas','Lewis Carroll','Paidos',15.50)

SELECT * FROM Libros

--INTERT INTO Libros(Codigo, Titulo, Autor, Editorial, Precio) 
--VALUES(5,'Martin Fierro','Jose Hernandez','Paidos',25) --da un mensaje de error no se permite sustituir valores.
--UPDATE Libros SET Codigo=9 WHERE Titulo='Uno' --generará un mensaje de error por no se pude actulizar.

EXEC sp_columns Libros

DELETE FROM Libros 
WHERE Autor = 'Lewis Carroll'

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Martin Fierro','Jose Hernandez','Paidos',25)

SELECT * FROM Libros --Ingresamos un quinto registro y luego 
--vemos que en el campo código se guardó 
--el valor secuencial sin considerar que el valor "4" ya no existe.

--14 - Otras caracterésticas del atributo IDENTITY
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY(100,2),
Titulo VARCHAR(20),
Autor VARCHAR(30),
Precio float
)

INSERT INTO Libros(Titulo, Autor, Precio) 
VALUES('El aleph','Borges',23)
INSERT INTO Libros(Titulo, Autor, Precio) 
VALUES('Uno','Richard Bach',18)
INSERT INTO Libros(Titulo, Autor, Precio) 
VALUES('Aprenda PHP','Mario Molina',45.60)

SELECT * FROM Libros

GO

SELECT ident_seed('Libros')
 
--INTERT into Libros (Codigo, Titulo, Autor, Precio) 
--VALUES(106,'Martin Fierro','Jose Hernandez',25)

SELECT * FROM Libros

SET IDENTITY_INSERT Libros ON --Encendemos.

INSERT INTO Libros (Codigo, Titulo, Autor) 
VALUES (100,'Matematica estas ahi','Paenza')
INSERT INTO Libros (Codigo, Titulo, Autor) 
VALUES (1,'Ilusiones','Richard Bach')
--INTERT INTO Libros (Titulo, Autor) 
--VALUES ('Uno','Richard Bach')

SET IDENTITY_INSERT Libros off --Apagamos.

--INTERT into Libros (Codigo, Titulo, Autor) 
--VALUES (300,'Uno','Richard Bach')
SELECT * FROM Libros

--15 - TRUNCATE TABLE
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(30),
Autor VARCHAR(20),
Editorial VARCHAR(15),
Precio float
)

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('El aleph','Borges','Emece',25.60)
INSERT INTO Libros (Titulo, Autor, Editorial, Precio) 
VALUES('Uno','Richard Bach','Planeta',18)

SELECT * FROM Libros

TRUNCATE TABLE Libros

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('El aleph','Borges','Emece',25.60)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Uno','Richard Bach','Planeta',18)

SELECT * FROM Libros

DELETE FROM Libros

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('El aleph','Borges','Emece',25.60)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('Uno','Richard Bach','Planeta',18)

SELECT * FROM Libros

--17 - Tipo de dato (texto)
IF OBJECT_ID('Visitantes') IS NOT NULL
DROP TABLE Visitantes

CREATE TABLE Visitantes(
Nombre VARCHAR(30),
Edad INTEGER,
Sexo CHAR(1),--No se pude INSERTAR más de un caracter dentro del INSERT.
Domicilio VARCHAR(30),
Ciudad VARCHAR(20),
Telefono VARCHAR(11)
)

--INTERT into Visitantes (Nombre, Edad, Sexo, Domicilio, Ciudad, Telefono) 
--VALUES ('Juan Juarez',32,'masc','Avellaneda 789','Cordoba','4234567')
INSERT INTO Visitantes(Nombre, Edad, Sexo, Domicilio, Ciudad, Telefono) 
VALUES('Marcela MORales',43,'f','Colon 456','Cordoba',4567890)

SELECT * FROM Visitantes

--18 - Tipo de dato (numérico)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo SMALLINT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio SMALLMONEY,
Cantidad TINYINT
)

GO

INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('El aleph','Borges','Emece',25.60,255) --No se puede superar 
                                               --el rango del tipo "TINYINT",con valor de 260.
INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad)
VALUES('El aleph','Borges','Emece',25000,100) --No se puede superar 
                                              --el rango del tipo "SMALLMONEY", con valor de 250000.
--INSERT into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
--VALUES('Uno','Richard Bach','Planeta','a50.30',100) --No se pude convertir tipo dato numerico.
INSERT INTO Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Uno','Richard Bach','Planeta',50.30,'100') --Si la cadena 100 no hay problema.

SELECT * FROM Libros

--19 - Tipo de dato (Fecha y hORa)
IF OBJECT_ID('Empleados') IS NOT NULL
DROP TABLE Empleados

CREATE TABLE Empleados(
Nombre VARCHAR(20),
Documento CHAR(8),
FechaINgreso DATETIME
)

SET DATEFORMAT dmy

GO

INSERT INTO Empleados 
VALUES('Ana Gomez','22222222','12-01-1980')
INSERT INTO Empleados 
VALUES('Bernardo Huerta','23333333','15-03-81')
INSERT INTO Empleados 
VALUES('Carla Juarez','24444444','20/05/1983')
INSERT INTO Empleados 
VALUES('Daniel Lopez','25555555','2.5.1990')

SELECT * FROM Empleados

SELECT FORMAT(GETDATE(), 'dd/MM/yyyy') AS FechaINgreso

--SELECT * FROM Empleados 
--WHERE FechaINgreso < '01-01-1985'

--UPDATE Empleados SET Nombre = 'Maria Carla Juarez' 
--WHERE FechaINgreso = '20.5.83'

SELECT * FROM Empleados

--DELETE FROM Empleados 
--WHERE FechaINgreso <> '20/05/1983'

SELECT * FROM Empleados

--20 - Ingresar algunos campos (INTERT into)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(30),
Editorial VARCHAR(15)
)

--INTERT INTO Libros 
--VALUES ('Uno','Richard Bach','Planeta')
--SELECT * FROM Libros

INSERT INTO Libros(Titulo, Autor) 
VALUES('El aleph','Borges')
--INTERT INTO Libros (Autor, Editorial) 
--VALUES ('Lewis Carroll','Planeta') 
--No se pude INSERTAR valor NULL en la tabla Libros.

SELECT * FROM Libros

--21 - valores por defecto (DEFAULT)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30) NOT NULL DEFAULT 'Desconocido', 
Editorial VARCHAR(20),
Precio DECIMAL(5,2),
Cantidad TINYINT DEFAULT 0
)

INSERT INTO Libros(Titulo, Editorial, Precio) 
VALUES('Java en 10 Minutos','Paidos',50.40)
SELECT * FROM Libros

INSERT INTO Libros(Titulo, Editorial)  
VALUES('Aprenda PHP','Siglo XXI')
SELECT * FROM Libros

EXEC sp_columns Libros

INSERT INTO Libros(Titulo, Autor, Precio, Cantidad)  
VALUES('El Gato con botas', DEFAULT, DEFAULT, 100)
SELECT * FROM Libros

INSERT INTO Libros 
DEFAULT VALUES
SELECT * FROM Libros

INSERT INTO Libros(Titulo, Autor, Cantidad) 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll',NULL)

INSERT INTO Libros 
DEFAULT VALUES
SELECT * FROM Libros
  
--22 - Columnas Calculadas (Operadores aritméticos y de concatenación)
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
Cantidad TINYINT DEFAULT 0,
PRIMARY KEY (Codigo)
)

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('El aleph','Borges','Emece',25)
--INTERT into Libros 
--VALUES('Java en 10 Minutos','Mario Molina','Siglo XXI',50.40,100)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',15,50)

SELECT Titulo, Precio, Cantidad, Precio * Cantidad 
FROM Libros

SELECT Titulo, Precio, Precio - (Precio * 0.1) 
FROM Libros

UPDATE Libros SET Precio = Precio - (Precio * 0.1)
SELECT * FROM Libros

SELECT Titulo +'-'+ Autor+ '-'+ Editorial 
FROM Libros

--23 - Alias
IF OBJECT_ID('Agenda') IS NOT NULL
DROP TABLE Agenda

CREATE TABLE Agenda(
Nombre VARCHAR(30),
Domicilio VARCHAR(30),
Telefono VARCHAR(11)
)

INSERT INTO Agenda(Nombre, Domicilio, Telefono)
VALUES('Juan Perez','Avellaneda 908','4252525')
INSERT INTO Agenda (Nombre, Domicilio, Telefono) 
VALUES('Marta Lopez','Sucre 34','4556688')
INSERT INTO Agenda (Nombre, Domicilio, Telefono) 
VALUES('Carlos Garcia','Sarmiento 1258',NULL)

SELECT Nombre AS NombreYApellido, Domicilio, Telefono 
FROM Agenda

SELECT Nombre AS 'Nombre y Apellido',Domicilio ,Telefono  
FROM Agenda

SELECT Nombre 'Nombre y Apellido',Domicilio,Telefono 
FROM Agenda

--25 - Funciones para el manejo de cadenas
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
Cantidad TINYINT DEFAULT 0,
PRIMARY KEY(Codigo)
)

INSERT INTO Libros(Titulo, Autor, Editorial, Precio) 
VALUES('El aleph','Borges','Emece',25)
 --INTERT INTO Libros 
 --VALUES('Java en 10 Minutos','Mario Molina','Siglo XXI',50.40,100)
INSERT INTO Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',15,50)

SELECT SUBSTRING(Titulo, 1, 12) 
AS Titulo 
FROM Libros

SELECT LEFT(Titulo, 12) 
AS Titulo 
FROM Libros

SELECT Titulo, STR(Precio, 6, 1) 
FROM Libros

SELECT Titulo, STR(Precio) 
FROM Libros

SELECT Titulo, Autor, UPPER(Editorial) 
FROM Libros

--27 - Funciones para el uso de Fechas y Horas
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Edicion DATETIME,
Precio DECIMAL(6,2)
)

--28 - Ordenar Registros (ORDER BY)
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
PRIMARY KEY (Codigo)
)

SELECT * FROM Libros 
ORDER BY Titulo

SELECT * FROM Libros 
ORDER BY Editorial desc

SELECT * FROM Libros 
ORDER BY Titulo, Editorial

SELECT * FROM Libros 
ORDER BY Titulo ASc, Editorial desc

--29 - Operadores lógicos ( AND - OR - NOT)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
)

/*INTERT into Libros 
VALUES('El aleph','Borges','Emece',15.90)
INSERT INTO Libros 
VALUES('Antología poética','Borges','Planeta',39.50)
INSERT INTO Libros 
VALUES('Java en 10 Minutos','Mario Molina','Planeta',50.50)
INSERT INTO Libros 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',19.90)
INSERT INTO Libros 
VALUES('Martin Fierro','Jose Hernandez','Emece',25.90)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Paidos',16.80)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Emece',19.50)
INSERT INTO Libros 
VALUES('Cervantes y el Quijote','Borges','Paidos',18.40)*/

SELECT * FROM Libros 
WHERE (Autor = 'Borges') AND (Precio <= 20)
SELECT * FROM Libros 
WHERE Autor = 'Borges' OR Editorial = 'Planeta'
SELECT * FROM Libros 
WHERE NOT Editorial = 'Planeta'

SELECT * FROM Libros 
WHERE (Autor = 'Borges') OR (Editorial = 'Paidos' AND Precio < 20)

SELECT * FROM Libros 
WHERE (Autor = 'Borges' OR Editorial = 'Paidos') AND (Precio < 20)

--30 - Otros Operadores Relacionales (IS NULL)
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
)

/*INTERT into Libros 
VALUES('El aleph','Borges','Emece',15.90)
INSERT INTO Libros 
VALUES('Cervantes y el Quijote','Borges','Paidos',NULL)
INSERT INTO Libros 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll',NULL,19.90)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Emece',25.90)
INSERT INTO Libros (Titulo,Autor,Precio) 
VALUES('Antología poética','Borges',25.50)
INSERT INTO Libros (Titulo,Autor,Precio) 
VALUES('Java en 10 Minutos','Mario Molina',45.80)
INSERT INTO Libros (Titulo,Autor) 
VALUES('Martin Fierro','Jose Hernandez')
INSERT INTO Libros (Titulo,Autor) 
VALUES('Aprenda PHP','Mario Molina')*/

SELECT * FROM Libros
WHERE Editorial IS NULL

SELECT * FROM Libros
WHERE Editorial IS NOT NULL

 --31 - Otros Operadores Relacionales (BETWEEN)
IF OBJECT_ID('Vistas') IS NOT NULL
DROP TABLE Vistas

CREATE TABLE Vistas (
Numero INT IDENTITY,
Nombre VARCHAR(30) DEFAULT 'Anonimo',
Mail VARCHAR(50),
Pais VARCHAR(20),
FechaYHora DATETIME,
PRIMARY KEY(Numero)
)

INSERT INTO Vistas(Nombre, Mail, Pais, FechaYHora) 
VALUES('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10')
INSERT INTO Vistas(Nombre, Mail, Pais, FechaYHora) 
VALUES('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30')
INSERT INTO Vistas(Nombre, Mail, Pais, FechaYHora) 
VALUES('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45')
INSERT INTO Vistas(Nombre, Mail, Pais, FechaYHora) 
VALUES('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15')
INSERT INTO Vistas(Nombre, Mail, Pais, FechaYHora) 
VALUES('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45')
INSERT INTO Vistas(Nombre, Mail, Pais, FechaYHora) 
VALUES('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20')
--INTERT INTO Vistas(Nombre, Mail, Pais, FechaYHora) 
--VALUES('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25')
INSERT INTO Vistas (Nombre, Mail, Pais) 
VALUES('Federico1','FedericoGarcia@xaxamail.com','Argentina')

SELECT * FROM Vistas 
WHERE FechaYHora 
BETWEEN '2006-09-12' AND '2006-10-11'

SELECT * FROM Vistas 
WHERE Numero BETWEEN 2 AND 5

-- 32 - Otros Operadores Relacionales (IN)
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20),
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
)

 /*INTERT into Libros 
VALUES('El aleph','Borges','Emece',15.90)
INSERT INTO Libros 
VALUES('Cervantes y el Quijote','Borges','Paidos',NULL)
INSERT INTO Libros 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll',NULL,19.90)
INSERT INTO Libros 
VALUES('Matematica estas ahi','Paenza','Siglo XXI',15)
INSERT INTO Libros (Titulo, Precio) 
VALUES('Antología poética',32)
INSERT INTO Libros (Titulo, Autor, Precio) 
VALUES('Martin Fierro','Jose Hernandez',40)
INSERT INTO Libros (Titulo, Autor, Precio) 
VALUES('Aprenda PHP','Mario Molina',56.50)*/

SELECT * FROM Libros 
WHERE Autor IN ('Borges','Paenza')

SELECT * FROM Libros 
WHERE Autor NOT IN ('Borges','Paenza')

-- 33 - Búsqueda de Patrones (LIKE - NOT LIKE)
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
PRIMARY KEY(Codigo)
)

 /*INTERT into Libros 
VALUES('El aleph','Borges','Emece',15.90)
INSERT INTO Libros 
VALUES('Antología poética','J. L. Borges','Planeta',NULL)
INSERT INTO Libros 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll',NULL,19.90)
INSERT INTO Libros 
VALUES('Matematica estas ahi','Paenza','Siglo XXI',15)
INSERT INTO Libros 
VALUES('Martin Fierro','Jose Hernandez',DEFAULT,40)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Nuevo siglo',56.50)*/

SELECT * FROM Libros 
WHERE Autor LIKE '%Borges%'

SELECT * FROM Libros 
WHERE Titulo LIKE 'M%'

SELECT * FROM Libros 
WHERE Titulo NOT LIKE 'M%'

SELECT * FROM Libros 
WHERE Autor LIKE '%Carrol_'

SELECT Titulo, Autor, Editorial 
FROM Libros 
WHERE Editorial LIKE '[P-S]%'

SELECT Titulo, Autor, Editorial 
FROM Libros 
WHERE Editorial LIKE '[^PN]%'

SELECT Titulo,Precio 
FROM Libros
WHERE Precio LIKE '1_.%'

SELECT Titulo, Precio 
FROM Libros 
WHERE Precio LIKE '%.00'

--34 - Contar Registros (COUNT)
IF OBJECT_ID ('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(20) DEFAULT 'Desconocido',
Editorial VARCHAR(20),
Precio DECIMAL(6,2),
PRIMARY KEY(Codigo)
)
  
GO

INSERT INTO Libros
VALUES('El aleph','Borges','Emece',15.90)
INSERT INTO Libros
VALUES('Antología poética','J. L. Borges','Planeta',NULL)
INSERT INTO Libros
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll',NULL,19.90)
INSERT INTO Libros
VALUES('Matematica estas ahi','Paenza','Siglo XXI',15)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez',DEFAULT,40)
INSERT INTO Libros
VALUES('Aprenda PHP','Mario Molina','Nuevo siglo',NULL)
INSERT INTO Libros
VALUES('Uno','Richard Bach','Planeta',20)

SELECT COUNT(*) 
FROM Libros

SELECT COUNT(*) 
FROM Libros 
WHERE Editorial = 'Planeta'

SELECT COUNT(Precio) 
FROM Libros

--36 - Funciones de agrupamiento (COUNT - SUM - MIN - MAX - AVG)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(30) DEFAULT 'Desconocido',
Editorial VARCHAR(15),
Precio DECIMAL(5,2),
Cantidad TINYINT,
PRIMARY KEY(Codigo)
)

GO

--INTERT into Libros
--VALUES('El aleph','Borges','Planeta',15,NULL)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Emece',22.20,200)
INSERT INTO Libros
VALUES('Antologia Poetica','J.L. Borges','Planeta',NULL,150)
INSERT INTO Libros
VALUES('Aprenda PHP','Mario Molina','Emece',18.20,NULL)
INSERT INTO Libros
VALUES('Cervantes y el Quijote','Bioy Casares- J.L. Borges','Paidos',NULL,100)
INSERT INTO Libros
VALUES('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120)
INSERT INTO Libros
VALUES('Harry Potter y la Piedra Filosofal','J.K. Rowling',DEFAULT,45.00,90)
INSERT INTO Libros
VALUES('Harry Potter y la Camara Secreta','J.K. Rowling','Emece',46.00,100)
INSERT INTO Libros (Titulo, Autor, Cantidad)
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll',220)
INSERT INTO Libros (Titulo, Autor, Cantidad)
VALUES('PHP de la A a la Z',DEFAULT,0)

SELECT SUM(Cantidad)
FROM Libros

SELECT SUM(Cantidad)
FROM Libros
WHERE Editorial = 'Emece'

SELECT MAX(Precio)
FROM Libros

SELECT MIN(Precio)
FROM Libros
WHERE Autor LIKE '%Rowling%'

SELECT AVG(Precio)
FROM Libros
WHERE Titulo LIKE '%PHP%'

--37 - Agrupar Registros (GROUP BY)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio DECIMAL(5,2),
Cantidad TINYINT,
PRIMARY KEY(Codigo)
)

INSERT INTO Libros
VALUES('El aleph','Borges','Planeta',15,NULL)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Emece',22.20,200)
INSERT INTO Libros
VALUES('Antologia Poetica','J.L. Borges','Planeta',NULL,150)
INSERT INTO Libros
VALUES('Aprenda PHP','Mario Molina','Emece',18.20,NULL)
INSERT INTO Libros
VALUES('Cervantes y el Quijote','Bioy Casares- J.L. Borges','Paidos',NULL,100)
INSERT INTO Libros
VALUES('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120)
INSERT INTO Libros
VALUES('Harry Potter y la Piedra Filosofal','J.K. Rowling',DEFAULT,45.00,90)
INSERT INTO Libros
VALUES('Harry Potter y la Camara Secreta','J.K. Rowling','Emece',NULL,100)
INSERT INTO Libros
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Paidos',22.50,200)
INSERT INTO Libros
VALUES('PHP de la A a la Z',NULL,NULL,NULL,0)

SELECT Editorial, COUNT(*)
FROM Libros
GROUP BY Editorial

SELECT Editorial, COUNT(Precio)
FROM Libros
GROUP BY Editorial

SELECT Editorial, SUM(Precio)
FROM Libros
GROUP BY Editorial

SELECT Editorial,
MAX(Precio) AS Mayor,
MIN(Precio) AS Menor
FROM Libros
GROUP BY Editorial

SELECT Editorial, AVG(Precio)
FROM Libros
GROUP BY Editorial

SELECT Editorial, COUNT(*)
FROM Libros
WHERE Precio < 30
GROUP BY Editorial

SELECT Editorial, COUNT(*)
FROM Libros
WHERE Precio < 30
GROUP BY ALL Editorial

--38 - Seleccionar Grupos (HAVING)
IF OBJECT_ID('Libros') IS NOT NULL
 DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio DECIMAL(5,2),
Cantidad TINYINT,
PRIMARY KEY(Codigo)
)

INSERT INTO Libros
VALUES('El aleph','Borges','Planeta',35,NULL)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Emece',22.20,200)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Planeta',40,200)
INSERT INTO Libros
VALUES('Antologia Poetica','J.L. Borges','Planeta',NULL,150)
INSERT INTO Libros
VALUES('Aprenda PHP','Mario Molina','Emece',18,NULL)
INSERT INTO Libros
VALUES('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120)
INSERT INTO Libros
VALUES('Cervantes y el Quijote','Bioy Casares- J.L. Borges','Paidos',NULL,100)
INSERT INTO Libros
VALUES('Harry Potter y la Piedra Filosofal','J.K. Rowling',DEFAULT,45.00,90)
INSERT INTO Libros
VALUES('Harry Potter y la Camara Secreta','J.K. Rowling','Emece',NULL,100)
INSERT INTO Libros
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Paidos',42,80)
INSERT INTO Libros
VALUES('PHP de la A a la Z',NULL,NULL,110,0)
INSERT INTO Libros
VALUES('Uno','Richard Bach','Planeta',25,NULL)

 SELECT Editorial, COUNT(*) FROM Libros
 GROUP BY Editorial
 HAVING COUNT(*) > 2

 SELECT Editorial, AVG(Precio) 
 FROM Libros
 GROUP BY Editorial
 HAVING AVG(Precio) > 25

SELECT Editorial, COUNT(*) 
FROM Libros
WHERE Precio IS NOT NULL
GROUP BY Editorial
HAVING Editorial <> 'Planeta'

SELECT Editorial, AVG(Precio) 
FROM Libros
GROUP BY Editorial
HAVING COUNT(*) > 2

SELECT Editorial, MAX(Precio) AS 'Mayor' 
FROM Libros
GROUP BY Editorial
HAVING MAX(Precio) < 100 AND MAX(Precio) > 30
ORDER BY Editorial

--43 - Registros duplicados (DISTINCT)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(15),
PRIMARY KEY(Codigo)
)

GO

INSERT INTO Libros
VALUES('El aleph','Borges','Planeta')
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Emece')
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez','Planeta')
INSERT INTO Libros
VALUES('Antologia Poetica','Borges','Planeta')
INSERT INTO Libros
VALUES('Aprenda PHP','Mario Molina','Emece')
INSERT INTO Libros
VALUES('Aprenda PHP','Lopez','Emece')
INSERT INTO Libros
VALUES('Manual de PHP', 'J. Paez', NULL)
INSERT INTO Libros
VALUES('Cervantes y el Quijote',NULL,'Paidos')
INSERT INTO Libros
VALUES('Harry Potter y la Piedra Filosofal','J.K. Rowling','Emece')
INSERT INTO Libros
VALUES('Harry Potter y la Camara Secreta','J.K. Rowling','Emece')
INSERT INTO Libros
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Paidos')
INSERT INTO Libros
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Planeta')
INSERT INTO Libros
VALUES('PHP de la A a la Z',NULL,NULL)
INSERT INTO Libros
VALUES('Uno','Richard Bach','Planeta')

SELECT DISTINCT Autor 
FROM Libros

SELECT DISTINCT Autor 
FROM Libros
WHERE Autor IS NOT NULL

SELECT COUNT(DISTINCT Autor)
FROM Libros

SELECT DISTINCT Editorial 
FROM Libros

SELECT COUNT(DISTINCT Editorial) 
FROM Libros

SELECT DISTINCT Autor 
FROM Libros
WHERE Editorial='Planeta'

SELECT Editorial,COUNT(DISTINCT Autor)
FROM Libros
GROUP BY Editorial

SELECT DISTINCT Titulo, Editorial
FROM Libros
ORDER BY Titulo

--44 - Cláusula TOP
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(20),
Editorial VARCHAR(20)
)

INSERT INTO Libros 
VALUES ('Uno','Richard Bach','Planeta')
INSERT INTO Libros 
VALUES ('El aleph','Borges','Emece')
INSERT INTO Libros 
VALUES ('Alicia en el Pais...','Carroll','Planeta')
INSERT INTO Libros 
 VALUES ('Aprenda PHP','Mario Molina','Siglo XXI')
INSERT INTO Libros 
VALUES ('Java en 10 Minutos','Mario Molina','Siglo XXI')
INSERT INTO Libros 
VALUES ('Java desde cero','Mario Molina','Emece')
INSERT INTO Libros 
VALUES ('Ilusiones','Richard Bach','Planeta')

SELECT TOP 2 * FROM Libros

SELECT TOP 3 Titulo, Autor 
FROM Libros
ORDER BY Autor

SELECT TOP 3 with ties Titulo, Autor 
FROM Libros
ORDER BY Autor

SELECT TOP 50 
PERCENT * FROM Libros
ORDER BY Autor

-- 53 - Eliminar reSTRicciONes (ALTER TABLE - DROP)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo int NOT NULL,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio DECIMAL(6,2)
)

ALTER TABLE Libros
ADD CONSTRAINT PK_Libros_Codigo
PRIMARY KEY(Codigo)

/*ALTER TABLE Libros
ADD CONSTRAINT CK_Libros_Precio
CHECK (Precio >= 0)*/

ALTER TABLE Libros
ADD CONSTRAINT DF_Libros_Autor
DEFAULT 'Desconocido'
FOR Autor

ALTER TABLE Libros
ADD CONSTRAINT DF_Libros_Precio
DEFAULT 0
FOR Precio

EXEC sp_helpCONSTRAINT Libros

ALTER TABLE Libros
DROP DF_Libros_Autor

ALTER TABLE Libros
DROP PK_Libros_Codigo

EXEC sp_helpCONSTRAINT Libros

--66 - Combinación Interna (INNER JOIN)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(20),
Autor VARCHAR(15) DEFAULT 'Desconocido',
CodigoEditorial TINYINT NOT NULL,
Precio DECIMAL(5,2)
)

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
PRIMARY KEY (Codigo)
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Siglo XXI')

GO

INSERT INTO Libros 
VALUES('El aleph','Borges',2,20)
INSERT INTO Libros 
VALUES('Martin Fierro','Jose Hernandez',1,30)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina',3,50)
INSERT INTO Libros 
VALUES('Java en 10 Minutos',DEFAULT,3,45)

SELECT * FROM Libros

SELECT Titulo, Autor, Nombre
FROM Libros
JOIN Editoriales
ON CodigoEditorial = Editoriales.Codigo

SELECT l.Codigo, Titulo, Autor, Nombre, Precio
FROM Libros AS l
JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo

SELECT l.Codigo, Titulo, Autor, Nombre, Precio
FROM Libros AS l
JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo
WHERE e.Nombre = 'Siglo XXI'

SELECT Titulo,Autor,Nombre
FROM Libros AS l
JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo
ORDER BY Titulo

-- 67 - Combinación externa izquierda (LEFT JOIN)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30) DEFAULT 'Desconocido',
CodigoEditorial TINYINT NOT NULL,
Precio DECIMAL(5,2)
)

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
PRIMARY KEY(Codigo)
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Siglo XXI')

INSERT INTO Libros 
VALUES('El aleph','Borges',1,20)
INSERT INTO Libros 
VALUES('Martin Fierro','Jose Hernandez',1,30)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina',2,50)
INSERT INTO Libros 
VALUES('Java en 10 Minutos',DEFAULT,4,45)

SELECT Titulo,Nombre
FROM Editoriales AS e
LEFT JOIN Libros AS l
ON CodigoEditorial = e.Codigo

SELECT Titulo,Nombre
FROM Libros AS l
LEFT JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo

SELECT Titulo,Nombre
FROM Editoriales AS e
LEFT JOIN Libros AS l
ON e.Codigo = CodigoEditorial
WHERE CodigoEditorial IS NOT NULL

SELECT Titulo,Nombre
FROM Editoriales AS e
LEFT JOIN Libros AS l
ON e.Codigo = CodigoEditorial
WHERE CodigoEditorial IS NULL

--68 - Combinación externa derecha (RIGHT JOIN)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30) DEFAULT 'Desconocido',
CodigoEditorial TINYINT NOT NULL,
Precio DECIMAL(5,2)
)

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
PRIMARY KEY (Codigo)
)

INSERT INTO Editoriales
VALUES('Planeta')
INSERT INTO Editoriales
VALUES('Emece')
INSERT INTO Editoriales
VALUES('Siglo XXI')

INSERT INTO Libros
VALUES('El aleph','Borges',1,20)
INSERT INTO Libros
VALUES('Martin Fierro','Jose Hernandez',1,30)
INSERT INTO Libros
VALUES('Aprenda PHP','Mario Molina',2,50)
INSERT INTO Libros
VALUES('Java en 10 Minutos',DEFAULT,4,45)

SELECT Titulo,Nombre
FROM Libros AS l
RIGHT JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo

SELECT Titulo,Nombre
FROM Libros AS l
RIGHT JOIN Editoriales AS e
ON e.Codigo = CodigoEditorial
WHERE CodigoEditorial IS NOT NULL

SELECT Titulo,Nombre
FROM Libros AS l
RIGHT JOIN Editoriales AS e
ON e.Codigo = CodigoEditorial
WHERE CodigoEditorial IS NULL

--69 - Combinación externa completa (full JOIN)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(20),
Autor VARCHAR(15) DEFAULT 'Desconocido',
CodigoEditorial TINYINT NOT NULL,
Precio DECIMAL(5,2)
)

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
PRIMARY KEY (Codigo)
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Siglo XXI')

--70 - Combinaciones cruzadAS (CROSS JOIN)
IF OBJECT_ID('Comidas') IS NOT NULL
DROP TABLE Comidas

IF OBJECT_ID('Postres ') IS NOT NULL
DROP TABLE Postres 

CREATE TABLE Comidas(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(30),
Precio DECIMAL(4,2)
)

CREATE TABLE Postres (
Codigo TINYINT IDENTITY,
Nombre VARCHAR(30),
Precio DECIMAL(4,2)
)

INSERT INTO Comidas 
VALUES('Ravioles',5)
INSERT INTO Comidas 
VALUES('Tallarines',4)
INSERT INTO Comidas 
VALUES('Milanesa',7)
INSERT INTO Comidas 
VALUES('Cuarto De Pollo',6)

INSERT INTO Postres  
VALUES('Flan',2.5)
INSERT INTO Postres  
VALUES('Porción Torta',3.5)

SELECT c.Nombre AS 'Plato Principal',
p.Nombre AS 'Postres ',
c.Precio + p.Precio AS 'Total'
FROM Comidas AS c
CROSS JOIN Postres  AS p

--73 - Combinación de más de dos tablas
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Autores') IS NOT NULL
DROP TABLE Autores

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
CodigoAutor int NOT NULL,
CodigoEditorial TINYINT NOT NULL,
Precio DECIMAL(5,2),
PRIMARY KEY(Codigo)
)

CREATE TABLE Autores(
Codigo INT IDENTITY,
Nombre VARCHAR(20),
PRIMARY KEY(Codigo)
)

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
PRIMARY KEY(Codigo)
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Siglo XXI')
INSERT INTO Editoriales 
VALUES('Plaza')
 
INSERT INTO Autores
VALUES ('Richard Bach')
INSERT INTO Autores 
VALUES ('Borges')
INSERT INTO Autores 
VALUES ('Jose Hernandez')
INSERT INTO Autores 
VALUES ('Mario Molina')
INSERT INTO Autores 
VALUES ('Paenza')
 
INSERT INTO Libros 
VALUES('El aleph',2,2,20)
INSERT INTO Libros 
VALUES('Martin Fierro',3,1,30)
INSERT INTO Libros 
VALUES('Aprenda PHP',4,3,50)
INSERT INTO Libros 
VALUES('Uno',1,1,15)
INSERT INTO Libros 
VALUES('Java en 10 Minutos',0,3,45)
INSERT INTO Libros 
VALUES('Matematica estas ahi',0,0,15)
INSERT INTO Libros 
VALUES('Java de la A a la Z',4,0,50)

SELECT Titulo, a.Nombre, e.Nombre, Precio
FROM Autores AS a
JOIN Libros AS l
ON CodigoAutor = a.Codigo
JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo

SELECT Titulo, a.Nombre, e.Nombre, Precio
FROM Autores AS a
RIGHT JOIN Libros AS l
ON CodigoAutor = a.Codigo
LEFT JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo

--48 - Combinaciones con UPDATE y DELETE
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30) DEFAULT 'Desconocido',
CodigoEditorial TINYINT NOT NULL,
Precio DECIMAL(5,2)
)

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
PRIMARY KEY(Codigo)
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Siglo XXI')

INSERT INTO Libros 
VALUES('El aleph','Borges',2,20)
INSERT INTO Libros 
VALUES('Martin Fierro','Jose Hernandez',1,30)
INSERT INTO Libros
VALUES('Aprenda PHP','Mario Molina',3,50)
INSERT INTO Libros 
VALUES('Java en 10 Minutos',DEFAULT,3,45)

UPDATE Libros SET Precio = Precio + (Precio*0.1)
FROM Libros 
JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo
WHERE Nombre = 'Planeta'

SELECT Titulo,Autor, e.Nombre, Precio
FROM Libros AS l
JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo

DELETE Libros
FROM Libros
JOIN Editoriales
ON CodigoEditorial = Editoriales.Codigo
WHERE Editoriales.Nombre = 'Emece'

SELECT Titulo, Autor, e.Nombre, Precio
FROM Libros AS l
JOIN Editoriales AS e
ON CodigoEditorial = e.Codigo

--82 - UNION
IF OBJECT_ID('Alumnos') IS NOT NULL
DROP TABLE Alumnos

IF OBJECT_ID('Profesores') IS NOT NULL
DROP TABLE Profesores

CREATE TABLE Profesores(
Documento VARCHAR(8) NOT NULL,
Nombre VARCHAR(30),
Domicilio VARCHAR(30),
PRIMARY KEY(Documento)
)

CREATE TABLE Alumnos(
Documento VARCHAR(8) NOT NULL,
Nombre VARCHAR (30),
Domicilio VARCHAR(30),
PRIMARY KEY(Documento)
)

INSERT INTO Alumnos 
VALUES('30000000','Juan Perez','Colon 123')
INSERT INTO Alumnos 
VALUES('30111111','Marta MORales','Caseros 222')
INSERT INTO Alumnos 
VALUES('30222222','Laura Torres','San Martin 987')
INSERT INTO Alumnos 
VALUES('30333333','Mariano Juarez','Avellaneda 34')
INSERT INTO Alumnos 
VALUES('23333333','Federico Lopez','Colon 987')

INSERT INTO Profesores
VALUES('22222222','Susana Molina','Sucre 345')
INSERT INTO Profesores
VALUES('23333333','Federico Lopez','Colon 987')

SELECT Nombre, Domicilio 
FROM Alumnos 
UNION 
SELECT Nombre, Domicilio 
FROM Profesores

SELECT Nombre, Domicilio 
FROM Alumnos 
UNION ALL 
SELECT Nombre, Domicilio 
FROM Profesores

SELECT Nombre, Domicilio 
FROM Alumnos 
UNION 
SELECT Nombre, Domicilio 
FROM Profesores
ORDER BY Domicilio

SELECT Nombre, Domicilio, 'Alumno' 
AS Condicion 
FROM Alumnos 
UNION 
SELECT Nombre, Domicilio,'Profesor' 
FROM Profesores
ORDER BY Condicion

--83 - Agregar y Eliminar campos (ALTER TABLE - ADD - DROP)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Titulo VARCHAR(20),
Editorial VARCHAR(10),
Edicion DATETIME,
Precio DECIMAL(6,2)
)

ALTER TABLE Libros 
ADD Cantidad TINYINT

EXEC sp_columns Libros

ALTER TABLE Libros 
ADD Codigo INT IDENTITY

ALTER TABLE Libros 
ADD Autor VARCHAR(30) NOT NULL

ALTER TABLE Libros 
ADD Autor VARCHAR(20) NOT NULL DEFAULT 'Desconocido'

ALTER TABLE Libros 
DROP Column Precio

EXEC sp_Columns Libros

ALTER TABLE Libros 
DROP Column Autor

ALTER TABLE Libros 
DROP Column Editorial, Edicion

--84 - ALTERar campos (ALTER TABLE - ALTER)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(30),
Autor VARCHAR(30),
Editorial VARCHAR(15),
Precio DECIMAL(6,2) NOT NULL DEFAULT 0
)

ALTER TABLE Libros ALTER 
Column Titulo VARCHAR(40) NOT NULL

DELETE FROM Libros 
WHERE Autor IS NULL

ALTER TABLE Libros ALTER 
Column Autor VARCHAR(30) NOT NULL

ALTER TABLE Libros ALTER 
Column Codigo SMALLINT

EXEC sp_Columns Libros

ALTER TABLE Libros ALTER 
Column Precio DECIMAL(6,2) NULL

--86 - Campos Calculados
IF OBJECT_ID('Empleados') IS NOT NULL
DROP TABLE Empleados

CREATE TABLE Empleados(
Documento CHAR(8),
Nombre VARCHAR(10),
Domicilio VARCHAR(30),
SueldoBasico DECIMAL(6,2),
Hijos TINYINT NOT NULL DEFAULT 0,
SueldoTotal AS SueldoBasico + (Hijos * 100)
)

INSERT INTO Empleados 
VALUES('22222222','Juan Perez','Colon 123',300,2)

INSERT INTO Empleados 
VALUES('23333333','Ana Lopez','Sucre 234',500,0)

SELECT * FROM Empleados

UPDATE Empleados SET Hijos = 1 
WHERE Documento = '23333333'

SELECT * FROM Empleados

ALTER TABLE Empleados 
ADD SalarioFamiliar AS Hijos * 100

EXEC sp_columns Empleados

SELECT * FROM Empleados

--92 - Subconsultas como expresión
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(20),
Precio DECIMAL(5,2)
)

INSERT INTO Libros 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',20.00)
INSERT INTO Libros 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Plaza',35.00)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Siglo XXI',40.00)
INSERT INTO Libros 
VALUES('El aleph','Borges','Emece',10.00)
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach','Planeta',15.00)
INSERT INTO Libros 
VALUES('Java en 10 Minutos','Mario Molina','Siglo XXI',50.00)
INSERT INTO Libros 
VALUES('Martin Fierro','Jose Hernandez','Planeta',20.00)
INSERT INTO Libros 
VALUES('Martin Fierro','Jose Hernandez','Emece',30.00)
INSERT INTO Libros 
VALUES('Uno','Richard Bach','Planeta',10.00)

SELECT Titulo,Precio,
Precio - (SELECT MAX (Precio) 
FROM Libros) 
AS dIFerencia
FROM Libros
WHERE Titulo = 'Uno'

SELECT Titulo,Autor, Precio
FROM Libros
WHERE Precio = 
(SELECT MAX (Precio) 
FROM Libros)

UPDATE Libros SET Precio = 45
WHERE Precio =
(SELECT MAX (Precio) FROM Libros)

DELETE FROM Libros
WHERE Precio =
(SELECT MIN(Precio) FROM Libros)

--56 - Subconsultas con IN
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(30),
PRIMARY KEY (Codigo)
)
 
CREATE TABLE Libros (
Codigo INT IDENTITY,
Titulo VARCHAR(20),
Autor VARCHAR(15),
CodigoEditorial TINYINT,
PRIMARY KEY(Codigo),
CONSTRAINT FK_Libros_Editorial
FOREIGN KEY(CodigoEditorial)
REFERENCES Editoriales(Codigo)
ON UPDATE CASCADE
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Paidos')
INSERT INTO Editoriales 
VALUES('Siglo XXI')

INSERT INTO Libros 
VALUES('Uno','Richard Bach',1)
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach',1)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina',4)
INSERT INTO Libros 
VALUES('El aleph','Borges',2)
INSERT INTO Libros 
VALUES('Puente al INfINito','Richard Bach',2)

SELECT Nombre
FROM Editoriales
WHERE Codigo IN
(SELECT CodigoEditorial
FROM Libros
WHERE Autor = 'Richard Bach')

SELECT CodigoEditorial
FROM Libros
WHERE Autor = 'Richard Bach'

SELECT DISTINCT Nombre
FROM Editoriales AS e
JOIN Libros
ON CodigoEditorial = e.Codigo
WHERE Autor = 'Richard Bach'

SELECT Nombre
FROM Editoriales
WHERE Codigo NOT IN
(SELECT CodigoEditorial
FROM Libros
WHERE Autor = 'Richard Bach')

--94 - Subconsultas any - some - ALL
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(30),
PRIMARY KEY (Codigo)
)
 
CREATE TABLE Libros (
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
CodigoEditorial TINYINT,
Precio DECIMAL(5,2),
PRIMARY KEY(Codigo),
CONSTRAINT FK_Libros_Editorial
FOREIGN KEY(CodigoEditorial)
REFERENCES Editoriales(Codigo)
ON UPDATE CASCADE,
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Paidos')
INSERT INTO Editoriales 
VALUES('Siglo XXI')

INSERT INTO Libros 
VALUES('Uno','Richard Bach',1,15)
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach',4,18)
INSERT INTO Libros 
VALUES('Puente al INfINito','Richard Bach',2,19)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina',4,40)
INSERT INTO Libros 
VALUES('El aleph','Borges',2,10)
INSERT INTO Libros 
VALUES('Antología','Borges',1,20)
INSERT INTO Libros 
VALUES('Cervantes y el Quijote','Borges',3,25)

SELECT Titulo
FROM Libros
WHERE Autor LIKE '%Borges%' AND
CodigoEditorial = any
(SELECT e.Codigo
FROM Editoriales AS e
JOIN Libros AS l
ON CodigoEditorial = e.Codigo
WHERE l.Autor LIKE '%Bach%')

SELECT Titulo,Precio
FROM Libros
WHERE Autor LIKE '%Borges%' AND
Precio > any
(SELECT Precio
FROM Libros
WHERE Autor LIKE '%Bach%')

SELECT Titulo,Precio
FROM Libros
WHERE Autor LIKE '%Borges%' AND
Precio > ALL
(SELECT Precio
FROM Libros
WHERE Autor LIKE '%Bach%')

DELETE FROM Libros
WHERE Autor LIKE '%Borges%' AND
Precio > ALL
(SELECT Precio
FROM Libros
WHERE Autor LIKE '%Bach%')

--95 - Subconsultas CORrelacionadas
IF OBJECT_ID('Facturas') IS NOT NULL

CREATE TABLE Facturas(
Numero INT NOT NULL,
Fecha DATETIME,
Clientes VARCHAR(30),
PRIMARY KEY(Numero)
)

CREATE TABLE Detalles(
NumeroFactura int NOT NULL,
NumeroItem int NOT NULL, 
Articulo VARCHAR(30),
Precio DECIMAL(5,2),
Cantidad INT,
PRIMARY KEY(NumeroFactura, NumeroItem),
CONSTRAINT FK_Detalles_NumeroFactura
FOREIGN KEY(NumeroFactura)
REFERENCES Facturas(Numero)
ON UPDATE CASCADE
ON DELETE CASCADE,
)

INSERT INTO Facturas 
VALUES(1200,'2018-01-15','Juan Lopez')
INSERT INTO Facturas 
VALUES(1201,'2018-01-15','Luis Torres')
INSERT INTO Facturas 
VALUES(1202,'2018-01-15','Ana Garcia')
INSERT INTO Facturas 
VALUES(1300,'2018-01-20','Juan Lopez')

INSERT INTO Detalles 
VALUES(1200,1,'Lapiz',1,100)
INSERT INTO Detalles 
VALUES(1200,2,'Goma',0.5,150)
INSERT INTO Detalles 
VALUES(1201,1,'Regla',1.5,80)
INSERT INTO Detalles 
VALUES(1201,2,'Goma',0.5,200)
INSERT INTO Detalles 
VALUES(1201,3,'Cuaderno',4,90)
INSERT INTO Detalles 
VALUES(1202,1,'Lapiz',1,200)
INSERT INTO Detalles 
VALUES(1202,2,'Escuadra',2,100)
INSERT INTO Detalles 
VALUES(1300,1,'Lapiz',1,300)

SELECT f.*,
(SELECT COUNT(d.NumeroItem)
FROM Detalles AS d
WHERE f.Numero = d.NumeroFactura) AS Cantidad,
(SELECT SUM(d.Precio * Cantidad)
FROM Detalles AS d
WHERE f.Numero = d.NumeroFactura) AS Total
FROM Facturas AS f

--96 -EXISTS y NoEXISTS
IF OBJECT_ID('Detalles') IS NOT NULL 
DROP TABLE Detalles

IF OBJECT_ID('Facturas') IS NOT NULL 
DROP TABLE Facturas

CREATE TABLE Facturas(
Numero INT NOT NULL,
Fecha DATETIME,
Clientes VARCHAR(30),
PRIMARY KEY(Numero)
)

CREATE TABLE Detalles(
NumeroFactura int NOT NULL,
NumeroItem int NOT NULL, 
Articulo VARCHAR(30),
Precio DECIMAL(5,2),
Cantidad INT,
PRIMARY KEY(NumeroFactura, NumeroItem),
CONSTRAINT FK_Detalles_NumeroFactura
FOREIGN KEY(NumeroFactura)
REFERENCES Facturas(Numero)
ON UPDATE CASCADE
ON DELETE CASCADE
)

INSERT INTO Facturas 
VALUES(1200,'2018-01-15','Juan Lopez')
INSERT INTO Facturas 
VALUES(1201,'2018-01-15','Luis Torres')
INSERT INTO Facturas 
VALUES(1202,'2018-01-15','Ana Garcia')
INSERT INTO Facturas 
VALUES(1300,'2018-01-20','Juan Lopez')

INSERT INTO Detalles 
 VALUES(1200,1,'Lapiz',1,100)
INSERT INTO Detalles 
 VALUES(1200,2,'Goma',0.5,150)
INSERT INTO Detalles 
 VALUES(1201,1,'Regla',1.5,80)
INSERT INTO Detalles 
VALUES(1201,2,'Goma',0.5,200)
INSERT INTO Detalles 
VALUES(1201,3,'Cuaderno',4,90)
INSERT INTO Detalles 
VALUES(1202,1,'Lapiz',1,200)
INSERT INTO Detalles 
VALUES(1202,2,'Escuadra',2,100)
INSERT INTO Detalles 
VALUES(1300,1,'Lapiz',1,300)

SELECT Clientes, Numero
FROM Facturas AS f
WHERE EXISTS
(SELECT *FROM Detalles AS d
WHERE f.Numero = d.NumeroFactura
AND d.Articulo = 'Lapiz')

SELECT Clientes,Numero
FROM Facturas AS f
WHERE NOT EXISTS
(SELECT *FROM Detalles AS d
WHERE f.Numero = d.NumeroFactura
AND d.Articulo = 'Lapiz')

--98 - Subconsulta en lugar de una tabla
IF OBJECT_ID('Detalles') IS NOT NULL 
DROP TABLE Detalles

IF OBJECT_ID('Facturas') IS NOT NULL 
DROP TABLE Facturas

IF OBJECT_ID('Clientes') IS NOT NULL 
DROP TABLE Clientes

CREATE TABLE Clientes(
Codigo INT IDENTITY,
Nombre VARCHAR(30),
Domicilio VARCHAR(30),
PRIMARY KEY(Codigo)
)

CREATE TABLE Facturas(
Numero INT NOT NULL,
Fecha DATETIME,
CodigoClientes int NOT NULL,
PRIMARY KEY(Numero),
CONSTRAINT FK_Facturas_Clientes
FOREIGN KEY(CodigoClientes)
REFERENCES Clientes(Codigo)
ON UPDATE CASCADE
)

CREATE TABLE Detalles(
NumeroFactura int NOT NULL,
NumeroItem int NOT NULL, 
Articulo VARCHAR(30),
Precio DECIMAL(5,2),
Cantidad INT,
PRIMARY KEY(NumeroFactura, NumeroItem),
CONSTRAINT FK_Detalles_NumeroFactura
FOREIGN KEY(NumeroFactura)
REFERENCES Facturas(Numero)
ON UPDATE CASCADE
ON DELETE CASCADE,
)

INSERT INTO Clientes 
VALUES('Juan Lopez','Colon 123')
INSERT INTO Clientes 
VALUES('Luis Torres','Sucre 987')
INSERT INTO Clientes 
VALUES('Ana Garcia','Sarmiento 576')

INSERT INTO Facturas 
VALUES(1200,'2018-01-15',1)
INSERT INTO Facturas 
VALUES(1201,'2018-01-15',2)
INSERT INTO Facturas 
VALUES(1202,'2018-01-15',3)
INSERT INTO Facturas
VALUES(1300,'2018-01-20',1)

INSERT INTO Detalles 
VALUES(1200,1,'Lapiz',1,100)
INSERT INTO Detalles 
VALUES(1200,2,'Goma',0.5,150)
INSERT INTO Detalles 
VALUES(1201,1,'Regla',1.5,80)
INSERT INTO Detalles 
VALUES(1201,2,'Goma',0.5,200)
INSERT INTO Detalles 
VALUES(1201,3,'Cuaderno',4,90)
INSERT INTO Detalles 
VALUES(1202,1,'Lapiz',1,200)
INSERT INTO Detalles 
VALUES(1202,2,'Escuadra',2,100)
INSERT INTO Detalles 
VALUES(1300,1,'Lapiz',1,300)

SELECT f.*,
(SELECT SUM(d.Precio*Cantidad)
FROM Detalles AS d
WHERE f.Numero = d.NumeroFactura) AS Total
FROM Facturas AS f

SELECT td.Numero, c.Nombre, td.Total
FROM Clientes AS c
JOIN (SELECT f.*,
(SELECT SUM(d.Precio * Cantidad)
FROM Detalles AS d
WHERE f.Numero = d.NumeroFactura) AS Total
FROM Facturas AS f) AS td
ON td.CodigoClientes = c.Codigo

--99 - Subconsulta (UPDATE - DELETE)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Editoriales(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(30),
PRIMARY KEY (Codigo)
)
 
CREATE TABLE Libros (
Codigo INT IDENTITY,
Titulo VARCHAR(20),
Autor VARCHAR(15),
CodigoEditorial TINYINT,
Precio DECIMAL(5,2),
PRIMARY KEY(Codigo)
)

INSERT INTO Editoriales 
VALUES('Planeta')
INSERT INTO Editoriales 
VALUES('Emece')
INSERT INTO Editoriales 
VALUES('Paidos')
INSERT INTO Editoriales 
VALUES('Siglo XXI')

INSERT INTO Libros 
VALUES('Uno','Richard Bach',1,15)
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach',2,20)
INSERT INTO Libros 
VALUES('El aleph','Borges',3,10)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina',4,40)
INSERT INTO Libros 
VALUES('PoemAS','Juan Perez',1,20)
INSERT INTO Libros 
VALUES('Cuentos','Juan Perez',3,25)
INSERT INTO Libros
VALUES('Java en 10 Minutos','Marcelo Perez',2,30)

UPDATE Libros SET Precio = Precio + (Precio*0.1)
WHERE CodigoEditorial =
(SELECT Codigo
FROM Editoriales
WHERE Nombre = 'Emece')

DELETE FROM Libros
WHERE CodigoEditorial IN
(SELECT e.Codigo
FROM Editoriales AS e
JOIN Libros
ON CodigoEditorial = e.Codigo
WHERE Autor = 'Juan Perez')

--100 - Subconsulta (INSERT)
IF OBJECT_ID('Alumnos') IS NOT NULL
DROP TABLE Alumnos

IF OBJECT_ID('Aprobados') IS NOT NULL
DROP TABLE Aprobados

CREATE TABLE Alumnos(
Documento CHAR(8) NOT NULL,
Nombre VARCHAR(30),
Nota DECIMAL(4,2)
CONSTRAINT CK_Alumnos_Nota_valores CHECK (Nota >= 0 AND Nota <= 10),
PRIMARY KEY(Documento),
)

CREATE TABLE Aprobados(
Documento CHAR(8) NOT NULL,
Nota DECIMAL(4,2)
CONSTRAINT CK_Aprobados_Nota_valores CHECK (Nota >= 0 AND Nota <= 10),
PRIMARY KEY(Documento),
)

INSERT INTO Alumnos 
VALUES('30000000','Ana Acosta',8)
INSERT INTO Alumnos 
VALUES('30111111','BetINa Bustos',9)
INSERT INTO Alumnos 
VALUES('30222222','Carlos Caseros',2.5)
INSERT INTO Alumnos 
VALUES('30333333','Daniel Duarte',7.7)
INSERT INTO Alumnos 
VALUES('30444444','Estela Esper',3.4)

INSERT INTO Aprobados 

SELECT Documento, Nota
FROM Alumnos
WHERE Nota >= 4

SELECT * FROM Aprobados

--101 - Crear tabla a partir de otra (SELECT -into)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

IF OBJECT_ID('Editoriales') IS NOT NULL
DROP TABLE Editoriales

CREATE TABLE Libros( 
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(30),
Editorial VARCHAR(20),
Precio DECIMAL(5,2),
PRIMARY KEY(Codigo)
)

GO

INSERT INTO Libros 
VALUES('Uno','Richard Bach','Planeta',15)
INSERT INTO Libros 
VALUES('El aleph','Borges','Emece',25)
INSERT INTO Libros 
VALUES('Matematica estas ahi','Paenza','Nuevo siglo',18)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Nuevo siglo',45)
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach','Planeta',14)
INSERT INTO Libros 
VALUES('Java en 10 Minutos','Mario Molina','Nuevo siglo',50)

SELECT DISTINCT Editorial AS Nombre
INTO Editoriales
FROM Libros

SELECT * FROM Editoriales

IF OBJECT_ID('CantidadPorEditorial') IS NOT NULL
DROP TABLE CantidadPorEditorial
  
SELECT Editorial AS Nombre,COUNT(*) AS Cantidad
INTO CantidadPorEditorial
FROM Libros
GROUP BY Editorial

SELECT *FROM CantidadPorEditorial

IF OBJECT_ID('Ofertas') IS NOT NULL
DROP TABLE Ofertas

SELECT TOP 4 * into Ofertas
FROM Libros
ORDER BY Precio ASC

SELECT * FROM Ofertas

ALTER TABLE Editoriales 
ADD Ciudad VARCHAR(30)

/*UPDATE Editoriales SET Ciudad = 'Cordoba' 
WHERE Nombre = 'Planeta'
UPDATE Editoriales SET Ciudad = 'Cordoba' 
WHERE Nombre = 'Emece'
UPDATE Editoriales SET Ciudad = 'Buenos Aires' 
WHERE Nombre = 'Nuevo siglo'*/

IF OBJECT_ID('LibrosDeCordoba') IS NOT NULL
DROP TABLE LibrosDeCordoba

/*SELECT Titulo, Autor
into LibrosDeCordoba
FROM Libros
JOIN Editoriales
ON Editorial = Nombre 
WHERE Ciudad = 'Cordoba'*/

--SELECT * FROM LibrosDeCordoba

--Go tiene un uso importante de la 103 en adelante: 
--Es un signo de finalización de un lote de sentenciAS SQL. 
--No es una sentencia, es un Comando.

--103 - VistAS
IF OBJECT_ID('Empleados') IS NOT NULL
DROP TABLE Empleados

IF OBJECT_ID('Secciones') IS NOT NULL
DROP TABLE Secciones

CREATE TABLE Secciones(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
Sueldo DECIMAL(5,2),
CONSTRAINT CK_Secciones_Sueldo CHECK(Sueldo >= 0),
CONSTRAINT PK_Secciones PRIMARY KEY(Codigo)
)

CREATE TABLE Empleados(
Legajo INT IDENTITY,
Documento CHAR(8)
CONSTRAINT CK_Empleados_Documento CHECK(Documento LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Sexo CHAR(1)
CONSTRAINT CK_Empleados_Sexo CHECK(Sexo IN ('f','m')),
Apellido VARCHAR(20),
Nombre VARCHAR(20),
Domicilio VARCHAR(30),
Seccion TINYINT NOT NULL,
CantidadHijos TINYINT
CONSTRAINT CK_Empleados_Hijos CHECK(CantidadHijos >= 0),
EstadoCivil CHAR(10)
CONSTRAINT CK_Empleados_EstadoCivil CHECK(EstadoCivil IN ('Casado','DivORciado','Soltero','Viudo')),
FechaINgreso DATETIME,
CONSTRAINT PK_Empleados PRIMARY KEY(Legajo),
CONSTRAINT FK_Empleados_Seccion
FOREIGN KEY(Seccion)
REFERENCES Secciones(Codigo)
ON UPDATE CASCADE,
CONSTRAINT UQ_Empleados_Documento
UNIQUE(Documento)
)

INSERT INTO Secciones 
VALUES('AdminiSTRación',300)
INSERT INTO Secciones 
VALUES('contaduría',400)
INSERT INTO Secciones
VALUES('Sistemas',500)

INSERT INTO Empleados 
VALUES('22222222','f','Lopez','Ana','Colon 123',1,2,'Casado','1990-10-10')
INSERT INTO Empleados 
VALUES('23333333','m','Lopez','Luis','Sucre 235',1,0,'Soltero','1990-02-10')
INSERT INTO Empleados 
VALUES('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'DivORciado','1998-07-12')
INSERT INTO Empleados 
VALUES('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'Casado','1998-10-09')
INSERT INTO Empleados 
VALUES('26666666','f','Perez','Laura','Peru 1254',3,3,'Casado','2000-05-09')

IF OBJECT_ID('Vista_Empleados') IS NOT NULL
DROP VIEW Vista_Empleados

GO -- Aplicando el Comando para CREATE VIEW.

CREATE VIEW Vista_Empleados AS
SELECT (Apellido+' '+e.Nombre) AS Nombre, Sexo,
s.Nombre AS Seccion, CantidadHijos
FROM Empleados AS e
JOIN Secciones AS s
ON Codigo = Seccion

GO --Para evitar un error en CREATE VIEW.

SELECT * FROM Vista_Empleados

SELECT Seccion, COUNT(*) AS Cantidad
FROM Vista_Empleados
GROUP BY Seccion

IF OBJECT_ID('Vista_Empleados_INgreso') IS NOT NULL
DROP VIEW Vista_Empleados_INgreso

GO --Para evitar un error en VIEW.

CREATE VIEW Vista_Empleados_INgreso(fecha, Cantidad)
AS
SELECT DATEPART(YEAR, FechaINgreso),
COUNT(*)
FROM Empleados
GROUP BY DATEPART(YEAR, FechaINgreso)

GO --Para evitar un error en VIEW.

SELECT * FROM Vista_Empleados_INgreso

--104 - VistAS (INFORmación)
IF OBJECT_ID('Empleados') IS NOT NULL
DROP TABLE Empleados

IF OBJECT_ID('Secciones') IS NOT NULL
DROP TABLE Secciones

CREATE TABLE Secciones(
Codigo TINYINT IDENTITY,
Nombre VARCHAR(20),
Sueldo DECIMAL(5,2)
CONSTRAINT CK_Secciones_Sueldo CHECK(Sueldo >= 0),
CONSTRAINT PK_Secciones PRIMARY KEY(Codigo)
)

CREATE TABLE Empleados(
Legajo INT IDENTITY,
Documento CHAR(8)
CONSTRAINT CK_Empleados_Documento CHECK(Documento LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Sexo CHAR(1)
CONSTRAINT CK_Empleados_Sexo CHECK(Sexo IN ('f','m')),
Apellido VARCHAR(20),
Nombre VARCHAR(20),
Domicilio VARCHAR(30),
Seccion TINYINT NOT NULL,
CantidadHijos TINYINT
CONSTRAINT CK_Empleados_Hijos CHECK(CantidadHijos >= 0),
EstadoCivil CHAR(10)
CONSTRAINT CK_Empleados_EstadoCivil CHECK(EstadoCivil IN ('Casado','DivORciado','Soltero','Viudo')),
FechaINgreso DATETIME,
CONSTRAINT PK_Empleados PRIMARY KEY(Legajo),
CONSTRAINT FK_Empleados_Seccion
FOREIGN KEY(Seccion)
REFERENCES Secciones(Codigo)
ON UPDATE CASCADE,
CONSTRAINT UQ_Empleados_Documento
UNIQUE(Documento)
)

INSERT INTO Secciones 
VALUES('AdminiSTRación',300)
INSERT INTO Secciones 
VALUES('Contaduría',400)
INSERT INTO Secciones 
VALUES('Sistemas',500)

INSERT INTO Empleados 
VALUES('22222222','f','Lopez','Ana','Colon 123',1,2,'Casado','1990-10-10')
INSERT INTO Empleados 
VALUES('23333333','m','Lopez','Luis','Sucre 235',1,0,'Soltero','1990-02-10')
INSERT INTO Empleados 
VALUES('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'DivORciado','1998-07-12')
INSERT INTO Empleados 
VALUES('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'Casado','1998-10-09')
INSERT INTO Empleados 
VALUES('26666666','f','Perez','Laura','Peru 1254',3,3,'Casado','2000-05-09')

IF OBJECT_ID('Vista_Empleados') IS NOT NULL
DROP VIEW Vista_Empleados

GO --Para evitar un error en CREATE VIEW.

CREATE VIEW Vista_Empleados AS
SELECT (Apellido+' '+e.Nombre) AS Nombre, Sexo,
s.Nombre AS Seccion, CantidadHijos
FROM Empleados AS e
JOIN Secciones AS s
ON Codigo = Seccion

GO --Para evitar un error en CREATE VIEW.

SELECT * FROM Vista_Empleados

EXEC sp_help Vista_Empleados

EXEC sp_helptext Vista_Empleados

EXEC sp_depENDs Vista_Empleados

EXEC sp_depENDs Empleados

SELECT * FROM sysobjects

SELECT * FROM sysobjects
WHERE xtype = 'V' AND-- tipo Vista
name LIKE 'Vista%'--búsqueda con comodín ;

--110 - Lenguaje de control de flujo (Case)
IF OBJECT_ID('Alumnos') IS NOT NULL
DROP TABLE Alumnos

CREATE TABLE Alumnos(
Nombre VARCHAR(40),
Nota TINYINT,
CONSTRAINT CK_Alumnos_Nota CHECK (Nota >= 0 AND Nota <= 10)
)

INSERT INTO Alumnos 
VALUES('Ana Acosta',8)
INSERT INTO Alumnos
VALUES('Carlos Caseres',4)
INSERT INTO Alumnos 
VALUES('Federico Fuentes',2)
INSERT INTO Alumnos 
VALUES('Gaston Guzman',3)
INSERT INTO Alumnos 
VALUES('HectOR Herrero',5)
INSERT INTO Alumnos 
VALUES('Luis Luna',10)
INSERT INTO Alumnos 
VALUES('Marcela MORales',7)
INSERT INTO Alumnos 
VALUES('Marcela MORales',NULL)

SELECT Nombre, Nota, Condicion =
 Case Nota
  WHEN 0 THEN 'Libre'
  WHEN 1 THEN 'Libre'
  WHEN 2 THEN 'Libre'
  WHEN 3 THEN 'Libre'
  WHEN 4 THEN 'Regular'
  WHEN 5 THEN 'Regular'
  WHEN 6 THEN 'Regular'
  WHEN 7 THEN 'Promocionado'
  WHEN 8 THEN 'Promocionado'
  WHEN 9 THEN 'Promocionado'
  WHEN 10 THEN 'Promocionado'
 END
FROM Alumnos

SELECT Nombre, Nota, Condicion =
  Case 
   WHEN Nota < 4 THEN 'Libre'
   WHEN Nota >= 4 AND Nota < 7 THEN 'Regular'
   WHEN Nota >= 7 THEN 'Promocionado'
   ELSE 'sin Nota'
  END
FROM Alumnos

ALTER TABLE Alumnos
ADD Condicion VARCHAR(20)

SELECT * FROM Alumnos
 
 /*UPDATE Alumnos SET Condicion =
  Case
   WHEN Nota < 4 THEN 'Libre'
   WHEN Nota BETWEEN 4 AND 7 THEN 'Regular'
   WHEN Nota > 7 THEN 'Promocionado'
  END;*/
  
SELECT * FROM Alumnos
 
/*SELECT Condicion, COUNT(*) AS Cantidad, Resultado =
  Case Condicion
    WHEN 'Libre' THEN 'repitentes'
    WHEN 'Regular' THEN 'rINden fINal'
    WHEN 'Promocionado' THEN 'no rINden fINal'
    ELSE 'sin datos'
  END
--FROM Alumnos
GROUP BY Condicion
ORDER BY Cantidad*/
 
--111 - Lenguaje de control de flujo (IF)
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40) NOT NULL,
Autor VARCHAR(30),
Editorial VARCHAR(20),
Precio DECIMAL(5,2),
Cantidad TINYINT,
PRIMARY KEY (Codigo)
)

INSERT INTO Libros 
VALUES('Uno','Richard Bach','Planeta',15,100)
INSERT INTO Libros 
VALUES('El aleph','Borges','Emece',20,150)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Nuevo siglo',50,200)
INSERT INTO Libros 
VALUES('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',15,0)
INSERT INTO Libros 
VALUES('Java en 10 Minutos','Mario Molina','Emece',40,200)

IF EXISTS (SELECT *FROM Libros 
 WHERE Cantidad = 0)
  (SELECT Titulo FROM Libros WHERE Cantidad = 0)
 ELSE
  SELECT 'No hay Libros sin stock'

IF EXISTS (SELECT * FROM Libros WHERE Editorial = 'Emece')
 BEGIN
  UPDATE Libros SET Precio = Precio - (Precio*0.1) WHERE Editorial = 'Emece'
  SELECT 'Libros actualizados'
 END
 ELSE
  SELECT 'No hay Registros actualizados'

SELECT * FROM Libros 
WHERE Editorial = 'Emece'

IF EXISTS (SELECT * FROM Libros WHERE Cantidad = 0)
  DELETE FROM Libros WHERE Cantidad = 0
 ELSE
  SELECT 'No hay Registros ElimINados'

IF EXISTS (SELECT * FROM Libros WHERE Cantidad = 0)
  DELETE FROM Libros WHERE Cantidad = 0
 ELSE
  SELECT 'No hay Registros ElimINados'

SELECT Titulo, Costo = iIF(Precio < 38,'Barato','Caro') 
FROM Libros

--120 - Procedimientos Almacenados (Crear - Ejecutar)

IF OBJECT_ID('Pa_Crear_Libros') IS NOT NULL
DROP PROCEDURE Pa_Crear_Libros

Go --Para evitar un error en PROCEDURE

CREATE PROCEDURE Pa_Crear_Libros 
AS
IF OBJECT_ID('Libros')IS NOT NULL
DROP TABLE Libros
 
CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(20),
Precio DECIMAL(5,2),
Cantidad SMALLINT,
PRIMARY KEY(Codigo)
)

INSERT INTO Libros 
VALUES('Uno','Richard Bach','Planeta',15,5)
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach','Planeta',18,50)
INSERT INTO Libros 
VALUES('El aleph','Borges','Emece',25,9)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Nuevo siglo',45,100)
INSERT INTO Libros 
VALUES('Matematica estas ahi','Paenza','Nuevo siglo',12,50)
INSERT INTO Libros 
VALUES('Java en 10 Minutos','Mario Molina','Paidos',35,300)

EXEC Pa_Crear_Libros

SELECT *FROM Libros

EXEC sp_help Pa_Crear_Libros

IF OBJECT_ID('Pa_Libros_Limite_Stock') IS NOT NULL
DROP PROCEDURE Pa_Libros_Limite_Stock

Go --Para evitar un error en PROCEDURE y proc.

CREATE proc Pa_Libros_Limite_Stock
AS
SELECT * FROM Libros

WHERE Cantidad <= 10

EXEC sp_help Pa_Libros_Limite_Stock

EXEC Pa_Libros_Limite_Stock

UPDATE Libros SET Cantidad = 2 WHERE Codigo = 4
EXEC Pa_Libros_Limite_Stock

--135 - Funciones escalares (Crear y llamar)
IF OBJECT_ID('Empleados') IS NOT NULL
DROP TABLE Empleados

CREATE TABLE Empleados(
Documento CHAR(8) NOT NULL,
Nombre VARCHAR(30),
FechaINgreso DATETIME,
Mail VARCHAR(50),
Telefono VARCHAR(12)
)

INSERT INTO Empleados 
VALUES('22222222', 'Ana Acosta','1985/10/10','anaacosta@gMail.com','4556677')
INSERT INTO Empleados 
VALUES('23333333', 'Bernardo Bustos', '1986/02/15',NULL,'4558877')
INSERT INTO Empleados 
VALUES('24444444', 'Carlos Caseros','1999/12/02',NULL,NULL)
INSERT INTO Empleados 
VALUES('25555555', 'Diana Dominguez',NULL,NULL,'4252525')

IF OBJECT_ID('dbo.F_FechaCadena') IS NOT NULL
DROP FUNCTION dbo.F_FechaCadena

GO --Para evitar un error en CREATE FUNCTION.

CREATE FUNCTION F_FechaCadena
(@fecha VARCHAR(25))

RETURNS VARCHAR(25)
AS
BEGIN
   DECLARE @Nombre VARCHAR(25)
    SET @Nombre = 'Fecha INválida'
     IF (isdate(@Fecha) = 1)
      BEGIN
        SET @fecha = CAST(@fecha AS DATETIME)
        SET @Nombre =
        Case datename(Month,@fecha)
         WHEN 'January' THEN 'Enero'
         WHEN 'February' THEN 'Febrero'
         WHEN 'March' THEN 'Marzo'
         WHEN 'April' THEN 'Abril'
         WHEN 'May' THEN 'Mayo'
         WHEN 'June' THEN 'Junio'
         WHEN 'July' THEN 'Julio'
         WHEN 'August' THEN 'Agosto'
         WHEN 'September' THEN 'Septiembre'
         WHEN 'October' THEN 'Octubre'
         WHEN 'November' THEN 'Noviembre'
         WHEN 'December' THEN 'Diciembre'
      END --Case
       SET @Nombre = rtrim(CAST(DATEPART(day,@fecha) AS CHAR(2)))+' de '+@Nombre
       SET @Nombre = @Nombre +' de '+ rtrim(CAST(DATEPART(YEAR,@fecha)AS CHAR(4)))
    END --Si es una fecha válida
    RETURN @Nombre
END--BEGIN

GO --Para evitar un error en CREATE FUNCTION.

SELECT Nombre, dbo.F_FechaCadena(FechaIngreso) AS INgreso 
FROM Empleados

SELECT dbo.F_FechaCadena(GETDATE())

--136 - Funciones de tabla de Varias instrucciones
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros 

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(20),
Precio DECIMAL(6,2)
)

 /*INTERT INTO Libros 
VALUES('Uno','Richard Bach','Planeta',15)
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach','Planeta',10)
INSERT INTO Libros 
VALUES('El aleph','Borges','Emece',25)
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Siglo XXI',55)
INSERT INTO Libros 
VALUES('Alicia en el Pais','Lewis Carroll','Paidos',35)
INSERT INTO Libros
VALUES('Matematica estas ahi','Paenza','Nuevo siglo',25)*/

IF OBJECT_ID('F_Ofertas') IS NOT NULL
DROP FUNCTION F_Ofertas

GO --Para evitar un error en CREATE FUNCTION.

CREATE FUNCTION F_Ofertas
 (@mINimo DECIMAL(6,2))

 RETURNS @Ofertas TABLE
 -- Nombre de la tabla
 --Formato de la tabla
 (Codigo int,
  Titulo VARCHAR(40),
  Autor VARCHAR(30),
  Precio DECIMAL(6,2)
 )
 AS
 BEGIN
   INSERT @Ofertas
    SELECT Codigo, Titulo, Autor, Precio
    FROM Libros
    WHERE Precio < @mINimo
   RETURN
END

GO --Para evitar un error en CREATE FUNCTION.

SELECT * FROM Libros

SELECT * FROM F_Ofertas(30)

SELECT l.Titulo, l.Autor, l.Editorial
FROM Libros AS l
JOIN dbo.F_Ofertas(25) AS o
ON l.Codigo = o.Codigo
WHERE l.Autor = 'Richard Bach'

SELECT Titulo, Precio 
FROM F_Ofertas(40)
WHERE Autor LIKE '%B%'

IF OBJECT_ID('F_ListadoLibros') IS NOT NULL
DROP FUNCTION F_ListadoLibros 

 GO --Para evitar un error en CREATE FUNCTION.

 CREATE FUNCTION F_ListadoLibros
 (@opcion VARCHAR(10))

 RETURNS @listado TABLE(
  Titulo VARCHAR(40),
  Detalles VARCHAR(60)
 )
 AS 
 BEGIN
  IF @opcion NOT IN ('Autor','Editorial')
    SET @opcion = 'Autor'
  IF @opcion = 'Editorial'
   INSERT @listado 
    SELECT Titulo,
   (Editorial +'-'+ Autor) 
   FROM Libros
   ORDER BY 2
  ELSE
    IF @opcion = 'Autor'
     INSERT @listado
     SELECT Titulo,
     (Autor +'-'+ Editorial) 
	 FROM Libros  
     ORDER BY 2
  RETURN
END
GO --Para evitar un error en CREATE FUNCTION.

SELECT * FROM dbo.F_ListadoLibros('Autor')

SELECT * FROM dbo.F_ListadoLibros('Editorial')

SELECT * FROM dbo.F_ListadoLibros('Precio')

--137 - Funciones con valores de tabla en línea
IF OBJECT_ID('Libros') IS NOT NULL
DROP TABLE Libros

CREATE TABLE Libros(
Codigo INT IDENTITY,
Titulo VARCHAR(40),
Autor VARCHAR(30),
Editorial VARCHAR(20)
)

GO

INSERT INTO Libros 
VALUES('Uno','Richard Bach','Planeta')
INSERT INTO Libros 
VALUES('El aleph','Borges','Emece')
INSERT INTO Libros 
VALUES('Ilusiones','Richard Bach','Planeta')
INSERT INTO Libros 
VALUES('Aprenda PHP','Mario Molina','Nuevo siglo')
INSERT INTO Libros 
VALUES('Matematica estas ahi','Paenza','Nuevo siglo')

IF OBJECT_ID('F_Libros') IS NOT NULL
DROP FUNCTION F_Libros

GO --Para evitar un error en CREATE FUNCTION.

 CREATE FUNCTION F_Libros
 (@Autor VARCHAR(30) = 'Borges')
 RETURNS TABLE
 AS
 RETURN (
  SELECT Titulo, Editorial
  FROM Libros
  WHERE Autor LIKE '%'+@Autor+'%'
)

GO --Para evitar un error en CREATE FUNCTION.

SELECT * FROM Libros

SELECT * FROM F_Libros('Bach')

IF OBJECT_ID('F_Libros_AutorEditorial') IS NOT NULL
DROP FUNCTION F_Libros_AutorEditorial

GO --Para evitar un error en CREATE FUNCTION.
  
CREATE FUNCTION F_Libros_AutorEditorial
 (@Autor VARCHAR(30) = 'Borges',
 @Editorial VARCHAR(20) = 'Emece')
 RETURNS TABLE
 AS
 RETURN (
  SELECT Titulo, Autor, Editorial
  FROM Libros
  WHERE Autor LIKE '%'+ @Autor +'%' AND Editorial LIKE '%'+ @Editorial +'%'
 )

GO --Para evitar un error en CREATE FUNCTION.

SELECT * FROM F_Libros_AutorEditorial('','Nuevo Siglo')
  
SELECT * FROM F_Libros_AutorEditorial(DEFAULT, DEFAULT)
