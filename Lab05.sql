/* Funciones de SQL Server */

/* Funciones de Fecha */

-- Visualizar la fecha y hora del sistema
SELECT GETDATE() AS Fecha

-- Extraer el año de la fecha del sistema
SELECT DATENAME(YEAR, GETDATE()) AS 'Año Actual'

-- Extraer el año de la fecha del sistema
SELECT DATENAME(MONTH, GETDATE()) AS 'Mes Actual'

-- Extraer día actual de la fecha del sistema
SELECT DATENAME(DAY, GETDATE()) AS 'Día Actual'

-- Extraer la hora actual del sistema
SELECT DATENAME(HOUR, GETDATE()) AS 'Hora del sistema'

-- Extraer la hora actual del sistema
SELECT DATENAME(MINUTE, GETDATE()) 'Minuto del sistema'

-- Mostrar la hora y minuto del sistema
SELECT DATENAME(HOUR, GETDATE()) + ':' + IIF(LEN(DATENAME(MINUTE, GETDATE()))=1, '0'+ DATENAME(MINUTE, GETDATE()), DATENAME(MINUTE, GETDATE())) AS 'Hora y Minuto del sistema' 

-- Devuelve el nombre de día de la semana actual
SELECT DATENAME(WEEKDAY, GETDATE()) AS 'Nombre de día Actual'

-- Devuelve el número de semanas transcurridas a la actualidad
SELECT DATENAME(WEEK, GETDATE()) AS 'Semanas transcurridas'

-- Mostrar el número de días transcurridos en el presente año
SELECT DATENAME(DAYOFYEAR, GETDATE()) AS 'Días transcurridos'

-- FunCalculo edades
SELECT DATEDIFF(YEAR, '07/11/1979', GETDATE()) AS 'Tu edad es:'

-- Obtener el número de días por los que ha sido prestado un libro
SELECT DATEDIFF(DAY, '06/01/2017', GETDATE()) AS 'Días que lleva prestado el libro:'

-- Mensaje de alerta para devolución del libro prestado
SELECT DATEDIFF(DAY, '06/02/2017', GETDATE()) AS 'Días que lleva prestado el libro:',
    CASE DATEDIFF(DAY, '06/02/2017', GETDATE())
        WHEN 1 THEN 'Te quedan 2 días para devolver el libro'
        WHEN 2 THEN 'Mañana debes devolver el libro'
        WHEN 3 THEN 'Hoy debes devolver el libro'
    ELSE 'Tienes que pagar S/. 10 por cada día de retraso de devolución del libro'
    END AS 'Mensaje de alerta'
