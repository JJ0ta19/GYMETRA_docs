# GYMETRA - Backlog del Proyecto

## Resumen

Este documento contiene el backlog completo del proyecto GYMETRA, organizado por épicas y sprints. El backlog se gestiona en JIRA y se actualiza continuamente durante el desarrollo del proyecto.

## Enlace al Backlog en JIRA

**URL**: [https://gymetra.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog](https://gymetra.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog)

## Estado del Proyecto

El proyecto está organizado en 6 épicas principales, cubriendo desde la definición inicial hasta la infraestructura y pruebas finales.

### Resumen por Épica

| Épica | Período | Actividades | Estado |
|-------|---------|-------------|--------|
| Épica 1: Base del Proyecto | 1 sep - 12 sep | 5 | Finalizado |
| Épica 2: Autenticación y Base de Datos | 13 sep - 24 sep | 6 | Finalizado |
| Épica 3: Gestión de Membresías | 21 sep - 4 oct | 5 | Finalizado |
| Épica 4: Pagos e Integración QR | 5 oct - 24 oct | 4 | Finalizado |
| Épica 5: Reportes y Dashboard | 24 oct - 5 nov | 4 | En Progreso |
| Épica 6: Infraestructura | 5 nov - 19 nov | 3 | En Progreso |

## Épicas del Proyecto

### Épica 1: Base del Proyecto
**Período**: 1 sep - 12 sep  
**Estado**: Finalizado  
**Actividades**: 5

#### Descripción
Definir la base del proyecto: levantar y documentar los requerimientos en JIRA, diseñar mockups de la UI y configurar el entorno tecnológico inicial (Spring Boot, Vue/Ionic, BD). Diseñar la arquitectura del sistema: crear diagramas UML y organizar los repositorios en Git/GitHub.

#### Historias de Usuario

- **SCRUM-23 HU1.1**: Documentación de requerimientos en JIRA
  - Estado: Finalizado
  - Fecha: 7 sept

- **SCRUM-26 HU1.2**: Configuración del repositorio en GitHub
  - Estado: Finalizado
  - Fecha: 7 sept

- **SCRUM-24 HU1.3**: Mockups UI web y móvil
  - Estado: Finalizado
  - Fecha: 7 sept

- **SCRUM-25 HU1.4**: Elaboración de diagramas iniciales
  - Estado: Finalizado
  - Fecha: 7 sept

- **SCRUM-46 HU1.5**: Presentación del proyecto
  - Estado: Finalizado
  - Fecha: 7 sept

---

### Épica 2: Autenticación y Base de Datos
**Período**: 13 sep - 24 sep  
**Estado**: Finalizado  
**Actividades**: 6

#### Descripción
Implementar la base de datos PostgreSQL, definir roles del sistema, configurar Spring Boot en el backend, implementar autenticación con JWT, integrar frontend con backend y realizar testing de las funcionalidades de login/registro.

#### Historias de Usuario

- **SCRUM-28 HU-2.1**: Creación e instalación de la base de datos (PostgreSQL)
  - Estado: Finalizado
  - Fecha: 24 sept

- **SCRUM-33 HU 2.2**: Definición de Roles (Admin, Cliente)
  - Estado: Finalizado
  - Fecha: 24 sept

- **SCRUM-47 HU 2.3**: Instalación de Spring Boot con sus dependencias en el proyecto (Backend)
  - Estado: Finalizado
  - Fecha: 24 sept

- **SCRUM-52 HU 2.3.1**: Implementar autenticación y registro de usuarios con JWT "backend login"
  - Estado: Finalizado
  - Fecha: 24 sept

- **SCRUM-35 HU 2.5**: Integración Frontend con Backend e implementación de vistas en Vue (Ionic) en el proyecto (Frontend)
  - Estado: Finalizado
  - Fecha: 24 sept

- **SCRUM-34 HU 2.6**: Testing de funcionalidad login/registro de frontend con JWT
  - Estado: Finalizado
  - Fecha: 24 sept

---

### Épica 3: Gestión de Membresías
**Período**: 21 sep - 4 oct  
**Estado**: Finalizado  
**Actividades**: 5

#### Descripción
Configurar y gestionar membresías en el backend, gestionar membresías de usuarios, integrar servicio de pagos con pasarela de pago, configurar diferentes ambientes de trabajo y realizar estimación de esfuerzo.

#### Historias de Usuario

- **SCRUM-36 HU3.1**: Configuración y gestión de membresías backend
  - Estado: Finalizado
  - Fecha: 4 oct

- **SCRUM-37 HU3.2**: Gestión de membresías de usuarios
  - Estado: Finalizado
  - Fecha: 9 oct

- **SCRUM-38 HU3.3**: Integración del servicio de pagos con pasarela de pago
  - Estado: Finalizado
  - Fecha: 9 oct

- **SCRUM-56 HU3.4**: Configuración de diferentes ambientes de trabajo (DEV, QA, RELEASE, MAIN)
  - Estado: Finalizado
  - Fecha: 4 oct

- **SCRUM-58 HU3.6**: Estimación de esfuerzo/horas de cada integrante en las HU
  - Estado: Finalizado
  - Fecha: 4 oct

---

### Épica 4: Pagos e Integración QR
**Período**: 5 oct - 24 oct  
**Estado**: Finalizado  
**Actividades**: 4

#### Descripción
Implementar generación de códigos QR únicos, integrar y validar QR en la aplicación, registrar accesos en PostgreSQL y desarrollar vista administrativa de usuarios.

#### Historias de Usuario

- **SCRUM-30 HU4.1**: Generación de código QR único
  - Estado: Finalizado
  - Fecha: 19 oct

- **SCRUM-40 HU4.2**: Integración y Validación de QR en la aplicación
  - Estado: Finalizado
  - Fecha: 19 oct

- **SCRUM-50 HU4.3**: Registro de accesos en PostgreSQL (AccessLog)
  - Estado: Finalizado
  - Fecha: 19 oct

- **SCRUM-60 HU4.4**: (VISTA ADMIN WEB) Vista usuarios administrativo
  - Estado: Finalizado
  - Fecha: 19 oct

---

### Épica 5: Reportes y Dashboard
**Período**: 24 oct - 5 nov  
**Estado**: En Progreso  
**Actividades**: 4

#### Descripción
Implementar reportes de ingresos, membresías y usuarios, desarrollar dashboard administrativo con métricas en tiempo real, implementar notificaciones push/email y logs de auditoría.

#### Historias de Usuario

- **SCRUM-41 HU5.1**: Reporte de ingreso, membresías y usuarios
  - Estado: Finalizado
  - Fecha: 5 nov

- **SCRUM-42 HU5.2**: (ADMIN WEB) Implementación funcional de Dashboard con métricas en tiempo real
  - Estado: Finalizado
  - Fecha: 5 nov

- **SCRUM-63 HU5.3**: Notificaciones push/email de pagos y renovaciones
  - Estado: En Curso
  - Fecha: 5 nov

- **SCRUM-64 HU5.4**: Logs de auditoría (Eventos de Auth, Payments)
  - Estado: En Curso
  - Fecha: 5 nov

---

### Épica 6: Infraestructura
**Período**: 5 nov - 19 nov  
**Estado**: En Progreso  
**Actividades**: 3

#### Descripción
Implementar CI/CD con Jenkins y dockerización de microservicios, orquestación con Kubernetes y realizar pruebas finales del sistema.

#### Historias de Usuario

- **SCRUM-43 HU6.1**: CI/CD con Jenkins y Dockerización de microservicios
  - Estado: En Curso
  - Fecha: 10 nov

- **SCRUM-44 HU6.2**: Orquestación con Kubernetes
  - Estado: En Curso
  - Fecha: 10 nov

- **SCRUM-45 HU6.3**: Pruebas finales
  - Estado: En Curso
  - Fecha: 10 nov

---

## Métricas del Proyecto

### Progreso General

- **Total de Historias de Usuario**: 27
- **Historias Finalizadas**: 20
- **Historias En Progreso**: 5
- **Porcentaje de Completitud**: ~74%

### Distribución por Estado

- **Finalizado**: 20 historias (74%)
- **En Curso**: 5 historias (19%)
- **Pendiente**: 2 historias (7%)

## Equipo de Desarrollo

- **Jhon Jamez Nieto Perez** (JP) - Product Owner
- **Johan Sebastian Naranjo** (JM) - Desarrollador
- **Juan Felipe Narvaez Amaya** - Control de Calidad

## Referencias

- [JIRA Backlog](https://gymetra.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog)
- [Documentación de Arquitectura](../architecture/)
- [Guías de Despliegue](../environments/)

---

**Última actualización**: Noviembre 2025

