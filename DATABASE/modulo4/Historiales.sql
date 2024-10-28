-- Active: 1717652160625@@142.44.161.115@3306@1900Pac2Equ3

-- Procedimiento almacenado para insertar un nuevo descuento en la tabla Historiales
CREATE PROCEDURE InsertHistoriales(IN P_Cod_Vehiculo Bigint, IN P_Precio DOUBLE, IN P_Tendencia VARCHAR(100))
    BEGIN

    -- Inicia una transacción
        START TRANSACTION;
         -- Inserta un nuevo registro en la tablaHistoriales
            INSERT INTO HISTORIALES (cod_vehiculo, precio, tendencia) 
            VALUES (P_Cod_Vehiculo, P_Precio, P_Tendencia);
        COMMIT;
    END;

--ejemplo de llamado del procedimiento
    call InsertHistoriales(2 , 350000, 'Fijo');


-- Procedimiento almacenado para actualizar un registro en la tabla Prom_descuentos
CREATE PROCEDURE UpdateHistoriales(IN P_Cod_Vehiculo Bigint, IN P_Precio DOUBLE, IN P_Tendencia VARCHAR(100), IN P_Cod_Historial BIGINT)
    BEGIN

      -- Inicia una transacción
        START TRANSACTION;
            UPDATE HISTORIALES SET cod_vehiculo = P_Cod_Vehiculo, precio = P_Precio, tendencia = P_Tendencia WHERE cod_historial = P_Cod_Historial;
        COMMIT;
    END;

--ejemplo de llamado del procedimiento
call UpdateHistoriales( 3, 250000, 'Variable', 3);



-- Procedimiento almacenado para seleccionar la información de la tabla Historiales
CREATE PROCEDURE SelectHistoriales()
    BEGIN
        -- Selecciona y devuelve información de la tabla Historial junto con datos relacionados de otras tablas
        SELECT HS.cod_historial, m.nom_marca,v.modelo, HS.precio, HS.tendencia
        FROM HISTORIALES HS
        INNER JOIN VEHICULOS v ON HS.cod_vehiculo = v.cod_vehiculo
        INNER JOIN MARCAS m ON v.cod_marca = m.cod_marca;
    END;

--ejemplo de llamado del procedimiento
CALL SelectHistoriales();