# ✅ Checklist de Validación para Release a Main

**Proyecto**: GYMETRA Documentation  
**Rama Origen**: `develop`  
**Rama Destino**: `main`  
**Versión**: 1.0.0

---

## 📋 Instrucciones

Este checklist debe completarse **ANTES** de hacer merge de la rama `develop` a `main`. Cada item debe ser verificado y marcado como completado.

**Regla**: Si algún item crítico (🔴) no está completado, **NO se debe hacer el merge**.

---

## 🔴 Validaciones Críticas (OBLIGATORIAS)

### 1. Enlaces y Referencias

- [ ] **Todos los enlaces internos funcionan correctamente**
  - [ ] Enlaces a otros documentos Markdown
  - [ ] Enlaces a imágenes
  - [ ] Enlaces a diagramas
  - [ ] Referencias cruzadas entre documentos

- [ ] **Todos los enlaces externos son accesibles**
  - [ ] Repositorios GitHub son públicos/accesibles
  - [ ] Enlace a JIRA funciona
  - [ ] Enlace a Figma es accesible
  - [ ] Otros recursos externos funcionan

- [ ] **Todas las imágenes existen y son accesibles**
  - [ ] Diagramas en `doc/diagrams/`
  - [ ] Mockups en `doc/mockups/`
  - [ ] Imágenes en presentaciones

### 2. Consistencia de Información

- [ ] **Puertos son consistentes en todos los documentos**
  - [ ] Backend Login: 8080
  - [ ] Backend Membership: 8081
  - [ ] Backend QR: 8082
  - [ ] Frontend Admin: 8101
  - [ ] Frontend Usuario: 8100
  - [ ] PostgreSQL: 5000

- [ ] **Nombres de módulos son consistentes**
  - [ ] GYMETR-login (no GYMETRA-login)
  - [ ] GYMETR-Membership (no GYMETRA-Membership)
  - [ ] GYMETRA - Qr (formato correcto)

- [ ] **URLs de Swagger son correctas**
  - [ ] http://localhost:8080/swagger-ui.html
  - [ ] http://localhost:8081/swagger-ui.html
  - [ ] http://localhost:8082/swagger-ui.html

### 3. Estructura y Organización

- [ ] **Todos los documentos principales tienen estructura correcta**
  - [ ] Título (H1) único y claro
  - [ ] Jerarquía de encabezados correcta
  - [ ] Índice o tabla de contenidos (si aplica)
  - [ ] Fecha de última actualización

- [ ] **No hay archivos temporales o de desarrollo**
  - [ ] Sin archivos `.tmp`, `.bak`, `.old`
  - [ ] Sin código de prueba en documentación
  - [ ] Sin comentarios de desarrollo

### 4. Contenido y Completitud

- [ ] **Documentación arquitectónica está completa**
  - [ ] `01-SYSTEM-ARCHITECTURE.md` completo
  - [ ] `02-BACKEND-MODULES.md` completo
  - [ ] `03-DATA-MODEL.md` completo

- [ ] **Manuales de usuario están completos**
  - [ ] Manual de administrador
  - [ ] Manual de usuario cliente
  - [ ] Guía de inicio rápido
  - [ ] FAQ

- [ ] **Backlog está actualizado**
  - [ ] Estado de épicas actualizado
  - [ ] Métricas del proyecto actualizadas
  - [ ] Fechas correctas

---

## 🟡 Validaciones Importantes (RECOMENDADAS)

### 5. Calidad de Documentación

- [ ] **Ortografía y gramática revisadas**
  - [ ] Sin errores ortográficos evidentes
  - [ ] Gramática correcta
  - [ ] Puntuación adecuada

- [ ] **Formato Markdown es correcto**
  - [ ] Sintaxis Markdown válida
  - [ ] Tablas bien formateadas
  - [ ] Bloques de código con lenguaje especificado
  - [ ] Listas correctamente formateadas

