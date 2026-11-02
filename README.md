# 📜 Tablón de Misiones del Gremio: Proyecto Wiki-Hammer

## 🛡️ Rango C: Cimientos y Saneamiento (Base de Datos & Seguridad)

> Misiones obligatorias antes de construir la interfaz o desplegar.

### - [ ] Misión 1: El Manuscrito de Creación (Script SQL)

- **Encargado sugerido:** Constructor de BD (Jero).
- **Objetivo:** Escribir el script SQL definitivo (`schema.sql`) para importar en MariaDB/phpMyAdmin. Debe contener:
  - Tabla `usuarios` con columnas: `id` (AUTO_INCREMENT), `nombre`, `email` (UNIQUE), `password` (VARCHAR 255 para el hash) y `rol` (`ENUM('admin', 'usuario') DEFAULT 'usuario'`).
  - Tabla `miniaturas` con columnas: `id`, `nombre`, `grupo`, `faccion`, `edicion`, `peana`, `imagen` y marcas de tiempo (`created_at`).
- **Condición de victoria:** Ejecutar el archivo en phpMyAdmin sin errores de sintaxis y con un usuario admin insertado de prueba.

### - [X] Misión 2: El Búnker del Tecnosacerdote (Variables de Entorno)

- **Encargado sugerido:** Backend (Gabriel).
- **Objetivo:** Desterrar contraseñas quemadas y claves secretas del código fuente instalando `dotenv`.
- **Condición de victoria:** Crear el archivo `.env` (ignorado en Git) y un `.env.example` en el repositorio. `CLAVE_SECRETA` y las credenciales de MariaDB deben leerse exclusivamente desde `process.env`.

### - [X] Misión 3: El Sello Inquisitorial (Roles y Permisos)

- **Encargado sugerido:** Backend (Gabriel).
- **Objetivo:** Crear el middleware `esAdmin.js` que verifique si `req.usuario.rol === 'admin'`. Proteger la ruta `DELETE /api/miniaturas/:id` para que solo admins puedan purgar registros.
- **Condición de victoria:** Un usuario con rol `usuario` recibe `403 Forbidden` al intentar borrar una miniatura en Postman; un admin recibe `200 OK`.

---

## ⚔️ Rango B: Arsenal del Backend (Completar la API REST)

> Misiones para dejar el motor de datos 100% operativo.

### - [X] Misión 4: El Taller de Modificaciones (Endpoint PUT)

- **Encargado sugerido:** Backend / Colaborativo.
- **Objetivo:** Implementar la actualización de miniaturas (`PUT /api/miniaturas/:id`) para corregir nombres, peanas o facciones sin tener que eliminarlas.
- **Condición de victoria:** Modificar un registro existente desde Postman y verificar que MariaDB actualice los campos correctos.

### - [ ] Misión 5: Los Sensores del Augur (Filtros de Búsqueda y Paginación)

- **Encargado sugerido:** Backend / Colaborativo.
- **Objetivo:** Permitir que `GET /api/miniaturas` reciba parámetros de consulta (`?faccion=Imperio&edicion=10ma`) para filtrar resultados dinámicamente.
- **Condición de victoria:** Consultar en Postman con filtros y recibir solo las miniaturas que coincidan con los criterios.

### - [ ] Misión 6: Las Crónicas del Escriba (Documentación de la API)

- **Encargado sugerido:** Ambos aventureros.
- **Objetivo:** Crear el archivo `README.md` con las instrucciones de instalación local (`npm install`, configuración de base de datos) y la tabla con todos los endpoints, métodos y ejemplos de JSON.
- **Condición de victoria:** Cualquier persona ajena al proyecto puede clonar el repo y levantar el backend siguiendo solo ese archivo.

---

## 🎨 Rango A: La Fachada Imperial (Desarrollo Frontend)

> Misiones de interfaz de usuario para que la wiki cobre vida.

### - [ ] Misión 7: La Puerta de Entrada (Estructura Base y Autenticación)

- **Encargado sugerido:** Frontend (Gabriel).
- **Objetivo:** Inicializar la aplicación web (Angular u otra alternativa moderna), configurar el enrutamiento y crear los formularios de Registro e Inicio de Sesión. Guardar el token devuelto en `localStorage`.
- **Condición de victoria:** Iniciar sesión desde el navegador, almacenar el token y redirigir automáticamente a la vista de la galería.

### - [ ] Misión 8: El Gran Códex Visual (Galería de Miniaturas)

- **Encargado sugerido:** Frontend (Gabriel).
- **Objetivo:** Diseñar la vista principal con tarjetas visuales (*cards*) para cada miniatura (mostrando imagen, nombre, facción y tamaño de peana) y una barra de búsqueda con filtros por facción.
- **Condición de victoria:** La página consume `GET /api/miniaturas` y renderiza las miniaturas dinámicamente.

### - [ ] Misión 9: La Forja de Reliquias (Panel de Administración)

- **Encargado sugerido:** Frontend (Gabriel).
- **Objetivo:** Crear la interfaz para agregar nuevas miniaturas (`POST`) y editarlas (`PUT`). Si el usuario logueado es admin, mostrar además el botón de eliminar miniatura con confirmación.
- **Condición de victoria:** Un administrador puede crear, editar y borrar miniaturas directamente desde la interfaz web sin tocar Postman.