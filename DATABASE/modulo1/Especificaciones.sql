CREATE PROCEDURE SelecEspecificaciones()-- Procedimiento para seleccionar estadísticas
BEGIN
    SELECT 
        v.cod_vehiculo,
        v.modelo,
        v.mot_vehiculo,
        tt.nom_transmision
    FROM VEHICULOS v 
    INNER JOIN `TIPOS_TRANSMISIONES` tt ON v.cod_tipo_transmision = tt.cod_tipo_transmision -- Selecciona y ordena las estadísticas junto con el modelo del vehículo
    ORDER BY v.cod_vehiculo;
END;

CALL SelecEspecificaciones();
