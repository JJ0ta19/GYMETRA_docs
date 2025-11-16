# Ambientes en GYMETRA

## Nuestro Enfoque

En GYMETRA manejamos diferentes ambientes para separar el desarrollo, las pruebas y la producción. Cada ambiente tiene su propio propósito y está asociado a una rama específica en Git.

## Los Cuatro Ambientes

### 🔧 DEV (Desarrollo)
- **Rama**: `develop`
- **Para qué**: Donde los desarrolladores trabajan día a día
- **Características**: Modo debug activo, datos de prueba, cambios frecuentes
- **Uso**: Desarrollo de nuevas funcionalidades y corrección de bugs

### 🧪 QA (Calidad)
- **Rama**: `qa`
- **Para qué**: Pruebas y validación antes de producción
- **Características**: Datos de prueba controlados, tests automatizados
- **Uso**: El equipo de QA valida que todo funcione correctamente

### 🚀 RELEASE (Pre-producción)
- **Rama**: `release/*`
- **Para qué**: Última validación antes de ir a producción
- **Características**: Configuración similar a producción, pruebas finales
- **Uso**: Validación final y preparación del release

### 🌐 MAIN (Producción)
- **Rama**: `main`
- **Para qué**: El sistema que usan los usuarios finales
- **Características**: Configuración optimizada, sin debug, datos reales
- **Uso**: Ambiente en vivo para los clientes

## Cómo Funciona

Cada ambiente tiene su propia configuración en su rama correspondiente. Cuando cambias de rama, cambias de ambiente. Esto nos permite:

- **Aislar cambios**: Lo que se desarrolla en DEV no afecta producción
- **Probar antes de publicar**: Todo pasa por QA y RELEASE antes de MAIN
- **Trabajar en paralelo**: Diferentes equipos pueden trabajar en diferentes ambientes

## Flujo de Trabajo

1. **Desarrollo** → Se trabaja en `develop` (DEV)
2. **Pruebas** → Se mueve a `qa` (QA) para validar
3. **Preparación** → Se crea `release/*` (RELEASE) para validación final
4. **Producción** → Se mergea a `main` (MAIN) cuando está listo

## Cambiar de Ambiente

Para trabajar en un ambiente específico, simplemente cambias a su rama:

```bash
# Trabajar en desarrollo
git checkout develop

# Trabajar en QA
git checkout qa

# Trabajar en producción
git checkout main
```

Cada rama tiene su propia configuración lista para usar.

