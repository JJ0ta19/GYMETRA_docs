# GYMETRA - Documentación Arquitectónica

## Índice

Esta carpeta contiene la documentación arquitectónica completa del sistema GYMETRA. La documentación está organizada en los siguientes documentos:

### Documentos Principales

1. **[01-SYSTEM-ARCHITECTURE.md](./01-SYSTEM-ARCHITECTURE.md)**
   - Visión general de la arquitectura
   - Estilo arquitectónico (Monolito Modular)
   - Componentes principales
   - Flujos de datos
   - Stack tecnológico

2. **[02-BACKEND-MODULES.md](./02-BACKEND-MODULES.md)**
   - Descripción detallada de cada módulo backend
   - Responsabilidades y funcionalidades
   - Endpoints principales
   - Estructura interna de cada módulo

3. **[03-DATA-MODEL.md](./03-DATA-MODEL.md)**
   - Modelo de datos completo
   - Todas las tablas y relaciones
   - Convenciones de nomenclatura
   - Consultas frecuentes

## Propósito

Esta documentación tiene como objetivo:

- **Para Desarrolladores**: Entender la estructura y diseño del sistema
- **Para Arquitectos**: Revisar decisiones arquitectónicas y patrones
- **Para Nuevos Miembros**: Onboarding rápido al proyecto
- **Para Documentación**: Referencia técnica del sistema

## Arquitectura del Sistema

GYMETRA es un **sistema monolítico modular** donde:

- Cada módulo es una aplicación Spring Boot independiente
- Todos los módulos comparten la misma base de datos PostgreSQL
- Los módulos se comunican mediante consultas directas a la base de datos
- Cada módulo puede desplegarse en su propio puerto

### Módulos Backend

| Módulo | Puerto | Responsabilidad |
|--------|--------|-----------------|
| GYMETR-login | 8080 | Autenticación y gestión de usuarios |
| GYMETR-Membership | 8081 | Gestión de membresías y pagos |
| GYMETRA - Qr | 8082 | Control de acceso por QR |

## Relación con Otra Documentación

Esta documentación arquitectónica complementa:

- **Diagramas**: Ver [../diagrams/](../diagrams/) para diagramas UML y de arquitectura
- **Guías de Despliegue**: Ver [../environments/](../environments/) para configuración de ambientes
- **README Principal**: Ver [../../README.md](../../README.md) para información general del proyecto

## Convenciones

- **Nombres de Módulos**: Se utilizan los nombres técnicos de las carpetas (GYMETR-login, GYMETR-Membership, etc.)
- **Puertos**: Se referencia a los puertos estándar definidos en el README principal
- **Diagramas**: Los diagramas referenciados están en `doc/diagrams/`

## Mantenimiento

Esta documentación debe actualizarse cuando:

- Se agreguen nuevos módulos
- Se cambien patrones de comunicación
- Se modifiquen decisiones arquitectónicas importantes
- Se actualice el modelo de datos

---

**Última actualización**: Noviembre 2025  
**Mantenido por**: Equipo de Desarrollo GYMETRA
