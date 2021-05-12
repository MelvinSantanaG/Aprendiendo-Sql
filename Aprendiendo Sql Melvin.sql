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
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float,
  cantidad integer
 );

 exec sp_columns libros;

 select * from libros;

--6 - Recuperar algunos campos (select)
 if object_id('libros') is not null
  drop table libros;

 create table libros (
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float,
  cantidad integer
 );

 exec sp_columns libros;

 select * from libros;

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
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float
 );

 select * from libros
  where autor<>'Borges';

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
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10)
 );

 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Emece');

 select * from libros --mostramos los registros de libros; 

 select titulo, autor 
 /*mostramos títulos y
 nombres de los autores*/
 from libros;

--12 - Valores null (is null)
if object_id('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(20) not null,
  autor varchar(15) not null,
  editorial varchar(10) null,
  precio float
 );

 exec sp_columns libros;

 select * from libros;

 select * from libros
  where editorial is null;

 select * from libros
  where editorial=''; 

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
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20) not null,
  autor varchar(15),
  editorial varchar(10),
  precio float
 );

 select * from libros;

 exec sp_columns libros;

 delete from libros
  where autor='Lewis Carroll';

  select * from libros;

--15 - Otras características del atributo Identity
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float
 );

 select * from libros;

 truncate table libros;

 select * from libros;

 delete from libros;

--16 - Truncate table
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float
 );

 truncate table libros;

 select * from libros;

 delete from libros;

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
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo smallint identity,
  titulo varchar(30) not null,
  autor varchar(15),
  editorial varchar(10),
  precio smallmoney,
  cantidad tinyint
 );

 select * from libros;

--19 - Tipo de dato (fecha y hora)
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
 );

 set dateformat dmy;

 select * from empleados;

--20 - Ingresar algunos campos (insert into)
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20) not null,
  autor varchar(15),
  editorial varchar(10)
 );

 select * from libros;

--21 - Valores por defecto (default)
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15) not null default 'Desconocido', 
  editorial varchar(10),
  precio decimal(5,2),
  cantidad tinyint default 0
 );

 select * from libros;

 exec sp_columns libros;

 select *from libros;

 insert into libros default values;
 select * from libros;
  
--22 - Columnas calculadas (operadores aritméticos y de concatenación)
 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20) not null,
  autor varchar(15) default 'Desconocido',
  editorial varchar(10),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );

 select titulo+'-'+autor+'-'+editorial
  from libros;

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
 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );

 select substring(titulo,1,12) as titulo from libros;

 select left(titulo,12) as titulo from libros;

 select titulo, autor, upper(editorial) from libros;

--27 - Funciones para el uso de fechas y horas
 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(20) not null,
  autor varchar(15) default 'Desconocido',
  editorial varchar(10),
  edicion datetime,
  precio decimal(6,2)
 );

--28 - Ordenar registros (order by)
 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20) not null,
  autor varchar(15) default 'Desconocido',
  editorial varchar(10),
  precio decimal(6,2),
  primary key (codigo)
 );

select * from libros order by titulo;

 select * from libros order by editorial desc;

 select * from libros order by titulo,editorial;

 select * from libros order by titulo asc, editorial desc;

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

 select count(*)
  from empleados;

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

  exec sp_tables @table_owner='dbo';

 exec sp_columns usuarios;

 drop table usuarios;

 exec sp_tables @table_owner='dbo';

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

 select top 5 * from empleados;

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
if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15) default 'Desconocido',
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

 select * from libros;

-- 43 - Combinación externa izquierda (left join)
 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15) default 'Desconocido',
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

--44 - Combinación externa derecha (right join)
 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15) default 'Desconocido',
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

-- 45 - Combinación externa completa (full join)
 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15) default 'Desconocido',
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
 if object_id('libros') is not null
  drop table libros;
 if object_id('autores') is not null
  drop table autores;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros(
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

--48 - Combinaciones con update y delete
if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros(
  codigo int identity,
  titulo varchar(20),
  autor varchar(15) default 'Desconocido',
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
if object_id('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(20),
  editorial varchar(10),
  edicion datetime,
  precio decimal(6,2)
 );

 alter table libros
  add cantidad tinyint;

 exec sp_columns libros;

 alter table libros
  add codigo int identity;

 alter table libros
  add autor varchar(30) not null;

 alter table libros
  add autor varchar(20) not null default 'Desconocido';

 alter table libros
  drop column precio;

 exec sp_columns libros;

 alter table libros
  drop column autor;

 alter table libros
  drop column editorial,edicion;

--52 - Alterar campos (alter table - alter)
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2) not null default 0
 );

 alter table libros
  alter column titulo varchar(40) not null;

 delete from libros where autor is null;
 alter table libros
  alter column autor varchar(30) not null;

 alter table libros
  alter column codigo smallint;

 exec sp_columns libros;

 alter table libros
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

 select * from empleados;

 exec sp_columns empleados;

 select * from empleados;

