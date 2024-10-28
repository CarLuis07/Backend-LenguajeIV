-- Active: 1718901150586@@142.44.161.115@3306@1900Pac2Equ3

CREATE PROCEDURE InsertTipoMantenimientos(IN nom_mante VARCHAR(50))
    BEGIN
        START TRANSACTION;
            INSERT INTO TIPOS_MANTENIMIENTOS (nom_mantenimiento) VALUES (nom_mante);
        COMMIT;
    END;

call InsertTipoMantenimientos('Preventivo');






CREATE PROCEDURE UpdateTipoMantenimientos(IN nom_mante VARCHAR(50), IN cod_tipo BIGINT)
    BEGIN
        START TRANSACTION;
            UPDATE TIPOS_MANTENIMIENTOS SET nom_mantenimiento = nom_mante WHERE cod_tipo_mantenimiento = cod_tipo;
        COMMIT;
    END;

CALL UpdateTipoMantenimientos ('Carroceria', 2);





CREATE PROCEDURE SelectTipoMantenimientos()
    BEGIN
        SELECT cod_tipo_mantenimiento, nom_mantenimiento FROM TIPOS_MANTENIMIENTOS ORDER BY nom_mantenimiento;
    END;

CALL SelectTipoMantenimientos();