'use strict';

const jwt = require('jwt-simple');
const moment = require('moment');

const CLAVE_SECRETA = process.env.JWT_SECRET || 'clave_por_defecto_segura';

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