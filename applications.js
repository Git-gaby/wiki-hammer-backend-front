'use strict';

const express = require('express');
const cors = require('cors');


const routerMiniaturas = require('./routes/miniatura');
const routerUsuarios = require('./routes/usuarios');

const application = express();


application.use(cors());
application.use(express.json()); // <-- ESTA LÍNEA ES LA QUE LLENA req.body
application.use(express.urlencoded({ extended: true }));


application.use(routerMiniaturas);
application.use(routerUsuarios);

module.exports = application;