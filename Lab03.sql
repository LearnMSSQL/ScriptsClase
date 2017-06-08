
/* Eliminando versión anterior de base de datos Biblioetca */
DROP DATABASE Biblioteca

/* Crear base de datos Biblioteca */
CREATE DATABASE Biblioteca  

/* Poner en uso la Base de Datos Biblioteca */
USE Biblioteca

/* Hacer un listado de las tablas de una base de datos */
SELECT * from Information_Schema.Tables

DROP TABLE Prestamo, Libro, Usuario


/* Creando la tabla libros */
Create table Libro
(
	CodLib int not null,
    NomLib varchar(60) not null,
    EditLib varchar(35) not null,
    AutLib varchar(35) not null,
    GenLib varchar(35) not null,
    NumPagLib int not null,
    FecEdicLib date not null,
    CONSTRAINT CodLib_PK Primary key (CodLib)
)

/* Creando la tabla préstamos */
Create table Prestamo
(
	NumPres int not null,
    CodLib int not null,
    CodUs int not null,
    FecSalLib date not null,
    FecDevLib date not null,
    CONSTRAINT NumPres_PK Primary Key (NumPres)
)

/* Creando la tabla usuarios */
Create table Usuario
(
	CodUs int not null,
    NomUs varchar(40) not null,
    ApeUs varchar(40) not null,
    DNIUs varchar(8) not null,
    DirUs varchar(50) not null,
    DistUs varchar(40) not null,
    Provincia varchar(40) not null,
    FeNac date not null,
    CONSTRAINT CodUs_PK Primary Key (CodUs)
)

/* Agregando campos con datos de contacto */
ALTER TABLE Usuario
    ADD 
        CelUs VARCHAR(9) null,
        TelefUs VARCHAR(7) null,
        Email VARCHAR(20) null 

ALTER TABLE Usuario
    DROP COLUMN CelUs

/* Creando relaciones en la tabla detalle o tabla principal */
Alter table Prestamo
	Add CONSTRAINT CodLib FOREIGN KEY (CodLib) REFERENCES Libro (CodLib)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

/* Creando relaciones en la tabla detalle o tabla principal */
Alter table Prestamo
	Add CONSTRAINT CodUs FOREIGN KEY (CodUs) REFERENCES Usuario (CodUs)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION

/* Eliminar relación entre tablas */
ALTER TABLE Prestamo   
    DROP CONSTRAINT CodLib,
         CONSTRAINT CodUs;

/* Insertar registros en tabla Libros */
INSERT INTO Libro
(CodLib, NomLib, EditLib, AutLib, GenLib, NumPagLib, FecEdicLib)
Values
('1', 'Don Quijote de la Mancha I', 'Anaya', 'Miguel de Cervantes Saavedra', 'Caballeresco', '517', '05/OCTOBER/1979'),
('2', 'Don Quijote de la Mancha II', 'Anaya', 'Miguel de Cervantes Saavedra', 'Caballeresco', '517', '05/OCTOBER/1990'),
('3', 'Historia de Nueva Orleans', 'Alfaraguara', 'William Faulkner', 'Novela', '186', '10/APRIL/1985'),
('4', 'El Principito', 'Andina', 'Antonie Saint', 'Aventura', '120', '09/APRIL/1996'),
('5', 'El Príncipe', 'S.M', 'Maquiavelo', 'Político', '210', '12/AUGUST/1995'),
('6', 'Diplomacia', 'S.M', 'Henry Kissinger', 'Político', '825', '10/JUNE/1975')

/* Insertar registros en la tabla Usuarios */
Insert into Usuario
(CodUs, NomUs, ApeUs, DNIUs, DirUs, DistUs, Provincia, FeNac)
Values
('1', 'Inés', 'Posadas Gil','25786321', 'Av. Las Escaleritas 125', 'Nuevo Imperial', 'Cañete', '04/JULY/1971'),
('2', 'José', 'Sánchez Pons','40155263', 'Meza y López 51', 'Lunahuaná', 'Cañete', '06/SEPTEMBER/1966'),
('3', 'Miguel', 'Gómez Sáenz','15478952', 'Gran Vía 71', 'Imperial', 'Cañete','09/DECEMBER/1976'),
('4', 'Eva', 'Santana Páez','01563289', 'Pío Baroja 23', 'San Vicente', 'Cañete', '23/MAY/1980'),
('5', 'Yolanda', 'Betancor Díaz','45896325', 'El Cid 45', 'San Luis', 'Cañete','17/SEPTEMBER/1976'),
('6', 'Panchito', 'Guerra Cama','78945612', 'Av. Los Galácticos', 'Imperial', 'Cañete', '06/JUNE/1986')

