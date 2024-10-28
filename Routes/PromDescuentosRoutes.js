import Express from 'express'
import { getPromDescuentos, postPromDescuentos, putPromDescuentos } from '../controllers/PromDescuentoController.js'

const apiPromDescuentos= Express()

apiPromDescuentos.get('', getPromDescuentos)
apiPromDescuentos.post('', postPromDescuentos)
apiPromDescuentos.put('', putPromDescuentos)



export {apiPromDescuentos}