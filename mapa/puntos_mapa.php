<?php
header('Content-Type: application/json; charset=utf-8');

include("../database/conexion.php");

$result = $conexion->query("SELECT * FROM lugares_mapa");

$lugares = [];

if ($result) {
    while ($fila = $result->fetch_assoc()) {
        $lugares[] = $fila;
    }
}

echo json_encode($lugares ?: [], JSON_UNESCAPED_UNICODE | JSON_INVALID_UTF8_SUBSTITUTE);