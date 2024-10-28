-- Active: 1718735124373@@142.44.161.115@3306@1900Pac2Equ3


-- Procedimiento para insertar estadísticas
CREATE PROCEDURE InsertEstadisticas( p_cod_veh BIGINT, nom_est VARCHAR(100), IN valor_est VARCHAR(100), fec_est DATE)
    BEGIN
        START TRANSACTION; -- Inicia la transacción
            INSERT INTO `ESTADISTICAS` ( cod_vehiculo, nom_estadistica, valor, fec_estadistica) VALUES ( p_cod_veh, nom_est, valor_est, fec_est); -- Inserta nueva fila de estadística
        COMMIT; -- Confirma la transacción para hacer los cambios permanentes en la base de datos
        
    SELECT * FROM ESTADISTICAS ORDER BY cod_vehiculo DESC LIMIT 1;

END;

CALL InsertEstadisticas(3, 'BUENO', '7', '2024-07-08'); --llamada al procedimiento InsertEstadisticas


-- Procedimiento para actualizar estadísticas
CREATE PROCEDURE UpdateEstadisticas(p_cod_veh BIGINT, nom_est VARCHAR(100), IN valor_est VARCHAR(100), fec_estadistica DATE, p_cod_est BIGINT)
    BEGIN
    START TRANSACTION; -- Inicia la transacción
        UPDATE `ESTADISTICAS` SET cod_vehiculo = p_cod_veh, 
                                    nom_estadistica = nom_est, 
                                    valor = valor_est, 
                                    fec_estadistica = fec_estadistica 
        WHERE cod_estadistica = p_cod_est; -- Actualiza la fila específica de estadística
    COMMIT; -- Confirma la transacción para hacer los cambios permanentes en la base de datos
    END; 

CALL UpdateEstadisticas(5, 'VELOCIDAD', '10', '2024-05-12', 30);

 


CREATE PROCEDURE SelectEstadisticas() -- Procedimiento para seleccionar estadísticas
BEGIN
    SELECT 
        e.cod_estadistica,
        v.modelo,
        e.nom_estadistica,
        e.valor,
        e.fec_estadistica
    FROM ESTADISTICAS e 
    INNER JOIN VEHICULOS v ON e.cod_vehiculo = v.cod_vehiculo -- Selecciona y ordena las estadísticas junto con el modelo del vehículo
    ORDER BY e.cod_estadistica;
END;

CALL SelectEstadisticas(); --llamada al procedimiento SelectEstadisticas

CREATE PROCEDURE SelectEstadisticas2() 
BEGIN
    SELECT 
        h.cod_historial,
        v.modelo,
        h.precio,
        h.tendencia
    FROM HISTORIALES h
    INNER JOIN VEHICULOS v ON h.cod_vehiculo = v.cod_vehiculo 
    ORDER BY h.cod_historial;
END;

CALL SelectEstadisticas2(); 