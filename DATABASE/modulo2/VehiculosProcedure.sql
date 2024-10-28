-- Active: 1718901150586@@142.44.161.115@3306@1900Pac2Equ3

-- Procedimiento almacenado para insertar un nuevo vehículo en la tabla VEHICULOS
CREATE PROCEDURE InsertVehiculos(IN p_año_veh VARCHAR(4), IN p_mot_veh VARCHAR(50), IN p_pot_veh VARCHAR(50), IN p_cod_marca BIGINT, IN p_model VARCHAR(50), IN p_tip_tran BIGINT)
    BEGIN

    -- Inicia una transacción
    START TRANSACTION;
    
    -- Verifica que todos los parámetros hayan sido proporcionados
    IF p_año_veh IS NULL OR p_mot_veh IS NULL OR p_pot_veh IS NULL OR p_cod_marca IS NULL OR p_model IS NULL OR p_tip_tran IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Uno o más parámetros de entrada son nulos';

    ELSE
        -- Inserta un nuevo registro en la tabla VEHICULOS
        INSERT INTO VEHICULOS(anio_vehiculo, mot_vehiculo, pot_vehiculo, cod_marca, modelo, cod_tipo_transmision) VALUES (p_año_veh, p_mot_veh, p_pot_veh, p_cod_marca, p_model, p_tip_tran);
        COMMIT;

        -- Selecciona y devuelve el último registro insertado en la tabla VEHICULOS
         SELECT * FROM VEHICULOS ORDER BY cod_vehiculo DESC LIMIT 1;
         SIGNAL SQLSTATE '02000' SELECT 'vehículo AGREGADO Exitosamente';
    END IF;
END;


--ejemplo de llamado del procedimiento
CALL InsertVehiculos('2014', 'Eléctrico', '105 HP', 2, 'Tucson', 2);







-- Procedimiento almacenado para actualizar un registro en la tabla VEHICULOS
CREATE PROCEDURE UpdateVehiculos(
    
    IN p_año_veh VARCHAR(4),
    IN p_mot_veh VARCHAR(50),
    IN p_pot_veh VARCHAR(50),
    IN p_cod_marca BIGINT,
    IN p_model VARCHAR(50),
    IN p_tip_tran BIGINT,
    IN p_img_veh LONGBLOB,
    IN p_cod_veh BIGINT-- Añadido parámetro para la imagen
)
BEGIN
    -- En caso de error, se deshace la transacción anterior
    ROLLBACK;
    
    -- Inicia una transacción
    START TRANSACTION;

    -- Verifica que todos los parámetros hayan sido proporcionados
    IF p_año_veh IS NULL OR p_mot_veh IS NULL OR p_pot_veh IS NULL OR p_cod_marca IS NULL OR p_model IS NULL OR p_tip_tran IS NULL OR p_cod_veh IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Uno o más parámetros de entrada son nulos';
    
    ELSE
        -- Actualiza el registro en la tabla VEHICULOS
        UPDATE VEHICULOS SET anio_vehiculo = p_año_veh,
                             mot_vehiculo = p_mot_veh, 
                             pot_vehiculo = p_pot_veh, 
                             cod_marca = p_cod_marca, 
                             modelo = p_model, 
                             cod_tipo_transmision = p_tip_tran,
                             img_vehiculo = p_img_veh -- Actualiza la imagen
        WHERE cod_vehiculo = p_cod_veh;
        COMMIT;
        
        -- Selecciona y devuelve el registro actualizado de la tabla VEHICULOS
        SELECT * FROM VEHICULOS WHERE cod_vehiculo = p_cod_veh;
        -- Se muestra un mensaje de exito para el usuario y desarrolladores
        SELECT 'exitosa la actualización del vehículo';
    END IF;
END;


CALL UpdateVehiculos( 1,'2023','electri' , 'HOLA', 3, 'Corolla', 2);




