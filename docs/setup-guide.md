# ⚙️ Setup Guide

This guide explains how to run the **Waste Management** academic project locally using XAMPP.

---

## 📌 Requirements

Before running the project, make sure you have:

| Tool | Purpose |
|---|---|
| XAMPP | Local Apache and MySQL server |
| phpMyAdmin | Database management |
| Web browser | To access the application |
| Code editor | Optional, for reviewing or editing files |

---

## 📁 Project Location

Place the project folder inside the XAMPP `htdocs` directory.

Example:

```
C:\xampp\htdocs\WasteManagement
```

The project should be accessible from:

```
http://localhost/WasteManagement/
```

---

## ▶️ Start XAMPP

Open **XAMPP Control Panel** and start:

| Service | Status |
|---|---|
| Apache | Required |
| MySQL | Required |

Both services must be running before opening the project.

---

## 🗄️ Create the Database

Open phpMyAdmin:

```
http://localhost/phpmyadmin
```

Create a new database with the exact name:

```
db_gestionresiduos
```

Recommended collation:

```
utf8mb4_general_ci
```

---

## 📥 Import the Database File

Inside phpMyAdmin:

1. Select the database:

```
db_gestionresiduos
```

2. Go to the **Import** tab.

3. Select the SQL file located at:

```
database/bd_gestionresiduos.sql
```

4. Click **Import**.

---

## 🔧 Database Connection

The local database connection is configured in:

```
database/conexion.php
```

Default local XAMPP configuration:

```php
$host = "localhost";
$user = "root";
$password = "";
$dbname = "db_gestionresiduos";
```

This configuration is intended for local academic use with XAMPP.

---

## Database Connection File

The file:

```text
database/conexion.php
```

is intentionally excluded from production credentials.

Create the file manually using:

```php
<?php

$host = "localhost";
$user = "YOUR_DATABASE_USER";
$password = "YOUR_DATABASE_PASSWORD";
$dbname = "YOUR_DATABASE_NAME";

$conexion = new mysqli(
    $host,
    $user,
    $password,
    $dbname
);

if ($conexion->connect_error) {
    die(
        "Connection failed: " .
        $conexion->connect_error
    );
}

$conexion->set_charset(
    "utf8mb4"
);
```

> [!IMPORTANT]
>
> Verify that the target server has `mysqlnd` enabled.
>
> Missing `mysqlnd` support may cause issues with MySQLi prepared statements and database interactions.

---

## 🌐 Run the Project

Open the project in the browser:

```
http://localhost/WasteManagement/
```

Main sections include:

| Section | Purpose |
|---|---|
| Home | Main landing page |
| Reports | Waste-related issue reports |
| Collection requests | Special waste collection requests |
| Map | Recycling points, biodigesters, and events |
| Education | Environmental learning content |
| Ranking | Community participation ranking |

---

## ⚠️ Notes

This project is preserved as an academic prototype and is intended for learning purposes.

The setup described in this guide reflects the original local development environment based on XAMPP and phpMyAdmin.

Production deployment, scalability, advanced security, and role management were outside the original scope.

---

## ✅ Local Setup Summary

1. Install XAMPP.
2. Copy the project into `htdocs`.
3. Start Apache and MySQL.
4. Create `db_gestionresiduos`.
5. Import `database/bd_gestionresiduos.sql`.
7. Open `http://localhost/WasteManagement/`.
