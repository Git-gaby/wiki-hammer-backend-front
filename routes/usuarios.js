'use strict';

const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuario');

router.post('/api/registro', usuarioController.registro);
router.post('/api/login', usuarioController.login);

module.exports = router;