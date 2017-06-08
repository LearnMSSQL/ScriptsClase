/* Funciones de Texto */

-- Extraer AZURE de la siguiente cadena de texto
SELECT SUBSTRING('Microsoft Azure', 1, 5) As 'Extraer cadena de texto';

-- Inserta la palabra Azure por SQL Server
SELECT STUFF('Microsoft Azure', 9, 11,' SQL Server')

-- Extraer caracteres de lado derecho de una cadena de texto
SELECT RIGHT('Microsoft Azure', 5) AS 'Extraer de la derecha';

-- Extraer caracteres de lado izquierdo de una cadena de texto
SELECT LEFT('Microsoft Azure', 9) AS 'Extraer de la izquierda';

-- Obtener el número de caracteres de una cadena de texto
SELECT LEN('Microsoft') AS 'Total de caracteres'

-- En a siguiente cadena de texto quitar los espacios en blanco del lado derecho
SELECT RTRIM('   hoy es el  mañana de las personas  a    l  ') AS CadenaTexto

-- En a siguiente cadena de texto quitar los espacios en blanco del lado izquierdo
SELECT LTRIM('   hoy es el  mañana de las personas  a    l  ') AS CadenaTexto

-- Quitar los espacios en blanco de ambos lados del texto
SELECT RTRIM(Ltrim('   hoy es el  mañana de las personas  a    l           ')) 
AS CadenaTexto

-- Convertir a mayúsculas una cadena de texto
SELECT UPPER('mensaje de prueba de texto') AS Mayúsculas

-- Convertir a minúsculas una cadena de texto
SELECT LOWER('MENSAJE DE PRUEBA DE TEXTO') AS Minúsculas

-- Unir dos o más cadenas de texto
SELECT CONCAT('Alberto', ' ', 'Pérez', ' ', 'Cueva') AS Concatenar

-- Aplicar formato de moneda soles
SELECT FORMAT(1254.10, 'D', 'es-PE') AS 'Monedas en soles'

-- Aplicar formato de moneda dólares
SELECT FORMAT(1254.10, 'C', 'en-US') AS 'Monedas en dólares'

-- Establecer un prefijo para un campo código
DECLARE @Item INT
SET @Item = 20
SELECT CONCAT('VG', LEFT('0000', 4 - LEN(@Item)), @Item) AS Código

-- Aplicando el prefijo de código a la tabla Usuario
SELECT 
    CONCAT('VG', LEFT('0000', 4 - LEN(Usuario.CodUs)), Usuario.CodUs) AS Codigo, 
    Usuario.NomUs
FROM Usuario

-- Mostrar nombre, apellido y edad de los usuarios
SELECT 
    NomUs As Nombre, 
    ApeUs AS Apellidos, 
    DATEDIFF(YEAR, FeNac, GETDATE()) AS Edad
FROM Usuario

-- Mostrar nombre, apellido, edad y establecer un estado Socio Premium si es mayor de 50 años
SELECT 
    NomUs As Nombre, 
    ApeUs AS Apellidos, 
    DATEDIFF(YEAR, FeNac, GETDATE()) AS Edad, 
    IIF(DATEDIFF(YEAR, FeNac, GETDATE())>50,'Socio Premium','Socio Standar') AS Condición
FROM Usuario;