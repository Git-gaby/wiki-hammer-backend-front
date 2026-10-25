'use strict';

const jwt = require('jwt-simple');
const moment = require('moment');
const { CLAVE_SECRETA } = require('../helpers/jwt');

const autenticar = (req, res, next) => {
    
    const cabeceraAuth = req.headers['authorization'];

    if (!cabeceraAuth) {
        return res.status(403).json({
            status: 'error',
            mensaje: 'La petición no incluye la cabecera de autenticación'
        });
    }

    
    const token = cabeceraAuth.replace(/['"]+/g, '');

    try {
        
        const payload = jwt.decode(token, CLAVE_SECRETA);

        
        if (payload.exp <= moment().unix()) {
            return res.status(401).json({
                status: 'error',
                mensaje: 'El token ha expirado'
            });
        }

        
        req.usuario = payload;

        
        next();

    } catch (error) {
        return res.status(404).json({
            status: 'error',
            mensaje: 'Token inválido'
        });
    }
};

module.exports = autenticar;