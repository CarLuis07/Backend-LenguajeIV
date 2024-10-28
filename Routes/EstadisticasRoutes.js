import Express from 'express'
import { getEstadisticas, getPrecios, postEstadisticas, getMantenimientos, postMantenimientos, getEvaluaciones, postEvaluaciones, getResenias, postResenias, putEstadisticas, } from '../controllers/EstadisticasController.js'

const apiEstadisticas = Express();
const apiPrecios = Express();
const apiMantenimientos = Express();
const apiEvaluaciones = Express();
const apiResenias = Express();



apiEstadisticas.get('', getEstadisticas)
apiEstadisticas.post('', postEstadisticas)
apiEstadisticas.put('', putEstadisticas)
apiPrecios.get('', getPrecios)
apiMantenimientos.get('', getMantenimientos)
apiMantenimientos.post('', postMantenimientos)
apiEvaluaciones.get('', getEvaluaciones)
apiEvaluaciones.post('', postEvaluaciones)
apiResenias.get('', getResenias)
apiResenias.post('', postResenias)

export {apiEstadisticas, apiPrecios, apiMantenimientos, apiEvaluaciones, apiResenias} 