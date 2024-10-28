CREATE PROCEDURE InsertReseñas( in p_cod_veh BIGINT, in p_cod_usuario BIGINT, in p_calf_general INT, in p_opinion VARCHAR(50))
    BEGIN
        START TRANSACTION;
            INSERT INTO `RESEÑAS`( cod_vehiculo, cod_usuario, calif_general, opinion ) VALUES ( p_cod_veh, p_cod_usuario, p_calf_general, p_opinion);
        COMMIT;
    END;

call `InsertReseñas`( 3, 3, '5', 'Excelente');

CREATE PROCEDURE UpdateReseñas(in p_cod_veh BIGINT, in p_cod_usuario BIGINT, in p_calf_general INT, in p_opinion VARCHAR(50), in p_cod_resena BIGINT)
    BEGIN
    START TRANSACTION;
        UPDATE `RESEÑAS` SET cod_vehiculo = p_cod_veh,
                                    cod_usuario = p_cod_usuario, 
                                    calif_general = p_calf_general, 
                                    opinion = p_opinion 
        WHERE cod_resena = p_cod_resena;
    COMMIT;
    END;

call `UpdateReseñas`( 2, 2, 1, 'Se apaga', 2);

CREATE PROCEDURE SelectReseñas()
    BEGIN
        SELECT r.cod_resena, v.modelo, u.nom_usuario, r.calif_general , r.opinion
        FROM `RESEÑAS` r
        INNER JOIN `VEHICULOS` v ON r.cod_vehiculo = v.cod_vehiculo
        INNER JOIN `USUARIOS` u ON r.cod_usuario = u.cod_usuario;
    END;

CALL SelectReseñas();