/* Insertar registros en los campos de contacto agregados en la tabla Usuario */
UPDATE Usuario
    SET TelefUs = '5815589'
    WHERE DistUs = 'San Vicente'

UPDATE Usuario
    SET TelefUs = '2849678'
    WHERE DistUs = 'Imperial' OR DistUs ='Lunahuaná'

UPDATE Usuario
    SET CelUS = '995847125'
    WHERE DistUs = 'Nuevo Imperial'

UPDATE Usuario
    SET CelUS = '999847166'
    WHERE DistUs = 'San Luis'

UPDATE Usuario
    SET CelUs = '984526987'
    WHERE DistUs = 'San Vicente'

UPDATE Usuario
    SET CelUs = '99875421'
    WHERE DistUs = 'Lunahuaná' 

/*Insertar registros a la tabla Préstamos*/
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
('8', '1', '1', '01/DECEMBER/1999', '04/DECEMBER/1999')

SELECT * FROM Usuario;
SELECT * FROM Libro;
SELECT * FROM Prestamo

-- Índices:
-- Puedes ser agrupados y no agrupados, es decir CLUSTERED Y NON CLUSTERED.

-- Verificar la existencia de índices en una tabla con PK --
SELECT * FROM Libro;
EXECUTE sp_helpindex 'Libro'

-- Verificar la existencia de índices en una tabla sin PK --
        
    -- Crear tabla PruebaDeIndice --
    CREATE TABLE PruebaDeIndice  
    (DecimalColumn decimal(5,2), NumericColumn numeric(10,5));

    -- Agregando registros para demo --
    INSERT INTO PruebaDeIndice
    VALUES
    (80, 123), (10, 145), (785, 124);

    -- Verificando registros --
    SELECT *FROM PruebaDeIndice

    -- Verificando estructura de tabla --
    SELECT  COLUMN_NAME, DATA_TYPE, varcharACTER_MAXIMUM_LENGTH
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME='PruebaDeIndice'

    -- Creando índice clustered --
    CREATE CLUSTERED INDEX IDX_DecimalColum
    ON PruebaDeIndice (DecimalColumn)
    
    -- Ingresando registros diversos para hacer pruebas de índice --
    INSERT INTO PruebaDeIndice
    VALUES
    (10, 123), (50, 145), (25, 124);

    -- Verificando indexamiento de registros --
    SELECT *FROM PruebaDeIndice

    -- Verificando si tiene índices --
    EXECUTE sp_helpindex 'PruebaDeIndice'

-- Las tablas creadas con PK crean automáticamente índices clustered o agrupados
-- Una tabla solo puede tener un índice clustered

    -- Creando índice nonclustered en tabla Usuario --
    CREATE NONCLUSTERED INDEX IDX_USApe
    ON Usuario (ApeUs)

    -- Verificando indexamiento en tabla Usuario, recordar que los índices son efectivos en tablas con gran cantidad de registro --
    SELECT ApeUS, NomUs FROM Usuario

    SELECT * FROM Libro;
    EXECUTE sp_helpindex 'Libro'

    -- Crear un índice NONCLUSTERED
    CREATE NONCLUSTERED INDEX IDX_Editorial
    ON Libro (GenLib)

    -- Probando el índice clustered --
    SELECT * FROM LIBRO

    -- Probando el índice nonclustered --
    SELECT AutLib, GenLib, EditLib
    FROM Libro

    -- Eliminar índice PK, esto no es posible por que infringe a la integridad referencial --
    DROP INDEX CodLib_PK
    ON Libro;

    -- Eliminar índice NonClustered --
    DROP INDEX IDX_Editorial
    ON Libro;

