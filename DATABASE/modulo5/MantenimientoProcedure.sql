-- Active: 1718683999314@@142.44.161.115@3306@1900Pac2Equ3

CREATE PROCEDURE InsertMantenimientos( p_cod_veh BIGINT, p_cod_tipo BIGINT, IN descrip_mante VARCHAR(50), fec_mante DATE)
    BEGIN
        START TRANSACTION;
            INSERT INTO `MANTENIMIENTOS` ( cod_vehiculo, cod_tipo_mantenimiento, descripcion, fec_mantenimiento) VALUES ( p_cod_veh, p_cod_tipo, descrip_mante, fec_mante);
        COMMIT;
    END;

call InsertMantenimientos( 1, 4, 'cambio filtro aceite', '2024-07-16');


CREATE PROCEDURE UpdateMantenimientos(p_cod_veh BIGINT, p_cod_tipo BIGINT, IN descrip_mante VARCHAR(50), fec_mante DATE, IN p_cod_mante BIGINT)
    BEGIN
    START TRANSACTION;
        UPDATE `MANTENIMIENTOS` SET cod_vehiculo = p_cod_veh,
                                    cod_tipo_mantenimiento = p_cod_tipo, 
                                    descripcion = descrip_mante, 
                                    fec_mantenimiento = fec_mante 
        WHERE cod_mantenimiento = p_cod_mante;
    COMMIT;
    END;

CALL UpdateMantenimientos(1, 4, 'Rectificado y alineamiento', '2024-10-11', 4);

CREATE PROCEDURE SelectMantenimientos()
    BEGIN
        SELECT v.cod_vehiculo, tm.nom_mantenimiento, mt.descripcion , mt.fec_mantenimiento
        FROM `MANTENIMIENTOS` mt
        INNER JOIN `VEHICULOS` v ON mt.cod_vehiculo = v.cod_vehiculo
        INNER JOIN `TIPOS_MANTENIMIENTOS` tm ON mt.cod_tipo_mantenimiento = tm.cod_tipo_mantenimiento;
    END;

CALL SelectMantenimientos();