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

-- Listado de usuarios de todos los distritos excepto de Imperial, mostrar Apellidos y Distrito
SELECT ApeUs, DistUs 
FROM Usuario
WHERE DistUs <> 'Imperial'

-- Listado de Nombres, Apellidos y Distrito de Usuarios, cuyo nombre de Distrito inicia con San
SELECT NomUs, ApeUs, DistUs 
FROM Usuario
WHERE DistUs Like 'San%'

-- Listado de Nombre, DNI y Distrito, teniendo en cuenta que el primer número de DNI debe estar entre 2 a 4
SELECT NomUs, DniUs, DistUs 
FROM Usuario
WHERE DNIUs Like '[2-4]%';

-- Listado de libros cuyo nombre inicia con las letras: a, b, c o d. Mostrar nombre y Editorial
SELECT NomLib, EditLib
FROM Libro
WHERE NomLib Like '[a-d]%'

-- Listado de libros cuyo nombre inicia con las letras: e o h. Mostrar nombre y Editorial
SELECT NomLib, EditLib
FROM Libro
WHERE NomLib Like '[E,H]%'

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

-- Ver listado con nombre del libro, número de páginas y una columna donde muestre el mensaje Libro grande si este tiene más de 250 páginas y libro pequeño si tiene menos de 250 páginas
SELECT NomLib, NumPagLib, 
    CASE
        WHEN NumPagLib < 250 THEN 'Libro pequeño'
        ELSE 'Libro grande'
    END As 'Tamaño de Libro'
FROM Libro;

-- Ver listado con nombre de libro, editorial y una columna puntuacíon con el mensaje: si es Editorial Anaya (***), Alfaguara (****) y Andina (**), lo demás (*)
SELECT NomLib, EditLib,
    CASE 
        WHEN EditLib = 'Alfaraguara' THEN '****'
        WHEN EditLib = 'Anaya' THEN '***'
        WHEN EditLib = 'Andina' THEN '**'
        Else '*'
    END AS Puntuación
FROM Libro

-- Otra forma de hacer lo mismo es escribir el código de la siguiente forma, ahora ordenando de forma descendente la columna puntuación
SELECT NomLib, EditLib,
    CASE EditLib
        WHEN 'Alfaraguara' THEN '****'
        WHEN 'Anaya' THEN '***'
        WHEN 'Andina' THEN '**'
        Else '*'
    END AS Puntuación
FROM Libro
ORDER BY Puntuación DESC

-- Ver el listado de distritos (sin repetirse) de donde proceden los usuarios de la biblioteca
SELECT Distinct DistUs
FROM Usuario;

-- Ver el listado del 10% de los usuarios 
SELECT Top (10) NomUs
FROM Usuario

-- Ver el 3% del listado de usuarios, especificando en una columna Nombre y Apellidos y en otra du DNI
SELECT TOP (50) PERCENT
    NomUs + ' ' + ApeUs AS Usuario, DNIUs 
FROM Usuario
ORDER BY DistUs DESC;

-- Ver el listado de usuarios ordenados en forma descendente por el código
SELECT CodUs, NomUS, ApeUs
FROM Usuario
ORDER BY CodUs DESC