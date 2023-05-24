CREATE OR REPLACE FUNCTION count_albaranes RETURN NUMBER IS
	valor_devuelto NUMBER;
	BEGIN
		SELECT count(*) INTO valor_devuelto FROM albaran;
	RETURN valor_devuelto;
END;
