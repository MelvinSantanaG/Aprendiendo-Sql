-- 1 Conceptos de Base De Datos 

--2 - Objetivos y alcances del tutorial de Microsoft Sql Server: El curso brinda un concepto teórico corto, 
                                                               --luego un problema resuelto que invito a ejecutar, modificar y 
															   --jugar con el mismo. Por último, y lo más importante, 
															   --una serie de ejercicios propuestos que nos permitirá saber
															   --si podemos aplicar el concepto.

--3 - Crear una tabla (create table - sp_tables - sp_columns - drop table)
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );

 exec sp_tables @table_owner='dbo';

 exec sp_columns usuarios;

 drop table usuarios;

 --exec sp_tables @table_owner='dbo';

--4 - Insertar y recuperar registros de una tabla (insert into - select)
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );

 insert into usuarios (nombre, clave) values ('Mariano','payaso');

 select * from usuarios;

 insert into usuarios (clave, nombre) values ('River','Juan');

 select * from usuarios;

 insert into usuarios (nombre,clave) values ('Boca','Luis');

 select * from usuarios;
 
--5 - Tipos de datos básicos
 if object_id('libros_1') is not null
  drop table libros_1;

 create table libros_1(
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float,
  cantidad integer
 );

 exec sp_columns libros_1;

 insert into libros_1 (titulo,autor,editorial,precio,cantidad) values ('El aleph','Borges','SigloXX',25.50,100);
 insert into libros_1 (titulo,autor,editorial,precio,cantidad) values ('Matematica estas ahi','Siglo XXI',18.8,50);

 select * from libros_1;

 insert into libros_1 (titulo,autor,editorial,precio,cantidad) values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);

 select * from libros_1;

--6 - Recuperar algunos campos (select)
 if object_id('libros_1') is not null
  drop table libros_1;

 create table libros_1 (
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio float,
  cantidad integer
 );

 --exec sp_columns libros_1;

 insert into libros_1 (titulo,autor,editorial,precio,cantidad) values ('El aleph','Borges',25.50);
 insert into libros_1 (titulo,autor,editorial,precio,cantidad) values ('Alicia en el pais de las maravillas','Atlantida',10);
 insert into libros_1 (titulo,autor,editorial,precio,cantidad) values ('Matematica estas ahi','Siglo XXI',18.8);

 select * from libros_1;

 select * from libros_1; 

 select titulo,precio from libros_1;

 select * from libros_1;

--7 - Recuperar algunos registros (where)
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );

 exec sp_columns usuarios;

 insert into usuarios (nombre, clave) values ('Marcelo','Boca');
 insert into usuarios (nombre, clave) values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave) values ('Susana','River');
 insert into usuarios (nombre, clave) values ('Luis','River');

 select *from usuarios
  where nombre='Leonardo';

 select nombre from usuarios
  where clave='River';

 select nombre from usuarios
  where clave='Santi';

--8 - Operadores relacionales
 if object_id('libros_2') is not null
  drop table libros_2;

 create table libros_2(
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio float
 );

 insert into libros_2 (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',24.50);
 insert into libros_2 (titulo,autor,editorial,precio)
  values ('Martin Fierro','Jose Hernandez','Emece',16.00);
 insert into libros_2 (titulo,autor,editorial,precio)
  values ('Aprenda PHP','Mario Molina','Emece',35.40);
 insert into libros_2 (titulo,autor,editorial,precio)
  values ('Cervantes y el quijote','Borges','Paidos',50.90);

 select * from libros_2
  where autor<>'Borges';

 select titulo,precio
  from libros_2
  where precio>20;

 select * from libros_2
  where precio<=30;

--9 - Borrar registros (delete)
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');

 select * from usuarios;

 delete from usuarios
 where nombre='Marcelo';

 select * from usuarios;

 delete from usuarios
 where nombre='Marcelo';

 select * from usuarios;

 delete from usuarios
  where clave='Boca';

 select * from usuarios;

 delete from usuarios;

 select * from usuarios;

--10 - Actualizar registros (update)
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(20),
  clave varchar(10)
 );

 insert into usuarios (nombre,clave) values ('Marcelo','River');
 insert into usuarios (nombre,clave) values ('Susana','chapita');
 insert into usuarios (nombre,clave) values ('Carlosfuentes','Boca');
 insert into usuarios (nombre,clave) values ('Federicolopez','Boca');

 update usuarios set clave='RealMadrid';

 select * from usuarios;

 update usuarios set clave='Boca'
  where nombre='Federicolopez';

 select * from usuarios;

 update usuarios set clave='payaso'
  where nombre='JuanaJuarez';

 select * from usuarios;

 update usuarios set nombre='Marceloduarte', clave='Marce'
  where nombre='Marcelo';

 select * from usuarios;

--11 - Comentarios
 if object_id('libros_3') is not null
  drop table libros_3;

 create table libros_3(
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15)
 );

 insert into libros_3 (titulo,autor,editorial)
  values ('El aleph','Borges','Emece');

 select * from libros_3 --mostramos los registros de libros; 

 select titulo, autor 
 /*mostramos títulos y
 nombres de los autores*/
 from libros_3;

--12 - Valores null (is null)
if object_id('libros_4') is not null
  drop table libros_4;

 create table libros_4(
  titulo varchar(30) not null,
  autor varchar(30) not null,
  editorial varchar(15) null,
  precio float
 );

 insert into libros_4 (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',null);

 insert into libros_4 (titulo,autor,editorial,precio)
  values('Alicia en el pais','Lewis Carroll',null,0);

 /*insert into libros_4 (titulo,autor,editorial,precio)
  values('Borges','Siglo XXI',25);*/

 exec sp_columns libros_4;

 insert into libros_4 (titulo,autor,editorial,precio)
  values('Uno','Richard Bach','',18.50);

 insert into libros_4 (titulo,autor,editorial,precio)
  values('','Richard Bach','Planeta',22);

 select * from libros_4;

 select * from libros_4
  where precio is null;

 select * from libros_4
  where precio=0;

 select * from libros_4
  where editorial is null;

 select * from libros_4
  where editorial=''; 

 select * from libros_4
  where precio is not null;

--13 - Clave primaria
if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(20),
  clave varchar(10),
  primary key(nombre)
 );

 exec sp_columns usuarios;

 insert into usuarios (nombre, clave) values ('juanperez','Boca');
 insert into usuarios (nombre, clave) values ('raulgarcia','River');
 insert into usuarios (nombre, clave) values ('juanperez','payaso');
 insert into usuarios (nombre, clave) values (null,'payaso');

 update usuarios set nombre='juanperez'
  where nombre='raulgarcia';
  
