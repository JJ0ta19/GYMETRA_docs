# Manual de Administrador - GYMETRA

## Introducción

Este manual está dirigido a los administradores del sistema GYMETRA que gestionan el gimnasio, usuarios, membresías y reportes.

## Acceso al Panel Administrativo

### Inicio de Sesión

1. Accede a la URL del panel administrativo: `http://localhost:8101`
2. Ingresa tus credenciales de administrador
3. Haz clic en **"Iniciar Sesión"**

**Nota**: Solo usuarios con rol de Administrador pueden acceder al panel.

## Gestión de Usuarios

### Ver Lista de Usuarios

1. Ve a **"Usuarios"** en el menú principal
2. Verás una lista de todos los usuarios registrados
3. Puedes filtrar por:
   - Nombre
   - Correo electrónico
   - Estado (Activo, Inactivo, Suspendido)
   - Rol (Admin, Cliente)

### Crear Nuevo Usuario

1. Ve a **"Usuarios"** → **"Nuevo Usuario"**
2. Completa el formulario:
   - Información personal
   - Correo electrónico
   - Contraseña temporal
   - Rol (Admin o Cliente)
3. Haz clic en **"Guardar"**
4. El usuario recibirá un correo con sus credenciales

### Editar Usuario

1. En la lista de usuarios, haz clic en el usuario que deseas editar
2. Modifica la información necesaria
3. Guarda los cambios

### Suspender/Activar Usuario

1. Selecciona el usuario de la lista
2. Haz clic en **"Suspender"** o **"Activar"** según corresponda
3. Confirma la acción

## Gestión de Planes de Membresía

### Crear un Plan de Membresía

1. Ve a **"Planes"** → **"Nuevo Plan"**
2. Completa la información:
   - Nombre del plan (ej: Mensual, Trimestral, Anual)
   - Descripción
   - Precio
   - Duración en días
   - Características incluidas
3. Establece el estado (Disponible/No disponible)
4. Guarda el plan

### Editar Plan

1. Ve a **"Planes"** y selecciona el plan a editar
2. Modifica la información necesaria
3. Guarda los cambios

**Nota**: Los cambios no afectarán las membresías ya asignadas, solo las nuevas.

### Eliminar Plan

1. Selecciona el plan de la lista
2. Haz clic en **"Eliminar"**
3. Confirma la acción

**Advertencia**: No podrás eliminar un plan que tenga membresías activas asignadas.

## Gestión de Membresías

### Asignar Membresía a Usuario

1. Ve a **"Membresías"** → **"Nueva Membresía"**
2. Selecciona el usuario
3. Selecciona el plan de membresía
4. Establece la fecha de inicio
5. La fecha de vencimiento se calculará automáticamente
6. Guarda la membresía

### Ver Membresías

1. Ve a **"Membresías"**
2. Verás todas las membresías con:
   - Usuario
   - Plan
   - Fechas de inicio y vencimiento
   - Estado
3. Puedes filtrar por:
   - Usuario
   - Plan
   - Estado (Activa, Vencida, Suspendida)
   - Rango de fechas

### Renovar Membresía

1. Selecciona la membresía a renovar
2. Haz clic en **"Renovar"**
3. Selecciona el nuevo plan (puede ser el mismo)
4. Confirma la renovación

### Suspender Membresía

1. Selecciona la membresía
2. Haz clic en **"Suspender"**
3. Indica el motivo (opcional)
4. Confirma la suspensión

**Nota**: Una membresía suspendida no permitirá el acceso al gimnasio.

## Gestión de Pagos

### Ver Pagos

1. Ve a **"Pagos"**
2. Verás todos los pagos registrados con:
   - Usuario
   - Monto
   - Fecha
   - Estado (Completado, Pendiente, Fallido)
   - Método de pago

### Procesar Pago Manual

1. Ve a **"Pagos"** → **"Nuevo Pago"**
2. Selecciona el usuario
3. Selecciona la membresía asociada
4. Ingresa el monto
5. Selecciona el método de pago
6. Confirma el pago

### Ver Historial de Pagos de un Usuario

1. Ve al perfil del usuario
2. Haz clic en la pestaña **"Pagos"**
3. Verás el historial completo de pagos

## Control de Acceso

### Ver Historial de Accesos

1. Ve a **"Accesos"** o **"Historial de Accesos"**
2. Verás todos los accesos registrados con:
   - Usuario
   - Fecha y hora
   - Sucursal
   - Estado (Permitido, Denegado)
   - Motivo de denegación (si aplica)

### Filtrar Accesos

- Por usuario
- Por sucursal
- Por rango de fechas
- Por estado (Permitido/Denegado)

### Ver Accesos de un Usuario Específico

1. Ve al perfil del usuario
2. Haz clic en **"Historial de Accesos"**
3. Verás todos sus accesos

## Gestión de Sucursales

### Crear Sucursal

1. Ve a **"Sucursales"** → **"Nueva Sucursal"**
2. Completa la información:
   - Nombre
   - Dirección
   - Teléfono
   - Capacidad máxima
   - Estado (Activa/Inactiva)
3. Guarda la sucursal

### Editar Sucursal

1. Selecciona la sucursal de la lista
2. Modifica la información necesaria
3. Guarda los cambios

## Reportes

### Reporte de Ingresos

1. Ve a **"Reportes"** → **"Ingresos"**
2. Selecciona el rango de fechas
3. Opcionalmente, filtra por:
   - Plan de membresía
   - Sucursal
4. Haz clic en **"Generar Reporte"**
5. Puedes exportar el reporte en PDF o Excel

### Reporte de Asistencia

1. Ve a **"Reportes"** → **"Asistencia"**
2. Selecciona el rango de fechas
3. Filtra por:
   - Sucursal
   - Usuario específico (opcional)
4. Genera el reporte
5. Verás estadísticas de:
   - Total de accesos
   - Accesos por día
   - Usuarios más frecuentes
   - Horarios pico

### Reporte de Membresías

1. Ve a **"Reportes"** → **"Membresías"**
2. Genera reportes sobre:
   - Membresías activas
   - Membresías vencidas
   - Membresías por vencer
   - Estadísticas por plan

## Configuración del Sistema

### Configuración General

1. Ve a **"Configuración"** → **"General"**
2. Configura:
   - Nombre del gimnasio
   - Información de contacto
   - Configuración de notificaciones

### Configuración de Seguridad

1. Ve a **"Configuración"** → **"Seguridad"**
2. Configura:
   - Políticas de contraseñas
   - Tiempo de expiración de tokens
   - Configuración de JWT

## Preguntas Frecuentes

### ¿Cómo restablecer la contraseña de un usuario?

Ve al perfil del usuario y selecciona "Restablecer Contraseña". Se enviará un correo con instrucciones.

### ¿Puedo cambiar el plan de una membresía existente?

Sí, pero esto creará una nueva membresía. La anterior se marcará como finalizada.

### ¿Cómo veo cuántos usuarios están actualmente en el gimnasio?

Ve a "Accesos" y filtra por la fecha de hoy. Los accesos sin salida registrada indican usuarios presentes.

### ¿Puedo exportar los reportes?

Sí, todos los reportes pueden exportarse en formato PDF o Excel.

## Soporte Técnico

Para problemas técnicos o consultas:
- Revisa la documentación técnica en `doc/architecture/`
- Consulta los logs del sistema
- Contacta al equipo de desarrollo

---

**Última actualización**: Noviembre 2025

