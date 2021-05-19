--1 Objetivos y alcances del tutorial de Microsoft Sql Server.

Create DATABASE BaseDeDatos

use BaseDeDatos

--2 - Crear una tabla (Create Table - sp_Tables - sp_columns - Drop Table)
 if object_id('Usuarios') is NOT NULL 
 Drop Table Usuarios 

 Create Table Usuarios ( 
   Nombre varchar(30), 
   Clave varchar(10) 
   ) 

   exec sp_Tables @Table_owner='dbo' 

   exec sp_columns Usuarios --Para Mostrar una columna llamada Usuarios.

   /*Create Table Usuarios ( --No se pude crear otra tabla igual que la primera.
   Nombre varchar(30),
   clave varchar(10)
   );*/
   
   Drop Table Usuarios --Para borrar está la tabla completa.

   exec sp_Tables @Table_owner='dbo' --Para mostrar una tabla.

--3 - Insertar y recuperar registros de una tabla (Insert into - Select)
 if object_id('Usuarios') is not null
  Drop Table Usuarios --Borrando tabla anterior de la parte 3 para evitar un error.

 Create Table Usuarios( --Aquí se crea otra nueva.
  Nombre varchar(30),
  Clave varchar(10)
 )

 Insert into Usuarios (Nombre, Clave) 
 Values ('Mariano','123abc') --Insertando fila.

 Select * From Usuarios --Veamos todos los campos la tabla.

 Insert into Usuarios (Nombre, Clave) 
 Values ('Ana','hola123') --Insertando fila otra fila.

 Select * From Usuarios

 Insert into usuarios (Nombre, Clave) 
 Values ('Boca','Luis')

 Select * From usuarios
 
--4 - Tipos de datos básicos
 if object_id('Libros') is not null
  Drop Table Libros --Procedemos a borrar la tabla si existe.

 Create Table Libros( --Procedemos a crearla nuevamente.
  Titulo varchar(80),
  Autor varchar(40),
  Editorial varchar(30),
  Precio float,
  Cantidad integer
 )

 Go

 exec sp_columns Libros --Procedemos a mostrar las columnas del procedimiento almacenado.

 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
 Values ('El aleph','Borges','Emece',25.50,100)
 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
 Values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200)

 Select * From Libros

 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
 Values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200)
 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
 Values ('Alicia en el pais','Lewis Carroll','Atlantida',10,200)

 Select * From Libros

--5 - Recuperar algunos campos (Select)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros (
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio float,
  Cantidad integer
 )

 exec sp_columns Libros --Veamos la estructura de la tabla

 Insert into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
 Values ('el aleph','Borges','Emece',25.50,200)
 Insert into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
 Values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlentida',10.15,200)
 Insert into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
 Values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200)

 Select * From Libros --Veamos todos los campos la tabla.

 Select Titulo, Autor, Editorial 
 From Libros

 Select Titulo, Precio 
 From Libros 

 Select Editorial, Cantidad 
 From Libros

--6 - Recuperar algunos registros (WHERE)
 if object_id('Usuarios') is not null
  Drop Table Usuarios

 Create Table Usuarios (
  Nombre varchar(30),
  Clave varchar(10)
 )

 exec sp_columns Usuarios

 Insert into Usuarios (Nombre, Clave)
  Values ('Marcelo','Boca')
 Insert into Usuarios (Nombre, Clave) 
 Values ('JuanPerez','Juancito')
 Insert into Usuarios (Nombre, Clave) 
 Values ('Susana','River')
 Insert into Usuarios (Nombre, Clave) 
 Values ('Luis','River')

 Select * From Usuarios 
 WHERE Nombre='Leonardo' --Recuperamos el Nombre de Leonardo

 Select Nombre From Usuarios 
 WHERE Clave='River' --Recuperamos la Clave de River

 Select Nombre From Usuarios 
 WHERE Clave='Santi' --Recuperamos la Clave de Santi

--7 - Operadores relacionales
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Titulo varchar(30),
  Autor varchar(30),
  Editorial varchar(15),
  Precio float
 )

 Insert into Libros (Titulo, Autor, Editorial, Precio)
  Values ('El aleph','Borges','Emece',24.50)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('Martin Fierro','Jose Hernandez','Emece',16.00)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('Aprenda PHP','Mario Molina','Emece',35.40)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
Values ('Cervantes y el quijote','Borges','Paidos',50.90)

 Select * From Libros 
 WHERE Autor <> 'Borges'

 Select Titulo,Precio 
 From Libros 
 WHERE Precio > 20

 Select * From Libros 
 WHERE Precio <= 30

--8 - Borrar registros (DELETE)
 if object_id('Usuarios') is not null
  Drop Table Usuarios

 Create Table Usuarios(
  Nombre varchar(30),
  Clave varchar(10)
 )

 Insert into Usuarios (Nombre, Clave) 
 Values ('Marcelo','River')
 Insert into Usuarios (Nombre, Clave) 
 Values ('Susana','chapita')
 Insert into Usuarios (Nombre, Clave) 
 Values ('CarlosFuentes','Boca')
 Insert into Usuarios (Nombre, Clave) 
 Values ('FedericoLopez','Boca')

 Select * From Usuarios

 DELETE From Usuarios 
 WHERE Nombre='Marcelo'

 Select * From Usuarios

 DELETE From Usuarios 
 WHERE Nombre='Marcelo' --Vamos a eliminar el registro cuyo Nombre de usuario es "Marcelo".

 Select * From Usuarios

 DELETE From Usuarios 
 WHERE Clave='Boca' --Eliminamos todos los registros cuya clave es 'Boca'.

 Select * From Usuarios --Eliminemos todos los registros.

 DELETE From Usuarios --Veamos el contenido de la tabla.

 Select * From Usuarios

--9 - Actualizar registros (UPDATE)
 if object_id('Usuarios') is not null
  Drop Table Usuarios

 Create Table Usuarios(
  Nombre varchar(20),
  Clave varchar(10)
 )

 Insert into Usuarios (Nombre, Clave) 
 Values ('Marcelo','River')
 Insert into Usuarios (Nombre, Clave) 
 Values ('Susana','chapita')
 Insert into Usuarios (Nombre, Clave) 
 Values ('Carlosfuentes','Boca')
 Insert into Usuarios (Nombre, Clave) 
 Values ('Federicolopez','Boca')

 Select * From Usuarios

 UPDATE Usuarios set Clave='RealMadrid'--Cambiaremos los valores de todas las claves, por la cadena "RealMadrid".

 Select * From Usuarios

 UPDATE Usuarios set Clave='Boca' 
 WHERE Nombre='Federicolopez'--Necesitamos cambiar el valor de la clave del usuario llamado "Federico Lopez" por "Boca".

 Select * From Usuarios --El cambio afectó a todos los registros, veámoslo.

 UPDATE Usuarios set Clave='payaso' 
 WHERE Nombre='JuanaJuarez' --Vimos que si Microsoft SQL Server no encuentra registros que cumplan con la condición no se modifican registros.
 Select * From Usuarios --Si vemos la tabla veremos que no a cambiado:

 UPDATE Usuarios set Nombre='Marceloduarte', Clave='Marce' 
 WHERE Nombre='Marcelo' --Para actualizar varios campos en una sola instrucción empleamos.

 Select * From Usuarios --Si vemos la tabla.

--10 - Comentarios
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Titulo varchar(30),
  Autor varchar(20),
  Editorial varchar(15)
 )

 Insert into Libros (Titulo, Autor, Editorial) 
 Values ('El aleph','Borges','Emece')

 Select * From Libros --Mostramos los registros de Libros.

 Select Titulo, Autor 
 From Libros --Mostramos tútulos y Nombres de los Autores.

--11 - Valores null (is null)
if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Titulo varchar(30) not null,
  Autor varchar(30) not null,
  Editorial varchar(15) null,
  Precio float
 )

 Go

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('El aleph','Borges','Emece',null)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('Alicia en el pais','Lewis Carroll', null, 0)
 --Insert into Libros (Titulo, Autor, Editorial, Precio) 
 --Values(null,'Borges','Siglo XXI',25)

 exec sp_columns Libros

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('Uno','Richard Bach','',18.50);
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('','Richard Bach','Planeta',22);

 Select * From Libros --Veamos todos los registros ingresados.
 Select * From Libros 
 WHERE Editorial is null --Recuperemos los registros que contengan el valor "null" en el campo "Precio".
 Select * From Libros 
 WHERE Precio = 0 --Con la primera sentencia veremos los Libros cuyo Precio es igual a "null" (desconocido); con la segunda, los Libros cuyo Precio es 0.
 Select * From Libros 
 WHERE Editorial is null --Recuperemos los Libros cuyo Nombre de Editorial es "null".
 Select * From Libros 
 WHERE Editorial='' --Ahora veamos los Libros cuya Editorial almacena una cadena vacía.
 Select * From Libros 
 WHERE Precio is not null --Para recuperar los Libros cuyo Precio no sea nulo tipeamos.

--12 - Clave primaria
if object_id('Usuarios') is not null
  Drop Table Usuarios

 Create Table Usuarios(
  Nombre varchar(20),
  Clave varchar(10),
  primary key(Nombre)
 )

 exec sp_columns Usuarios

 Insert into Usuarios (Nombre, Clave) 
 Values ('juanperez','Boca')
 Insert into Usuarios (Nombre, Clave) 
 Values ('raulgarcia','River')
 --Insert into Usuarios (Nombre, Clave) 
 --Values ('juanperez','payaso') Recordemos que cuando un campo es clave primaria, sus valores no se repiten. 
 --Insert into Usuarios (Nombre, Clave) 
 --Values (null,'payaso') Recordemos que cuando un campo es clave primaria, sus valores no se repiten. 

 --UPDATE Usuarios set Nombre='juanperez' 
 --WHERE Nombre='raulgarcia'  --Intentamos Actualizar un valor de clave primaria existente da un error.

 Select * From Usuarios
  
