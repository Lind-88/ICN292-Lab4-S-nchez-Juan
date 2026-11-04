USE austral;

SELECT nombre, genero
FROM autores
WHERE pais <> 'Chile'
OR pais IS NULL
ORDER BY nombre ASC;

SELECT titulo, paginas
FROM libros
WHERE paginas BETWEEN 190 AND 220
ORDER BY paginas ASC;

SELECT
COUNT(*) AS total_libros,
SUM(ejemplares_vendidos) AS total_vendidos,
AVG(paginas) AS promedio_paginas,
MIN(anio) AS anio_mas_antiguo,
MAX(ejemplares_vendidos) AS mayor_venta
FROM libros;

SELECT DISTINCT genero
FROM autores
ORDER BY genero ASC;

SELECT
a.nombre,
COUNT(*) AS cantidad_libros
FROM autores a
INNER JOIN libros l
ON a.id_autor = l.id_autor
WHERE l.anio = 2024
GROUP BY a.id_autor, a.nombre
HAVING COUNT(*) > 1
ORDER BY a.nombre ASC;

SELECT titulo, ejemplares_vendidos
FROM libros
WHERE anio = 2024
AND ejemplares_vendidos > 2000
ORDER BY ejemplares_vendidos DESC
LIMIT 3;

INSERT INTO libros
(id_autor, id_coleccion, titulo, paginas,
 ejemplares_vendidos, anio)
VALUES
(3, NULL, 'Papel Mojado', 260, 50, 2024);

SELECT *
FROM libros
WHERE titulo = 'Papel Mojado';

DELETE FROM libros
WHERE id_libro = 13
AND titulo = 'Papel Mojado';

SELECT *
FROM libros
WHERE titulo = 'Papel Mojado';

SELECT *
FROM libros
WHERE id_libro = 1
AND titulo = 'Cielo de Enero';

UPDATE libros
SET ejemplares_vendidos = ejemplares_vendidos + 100
WHERE id_libro = 1
AND titulo = 'Cielo de Enero';

SELECT *
FROM libros
WHERE id_libro = 1
AND titulo = 'Cielo de Enero';

INSERT INTO colecciones (titulo, fecha_publicacion)
VALUES
('Colección Horizonte', '2024-03-15'),
('Colección Raíces', '2024-09-10');

UPDATE libros
SET id_coleccion = 1
WHERE id_libro IN (1, 2, 3, 4, 5, 6);

UPDATE libros
SET id_coleccion = 2
WHERE id_libro IN (7, 8, 9, 10, 11, 12);

SELECT
l.titulo AS libro,
c.titulo AS coleccion,
c.fecha_publicacion
FROM libros l
INNER JOIN colecciones c
ON l.id_coleccion = c.id_coleccion
ORDER BY l.titulo ASC;

INSERT INTO pagos (id_autor, fecha_pago, monto)
VALUES
(1, '2024-10-15', 150000.00),
(1, '2024-11-20', 85000.00),
(4, '2024-12-05', 120000.00);

SELECT
a.nombre AS autor,
p.fecha_pago,
p.monto
FROM pagos p
INNER JOIN autores a
ON p.id_autor = a.id_autor
ORDER BY p.fecha_pago ASC;

SELECT
a.nombre AS autor,
SUM(p.monto) AS total_pagado
FROM autores a
INNER JOIN pagos p
ON a.id_autor = p.id_autor
GROUP BY a.id_autor, a.nombre
ORDER BY a.nombre ASC;