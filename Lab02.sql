--- Avanzando Transact SQL Server

/*Hacer un listado de base de datos de una instancia del servidor SQl Server */
SELECT name, database_id, create_date
FROM sys.databases;
GO

/* Verificar si existe la base de datos Biblioteca, de no existir debe crearla */
IF db_id('Biblioteca') IS NOT NULL
    PRINT 'Si existe la base de datos'
ELSE
    PRINT 'No existe la base de datos, procederé a crearla'
    CREATE DATABASE Biblioteca
 GO

/* Creando la tabla libros */
USE Biblioteca
Create table Libro
(
	CodLib int not null,
    NomLib char(60) not null,
    EditLib char(35) not null,
    AutLib char(35) not null,
    GenLib char(35) not null,
    NumPagLib int not null,
    FecEdicLib date not null,
    CONSTRAINT CodLib_PK Primary key (CodLib)
)
GO

/* Creando la tabla préstamos */
USE Biblioteca
Create table Prestamo
(
	NumPres int not null,
    CodLib int not null,
    CodUs int not null,
    FecSalLib date not null,
    FecDevLib date not null,
    CONSTRAINT NumPres_PK Primary Key (NumPres)
)
GO

/* Creando la tabla usuarios */
USE Biblioteca
Create table Usuario
(
	CodUs INT IDENTITY (1,1),
    NomUs char(40) not null,
    ApeUs char(40) not null,
    DNIUs char(8) not null,
    DirUs char(50) not null,
    DistUs char(40) not null,
    Provincia char(40) not null,
    FeNac date not null,
    CONSTRAINT CodUs_PK Primary Key (CodUs)
)
GO

 /* Creando relaciones en la tabla detalle o tabla principal */
USE Biblioteca
Alter table Prestamo
	Add CONSTRAINT CodLib FOREIGN KEY (CodLib) REFERENCES Libro (CodLib),
        CONSTRAINT CodUs FOREIGN KEY (CodUs) REFERENCES Usuario (CodUs)
GO

/* Ver estructura de uan tabla */
SELECT  COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME='Libro'
GO

/* Agregar más registros a la tabla Libros */
USE Biblioteca
Insert into Libro
(CodLib, NomLib, EditLib, AutLib, GenLib, NumPagLib, FecEdicLib)
Values
('1', 'Don Quijote de la Mancha I', 'Anaya', 'Miguel de Cervantes Saavedra', 'Caballeresco', '517', '05/OCTOBER/1979'),
('2', 'Don Quijote de la Mancha II', 'Anaya', 'Miguel de Cervantes Saavedra', 'Caballeresco', '517', '05/OCTOBER/1990'),
('3', 'Historia de Nueva Orleans', 'Alfaraguara', 'William Faulkner', 'Novela', '186', '10/APRIL/1985'),
('4', 'El Principito', 'Andina', 'Antonie Saint', 'Aventura', '120', '09/APRIL/1996'),
('5', 'El Príncipe', 'S.M', 'Maquiavelo', 'Político', '210', '12/AUGUST/1995'),
('6', 'Diplomacia', 'S.M', 'Henry Kissinger', 'Político', '825', '10/JUNE/1975')
GO

/* Ver registros de tabla Libros */
SELECT * FROM Libro

/* Insertar registros en la tabla Usuarios */
USE Biblioteca
INSERT INTO Usuario
(NomUs, ApeUs, DNIUs, DirUs, DistUs, Provincia, FeNac)
VALUES
('Inés', 'Posadas Gil','25786321', 'Av. Las Escaleritas 125', 'Nuevo Imperial', 'Cañete', '04/JULY/1971'),
('José', 'Sánchez Pons','40155263', 'Meza y López 51', 'Lunahuaná', 'Cañete', '06/SEPTEMBER/1966'),
('Miguel', 'Gómez Sáenz','15478952', 'Gran Vía 71', 'Imperial', 'Cañete','09/DECEMBER/1976'),
('Eva', 'Santana Páez','01563289', 'Pío Baroja 23', 'San Vicente', 'Cañete', '23/MAY/1980'),
('Yolanda', 'Betancor Díaz','45896325', 'El Cid 45', 'San Luis', 'Cañete','17/SEPTEMBER/1976'),
('Panchito', 'Guerra Cama','78945612', 'Av. Los Galácticos', 'Imperial', 'Cañete', '06/JUNE/1986')
GO

/* Ver registros de tabla Usuarios */
SELECT * FROM Usuario

