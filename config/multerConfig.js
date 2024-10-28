import multer from 'multer';

// Configuración del almacenamiento en memoria (puedes ajustar esto según tus necesidades)
const storage = multer.memoryStorage();

// Crear instancia de multer con la configuración
const upload = multer({ storage: storage });

export default upload;
