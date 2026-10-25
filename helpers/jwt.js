'use strict';

const jwt = require('jwt-simple');
const moment = require('moment');


const CLAVE_SECRETA = 'clave_secreta_warhammer_2026';

const jwtHelper = {
    crearToken: (usuario) => {
        const payload = {
            sub: usuario.id,
            nombre: usuario.nombre,
            email: usuario.email,
            rol: usuario.rol,
            iat: moment().unix(),                 
            exp: moment().add(30, 'days').unix() 
        };

        return jwt.encode(payload, CLAVE_SECRETA);
    },
    CLAVE_SECRETA
};

module.exports = jwtHelper;