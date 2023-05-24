/**
 * Trigger que al modificar el precio en un articulo, se calcule ese precio junto con los
 * demas articulos que hay en la tabla albaran. Cuando tengamos ese calculo, se actualizara
 * el campor IMPORTE de la tabla factura.
 * 
 * Inciso: no tiene mucha logica este trigger si el importe de la factura ya se ha pagado,
 * pero ha servido para poner en practica lo aprendido sobre triggers, asi como consultas SQL y cursores.
 */

CREATE OR REPLACE TRIGGER t_cambio_factura
AFTER UPDATE ON ARTICULO
-- FOR EACH ROW
BEGIN 
		DECLARE 
			CURSOR c_fact IS
				-- Recorremos los distintos cod_fact que hay
				SELECT DISTINCT COD_FACT FROM FACTURA;
			-- Declaramos las variables
			v_fac ALBARAN.COD_FACT%TYPE;
			v_result FACTURA.IMPORTE%TYPE;
		BEGIN 
			OPEN c_fact;
			LOOP	
				FETCH c_fact INTO v_fac;
				EXIT WHEN c_fact%NOTFOUND;
			
				-- Se calcula el resultado de precioxcantidad de los productos y se suma el total
				-- Y se guarda en la variable v_result
				SELECT sum(ar.PRECIO * al.CANTIDAD) INTO v_result
				FROM ALBARAN al INNER JOIN ARTICULO ar ON ar.COD_ART = al.COD_ART
				WHERE al.COD_FACT = v_fac;
				
				-- Se guarda el dato en la tabla factura donde el codigo de factura sea igual 
				-- a la factura que se guarda en la variable v_fac, y que viene desde el cursor
				UPDATE FACTURA SET IMPORTE = v_result WHERE COD_FACT = v_fac;
				
			END LOOP;
			CLOSE c_fact;
		END;

END t_cambio_factura;
	
