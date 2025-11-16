# GYMETRA - Arquitectura del Sistema

## Resumen

GYMETRA es un sistema monolítico modular para la gestión de membresías de gimnasio. El sistema está organizado en módulos backend independientes (cada uno es una aplicación Spring Boot separada) que comparten una base de datos PostgreSQL común.

## Estilo Arquitectónico

### Arquitectura Monolítica Modular

El sistema sigue un patrón de **monolito modular** donde:

- **Módulos Independientes**: Cada módulo es una aplicación Spring Boot separada en su propia carpeta
- **Base de Datos Compartida**: Todos los módulos comparten la misma base de datos PostgreSQL
- **Comunicación Directa**: Los módulos se comunican mediante consultas directas a la base de datos compartida
- **Despliegue Independiente**: Cada módulo puede desplegarse en su propio puerto y contenedor

### Ventajas de este Enfoque

**Separación de Responsabilidades**: Cada módulo tiene un dominio de negocio específico  
**Desarrollo Paralelo**: Equipos pueden trabajar en módulos diferentes  
**Despliegue Flexible**: Cada módulo puede escalarse independientemente  
**Simplicidad**: No requiere service discovery ni API Gateway  
**Transacciones ACID**: Base de datos compartida garantiza consistencia

### Limitaciones

**Acoplamiento a BD**: Cambios en esquema afectan a todos los módulos  
**Escalabilidad**: La base de datos puede ser cuello de botella  
**Tecnología Única**: Todos los módulos deben usar la misma stack tecnológica

## Componentes del Sistema

### Capa de Presentación

```
┌─────────────────────────────────────────┐
│         Aplicaciones Frontend           │
├─────────────────────────────────────────┤
│  • Admin Frontend (Vue.js + Ionic)     │
│    Puerto: 8101                         │
│    Propósito: Panel administrativo      │
│                                         │
│  • Usuario Frontend (Ionic + Vue.js)   │
│    Puerto: 8100                         │
│    Propósito: App móvil/web para usuarios│
└─────────────────────────────────────────┘
```

### Capa de Aplicación (Backend)

```
┌─────────────────────────────────────────┐
│      Módulos Backend (Spring Boot)      │
├─────────────────────────────────────────┤
│                                         │
│  GYMETR-login (Puerto 8080)            │
│     • Autenticación y Autorización     │
│     • Gestión de Usuarios              │
│     • Gestión de Roles                 │
│     • Recuperación de Contraseña       │
│                                         │
│  GYMETR-Membership (Puerto 8081)      │
│     • Gestión de Planes de Membresía   │
│     • Gestión de Membresías de Usuario │
│     • Procesamiento de Pagos           │
│     • Generación de Reportes           │
│                                         │
│  GYMETRA - Qr (Puerto 8082)            │
│     • Generación de Códigos QR         │
│     • Validación de Acceso             │
│     • Registro de Accesos              │
│     • Control de Sucursales            │
│                                         │
│  GYMETRA (Base/Común)                  │
│     • Configuraciones compartidas       │
│     • Utilidades comunes               │
└─────────────────────────────────────────┘
```

### Capa de Datos

```
┌─────────────────────────────────────────┐
│         Base de Datos PostgreSQL        │
├─────────────────────────────────────────┤
│  Base de Datos: gymdb                   │
│  Puerto: 5000                           │
│                                         │
│  Módulos de Datos:                      │
│  • Security (user, role, user_role)     │
│  • Memberships (membership_plan,        │
│    user_membership)                     │
│  • Payments (payment)                   │
│  • Access Control (gym_branch,          │
│    access_log)                          │
└─────────────────────────────────────────┘
```

## Flujo de Datos

### Flujo General

```
Usuario/Admin
    │
    ├─► Frontend (Vue.js/Ionic)
    │       │
    │       ├─► GYMETR-login:8080 (Auth)
    │       ├─► GYMETR-Membership:8081 (Membresías)
    │       └─► GYMETRA - Qr:8082 (Acceso)
    │               │
    │               └─► PostgreSQL:5000
    │                   (Base de datos compartida)
```

### Ejemplo: Proceso de Acceso al Gimnasio

```
1. Usuario abre app y escanea QR
2. Frontend → GYMETRA - Qr:8082
   POST /api/access/validate-qr
   Headers: Authorization: Bearer <JWT>
3. GYMETRA - Qr valida token JWT
4. GYMETRA - Qr consulta PostgreSQL:
   - Verifica usuario en tabla 'user'
   - Verifica membresía activa en 'user_membership'
5. Si válido:
   - Registra acceso en 'access_log'
   - Retorna éxito
6. Frontend muestra confirmación
```

## Arquitectura de Red

### Red Docker

Todos los servicios están en la red `gymetra-net`:

```yaml
networks:
  gymetra-net:
    driver: bridge
```

### Puertos del Sistema

| Componente | Puerto Host | Puerto Contenedor | Propósito |
|------------|-------------|-------------------|-----------|
| Frontend Usuario | 8100 | 80 | App móvil/web |
| Frontend Admin | 8101 | - | Panel admin |
| GYMETR-login | 8080 | 8080 | Autenticación |
| GYMETR-Membership | 8081 | 8081 | Membresías |
| GYMETRA - Qr | 8082 | 8082 | Control de acceso |
| PostgreSQL | 5000 | 5432 | Base de datos |