--14 - Campo con atributo Identity
 if object_id('libros_5') is not null
  drop table libros_5;

 create table libros_5(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio float
 );

 insert into libros_5 (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',23);

 select * from libros_5;

 insert into libros_5 (titulo,autor,editorial,precio) values('Uno','Richard Bach','Planeta',18);
 insert into libros_5 (titulo,autor,editorial,precio) values('Aprenda PHP','Mario Molina','Siglo XXI',45.60);
 insert into libros_5 (titulo,autor,editorial,precio) values('Alicia en el pais de maravillas','Lewis Carroll','Paidos',15.50);

 select * from libros_5;

 insert into libros_5 (codigo,titulo,autor,editorial,precio) values(5,'Martin Fierro','Jose Hernandez','Paidos',25);

 update libros_5 set codigo=9;
 where titulo='Uno';

 exec sp_columns libros_5;

 delete from libros_5
  where autor='Lewis Carroll';

  insert into libros_5 (titulo, autor, editorial, precio)
  values('Martin Fierro','Jose Hernandez','Paidos',25); 

  select * from libros_5;

--15 - Otras características del atributo Identity
 if object_id('libros_6') is not null
  drop table libros_6;

 create table libros_6(
  codigo int identity,
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

 insert into libros_6 (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros_6 (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros_6;

 truncate table libros_6;

 insert into libros_6 (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros_6 (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros_6;

 delete from libros_6;

 insert into libros_6 (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros_6 (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros_6;

--16 - Truncate table
 if object_id('libros_6') is not null
  drop table libros_6;

 create table libros_6(
  codigo int identity,
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

 insert into libros_6 (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros_6 (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros_6;

 truncate table libros_6;

 insert into libros_6 (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros_6 (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros_6;

 delete from libros_6;

 insert into libros_6 (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros_6 (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros_6;

--17 - Otros tipos de datos en SQL Server: Hasta ahora hemos visto 3 tipos de datos: 
                                         --varchar, integer y float. Hay más tipos, incluso, subtipos.

--18 - Tipo de dato (texto)
 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad integer,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11)
 );

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Juan Juarez',32,'masc','Avellaneda 789','Cordoba','4234567');

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890);

 select * from visitantes;

--18 - Tipo de dato (numérico)
 if object_id('libros_7') is not null
  drop table libros_7;

 create table libros_7(
  codigo smallint identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio smallmoney,
  cantidad tinyint
 );

 insert into libros_7 (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25.60);

 insert into libros_7 (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',250000);

 insert into libros_7 (titulo,autor,editorial,precio,cantidad) values('Uno','Richard Bach','Planeta','a50.30',100);

 insert into libros_7 (titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta',50.30,'100');

 select * from libros_7;

--19 - Tipo de dato (fecha y hora)
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
 );

 set dateformat dmy;

 insert into empleados(nombre,documento) values('Ana Gomez','22222222','12-01-1980');
 insert into empleados(nombre,documento) values('Bernardo Huerta','23333333','15-03-81');
 insert into empleados(nombre,documento) values('Carla Juarez','24444444','20/05/1983');
 insert into empleados(nombre,documento) values('Daniel Lopez','25555555','2.5.1990');

 select * from empleados;

 select * from empleados where fechaingreso<'01-01-1985';

 update empleados set nombre='Maria Carla Juarez' where fechaingreso='20.5.83';

 select * from empleados;

 delete from empleados where fechaingreso<>'20/05/1983';

 select * from empleados;

--20 - Ingresar algunos campos (insert into)
 if object_id('libros_8') is not null
  drop table libros_8;

 create table libros_8(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15)
 );

 insert into libros_8
  values ('Uno','Richard Bach','Planeta');

 insert into libros_8 (titulo, autor)
  values ('El aleph','Borges');

 --insert into libros_8 (autor,editorial) values ('Lewis Carroll','Planeta');

 select * from libros_8;

--21 - Valores por defecto (default)
 if object_id('libros_9') is not null
  drop table libros_9;

 create table libros_9(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint default 0
 );

 insert into libros_9 (titulo,editorial,precio)
  values('Java en 10 minutos','Paidos',50.40);

 select * from libros_9;

 insert into libros_9 (titulo,editorial)
  values('Aprenda PHP','Siglo XXI');
 select * from libros_9;

 exec sp_columns libros_9;

 insert into libros_9 (titulo,autor,precio,cantidad)
  values ('El gato con botas',default,default,100);
 select *from libros_9;

 insert into libros_9 default values;
 select * from libros_9;

 insert into libros_9 (titulo,autor,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll',null);
  
--22 - Columnas calculadas (operadores aritméticos y de concatenación)
 if object_id ('libros_10') is not null
  drop table libros_10;

 create table libros_10(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );

 insert into libros_10 (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
 insert into libros_10 values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros_10 (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

 select titulo, precio,cantidad,
  precio*cantidad from libros_10;

 select titulo,precio,
  precio-(precio*0.1) from libros_10;

 update libros_10 set precio=precio-(precio*0.1);
 select * from libros_10;

 select titulo+'-'+autor+'-'+editorial
  from libros_10;

--23 - Alias
if object_id('agenda') is not null
  drop table agenda;

 create table agenda(
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar(11)
 );

 insert into agenda (nombre,domicilio,telefono) values('Juan Perez','Avellaneda 908','4252525');
 insert into agenda (nombre,domicilio,telefono) values('Marta Lopez','Sucre 34','4556688');
 insert into agenda (nombre,domicilio,telefono) values('Carlos Garcia','Sarmiento 1258',null);

 select nombre as NombreYApellido,
  domicilio,telefono
  from agenda;

 select nombre as 'Nombre y apellido',
  domicilio,telefono
  from agenda;

 select nombre 'Nombre y apellido',
  domicilio,telefono
  from agenda;

-- 24 - Funciones: Una función es un conjunto de sentencias que operan como una unidad lógica.
                 --Una función tiene un nombre, retorna un parámetro de salida y opcionalmente acepta parámetros de entrada. 
				 --Las funciones de SQL Server no pueden ser modificadas, las funciones definidas por el usuario si.

--25 - Funciones para el manejo de cadenas
 if object_id ('libros_10') is not null
  drop table libros_10;

 create table libros_10(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );

 insert into libros_10 (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
 insert into libros_10 (titulo,autor,editorial,precio,cantidad) values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros_10 (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

 select substring(titulo,1,12) as titulo from libros_10;

 select left(titulo,12) as titulo from libros_10;

 select titulo,str(precio,6,1) from libros_10;

 select titulo,str(precio) from libros_10;

 select titulo, autor, upper(editorial) from libros_10;

--27 - Funciones para el uso de fechas y horas
 if object_id ('libros_11') is not null
  drop table libros_11;

 create table libros_11(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion datetime,
  precio decimal(6,2)
 );

 insert into libros_11 values('El aleph','Borges','Emece','1980/10/10',25.33);
 insert into libros_11 values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
 insert into libros_11 values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
 insert into libros_11 values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);

 select titulo, datepart (year,edicion) from libros_11;

 select titulo, datename (month,edicion) from libros_11;

 select titulo, datediff(year,edicion,getdate()) from libros_11;

 select titulo from libros_11 where datepart(day,edicion)=9

--28 - Ordenar registros (order by)
 if object_id ('libros_12') is not null
  drop table libros_12;

 create table libros_12(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
 );

 insert into libros_12 (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25.33);
 insert into libros_12 values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
 insert into libros_12 (titulo,autor,editorial,precio) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
 insert into libros_12 (titulo,autor,editorial,precio) values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);

select * from libros_12 order by titulo;

 select titulo,autor,precio from libros_12 order by 3;

 select * from libros_12 order by editorial desc;

 select * from libros_12 order by titulo,editorial;

 select * from libros_12 order by titulo asc, editorial desc;

 select titulo, autor from libros_12 order by precio;

 select titulo, autor, editorial, precio+(precio*0.1) as 'precio con descuento' from libros_12 order by 4;

--29 - Operadores lógicos ( and - or - not)
 if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 );

 insert into medicamentos values('Sertal','Roche',5.2,100);
 insert into medicamentos values('Buscapina','Roche',4.10,200);
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250);

 select codigo,nombre
  from medicamentos
  where laboratorio='Roche' and
  precio<5;

 select * from medicamentos
  where laboratorio='Roche' or
  precio<5;

 select * from medicamentos
  where not laboratorio='Bayer' and
  cantidad=100;

 select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;

 delete from medicamentos
  where laboratorio='Bayer' and
  precio>10;

 update medicamentos set cantidad=200
  where laboratorio='Roche' and
  precio>5;

 delete from medicamentos
  where laboratorio='Bayer' or
  precio<3;
 
--30 - Otros operadores relacionales (is null)
 if object_id('peliculas') is not null
  drop table peliculas;

 create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

 insert into peliculas
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values('Mujer bonita',null,120);
 insert into peliculas
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');

 select * from peliculas
  where actor is null;

 update peliculas set duracion=0
  where duracion is null;

 delete from peliculas
  where actor is null and
  duracion=0;

 select * from peliculas;

 --31 - Otros operadores relacionales (between)
  if object_id('visitas') is not null
  drop table visitas;

 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora datetime,
  primary key(numero)
);

 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
 insert into visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');

 select * from visitas
  where fechayhora between '2006-09-12' and '2006-10-11';

 select * from visitas
  where numero between 2 and 5;

-- 32 - Otros operadores relacionales (in)
if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  primary key(codigo)
 );

 insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01');
 insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01');
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
 insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
 insert into medicamentos values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
 insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01');

 select nombre,precio from medicamentos
  where laboratorio in ('Bayer','Bago');

 select * from medicamentos
  where cantidad between 1 and 5;

 select * from medicamentos
  where cantidad in (1,2,3,4,5);

-- 33 - Búsqueda de patrones (like - not like)
if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );

 insert into empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

 select * from empleados
  where nombre like '%Perez%';

 select * from empleados
  where domicilio like 'Co%8%';

 select * from empleados
  where documento like '%[02468]';

 select * from empleados
  where documento like '[^13]%' and
  nombre like '%ez';

 select nombre from empleados
  where nombre like '%[yj]%';

 select nombre,seccion from empleados
  where seccion like '[SG]_______';

 select nombre,seccion from empleados
  where seccion not like '[SG]%';

 select nombre,sueldo from empleados
  where sueldo not like '%.00';

 select * from empleados
  where fechaingreso like '%1990%';

--34 - Contar registros (count)
 if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );

 insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
 insert into medicamentos values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

 select count(*)
  from medicamentos;

 select count(laboratorio)
   from medicamentos;

 select count(precio) as 'Con precio',
  count(cantidad) as 'Con cantidad'
  from medicamentos;

 select count(precio)
  from medicamentos
  where laboratorio like 'B%';

 select count(numerolote) from medicamentos;

--35 - Funciones de agrupamiento (count - sum - min - max - avg)
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 );

 insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
 insert into empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
 insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
 insert into empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
 insert into empleados values('Andres Costa','28444555',default,'Secretaria',null,null);

 select count(*)
  from empleados;

 select count(sueldo)
  from empleados
  where seccion='Secretaria';

 select max(sueldo) as 'Mayor sueldo',
  min(sueldo) as 'Menor sueldo'
  from empleados;*/

 select max(cantidadhijos)
  from empleados
  where nombre like '%Perez%';

 select avg(sueldo)
  from empleados;

 select avg(sueldo)
  from empleados
  where seccion='Secretaria';

 select avg(cantidadhijos)
  from empleados
  where seccion='Sistemas';

--36 - Agrupar registros (group by)
 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  mail varchar(30),
  montocompra decimal (6,2)
 );

 insert into visitantes values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail) values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad) values ('Alejandra Gonzalez','La Falda');
 insert into visitantes (nombre,edad,sexo,ciudad) values ('Gaston Perez',29,'m','Carlos Paz');
 insert into visitantes (nombre,edad,sexo,ciudad) values ('Liliana Torres',40,'Sarmiento 876',85);
 insert into visitantes (nombre,edad,sexo,ciudad) values ('Gabriela Duarte',21,'Rio Tercero',90);

  exec sp_tables @table_owner='dbo';

 exec sp_columns usuarios;

 drop table usuarios;

 exec sp_tables @table_owner='dbo';

 select ciudad, count(*)
  from visitantes
  group by ciudad;

 select ciudad, count(telefono)
  from visitantes
  group by ciudad;

 select sexo, sum(montocompra)
  from visitantes
  group by sexo;

 select sexo,ciudad,
  max(montocompra) as mayor,
  min(montocompra) as menor
  from visitantes
  group by sexo,ciudad;

 select ciudad,
  avg(montocompra) as 'promedio de compras'
  from visitantes
  group by ciudad;

 select ciudad,
  count(*) as 'cantidad con mail'
  from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by ciudad;

 select ciudad,
  count(*) as 'cantidad con mail'
  from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by all ciudad;

--37 - Seleccionar grupos (having)
 if object_id('clientes') is not null
  drop table clientes;

 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
);

 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia;

 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia
  having count(*)>1;

 select ciudad, count(*)
  from clientes
  where domicilio like '%San Martin%'
  group by all ciudad
  having count(*)<2 and
  ciudad <> 'Cordoba';

--38 - Registros duplicados (distinct)
 if object_id('clientes') is not null
  drop table clientes;

 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

 select distinct provincia from clientes;

 select count(distinct provincia) as cantidad
  from clientes;

 select distinct ciudad from clientes;

 select count(distinct ciudad) from clientes;

 select distinct ciudad from clientes
  where provincia='Cordoba';

 select provincia,count(distinct ciudad)
  from clientes
  group by provincia;

--39 - Cláusula top
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20)
 );

 insert into empleados
  values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez','c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres','s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia',null,'Administracion');

 select top 5 * from empleados;

 select top 4 nombre,seccion
  from empleados
  order by seccion;

 select top 4 with ties nombre,seccion
  from empleados
  order by seccion;

 select top 4 nombre,estadocivil,seccion
  from empleados
  order by estadocivil,seccion;

 select top 4 with ties nombre,estadocivil,seccion
  from empleados
  order by estadocivil,seccion;

-- 40 - Eliminar restricciones (alter table - drop)
 if object_id('vehiculos') is not null
  drop table vehiculos;

 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'));

 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo;

 alter table vehiculos
  add constraint CK_vehiculos_patente_patron
  check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

 alter table vehiculos
  add constraint PK_vehiculos_patentellegada
  primary key(patente,horallegada);

 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);

 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

 insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

 exec sp_helpconstraint vehiculos;

 alter table vehiculos
  drop DF_vehiculos_tipo;

 exec sp_helpconstraint vehiculos;

 alter table vehiculos
  drop PK_vehiculos_patentellegada, CK_vehiculos_tipo;

 exec sp_helpconstraint vehiculos;

-- 41 - Trabajar con varias tablas: Para evitar la repetición de datos y ocupar menos espacio, 
                                  --se separa la información en varias tablas. Cada tabla almacena 
								  --parte de la información que necesitamos registrar.

--42 - Combinación interna (inner join)
if object_id('libros_13') is not null
  drop table libros_13;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros_13(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
 );
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');

 insert into libros_13 values('El aleph','Borges',2,20);
 insert into libros_13 values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros_13 values('Aprenda PHP','Mario Molina',3,50);
 insert into libros_13 values('Java en 10 minutos',default,3,45);

 select * from libros_13;

 select titulo, autor, nombre from libros_13 join editoriales on codigoeditorial=editoriales.codigo;

 select l.codigo,titulo,autor,nombre,precio from libros_13 as l join editoriales as e on codigoeditorial=e.codigo;

 select l.codigo,titulo,autor,nombre,precio from libros_13 as l join editoriales as e on codigoeditorial=e.codigo
  where e.nombre='Siglo XXI';

 select titulo,autor,nombre from libros_13 as l join editoriales as e on codigoeditorial=e.codigo
  order by titulo;

-- 43 - Combinación externa izquierda (left join)
 if object_id('libros_13') is not null
  drop table libros_13;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros_13(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
 );
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');

 insert into libros_13 values('El aleph','Borges',1,20);
 insert into libros_13 values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros_13 values('Aprenda PHP','Mario Molina',2,50);
 insert into libros_13 values('Java en 10 minutos',default,4,45);

  select titulo,nombre
  from editoriales as e
  left join libros_13 as l
  on codigoeditorial = e.codigo;

  select titulo,nombre
  from libros_13 as l
  left join editoriales as e
  on codigoeditorial = e.codigo;

 select titulo,nombre
  from editoriales as e
  left join libros_13 as l
  on e.codigo=codigoeditorial
  where codigoeditorial is not null;

 select titulo,nombre
  from editoriales as e
  left join libros_13 as l
  on e.codigo=codigoeditorial
  where codigoeditorial is null;

--44 - Combinación externa derecha (right join)
 if object_id('libros_13') is not null
  drop table libros_13;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros_13(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
 );
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');

 insert into libros_13 values('El aleph','Borges',1,20);
 insert into libros_13 values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros_13 values('Aprenda PHP','Mario Molina',2,50);
 insert into libros_13 values('Java en 10 minutos',default,4,45);

 select titulo,nombre
  from libros_13 as l
  right join editoriales as e
  on codigoeditorial = e.codigo;

 select titulo,nombre
  from libros_13 as l
  right join editoriales as e
  on e.codigo=codigoeditorial
  where codigoeditorial is not null;

 select titulo,nombre
  from libros_13 as l
  right join editoriales as e
  on e.codigo=codigoeditorial
  where codigoeditorial is null;

-- 45 - Combinación externa completa (full join)
 if object_id('libros_13') is not null
  drop table libros_13;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros_13(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
 );
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');

 insert into libros_13 values('El aleph','Borges',1,20);
 insert into libros_13 values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros_13 values('Aprenda PHP','Mario Molina',2,50);
 insert into libros_13 values('Java en 10 minutos',default,4,45);

 select titulo,nombre
  from editoriales as e
  full join libros_13 as l
  on codigoeditorial = e.codigo;

--46 - Combinaciones cruzadas (cross join)
 if object_id('comidas') is not null
  drop table comidas;
 if object_id('postres') is not null
  drop table postres;

 create table comidas(
  codigo tinyint identity,
  nombre varchar(30),
  precio decimal(4,2)
 );

 create table postres(
  codigo tinyint identity,
  nombre varchar(30),
  precio decimal(4,2)
 );

 insert into comidas values('ravioles',5);
 insert into comidas values('tallarines',4);
 insert into comidas values('milanesa',7);
 insert into comidas values('cuarto de pollo',6);

 insert into postres values('flan',2.5);
 insert into postres values('porcion torta',3.5);

 select c.nombre as 'plato principal',
  p.nombre as 'postre',
  c.precio+p.precio as 'total'
  from comidas as c
  cross join postres as p;

-- 47 - Combinación de más de dos tablas
 if object_id('libros_14') is not null
  drop table libros;
 if object_id('autores') is not null
  drop table autores;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros_14(
  codigo int identity,
  titulo varchar(40),
  codigoautor int not null,
  codigoeditorial tinyint not null,
  precio decimal(5,2),
  primary key(codigo)
 );

 create table autores(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
 );

 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');
 insert into editoriales values('Plaza');
 
 insert into autores values ('Richard Bach');
 insert into autores values ('Borges');
 insert into autores values ('Jose Hernandez');
 insert into autores values ('Mario Molina');
 insert into autores values ('Paenza');
 
 insert into libros_14 values('El aleph',2,2,20);
 insert into libros_14 values('Martin Fierro',3,1,30);
 insert into libros_14 values('Aprenda PHP',4,3,50);
 insert into libros_14 values('Uno',1,1,15);
 insert into libros_14 values('Java en 10 minutos',0,3,45);
 insert into libros_14 values('Matematica estas ahi',0,0,15);
 insert into libros_14 values('Java de la A a la Z',4,0,50);

 select titulo,a.nombre,e.nombre,precio
  from autores as a
  join libros_14 as l
  on codigoautor=a.codigo
  join editoriales as e
  on codigoeditorial=e.codigo;

 select titulo,a.nombre,e.nombre,precio
  from autores as a
  right join libros_14 as l
  on codigoautor=a.codigo
  left join editoriales as e
  on codigoeditorial=e.codigo;

--48 - Combinaciones con update y delete
if object_id('libros_15') is not null
  drop table libros_15;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros_15(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
 );
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');

 insert into libros_15 values('El aleph','Borges',2,20);
 insert into libros_15 values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros_15 values('Aprenda PHP','Mario Molina',3,50);
 insert into libros_15 values('Java en 10 minutos',default,3,45);

 update libros_15 set precio=precio+(precio*0.1)
  from libros_15 
  join editoriales as e
  on codigoeditorial=e.codigo
  where nombre='Planeta';

 select titulo,autor,e.nombre,precio
  from libros_15 as l
  join editoriales as e
  on codigoeditorial=e.codigo;

 delete libros_15
  from libros_15
  join editoriales
  on codigoeditorial = editoriales.codigo
  where editoriales.nombre='Emece';

 select titulo,autor,e.nombre,precio
  from libros_15 as l
  join editoriales as e
  on codigoeditorial=e.codigo;

--49 - Clave foránea: Un campo que no es clave primaria en una tabla y sirve 
-- para enlazar sus valores con otra tabla en la cual es clave primaria se denomina clave foránea, externa o ajena.
-- En el ejemplo de la librería en que utilizamos las tablas "libros" y "editoriales" con estos campos:
 --libros: codigo (clave primaria), titulo, autor, codigoeditorial, precio y editoriales: codigo (clave primaria), nombre. 

--50 - Union
 if object_id('alumnos') is not null
  drop table alumnos;
 if object_id('profesores') is not null
  drop table profesores;

 create table profesores(
  documento varchar(8) not null,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table alumnos(
  documento varchar(8) not null,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(documento)
 );

 insert into alumnos values('30000000','Juan Perez','Colon 123');
 insert into alumnos values('30111111','Marta Morales','Caseros 222');
 insert into alumnos values('30222222','Laura Torres','San Martin 987');
 insert into alumnos values('30333333','Mariano Juarez','Avellaneda 34');
 insert into alumnos values('23333333','Federico Lopez','Colon 987');
 insert into profesores values('22222222','Susana Molina','Sucre 345');
 insert into profesores values('23333333','Federico Lopez','Colon 987');

 select nombre, domicilio from alumnos
  union
   select nombre, domicilio from profesores;

 select nombre, domicilio from alumnos
  union all
   select nombre, domicilio from profesores;

 select nombre, domicilio from alumnos
  union
   select nombre, domicilio from profesores
  order by domicilio;

 select nombre, domicilio, 'alumno' as condicion from alumnos
  union
   select nombre, domicilio,'profesor' from profesores
  order by condicion;

--51 - Agregar y eliminar campos ( alter table - add - drop)
if object_id('libros_16') is not null
  drop table libros_16;

 create table libros_16(
  titulo varchar(30),
  editorial varchar(15),
  edicion datetime,
  precio decimal(6,2)
 );

 insert into libros_16 (titulo,editorial,precio)
  values ('El aleph','Emece',25.50);

 alter table libros_16
  add cantidad tinyint;

 exec sp_columns libros_16;

 alter table libros_16
  add codigo int identity;

 alter table libros_16
  add autor varchar(30) not null;

 alter table libros_16
  add autor varchar(20) not null default 'Desconocido';

 alter table libros_16
  drop column precio;

 exec sp_columns libros_16;

 alter table libros_16
  drop column autor;

 alter table libros_16
  drop column editorial,edicion;

--52 - Alterar campos (alter table - alter)
 if object_id('libros_17') is not null
  drop table libros_17;

 create table libros_17(
  codigo int identity,
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2) not null default 0
 );

 insert into libros_17
  values('El aleph','Borges','Planeta',20);
 insert into libros_17
  values('Java en 10 minutos',null,'Siglo XXI',30);
 insert into libros_17
  values('Uno','Richard Bach','Planeta',15);
 insert into libros_17
  values('Martin Fierro','Jose Hernandez',null,30);
 insert into libros_17
  values('Aprenda PHP','Mario Molina','Emece',25);

 alter table libros_17
  alter column titulo varchar(40) not null;

 delete from libros_17 where autor is null;
 alter table libros_17
  alter column autor varchar(30) not null;

 alter table libros_17
  alter column codigo smallint;

 exec sp_columns libros_17;

 alter table libros_17
  alter column precio decimal(6,2) null;

--53 - Campos calculados
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(10),
  domicilio varchar(30),
  sueldobasico decimal(6,2),
  hijos tinyint not null default 0,
  sueldototal as sueldobasico + (hijos*100)
 );

 insert into empleados values('22222222','Juan Perez','Colon 123',300,2);
 insert into empleados values('23333333','Ana Lopez','Sucre 234',500,0);

 select * from empleados;

 update empleados set hijos=1 where documento='23333333';

 select * from empleados;

 alter table empleados
  add salariofamiliar as hijos*100;

 exec sp_columns empleados;

 select * from empleados;

