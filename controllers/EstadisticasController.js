import { mysqlConnection } from "../DATABASE/conexion.js"


//-------------------------------------ESTADISTICAS-----------------------------------------
const getEstadisticas= async (_, res) => {
    mysqlConnection.query('CALL SelectEstadisticas()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}
    

const postEstadisticas = async (req, res) => {
    const params = [ //CALL InsertEstadisticas(3, 'BUENO', '7', '2024-07-08');
        req.body.Modelo,
        req.body.NombreEstadistica,
        req.body.Valor,
        req.body.Fecha,
    ];

    const query = 'CALL InsertEstadisticas(?, ?, ?, ?)';
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar Estadistica' });
        } else {
            res.json({
                result,
                msg: 'Estadistica insertada correctamente'
            });
        }
    });
};


const putEstadisticas = async (req, res) => {
    let est = req.body;
    var sql = "CALL UpdateEstadisticas(?, ?, ?, ?, ?)";

    mysqlConnection.query(sql, [est.cod_vehiculo, est.nom_estadistica, est.valor, est.fec_estadistica, est.cod_estadistica], (err, result, fields) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al ejecutar la consulta', error: err });
        } else {
            res.json({ result });
        }
    });
};



//-----------------------------------------------------------------------------------------

//-------------------------------------HISTORIAL-----------------------------------------
const getPrecios= async (_, res) => {
    mysqlConnection.query('CALL SelectPrecios()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}
//------------------------------------------------------------------------------------------

//-------------------------------------MANTENIMIENTOS---------------------------------------
const getMantenimientos= async (_, res) => {
    mysqlConnection.query('CALL SelectMantenimientos()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}

const postMantenimientos = async (req, res) => {
    const params = [ 
        req.body.Modelo,
        req.body.TipoMantenimiento,
        req.body.Descripcion,
        req.body.Fecha,
    ];

    const query = 'CALL InsertMantenimientos(?, ?, ?, ?)';
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar Mantenimientos' });
        } else {
            res.json({
                result,
                msg: 'Mantenimientos insertada correctamente'
            });
        }
    });
};



//------------------------------------------------------------------------------------------

//-------------------------------------EVALUACIONES-----------------------------------------
const getEvaluaciones= async (_, res) => {
    mysqlConnection.query('CALL SelectEvaluaciones()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}

const postEvaluaciones = async (req, res) => {
    const params = [ 
        req.body.Modelo,
        req.body.Evaluacion,
        req.body.FechaEvaluacion,
        req.body.Usuario,
    ];

    const query = 'CALL InsertEvaluaciones(?, ?, ?, ?)';
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar Evaluacion' });
        } else {
            res.json({
                result,
                msg: 'Evaluacion insertada correctamente'
            });
        }
    });
};


//------------------------------------------------------------------------------------------

//--------------------------------------RESEÑAS---------------------------------------------
const getResenias= async (_, res) => {
    mysqlConnection.query('CALL SelectReseñas()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}

const postResenias = async (req, res) => {
    const params = [ 
        req.body.Modelo,
        req.body.Usuario,
        req.body.CalificacionGeneral,
        req.body.Opinion,
    ];

    const query = 'call `InsertReseñas`(?, ?, ?, ?)';
    mysqlConnection.query(query, params, (err, result) => {
        if (err) {
            console.error('Error al ejecutar la consulta:', err);
            res.status(500).json({ msg: 'Error al insertar Reseña' });
        } else {
            res.json({
                result,
                msg: 'Reseña insertada correctamente'
            });
        }
    });
};

export{getEstadisticas, postEstadisticas, getPrecios, getMantenimientos, postMantenimientos, getEvaluaciones, postEvaluaciones, getResenias, postResenias, putEstadisticas}
