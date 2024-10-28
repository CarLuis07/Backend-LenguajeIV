
CREATE PROCEDURE InsertTipoTransmisiones(IN nom_transm VARCHAR(100))
    BEGIN
        START TRANSACTION;
            INSERT INTO TIPOS_TRANSMISIONES (nom_transmision) VALUES (nom_transm);
        COMMIT;
    END;

call InsertTipoTransmisiones('AMT');






CREATE PROCEDURE UpdateTipoTransmisiones(IN nom_transm VARCHAR(100), IN cod_tipo BIGINT)
    BEGIN
        START TRANSACTION;
            UPDATE TIPOS_TRANSMISIONES SET nom_transmision = nom_transm WHERE cod_tipo_transmision = cod_tipo;
        COMMIT;
    END;

CALL UpdateTipoTransmisiones ('Automatica', 2);





CREATE PROCEDURE SelectTipoTransmisiones()
    BEGIN
        SELECT cod_tipo_transmision, nom_transmision FROM TIPOS_TRANSMISIONES ORDER BY nom_transmision;
    END;

CALL SelectTipoTransmisiones();