--54 - Subconsultas:Una subconsulta (subquery) es una sentencia "select" anidada en otra sentencia 
                  --"select", "insert", "update" o "delete" (o en otra subconsulta).

--55 - Subconsultas como expresión
 if object_id('libros_18') is not null
  drop table libros_18;

 create table libros_18(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2)
 );

 insert into libros_18 values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros_18 values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros_18 values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros_18 values('El aleph','Borges','Emece',10.00);
 insert into libros_18 values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros_18 values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros_18 values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros_18 values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros_18 values('Uno','Richard Bach','Planeta',10.00);

 select titulo,precio,
  precio-(select max(precio) from libros_18) as diferencia
  from libros_18
  where titulo='Uno';

 select titulo,autor, precio
  from libros_18
  where precio=
   (select max(precio) from libros_18);

 update libros_18 set precio=45
  where precio=
   (select max(precio) from libros_18);

 delete from libros_18
  where precio=
   (select min(precio) from libros_18);

--56 - Subconsultas con in
 if object_id('libros_19') is not null
  drop table libros_19;
 if object_id('editoriales') is not null
  drop table editoriales_2;

 create table editoriales_2(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros_19 (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  primary key(codigo),
 constraint FK_libros_19_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

 insert into libros_19 values('Uno','Richard Bach',1);
 insert into libros_19 values('Ilusiones','Richard Bach',1);
 insert into libros_19 values('Aprenda PHP','Mario Molina',4);
 insert into libros_19 values('El aleph','Borges',2);
 insert into libros_19 values('Puente al infinito','Richard Bach',2);

 select nombre
  from editoriales
  where codigo in
   (select codigoeditorial
     from libros_19
     where autor='Richard Bach');

 select codigoeditorial
  from libros_19
  where autor='Richard Bach';

 select distinct nombre
  from editoriales as e
  join libros_19
  on codigoeditorial=e.codigo
  where autor='Richard Bach';

 select nombre
  from editoriales
  where codigo not in
   (select codigoeditorial
     from libros_19
     where autor='Richard Bach');

--57 - Subconsultas any - some - all
 if object_id('libros_19') is not null
  drop table libros_19;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros_19 (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  precio decimal(5,2),
  primary key(codigo),
 constraint FK_libros_19_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

 insert into libros_19 values('Uno','Richard Bach',1,15);
 insert into libros_19 values('Ilusiones','Richard Bach',4,18);
 insert into libros_19 values('Puente al infinito','Richard Bach',2,19);
 insert into libros_19 values('Aprenda PHP','Mario Molina',4,40);
 insert into libros_19 values('El aleph','Borges',2,10);
 insert into libros_19 values('Antología','Borges',1,20);
 insert into libros_19 values('Cervantes y el quijote','Borges',3,25);

 select titulo
  from libros_19
  where autor like '%Borges%' and
  codigoeditorial = any
   (select e.codigo
    from editoriales as e
    join libros_19 as l
    on codigoeditorial=e.codigo
    where l.autor like '%Bach%');

 select titulo,precio
  from libros_19
  where autor like '%Borges%' and
  precio > any
   (select precio
    from libros_19
    where autor like '%Bach%');

 select titulo,precio
  from libros_19
  where autor like '%Borges%' and
  precio > all
   (select precio
    from libros_19
    where autor like '%Bach%');

 delete from libros_19
  where autor like '%Borges%' and
  precio > all
   (select precio
    from libros_19
    where autor like '%Bach%');

--58 - Subconsultas correlacionadas
 if object_id('detalles') is not null
  drop table detalles;
 if object_id('facturas') is not null
  drop table facturas;

 create table facturas(
  numero int not null,
  fecha datetime,
  cliente varchar(30),
  primary key(numero)
 );

 create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on update cascade
   on delete cascade,
 );

 insert into facturas values(1200,'2018-01-15','Juan Lopez');
 insert into facturas values(1201,'2018-01-15','Luis Torres');
 insert into facturas values(1202,'2018-01-15','Ana Garcia');
 insert into facturas values(1300,'2018-01-20','Juan Lopez');

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);

 select f.*,
  (select count(d.numeroitem)
    from detalles as d
    where f.numero=d.numerofactura) as cantidad,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f;

--59 - Exists y No Exists
 if object_id('detalles') is not null
  drop table detalles;
 if object_id('facturas') is not null
  drop table facturas;

 create table facturas(
  numero int not null,
  fecha datetime,
  cliente varchar(30),
  primary key(numero)
 );

 create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on update cascade
   on delete cascade
 );

 insert into facturas values(1200,'2018-01-15','Juan Lopez');
 insert into facturas values(1201,'2018-01-15','Luis Torres');
 insert into facturas values(1202,'2018-01-15','Ana Garcia');
 insert into facturas values(1300,'2018-01-20','Juan Lopez');

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);

 select cliente,numero
  from facturas as f
  where exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');

 select cliente,numero
  from facturas as f
  where not exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');

