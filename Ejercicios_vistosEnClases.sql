
-----------------
--Trabajando con VARRAY
-----------------
DECLARE
   TYPE tipo_varray_location IS VARRAY(4) -- se declara el número de la VARRAY
            OF varchar2(50); -- y el tipo de información
   varray_oficinas  tipo_varray_location; --se crea una variable de tipo varray
   v_elementos    NUMBER(3); --se crea una variable con propiedad number (3)
BEGIN
 varray_oficinas:= tipo_varray_location('Bombay','Tokyo','Singapore','Oxford'); -- Abrimos la variable que tiene como tipo varray y indexamos propiedades
    v_elementos:= varray_oficinas.COUNT(); --asignamos elementos con el total de varray
    DBMS_OUTPUT.PUT_LINE('Elementos almacenados en el VARRAY');
    FOR i IN 1 .. v_elementos LOOP -- se usa el total de elementos para establecer el límite
        DBMS_OUTPUT.PUT_LINE(varray_oficinas(i));
    END LOOP;
END; 

-----------------
--Trabajando con VARRAY - agregar elementos
-----------------

DECLARE
   TYPE tipo_varray_location IS VARRAY(6) 
            OF varchar2(50);
   varray_oficinas  tipo_varray_location;
   v_elementos    NUMBER(3); 
BEGIN
   varray_oficinas:= tipo_varray_location('Bombay','Tokyo','Singapore', 'Oxford');
   varray_oficinas.EXTEND; -- permite extender en 1 el VARRAY
   varray_oficinas(5):='Valparaiso';
   varray_oficinas.EXTEND; -- vuelve a extender en 1 el VARRAY
   varray_oficinas(6):='Viña del Mar';
    v_elementos:= varray_oficinas.COUNT(); -- cuenta cuántos elementos tiene el VARRAY
    DBMS_OUTPUT.PUT_LINE('Elementos almacenados en el VARRAY');
    FOR i IN 1 .. v_elementos LOOP
        DBMS_OUTPUT.PUT_LINE(varray_oficinas(i));
    END LOOP;
END; 

-----------------
--Trabajando con VARRAY - Elimianr elementos
-----------------

DECLARE
   TYPE tipo_varray_location IS VARRAY(6) 
            OF varchar2(50);;
   varray_oficinas  tipo_varray_location;
   v_elementos    NUMBER(3); 
BEGIN
   varray_oficinas:= tipo_varray_location('Bombay','Tokyo','Singapore', 'Oxford','Valparaiso','Viña del Mar');
    v_elementos:= varray_oficinas.COUNT();
    DBMS_OUTPUT.PUT_LINE('Total  de elementos almacenados en el VARRAY ' || v_elementos);
    -- Se eliminan los 2 últimos elementos del VARRAY
 varray_oficinas.TRIM(2);
    DBMS_OUTPUT.PUT_LINE('Total de elementos almacenados en el VARRAY ' || varray_oficinas.COUNT);
  -- Se eliminan todos los elementos del VARRAY
 varray_oficinas.DELETE;
    DBMS_OUTPUT.PUT_LINE('Total de elementos almacenados en el VARRAY ' || varray_oficinas.COUNT);
END; 