- [ ] **Consistencia en estilo de escritura**
  - [ ] Tono consistente
  - [ ] Terminología uniforme
  - [ ] Formato de fechas consistente

### 6. Información de Proyecto

- [ ] **Información del equipo está actualizada**
  - [ ] Nombres correctos
  - [ ] Roles correctos
  - [ ] Información de contacto (si aplica)

- [ ] **Metadatos del proyecto son correctos**
  - [ ] Versión del proyecto
  - [ ] Fecha de última actualización
  - [ ] Licencia (si aplica)

### 7. Referencias y Enlaces

- [ ] **Referencias cruzadas funcionan**
  - [ ] Enlaces entre documentos de arquitectura
  - [ ] Referencias a diagramas
  - [ ] Referencias a manuales

- [ ] **Enlaces a recursos externos son válidos**
  - [ ] Repositorios GitHub existen
  - [ ] Enlaces a documentación externa funcionan

---

## 🟢 Validaciones Opcionales (MEJORAS)

### 8. Documentación Adicional

- [ ] **Diagramas están actualizados**
  - [ ] Diagramas reflejan el estado actual
  - [ ] Diagramas son claros y legibles

- [ ] **Ejemplos de código son correctos**
  - [ ] Código SQL es válido
  - [ ] Ejemplos de API son correctos
  - [ ] Comandos de terminal funcionan

### 9. Organización de Archivos

- [ ] **Estructura de carpetas es lógica**
  - [ ] Documentos en ubicaciones apropiadas
  - [ ] Sin archivos duplicados
  - [ ] Nombres de archivos son descriptivos

- [ ] **Archivos README están presentes**
  - [ ] README.md principal
  - [ ] README en carpetas principales
  - [ ] README con descripción clara

---

## 📝 Verificación Final

### Antes del Merge

- [ ] **Todos los items críticos (🔴) están completados**
- [ ] **Al menos 80% de items importantes (🟡) están completados**
- [ ] **Revisión de QA completada y aprobada**
- [ ] **Reporte de QA revisado y issues críticos resueltos**

### Proceso de Merge

- [ ] **Backup de rama main creado** (si aplica)
- [ ] **Merge request creado y revisado**
- [ ] **Aprobación de Product Owner obtenida**
- [ ] **Merge ejecutado correctamente**
- [ ] **Verificación post-merge realizada**

---

## 🚨 Criterios de Bloqueo

El merge a `main` debe **BLOQUEARSE** si:

1. ❌ Hay enlaces rotos críticos
2. ❌ Información inconsistente que cause confusión
3. ❌ Documentación incompleta en áreas críticas
4. ❌ Archivos corruptos o inaccesibles
5. ❌ Información sensible expuesta (si aplica)

---

## 📊 Métricas de Cumplimiento

| Categoría | Items | Completados | Porcentaje |
|-----------|-------|-------------|------------|
| Críticos (🔴) | 20 | ___ | ___% |
| Importantes (🟡) | 15 | ___ | ___% |
| Opcionales (🟢) | 10 | ___ | ___% |
| **TOTAL** | **45** | **___** | **___%** |

**Mínimo Requerido**: 100% de críticos + 80% de importantes

---

## ✅ Aprobaciones

### Revisión de QA

- [ ] **Revisado por**: _________________
- [ ] **Fecha**: _________________
- [ ] **Aprobado**: ☐ Sí  ☐ No
- [ ] **Comentarios**: 
  ```
  
  ```

### Aprobación de Product Owner

- [ ] **Revisado por**: _________________
- [ ] **Fecha**: _________________
- [ ] **Aprobado**: ☐ Sí  ☐ No
- [ ] **Comentarios**: 
  ```
  
  ```

---

## 📅 Historial de Validaciones

| Fecha | Versión | Validado por | Resultado | Notas |
|-------|---------|--------------|-----------|-------|
| | | | | |

---

**Última actualización**: Noviembre 2025  
**Versión del Checklist**: 1.0.0

