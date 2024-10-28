import Express from 'express'
const apiVehiculos = Express();
import upload from '../config/multerConfig.js'

import { getVehiculos, postVehiculos, putVehiculos } from '../controllers/CompararVehiculoController.js'

apiVehiculos.get('', getVehiculos)
apiVehiculos.post('', postVehiculos)
apiVehiculos.put('/', upload.single('img_vehiculo'), putVehiculos);

export {apiVehiculos}
