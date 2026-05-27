# 🗄️ Data Model

This document describes the relational data model used in the **WasteManagement** academic project.

---

# 📌 Overview

The system uses a MySQL relational database to store information related to:

- Users
- Environmental reports
- Waste collection requests
- Recycling points
- Map locations
- Incentives and participation

Database name:

```text
db_gestionresiduos
```

---

# 📝 Naming Note

> [!NOTE]
> This project was developed as an academic prototype in Costa Rica.
> For that reason, the database name, table names, and field names were originally written in Spanish.
> The documentation is written in English to make the repository easier to review, but the original database structure was preserved.

---

# 👤 usuarios

Stores registered users of the system.

| Field | Key | Description |
|---|---|---|
| id | PK | Unique user identifier |
| nombre |  | User name |
| correo |  | User email used for login |
| contraseña |  | User password |
| telefono |  | User phone number |
| direccion |  | User address |
| comunidad |  | User community |

Relationships:

- One user can create multiple reports.
- One user can create multiple collection requests.

---

# 📝 reportes

Stores environmental reports submitted by users.

| Field | Key | Description |
|---|---|---|
| id | PK | Unique report identifier |
| id_usuario | FK | User who created the report |
| descripcion |  | Report description |
| estado |  | Report status |
| fecha |  | Report creation date |

Relationships:

- Many reports belong to one user.

---

# 🚛 recolecciones

Stores waste collection requests submitted by users.

| Field | Key | Description |
|---|---|---|
| id | PK | Unique collection request identifier |
| id_usuario | FK | User who created the request |
| tipo_residuo |  | Type of waste requested for collection |
| direccion |  | Address for the collection request |
| estado |  | Current request status |
| fecha_solicitada |  | Requested collection date |
| fecha_confirmada |  | Confirmed collection date |

Relationships:

- Many collection requests belong to one user.

---

# 🗺️ lugares_mapa

Stores the locations displayed in the interactive map.

| Field | Key | Description |
|---|---|---|
| id | PK | Unique location identifier |
| nombre |  | Location name |
| descripcion |  | Location description |
| tipo |  | Location category |
| latitud |  | Latitude coordinate |
| longitud |  | Longitude coordinate |

Supported types:

- reciclaje
- biodigestor
- evento

---

# ♻️ puntos_reciclaje

Stores recycling point information.

| Field | Key | Description |
|---|---|---|
| id | PK | Unique recycling point identifier |
| nombre |  | Recycling point name |
| direccion |  | Physical address |
| horario |  | Service schedule |
| tipo_material |  | Accepted material type |

---

# 🏆 incentivos

Stores user participation incentives.

| Field | Key | Description |
|---|---|---|
| id | PK | Unique incentive identifier |
| id_usuario | FK | User linked to the incentive |
| puntos |  | Accumulated points |
| tipo_incentivo |  | Incentive type |
| fecha_entrega |  | Incentive delivery date |

Relationships:

- Many incentives may belong to one user.

---

# 🔗 Relationship Summary

| Relationship | Type |
|---|---|
| usuarios → reportes | One-to-many |
| usuarios → recolecciones | One-to-many |
| usuarios → incentivos | One-to-many |
| lugares_mapa → map module | Data source |
| puntos_reciclaje → recycling information | Data source |

---

## User Relationships and Anonymous Interactions

The system uses the `usuarios` table as the central relationship entity.

Relationships:

```text
usuarios.id
   ├── reportes.id_usuario
   └── recolecciones.id_usuario
```

Anonymous interactions are preserved using a reserved user record.

```text
ID 2 → Anonymous user
```

Instead of storing NULL references, anonymous actions are redirected to this reserved user to keep referential integrity and simplify queries.

Examples:

- Anonymous environmental reports
- Anonymous waste collection requests

# 📌 Notes

The data model was designed to support an academic prototype focused on community waste management.

The structure supports the main implemented modules:

- Authentication
- Reports
- Collection requests
- Interactive map
- Ranking and incentives
- Recycling information