--13 - Campo con atributo Identity
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(15),
  Precio float
 )

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('El aleph','Borges','Emece',23)
 Select * From Libros
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('Uno','Richard Bach','Planeta',18)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('Aprenda PHP','Mario Molina','Siglo XXI',45.60)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('Alicia en el pais de maravillas','Lewis Carroll','Paidos',15.50)
 Select * From Libros

 --Insert into Libros (Codigo,Titulo,Autor,Editorial,Precio) Values(5,'Martin Fierro','Jose Hernandez','Paidos',25) --da un mensaje de error no se permite sustituir valores.
  --UPDATE Libros set Codigo=9 WHERE Titulo='Uno' --generará un mensaje de error por no se pude actulizar.

 exec sp_columns Libros

 DELETE From Libros 
 WHERE Autor='Lewis Carroll'

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('Martin Fierro','Jose Hernandez','Paidos',25)

 Select * From Libros --Ingresamos un quinto registro y lueGo vemos que en el campo códiGo se guardó el valor secuencial sin considerar que el valor "4" ya no existe.

--14 - Otras caracterésticas del atributo Identity
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity(100,2),
  Titulo varchar(20),
  Autor varchar(30),
  Precio float
 )

 Insert into Libros (Titulo, Autor, Precio) Values('El aleph','Borges',23)
 Insert into Libros (Titulo, Autor, Precio) Values('Uno','Richard Bach',18)
 Insert into Libros (Titulo, Autor, Precio) Values('Aprenda PHP','Mario Molina',45.60)

 Select * From Libros

 Go

 Select ident_seed('Libros')
 
 --Insert into Libros (Codigo, Titulo, Autor, Precio) Values(106,'Martin Fierro','Jose Hernandez',25)

 Select * From Libros

 set identity_Insert Libros on --Encendemos.
 Insert into Libros (Codigo, Titulo, Autor) Values (100,'Matematica estas ahi','Paenza')
 Insert into Libros (Codigo, Titulo, Autor) Values (1,'Ilusiones','Richard Bach')
 --Insert into Libros (Titulo, Autor) Values ('Uno','Richard Bach')
 set identity_Insert Libros off --Apagamos.

 --Insert into Libros (Codigo, Titulo, Autor) 
 --Values (300,'Uno','Richard Bach')
 Select * From Libros

--15 - Truncate Table
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(30),
  Autor varchar(20),
  Editorial varchar(15),
  Precio float
 )

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('El aleph','Borges','Emece',25.60)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('Uno','Richard Bach','Planeta',18)

 Select * From Libros

 Truncate Table Libros

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('El aleph','Borges','Emece',25.60)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('Uno','Richard Bach','Planeta',18)

 Select * From Libros

 DELETE From Libros

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('El aleph','Borges','Emece',25.60)
 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values ('Uno','Richard Bach','Planeta',18)

 Select * From Libros

--17 - Tipo de dato (texto)
 if object_id('Visitantes') is not null
  Drop Table Visitantes

 Create Table Visitantes(
  Nombre varchar(30),
  Edad integer,
  Sexo char(1),--No se pude Insertar más de un caracter dentro del Insert.
  Domicilio varchar(30),
  Ciudad varchar(20),
  Telefono varchar(11)
 )

 --Insert into Visitantes (Nombre, Edad, Sexo, Domicilio, Ciudad, Telefono) 
 --Values ('Juan Juarez',32,'masc','Avellaneda 789','Cordoba','4234567')
 Insert into Visitantes (Nombre, Edad, Sexo, Domicilio, Ciudad, Telefono) 
 Values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890)

 Select * From Visitantes

--18 - Tipo de dato (numérico)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo smallint identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(15),
  Precio smallmoney,
  Cantidad tinyint
 )

 Go

 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('El aleph','Borges','Emece',25.60,255) --No se puede superar 
                                                --el rango del tipo "tinyint",con valor de 260.
 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad)
  Values('El aleph','Borges','Emece',25000,100) --No se puede superar 
                                                 --el rango del tipo "smallmoney", con valor de 250000.
 --Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
  --Values('Uno','Richard Bach','Planeta','a50.30',100) --No se pude convertir tipo dato numerico.
 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Uno','Richard Bach','Planeta',50.30,'100') --Si la cadena 100 no hay problema.

 Select * From Libros

--19 - Tipo de dato (Fecha y hora)
 if object_id('Empleados') is not null
  Drop Table Empleados

 Create Table Empleados(
  Nombre varchar(20),
  Documento char(8),
  FechaIngreso datetime
 )

 set dateformat dmy

 Go

 Insert into Empleados 
  Values('Ana Gomez','22222222','12-01-1980')
 Insert into Empleados 
  Values('Bernardo Huerta','23333333','15-03-81')
 Insert into Empleados 
  Values('Carla Juarez','24444444','20/05/1983')
 Insert into Empleados 
  Values('Daniel Lopez','25555555','2.5.1990')

 Select * From Empleados

 Select format(getdate(), 'dd/MM/yyyy') as FechaIngreso

 --Select * From Empleados 
  --WHERE FechaIngreso < '01-01-1985'

 --UPDATE Empleados set Nombre = 'Maria Carla Juarez' 
  --WHERE FechaIngreso = '20.5.83'

 Select * From Empleados

 --DELETE From Empleados 
  --WHERE FechaIngreso <> '20/05/1983'

 Select * From Empleados

--20 - Ingresar algunos campos (Insert into)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(15)
 )

 --Insert into Libros 
  --Values ('Uno','Richard Bach','Planeta')
 --Select * From Libros

 Insert into Libros (Titulo, Autor) 
  Values ('El aleph','Borges')
 --Insert into Libros (Autor, Editorial) Values ('Lewis Carroll','Planeta') --No se pude Insertar valor NULL en la tabla Libros.

 Select * From Libros

--21 - Valores por defecto (default)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) not null default 'Desconocido', 
  Editorial varchar(20),
  Precio decimal(5,2),
  Cantidad tinyint default 0
 )

 Insert into Libros (Titulo, Editorial, Precio) 
  Values('Java en 10 minutos','Paidos',50.40)
 Select * From Libros

 Insert into Libros (Titulo, Editorial)  
  Values('Aprenda PHP','Siglo XXI')
 Select * From Libros

 exec sp_columns Libros

 Insert into Libros (Titulo, Autor, Precio, Cantidad)  
  Values ('El gato con botas', default, default, 100)
 Select * From Libros

 Insert into Libros default 
  Values
 Select * From Libros

 Insert into Libros (Titulo, Autor, Cantidad) Values ('Alicia en el pais de las maravillas','Lewis Carroll',null)

 Insert into Libros default 
  Values
 Select * From Libros
  
--22 - Columnas calculadas (operadores aritméticos y de concatenación)
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  Cantidad tinyint default 0,
  primary key (Codigo)
 )

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25)
 --Insert into Libros 
  --Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100)
 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50)

 Select Titulo, Precio, Cantidad, Precio * Cantidad 
 From Libros

 Select Titulo, Precio, Precio-(Precio * 0.1) 
 From Libros

 UPDATE Libros set Precio = Precio - (Precio * 0.1)
 Select * From Libros

 Select Titulo+'-'+Autor+'-'+Editorial 
 From Libros

--23 - Alias
if object_id('Agenda') is not null
  Drop Table Agenda

 Create Table Agenda(
  Nombre varchar(30),
  Domicilio varchar(30),
  Telefono varchar(11)
 )

 Insert into Agenda (Nombre, Domicilio, Telefono)
  Values('Juan Perez','Avellaneda 908','4252525')
 Insert into Agenda (Nombre, Domicilio, Telefono)
  Values('Marta Lopez','Sucre 34','4556688')
 Insert into Agenda (Nombre, Domicilio, Telefono) 
 Values('Carlos Garcia','Sarmiento 1258',null)

 Select Nombre as NombreYApellido, Domicilio, Telefono 
 From Agenda
 Select Nombre as 'Nombre y Apellido',Domicilio ,Telefono  
 From Agenda
 Select Nombre 'Nombre y Apellido',Domicilio,Telefono 
 From Agenda

--25 - Funciones para el manejo de cadenas
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  Cantidad tinyint default 0,
  primary key (Codigo)
 )

 Insert into Libros (Titulo, Autor, Editorial, Precio) 
 Values('El aleph','Borges','Emece',25)
 --Insert into Libros 
 --Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100)
 Insert into Libros (Titulo, Autor, Editorial, Precio, Cantidad) 
 Values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50)

 Select substring(Titulo,1,12) 
 as Titulo 
 From Libros

 Select left(Titulo, 12) 
 as Titulo 
 From Libros

 Select Titulo, str(Precio, 6,1) 
 From Libros

 Select Titulo, str(Precio) 
 From Libros

 Select Titulo, Autor, upper(Editorial) 
 From Libros

--27 - Funciones para el uso de Fechas y horas
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Edicion datetime,
  Precio decimal(6,2)
 )

--28 - Ordenar registros (Order by)
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  primary key (Codigo)
 )