/* Trabajando con Vistas: Las Vistas es la creación de una tabla virtual */
-- Se utiliza para mostrar información personalizada a los usuarios
-- Es una forma de seguridad, ya que de esta forma no permitimos el acceso directo a la tabla base

-- Crear una vista --
CREATE VIEW VIEW_Libros 
    AS
    SELECT NomLib, AutLib, FecEdicLib
    FROM Libro;
GO

-- Visualizando la vista creada --
SELECT * FROM VIEW_Libros

-- Modificar la estrucutra de la vista creada --
ALTER VIEW VIEW_Libros
AS SELECT NomLib, AutLib
FROM Libro;

-- Visualizando la vista con los cambios efectuados --
SELECT * FROM VIEW_Libros

-- Visualizar estructura de la vista creada, es riesgoso --
sp_helptext VIEW_Libros

-- Hacer un listado de las tablas y vistas de una base de datos --
SELECT * from Information_Schema.Tables
ORDER BY TABLE_TYPE

-- Eliminar vista
DROP VIEW VIEW_Libros

/* Store Procedure: se utilizan para hacer consultas, insertar datos, eliminar, hacer cálculos, entre otros */

/* Crear un Store Procedure */
CREATE PROCEDURE SP_Demo
As
Print 'Hola Mundo'

-- Ejecutar Store Procedure --
EXECUTE SP_Demo

/* Crear SP de consulta a una tabla */
CREATE PROCEDURE SP_EditAnaya
AS
SELECT * FROM Libro
WHERE EditLib = 'Anaya'

-- Ejecutar SP EditAnaya
EXECUTE SP_EditAnaya

/* Crear SP para disminuir número de páginas de los libros */
CREATE PROCEDURE SP_Subt_PagLib
@CodLib as INT,
@CantSubt as INT
AS
UPDATE Libro SET
NumPagLib = NumPagLib - @CantSubt
WHERE CodLib = @CodLib

-- Probando SP Quitar páginas a los libros --
EXEC SP_Subt_PagLib 1, 100;
SELECT * FROM Libro

/* Crear SP para aumentar número de páginas a los libros */
CREATE PROCEDURE SP_AddPagLib
@CodLib as INT,
@CantAdd as INT
AS
UPDATE Libro SET
NumPagLib = NumPagLib + @CantAdd
WHERE CodLib = @CodLib

-- Probando SP aumentar páginas a los libros --
EXEC SP_AddPagLib 1, 50;
SELECT * FROM Libro

/* Crear SP para agregar un registro a la tabla Usuario */
CREATE PROCEDURE SP_AddUsuario
@CodigoUsuario int,
@NombreUsuario varchar(40),
@ApellidoUsuario varchar(40),
@DNIUsuario varchar(8),
@DireccionUsuario varchar(50),
@DistritoUsuario varchar(40),
@ProvinciaUsuario varchar(40),
@FechaNacimientoUsuario date
AS
INSERT INTO Usuario
(CodUs, NomUs, ApeUs, DNIUs, DirUs, DistUs, Provincia, FeNac)
VALUES
(@CodigoUsuario, @NombreUsuario, @ApellidoUsuario,@DNIUsuario, @DireccionUsuario, @DistritoUsuario, @ProvinciaUsuario, @FechaNacimientoUsuario)

-- Ingresado nuevo usuario con SP_AddUsuario
EXECUTE AddUsuario 9,'Rocio','Miranda Figueroa','78451236','Av. Las Gardenias 758','San Luis','Cañete','01/JULY/1975'

-- Verificando ingreso de nuevo registro --
SELECT * FROM Usuario

/* Crear SP para eliminar un registro a la tabla Usuario a través del código */
CREATE PROCEDURE SP_DeleteUsuario
@CodigoUsuario int
AS
DELETE FROM Usuario
WHERE CodUs = @CodigoUsuario;

-- Ingresado nuevo usuario con SP_AddUsuario
EXECUTE SP_DeleteUsuario 2;

-- Verificando ingreso de nuevo registro --
SELECT * FROM Usuario

/* Crear SP para editar el registro de un usuario, por ejemplo el distrito de procedencia */ 
CREATE PROCEDURE SP_UpdateUsuario
@CodigoUsuario int,
@ApellidoUsuario varchar(40)
AS
UPDATE Usuario
    SET ApeUs = @ApellidoUsuario
    WHERE CodUs = @CodigoUsuario

