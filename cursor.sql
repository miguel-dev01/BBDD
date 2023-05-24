DECLARE
  CURSOR c_comerciales IS
    SELECT c.DNI, c.NOMBRE, c.APELLIDOS FROM COMERCIAL c;
  
  v_comercial c_comerciales%ROWTYPE;
BEGIN
  OPEN c_comerciales;
  
  LOOP
    FETCH c_comerciales INTO v_comercial;
    EXIT WHEN c_comerciales%NOTFOUND;
    
   
    DBMS_OUTPUT.PUT_LINE('Nombre del comercial: ' || v_comercial.dni || '-' || v_comercial.nombre || v_comercial.apellidos);
  END LOOP;
  
  CLOSE c_comerciales;
END;