Select * From Libros 
Order by Titulo

 Select * From Libros 
 Order by Editorial desc

 Select * From Libros 
 Order by Titulo, Editorial

 Select * From Libros 
 Order by Titulo asc, Editorial desc

--29 - Operadores lógicos ( and - or - not)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
 )

 /*Insert into Libros 
 Values('El aleph','Borges','Emece',15.90)
 Insert into Libros 
 Values('Antología poética','Borges','Planeta',39.50)
 Insert into Libros 
 Values('Java en 10 minutos','Mario Molina','Planeta',50.50)
 Insert into Libros 
 Values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.90)
 Insert into Libros 
 Values('Martin Fierro','Jose Hernandez','Emece',25.90)
 Insert into Libros
 Values('Martin Fierro','Jose Hernandez','Paidos',16.80)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina','Emece',19.50)
 Insert into Libros 
 Values('Cervantes y el quijote','Borges','Paidos',18.40)*/

 Select * From Libros 
 WHERE (Autor = 'Borges') and (Precio <= 20)
 Select * From Libros 
 WHERE Autor = 'Borges' or Editorial = 'Planeta'
 Select * From Libros 
 WHERE not Editorial = 'Planeta'

 Select * From Libros 
 WHERE (Autor='Borges') or (Editorial='Paidos' and Precio < 20)

 Select * From Libros 
 WHERE (Autor='Borges' or Editorial='Paidos') and (Precio < 20)

--30 - Otros operadores relacionales (is null)
  if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
 )

 /*Insert into Libros 
 Values('El aleph','Borges','Emece',15.90)
 Insert into Libros 
 Values('Cervantes y el quijote','Borges','Paidos',null)
 Insert into Libros 
 Values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90)
 Insert into Libros
 Values('Martin Fierro','Jose Hernandez','Emece',25.90)
 Insert into Libros (Titulo,Autor,Precio) 
 Values('Antología poética','Borges',25.50)
 Insert into Libros (Titulo,Autor,Precio) 
 Values('Java en 10 minutos','Mario Molina',45.80)
 Insert into Libros (Titulo,Autor) 
 Values('Martin Fierro','Jose Hernandez')
 Insert into Libros (Titulo,Autor) 
 Values('Aprenda PHP','Mario Molina')*/

 Select * From Libros
  WHERE Editorial is null

 Select * From Libros
  WHERE Editorial is not null

 --31 - Otros operadores relacionales (between)
  if object_id('Visitas') is not null
  Drop Table Visitas

 Create Table Visitas (
  Numero int identity,
  Nombre varchar(30) default 'Anonimo',
  Mail varchar(50),
  Pais varchar (20),
  FechaYHora datetime,
  primary key(Numero)
)

 Insert into Visitas (Nombre, Mail, Pais, FechaYHora) 
 Values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10')
 Insert into Visitas (Nombre, Mail, Pais, FechaYHora) 
 Values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30')
 Insert into Visitas (Nombre, Mail, Pais, FechaYHora) 
 Values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45')
 Insert into Visitas (Nombre, Mail, Pais, FechaYHora) 
 Values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15')
 Insert into Visitas (Nombre, Mail, Pais, FechaYHora) 
 Values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45')
 Insert into Visitas (Nombre, Mail, Pais, FechaYHora) 
 Values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20')
 --Insert into Visitas (Nombre, Mail, Pais, FechaYHora) 
 --Values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25')
 Insert into Visitas (Nombre, Mail, Pais) 
 Values ('Federico1','federicogarcia@xaxamail.com','Argentina')

 Select * From Visitas 
 WHERE FechaYHora 
 between '2006-09-12' and '2006-10-11'
 Select * From Visitas 
 WHERE Numero between 2 and 5

-- 32 - Otros operadores relacionales (in)
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20),
  Editorial varchar(20),
  Precio decimal(6,2),
 )

 /*Insert into Libros 
 Values('El aleph','Borges','Emece',15.90)
 Insert into Libros 
 Values('Cervantes y el quijote','Borges','Paidos',null)
 Insert into Libros 
 Values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90)
 Insert into Libros 
 Values('Matematica estas ahi','Paenza','Siglo XXI',15)
 Insert into Libros (Titulo, Precio) 
 Values('Antología poética',32)
 Insert into Libros (Titulo, Autor, Precio) 
 Values('Martin Fierro','Jose Hernandez',40)
 Insert into Libros (Titulo, Autor, Precio) 
 Values('Aprenda PHP','Mario Molina',56.50)*/

 Select * From Libros 
 WHERE Autor in('Borges','Paenza')

 Select * From Libros 
 WHERE Autor not in ('Borges','Paenza')

-- 33 - Búsqueda de patrones (like - not like)
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  primary key(Codigo)
 )

 /*Insert into Libros 
 Values('El aleph','Borges','Emece',15.90)
 Insert into Libros 
 Values('Antología poética','J. L. Borges','Planeta',null)
 Insert into Libros 
 Values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90)
 Insert into Libros 
 Values('Matematica estas ahi','Paenza','Siglo XXI',15)
 Insert into Libros 
 Values('Martin Fierro','Jose Hernandez',default,40)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50)*/

 Select * From Libros 
 WHERE Autor like '%Borges%'

 Select * From Libros 
 WHERE Titulo like 'M%'

 Select * From Libros 
 WHERE Titulo not like 'M%'

 Select * From Libros 
 WHERE Autor like '%Carrol_'

 Select Titulo, Autor, Editorial 
 From Libros 
 WHERE Editorial like '[P-S]%'

 Select Titulo, Autor, Editorial 
 From Libros 
 WHERE Editorial like '[^PN]%'

 Select Titulo,Precio 
 From Libros
 WHERE Precio like '1_.%'

 Select Titulo, Precio 
 From Libros 
 WHERE Precio like '%.00'

--34 - Contar registros (count)
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  primary key(Codigo)
 )
  
Go

 Insert into Libros
  Values('El aleph','Borges','Emece',15.90)
 Insert into Libros
  Values('Antología poética','J. L. Borges','Planeta',null)
 Insert into Libros
  Values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90)
 Insert into Libros
  Values('Matematica estas ahi','Paenza','Siglo XXI',15)
 Insert into Libros
 Values('Martin Fierro','Jose Hernandez',default,40)
 Insert into Libros
  Values('Aprenda PHP','Mario Molina','Nuevo siglo',null)
 Insert into Libros
  Values('Uno','Richard Bach','Planeta',20)

 Select count(*) 
 From Libros

 Select count(*) 
 From Libros 
 WHERE Editorial='Planeta'

 Select count(Precio) 
 From Libros

--36 - Funciones de agrupamiento (count - sum - min - max - avg)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30) default 'Desconocido',
  Editorial varchar(15),
  Precio decimal(5,2),
  Cantidad tinyint,
  primary key(Codigo)
 )
 Go
 --Insert into Libros
  --Values('El aleph','Borges','Planeta',15,null)
 Insert into Libros
  Values('Martin Fierro','Jose Hernandez','Emece',22.20,200)
 Insert into Libros
  Values('Antologia poetica','J.L. Borges','Planeta',null,150)
 Insert into Libros
  Values('Aprenda PHP','Mario Molina','Emece',18.20,null)
 Insert into Libros
  Values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100)
 Insert into Libros
  Values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120)
 Insert into Libros
  Values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90)
 Insert into Libros
  Values('Harry Potter y la camara secreta','J.K. Rowling','Emece',46.00,100)
 Insert into Libros (Titulo,Autor,Cantidad)
  Values('Alicia en el pais de las maravillas','Lewis Carroll',220)
 Insert into Libros (Titulo,Autor,Cantidad)
  Values('PHP de la A a la Z',default,0)

 Select sum(Cantidad)
  From Libros

 Select sum(Cantidad)
  From Libros
  WHERE Editorial='Emece'

 Select max(Precio)
  From Libros

 Select min(Precio)
  From Libros
  WHERE Autor like '%Rowling%'

 Select avg(Precio)
  From Libros
  WHERE Titulo like '%PHP%'

--37 - Agrupar registros (group by)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(5,2),
  Cantidad tinyint,
  primary key(Codigo)
 )

 Insert into Libros
  Values('El aleph','Borges','Planeta',15,null)
 Insert into Libros
  Values('Martin Fierro','Jose Hernandez','Emece',22.20,200)
 Insert into Libros
  Values('Antologia poetica','J.L. Borges','Planeta',null,150)
 Insert into Libros
  Values('Aprenda PHP','Mario Molina','Emece',18.20,null)
 Insert into Libros
  Values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100)
 Insert into Libros
  Values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120)
 Insert into Libros
  Values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90)
 Insert into Libros
  Values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100)
 Insert into Libros
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200)
 Insert into Libros
  Values('PHP de la A a la Z',null,null,null,0)

 Select Editorial, count(*)
  From Libros
  group by Editorial

 Select Editorial, count(Precio)
  From Libros
  group by Editorial

 Select Editorial, sum(Precio)
  From Libros
  group by Editorial

 Select Editorial,
  max(Precio) as mayor,
  min(Precio) as menor
  From Libros
  group by Editorial

 Select Editorial, avg(Precio)
  From Libros
  group by Editorial

 Select Editorial, count(*)
  From Libros
  WHERE Precio < 30
  group by Editorial

 Select Editorial, count(*)
  From Libros
  WHERE Precio<30
  group by all Editorial