/*Insertar registros a la tabla Préstamos*/
USE Biblioteca
Insert into Prestamo
(NumPres, CodLib, CodUs, FecSalLib, FecDevLib)
Values
('1', '1', '3', '01/NOVEMBER/1999', '13/NOVEMBER/1999'),
('2', '3', '2', '03/NOVEMBER/1999', '18/NOVEMBER/1999'),
('3', '2', '5', '18/NOVEMBER/1999', '25/NOVEMBER/1999'),
('4', '5', '2', '21/NOVEMBER/1999', '01/DECEMBER/1999'),
('5', '6', '4', '21/NOVEMBER/1999', '30/NOVEMBER/1999'),
('6', '2', '4', '26/NOVEMBER/1999', '01/DECEMBER/1999'),
('7', '4', '3', '30/NOVEMBER/1999', '05/DECEMBER/1999'),
('8', '1', '1', '01/DECEMBER/1999', '04/DECEMBER/1999');
GO

/* Ver registros de tabla Préstamos */
SELECT * FROM Prestamo

ALTER TABLE Prestamos   
    DROP CONSTRAINT CodLib,
         CONSTRAINT CodUs;

/* Modificar los datos de un registro de la tabla usuarios */
UPDATE Usuario
    SET NomUs = 'José Carlos'
    WHERE CodUs = 6

/* Modificar los datos de un registro de la tabla usuarios */
UPDATE Usuario
    SET DistUs = 'Mala'
    WHERE DNIUs = 45896325

/* Agregar una columna a una tabla */
ALTER TABLE Libro
    ADD PaisLib VARCHAR(60)

/* Agregar datos de nueva columna a registros ya ingresados */
UPDATE Libro
    SET PaisLib = 'España'
    WHERE CodLib = 1
GO

/* Agregar datos de nueva columna a registros ya ingresados */
UPDATE Libro
    SET PaisLib = 'Perú'
    WHERE CodLib >=3 AND CodLib <=5 
GO

/* Variables con Transact SQL */
DECLARE @NombreVar VARCHAR(50)
SET @NombreVar = 'Hello World'
PRINT @NombreVar

/* Demo 01 con variables */
DECLARE @Nombre VARCHAR(20);
DECLARE @Apellido VARCHAR (20)
SET @Nombre = 'Milet'
SET @Apellido = 'Figueroa'
PRINT @Nombre
PRINT @Apellido

/* Demo 02 concatenando resultado variables */
DECLARE @NomActriz VARCHAR(20);
DECLARE @ApeActriz VARCHAR (20)
SET @NomActriz = 'Milet'
SET @ApeActriz = 'Figueroa'
PRINT @NomActriz + ' ' + @ApeActriz

/* Demo 03 obteniendo el número de caracteres de cadenas de texto */
DECLARE @Distrito VARCHAR(30);
DECLARE @Provincia VARCHAR (30)
SET @Distrito = 'Lunahuaná'
SET @Provincia = 'Cañete'
PRINT LEN(@Distrito)
PRINT LEN(@Provincia)

/* Demo 04 Obtener el número de caracteres de una cadena de texto */
DECLARE @Texto01 VARCHAR (10)
DECLARE @Texto02 CHAR (10)
SET @Texto01 = 'Pedro'
SET @Texto02 = 'Rosa'
PRINT 'Cantidad de carateres del texto: ' + @Texto01 + ' es ' + CONVERT(VARCHAR(3), LEN(@Texto01))
PRINT 'Cantidad de carateres del texto: ' + @Texto02 + ' es ' + CONVERT(VARCHAR(3), LEN(@Texto02))

/* Demo 05 Validando tipos de datos Char y Varchar */
    ---Crear tabla demo --
    CREATE TABLE PruebaTexto
    (Cadena01 CHAR(10), Cadena02 VARCHAR(10))

    -- Insertar registros --
    INSERT INTO PruebaTexto
    VALUES ('Hola', 'chau')

    -- Validar registros ingrsados --
    SELECT * FROM PruebaTexto

    -- Validando tamaño de datos ingresados en los campos --
    SELECT  Largo1 = DATALENGTH(Cadena01), Cadena01, 
            Largo2 = DATALENGTH(Cadena02), Cadena02
    FROM PruebaTexto  

/* Demo 06 Obtener el tamaño de caracteres de los nombres de Usuarios */
SELECT LENGTH = LEN(NomUs), NomUs AS 'Nombre de Usuario'
FROM Usuario 
ORDER BY NomUs;

/* Demo 07 validando tipos de datos Decimal y Numeric */
    -- Crear tabla PruebaDecNum --
    CREATE TABLE PruebaDecNum  
    (DecimalColumn decimal(5,2), NumericColumn numeric(10,5));  

    -- Insertar registros en tabla PruebaDecNum --
    INSERT INTO PruebaDecNum
    VALUES (123, 9999.12);  

    -- Ver registros ingresados --
    SELECT * FROM PruebaDecNum;

