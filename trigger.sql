/*1. Crear un trigger que actualice el stock al INSERTAR un albaran*/
CREATE OR REPLACE TRIGGER t_insertar_albaran_stock
AFTER INSERT ON ALBARAN 
FOR EACH ROW
BEGIN 
	UPDATE ARTICULO SET STOCK = STOCK - :NEW.CANTIDAD
	WHERE :OLD.COD_ART = COD_ART;
END;

/*2. Crear un trigger que actualice el stock al BORRAR un albaranes*/
CREATE OR REPLACE TRIGGER t_borrar_albaran_stock
AFTER DELETE ON ALBARAN
FOR EACH ROW
BEGIN
	UPDATE ARTICULO SET STOCK = STOCK + :OLD.CANTIDAD
	WHERE :OLD.COD_ART = COD_ART;
END;

/*3. Crear un trigger que actualice el stock al MODIFICAR un albaran*/
CREATE OR REPLACE TRIGGER t_modificar_albaran_stock
AFTER UPDATE ON ALBARAN
FOR EACH ROW
BEGIN
	IF :NEW.CANTIDAD > :OLD.CANTIDAD THEN 
		-- Significa que el stock bajara
		UPDATE ARTICULO SET STOCK = STOCK - (:NEW.CANTIDAD - :OLD.CANTIDAD)
		WHERE :OLD.COD_ART = COD_ART;
	ELSIF :OLD.CANTIDAD > :NEW.CANTIDAD THEN
		-- Signfica que el stock subira
		UPDATE ARTICULO SET STOCK = STOCK + (:OLD.CANTIDAD - :NEW.CANTIDAD)
		WHERE :OLD.COD_ART = COD_ART;
	END IF;
	
END;

/*4. Crear un único trigger que trate los tres casos anteriores*/
CREATE OR REPLACE TRIGGER t_tres_IDL
AFTER INSERT OR DELETE OR UPDATE ON ALBARAN 
FOR EACH ROW 
BEGIN 
	IF INSERTING THEN 
		UPDATE ARTICULO SET STOCK = STOCK - :NEW.CANTIDAD
		WHERE :OLD.COD_ART = COD_ART;
	ELSIF DELETING THEN 
		UPDATE ARTICULO SET STOCK = STOCK + :OLD.CANTIDAD
		WHERE :OLD.COD_ART = COD_ART;
	ELSIF UPDATING ('CANTIDAD') THEN 
		IF :NEW.CANTIDAD > :OLD.CANTIDAD THEN 
			-- Significa que el stock bajara
			UPDATE ARTICULO SET STOCK = STOCK - (:NEW.CANTIDAD - :OLD.CANTIDAD)
			WHERE :OLD.COD_ART = COD_ART;
		ELSIF :OLD.CANTIDAD > :NEW.CANTIDAD THEN
			-- Signfica que el stock subira
			UPDATE ARTICULO SET STOCK = STOCK + (:OLD.CANTIDAD - :NEW.CANTIDAD)
			WHERE :OLD.COD_ART = COD_ART;
		END IF;
	END IF;
END;