--38 - Seleccionar grupos (having)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(5,2),
  Cantidad tinyint,
  primary key(Codigo)
 )

 Insert into Libros
  Values('El aleph','Borges','Planeta',35,null)
 Insert into Libros
  Values('Martin Fierro','Jose Hernandez','Emece',22.20,200)
 Insert into Libros
  Values('Martin Fierro','Jose Hernandez','Planeta',40,200)
 Insert into Libros
  Values('Antologia poetica','J.L. Borges','Planeta',null,150)
 Insert into Libros
  Values('Aprenda PHP','Mario Molina','Emece',18,null)
 Insert into Libros
  Values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120)
 Insert into Libros
  Values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100)
 Insert into Libros
  Values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90)
 Insert into Libros
  Values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100)
 Insert into Libros
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',42,80)
 Insert into Libros
  Values('PHP de la A a la Z',null,null,110,0)
 Insert into Libros
  Values('Uno','Richard Bach','Planeta',25,null)

 Select Editorial, count(*) From Libros
  group by Editorial
  having count(*) > 2

 Select Editorial, avg(Precio) From Libros
  group by Editorial
  having avg(Precio) > 25

 Select Editorial, count(*) From Libros
  WHERE Precio is not null
  group by Editorial
  having Editorial <> 'Planeta'

 Select Editorial, avg(Precio) From Libros
  group by Editorial
  having count(*) > 2

 Select Editorial, max(Precio) as 'mayor'
  From Libros
  group by Editorial
  having max(Precio) <100 and
  max(Precio) > 30
  Order by Editorial

--43 - Registros duplicados (distinct)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  primary key(Codigo)
 )
 Go
 Insert into Libros
  Values('El aleph','Borges','Planeta')
 Insert into Libros
  Values('Martin Fierro','Jose Hernandez','Emece')
 Insert into Libros
  Values('Martin Fierro','Jose Hernandez','Planeta')
 Insert into Libros
  Values('Antologia poetica','Borges','Planeta')
 Insert into Libros
  Values('Aprenda PHP','Mario Molina','Emece')
 Insert into Libros
  Values('Aprenda PHP','Lopez','Emece')
 Insert into Libros
  Values('Manual de PHP', 'J. Paez', null)
 Insert into Libros
  Values('Cervantes y el quijote',null,'Paidos')
 Insert into Libros
  Values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece')
 Insert into Libros
  Values('Harry Potter y la camara secreta','J.K. Rowling','Emece')
 Insert into Libros
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos')
 Insert into Libros
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta')
 Insert into Libros
  Values('PHP de la A a la Z',null,null)
 Insert into Libros
  Values('Uno','Richard Bach','Planeta')

 Select distinct Autor From Libros

 Select distinct Autor From Libros
  WHERE Autor is not null

 Select count(distinct Autor)
  From Libros

 Select distinct Editorial From Libros

 Select count(distinct Editorial) From Libros

 Select distinct Autor From Libros
  WHERE Editorial='Planeta'

 Select Editorial,count(distinct Autor)
  From Libros
  group by Editorial

 Select distinct Titulo,Editorial
  From Libros
  Order by Titulo

--44 - Cláusula top
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(20),
  Editorial varchar(20)
 )

 Insert into Libros 
 Values ('Uno','Richard Bach','Planeta')
 Insert into Libros 
 Values ('El aleph','Borges','Emece')
 Insert into Libros 
 Values ('Alicia en el pais...','Carroll','Planeta')
 Insert into Libros 
 Values ('Aprenda PHP','Mario Molina','Siglo XXI')
 Insert into Libros 
 Values ('Java en 10 minutos','Mario Molina','Siglo XXI')
 Insert into Libros 
 Values ('Java desde cero','Mario Molina','Emece')
 Insert into Libros 
 Values ('Ilusiones','Richard Bach','Planeta')

 Select top 2 * From Libros

 Select top 3 Titulo, Autor 
  From Libros
  Order by Autor

 Select top 3 with ties Titulo, Autor 
  From Libros
  Order by Autor

 Select top 50 percent
  * From Libros
  Order by Autor

-- 53 - Eliminar restricciones (Alter Table - Drop)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int not null,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(6,2)
 )

 Alter Table Libros
 add CONSTRAINT PK_Libros_Codigo
 primary key(Codigo)

 /*Alter Table Libros
 add CONSTRAINT CK_Libros_Precio
 check (Precio >= 0)*/

 Alter Table Libros
 add CONSTRAINT DF_Libros_Autor
 default 'Desconocido'
 for Autor

 Alter Table Libros
 add CONSTRAINT DF_Libros_Precio
 default 0
 for Precio

 exec sp_helpCONSTRAINT Libros

 Alter Table Libros
  Drop DF_Libros_Autor

 Alter Table Libros
  Drop PK_Libros_Codigo

 exec sp_helpCONSTRAINT Libros

--66 - Combinación interna (inner join)
if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  primary key (Codigo)
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Siglo XXI')
 Go
 Insert into Libros 
 Values('El aleph','Borges',2,20)
 Insert into Libros 
 Values('Martin Fierro','Jose Hernandez',1,30)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina',3,50)
 Insert into Libros 
 Values('Java en 10 minutos',default,3,45)

 Select * From Libros

 Select Titulo, Autor, Nombre
  From Libros
  join Editoriales
  on CodigoEditorial=Editoriales.Codigo

 Select l.Codigo,Titulo,Autor,Nombre,Precio
  From Libros as l
  join Editoriales as e
  on CodigoEditorial=e.Codigo

 Select l.Codigo,Titulo,Autor,Nombre,Precio
  From Libros as l
  join Editoriales as e
  on CodigoEditorial=e.Codigo
  WHERE e.Nombre='Siglo XXI'

 Select Titulo,Autor,Nombre
  From Libros as l
  join Editoriales as e
  on CodigoEditorial=e.Codigo
  Order by Titulo

-- 67 - Combinación externa izquierda (left join)
 if object_id('Libros') is not null
  Drop Table Libros
 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  primary key (Codigo)
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Siglo XXI')

 Insert into Libros 
 Values('El aleph','Borges',1,20)
 Insert into Libros 
 Values('Martin Fierro','Jose Hernandez',1,30)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina',2,50)
 Insert into Libros 
 Values('Java en 10 minutos',default,4,45)

  Select Titulo,Nombre
  From Editoriales as e
  left join Libros as l
  on CodigoEditorial = e.Codigo

  Select Titulo,Nombre
  From Libros as l
  left join Editoriales as e
  on CodigoEditorial = e.Codigo

 Select Titulo,Nombre
  From Editoriales as e
  left join Libros as l
  on e.Codigo=CodigoEditorial
  WHERE CodigoEditorial is not null

 Select Titulo,Nombre
  From Editoriales as e
  left join Libros as l
  on e.Codigo=CodigoEditorial
  WHERE CodigoEditorial is null

--68 - Combinación externa derecha (right join)
 if object_id('Libros') is not null
  Drop Table Libros
 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  primary key (Codigo)
 )

 Insert into Editoriales Values('Planeta')
 Insert into Editoriales Values('Emece')
 Insert into Editoriales Values('Siglo XXI')

 Insert into Libros Values('El aleph','Borges',1,20)
 Insert into Libros Values('Martin Fierro','Jose Hernandez',1,30)
 Insert into Libros Values('Aprenda PHP','Mario Molina',2,50)
 Insert into Libros Values('Java en 10 minutos',default,4,45)

 Select Titulo,Nombre
  From Libros as l
  right join Editoriales as e
  on CodigoEditorial = e.Codigo

 Select Titulo,Nombre
  From Libros as l
  right join Editoriales as e
  on e.Codigo=CodigoEditorial
  WHERE CodigoEditorial is not null

 Select Titulo,Nombre
  From Libros as l
  right join Editoriales as e
  on e.Codigo=CodigoEditorial
  WHERE CodigoEditorial is null

--69 - Combinación externa completa (full join)
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  primary key (Codigo)
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Siglo XXI')

--70 - Combinaciones cruzadas (cross join)
 if object_id('Comidas') is not null
  Drop Table Comidas

 if object_id('Postres') is not null
  Drop Table Postres

 Create Table Comidas(
  Codigo tinyint identity,
  Nombre varchar(30),
  Precio decimal(4,2)
 )

 Create Table Postres(
  Codigo tinyint identity,
  Nombre varchar(30),
  Precio decimal(4,2)
 )

 Insert into Comidas 
 Values('ravioles',5)
 Insert into Comidas 
 Values('tallarines',4)
 Insert into Comidas 
 Values('milanesa',7)
 Insert into Comidas 
 Values('cuarto de pollo',6)
 Insert into Postres 
 Values('flan',2.5)
 Insert into Postres 
 Values('porcion torta',3.5)

 Select c.Nombre as 'plato principal',
  p.Nombre as 'postre',
  c.Precio+p.Precio as 'Total'
  From Comidas as c
  cross join Postres as p

