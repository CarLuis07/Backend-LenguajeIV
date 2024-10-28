-- PROCEDURE para insertar evaluaciones
CREATE PROCEDURE InsertEvaluaciones( IN p_cod_veh BIGINT, IN resul_eva FLOAT, IN fec_eva DATE, IN p_cod_usuario BIGINT)
BEGIN
    START TRANSACTION; -- Inicia la transacción 
    INSERT INTO `EVALUACIONES` (cod_vehiculo, resul_evaluacion, fec_evaluacion, cod_usuario) VALUES ( p_cod_veh, resul_eva, fec_eva, p_cod_usuario); -- Inserta los valores proporcionados
    COMMIT; -- Confirma la transacción
END;

CALL InsertEvaluaciones( 21, 8, '2024-07-27', 2); -- Ejecuta la inserción 

-- PROCEDURE para actualizar evaluaciones
CREATE PROCEDURE UpdateEvaluaciones(IN p_cod_veh BIGINT, IN result_eva VARCHAR(50), IN fec_eva DATE, IN p_cod_usuario BIGINT, IN p_cod_eva BIGINT)
BEGIN
    START TRANSACTION;  -- Inicia la transacción
    UPDATE `EVALUACIONES` SET cod_vehiculo = p_cod_veh,
                                resul_evaluacion = result_eva,
                                fec_evaluacion = fec_eva, 
                                cod_usuario = p_cod_usuario
    WHERE cod_evaluacion = p_cod_eva; -- Actualiza los registros donde coincida el código de evaluación
    COMMIT; -- Confirma la transacción
END;

CALL UpdateEvaluaciones(1, '8.5', '2024-07-07', 2, 2); -- Ejecuta la actualización de ejemplo

-- PROCEDURE para seleccionar evaluaciones
CREATE PROCEDURE SelectEvaluaciones()
BEGIN
    SELECT 
        v.cod_evaluacion,     -- Código de la evaluación
        v.resul_evaluacion,   -- Resultado de la evaluación
        v.fec_evaluacion,     -- Fecha de la evaluación
        v.cod_usuario         -- Código del usuario que realizó la evaluación
    FROM EVALUACIONES v 
    INNER JOIN VEHICULOS a ON v.cod_vehiculo = a.cod_vehiculo -- Realiza un JOIN con la tabla VEHICULOS
    INNER JOIN USUARIOS u ON v.cod_usuario = u.cod_usuario    -- Realiza un JOIN con la tabla USUARIOS
    ORDER BY v.cod_evaluacion;                                -- Ordena los resultados por código de evaluación
END;

CALL SelectEvaluaciones(); -- Ejecuta la selección de evaluaciones
