/*3 (0,5) Hallar el máximo nº de unidades vendidas en una venta (albaran) de cada
articulo pero solo de aquellos artículos cuyo máximo en una venta sea de 10 o
mas unidades. Incluye en la salida el cod_art y dicho máximo de unidades vendidas*/

SELECT ar.COD_ART, max(al.CANTIDAD)
FROM ALBARAN al INNER JOIN ARTICULO ar ON ar.COD_ART = al.COD_ART
GROUP BY ar.COD_ART
HAVING max(al.CANTIDAD) >= 10;

/*4 (0,5) Hallar el valor de la facturación total en cada distrito (codigo_postal de
cliente). Incluye en la salida el código postal y la facturación total para ese distrito
pero solo teniendo en cuenta las facturas del año 2014 y 2015.*/

SELECT c.COD_POSTAL, sum(f.IMPORTE) AS f_total
FROM FACTURA f INNER JOIN CLIENTE c ON c.DNI = f.DNI 
WHERE EXTRACT(YEAR FROM f.FECHA_FAC) = '2014' OR EXTRACT(YEAR FROM f.FECHA_FAC) = '2015'
GROUP BY c.COD_POSTAL;

/*5 (1) Hallar el cod_art y el precio de aquellos articulos que se correspondan con
los dos menores precios de articulo (no utilizar limit).*/
-- Consulta TOP-N
SELECT ar.COD_ART, ar.PRECIO 
FROM ARTICULO ar
WHERE (SELECT COUNT(DISTINCT ar2.PRECIO) FROM ARTICULO ar2
		WHERE ar2.PRECIO < ar.PRECIO) < 2;

/*6. (1,5 pt) Hallar si existe algún artículo (y si existe, indicar su código y descripción)
que se haya vendido a todos los clientes de los distritos '30008' y '30009'.*/
-- Consulta para MySQL, no para Oracle.
select ar.cod_art, ar.descripcion
from articulo ar inner join albaran al on al.cod_art = ar.cod_art 
inner join factura f on f.cod_fac = al.cod_fact 
inner join cliente c on c.dni = f.dni_cliente 
group by ar.cod_art, ar.descripcion
having count(c.dni) = (select count(distinct dni) from cliente where cod_postal = '30008' or cod_postal = '30009'); 

/*7. (1,5 pt) Vistas: Crear una vista llamada v_cli_fact que muestre el dni, nombre y apellidos de los clientes,
así como el importe total de todas las facturas con un descuento del 20% de las facturas de 2013*. 
Indica adicionalmente como harías para asignarle permisos de select a 
dicha vista al usuario usuario1 que se pueda conectar desde cualquier IP*/
CREATE VIEW v_cli_fact AS 
	SELECT c.DNI, c.NOMBRE, c.APELLIDOS, sum(f.IMPORTE-f.IMPORTE*20/100) AS importe_descuento
	FROM CLIENTE c INNER JOIN FACTURA f ON f.DNI = c.DNI 
	WHERE EXTRACT(YEAR FROM f.FECHA_FAC) = '2013'
	GROUP BY c.DNI, c.NOMBRE, c.APELLIDOS;

/*Permisos a continuacion: */
-- Permisos de visto al usuario
GRANT SELECT ON v_cli_fact TO usuario1;
-- Y que se pueda conectar desde cualquier IP
GRANT ALL PRIVILEGES ON *.* TO 'usuario1'@'%' IDENTIFIED BY 'password';

/*8. (1 pt) Vistas: Crear una vista llamada v_distrito_fact que muestre el código postal junto con la
facturación total asociada a los clientes de ese distrito pero solo se aquellos distritos que
superen una facturación de 5000 euros*
Indica adicionalmente como harías para quitarle los permisos de select a dicha 
vista al usuario usuario2 que se pueda conectar solo desde localhost*/
CREATE VIEW v_distrito_fact AS
	SELECT c.COD_POSTAL, sum(f.IMPORTE)
	FROM CLIENTE c INNER JOIN FACTURA f ON f.DNI = c.DNI
	GROUP BY c.COD_POSTAL
	HAVING sum(f.IMPORTE) > 5000;

-- Permiso para la vista
REVOKE SELECT ON v_distrito_fact TO usuario2;

-- Permisos para el usuario2
GRANT ALL PRIVILEGES ON *.* TO 'usuario2'@'localhost' IDENTIFIED BY 'password';
