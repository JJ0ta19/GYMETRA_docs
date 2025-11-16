# GYMETRA - Módulos Backend

## Resumen

Este documento describe en detalle cada módulo backend del sistema GYMETRA, incluyendo sus responsabilidades, endpoints principales, y estructura interna.

## Organización de Módulos

Cada módulo es una **aplicación Spring Boot independiente** ubicada en su propia carpeta dentro de `backend/`. Todos los módulos comparten la misma base de datos PostgreSQL pero operan de forma independiente.

## Módulos del Sistema

### 1. GYMETR-login (Módulo de Autenticación)

**Ubicación**: `backend/GYMETR-login/`  
**Puerto**: `8080`  
**Responsabilidad**: Autenticación, autorización y gestión de usuarios

#### Funcionalidades

- Registro de nuevos usuarios
- Inicio de sesión (Login)
- Generación y validación de tokens JWT
- Refresco de tokens
- Gestión de perfiles de usuario
- Recuperación de contraseña
- Gestión de roles (ADMIN, CLIENT)

#### Endpoints Principales

```
POST   /api/auth/register          # Registro de usuario
POST   /api/auth/login             # Inicio de sesión
POST   /api/auth/refresh           # Refresco de token
GET    /api/auth/profile           # Obtener perfil del usuario
PUT    /api/auth/profile           # Actualizar perfil
POST   /api/auth/password/recover  # Recuperar contraseña
GET    /api/users                  # Listar usuarios (Admin)
GET    /api/users/{id}             # Obtener usuario por ID
PUT    /api/users/{id}             # Actualizar usuario
DELETE /api/users/{id}             # Eliminar usuario (soft delete)
GET    /api/roles                  # Listar roles
POST   /api/roles                  # Crear rol (Admin)
```

#### Estructura Interna

```
com.login.GYMETRA/
├── controller/
│   ├── AuthController.java           # Endpoints de autenticación
│   ├── PasswordResetController.java   # Recuperación de contraseña
│   └── RoleController.java            # Gestión de roles
├── service/
│   ├── UserService.java              # Lógica de usuarios
│   ├── RoleService.java              # Lógica de roles
│   ├── PasswordResetService.java     # Lógica de recuperación
│   └── EmailService.java             # Envío de emails
├── repository/
│   ├── UserRepository.java
│   ├── RoleRepository.java
│   └── UserRoleRepository.java
├── entity/
│   ├── User.java
│   ├── Role.java
│   └── UserRole.java
├── security/
│   ├── JwtService.java               # Generación/validación JWT
│   └── JwtAuthFilter.java           # Filtro de autenticación
└── config/
    ├── SecurityConfig.java           # Configuración Spring Security
    └── OpenApiConfig.java            # Configuración Swagger
```

#### Tablas de Base de Datos

- `user`: Usuarios del sistema
- `role`: Roles disponibles
- `user_role`: Relación usuario-rol
- `password_reset_token`: Tokens de recuperación

#### Swagger UI

Acceso: `http://localhost:8080/swagger-ui.html`

---

### 2. GYMETR-Membership (Módulo de Membresías)

**Ubicación**: `backend/GYMETR-Membership/`  
**Puerto**: `8081`  
**Responsabilidad**: Gestión de planes de membresía, membresías de usuarios y pagos

#### Funcionalidades

- Gestión de planes de membresía (CRUD)
- Asignación de membresías a usuarios
- Renovación de membresías
- Suspensión/Activación de membresías
- Consulta de membresías activas
- Procesamiento de pagos (integración Stripe)
- Generación de reportes de ingresos
- Generación de reportes de asistencia

#### Endpoints Principales

