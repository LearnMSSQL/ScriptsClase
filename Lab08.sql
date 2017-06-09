/* Los Joins */

-- Listado de Usuario con el código de libro que ha pedido prestado
SELECT 
    CONCAT(Usuario.NomUs, ' ', Usuario.ApeUs) AS 'Usuario', 
    Prestamo.CodLib AS 'Código de Libro'
FROM Usuario INNER JOIN Prestamo ON Prestamo.CodUs = Usuario.CodUs;

-- Listado con el número de préstamo y el nombre del libro respectivo
SELECT 
    Prestamo.NumPres AS 'Número de Préstamo',
    Libro.NomLib AS 'Libro'
FROM Prestamo INNER JOIN Libro ON Prestamo.CodLib = Libro.CodLib

-- Mostrar el número de préstamo, nombre y apellido del usuario y el nombre del libro que ha pedido prestado (INNER JOIN CON 3 TABLAS)
SELECT
    Prestamo.NumPres AS 'Código',
    CONCAT(Usuario.NomUs, ' ', Usuario.ApeUs) AS 'Usuario',
    Libro.NomLib AS Libro
FROM 
    Prestamo INNER JOIN Usuario ON Prestamo.CodUs = Usuario.CodUs 
    INNER JOIN Libro ON Prestamo.CodLib = Libro.CodLib;

-- Mostrar nombre y apellido de usuarios que han pedido el libro Don Quijote de la Mancha II
SELECT
    CONCAT(Usuario.NomUs, ' ', Usuario.ApeUs) AS 'Usuario',
    Libro.NomLib AS Libro
FROM 
    Prestamo INNER JOIN Usuario ON Prestamo.CodUs = Usuario.CodUs 
    INNER JOIN Libro ON Prestamo.CodLib = Libro.CodLib
WHERE Libro.NomLib = 'Don Quijote de la Mancha II'

-- Listado de usuarios que han pedido y que no han pedido libros
SELECT 
    CONCAT(Usuario.NomUs, ' ', Usuario.ApeUs) AS 'Usuario',
    Prestamo.NumPres AS CodPrest
FROM 
    Usuario LEFT OUTER JOIN Prestamo ON Usuario.CodUs = Prestamo.CodUs

-- Listado de usuarios que no han pedido libros
SELECT 
    CONCAT(Usuario.NomUs, ' ', Usuario.ApeUs) AS 'Usuario',
    Prestamo.NumPres AS CodPrest
FROM 
    Usuario LEFT JOIN Prestamo ON Usuario.CodUs = Prestamo.CodUs
WHERE Prestamo.CodUs is Null 

-- Listado de usuarios que no han sido prestados (UTILIZANDO UNA SUBCONSULTA)
SELECT * 
FROM Usuario
WHERE CodUs NOT IN(SELECT CodUs FROM Prestamo);

-- Insertar registro de prueba
INSERT INTO Libro
(CodLib, NomLib, EditLib, AutLib, GenLib, NumPagLib, FecEdicLib)
Values
('8', 'Manual del Programador', 'TIC', 'Orlando Prada', 'Tecnologia', '517', '05/OCTOBER/1979');


-- Listado de libros con respecto a la tabla prestamos, es decir el estado actual del inventario
SELECT
    Prestamo.CodLib AS Prestamo,
    Libro.NomLib AS Libro
FROM 
    Prestamo RIGHT JOIN Libro ON Prestamo.CodLib = Libro.CodLib;

-- Listado de libros que no han sido prestados (UTILIZANDO UNA SUBCONSULTA)
SELECT * 
FROM Libro
WHERE CodLib NOT IN(SELECT CodLib FROM Prestamo);


-- Listado de prestamos de libros incluyendo los usuarios que no han hecho prestamos y los libros no prestados
SELECT Prestamo.NumPres, Usuario.NomUs, Libro.NomLib
FROM Prestamo FULL OUTER JOIN Usuario ON Prestamo.CodUs = Usuario.CodUs 
FULL OUTER JOIN Libro ON Prestamo.CodLib = Libro.CodLib
