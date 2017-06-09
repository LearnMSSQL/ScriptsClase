/* Funciones estadísticas */

CREATE TABLE FunCalculo
(
	Producto varchar(60),
    Cantidad int,
    Precio decimal(6,2),
);

INSERT INTO FunCalculo
VALUES
('Refrigeradora', 3, 1550.80),
('Licuadora', 5, 550),
('Impresora', 3, 750.50),
('Televisor', 6, 1690.80),
('Monitor', 12, 9850),
('Tablet', 6, 390.80),
('SmartPhone', 3, 1590.80),
('Laptop', 4, 2490.30)

-- Obtener el número de registros de una tabla
SELECT COUNT(*) AS 'Total de Productos'
FROM FunCalculo;

-- Obtener el nombre y precio del producto más caro
SELECT  Max(Precio)
FROM FunCalculo

-- Obtener el nombre y precio del producto más caro
SELECT  MIN(Precio)
FROM FunCalculo

-- Obtener el precio promedio
SELECT AVG(Precio) 
FROM FunCalculo

-- Obtener el subtotal de cada uno de los productos
SELECT Producto, Precio, Cantidad, Cantidad * Precio AS Subtotal
FROM FunCalculo

-- Obtener el IGV de cada producto
SELECT Producto, Precio, Cantidad, Cantidad * Precio AS Subtotal, 
CAST(ROUND((Cantidad * Precio) * 0.18, 2) AS decimal(6,2)) AS IGV 
FROM FunCalculo

-- Obtener el total de cada producto
SELECT Producto, Precio, Cantidad, Cantidad * Precio AS Subtotal, 
CAST(ROUND((Cantidad * Precio) * 0.18, 2) AS decimal(6,2)) AS IGV,
CAST((Cantidad * Precio) + ((Cantidad * Precio) * 0.18) AS DECIMAL(6,2)) AS Total
FROM FunCalculo