-- Cambiar el apellido del registro 3 de Gómez Sáenz por Gómez Porres
EXECUTE SP_UpdateUsuario 3, 'Gómez Porres'

-- Verificando el cambio de apellido en el registro --
SELECT * FROM Usuario

/* Crear SP para buscar los usuarios de acuerdo al distro de procedencia */
CREATE PROCEDURE SP_FindUsuario
@DistritoUsuario varchar(40)
AS
SELECT *
FROM Usuario
WHERE DistUs = @DistritoUsuario

-- Buscar usuarios del distrito de Imperial --
EXECUTE SP_FindUsuario 'Imperial'

/* Eliminar un SP */
DROP PROCEDURE AddUsuario

-- Ver SPs de la Base de Datos --
SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE ROUTINE_TYPE = 'PROCEDURE'
   ORDER BY ROUTINE_NAME 

/* Ver registros de la tabla Usuario */
SELECT * FROM Usuario

----------------------------------------------------

/* Consultas */

-- Ver listado de DNI, Apellidos y Nombres: ejem: Posada Gil, Inés de los usuarios
SELECT DNIUs, ApeUS + ', ' + NomUs AS 'Apellidos y Nombres'
FROM Usuario

-- Ver listado de Usuarios bajo el siguiente formato: 1: Inés Posadas Gil
SELECT CAST(CodUs AS varchar(2)) + ': ' + NomUs + ApeUS AS CustomerCompany
FROM Usuario;

-- Ver listado de Usuario con su fecha de cumpleaños en formato dd/mm/yy
SELECT ApeUS + ', ' + NomUS AS Usuarios,
	   CONVERT(nvarchar(10), FeNac, 101) AS 'Fecha Nacimiento'
FROM Usuario;

-- Listado de Usuarios con su primer número de contacto
SELECT NomUs + ' ' + ApeUs AS Usuario, Coalesce(TelefUS, CelUs)
AS Usuario
FROM Usuario;

-- Listado de 2 registros a partir del número 3 de la tabla usuarios ordenados ascendentemente por el nombre
SELECT NomUs, ApeUs
FROM Usuario
ORDER BY NomUs Asc
OFFSET 3 ROWS Fetch NEXT 2 rows ONLY;

-- Listado de usuarios de los distritos Imperial o San Vicente
SELECT NomUs, ApeUs, DistUs
FROM Usuario
WHERE DistUs IN('Imperial', 'San Vicente')

-- Listado de Nombres, Apellidos y Distrito de Usuarios, cuyo nombre de Distrito inicia con San
SELECT NomUs, ApeUs, DistUs 
FROM Usuario
WHERE DistUs Like 'San%'

-- Listado de Nombre, DNI y Distrito, teniendo en cuenta que el primer número de DNI debe estar entre 2 a 4
SELECT NomUs, DniUs, DistUs 
FROM Usuario
WHERE DNIUs Like '[2-4]%';

-- Listado de Nombre, Distrito, excepto distritos cuyo nombre empiece con la letra S
SELECT * 
FROM Usuario
WHERE DistUs like '[^S]%'

-- Listado de Nombre y Apellido adicionalmente una columna verificando si tiene o no teléfono con el texto SI TIENE TELEFONO o NO TIENE TELEFONO
SELECT NomUs, ApeUs,
  CASE
    WHEN TelefUs IS Null then 'No tiene teléfono'
    ELSE 'Si tiene teléfono'
  END AS 'Estado de Teléfono'
FROM Usuario;


-- Ver el listado de distritos (sin repetirse) de donde proceden los usuarios de la biblioteca
SELECT Distinct DistUs
FROM Usuario;

-- Ver el listado del 10% de los usuarios 
SELECT Top (10) NomUs
FROM Usuario

-- Ver el listado de usuarios ordenados en forma descendente por el código
SELECT CodUs, NomUS, ApeUs
FROM Usuario
ORDER BY CodUs DESC

-- 
SELECT NomUs, ApeUs
FROM Usuario
ORDER BY CodUs
OFFSET 10 ROWS Fetch NEXT 5 rows ONLY;