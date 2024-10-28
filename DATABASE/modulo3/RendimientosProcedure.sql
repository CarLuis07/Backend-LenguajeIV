

CREATE PROCEDURE InsertRendimiento(p_cod_veh BIGINT, p_efic VARCHAR(50), p_fec_prue DATE, p_res VARCHAR(50))
    BEGIN
        START TRANSACTION;
            INSERT INTO RENDIMIENTOS (cod_vehiculo, eficiencia, fec_prueba, resultado) VALUES (p_cod_veh, p_efic, p_fec_prue, p_res);
        COMMIT;

    END;

call InsertRendimiento(3, 'EFICIENTE', '2024-07-06', 'EXCELENTE' );



CREATE PROCEDURE UpdateRendimiento(p_cod_rend BIGINT, p_cod_veh BIGINT, p_efic VARCHAR(50), p_fec_prue DATE, p_res VARCHAR(50))
    BEGIN
        START TRANSACTION;
            UPDATE RENDIMIENTOS SET cod_vehiculo = p_cod_veh,
                                    eficiencia = p_efic,   
                                    fec_prueba = p_fec_prue,
                                    resultado = p_res
            WHERE cod_rendimiento= p_cod_rend;
        COMMIT;

    END;

CALL UpdateRendimiento(1, 2,'regular','2024-07-06','REGULAR');





CREATE PROCEDURE SelectRendimientos()
BEGIN
    SELECT 
        v.cod_rendimiento,
        v.eficiencia,
        v.fec_prueba,
        v.resultado 
    FROM RENDIMIENTOS v 
    INNER JOIN VEHICULOS a ON v.cod_vehiculo = a.cod_vehiculo
    ORDER BY v.cod_rendimiento;
END;


CALL SelectRendimientos();