'use strict';

const express = require('express');
const cors = require('cors');
const path = require('path');

const routerMiniaturas = require('./routes/miniatura');
const routerUsuarios = require('./routes/usuarios');

const application = express();

application.use(cors());
application.use(express.json());
application.use(express.urlencoded({ extended: true }));

// Permitir que el navegador acceda a las imágenes
application.use(
    '/imagenes',
    express.static(path.join(__dirname, 'public', 'miniaturas'))
);

// Rutas de la API
application.use(routerMiniaturas);
application.use(routerUsuarios);

module.exports = application;