/* Cree un paquete por cada una de las tablas que hay en el esquema comercial que incluyan: 
    • Función de consulta de un registro por su clave primaria
    • Procedimientos de creación, modificación y supresión de un registro
    • Ubique donde considere conveniente las funciones y procedimientos creadas anteriormente.
 */

CREATE OR REPLACE PACKAGE p_cliente IS 
	/*CRUD*/
	FUNCTION f_get_cliente (v_dni cliente.dni%type) RETURN cliente%rowtype;
	/*Procedimiento que elimina un cliente*/
	PROCEDURE p_cliente(v_dni cliente.dni%type);
END;

CREATE OR REPLACE PACKAGE BODY p_cliente IS
	FUNCTION f_get_cliente(v_dni cliente.dni%type) RETURN cliente%rowtype IS 
		v_row cliente.dni%rowtype;
	BEGIN
		SELECT *
		INTO v_row
		FROM cliente c
		WHERE v_dni = v_row;
	END f_get_cliente;

	PROCEDURE pro_cliente(v_dni cli ente.dni%type) IS
	BEGIN
		DELETE 
		FROM cliente c
		WHERE c.DNI = v_dni;
	END pro_cliente;

END p_cliente;