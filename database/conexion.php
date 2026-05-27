<?php

$host = "localhost";
$user = "";
$password = "";
$dbname = "";

$conexion = new mysqli($host, $user, $password, $dbname);

if ($conexion->connect_error) {
    die("Conection failed: " . $conexion->connect_error);
}

$conexion->set_charset("utf8mb4");

?>