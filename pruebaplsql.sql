DECLARE
v_nombre varchar(20) := 'Hola Mundo';
n_conta integer := 1;
b_sino boolean := TRUE;
BEGIN
	FOR n_conta IN 1..10
	LOOP
		IF b_sino THEN 
			BEGIN
				dbms_output.put_line('Hola Don ' || v_nombre);
				b_sino := FALSE;
				v_nombre := 'Jose';
			END;
		ELSE
			BEGIN
				dbms_output.put_line('Hola Don ' || v_nombre);
				b_sino := TRUE;
				v_nombre := 'Pepito';
			END;
		END IF;
	END LOOP;
END;
