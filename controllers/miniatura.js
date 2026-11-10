'use strict';

const db = require('../models/db');

const controladorMiniatura = {
    
    // 1. Obtener miniaturas con filtros y paginación
    obtenerTodas: async (req, res) => {
        try {
            const filtros = req.query || {};

            // Validar los números de página y límite
            const leerEntero = (valor, predeterminado, maximo) => {
                if (valor === undefined) return predeterminado;

                if (typeof valor !== 'string' || !/^[1-9]\d*$/.test(valor)) {
                    return null;
                }

                const numero = Number(valor);

                return Number.isSafeInteger(numero) && numero <= maximo
                    ? numero
                    : null;
            };

            const pagina = leerEntero(filtros.pagina, 1, 1000000);
            const limite = leerEntero(filtros.limite, 500, 1000);

            if (pagina === null || limite === null) {
                return res.status(400).json({
                    status: 'error',
                    mensaje: 'pagina debe ser un entero entre 1 y 1000000; limite, entre 500 y 1000'
                });
            }

            const condiciones = [];
            const parametros = [];

            // Filtros por facción, edición y grupo
            for (const columna of ['faccion', 'edicion', 'grupo']) {
                const valor = filtros[columna];

                if (valor === undefined) continue;

                if (typeof valor !== 'string') {
                    return res.status(400).json({
                        status: 'error',
                        mensaje: `El filtro ${columna} debe ser texto`
                    });
                }

                const limpio = valor.trim();

                if (limpio) {
                    condiciones.push(`${columna} = ?`);
                    parametros.push(limpio);
                }
            }

            // Búsqueda parcial por nombre
            if (filtros.nombre !== undefined) {
                if (typeof filtros.nombre !== 'string') {
                    return res.status(400).json({
                        status: 'error',
                        mensaje: 'El filtro nombre debe ser texto'
                    });
                }

                const nombre = filtros.nombre.trim();

                if (nombre) {
                    condiciones.push('nombre LIKE ?');
                    parametros.push(`%${nombre}%`);
                }
            }

            // Construir las condiciones SQL
            const donde = condiciones.length
                ? ` WHERE ${condiciones.join(' AND ')}`
                : '';

            const desplazamiento = (pagina - 1) * limite;

            // Contar los resultados que cumplen los filtros
            const [conteo] = await db.query(
                `SELECT COUNT(*) AS total FROM miniaturas${donde}`,
                parametros
            );

            const total = Number(conteo[0].total);

            // Obtener solamente la página solicitada
            const [filas] = await db.query(
                `SELECT * FROM miniaturas${donde} ORDER BY id ASC LIMIT ? OFFSET ?`,
                [...parametros, limite, desplazamiento]
            );

            return res.status(200).json({
                status: 'success',
                total,
                pagina,
                limite,
                totalPaginas: Math.ceil(total / limite),
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
    },

    // 5. Actualizar miniatura existente
    actualizar: async (req, res) => {
        try {
            const { id } = req.params;
            const { nombre, grupo, faccion, edicion, peana, imagen } = req.body;

            // 1. Validar que la miniatura a editar exista
            const [existe] = await db.query('SELECT id FROM miniaturas WHERE id = ?', [id]);
            if (existe.length === 0) {
                return res.status(404).json({
                    status: 'error',
                    mensaje: `Miniatura con ID ${id} no encontrada`
                });
            }

            // 2. Validar que vengan los campos obligatorios
            if (!nombre || !grupo || !faccion || !edicion || !peana) {
                return res.status(400).json({
                    status: 'error',
                    mensaje: 'Faltan campos obligatorios para actualizar (nombre, grupo, faccion, edicion, peana)'
                });
            }

            // 3. Ejecutar UPDATE parametrizado
            const sql = `
                UPDATE miniaturas 
                SET nombre = ?, grupo = ?, faccion = ?, edicion = ?, peana = ?, imagen = ?
                WHERE id = ?
            `;
            await db.query(sql, [nombre, grupo, faccion, edicion, peana, imagen || 'default.jpg', id]);

            return res.status(200).json({
                status: 'success',
                mensaje: `Miniatura con ID ${id} actualizada correctamente`
            });

        } catch (error) {
            console.error('Error al actualizar miniatura:', error);
            return res.status(500).json({
                status: 'error',
                mensaje: 'Error interno al actualizar la miniatura'
            });
        }
    }
};

module.exports = controladorMiniatura;