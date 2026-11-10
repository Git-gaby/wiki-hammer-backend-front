
-- =========================================
-- BASE DE DATOS: WARHAMMER WIKI
-- =========================================

CREATE DATABASE IF NOT EXISTS warhammer_wiki
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE warhammer_wiki;

-- =========================================
-- TABLA: USUARIOS
-- =========================================

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol ENUM('admin', 'usuario') DEFAULT 'usuario'
);

-- =========================================
-- TABLA: MINIATURAS
-- =========================================

CREATE TABLE IF NOT EXISTS miniaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    grupo VARCHAR(100) NOT NULL,
    faccion VARCHAR(100) NOT NULL,
    edicion VARCHAR(50) NOT NULL,
    peana VARCHAR(50) NOT NULL,
    imagen VARCHAR(255) DEFAULT 'default.jpg',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);