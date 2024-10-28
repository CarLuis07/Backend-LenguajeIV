import { mysqlConnection } from "../DATABASE/conexion.js"


const getVehiculos= async (_, res) => {
     mysqlConnection.query (await 'CALL SelectVehiculos()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}

const postVehiculos = async (req, res) => {
    const params = [
        req.body.year,
        req.body.motor,
        req.body.potence,
        req.body.marc,
        req.body.model,
        req.body.typeTransmition
    ];

    const query = 'CALL InsertVehiculos(?, ?, ?, ?, ?, ?)';
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar el vehículo' });
        } else {
            res.json({
                result
            });
        }
    });
};

const putVehiculos = async (req, res) => {
    let veh = req.body;
    let img = req.file; // Aquí obtienes el archivo cargado

    var sql = "CALL UpdateVehiculos(?, ?, ?, ?, ?, ?, ?, ?)";

    mysqlConnection.query(sql, [
        veh.anio_vehiculo,
        veh.mot_vehiculo,
        veh.pot_vehiculo,
        veh.cod_marca,
        veh.modelo,
        veh.cod_tipo_transmision,
        img ? img.buffer : null, // Envía el buffer de la imagen si está presente
        veh.cod_vehiculo
    ], (err, result, fields) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al actualizar el vehículo' });
        } else {
            res.json({
                result
            });
        }
    });
};


const getVehiculo= async (req, res) => {
    const params = [
        req.params.search,
    ];

    const query = ' CALL SelectBuscarVehiculo(?);'
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al buscar el vehículo' });
        } else {
            res.json({
                result
            });
        }
   });
}



export{getVehiculos, postVehiculos, getVehiculo, putVehiculos}
