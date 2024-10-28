-- Active: 1717652160625@@142.44.161.115@3306@1900Pac2Equ3

-- Procedimiento almacenado para insertar un nuevo descuento en la tabla Prom_descuentos
CREATE PROCEDURE InsertPromDescuentos(IN P_Fec_pro Date, IN P_Promo Float, IN P_Desc Float,IN P_Dispo Varchar(50), IN P_Tipo_Vehiculo Bigint, IN P_Marca_Vehiculo Bigint)
    BEGIN

    -- Inicia una transacción
        START TRANSACTION;
         -- Inserta un nuevo registro en la tabla Prom_descuentos
            INSERT INTO PROM_DESCUENTOS (fec_prom, promocion, descuento, disponibilidad, cod_tipo_vehiculo, cod_marca) 
            VALUES (P_Fec_pro, P_Promo, P_Desc, P_Dispo, P_Tipo_Vehiculo, P_Marca_Vehiculo);
        COMMIT;
    END;

--ejemplo de llamado del procedimiento
    call InsertPromDescuentos('2024-07-07', 10, 2, 'martes', 1, 2);


-- Procedimiento almacenado para actualizar un registro en la tabla Prom_descuentos
CREATE PROCEDURE UpdatePromDescuentos(IN P_Fec_pro Date, IN P_Promo Float, IN P_Desc Float,IN P_Dispo Varchar(50), IN P_Tipo_Vehiculo Bigint, IN P_Marca_Vehiculo Bigint, IN P_cod_pro BIGINT)
    BEGIN

      -- Inicia una transacción
        START TRANSACTION;
            UPDATE PROM_DESCUENTOS SET fec_prom = P_Fec_pro, promocion = P_Promo, descuento = P_Desc, disponibilidad = P_Dispo, cod_tipo_vehiculo = P_Tipo_Vehiculo, cod_marca = P_Marca_Vehiculo WHERE cod_promo = P_cod_pro;
        COMMIT;
    END;

--ejemplo de llamado del procedimiento
CALL UpdatePromDescuentos ('2024-07-03', 10, 2, 'Lunes', 1, 2, 2);



-- Procedimiento almacenado para seleccionar la información de la tabla Prom_descuentos
CREATE PROCEDURE SelectPromDescuentos()
    BEGIN
        -- Selecciona y devuelve información de la tabla Prom_descuentos junto con datos relacionados de otras tablas
        SELECT PM.fec_prom, PM.promocion, PM.descuento, PM.disponibilidad, t_v.nom_tipo_vehiculo, m.nom_marca
        FROM PROM_DESCUENTOS PM
        INNER JOIN MARCAS m ON PM.cod_marca = m.cod_marca
        INNER JOIN TIPOS_VEHICULOS t_v ON PM.cod_tipo_vehiculo = t_v.cod_tipo_vehiculo;
    END;

--ejemplo de llamado del procedimiento
CALL SelectPromDescuentos();


-- Procedimiento almacenado para seleccionar la información de las tablas de Vehiculo, Marcas Y historial
CREATE PROCEDURE SelectPromDescuentos()
    BEGIN
        -- Selecciona y devuelve información de la tabla Prom_descuentos junto con datos relacionados de otras tablas
        SELECT PM.fec_prom, PM.promocion, PM.descuento, PM.disponibilidad, t_v.nom_tipo_vehiculo, m.nom_marca
        FROM PROM_DESCUENTOS PM
        INNER JOIN MARCAS m ON PM.cod_marca = m.cod_marca
        INNER JOIN TIPOS_VEHICULOS t_v ON PM.cod_tipo_vehiculo = t_v.cod_tipo_vehiculo;
        INNER JOIN HISTORIALES HS ON 
    END;

--ejemplo de llamado del procedimiento
CALL SelectPromDescuentos();