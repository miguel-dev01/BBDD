/*9. (1 pt) Función: Crear una función que dado un código postal muestre la 
 * facturación total para ese código postal 
 * (se tiene como referencia el código postal del cliente)
*/

CREATE OR REPLACE FUNCTION f_cp (PARAM_CP VARCHAR2)
RETURN VARCHAR2 IS 
CP VARCHAR2(5);
BEGIN
	SELECT sum(f.IMPORTE) INTO CP
	FROM CLIENTE c INNER JOIN FACTURA f ON f.DNI = c.DNI
	WHERE c.COD_POSTAL = PARAM_CP;
	
	RETURN CP;
END f_cp;
-- Llamada para la funcion f_cp
SELECT COMERCIAL.F_CP(:PARAM_CP) FROM DUAL;

/*10. (1 pt) Trigger: Crear un trigger que al borrar un comercial, 
 * se borren automáticamente las visitas que ha realizado dicho comercial.*/
CREATE OR REPLACE TRIGGER t_borrar_comercial
AFTER DELETE ON COMERCIAL
FOR EACH ROW 
BEGIN 
	DELETE FROM VISITA WHERE DNI_COMERCIAL = :OLD.DNI;
END t_borrar_comercial;

