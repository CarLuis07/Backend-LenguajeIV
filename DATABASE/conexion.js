import mysql from 'mysql';
import dotenv from 'dotenv';
dotenv.config();

const dbConfig = {
    host: process.env.HOST,
    user: process.env.USER,
    password: `${process.env.PASS}#88`,
    database: process.env.DATABASE,
    multipleStatements: false
};

const mysqlConnection = mysql.createConnection(dbConfig);

const connectToDatabase = async () => {
    try {
        await mysqlConnection.connect();
        console.log('Conexión Exitosa');
    } catch (err) {
        console.error('Error al conectar a la DB:', err.message);
    }
};

connectToDatabase();

export { mysqlConnection };
