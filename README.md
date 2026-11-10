# ⚔️ WikiHammer 40,000 - Códex y Archivos Imperiales

Plataforma web full-stack para el registro, catalogación, filtrado y administración del arsenal de miniaturas de Warhammer 40,000. El proyecto implementa una arquitectura desacoplada basada en una API REST construida con Node.js/Express, persistencia relacional en MariaDB/MySQL y una interfaz reactiva e inmersiva desarrollada en Angular.

# 📜 Tablón de Misiones del Gremio: Proyecto Wiki-Hammer

## 🛡️ Rango C: Cimientos y Saneamiento (Base de Datos & Seguridad)

> Misiones obligatorias antes de construir la interfaz o desplegar.

### - [x] Misión 1: El Manuscrito de Creación (Script SQL)

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

### - [X] Misión 5: Los Sensores del Augur (Filtros de Búsqueda y Paginación)

- **Encargado sugerido:** Backend / Colaborativo.
- **Objetivo:** Permitir que `GET /api/miniaturas` reciba parámetros de consulta (`?faccion=Imperio&edicion=10ma`) para filtrar resultados dinámicamente.
- **Condición de victoria:** Consultar en Postman con filtros y recibir solo las miniaturas que coincidan con los criterios.

### - [X] Misión 6: Las Crónicas del Escriba (Documentación de la API)

- **Encargado sugerido:** Ambos aventureros.
- **Objetivo:** Crear el archivo `README.md` con las instrucciones de instalación local (`npm install`, configuración de base de datos) y la tabla con todos los endpoints, métodos y ejemplos de JSON.
- **Condición de victoria:** Cualquier persona ajena al proyecto puede clonar el repo y levantar el backend siguiendo solo ese archivo.

---

## 🎨 Rango A: La Fachada Imperial (Desarrollo Frontend)

> Misiones de interfaz de usuario para que la wiki cobre vida.

### - [X] Misión 7: La Puerta de Entrada (Estructura Base y Autenticación)

- **Encargado sugerido:** Frontend (Gabriel).
- **Objetivo:** Inicializar la aplicación web (Angular u otra alternativa moderna), configurar el enrutamiento y crear los formularios de Registro e Inicio de Sesión. Guardar el token devuelto en `localStorage`.
- **Condición de victoria:** Iniciar sesión desde el navegador, almacenar el token y redirigir automáticamente a la vista de la galería.

### - [X] Misión 8: El Gran Códex Visual (Galería de Miniaturas)

- **Encargado sugerido:** Frontend (Gabriel).
- **Objetivo:** Diseñar la vista principal con tarjetas visuales (*cards*) para cada miniatura (mostrando imagen, nombre, facción y tamaño de peana) y una barra de búsqueda con filtros por facción.
- **Condición de victoria:** La página consume `GET /api/miniaturas` y renderiza las miniaturas dinámicamente.

### - [X] Misión 9: La Forja de Reliquias (Panel de Administración)

- **Encargado sugerido:** Frontend (Gabriel).
- **Objetivo:** Crear la interfaz para agregar nuevas miniaturas (`POST`) y editarlas (`PUT`). Si el usuario logueado es admin, mostrar además el botón de eliminar miniatura con confirmación.
- **Condición de victoria:** Un administrador puede crear, editar y borrar miniaturas directamente desde la interfaz web sin tocar Postman.


---
## 🏛️ Arquitectura del Sistema

* **Backend:** Node.js, Express.js.
* **Autenticación y Seguridad:** JWT (`jwt-simple`), hashing de contraseñas (`bcrypt`), Control de Acceso Basado en Roles (RBAC - `admin` y `usuario`).
* **Persistencia de Datos:** MariaDB / MySQL (`mysql2` con soporte de Promises).
* **Frontend:** Angular 17+ (Componentes Standalone, RxJS, HttpClient, formularios reactivos/plantilla).
* **Seguridad en Rutas (Guards):** Implementación de `CanActivateFn`:
  * `authGuard`: Protege `/home`, impidiendo el acceso a usuarios no autenticados y redirigiendo a `/login`.
  * `loginGuard`: Redirige a usuarios ya autenticados directo a `/home` si intentan acceder a `/login`.
* **Estilos:** Interfaz gótica imperial tematizada con paleta de colores de la Inquisición y tipografía Cinzel.

---