-- Procedimiento almacenado para seleccionar la información de la tabla VEHICULOS
CREATE PROCEDURE SelectVehiculos()
    BEGIN
        -- Selecciona y devuelve información de la tabla VEHICULOS junto con datos relacionados de otras tablas
        SELECT v.cod_vehiculo, v.anio_vehiculo, v.mot_vehiculo, v.pot_vehiculo, m.nom_marca, v.modelo, t.nom_transmision, v.img_vehiculo, tv.nom_tipo_vehiculo
        FROM VEHICULOS v
        -- Relación entre VEHICULOS y MARCAS
        INNER JOIN MARCAS m ON v.cod_marca = m.cod_marca 
        -- Relación entre VEHICULOS y TIPOS_TRANSMISIONES
        INNER JOIN TIPOS_TRANSMISIONES t ON v.cod_tipo_transmision = t.cod_tipo_transmision
        -- Relación entre MARCAS y TIPOS_VEHICULOS
        INNER JOIN TIPOS_VEHICULOS tv ON m.cod_tipo_vehiculo= tv.cod_tipo_vehiculo;
END;

    CALL SelectVehiculos();







-- Procedimiento almacenado para seleccionar vehículos según el modelo O la marca proporcionados
CREATE PROCEDURE SelectBuscarVehiculo(IN p_marcOmod VARCHAR(50))
    BEGIN
        IF p_marcOmod IS NULL THEN
             SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Uno o más parámetros de entrada son nulos';
        ELSE
            -- Selecciona y devuelve información de la tabla VEHICULOS junto con datos relacionados de otras tablas
            SELECT v.cod_vehiculo, v.anio_vehiculo, v.mot_vehiculo, v.pot_vehiculo, m.nom_marca, v.modelo, t.nom_transmision, v.img_vehiculo, tv.nom_tipo_vehiculo
            FROM VEHICULOS v
            -- Relación entre VEHICULOS y MARCAS
            INNER JOIN MARCAS m ON v.cod_marca = m.cod_marca
            -- Relación entre VEHICULOS y TIPOS_TRANSMISIONES
            INNER JOIN TIPOS_TRANSMISIONES t ON v.cod_tipo_transmision = t.cod_tipo_transmision
            -- Relación entre MARCAS y TIPOS_VEHICULOS
            INNER JOIN TIPOS_VEHICULOS tv ON m.cod_tipo_vehiculo= tv.cod_tipo_vehiculo
            WHERE (v.modelo = p_marcOmod ) OR (m.nom_marca = p_marcOmod );
        END IF;
    END;

    CALL SelectBuscarVehiculo('Tesla');







-- Procedimiento almacenado para seleccionar información comparativa de varios vehículos por sus códigos
CREATE PROCEDURE SelectCompararVehiculos(IN p_cod_veh1 BIGINT, IN p_cod_veh2 BIGINT, IN p_cod_veh3 BIGINT)
    BEGIN
        -- Selecciona y devuelve información de la tabla VEHICULOS junto con datos relacionados de otras tablas
        SELECT v.cod_vehiculo, v.anio_vehiculo, v.mot_vehiculo, v.pot_vehiculo, m.nom_marca, v.modelo, t.nom_transmision, v.img_vehiculo, tv.nom_tipo_vehiculo, h.precio
        FROM VEHICULOS v
        -- Relación entre VEHICULOS y MARCAS
        INNER JOIN MARCAS m ON v.cod_marca = m.cod_marca
        -- Relación entre VEHICULOS y TIPOS_TRANSMISIONES
        INNER JOIN TIPOS_TRANSMISIONES t ON v.cod_tipo_transmision = t.cod_tipo_transmision
        -- Relación entre MARCAS y TIPOS_VEHICULOS
        INNER JOIN TIPOS_VEHICULOS tv ON m.cod_tipo_vehiculo = tv.cod_tipo_vehiculo
        -- Relación entre VEHICULOS y HISTORIALES
        INNER JOIN HISTORIALES h ON v.cod_vehiculo = h.cod_vehiculo
        WHERE v.cod_vehiculo IN (p_cod_veh1, p_cod_veh2, p_cod_veh3);
    END;

    CALL SelectCompararVehiculos(7, 1, 12);


