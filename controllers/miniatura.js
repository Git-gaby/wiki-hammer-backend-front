'use strict';

const db = require('../models/db');

const controladorMiniatura = {
    // 1. Obtener todas
    obtenerTodas: async (req, res) => {
        try {
            const [filas] = await db.query('SELECT * FROM miniaturas');
            return res.status(200).json({
                status: 'success',
                total: filas.length,
                data: filas
            });
        } catch (error) {
            console.error('Error al consultar miniaturas:', error);
            return res.status(500).json({
                status: 'error',
                mensaje: 'Error interno del servidor al obtener miniaturas'
            });
        }
    },

    // 2. Obtener una por ID
    obtenerPorId: async (req, res) => {
        try {
            const { id } = req.params;
            const [filas] = await db.query('SELECT * FROM miniaturas WHERE id = ?', [id]);

            if (filas.length === 0) {
                return res.status(404).json({
                    status: 'error',
                    mensaje: 'Miniatura no encontrada'
                });
            }

            return res.status(200).json({
                status: 'success',
                data: filas[0]
            });
        } catch (error) {
            console.error('Error al obtener miniatura:', error);
            return res.status(500).json({
                status: 'error',
                mensaje: 'Error interno del servidor'
            });
        }
    },

    // 3. Crear nueva
    crear: async (req, res) => {
        try {
            const { nombre, grupo, faccion, edicion, peana, imagen } = req.body;

            if (!nombre || !grupo || !faccion || !edicion || !peana) {
                return res.status(400).json({
                    status: 'error',
                    mensaje: 'Faltan campos obligatorios'
                });
            }

            const sql = `
                INSERT INTO miniaturas (nombre, grupo, faccion, edicion, peana, imagen)
                VALUES (?, ?, ?, ?, ?, ?)
            `;
            const valores = [nombre, grupo, faccion, edicion, peana, imagen || 'default.jpg'];

            const [resultado] = await db.query(sql, valores);

            return res.status(201).json({
                status: 'success',
                mensaje: 'Miniatura creada correctamente',
                nuevoId: resultado.insertId
            });
        } catch (error) {
            console.error('Error al insertar miniatura:', error);
            return res.status(500).json({
                status: 'error',
                mensaje: 'Error interno al registrar la miniatura'
            });
        }
    },

    // 4. Eliminar por ID
    eliminar: async (req, res) => {
        try {
            const { id } = req.params;
            const [resultado] = await db.query('DELETE FROM miniaturas WHERE id = ?', [id]);

            if (resultado.affectedRows === 0) {
                return res.status(404).json({
                    status: 'error',
                    mensaje: 'No se encontró la miniatura para eliminar'
                });
            }

            return res.status(200).json({
                status: 'success',
                mensaje: `Miniatura con ID ${id} eliminada correctamente`
            });
        } catch (error) {
            console.error('Error al eliminar miniatura:', error);
            return res.status(500).json({
                status: 'error',
                mensaje: 'Error interno del servidor'
            });
        }
    }
};

module.exports = controladorMiniatura;