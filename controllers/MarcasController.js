import { mysqlConnection } from "../DATABASE/conexion.js"

const getMarcas= async (_, res) => {
    mysqlConnection.query('CALL SelectMarca()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}


const postMarcas = async (req, res) => {
    const params = [ //CALL InsertMarcas;
        req.body.cod_tipo_vehiculo,
        req.body.marca
        
    ];

    const query = 'CALL InsertMarcas(?, ?)';
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar Marca' });
        } else {
            res.json({
                result,
                msg: 'Marca insertada correctamente'
            });
        }
    });
};

const getRendimientos= async (_, res) => {
    mysqlConnection.query('CALL SelectRendimientos()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}

const postRendimientos = async (req, res) => {
    const params = [ //CALL InsertRendimiento;
        req.body.cod_vehiculo,
        req.body.eficiencia,
        req.body.fec_prueba,
        req.body.resultado
        
    ];

    const query = 'CALL InsertRendimiento(?, ?, ?, ?)';
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar Rendimiento' });
        } else {
            res.json({
                result,
                msg: 'Rendimiento insertada correctamente'
            });
        }
    });
};

const putMarcas = async (req, res) => {
    let marc = req.body;
    var sql = "CALL UpdateMarcas(?, ?, ?)";

    mysqlConnection.query(sql, [marc.cod_marca, marc.cod_tipo_vehiculo, marc.nom_marca], (err, result, fields) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar la marca' });
        } else {
            res.json({
                result
            });
        }
    });
};


const putRendimientos = async (req, res) => {
    let rend = req.body;
    var sql = "CALL UpdateRendimiento(?, ?, ?, ?)";

    mysqlConnection.query(sql, [rend.cod_vehiculo, rend.eficiencia, rend.fec_prueba, rend.resultado], (err, result, fields) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar la rendimiento' });
        } else {
            res.json({
                result
            });
        }
    });
};


export {getMarcas, postMarcas, getRendimientos, postRendimientos, putMarcas, putRendimientos}