--73 - Combinación de más de dos tablas
 if object_id('Libros') is not null
  Drop Table Libros
 if object_id('Autores') is not null
  Drop Table Autores
 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  CodigoAutor int not null,
  CodigoEditorial tinyint not null,
  Precio decimal(5,2),
  primary key(Codigo)
 )

 Create Table Autores(
  Codigo int identity,
  Nombre varchar(20),
  primary key (Codigo)
 )

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  primary key (Codigo)
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Siglo XXI')
 Insert into Editoriales 
 Values('Plaza')
 
 Insert into Autores
 Values ('Richard Bach')
 Insert into Autores 
 Values ('Borges')
 Insert into Autores 
 Values ('Jose Hernandez')
 Insert into Autores 
 Values ('Mario Molina')
 Insert into Autores 
 Values ('Paenza')
 
 Insert into Libros 
 Values('El aleph',2,2,20)
 Insert into Libros 
 Values('Martin Fierro',3,1,30)
 Insert into Libros 
 Values('Aprenda PHP',4,3,50)
 Insert into Libros 
 Values('Uno',1,1,15)
 Insert into Libros 
 Values('Java en 10 minutos',0,3,45)
 Insert into Libros 
 Values('Matematica estas ahi',0,0,15)
 Insert into Libros 
 Values('Java de la A a la Z',4,0,50)

 Select Titulo,a.Nombre,e.Nombre,Precio
  From Autores as a
  join Libros as l
  on CodigoAutor = a.Codigo
  join Editoriales as e
  on CodigoEditorial = e.Codigo

 Select Titulo,a.Nombre,e.Nombre,Precio
  From Autores as a
  right join Libros as l
  on CodigoAutor = a.Codigo
  left join Editoriales as e
  on CodigoEditorial=e.Codigo

--48 - Combinaciones con UPDATE y DELETE
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  primary key (Codigo)
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Siglo XXI')

 Insert into Libros 
  Values('El aleph','Borges',2,20)
 Insert into Libros 
  Values('Martin Fierro','Jose Hernandez',1,30)
 Insert into Libros
  Values('Aprenda PHP','Mario Molina',3,50)
 Insert into Libros 
  Values('Java en 10 minutos',default,3,45)

 UPDATE Libros set Precio=Precio+(Precio*0.1)
  From Libros 
  join Editoriales as e
  on CodigoEditorial=e.Codigo
  WHERE Nombre='Planeta'

 Select Titulo,Autor,e.Nombre,Precio
  From Libros as l
  join Editoriales as e
  on CodigoEditorial=e.Codigo

 DELETE Libros
  From Libros
  join Editoriales
  on CodigoEditorial = Editoriales.Codigo
  WHERE Editoriales.Nombre='Emece'

 Select Titulo,Autor,e.Nombre,Precio
  From Libros as l
  join Editoriales as e
  on CodigoEditorial=e.Codigo

--82 - Union
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 if object_id('Profesores') is not null
  Drop Table Profesores

 Create Table Profesores(
  Documento varchar(8) not null,
  Nombre varchar (30),
  Domicilio varchar(30),
  primary key(Documento)
 )

 Create Table Alumnos(
  Documento varchar(8) not null,
  Nombre varchar (30),
  Domicilio varchar(30),
  primary key(Documento)
 )

 Insert into Alumnos 
 Values('30000000','Juan Perez','Colon 123')
 Insert into Alumnos 
 Values('30111111','Marta Morales','Caseros 222')
 Insert into Alumnos 
 Values('30222222','Laura Torres','San Martin 987')
 Insert into Alumnos 
 Values('30333333','Mariano Juarez','Avellaneda 34')
 Insert into Alumnos 
 Values('23333333','Federico Lopez','Colon 987')

 Insert into Profesores 
 Values('22222222','Susana Molina','Sucre 345')
 Insert into Profesores 
 Values('23333333','Federico Lopez','Colon 987')

 Select Nombre, Domicilio 
 From Alumnos 
 union 
 Select Nombre, Domicilio 
 From Profesores

 Select Nombre, Domicilio 
 From Alumnos 
 union all 
 Select Nombre, Domicilio 
 From Profesores

 Select Nombre, Domicilio 
 From Alumnos 
 union 
 Select Nombre, Domicilio 
 From Profesores 
 Order by Domicilio

 Select Nombre, Domicilio, 'alumno' 
 as Condicion 
 From Alumnos 
 union 
 Select Nombre, Domicilio,'profesor' 
 From Profesores 
 Order by Condicion

--83 - Agregar y eliminar campos (Alter Table - add - Drop)
if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Titulo varchar(20),
  Editorial varchar(10),
  Edicion datetime,
  Precio decimal(6,2)
 )

 Alter Table Libros 
 add Cantidad tinyint

 exec sp_columns Libros

 Alter Table Libros 
 add Codigo int identity

 Alter Table Libros 
 add Autor varchar(30) not null

 Alter Table Libros 
 add Autor varchar(20) not null default 'Desconocido'

 Alter Table Libros 
 Drop Column Precio

 exec sp_Columns Libros

 Alter Table Libros 
 Drop Column Autor

 Alter Table Libros 
 Drop Column Editorial, Edicion

--84 - Alterar campos (Alter Table - Alter)
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(30),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(6,2) not null default 0
 )

 Alter Table Libros Alter 
 Column Titulo varchar(40) not null

 DELETE From Libros 
 WHERE Autor is null

 Alter Table Libros Alter 
 Column Autor varchar(30) not null

 Alter Table Libros Alter 
 Column Codigo smallint

 exec sp_Columns Libros

 Alter Table Libros Alter 
 Column Precio decimal(6,2) null

--86 - Campos calculados
 if object_id('Empleados') is not null
  Drop Table Empleados

 Create Table Empleados(
  Documento char(8),
  Nombre varchar(10),
  Domicilio varchar(30),
  SueldoBasico decimal(6,2),
  Hijos tinyint not null default 0,
  SueldoTotal as SueldoBasico + (Hijos*100)
 )

 Insert into Empleados 
 Values('22222222','Juan Perez','Colon 123',300,2)

 Insert into Empleados 
 Values('23333333','Ana Lopez','Sucre 234',500,0)

 Select * From Empleados

 UPDATE Empleados set Hijos = 1 
 WHERE Documento = '23333333'

 Select * From Empleados

 Alter Table Empleados 
 add SalarioFamiliar as Hijos * 100

 exec sp_columns Empleados

 Select * From Empleados

--92 - Subconsultas como expresión
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(5,2)
 )

 Insert into Libros 
 Values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00)
 Insert into Libros 
 Values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina','Siglo XXI',40.00)
 Insert into Libros 
 Values('El aleph','Borges','Emece',10.00)
 Insert into Libros 
 Values('Ilusiones','Richard Bach','Planeta',15.00)
 Insert into Libros 
 Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00)
 Insert into Libros 
 Values('Martin Fierro','Jose Hernandez','Planeta',20.00)
 Insert into Libros 
 Values('Martin Fierro','Jose Hernandez','Emece',30.00)
 Insert into Libros 
 Values('Uno','Richard Bach','Planeta',10.00)

 Select Titulo,Precio,
  Precio-(Select max(Precio) From Libros) as diferencia
  From Libros
  WHERE Titulo='Uno'

 Select Titulo,Autor, Precio
  From Libros
  WHERE Precio=
   (Select max(Precio) From Libros)

 UPDATE Libros set Precio = 45
  WHERE Precio =
   (Select max(Precio) From Libros)

 DELETE From Libros
  WHERE Precio =
   (Select min(Precio) From Libros)

--56 - Subconsultas con in
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(30),
  primary key (Codigo)
 )
 
 Create Table Libros (
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15),
  CodigoEditorial tinyint,
  primary key(Codigo),
 CONSTRAINT FK_Libros_Editorial
   FOREIGN KEY   (CodigoEditorial)
   references Editoriales(Codigo)
   on UPDATE cascade,
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Paidos')
 Insert into Editoriales 
 Values('Siglo XXI')

 Insert into Libros 
 Values('Uno','Richard Bach',1)
 Insert into Libros 
 Values('Ilusiones','Richard Bach',1)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina',4)
 Insert into Libros 
 Values('El aleph','Borges',2)
 Insert into Libros 
 Values('Puente al infinito','Richard Bach',2)

 Select Nombre
  From Editoriales
  WHERE Codigo in
   (Select CodigoEditorial
     From Libros
     WHERE Autor='Richard Bach')

 Select CodigoEditorial
  From Libros
  WHERE Autor='Richard Bach'

 Select distinct Nombre
  From Editoriales as e
  join Libros
  on CodigoEditorial=e.Codigo
  WHERE Autor='Richard Bach'

 Select Nombre
  From Editoriales
  WHERE Codigo not in
   (Select CodigoEditorial
     From Libros
     WHERE Autor='Richard Bach')