## Seguridad

### Autenticación con JWT

- **Tokens JWT**: Autenticación stateless
- **Validación**: Cada módulo valida tokens independientemente
- **Expiración**: Tokens con tiempo de expiración configurable
- **Refresh Tokens**: Renovación sin requerir login

### Autorización con Roles

- **RBAC**: Control de acceso basado en roles
- **Roles**: `ADMIN` y `CLIENT`
- **Validación**: Spring Security con `@PreAuthorize`

### Seguridad de Datos

- **Contraseñas**: Hasheadas con BCrypt
- **Conexiones**: PostgreSQL con credenciales seguras
- **CORS**: Configurado para permitir solo orígenes específicos

## Stack Tecnológico

### Backend
- **Framework**: Spring Boot 3.x
- **Seguridad**: Spring Security + JWT
- **Persistencia**: Spring Data JPA / Hibernate
- **Base de Datos**: PostgreSQL 15
- **Documentación**: OpenAPI/Swagger

### Frontend
- **Framework**: Vue.js 3
- **UI Framework**: Ionic
- **Lenguaje**: TypeScript
- **Build Tool**: Vite

### Infraestructura
- **Containerización**: Docker
- **Orquestación**: Docker Compose
- **Control de Versiones**: Git + GitFlow
- **CI/CD**: Jenkins (configurado)

## Estructura del Proyecto

```
GYMETRA-V1/
├── backend/
│   ├── GYMETR-login/          # Módulo de Autenticación
│   │   ├── src/main/java/
│   │   │   └── com/login/GYMETRA/
│   │   │       ├── controller/    # Controladores REST
│   │   │       ├── service/       # Lógica de negocio
│   │   │       ├── repository/    # Acceso a datos
│   │   │       ├── entity/       # Entidades JPA
│   │   │       ├── dto/          # Data Transfer Objects
│   │   │       └── security/     # Configuración de seguridad
│   │   ├── pom.xml
│   │   └── Dockerfile
│   │
│   ├── GYMETR-Membership/      # Módulo de Membresías
│   │   ├── src/main/java/
│   │   │   └── com/Membership/GYMETRA/
│   │   │       ├── controller/
│   │   │       ├── service/
│   │   │       ├── repository/
│   │   │       └── entity/
│   │   ├── pom.xml
│   │   └── mvnw
│   │
│   ├── GYMETRA - Qr/          # Módulo de Control de Acceso
│   │   ├── src/main/java/
│   │   │   └── com/GYMETRA/GYMETRA/qr/
│   │   │       ├── controller/
│   │   │       ├── service/
│   │   │       ├── repository/
│   │   │       └── entity/
│   │   ├── pom.xml
│   │   └── mvnw
│   │
│   └── GYMETRA/               # Módulo Base/Común
│       └── src/main/java/
│
├── frontend/
│   ├── admin-frontend/        # Frontend Administrativo
│   └── gymetra-frontend/      # Frontend Usuario
│
├── data/
│   └── Database-Setup/        # Scripts SQL
│
├── doc/
│   ├── architecture/         # Documentación arquitectónica
│   ├── diagrams/             # Diagramas UML
│   └── environments/         # Configuración de ambientes
│
└── docker-compose.yml        # Orquestación de contenedores
```

## Comunicación Entre Módulos

### Patrón Actual: Base de Datos Compartida

Los módulos **NO se comunican directamente** entre sí. En su lugar:

1. **Consulta Directa a BD**: Cada módulo consulta directamente las tablas que necesita
2. **Sin Llamadas HTTP**: No hay comunicación HTTP entre módulos
3. **Transacciones ACID**: La base de datos compartida garantiza consistencia

### Ejemplo: Validación de Membresía

```
Módulo QR necesita verificar membresía activa:

1. GYMETRA - Qr recibe request de validación
2. Consulta directamente tabla 'user_membership' en PostgreSQL
3. Verifica: status = 'ACTIVE' AND end_date > NOW()
4. Retorna resultado
```

### Ventajas de este Enfoque

- Simplicidad: No requiere configuración de comunicación
- Consistencia: Transacciones ACID garantizadas
- Performance: Consultas directas son rápidas

### Desventajas

- Acoplamiento: Cambios en esquema afectan a todos
- Escalabilidad: Base de datos puede ser limitante

## Escalabilidad

### Escalado Horizontal

Cada módulo puede escalarse independientemente:

```yaml
# Ejemplo: Escalar módulo de login
services:
  backend-login:
    deploy:
      replicas: 3
```

### Optimizaciones

- **Connection Pooling**: HikariCP para conexiones a BD
- **Índices**: Índices en tablas para mejorar consultas
- **Caché**: (Futuro) Redis para datos frecuentemente consultados

## Referencias

- [Módulos Backend](./02-BACKEND-MODULES.md)
- [Modelo de Datos](./03-DATA-MODEL.md)
- [Diagramas de Arquitectura](../diagrams/)

---

**Última actualización**: Noviembre 2025