/* Demo 08 Diferencias entre tipo de dato INT y Numeric */
    -- Crear tabla PruebaIntNum
    CREATE TABLE PruebaIntNum  
    (Integro int, NumericColumn numeric(5,3));  

    --Insertar registros en tabla PruebaIntNum --
    INSERT INTO PruebaIntNum
    VALUES (15.1015, 45.2);  

    -- Ver registros ingresados --
    SELECT * FROM PruebaIntNum;

/* Demo 09 Tipos de datos Fecha y Hora */
    -- Ver fecha actual del sistema
    SELECT CONVERT(date, getdate()) AS 'Fecha de hoy'

    -- Ver fecha en el formato día, mes y año
    SELECT FORMAT (getdate(), 'dd-MM-yy') as 'Fecha de hoy'

    -- Ver la hora actual del sistema
    SELECT CONVERT ([time], SYSDATETIME()) AS 'Son las:'

    -- Crear tabla PruebaFecHora
    CREATE TABLE PruebaFecHora  
    (  
    MiFecha DATE, 
    MiFechayHora DATETIME,
    MiFecha24Horas DateTimeOffset(5),
    MiHora TIME
    );  

    --Insertar registros en tabla PruebaFecHora --
    INSERT INTO PruebaFecHora
    VALUES ('12/12/1999', '10/10/1998', '10/05/1975', '2:00'); 

    INSERT INTO PruebaFecHora
    VALUES ('12/12/1999', '07/30/1975', '10/12/10 10:30:20 am', '8:00'); 

    INSERT INTO PruebaFecHora
    VALUES ('12/12/1999', '10/17/1998', '2008/02/10 11:30:20 pm', '11:00'); 

    -- Ver registros ingresados --
    SELECT * FROM PruebaFecHora;

    -- Determinar formato de fecha día / mes / año --
    SET DATEFORMAT dmy;
    INSERT INTO PruebaFecHora
    VALUES ('20/12/1999', '15/05/1998', '13/02/10 11:30:20 pm', '2:00'); 

    -- Determinar formato de fecha mes / día / año --
    SET DATEFORMAT mdy;

    -- Visualizar el idioma de formato de fecha actual en el sistema --
    Select @@Language 'Formato de Fecha'

    -- Visualizar los formatos de fecha según el idioma --
    sp_helplanguage

/* Visualizando todos losregistros de todos los campos de una tabla */
SELECT * FROM Biblioteca.dbo.Libro;

/* Visualizando algunos registros de algunos campos de una tabla */
SELECT NomLib, EditLib, AutLib
FROM Libro

/* Visualizar los libros pertenecientes a la Edtorial Anaya */
SELECT NomLib, AutLib, EditLib
FROM dbo.Libro
WHERE EditLib = 'Anaya'

/* Visualizar los libros cuyas páginas sean menores e iguales que 200 */
SELECT NomLib, EditLib, NumPagLib
FROM Libro
WHERE NumPagLib <= 200

/* Visualizar los libros cuyos números de páginas estén entre 150 y 530 */
SELECT NomLib, EditLib, NumPagLib
FROM Libro
WHERE NumPagLib BETWEEN 150 and 530

/* Visualizar sólo los libros de las Editoriales Anaya y S.M */
SELECT NomLib, AutLib, EditLib
FROM Libro
WHERE EditLib IN('Anaya', 'S.M')

/* Visualizar los libros editados durante el primer semestre de cada año */
SELECT NomLib, AutLib, FecEdicLib
FROM Libro
WHERE MONTH(FecEdicLib) <= 6

/* Visualizar Los Libros cuyo primer nombre de autor sea Miguel */
SELECT NomLib, AutLib
FROM Libro
WHERE AutLib Like 'Miguel%'

-- Estableciendo la consulta para buscar autores que cualquiera de sus nombres sea Miguel --
SELECT NomLib, AutLib
FROM Libro
WHERE AutLib Like '%Miguel%'

/*-- Estableciendo la consulta para buscar libros cuyos nombres empiecen con a letra A, B, C, D y E */
SELECT NomLib, AutLib
FROM Libro
WHERE NomLib Like '[a-e]%';

/* Ordenar los Libros por orden alfabético ascendente a través del campo Género */
SELECT NomLib, EditLib, GenLib
FROM Libro
ORDER BY GenLib

/* Ordenar los libros por orden alfabético descendente a través del campo Editorial */
SELECT NomLib, EditLib, GenLib
FROM Libro
ORDER BY EditLib DESC

/* Visualizar los 4 primeros libros de la tabla Libros */
SELECT TOP(4)
NomLib, EditLib, GenLib
FROM Libro

/* Índices: Puedes ser agrupados y no agrupados, es decir CLUSTERED Y NON CLUSTERED */
-- Verificar la existencia de índices en una tabla --
sp_helpindex 'Libro'