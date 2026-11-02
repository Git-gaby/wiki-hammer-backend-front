'use strict';

require('dotenv').config();

const application = require('./applications');
const db = require('./models/db');

const PUERTO = 2508;

db.query('SELECT 1')
.then(() => {
    console.log('Conexión exitosa a MySQL');
    application.listen(PUERTO, () => {
        console.log(`Servidor corriendo en http://localhost:${PUERTO}`);
    });
})

.catch(err => {
    console.error('Error al conectar con MySQL', err.message);



});