--60 - Subconsulta en lugar de una tabla
 if object_id('detalles') is not null
  drop table detalles;
 if object_id('facturas') is not null
  drop table facturas;
 if object_id('clientes') is not null
  drop table clientes;

 create table clientes(
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table facturas(
  numero int not null,
  fecha datetime,
  codigocliente int not null,
  primary key(numero),
  constraint FK_facturas_cliente
   foreign key (codigocliente)
   references clientes(codigo)
   on update cascade
 );

 create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on update cascade
   on delete cascade,
 );

 insert into clientes values('Juan Lopez','Colon 123');
 insert into clientes values('Luis Torres','Sucre 987');
 insert into clientes values('Ana Garcia','Sarmiento 576');

 insert into facturas values(1200,'2018-01-15',1);
 insert into facturas values(1201,'2018-01-15',2);
 insert into facturas values(1202,'2018-01-15',3);
 insert into facturas values(1300,'2018-01-20',1);

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);

 select f.*,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f;

 select td.numero,c.nombre,td.total
  from clientes as c
  join (select f.*,
   (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
  from facturas as f) as td
  on td.codigocliente=c.codigo;

--61 - Subconsulta (update - delete)
 if object_id('libros_20') is not null
  drop table libros_20;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros_20 (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

 insert into libros_20 values('Uno','Richard Bach',1,15);
 insert into libros_20 values('Ilusiones','Richard Bach',2,20);
 insert into libros_20 values('El aleph','Borges',3,10);
 insert into libros_20 values('Aprenda PHP','Mario Molina',4,40);
 insert into libros_20 values('Poemas','Juan Perez',1,20);
 insert into libros_20 values('Cuentos','Juan Perez',3,25);
 insert into libros_20 values('Java en 10 minutos','Marcelo Perez',2,30);

 update libros_20 set precio=precio+(precio*0.1)
  where codigoeditorial=
   (select codigo
     from editoriales
     where nombre='Emece');

 delete from libros_20
  where codigoeditorial in
   (select e.codigo
    from editoriales as e
    join libros_20
    on codigoeditorial=e.codigo
    where autor='Juan Perez');

--62 - Subconsulta (insert)
 if object_id('alumnos') is not null
  drop table alumnos;
 if object_id('aprobados') is not null
  drop table aprobados;

 create table alumnos(
  documento char(8) not null,
  nombre varchar(30),
  nota decimal(4,2)
   constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
  primary key(documento),
 );

 create table aprobados(
  documento char(8) not null,
  nota decimal(4,2)
   constraint CK_aprobados_nota_valores check (nota>=0 and nota <=10),
  primary key(documento),
 );

 insert into alumnos values('30000000','Ana Acosta',8);
 insert into alumnos values('30111111','Betina Bustos',9);
 insert into alumnos values('30222222','Carlos Caseros',2.5); 
 insert into alumnos values('30333333','Daniel Duarte',7.7);
 insert into alumnos values('30444444','Estela Esper',3.4);

 insert into aprobados 
  select documento,nota
   from alumnos
   where nota>=4;

 select * from aprobados;

--63 - Crear tabla a partir de otra (select - into)
 if object_id('libros_21')is not null
  drop table libros_21;
 if object_id('editoriales')is not null
  drop table editoriales;

 create table libros_21( 
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
 ); 

 insert into libros_21 values('Uno','Richard Bach','Planeta',15);
 insert into libros_21 values('El aleph','Borges','Emece',25);
 insert into libros_21 values('Matematica estas ahi','Paenza','Nuevo siglo',18);
 insert into libros_21 values('Aprenda PHP','Mario Molina','Nuevo siglo',45);
 insert into libros_21 values('Ilusiones','Richard Bach','Planeta',14);
 insert into libros_21 values('Java en 10 minutos','Mario Molina','Nuevo siglo',50);

 select distinct editorial as nombre
  into editoriales
  from libros_21;

 select *from editoriales;

 if object_id('cantidadporeditorial') is not null
  drop table cantidadporeditorial;

 select editorial as nombre,count(*) as cantidad
  into cantidadporeditorial
  from libros_21
  group by editorial;

 select *from cantidadporeditorial;

 if object_id('ofertas4') is not null
  drop table ofertas4;

 select top 4 *
  into ofertas4
  from libros_21
  order by precio asc;

 select *from ofertas4;

 alter table editoriales add ciudad varchar(30);

 go

 update editoriales set ciudad='Cordoba' where nombre='Planeta';
 update editoriales set ciudad='Cordoba' where nombre='Emece';
 update editoriales set ciudad='Buenos Aires' where nombre='Nuevo siglo';

 if object_id('libros_decordoba') is not null
  drop table libros_decordoba;

 select titulo,autor
  into librosdecordoba
  from libros
  join editoriales
  on editorial=nombre 
  where ciudad='Cordoba';

 select *from librosdecordoba;

--64 - go: es un signo de finalización de un lote de sentencias SQL. No es una sentencia, es un comando.
         --El lote de sentencias está compuesto por todas las sentencias antes de "go" o todas las sentencias entre dos "go".

--65 - Vistas
 if object_id('empleados') is not null
  drop table empleados;

 if object_id('secciones') is not null
  drop table secciones;*/

 create table secciones(
  codigo tinyint identity,
  nombre varchar(20),
  sueldo decimal(5,2)
   constraint CK_secciones_sueldo check (sueldo>=0),
  constraint PK_secciones primary key (codigo)
 );

 create table empleados(
  legajo int identity,
  documento char(8)
   constraint CK_empleados_documento check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  sexo char(1)
   constraint CK_empleados_sexo check (sexo in ('f','m')),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion tinyint not null,
  cantidadhijos tinyint
   constraint CK_empleados_hijos check (cantidadhijos>=0),
  estadocivil char(10)
   constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  fechaingreso datetime,
   constraint PK_empleados primary key (legajo),
  constraint FK_empleados_seccion
   foreign key (seccion)
   references secciones(codigo),
   on update cascade,
   constraint UQ_empleados_documento
   unique(documento)
 );

 insert into secciones values('Administracion',300);
 insert into secciones values('Contaduría',400);
 insert into secciones values('Sistemas',500);

 insert into empleados values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
 insert into empleados values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
 insert into empleados values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12');
 insert into empleados values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
 insert into empleados values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');

 if object_id('vista_empleados') is not null
  drop view vista_empleados;

 create view vista_empleados as select (apellido+' '+e.nombre) as nombre,sexo,
   s.nombre as seccion, cantidadhijos
   from empleados as e
   join secciones as s
   on codigo=seccion;

 select * from vista_empleados;

 select seccion,count(*) as cantidad
  from vista_empleados
  group by seccion;

 if object_id('vista_empleados_ingreso') is not null
  drop view vista_empleados_ingreso;

 create view vista_empleados_ingreso (fecha,cantidad);
  as
  select datepart(year,fechaingreso),count(*)
   from empleados
   group by datepart(year,fechaingreso);

 select * from vista_empleados_ingreso;

--66 - Vistas (información)
 if object_id('empleados') is not null
  drop table empleados;
 if object_id('secciones') is not null
  drop table secciones;

 create table secciones(
  codigo tinyint identity,
  nombre varchar(20),
  sueldo decimal(5,2)
   constraint CK_secciones_sueldo check (sueldo>=0),
  constraint PK_secciones primary key (codigo)
 );

 create table empleados(
  legajo int identity,
  documento char(8)
   constraint CK_empleados_documento check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  sexo char(1)
   constraint CK_empleados_sexo check (sexo in ('f','m')),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion tinyint not null,
  cantidadhijos tinyint
   constraint CK_empleados_hijos check (cantidadhijos>=0),
  estadocivil char(10)
   constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  fechaingreso datetime,
   constraint PK_empleados primary key (legajo),
  constraint FK_empleados_seccion
   foreign key (seccion)
   references secciones(codigo)
   on update cascade,
  constraint UQ_empleados_documento
   unique(documento)
);

 insert into secciones values('Administracion',300);
 insert into secciones values('Contaduría',400);
 insert into secciones values('Sistemas',500);

 insert into empleados values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
 insert into empleados values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
 insert into empleados values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12');
 insert into empleados values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
 insert into empleados values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');

 if object_id('vista_empleados') is not null
  drop view vista_empleados;

 create view vista_empleados as
  select (apellido+' '+e.nombre) as nombre,sexo,
   s.nombre as seccion, cantidadhijos
   from empleados as e
   join secciones as s
   on codigo=seccion;

 select * from vista_empleados;

 exec sp_help vista_empleados;

 exec sp_helptext vista_empleados;

 exec sp_depends vista_empleados;

 exec sp_depends empleados;

 select * from sysobjects;

 select * from sysobjects
  where xtype='V' and-- tipo vista
  name like 'vista%'--búsqueda con comodín ;

--67 - Lenguaje de control de flujo (case)
 if object_id('alumnos') is not null
  drop table alumnos;

 create table alumnos(
  nombre varchar(40),
  nota tinyint,
    constraint CK_alunos_nota check (nota>=0 and nota<=10)
 );

 insert into alumnos (nombre,nota) values('Ana Acosta',8);
 insert into alumnos values('Carlos Caseres',4);
 insert into alumnos values('Federico Fuentes',2);
 insert into alumnos values('Gaston Guzman',3);
 insert into alumnos values('Hector Herrero',5);
 insert into alumnos values('Luis Luna',10);
 insert into alumnos values('Marcela Morales',7);
 insert into alumnos values('Marcela Morales',null);

 select nombre,nota, condicion=
 case nota
  when 0 then 'libre'
  when 1 then 'libre'
  when 2 then 'libre'
  when 3 then 'libre'
  when 4 then 'regular'
  when 5 then 'regular'
  when 6 then 'regular'
  when 7 then 'promocionado'
  when 8 then 'promocionado'
  when 9 then 'promocionado'
  when 10 then 'promocionado'
 end
 from alumnos;

 select nombre, nota, condicion=
  case 
   when nota<4 then 'libre'
   when nota >=4 and nota<7 then 'regular'
   when nota>=7 then 'promocionado'
   else 'sin nota'
  end
 from alumnos;

 alter table alumnos
  add condicion varchar(20);

 select *from alumnos;

 update alumnos set condicion =
  case
   when nota<4 then 'libre'
   when nota between 4 and 7 then 'regular'
   when nota >7 then 'promocionado'
  end;*/

 select *from alumnos;

 select condicion, count(*) as cantidad,resultado =
  case condicion
    when 'libre' then 'repitentes'
    when 'regular' then 'rinden final'
    when 'promocionado' then 'no rinden final'
    else 'sin datos'
  end
 from alumnos
 group by condicion*/
 order by cantidad;

--68 - Lenguaje de control de flujo (if)
 if object_id('libros_22') is not null
  drop table libros_22;

 create table libros_22(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key (codigo)
 );

 insert into libros_22 values('Uno','Richard Bach','Planeta',15,100);
 insert into libros_22 values('El aleph','Borges','Emece',20,150);
 insert into libros_22 values('Aprenda PHP','Mario Molina','Nuevo siglo',50,200);
 insert into libros_22 values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,0);
 insert into libros_22 values('Java en 10 minutos','Mario Molina','Emece',40,200);

 if exists (select *from libros_22 where cantidad=0)
  (select titulo from libros_22 where cantidad=0)
 else
  select 'No hay libros sin stock';

 if exists (select * from libros_22 where editorial='Emece')
 begin
  update libros_22 set precio=precio-(precio*0.1) where editorial='Emece'
  select 'libros actualizados'
 end
 else
  select 'no hay registros actualizados';

 select * from libros_22 where editorial='Emece';

 if exists (select * from libros_22 where cantidad=0)
  delete from libros_22 where cantidad=0
 else
  select 'No hay registros eliminados';

 if exists (select * from libros_22 where cantidad=0)
  delete from libros_22 where cantidad=0
 else
  select 'No hay registros eliminados';

 select titulo,costo=iif(precio<38,'barato','caro') from libros_22;

--69 - Procedimientos almacenados
--Vimos que SQL Server ofrece dos alternativas para asegurar la integridad de datos, la integridad:

--1) DECLARATIVA, mediante el uso de restricciones (constraints), valores predeterminados (defaults) y reglas (rules) y

