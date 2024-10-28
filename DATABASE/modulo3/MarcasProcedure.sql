

CREATE PROCEDURE InsertMarcas(IN p_cod_tipov BIGINT, IN p_nom_marc VARCHAR (100))
    BEGIN
        START TRANSACTION;
            INSERT INTO MARCAS (cod_tipo_vehiculo, nom_marca) VALUES (p_cod_tipov, p_nom_marc);
        COMMIT;
    END;

call InsertMarcas(1, 'Ferrari');





CREATE PROCEDURE UpdateMarcas(IN p_cod_tipov BIGINT,IN cod_tipo_marca BIGINT, IN p_nom_marc VARCHAR (100))
    BEGIN
        START TRANSACTION;
            UPDATE MARCAS SET nom_marca = p_nom_marc,
                              cod_tipo_vehiculo = p_cod_tipov
            WHERE cod_marca = cod_tipo_marca;
        COMMIT;
    END;

CALL UpdateMarcas (1,4,'SUBARU' );





CREATE PROCEDURE SelectMarca()
    BEGIN
        SELECT cod_marca, nom_marca FROM MARCAS ORDER BY nom_marca;
    END;

CALL SelectMarca();