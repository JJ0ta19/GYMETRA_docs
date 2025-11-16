# GYMETRA - Modelo de Datos

## Resumen

Este documento describe el modelo de datos del sistema GYMETRA, incluyendo todas las tablas, relaciones, y convenciones utilizadas.

## Base de Datos

### Configuración

- **Motor**: PostgreSQL 15
- **Base de Datos**: `gymdb`
- **Puerto**: 5000 (host) / 5432 (contenedor)
- **Usuario**: postgres
- **Estrategia**: Base de datos compartida entre todos los módulos

## Esquema de Datos

### Diagrama de Relaciones

```
┌──────────────┐      ┌──────────────┐
│     user     │      │     role     │
├──────────────┤      ├──────────────┤
│ id (UUID)    │      │ id (UUID)    │
│ email        │◄─────┤ name         │
│ password_hash│      │ description   │
│ first_name   │      └──────────────┘
│ last_name    │             ▲
│ phone        │             │
│ address      │      ┌──────────────┐
│ status       │      │  user_role   │
│ ...          │      ├──────────────┤
└──────────────┘      │ user_id      │
       │              │ role_id      │
       │              └──────────────┘
       │
       │      ┌──────────────────────┐
       │      │  membership_plan     │
       │      ├──────────────────────┤
       │      │ id (UUID)            │
       │      │ code                 │
       │      │ name                 │
       │      │ duration_months      │
       │      │ price                │
       │      │ description          │
       │      └──────────────────────┘
       │              ▲
       │              │
       │      ┌──────────────────────┐
       └──────┤  user_membership    │
              ├──────────────────────┤
              │ id (UUID)            │
              │ user_id              │
              │ membership_plan_id    │
              │ start_date            │
              │ end_date             │
              │ status               │
              └──────────────────────┘
                      
┌──────────────────────┐
│      payment         │
├──────────────────────┤
│ id (UUID)            │
│ user_id              │
│ membership_plan_id   │
│ amount               │
│ method               │
│ status               │
│ payment_date         │
│ reference_code       │
└──────────────────────┘

┌──────────────────────┐      ┌──────────────────────┐
│    gym_branch        │      │     access_log       │
├──────────────────────┤      ├──────────────────────┤
│ id (UUID)            │      │ id (UUID)            │
│ code                 │      │ user_id              │
│ name                 │◄─────┤ gym_branch_id        │
│ address              │      │ access_time          │
│ city                 │      │ validated            │
│ capacity             │      │ qr_code              │
└──────────────────────┘      └──────────────────────┘
```

## Módulos de Datos

### 1. Módulo de Seguridad (Security)

#### Tabla: `user`

Usuarios del sistema.

```sql
CREATE TABLE "user" (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID,
    deleted_at TIMESTAMP,
    deleted_by UUID
);

CREATE INDEX idx_user_email ON "user"(email);
CREATE INDEX idx_user_status ON "user"(status);
```

**Campos Clave**:
- `email`: Único, usado para login
- `password_hash`: Contraseña hasheada con BCrypt
- `status`: ACTIVE, INACTIVE, SUSPENDED

#### Tabla: `role`

Roles del sistema.

```sql
CREATE TABLE role (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID,
    deleted_at TIMESTAMP,
    deleted_by UUID
);
```

**Roles Predefinidos**:
- `ADMIN`: Administrador del sistema
- `CLIENT`: Cliente/Usuario del gimnasio

#### Tabla: `user_role`

Relación muchos-a-muchos entre usuarios y roles.

```sql
CREATE TABLE user_role (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
    role_id UUID NOT NULL REFERENCES role(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, role_id)
);

CREATE INDEX idx_user_role_user ON user_role(user_id);
CREATE INDEX idx_user_role_role ON user_role(role_id);
```

---

### 2. Módulo de Membresías (Memberships)

#### Tabla: `membership_plan`

Planes de membresía disponibles.

```sql
CREATE TABLE membership_plan (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    duration_months INTEGER NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID,
    deleted_at TIMESTAMP,
    deleted_by UUID
);

CREATE INDEX idx_membership_plan_code ON membership_plan(code);
CREATE INDEX idx_membership_plan_status ON membership_plan(status);
```

**Ejemplo de Planes**:
- Plan Básico: 1 mes, $50,000
- Plan Premium: 3 meses, $120,000
- Plan Anual: 12 meses, $400,000

#### Tabla: `user_membership`

Membresías asignadas a usuarios.

```sql
CREATE TABLE user_membership (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
    membership_plan_id UUID NOT NULL REFERENCES membership_plan(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID,
    deleted_at TIMESTAMP,
    deleted_by UUID,
    CHECK (end_date > start_date)
);

CREATE INDEX idx_user_membership_user ON user_membership(user_id);
CREATE INDEX idx_user_membership_status ON user_membership(status);
CREATE INDEX idx_user_membership_dates ON user_membership(start_date, end_date);
```

**Estados**:
- `ACTIVE`: Membresía activa
- `EXPIRED`: Membresía expirada
- `SUSPENDED`: Membresía suspendida
- `CANCELLED`: Membresía cancelada

**Consulta de Membresía Activa**:
```sql
SELECT * FROM user_membership
WHERE user_id = :userId
  AND status = 'ACTIVE'
  AND end_date > CURRENT_DATE
ORDER BY start_date DESC
LIMIT 1;
```

---

### 3. Módulo de Pagos (Payments)

#### Tabla: `payment`

Registro de pagos realizados.