--2) PROCEDIMENTAL, mediante la implementación de procedimientos almacenados y desencadenadores (triggers).

--70 - Procedimientos almacenados (crear - ejecutar)

 if object_id('pa_crear_libros_23') is not null
  drop procedure pa_crear_libros;

 create procedure pa_crear_libros;
 as
  if object_id('libros_23')is not null
   drop table libros_23
 
  create table libros_23(
   codigo int identity,
   titulo varchar(40),
   autor varchar(30),
   editorial varchar(20),
   precio decimal(5,2),
   cantidad smallint,
   primary key(codigo)
  )

  insert into libros_23 values('Uno','Richard Bach','Planeta',15,5)
  insert into libros_23 values('Ilusiones','Richard Bach','Planeta',18,50)
  insert into libros_23 values('El aleph','Borges','Emece',25,9)
  insert into libros_23 values('Aprenda PHP','Mario Molina','Nuevo siglo',45,100)
  insert into libros_23 values('Matematica estas ahi','Paenza','Nuevo siglo',12,50)
  insert into libros_23 values('Java en 10 minutos','Mario Molina','Paidos',35,300);

 exec pa_crear_libros;

 select *from libros_23;

 exec sp_help pa_crear_libros;

 if object_id('pa_libros_limite_stock') is not null
  drop procedure pa_libros_limite_stock;
 
 create proc pa_libros_limite_stock;
  as
   where cantidad <=10;

 exec sp_help pa_libros_limite_stock;

 exec pa_libros_limite_stock;

 --update libros set cantidad=2 where codigo=4;
 exec pa_libros_limite_stock;