## ⚙️ Estructura del Repositorio

```text
├── controllers/          # Controladores de lógica de negocio (miniaturas, usuarios)
├── database/             # Esquemas DDL y scripts de población (.sql)
├── helpers/              # Funciones auxiliares (firmas JWT, validadores)
├── middlewares/          # Guardias de autenticación y autorización (autenticar, esAdmin)
├── models/               # Conexión al pool de base de datos (db.js)
├── public/               # Archivos estáticos
│   └── miniaturas/       # Galería de imágenes servidas por Express
├── routes/               # Enrutadores de la API REST (miniatura.js, usuarios.js)
├── frontend/             # Aplicación cliente en Angular (SPA)
│   ├── src/app/
│   │   ├── components/   # Vistas principales (Login, Registro, Home/Códex)
│   │   ├── models/       # Interfaces y contratos de datos en TypeScript
│   │   └── services/     # Servicios HTTP reactivos (AuthService, MiniaturasService)
├── .env.example          # Plantilla de variables de entorno requeridas
├── applications.js       # Configuración central de middlewares y rutas de Express
├── index.js              # Punto de entrada y arranque del servidor HTTP
└── package.json          # Dependencias y scripts del backend
```

---

## 🚀 Guía de Instalación y Despliegue Local

### 1. Requisitos Previos

* Node.js (versión 18 o superior).
* XAMPP (o un servidor MariaDB/MySQL local activo en el puerto 3306).
* Angular CLI instalado globalmente:

```bash
npm install -g @angular/cli
```

### 2. Clonar el Repositorio

```bash
git clone https://github.com/Git-gaby/wiki-hammer-backend-front.git
cd wiki-hammer-backend-front
```

### 3. Configuración de la Base de Datos

1. Inicie los servicios de **Apache** y **MySQL** en el panel de control de XAMPP.
2. Ingrese a phpMyAdmin (`http://localhost/phpmyadmin`).
3. Cree una nueva base de datos llamada `warhammer_wiki` con cotejamiento `utf8mb4_unicode_ci`.
4. Importe el archivo `schema.sql` (ubicado en la raíz o en `database/`) para crear las tablas `usuarios` y `miniaturas`.
5. *(Opcional)* Si desea poblar el catálogo con los archivos de `public/miniaturas`, ejecute:

```bash
node seed_miniaturas.js
```

### 4. Configurar Variables de Entorno

Cree un archivo `.env` en la raíz del proyecto basándose en `.env.example`:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=warhammer_wiki
DB_PORT=3306

# Seguridad
JWT_SECRET=clave_secreta_warhammer_2026
```

### 5. Instalar y Levantar el Servidor Backend

```bash
# Instalar dependencias del backend
npm install

# Iniciar el servidor (escuchando por defecto en el puerto 2508)
node applications.js
```

### 6. Instalar y Levantar el Cliente Frontend (Angular)

Abra una nueva terminal en paralelo:

```bash
cd frontend

# Instalar dependencias del cliente
npm install

# Iniciar servidor de desarrollo
ng serve
```

La aplicación web quedará disponible en el navegador en: **http://localhost:4200**.

---

## 🛡️ Asignación de Permisos de Administrador (CLI)

Para promover a un usuario existente al rol `admin` y desbloquear la Forja de Reliquias:

```bash
# Desde la raíz del backend:
node promote.js <email_o_nombre_usuario>
```

---

## 📡 Catálogo y Documentación de la API REST

**URL Base:** `http://localhost:2508/api`

### 1. Autenticación y Usuarios

| Método | Endpoint    | Acceso  | Descripción                                                              |
| ------ | ----------- | ------- | ------------------------------------------------------------------------ |
| `POST` | `/registro` | Público | Registra un nuevo usuario en MariaDB (contraseña encriptada con bcrypt). |
| `POST` | `/login`    | Público | Autentica credenciales y emite el token JWT.                             |

#### Ejemplo: Registro (`POST /api/registro`)

**Body (JSON):**

```json
{
  "nombre": "Gabriel Custodio",
  "email": "gabriel@terra.com",
  "password": "PasswordSegura123"
}
```

**Respuesta exitosa (201 Created):**

```json
{
  "status": "success",
  "mensaje": "Usuario registrado exitosamente"
}
```

#### Ejemplo: Login (`POST /api/login`)

