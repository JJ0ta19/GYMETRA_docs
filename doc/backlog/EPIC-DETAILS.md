# GYMETRA - Detalle de Épicas

## Resumen

Este documento proporciona información detallada de cada épica del proyecto GYMETRA, incluyendo objetivos, alcance, dependencias y criterios de aceptación.

## Épica 1: Base del Proyecto

### Información General

- **ID**: Épica 1
- **Período**: 1 sep - 12 sep
- **Duración**: 2 semanas
- **Estado**: Finalizado
- **Actividades**: 5

### Objetivo

Establecer las bases del proyecto mediante la documentación de requerimientos, diseño de mockups, configuración del entorno tecnológico y diseño de la arquitectura del sistema.

### Alcance

1. Documentación completa de requerimientos en JIRA
2. Configuración de repositorios en GitHub
3. Diseño de mockups para UI web y móvil
4. Elaboración de diagramas UML iniciales
5. Presentación del proyecto

### Entregables

- Documentación de requerimientos en JIRA
- Repositorios configurados en GitHub
- Mockups de UI (web y móvil)
- Diagramas UML (casos de uso, clases, secuencia, despliegue)
- Presentación del proyecto

### Criterios de Aceptación

- Todos los requerimientos documentados en JIRA
- Repositorios creados y configurados
- Mockups aprobados por el equipo
- Diagramas UML completos y validados
- Presentación realizada y aprobada

---

## Épica 2: Autenticación y Base de Datos

### Información General

- **ID**: Épica 2
- **Período**: 13 sep - 24 sep
- **Duración**: 2 semanas
- **Estado**: Finalizado
- **Actividades**: 6

### Objetivo

Implementar la infraestructura base del sistema: base de datos PostgreSQL, autenticación con JWT, integración frontend-backend y testing de funcionalidades de autenticación.

### Alcance

1. Creación e instalación de base de datos PostgreSQL
2. Definición de roles del sistema (Admin, Cliente)
3. Configuración de Spring Boot en backend
4. Implementación de autenticación y registro con JWT
5. Integración frontend-backend con Vue/Ionic
6. Testing de funcionalidades de login/registro

### Entregables

- Base de datos PostgreSQL configurada
- Roles definidos e implementados
- Backend Spring Boot configurado
- Módulo de autenticación con JWT funcionando
- Frontend integrado con backend
- Tests de autenticación completados

### Criterios de Aceptación

- Base de datos creada y accesible
- Roles funcionando correctamente
- Autenticación JWT operativa
- Frontend puede hacer login/registro
- Tests pasando exitosamente

---

## Épica 3: Gestión de Membresías

### Información General

- **ID**: Épica 3
- **Período**: 21 sep - 4 oct
- **Duración**: 2 semanas
- **Estado**: Finalizado
- **Actividades**: 5

### Objetivo

Implementar la gestión completa de membresías: planes, membresías de usuarios, integración de pagos y configuración de ambientes de trabajo.

### Alcance

1. Configuración y gestión de membresías en backend
2. Gestión de membresías de usuarios
3. Integración de servicio de pagos (Stripe)
4. Configuración de ambientes (DEV, QA, RELEASE, MAIN)
5. Estimación de esfuerzo por integrante

### Entregables

- Módulo de membresías backend funcionando
- Gestión de membresías de usuarios implementada
- Integración con pasarela de pagos operativa
- Ambientes de trabajo configurados
- Documentación de estimaciones

### Criterios de Aceptación

- CRUD completo de planes de membresía
- Asignación de membresías a usuarios funcionando
- Pagos procesándose correctamente
- Ambientes configurados y documentados
- Estimaciones documentadas

---

## Épica 4: Pagos e Integración QR

### Información General

- **ID**: Épica 4
- **Período**: 5 oct - 24 oct
- **Duración**: 3 semanas
- **Estado**: Finalizado
- **Actividades**: 4

### Objetivo

Implementar el sistema de control de acceso mediante códigos QR y desarrollar la vista administrativa de usuarios.

### Alcance

1. Generación de códigos QR únicos para usuarios
2. Integración y validación de QR en la aplicación
3. Registro de accesos en PostgreSQL (AccessLog)
4. Vista administrativa de usuarios (Admin Web)

### Entregables

- Sistema de generación de QR funcionando
- Validación de QR implementada
- Registro de accesos en base de datos
- Vista administrativa de usuarios desarrollada

### Criterios de Aceptación

- QR único generado por usuario
- Validación de QR funcionando correctamente
- Accesos registrados en AccessLog
- Vista admin permite gestionar usuarios

---

## Épica 5: Reportes y Dashboard

### Información General

- **ID**: Épica 5
- **Período**: 24 oct - 5 nov
- **Duración**: 2 semanas
- **Estado**: En Progreso
- **Actividades**: 4

### Objetivo

Implementar sistema de reportes, dashboard administrativo con métricas en tiempo real, notificaciones y logs de auditoría.

### Alcance

1. Reportes de ingresos, membresías y usuarios
2. Dashboard administrativo con métricas en tiempo real
3. Notificaciones push/email de pagos y renovaciones
4. Logs de auditoría (Eventos de Auth, Payments)

### Entregables

- Sistema de reportes implementado
- Dashboard con métricas en tiempo real
- Sistema de notificaciones funcionando
- Logs de auditoría implementados

### Criterios de Aceptación

- Reportes generándose correctamente
- Dashboard mostrando métricas actualizadas
- Notificaciones enviándose exitosamente
- Logs de auditoría registrando eventos

### Estado Actual

- **Finalizado**: Reportes y Dashboard básico
- **En Progreso**: Notificaciones y Logs de auditoría

---

## Épica 6: Infraestructura

### Información General

- **ID**: Épica 6
- **Período**: 5 nov - 19 nov
- **Duración**: 2 semanas
- **Estado**: En Progreso
- **Actividades**: 3

### Objetivo

Implementar infraestructura de CI/CD, dockerización de microservicios, orquestación con Kubernetes y realizar pruebas finales del sistema.

### Alcance

1. CI/CD con Jenkins y dockerización de microservicios
2. Orquestación con Kubernetes
3. Pruebas finales del sistema

### Entregables

- Pipeline CI/CD configurado en Jenkins
- Microservicios dockerizados
- Orquestación con Kubernetes funcionando
- Pruebas finales completadas

### Criterios de Aceptación

- Pipeline CI/CD ejecutándose correctamente
- Contenedores Docker funcionando
- Kubernetes orquestando servicios
- Todas las pruebas pasando

### Estado Actual

- **En Progreso**: Todas las actividades de esta épica

---

## Dependencias Entre Épicas

```
Épica 1 (Base)
    │
    ├─► Épica 2 (Autenticación)
    │       │
    │       ├─► Épica 3 (Membresías)
    │       │       │
    │       │       └─► Épica 4 (QR y Pagos)
    │       │               │
    │       │               └─► Épica 5 (Reportes)
    │       │
    │       └─► Épica 6 (Infraestructura)
    │
    └─► Épica 6 (Infraestructura)
```

## Referencias

- [Backlog Principal](./README.md)
- [JIRA Backlog](https://gymetra.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog)

---

**Última actualización**: Noviembre 2025

