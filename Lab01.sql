/*Hacer un listado de base de datos de una instancia del servidor SQl Server */
SELECT name, database_id, create_date
FROM sys.databases

/* Crear base de datos Biblioteca */
CREATE DATABASE Biblioteca  

/* Poner en uso la Base de Datos Biblioteca */
USE Biblioteca

/* Eliminar una base de datos */
DROP DATABASE Biblioteca

/* Hacer un listado de las tablas de una base de datos */
SELECT * from Information_Schema.Tables

/* Creando la tabla libros */
Create table Libros
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

/* Ver registros de tabla Libros */
SELECT * FROM Libros

/* Eliminar tabla Libros */
DROP TABLE Libros

/* Creando la tabla préstamos */
Create table Prestamos
(
	NumPres int not null,
    CodLib int not null,
    CodUs int not null,
    FecSalLib date not null,
    FecDevLib date not null,
    CONSTRAINT NumPres_PK Primary Key (NumPres)
)

/* Ver registros de tabla Prestamos */
SELECT * FROM Prestamos

/* Eliminar tabla Prestamos */
DROP TABLE Prestamos

/* Creando la tabla usuarios */
Create table Usuarios
(
	CodUs int not null,
    NomUs char(40) not null,
    ApeUs char(40) not null,
    DNIUs char(8) not null,
    DirUs char(50) not null,
    DistUs char(40) not null,
    Provincia char(40) not null,
    FeNac date not null,
    CONSTRAINT CodUs_PK Primary Key (CodUs)
)

/* Ver registros de tabla Usuarios */
SELECT * FROM Usuarios

/* Eliminar tabla Usuarios */
DROP TABLE Usuarios

/* Creando relaciones en la tabla detalle o tabla principal */
Alter table Prestamos
	Add CONSTRAINT CodLib FOREIGN KEY (CodLib) REFERENCES Libros (CodLib),
        CONSTRAINT CodUs FOREIGN KEY (CodUs) REFERENCES Usuarios (CodUs)

/* Eliminar relación entre tablas */
ALTER TABLE Prestamos   
    DROP CONSTRAINT CodLib,
         CONSTRAINT CodUs;

/* Hacer un listado de las tablas de una base de datos */
SELECT * from Information_Schema.Tables

/* Insertar registros en tabla Libros */
INSERT INTO Libros
(CodLib, NomLib, EditLib, AutLib, GenLib, NumPagLib, FecEdicLib)
Values
('1', 'Don Quijote de la Mancha I', 'Anaya', 'Miguel de Cervantes Saavedra', 'Caballeresco', '517', '05/OCTOBER/1979')

/* Agregar dos o más registros a la tabla Libros */
Insert into Libros
(CodLib, NomLib, EditLib, AutLib, GenLib, NumPagLib, FecEdicLib)
Values
('2', 'Don Quijote de la Mancha II', 'Anaya', 'Miguel de Cervantes Saavedra', 'Caballeresco', '517', '05/OCTOBER/1990'),
('3', 'Historia de Nueva Orleans', 'Alfaraguara', 'William Faulkner', 'Novela', '186', '10/APRIL/1985')

/* Agregar más registros a la tabla Libros */
Insert into Libros
(CodLib, NomLib, EditLib, AutLib, GenLib, NumPagLib, FecEdicLib)
Values
('4', 'El Principito', 'Andina', 'Antonie Saint', 'Aventura', '120', '09/APRIL/1996'),
('5', 'El Príncipe', 'S.M', 'Maquiavelo', 'Político', '210', '12/AUGUST/1995'),
('6', 'Diplomacia', 'S.M', 'Henry Kissinger', 'Político', '825', '10/JUNE/1975')

/* Insertar registros en la tabla Usuarios */
Insert into Usuarios
(CodUs, NomUs, ApeUs, DNIUs, DirUs, DistUs, Provincia, FeNac)
Values
('1', 'Inés', 'Posadas Gil','25786321', 'Av. Las Escaleritas 125', 'Nuevo Imperial', 'Cañete', '04/JULY/1971'),
('2', 'José', 'Sánchez Pons','40155263', 'Meza y López 51', 'Lunahuaná', 'Cañete', '06/SEPTEMBER/1966'),
('3', 'Miguel', 'Gómez Sáenz','15478952', 'Gran Vía 71', 'Imperial', 'Cañete','09/DECEMBER/1976'),
('4', 'Eva', 'Santana Páez','01563289', 'Pío Baroja 23', 'San Vicente', 'Cañete', '23/MAY/1980'),
('5', 'Yolanda', 'Betancor Díaz','45896325', 'El Cid 45', 'San Luis', 'Cañete','17/SEPTEMBER/1976')

Insert into Usuarios
(CodUs, NomUs, ApeUs, DNIUs, DirUs, DistUs, Provincia, FeNac)
Values
('6', 'Panchito', 'Guerra Cama','78945612', 'Av. Los Galácticos', 'Imperial', 'Cañete', '06/JUNE/1986')

/*Insertar registros a la tabla Préstamos*/
Insert into Prestamos
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

/* Exportar registros a un TXT */
-- bcp Biblioteca.dbo.Usuarios out c:\BCPDemo\tblUsuarios.txt -Usa -PJesusCanales79 -S 192.168.112.128 -c

/* Importar registros de un TXT a una tabla SQL */
-- bcp Biblioteca.dbo.Prestamos in c:\BCPDemo\Prestamos.txt -Usa -PJesusCanales79 -S 192.168.112.128 -c

/* Exportando datos de una consulta a un txt */
-- bcp "SELECT * FROM Biblioteca.dbo.Libros WHERE EditLib = 'Anaya'" queryout c:\BCPDemo\tblLibrosAnaya.txt -Usa -PJesusCanales79 -S 192.168.112.128 -c

/* Modificar los datos de un registro de la tabla usuarios */
UPDATE Usuarios
    SET NomUs = 'José Carlos'
    WHERE CodUs = 6

/* Agregar una columna a una tabla */
ALTER TABLE Libros
    ADD EditBook VARCHAR(60)

/* Eliminar una columna de una tabla */
ALTER TABLE Libros
   DROP COLUMN EditLib

/* Agregar datos de nueva columna a registros ya ingresados */
UPDATE Libros
    SET EditBook = 'Los Sanos'
    WHERE CodLib = 1

/* Eliminar un registro de la tabla libros */
DELETE FROM Libros
    WHERE CodLib = 1