**Body (JSON):**

```json
{
  "email": "gabriel@terra.com",
  "password": "PasswordSegura123"
}
```

**Respuesta exitosa (200 OK):**

```json
{
  "status": "success",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "usuario": {
    "id": 1,
    "nombre": "Gabriel Custodio",
    "email": "gabriel@terra.com",
    "rol": "admin"
  }
}
```

### 2. Gestión de Miniaturas (El Gran Códex)

| Método   | Endpoint          | Acceso  | Headers requeridos         | Descripción                                          |
| -------- | ----------------- | ------- | -------------------------- | ---------------------------------------------------- |
| `GET`    | `/miniaturas`     | Público | Ninguno                    | Obtiene el catálogo paginado con soporte de filtros. |
| `GET`    | `/miniaturas/:id` | Público | Ninguno                    | Obtiene el detalle de una miniatura específica.      |
| `POST`   | `/miniaturas`     | Admin   | `Authorization: <token>`   | Consagra y registra una nueva miniatura en la base de datos. |
| `PUT`    | `/miniaturas/:id` | Admin   | `Authorization: <token>`   | Modifica los datos de una miniatura existente.       |
| `DELETE` | `/miniaturas/:id` | Admin   | `Authorization: <token>`   | Purga permanentemente una miniatura del registro.    |

#### Consulta con Filtros y Paginación (`GET /api/miniaturas`)

Parámetros de consulta opcionales:

* `faccion`: Filtra por facción exacta (ej. `?faccion=Adepta Sororitas`).
* `grupo`: Filtra por bloque (`Imperium`, `Chaos`, `Xenos`).
* `edicion`: Filtra por versión del reglamento (ej. `?edicion=10th`).
* `nombre`: Búsqueda parcial difusa (ej. `?nombre=Captain`).
* `pagina`: Número de página solicitada (por defecto `1`).
* `limite`: Cantidad de registros devueltos (por defecto `500`).

**Respuesta exitosa (200 OK):**

```json
{
  "status": "success",
  "total": 216,
  "pagina": 1,
  "limite": 500,
  "totalPaginas": 1,
  "data": [
    {
      "id": 1,
      "nombre": "Anchorite",
      "grupo": "Imperium",
      "faccion": "Adepta Sororitas",
      "edicion": "10th",
      "peana": "32mm",
      "imagen": "adepta_sororitas__anchorite.jpg",
      "created_at": "2026-11-10T09:00:00.000Z"
    }
  ]
}
```

#### Crear Miniatura (`POST /api/miniaturas`)

**Headers:**

```text
Authorization: <JWT_TOKEN>
Content-Type: application/json
```

**Body (JSON):**

```json
{
  "nombre": "Trajann Valoris",
  "grupo": "Imperium",
  "faccion": "Adeptus Custodes",
  "edicion": "10th",
  "peana": "40mm",
  "imagen": "adeptus_custodes__trajann_valoris.jpg"
}
```

**Respuesta exitosa (201 Created):**

```json
{
  "status": "success",
  "mensaje": "Miniatura creada correctamente",
  "nuevoId": 217
}
```

#### Actualizar Miniatura (`PUT /api/miniaturas/:id`)

**Headers:**

```text
Authorization: <JWT_TOKEN>
Content-Type: application/json
```

**Body (JSON):**

```json
{
  "nombre": "Trajann Valoris - Capitán General",
  "grupo": "Imperium",
  "faccion": "Adeptus Custodes",
  "edicion": "10th",
  "peana": "50mm",
  "imagen": "adeptus_custodes__trajann_valoris.jpg"
}
```

**Respuesta exitosa (200 OK):**

```json
{
  "status": "success",
  "mensaje": "Miniatura con ID 217 actualizada correctamente"
}
```

#### Purgar Miniatura (`DELETE /api/miniaturas/:id`)

**Headers:**

```text
Authorization: <JWT_TOKEN>
```

**Respuesta exitosa (200 OK):**

```json
{
  "status": "success",
  "mensaje": "Miniatura con ID 217 eliminada correctamente"
}
```

---

## 👥 Desarrolladores del Proyecto

* **Gabriel Jaime Gómez Restrepo** - Backend, Frontend, Integración de Seguridad y Códex Visual
* **Jerónimo** - Backend, Arquitectura de Base de Datos y Catalogación Inicial
