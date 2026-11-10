'use strict';

const bcrypt = require('bcrypt');
const db = require('../models/db');
const jwtHelper = require('../helpers/jwt');

const usuarioController = {
    registro: async (req, res) => {
        try {
            const { nombre, email, password } = req.body;

            if (!nombre || !email || !password) {
                return res.status(400).json({
                    status: 'error',
                    mensaje: 'Faltan campos obligatorios (nombre, email, password)'
                });
            }

            const [existe] = await db.query('SELECT id FROM usuarios WHERE email = ?', [email]);
            if (existe.length > 0) {
                return res.status(409).json({
                    status: 'error',
                    mensaje: 'El correo electrónico ya está registrado'
                });
            }

            
            const passwordHash = await bcrypt.hash(password, 10);

            
            const sql = 'INSERT INTO usuarios (nombre, email, password, rol) VALUES (?, ?, ?, "usuario")';
            const [resultado] = await db.query(sql, [nombre, email, passwordHash]);
            return res.status(201).json({
                status: 'success',
                mensaje: 'Usuario registrado correctamente',
                usuarioId: resultado.insertId
            });

        } catch (error) {
            console.error('Error en registro:', error);
            return res.status(500).json({
                status: 'error',
                mensaje: 'Error interno al registrar usuario'
            });
        }
    },

    login: async (req, res) => {
        try {
            const { email, password } = req.body;

            if (!email || !password) {
                return res.status(400).json({
                    status: 'error',
                    mensaje: 'Debes enviar email y contraseña'
                });
            }

            const sql = 'SELECT * FROM usuarios WHERE email = ? OR nombre = ?';
            const [usuarios] = await db.query(sql, [email, email]);           
           
            if (usuarios.length === 0) {
                return res.status(401).json({
                    status: 'error',
                    mensaje: 'Credenciales inválidas'
                });
            }

            const usuario = usuarios[0];

            const coincide = await bcrypt.compare(password, usuario.password);
            if (!coincide) {
                return res.status(401).json({
                    status: 'error',
                    mensaje: 'Credenciales inválidas'
                });
            }

            const token = jwtHelper.crearToken(usuario);

            return res.status(200).json({
                status: 'success',
                mensaje: 'Inicio de sesión exitoso',
                token: token,
                usuario: {
                    id: usuario.id,
                    nombre: usuario.nombre,
                    email: usuario.email,
                    rol: usuario.rol
                }
            });

        } catch (error) {
            console.error('Error en login:', error);
            return res.status(500).json({
                status: 'error',
                mensaje: 'Error interno en el inicio de sesión'
            });
        }
    }
};

module.exports = usuarioController;