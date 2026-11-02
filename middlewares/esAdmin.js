'use strict';

const esAdmin = (req, res, next) => {
    // 1. Validar que la petición venga de un usuario autenticado (pasó previamente por el middleware autenticar)
    if (!req.usuario) {
        return res.status(500).json({
            status: 'error',
            mensaje: 'Fallo de autenticación previa: no se detectó identidad de usuario'
        });
    }

    // 2. Comprobar que el rol decodificado en el token sea exactamente 'admin'
    if (req.usuario.rol !== 'admin') {
        return res.status(403).json({
            status: 'error',
            mensaje: 'Acceso denegado: se requieren permisos de administrador para ejecutar esta purga'
        });
    }

    // 3. El usuario tiene credenciales de administrador, continuar al controlador
    next();
};

module.exports = esAdmin;