--94 - Subconsultas any - some - all
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(30),
  primary key (Codigo)
 )
 
 Create Table Libros (
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  CodigoEditorial tinyint,
  Precio decimal(5,2),
  primary key(Codigo),
 CONSTRAINT FK_Libros_Editorial
   FOREIGN KEY   (CodigoEditorial)
   references Editoriales(Codigo)
   on UPDATE cascade,
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Paidos')
 Insert into Editoriales 
 Values('Siglo XXI')

 Insert into Libros 
 Values('Uno','Richard Bach',1,15)
 Insert into Libros 
 Values('Ilusiones','Richard Bach',4,18)
 Insert into Libros 
 Values('Puente al infinito','Richard Bach',2,19)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina',4,40)
 Insert into Libros 
 Values('El aleph','Borges',2,10)
 Insert into Libros 
 Values('Antología','Borges',1,20)
 Insert into Libros 
 Values('Cervantes y el quijote','Borges',3,25)

 Select Titulo
  From Libros
  WHERE Autor like '%Borges%' and
  CodigoEditorial = any
   (Select e.Codigo
    From Editoriales as e
    join Libros as l
    on CodigoEditorial=e.Codigo
    WHERE l.Autor like '%Bach%')

 Select Titulo,Precio
  From Libros
  WHERE Autor like '%Borges%' and
  Precio > any
   (Select Precio
    From Libros
    WHERE Autor like '%Bach%')

 Select Titulo,Precio
  From Libros
  WHERE Autor like '%Borges%' and
  Precio > all
   (Select Precio
    From Libros
    WHERE Autor like '%Bach%')

 DELETE From Libros
  WHERE Autor like '%Borges%' and
  Precio > all
   (Select Precio
    From Libros
    WHERE Autor like '%Bach%')

--95 - Subconsultas correlacionadas
 if object_id('Facturas') is not null

 Create Table Facturas(
  Numero int not null,
  Fecha datetime,
  Clientes varchar(30),
  primary key(Numero)
 )

 Create Table Detalles(
  NumeroFactura int not null,
  NumeroItem int not null, 
  Articulo varchar(30),
  Precio decimal(5,2),
  Cantidad int,
  primary key(NumeroFactura,NumeroItem),
   CONSTRAINT FK_Detalles_NumeroFactura
   FOREIGN KEY   (NumeroFactura)
   references Facturas(Numero)
   on UPDATE cascade
   on DELETE cascade,
 )

 Insert into Facturas 
 Values(1200,'2018-01-15','Juan Lopez')
 Insert into Facturas 
 Values(1201,'2018-01-15','Luis Torres')
 Insert into Facturas 
 Values(1202,'2018-01-15','Ana Garcia')
 Insert into Facturas 
 Values(1300,'2018-01-20','Juan Lopez')

 Insert into Detalles 
 Values(1200,1,'lapiz',1,100)
 Insert into Detalles 
 Values(1200,2,'Goma',0.5,150)
 Insert into Detalles 
 Values(1201,1,'regla',1.5,80)
 Insert into Detalles 
 Values(1201,2,'Goma',0.5,200)
 Insert into Detalles 
 Values(1201,3,'cuaderno',4,90)
 Insert into Detalles 
 Values(1202,1,'lapiz',1,200)
 Insert into Detalles 
 Values(1202,2,'escuadra',2,100)
 Insert into Detalles 
 Values(1300,1,'lapiz',1,300)

 Select f.*,
  (Select count(d.NumeroItem)
    From Detalles as d
    WHERE f.Numero=d.NumeroFactura) as Cantidad,
  (Select sum(d.Precio*Cantidad)
    From Detalles as d
    WHERE f.Numero=d.NumeroFactura) as Total
 From Facturas as f

--96 - Exists y No Exists
 if object_id('Detalles') is not null 
 Drop Table Detalles

 if object_id('Facturas') is not null 
 Drop Table Facturas

 Create Table Facturas(
  Numero int not null,
  Fecha datetime,
  Clientes varchar(30),
  primary key(Numero)
 )

 Create Table Detalles(
  NumeroFactura int not null,
  NumeroItem int not null, 
  Articulo varchar(30),
  Precio decimal(5,2),
  Cantidad int,
  primary key(NumeroFactura,NumeroItem),
   CONSTRAINT FK_Detalles_NumeroFactura
   FOREIGN KEY   (NumeroFactura)
   references Facturas(Numero)
   on UPDATE cascade
   on DELETE cascade
 )

 Insert into Facturas 
 Values(1200,'2018-01-15','Juan Lopez')
 Insert into Facturas 
 Values(1201,'2018-01-15','Luis Torres')
 Insert into Facturas 
 Values(1202,'2018-01-15','Ana Garcia')
 Insert into Facturas 
 Values(1300,'2018-01-20','Juan Lopez')

 Insert into Detalles 
 Values(1200,1,'lapiz',1,100)
 Insert into Detalles 
 Values(1200,2,'Goma',0.5,150)
 Insert into Detalles 
 Values(1201,1,'regla',1.5,80)
 Insert into Detalles 
 Values(1201,2,'Goma',0.5,200)
 Insert into Detalles 
 Values(1201,3,'cuaderno',4,90)
 Insert into Detalles 
 Values(1202,1,'lapiz',1,200)
 Insert into Detalles 
 Values(1202,2,'escuadra',2,100)
 Insert into Detalles 
 Values(1300,1,'lapiz',1,300)

 Select Clientes,Numero
  From Facturas as f
  WHERE exists
   (Select *From Detalles as d
     WHERE f.Numero=d.NumeroFactura
     and d.Articulo='lapiz')

 Select Clientes,Numero
  From Facturas as f
  WHERE not exists
   (Select *From Detalles as d
     WHERE f.Numero=d.NumeroFactura
     and d.Articulo='lapiz')

--98 - Subconsulta en lugar de una tabla
 if object_id('Detalles') is not null 
 Drop Table Detalles

 if object_id('Facturas') is not null 
 Drop Table Facturas

 if object_id('Clientes') is not null 
 Drop Table Clientes

 Create Table Clientes(
  Codigo int identity,
  Nombre varchar(30),
  Domicilio varchar(30),
  primary key(Codigo)
 )

 Create Table Facturas(
  Numero int not null,
  Fecha datetime,
  CodigoClientes int not null,
  primary key(Numero),
  CONSTRAINT FK_Facturas_Clientes
   FOREIGN KEY   (CodigoClientes)
   references Clientes(Codigo)
   on UPDATE cascade
 )

 Create Table Detalles(
  NumeroFactura int not null,
  NumeroItem int not null, 
  Articulo varchar(30),
  Precio decimal(5,2),
  Cantidad int,
  primary key(NumeroFactura,NumeroItem),
   CONSTRAINT FK_Detalles_NumeroFactura
   FOREIGN KEY   (NumeroFactura)
   references Facturas(Numero)
   on UPDATE cascade
   on DELETE cascade,
 )

 Insert into Clientes 
 Values('Juan Lopez','Colon 123')
 Insert into Clientes 
 Values('Luis Torres','Sucre 987')
 Insert into Clientes 
 Values('Ana Garcia','Sarmiento 576')

 Insert into Facturas 
 Values(1200,'2018-01-15',1)
 Insert into Facturas 
 Values(1201,'2018-01-15',2)
 Insert into Facturas 
 Values(1202,'2018-01-15',3)
 Insert into Facturas
  Values(1300,'2018-01-20',1)

 Insert into Detalles 
 Values(1200,1,'lapiz',1,100)
 Insert into Detalles 
 Values(1200,2,'Goma',0.5,150)
 Insert into Detalles 
 Values(1201,1,'regla',1.5,80)
 Insert into Detalles 
 Values(1201,2,'Goma',0.5,200)
 Insert into Detalles 
 Values(1201,3,'cuaderno',4,90)
 Insert into Detalles 
 Values(1202,1,'lapiz',1,200)
 Insert into Detalles 
 Values(1202,2,'escuadra',2,100)
 Insert into Detalles 
 Values(1300,1,'lapiz',1,300)

 Select f.*,
  (Select sum(d.Precio*Cantidad)
    From Detalles as d
    WHERE f.Numero=d.NumeroFactura) as Total
 From Facturas as f

 Select td.Numero,c.Nombre,td.Total
  From Clientes as c
  join (Select f.*,
   (Select sum(d.Precio*Cantidad)
    From Detalles as d
    WHERE f.Numero=d.NumeroFactura) as Total
  From Facturas as f) as td
  on td.CodigoClientes=c.Codigo

--99 - Subconsulta (UPDATE - DELETE)
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(30),
  primary key (Codigo)
 )
 
 Create Table Libros (
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15),
  CodigoEditorial tinyint,
  Precio decimal(5,2),
  primary key(Codigo)
 )

 Insert into Editoriales 
 Values('Planeta')
 Insert into Editoriales 
 Values('Emece')
 Insert into Editoriales 
 Values('Paidos')
 Insert into Editoriales 
 Values('Siglo XXI')

 Insert into Libros 
 Values('Uno','Richard Bach',1,15)
 Insert into Libros 
 Values('Ilusiones','Richard Bach',2,20)
 Insert into Libros 
 Values('El aleph','Borges',3,10)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina',4,40)
 Insert into Libros 
 Values('Poemas','Juan Perez',1,20)
 Insert into Libros 
 Values('Cuentos','Juan Perez',3,25)
 Insert into Libros
 Values('Java en 10 minutos','Marcelo Perez',2,30)

 UPDATE Libros set Precio=Precio+(Precio*0.1)
  WHERE CodigoEditorial=
   (Select Codigo
     From Editoriales
     WHERE Nombre='Emece')

 DELETE From Libros
  WHERE CodigoEditorial in
   (Select e.Codigo
    From Editoriales as e
    join Libros
    on CodigoEditorial=e.Codigo
    WHERE Autor='Juan Perez')

--100 - Subconsulta (Insert)
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 if object_id('Aprobados') is not null
  Drop Table Aprobados

 Create Table Alumnos(
  Documento char(8) not null,
  Nombre varchar(30),
  Nota decimal(4,2)
   CONSTRAINT CK_Alumnos_Nota_Valores check (Nota >= 0 and Nota <= 10),
  primary key(Documento),
 )

 Create Table Aprobados(
  Documento char(8) not null,
  Nota decimal(4,2)
   CONSTRAINT CK_Aprobados_Nota_Valores check (Nota >= 0 and Nota <= 10),
  primary key(Documento),
 )

 Insert into Alumnos 
 Values('30000000','Ana Acosta',8)
 Insert into Alumnos 
 Values('30111111','Betina Bustos',9)
 Insert into Alumnos 
 Values('30222222','Carlos Caseros',2.5)
 Insert into Alumnos 
 Values('30333333','Daniel Duarte',7.7)
 Insert into Alumnos 
 Values('30444444','Estela Esper',3.4)

  Insert into aprobados 

  Select Documento, Nota
   From Alumnos
   WHERE Nota >= 4

 Select * From Aprobados

