-- Secuencia para articulos. Son similares a los autonumericos de otros SGBDs.
/*Se usan mas para primary keys que son claves sinteticas, estas claves son mas propias
 del mundo real que del modelo logico de la base de datos*/

CREATE SEQUENCE seq_cod_art;


SELECT 'ART-' || seq_cod_art.nextval FROM dual;

-- Se pueden introducir en un INSERT (campo1) VALUES('ART-' || seq_cod_art.nextval,...)

-- Tambien podemos hacer:
CREATE SEQUENCE seq_cod_art;
	START WITH 100; -- Indicamos que comience a contar desde 100
	INCREMENT BY 5;