```
# Planes de Membresía
GET    /api/memberships/plans           # Listar todos los planes
GET    /api/memberships/plans/{id}      # Obtener plan por ID
POST   /api/memberships/plans           # Crear nuevo plan (Admin)
PUT    /api/memberships/plans/{id}      # Actualizar plan (Admin)
DELETE /api/memberships/plans/{id}     # Eliminar plan (Admin)

# Membresías de Usuario
GET    /api/memberships                 # Listar membresías (con filtros)
GET    /api/memberships/{id}            # Obtener membresía por ID
POST   /api/memberships                 # Crear nueva membresía
PUT    /api/memberships/{id}            # Actualizar membresía
GET    /api/memberships/user/{userId}   # Membresías de un usuario
GET    /api/memberships/active/{userId} # Membresía activa de un usuario

# Pagos
POST   /api/payments                    # Procesar pago
GET    /api/payments                    # Listar pagos
GET    /api/payments/{id}               # Obtener pago por ID

# Reportes
GET    /api/reports/revenue             # Reporte de ingresos
GET    /api/reports/attendance          # Reporte de asistencia
```

#### Estructura Interna

```
com.Membership.GYMETRA/
├── controller/
│   ├── MembershipController.java       # Endpoints de planes
│   ├── UserMembershipController.java   # Endpoints de membresías
│   ├── PaymentController.java          # Endpoints de pagos
│   └── DiagnosticController.java       # Diagnósticos
├── service/
│   ├── MembershipService.java          # Lógica de planes
│   ├── UserMembershipService.java     # Lógica de membresías
│   ├── PaymentService.java            # Lógica de pagos
│   └── StripePaymentService.java      # Integración Stripe
├── repository/
│   ├── MembershipRepository.java
│   ├── UserMembershipRepository.java
│   └── PaymentRepository.java
├── entity/
│   ├── Membership.java                 # Plan de membresía
│   ├── UserMembership.java            # Membresía de usuario
│   └── Payment.java                    # Pago
└── client/
    └── UserMembershipClient.java      # Cliente para otros módulos
```

#### Tablas de Base de Datos

- `membership_plan`: Planes de membresía disponibles
- `user_membership`: Membresías asignadas a usuarios
- `payment`: Registro de pagos

#### Integraciones

- **Stripe**: Procesamiento de pagos con tarjeta
- **Email Service**: Notificaciones de membresías

#### Swagger UI

Acceso: `http://localhost:8081/swagger-ui.html`

---

### 3. GYMETRA - Qr (Módulo de Control de Acceso)

**Ubicación**: `backend/GYMETRA - Qr/`  
**Puerto**: `8082`  
**Responsabilidad**: Validación de códigos QR y control de acceso al gimnasio

#### Funcionalidades

- Generación de códigos QR para usuarios
- Validación de códigos QR en tiempo real
- Registro de accesos al gimnasio
- Historial de accesos
- Validación de membresías activas
- Control de capacidad del gimnasio
- Gestión de sucursales

#### Endpoints Principales

```
# Generación de QR
GET    /api/qr/generate/{userId}        # Generar código QR para usuario
GET    /api/qr/{userId}                 # Obtener código QR del usuario

# Validación de Acceso
POST   /api/access/validate             # Validar código QR y permitir acceso
POST   /api/access/validate-qr          # Validar QR (alternativo)

# Historial
GET    /api/access/history              # Historial de accesos (con filtros)
GET    /api/access/history/{userId}     # Historial de un usuario específico
GET    /api/access/history/branch/{branchId}  # Historial por sucursal

# Sucursales
GET    /api/branches                    # Listar sucursales
GET    /api/branches/{id}               # Obtener sucursal por ID
POST   /api/branches                    # Crear sucursal (Admin)
PUT    /api/branches/{id}               # Actualizar sucursal (Admin)

# Estadísticas
GET    /api/access/stats                # Estadísticas de acceso
GET    /api/access/capacity             # Capacidad actual del gimnasio
```

#### Estructura Interna

