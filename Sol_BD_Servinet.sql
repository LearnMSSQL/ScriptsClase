/* Crear base de datos */
CREATE DATABASE Servinet;
GO

/* Estableciendo uso de Base de Datos Servinet */
USE Servinet

/* Crear tabla Fabricantes */
CREATE TABLE Fabricante
(
    IdFabr INT IDENTITY (1,1) NOT NULL,
    NomFabr VARCHAR (40) NOT NULL
    CONSTRAINT IdFabr_PK PRIMARY KEY (IdFabr)
);
GO

/* Crear tabla Artículos */
CREATE TABLE Articulo
(
    IdArt INT IDENTITY (1,1) NOT NULL,
    NomArt VARCHAR (50) NOT NULL,
    PrecArt DECIMAL (5,2) NOT NULL,
    IdFabr INT NOT NULL
    CONSTRAINT IdArt_PK PRIMARY KEY (IdArt)
);
GO

/* Ingresar registros en la tabla Fabricante */
INSERT INTO  Fabricante
VALUES ('Kingston'), ('Adata'), ('Logitech'), ('Lexar'), ('Seagate');
GO

/* Ingresar registros en la tabla Artículos */
INSERT INTO Articulo
VALUES
('Teclado', 100, 3),
('Disco Duro 300 GB', 500, 5),
('Mouse', 80, 3),
('Memoria USB 2.0', 140, 4),
('Memoria RAM', 290, 1),
('Disco Duro extraible 250 GB', 650, 5),
('Memoria USB 3.0', 279, 1),
('DVD Rom', 450, 2),
('CD Rom', 200, 2),
('Tarjeta de red', 180, 3);
GO

/* Verificando los registros en la tabla Fabricante */
SELECT * FROM Fabricante;
GO

/* Verificando los registros en la tabla Artículo */
SELECT * FROM Articulo;
GO

/* Obtener los datos de los productos de la tienda */
SELECT *
FROM Articulo;
GO

/* Obtener los nombres de los productos de la tienda */
SELECT NomArt
FROM Articulo;
GO

/* Obtener los nombres y precios de los productos de la tienda */
SELECT NomArt, PrecArt
FROM Articulo;
GO

/* Obtener los nombres de los productos sin repeticiones */
SELECT * 
FROM Articulo;

/* Obtener los datos del artículo cuya clave del producto es 5 */
SELECT *
FROM Articulo
WHERE IdArt = 5;
GO

/* Obtener los datos del artículo cuyo nombre del producto es Teclado */
SELECT * 
FROM Articulo
WHERE NomArt = 'Teclado';
GO

/* Obtener los datos de la Memoria RAM y Memoria USB */
SELECT *
FROM Articulo
WHERE NomArt Like 'Memoria RAM%' AND NomArt Like 'Memoria USB%';
GO

/* Obtener los datos de los artículos que empiezan con la letra M */
SELECT *
FROM Articulo
WHERE NomArt Like 'M%';
GO

/* Obtener los datos de los productos cuyo precio que sea $100 */
SELECT *
FROM Articulo
WHERE PrecArt = 100;
GO

/* Obtener los datos de los productos cuyo precio sea mayor a $200 */
SELECT *
FROM Articulo
WHERE PrecArt > 200;
GO

/* Obtener los datos de los productos cuyo precio está entre $100 y $ 350 */
SELECT *
FROM Articulo
WHERE PrecArt BETWEEN 100 AND  350;
GO

/* Obtener el precio medio de todos los artículos */
SELECT AVG(PrecArt) AS 'Precio Medio'
FROM Articulo;
GO

/* Obtener el precio medio de todos los artículos cuyo código de fabricante sea el número 2 */
SELECT AVG(PrecArt) AS 'Precio Medio'
FROM Articulo
WHERE IdFabr = 2;
GO

/* Obtener el nombre y precio de los articulos ordenados por nombre */
SELECT NomArt, PrecArt
FROM Articulo
ORDER BY NomArt ASC;
GO

/* Obtener todos los datos de los productos ordenados descendentemente por precio */
SELECT * 
FROM Articulo
ORDER BY PrecArt DESC;
GO

/* Obtener el nombre y precio de los productos cuyo precio sea mayor a $ 250 y ordenarlos descendentemente por precio y luego ascendentemente por nombre */
SELECT NomArt, PrecArt
FROM Articulo
WHERE PrecArt > 250
ORDER BY NomArt ASC, PrecArt DESC;
GO

/* Obtener todos los datos de los productos por cada artículo y fabricante */
-- Aprovechamos el ejemplo para utilizar el Inner Join que es unión de tablas --
SELECT Articulo.NomArt, Articulo.PrecArt, Fabricante.NomFabr
FROM Articulo
INNER JOIN Fabricante ON Articulo.IdFabr = Fabricante.IdFabr;
GO

/* Obtener el nombre y precio de los articulos del fabricante Logitech y ordenarlos alfabeticamente por el nombre de producto */
-- En este ejemplo vemos INNER JOIN adicionando una condición
SELECT Articulo.NomArt, Articulo.PrecArt, Fabricante.NomFabr
FROM Articulo
INNER JOIN Fabricante ON Articulo.IdFabr = Fabricante.IdFabr
WHERE Fabricante.NomFabr = 'Logitech';
GO

/* Obtener el nombre, precio y nombre de fabricante de los productos de la marca Lexar o Kingston ordenados descendentemente por precio  */
SELECT Articulo.NomArt, Articulo.PrecArt, Fabricante.NomFabr
FROM Articulo
INNER JOIN Fabricante ON Articulo.IdArt = Fabricante.IdFabr
WHERE Fabricante.NomFabr = 'Lexar' OR Fabricante.NomFabr = 'Kingston'
ORDER BY Articulo.PrecArt DESC
GO
/* Ingresar el siguiente registro en la tabla Artículo: Identificador: 11, Nombre: Altavoces, Precio: $120 Fabricante: 2 */
-- Estamos asigando la primera  y última línea a fin de que se permita ingresar un registro propiamente con un determinado Id, ya que el campo Id es autonumérico --
SET IDENTITY_INSERT Articulo ON
INSERT INTO Articulo
(IdArt, NomArt, PrecArt, IdFabr)
VALUES (11, 'Altavoces', 120, 2);
SET IDENTITY_INSERT Articulo OFF

/* Borrar el artículo cuyo código es el 6 */
DELETE FROM Articulo
WHERE IdArt = 6;
GO

/* Aplicar descuento de $ 10 a todos los artículos cuyo precio sea mayor e igual a $ 300 */
SELECT NomArt, PrecArt, PrecArt - 10 As Descuento
FROM Articulo
WHERE PrecArt >= 300