--71 - Tablas temporales: se eliminan automáticamente al acabar la sesión o la función o procedimiento 
                        --almacenado en el cual fueron definidas. Se pueden eliminar con "drop table".

--71 - Tablas temporales: pueden clasificarse en:

-- a) deterministicas: siempre retornan el mismo resultado si se las invoca enviando el mismo valor de entrada. 
-- Todas las funciones de agregado y string son deterministicas, excepto "charindex" y "patindex".

-- b) no deterministicas: pueden retornar distintos resultados cada vez que se invocan con el mismo valor de entrada.
-- Las siguientes son algunas de las funciones no deterministicas: getdate, datename, textptr, textvalid, rand.
-- Todas las funciones de configuración, cursor, meta data, seguridad y estadísticas del sistema son no deterministicas.

--73 - Funciones escalares (crear y llamar)
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8) not null,
  nombre varchar(30),
  fechaingreso datetime,
  mail varchar(50),
  telefono varchar(12)
 );

 insert into empleados values('22222222', 'Ana Acosta','1985/10/10','anaacosta@gmail.com','4556677');
 insert into empleados values('23333333', 'Bernardo Bustos', '1986/02/15',null,'4558877');
 insert into empleados values('24444444', 'Carlos Caseros','1999/12/02',null,null);
 insert into empleados values('25555555', 'Diana Dominguez',null,null,'4252525');

 if object_id('dbo.f_fechaCadena') is not null
  drop function dbo.f_fechaCadena;

 create function f_fechaCadena;
 (@fecha varchar(25))
  returns varchar(25)
  as
  begin
    declare @nombre varchar(25)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=
      case datename(month,@fecha)
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'Agosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
      end--case
      set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+' de '+@nombre
      set @nombre=@nombre+' de '+ rtrim(cast(datepart(year,@fecha)as char(4)))
    end--si es una fecha válida
    return @nombre
 end;*/

 select nombre, dbo.f_fechaCadena(fechaingreso) as ingreso from empleados;

 select dbo.f_fechaCadena(getdate());