```sql
CREATE TABLE payment (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES "user"(id),
    membership_plan_id UUID NOT NULL REFERENCES membership_plan(id),
    amount DECIMAL(10,2) NOT NULL,
    method VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    payment_date TIMESTAMP,
    reference_code VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID
);

CREATE INDEX idx_payment_user ON payment(user_id);
CREATE INDEX idx_payment_status ON payment(status);
CREATE INDEX idx_payment_date ON payment(payment_date);
CREATE INDEX idx_payment_reference ON payment(reference_code);
```

**Métodos de Pago**:
- `CREDIT_CARD`: Tarjeta de crédito
- `DEBIT_CARD`: Tarjeta de débito
- `CASH`: Efectivo
- `STRIPE`: Pago procesado por Stripe

**Estados**:
- `PENDING`: Pago pendiente
- `COMPLETED`: Pago completado
- `FAILED`: Pago fallido
- `REFUNDED`: Pago reembolsado

---

### 4. Módulo de Control de Acceso (Access Control)

#### Tabla: `gym_branch`

Sucursales del gimnasio.

```sql
CREATE TABLE gym_branch (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    city VARCHAR(100),
    capacity INTEGER NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID,
    deleted_at TIMESTAMP,
    deleted_by UUID
);

CREATE INDEX idx_gym_branch_code ON gym_branch(code);
```

#### Tabla: `access_log`

Registro de accesos al gimnasio.

```sql
CREATE TABLE access_log (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES "user"(id),
    gym_branch_id UUID NOT NULL REFERENCES gym_branch(id),
    access_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    validated BOOLEAN DEFAULT TRUE,
    qr_code TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_access_log_user ON access_log(user_id);
CREATE INDEX idx_access_log_branch ON access_log(gym_branch_id);
CREATE INDEX idx_access_log_time ON access_log(access_time);
CREATE INDEX idx_access_log_user_time ON access_log(user_id, access_time);
```

**Uso**:
- Registra cada intento de acceso
- `validated`: Indica si el acceso fue permitido
- `access_time`: Timestamp del acceso

---

## Convenciones

### Nomenclatura

- **Tablas**: `snake_case`, singular (`user`, `membership_plan`)
- **Columnas**: `snake_case` (`first_name`, `created_at`)
- **Primary Keys**: `id` (UUID)
- **Foreign Keys**: `{table}_id` (ej: `user_id`, `role_id`)

### Tipos de Datos

- **IDs**: `UUID` (generados con `gen_random_uuid()`)
- **Strings**: `VARCHAR(n)` o `TEXT`
- **Números**: `INTEGER` o `DECIMAL(10,2)` para dinero
- **Fechas**: `DATE` o `TIMESTAMP`
- **Booleanos**: `BOOLEAN`

### Campos de Auditoría

Todas las tablas principales incluyen:

```sql
status VARCHAR(20) DEFAULT 'ACTIVE',
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
created_by UUID,
updated_at TIMESTAMP,
updated_by UUID,
deleted_at TIMESTAMP,  -- Soft delete
deleted_by UUID
```

**Ventajas**:
- Auditoría completa de cambios
- Soft delete (no eliminar físicamente)
- Trazabilidad de quién hizo qué

## Relaciones Clave

### Usuario ↔ Rol (N:M)

```
user ←→ user_role ←→ role
```

Un usuario puede tener múltiples roles, un rol puede estar asignado a múltiples usuarios.

### Usuario ↔ Membresía (1:N)

```
user ←→ user_membership ←→ membership_plan
```

Un usuario puede tener múltiples membresías (histórico), pero solo una activa a la vez.

### Usuario ↔ Pago (1:N)

```
user ←→ payment ←→ membership_plan
```

Un usuario puede tener múltiples pagos, cada pago está asociado a un plan.

### Usuario ↔ Acceso (1:N)

```
user ←→ access_log ←→ gym_branch
```

Un usuario puede tener múltiples accesos registrados en diferentes sucursales.

## Consultas Frecuentes

### Membresía Activa de un Usuario

```sql
SELECT um.*, mp.name as plan_name, mp.price
FROM user_membership um
JOIN membership_plan mp ON um.membership_plan_id = mp.id
WHERE um.user_id = :userId
  AND um.status = 'ACTIVE'
  AND um.end_date > CURRENT_DATE
ORDER BY um.start_date DESC
LIMIT 1;
```

### Historial de Accesos de un Usuario

```sql
SELECT al.*, gb.name as branch_name
FROM access_log al
JOIN gym_branch gb ON al.gym_branch_id = gb.id
WHERE al.user_id = :userId
ORDER BY al.access_time DESC
LIMIT 100;
```

### Reporte de Ingresos por Período

```sql
SELECT 
    DATE_TRUNC('month', payment_date) as month,
    SUM(amount) as total_revenue,
    COUNT(*) as payment_count
FROM payment
WHERE status = 'COMPLETED'
  AND payment_date BETWEEN :startDate AND :endDate
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month DESC;
```

## Seguridad de Datos

### Contraseñas

- **Algoritmo**: BCrypt
- **Rounds**: 10
- **Nunca almacenar en texto plano**

### Datos Sensibles

- Emails: Únicos, validados
- Información de pago: No almacenar datos completos de tarjetas
- Tokens: Almacenar solo hashes

## Referencias

- [Arquitectura del Sistema](./01-SYSTEM-ARCHITECTURE.md)
- [Módulos Backend](./02-BACKEND-MODULES.md)
- [Scripts de Base de Datos](../../data/Database-Setup/)
- [Diagrama ER](../diagrams/er/er.png)

---

**Última actualización**: Noviembre 2025
