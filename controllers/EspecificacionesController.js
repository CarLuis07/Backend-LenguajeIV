import { mysqlConnection } from "../DATABASE/conexion.js"

const getEspecificaciones= async (_, res) => {
    mysqlConnection.query('CALL SelectEspecificaciones()', (err, rows, fields) => {
        if (!err) {
            res.status(200).json(rows[0]);
        } else {
            console.log(err);
        }
    });
}

export {getEspecificaciones};