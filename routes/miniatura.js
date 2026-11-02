'use strict';

const express = require('express');
const router = express.Router();
const miniaturaController = require('../controllers/miniatura');

// Importamos el middleware
const autenticar = require('../middlewares/autenticacion');
const esAdmin = require('../middlewares/esAdmin'); // <-- Importar el nuevo guardia

// Rutas PÚBLICAS (cualquiera puede consultar la wiki)
router.get('/api/miniaturas', miniaturaController.obtenerTodas);
router.get('/api/miniaturas/:id', miniaturaController.obtenerPorId);

// Rutas PROTEGIDAS (solo con token válido)
router.post('/api/miniaturas', autenticar, miniaturaController.crear);
router.delete('/api/miniaturas/:id', [autenticar, esAdmin], miniaturaController.eliminar);
module.exports = router;