--54 - Subconsultas:Una subconsulta (subquery) es una sentencia "select" anidada en otra sentencia 
                  --"select", "insert", "update" o "delete" (o en otra subconsulta).

--55 - Subconsultas como expresión
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2)
 );

--56 - Subconsultas con in
 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int identity,
  titulo varchar(20),
  autor varchar(15),
  codigoeditorial tinyint,
  primary key(codigo),
 constraint FK_libros_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

--57 - Subconsultas any - some - all
 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  precio decimal(5,2),
  primary key(codigo),
 constraint FK_libros_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

 select titulo
  from libros
  where autor like '%Borges%' and
 
--58 - Subconsultas correlacionadas
 object_id('facturas') is not null

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
 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int identity,
  titulo varchar(20),
  autor varchar(15),
  codigoeditorial tinyint,
  precio decimal(5,2),
  primary key(codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

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

 select * from aprobados;

--63 - Crear tabla a partir de otra (select - into)
 if object_id('libros')is not null
  drop table libros;
 if object_id('editoriales')is not null
  drop table editoriales;

 create table libros( 
  codigo int identity,
  titulo varchar(20) not null,
  autor varchar(15),
  editorial varchar(10),
  precio decimal(5,2),
  primary key(codigo)
 ); 

 select distinct editorial as nombre
  into editoriales
  from libros;

 select *from editoriales;

 if object_id('cantidadporeditorial') is not null
  drop table cantidadporeditorial;

 select editorial as nombre,count(*) as cantidad
  into cantidadporeditorial
  from libros
  group by editorial;

 select * from cantidadporeditorial;

 if object_id('ofertas') is not null
  drop table ofertas;

 alter table editoriales add ciudad varchar(30);

--64 - go: es un signo de finalización de un lote de sentencias SQL. No es una sentencia, es un comando.
         --El lote de sentencias está compuesto por todas las sentencias antes de "go" o todas las sentencias entre dos "go".

--65 - Vistas
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

 if object_id('vista_empleados') is not null
  drop view vista_empleados;


 if object_id('vista_empleados_ingreso') is not null
  drop view vista_empleados_ingreso;

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

 if object_id('vista_empleados') is not null
  drop view vista_empleados;

 --create view vista_empleados as
  select (apellido+' '+e.nombre) as nombre,sexo,
   s.nombre as seccion, cantidadhijos
   from empleados as e
   join secciones as s
   on codigo=seccion;

 --select * from vista_empleados;

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

 alter table alumnos
  add condicion varchar(20);

 select * from alumnos;

--68 - Lenguaje de control de flujo (if)
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(20) not null,
  autor varchar(15),
  editorial varchar(10),
  precio decimal(5,2),
  cantidad tinyint,
  primary key (codigo)
 );

 select * from libros where editorial='Emece';

--69 - Procedimientos almacenados
--Vimos que SQL Server ofrece dos alternativas para asegurar la integridad de datos, la integridad:

--1) DECLARATIVA, mediante el uso de restricciones (constraints), valores predeterminados (defaults) y reglas (rules) y

--2) PROCEDIMENTAL, mediante la implementación de procedimientos almacenados y desencadenadores (triggers).

--70 - Procedimientos almacenados (crear - ejecutar)

 if object_id('pa_crear_libros') is not null
  drop procedure pa_crear_libros;

  if object_id('libros')is not null
   drop table libros
 
  create table libros(
   codigo int identity,
   titulo varchar(20),
   autor varchar(15),
   editorial varchar(10),
   precio decimal(5,2),
   cantidad smallint,
   primary key(codigo)
  )

 select *from libros;

 exec sp_help pa_crear_libros;

 if object_id('pa_libros_limite_stock') is not null
  drop procedure pa_libros_limite_stock;

 exec sp_help pa_libros_limite_stock;

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

 if object_id('f_fechaCadena') is not null
  drop function f_fechaCadena;

--74 - Funciones de tabla de varias instrucciones
 if object_id('libros') is not null
  drop table libros; 

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(6,2)
 );

 if object_id('f_ofertas') is not null
  drop function f_ofertas; 

--75 - Funciones con valores de tabla en línea
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20)
 );