--101 - Crear tabla a partir de otra (Select - into)
 if object_id('Libros')is not null
  Drop Table Libros
 if object_id('Editoriales')is not null
  Drop Table Editoriales

 Create Table Libros( 
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(5,2),
  primary key(Codigo)
 )

 Go

 Insert into Libros 
 Values('Uno','Richard Bach','Planeta',15)
 Insert into Libros 
 Values('El aleph','Borges','Emece',25)
 Insert into Libros 
 Values('Matematica estas ahi','Paenza','Nuevo siglo',18)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina','Nuevo siglo',45)
 Insert into Libros 
 Values('Ilusiones','Richard Bach','Planeta',14)
 Insert into Libros 
 Values('Java en 10 minutos','Mario Molina','Nuevo siglo',50)

 Select distinct Editorial as Nombre
  into Editoriales
  From Libros

 Select *From Editoriales

 if object_id('CantidadPorEditorial') is not null
  Drop Table CantidadPorEditorial
  
 Select Editorial as Nombre,count(*) as Cantidad
  into CantidadPorEditorial
  From Libros
  group by Editorial

 Select *From CantidadPorEditorial

 if object_id('Ofertas') is not null
  Drop Table Ofertas

 Select top 4 *
  into Ofertas
  From Libros
  Order by Precio asc

 Select * From Ofertas

 Alter Table Editoriales 
 add Ciudad varchar(30)

 /*UPDATE Editoriales set Ciudad = 'Cordoba' 
 WHERE Nombre = 'Planeta'

 UPDATE Editoriales set Ciudad = 'Cordoba' 
 WHERE Nombre = 'Emece'

 UPDATE Editoriales set Ciudad = 'Buenos Aires' 
 WHERE Nombre = 'Nuevo siglo'*/

 if object_id('LibrosDeCordoba') is not null
  Drop Table LibrosDeCordoba

 /*Select Titulo, Autor
  into LibrosDeCordoba
  From Libros
  join Editoriales
  on Editorial = Nombre 
  WHERE Ciudad = 'Cordoba'*/

 --Select * From LibrosDeCordoba

--Go tiene un uso importante de la 103 en adelante: 
--Go: es un signo de finalización de un lote de sentencias SQL. 
--    No es una sentencia, es un comando.

--103 - Vistas
 if object_id('Empleados') is not null
  Drop Table Empleados
 if object_id('Secciones') is not null
  Drop Table Secciones

 Create Table Secciones(
  Codigo tinyint identity,
  Nombre varchar(20),
  Sueldo decimal(5,2)
   CONSTRAINT CK_Secciones_Sueldo check (Sueldo >= 0),
  CONSTRAINT PK_Secciones primary key (Codigo)
 )

 Create Table Empleados(
  Legajo int identity,
  Documento char(8)
   CONSTRAINT CK_Empleados_Documento check (Documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  Sexo char(1)
   CONSTRAINT CK_Empleados_Sexo check (Sexo in ('f','m')),
  Apellido varchar(20),
  Nombre varchar(20),
  domicilio varchar(30),
  Seccion tinyint not null,
  CantidadHijos tinyint
   CONSTRAINT CK_Empleados_Hijos check (CantidadHijos>=0),
  estadocivil char(10)
   CONSTRAINT CK_Empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  FechaIngreso datetime,
   CONSTRAINT PK_Empleados primary key (Legajo),
  CONSTRAINT FK_Empleados_Seccion
   FOREIGN KEY  (Seccion)
   references Secciones(Codigo)
   on UPDATE cascade,
  CONSTRAINT UQ_Empleados_Documento
   unique(Documento)
 )

 Insert into Secciones 
 Values('Administracion',300)
 Insert into Secciones 
 Values('Contaduría',400)
 Insert into Secciones
 Values('Sistemas',500)

 Insert into Empleados 
 Values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10')
 Insert into Empleados 
 Values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10')
 Insert into Empleados 
 Values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12')
 Insert into Empleados 
 Values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09')
 Insert into Empleados 
 Values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09')

 if object_id('Vista_Empleados') is not null
  Drop view Vista_Empleados

 Go -- Aplicando el comando para Create View.

 Create view Vista_Empleados as
  Select (Apellido+' '+e.Nombre) as Nombre, Sexo,
   s.Nombre as Seccion, CantidadHijos
   From Empleados as e
   join Secciones as s
   on Codigo = Seccion

 Go --Para evitar un error en Create View.

 Select * From Vista_Empleados

 Select Seccion,count(*) as Cantidad
  From Vista_Empleados
  group by Seccion

 if object_id('Vista_Empleados_Ingreso') is not null
  Drop view Vista_Empleados_Ingreso

 Go --Para evitar un error en view.

 Create view Vista_Empleados_Ingreso (fecha,Cantidad)
  as
  Select datepart(year,FechaIngreso),count(*)
   From Empleados
   group by datepart(year,FechaIngreso)

 Go --Para evitar un error en view.

 Select *From Vista_Empleados_Ingreso

--104 - Vistas (información)
  if object_id('Empleados') is not null
  Drop Table Empleados
 if object_id('Secciones') is not null
  Drop Table Secciones

 Create Table Secciones(
  Codigo tinyint identity,
  Nombre varchar(20),
  Sueldo decimal(5,2)
   CONSTRAINT CK_Secciones_Sueldo check (Sueldo >= 0),
  CONSTRAINT PK_Secciones primary key (Codigo)
 )

 Create Table Empleados(
  Legajo int identity,
  Documento char(8)
   CONSTRAINT CK_Empleados_Documento check (Documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  Sexo char(1)
   CONSTRAINT CK_Empleados_Sexo check (Sexo in ('f','m')),
  Apellido varchar(20),
  Nombre varchar(20),
  domicilio varchar(30),
  Seccion tinyint not null,
  CantidadHijos tinyint
   CONSTRAINT CK_Empleados_Hijos check (CantidadHijos >= 0),
  estadocivil char(10)
   CONSTRAINT CK_Empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  FechaIngreso datetime,
   CONSTRAINT PK_Empleados primary key (Legajo),
  CONSTRAINT FK_Empleados_Seccion
   FOREIGN KEY  (Seccion)
   references Secciones(Codigo)
   on UPDATE cascade,
  CONSTRAINT UQ_Empleados_Documento
   unique(Documento)
)

 Insert into Secciones 
 Values('Administracion',300)
 Insert into Secciones 
 Values('Contaduría',400)
 Insert into Secciones 
 Values('Sistemas',500)

 Insert into Empleados 
 Values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10')
 Insert into Empleados 
 Values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10')
 Insert into Empleados 
 Values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12')
 Insert into Empleados 
 Values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09')
 Insert into Empleados 
 Values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09')

 if object_id('Vista_Empleados') is not null
  Drop view Vista_Empleados

 Go --Para evitar un error en Create View.

 Create view Vista_Empleados as
  Select (Apellido+' '+e.Nombre) as Nombre, Sexo,
   s.Nombre as Seccion, CantidadHijos
   From Empleados as e
   join Secciones as s
   on Codigo=Seccion

 Go --Para evitar un error en Create View.

 Select * From Vista_Empleados

 exec sp_help Vista_Empleados

 exec sp_helptext Vista_Empleados

 exec sp_depends Vista_Empleados

 exec sp_depends Empleados

 Select * From sysobjects

 Select * From sysobjects
  WHERE xtype='V' and-- tipo Vista
  name like 'Vista%'--búsqueda con comodín ;

--110 - Lenguaje de control de flujo (case)
  if object_id('Alumnos') is not null
  Drop Table Alumnos

 Create Table Alumnos(
  Nombre varchar(40),
  Nota tinyint,
    CONSTRAINT CK_alunos_Nota check (Nota >= 0 and Nota <= 10)
 )

 Insert into Alumnos 
 Values('Ana Acosta',8)
 Insert into Alumnos
 Values('Carlos Caseres',4)
 Insert into Alumnos 
 Values('Federico Fuentes',2)
 Insert into Alumnos 
 Values('Gaston Guzman',3)
 Insert into Alumnos 
 Values('Hector Herrero',5)
 Insert into Alumnos 
 Values('Luis Luna',10)
 Insert into Alumnos 
 Values('Marcela Morales',7)
 Insert into Alumnos 
 Values('Marcela Morales',null)

 Select Nombre, Nota, Condicion =
 case Nota
  when 0 then 'Libre'
  when 1 then 'Libre'
  when 2 then 'Libre'
  when 3 then 'Libre'
  when 4 then 'Regular'
  when 5 then 'Regular'
  when 6 then 'Regular'
  when 7 then 'Promocionado'
  when 8 then 'Promocionado'
  when 9 then 'Promocionado'
  when 10 then 'Promocionado'
 end
 From Alumnos

 Select Nombre, Nota, Condicion =
  case 
   when Nota < 4 then 'Libre'
   when Nota >= 4 and Nota < 7 then 'Regular'
   when Nota >= 7 then 'Promocionado'
   else 'sin Nota'
  end
 From Alumnos

 Alter Table Alumnos
  add Condicion varchar(20)

 Select *From Alumnos
 
 /*UPDATE Alumnos set Condicion =
  case
   when Nota < 4 then 'Libre'
   when Nota between 4 and 7 then 'Regular'
   when Nota > 7 then 'Promocionado'
  end;*/
  
 Select * From Alumnos
 
 /*Select Condicion, count(*) as Cantidad, Resultado =
  case Condicion
    when 'Libre' then 'repitentes'
    when 'Regular' then 'rinden final'
    when 'Promocionado' then 'no rinden final'
    else 'sin datos'
  end
 --From Alumnos
 group by Condicion
 Order by Cantidad*/
 
--111 - Lenguaje de control de flujo (if)
  if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(5,2),
  Cantidad tinyint,
  primary key (Codigo)
 )

 Insert into Libros 
 Values('Uno','Richard Bach','Planeta',15,100)
 Insert into Libros 
 Values('El aleph','Borges','Emece',20,150)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina','Nuevo siglo',50,200)
 Insert into Libros 
 Values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,0)
 Insert into Libros 
 Values('Java en 10 minutos','Mario Molina','Emece',40,200)

 if exists (Select *From Libros WHERE Cantidad = 0)
  (Select Titulo From Libros WHERE Cantidad = 0)
 else
  Select 'No hay Libros sin stock'

 if exists (Select * From Libros WHERE Editorial = 'Emece')
 begin
  UPDATE Libros set Precio = Precio - (Precio*0.1) WHERE Editorial = 'Emece'
  Select 'Libros actualizados'
 end
 else
  Select 'no hay registros actualizados'

 Select * From Libros 
 WHERE Editorial = 'Emece'

 if exists (Select * From Libros WHERE Cantidad = 0)
  DELETE From Libros WHERE Cantidad = 0
 else
  Select 'No hay registros eliminados'

 if exists (Select * From Libros WHERE Cantidad = 0)
  DELETE From Libros WHERE Cantidad = 0
 else
  Select 'No hay registros eliminados'

 Select Titulo,Costo = iif(Precio < 38,'barato','caro') 
 From Libros

