// scripts/crearAdmin.js
'use strict';

require('dotenv').config();
const bcrypt = require('bcrypt');
const db = require('../models/db');

const [,, nombre, email, password] = process.argv;

if (!nombre || !email || !password) {
    console.log('Uso: node scripts/crearAdmin.js <nombre> <email> <password>');
    process.exit(1);
}

async function crear() {
    try {
        const hash = await bcrypt.hash(password, 10);
        await db.query(
            'INSERT INTO usuarios (nombre, email, password, rol) VALUES (?, ?, ?, "admin")',
            [nombre, email, hash]
        );
        console.log(`✅ Administrador "${nombre}" (${email}) creado exitosamente.`);
        process.exit(0);
    } catch (err) {
        console.error('❌ Error al crear admin:', err.message);
        process.exit(1);
    }
}

crear();