```
com.GYMETRA.GYMETRA.qr/
├── controller/
│   ├── QrAccessController.java         # Validación de acceso
│   ├── AccessLogController.java        # Historial de accesos
│   ├── BranchController.java           # Gestión de sucursales
│   └── QrJwtController.java            # Endpoints con JWT
├── service/
│   ├── QrAccessService.java            # Lógica de QR
│   ├── QrBusinessService.java          # Reglas de negocio
│   ├── AccessLogService.java           # Lógica de logs
│   ├── AccessLogBusinessService.java   # Reglas de negocio de logs
│   └── BranchService.java              # Lógica de sucursales
├── repository/
│   ├── QrAccessRepository.java
│   ├── AccessLogRepository.java
│   └── BranchRepository.java
└── entity/
    ├── QrAccess.java                   # Código QR
    ├── AccessLog.java                  # Registro de acceso
    └── Branch.java                     # Sucursal del gimnasio
```

#### Tablas de Base de Datos

- `gym_branch`: Sucursales del gimnasio
- `access_log`: Registro de accesos
- `qr_access`: Códigos QR generados

#### Flujo de Validación

```
1. Usuario escanea QR en el gimnasio
2. Frontend envía QR + token JWT al módulo
3. Módulo valida:
   - Token JWT válido
   - QR válido y no expirado
   - Usuario tiene membresía activa (consulta 'user_membership')
   - Capacidad del gimnasio disponible
4. Si todo es válido:
   - Registra acceso en 'access_log'
   - Retorna éxito
5. Si algo falla:
   - Retorna error específico
```

#### Swagger UI

Acceso: `http://localhost:8082/swagger-ui.html`

---

### 4. GYMETRA (Módulo Base)

**Ubicación**: `backend/GYMETRA/`  
**Estado**: Módulo base/común (puede contener utilidades compartidas)

#### Propósito

- Configuraciones compartidas
- Utilidades comunes
- Clases base

---

## Comunicación Entre Módulos

### Patrón: Base de Datos Compartida

Los módulos **NO se comunican mediante HTTP**. En su lugar:

1. **Consulta Directa**: Cada módulo consulta directamente las tablas que necesita
2. **Sin Llamadas Inter-Módulo**: No hay comunicación HTTP entre módulos
3. **Transacciones**: La base de datos compartida garantiza consistencia ACID

### Ejemplo: Validación de Membresía

```
Módulo QR necesita verificar membresía activa:

1. GYMETRA - Qr recibe request de validación
2. Consulta directamente tabla 'user_membership' en PostgreSQL
3. Verifica: status = 'ACTIVE' AND end_date > NOW()
4. Retorna resultado
```

### Ventajas

- Simplicidad: No requiere configuración de comunicación
- Consistencia: Transacciones ACID garantizadas
- Performance: Consultas directas son rápidas

## Autenticación y Autorización

### JWT en Todos los Módulos

Cada módulo valida tokens JWT independientemente:

```java
// Ejemplo en cualquier módulo
@PreAuthorize("hasRole('ADMIN')")
@GetMapping("/api/resource")
public ResponseEntity<?> getResource() {
    // Solo ADMIN puede acceder
}
```

### Roles del Sistema

- **ADMIN**: Acceso completo a todas las funcionalidades
- **CLIENT**: Acceso a su perfil, membresías y QR

## Dependencias

### Dependencias de Base de Datos

Todos los módulos dependen de las mismas tablas:

- `user`, `role`, `user_role` → Usado por todos
- `membership_plan`, `user_membership` → Usado por Membership y QR
- `payment` → Usado por Membership
- `gym_branch`, `access_log` → Usado por QR

### Dependencias de Aplicación

Cada módulo es independiente en términos de despliegue, pero comparten:

- Base de datos PostgreSQL
- Esquema de datos común
- Convenciones de seguridad (JWT)

## Referencias

- [Arquitectura del Sistema](./01-SYSTEM-ARCHITECTURE.md)
- [Modelo de Datos](./03-DATA-MODEL.md)
- [Diagramas de Secuencia](../diagrams/secuence/)

---

**Última actualización**: Noviembre 2025