--120 - Procedimientos almacenados (crear - ejecutar)

 if object_id('Pa_Crear_Libros') is not null
  Drop procedure Pa_Crear_Libros

 Go --Para evitar un error en Procedure

 Create procedure Pa_Crear_Libros 
 as
  if object_id('Libros')is not null
   Drop Table Libros
 
  Create Table Libros(
   Codigo int identity,
   Titulo varchar(40),
   Autor varchar(30),
   Editorial varchar(20),
   Precio decimal(5,2),
   Cantidad smallint,
   primary key(Codigo)
  )

  Insert into Libros 
  Values('Uno','Richard Bach','Planeta',15,5)
  Insert into Libros 
  Values('Ilusiones','Richard Bach','Planeta',18,50)
  Insert into Libros 
  Values('El aleph','Borges','Emece',25,9)
  Insert into Libros 
  Values('Aprenda PHP','Mario Molina','Nuevo siglo',45,100)
  Insert into Libros 
  Values('Matematica estas ahi','Paenza','Nuevo siglo',12,50)
  Insert into Libros 
  Values('Java en 10 minutos','Mario Molina','Paidos',35,300)

 exec Pa_Crear_Libros

 Select *From Libros

 exec sp_help Pa_Crear_Libros

 if object_id('Pa_Libros_Limite_Stock') is not null
  Drop procedure Pa_Libros_Limite_Stock

 Go --Para evitar un error en Procedure y proc.

 Create proc Pa_Libros_Limite_Stock
  as
   Select * From Libros
   WHERE Cantidad <= 10

 exec sp_help Pa_Libros_Limite_Stock

 exec Pa_Libros_Limite_Stock

 UPDATE Libros set Cantidad=2 WHERE Codigo = 4
 exec Pa_Libros_Limite_Stock

--135 - Funciones escalares (crear y llamar)
if object_id('Empleados') is not null
  Drop Table Empleados

 Create Table Empleados(
  Documento char(8) not null,
  Nombre varchar(30),
  FechaIngreso datetime,
  Mail varchar(50),
  Telefono varchar(12)
 )

 Insert into Empleados 
 Values('22222222', 'Ana Acosta','1985/10/10','anaacosta@gMail.com','4556677')
 Insert into Empleados 
 Values('23333333', 'Bernardo Bustos', '1986/02/15',null,'4558877')
 Insert into Empleados 
 Values('24444444', 'Carlos Caseros','1999/12/02',null,null)
 Insert into Empleados 
 Values('25555555', 'Diana Dominguez',null,null,'4252525')

 if object_id('dbo.F_FechaCadena') is not null
  Drop Function dbo.F_FechaCadena

  Go --Para evitar un error en Create Function.

 Create Function F_FechaCadena
 (@Fecha varchar(25))
  RETURNs varchar(25)
  as
  begin
    declare @Nombre varchar(25)
    set @Nombre='Fecha inválida'   
    if (isdate(@Fecha) = 1)
    begin
      set @Fecha=cast(@Fecha as datetime)
      set @Nombre=
      case datename(month,@Fecha)
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'AGosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
      end--case
      set @Nombre=rtrim(cast(datepart(day,@Fecha) as char(2)))+' de '+@Nombre
      set @Nombre=@Nombre +' de '+ rtrim(cast(datepart(year,@Fecha)as char(4)))
    end--si es una fecha válida
    RETURN @Nombre
 end

 Go --Para evitar un error en Create Function.

 Select Nombre, dbo.F_FechaCadena(FechaIngreso) 
 as Ingreso 
 From Empleados

 Select dbo.F_FechaCadena(getdate())

--136 - Funciones de tabla de varias instrucciones
  if object_id('Libros') is not null
  Drop Table Libros 

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(6,2)
 )

 Insert into Libros 
 Values('Uno','Richard Bach','Planeta',15)
 Insert into Libros 
 Values('Ilusiones','Richard Bach','Planeta',10)
 Insert into Libros 
 Values('El aleph','Borges','Emece',25)
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina','Siglo XXI',55)
 Insert into Libros 
 Values('Alicia en el pais','Lewis Carroll','Paidos',35)
 Insert into Libros
 Values('Matematica estas ahi','Paenza','Nuevo siglo',25)

 if object_id('F_Ofertas') is not null
  Drop Function F_Ofertas

  Go --Para evitar un error en Create Function.

 Create Function F_Ofertas
 (@minimo decimal(6,2)
 )
 RETURNs @Ofertas Table-- Nombre de la tabla
 --formato de la tabla
 (Codigo int,
  Titulo varchar(40),
  Autor varchar(30),
  Precio decimal(6,2)
 )
 as
 begin
   Insert @Ofertas
    Select Codigo, Titulo, Autor, Precio
    From Libros
    WHERE Precio < @minimo
   RETURN
 end;

 Go --Para evitar un error en Create Function.

 Select  * From Libros

 Select * From F_Ofertas(30)

 Select l.Titulo,l.Autor,l.Editorial
  From Libros as l
  join dbo.F_Ofertas(25) as o
  on l.Codigo=o.Codigo
  WHERE l.Autor='Richard Bach'

 Select Titulo,Precio From F_Ofertas(40)
  WHERE Autor like '%B%'

 if object_id('F_ListadoLibros') is not null
  Drop Function F_ListadoLibros 

 Go --Para evitar un error en Create Function.

 Create Function F_ListadoLibros
 (@opcion varchar(10)
 )
 RETURNs @listado Table
 (Titulo varchar(40),
 Detalles varchar(60)
 )
 as 
 begin
  if @opcion not in ('Autor','Editorial')
    set @opcion='Autor'
  if @opcion='Editorial'
   Insert @listado 
    Select Titulo,
   (Editorial+'-'+Autor) From Libros
   Order by 2
  else
    if @opcion='Autor'
     Insert @listado
     Select Titulo,
     (Autor+'-'+Editorial) From Libros  
     Order by 2
  RETURN
end

Go --Para evitar un error en Create Function.

 Select * From dbo.F_ListadoLibros('Autor')

 Select * From dbo.F_ListadoLibros('Editorial')

 Select * From dbo.F_ListadoLibros('Precio')

--137 - Funciones con valores de tabla en línea
  if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(20)
 )

 Go

 Insert into Libros 
 Values('Uno','Richard Bach','Planeta')
 Insert into Libros 
 Values('El aleph','Borges','Emece')
 Insert into Libros 
 Values('Ilusiones','Richard Bach','Planeta')
 Insert into Libros 
 Values('Aprenda PHP','Mario Molina','Nuevo siglo')
 Insert into Libros 
 Values('Matematica estas ahi','Paenza','Nuevo siglo')

 if object_id('F_Libros') is not null
  Drop Function F_Libros

  Go --Para evitar un error en Create Function.

 Create Function F_Libros
 (@Autor varchar(30) = 'Borges')
 RETURNs Table
 as
 RETURN (
  Select Titulo, Editorial
  From Libros
  WHERE Autor like '%'+@Autor+'%'
 )

 Go --Para evitar un error en Create Function.

 Select * From Libros

 Select * From F_Libros('Bach')

 if object_id('F_Libros_AutorEditorial') is not null
  Drop Function F_Libros_AutorEditorial

  Go --Para evitar un error en Create Function.
  
 Create Function F_Libros_AutorEditorial
 (@Autor varchar(30) = 'Borges',
 @Editorial varchar(20) = 'Emece')
 RETURNs Table
 as
 RETURN (
  Select Titulo, Autor, Editorial
  From Libros
  WHERE Autor like '%'+ @Autor +'%' and Editorial like '%'+ @Editorial +'%'
 )

 Go --Para evitar un error en Create Function.

 Select * From F_Libros_AutorEditorial('','Nuevo siglo')
  
 Select * From F_Libros_AutorEditorial(default,default)