--74 - Funciones de tabla de varias instrucciones
 if object_id('libros_24') is not null
  drop table libros_24; 

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(6,2)
 );

 insert into libros values('Uno','Richard Bach','Planeta',15);
 insert into libros values('Ilusiones','Richard Bach','Planeta',10);
 insert into libros values('El aleph','Borges','Emece',25);
 insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',55);
 insert into libros values('Alicia en el pais','Lewis Carroll','Paidos',35);
 insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',25);

 if object_id('f_ofertas') is not null
  drop function f_ofertas; 

 create function f_ofertas;
 (@minimo decimal(6,2)
 )
 returns @ofertas table-- nombre de la tabla
 --formato de la tabla
 (codigo int,
  titulo varchar(40),
  autor varchar(30),
  precio decimal(6,2)
 )
 as
 begin
   insert @ofertas
    select codigo,titulo,autor,precio
    from libros
    where precio<@minimo
   return
 end;

 select *from f_ofertas(30);

 select l.titulo,l.autor,l.editorial
  from libros as l
  join dbo.f_ofertas(25) as o
  on l.codigo=o.codigo
  where l.autor='Richard Bach';

 select titulo,precio from f_ofertas(40)
  where autor like '%B%';

 if object_id('f_listadolibros') is not null
  drop function f_listadolibros; 

 create function f_listadolibros;
 (@opcion varchar(10)
 )
 returns @listado table
 (titulo varchar(40),
 detalles varchar(60)
 )
 as 
 begin
  if @opcion not in ('autor','editorial')
    set @opcion='autor'
  if @opcion='editorial'
   insert @listado 
    select titulo,
   (editorial+'-'+autor) from libros
   order by 2
  else
    if @opcion='autor'
     insert @listado
     select titulo,
     (autor+'-'+editorial) from libros  
     order by 2
  return
