import Express from 'express'
import { getEspecificaciones } from '../controllers/EspecificacionesController.js'

const apiEspecificaciones = Express();


apiEspecificaciones.get('', getEspecificaciones)

export {apiEspecificaciones}