end;

 select *from dbo.f_listadolibros('autor');

 select *from dbo.f_listadolibros('editorial');

 select *from dbo.f_listadolibros('precio');

--75 - Funciones con valores de tabla en línea
 if object_id('libros_25') is not null
  drop table libros_25;

 create table libros_25(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20)
 );

 insert into libros_25 values('Uno','Richard Bach','Planeta');
 insert into libros_25 values('El aleph','Borges','Emece');
 insert into libros_25 values('Ilusiones','Richard Bach','Planeta');
 insert into libros_25 values('Aprenda PHP','Mario Molina','Nuevo siglo');
 insert into libros_25 values('Matematica estas ahi','Paenza','Nuevo siglo');

 if object_id('f_libros') is not null
  drop function f_libros;

 create function f_libros;
 (@autor varchar(30)='Borges')
 returns table
 as
 return (
  select titulo,editorial
  from libros_25
  where autor like '%'+@autor+'%'
 );

 select *from f_libros('Bach');

 if object_id('f_libros_autoreditorial') is not null
  drop function f_libros_autoreditorial;

 create function f_libros_autoreditorial;
 (@autor varchar(30)='Borges',
 @editorial varchar(20)='Emece')
 returns table
 as
 return (
  select titulo,autor,editorial
  from libros_25
  where autor like '%'+@autor+'%' and
  editorial like '%'+@editorial+'%'
 );

 select *from f_libros_autoreditorial('','Nuevo siglo');

 select *from f_libros_autoreditorial(default,default);
