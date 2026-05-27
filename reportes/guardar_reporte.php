<?php
include("../database/conexion.php");


$barrio = $_POST['barrio'];
$nombre = $_POST['nombre'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];
$descripcion = $_POST['descripcion'];
$foto = null;

if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
    $carpeta_destino = '../imagenes/reportes/';

    if (!is_dir($carpeta_destino)) {
        mkdir($carpeta_destino, 0755, true);
    }

    $nombre_archivo = basename($_FILES['foto']['name']);
    $extension = strtolower(pathinfo($nombre_archivo, PATHINFO_EXTENSION));

    $extensiones_permitidas = ['jpg', 'jpeg', 'png', 'webp'];

    if (in_array($extension, $extensiones_permitidas)) {
        $nombre_archivo_final = time() . '_' . $nombre_archivo;
        $ruta_servidor = $carpeta_destino . $nombre_archivo_final;
        $foto = 'imagenes/reportes/' . $nombre_archivo_final;

        move_uploaded_file($_FILES['foto']['tmp_name'], $ruta_servidor);
    }
}

$sql_usuario =  "SELECT id FROM usuarios WHERE correo = ?";
$stmt_usuario = $conexion->prepare($sql_usuario);
$stmt_usuario->bind_param("s", $email);
$stmt_usuario->execute();
$result = $stmt_usuario->get_result();

if ($result->num_rows > 0) {
    $usuario = $result->fetch_assoc();
    $id_usuario = $usuario['usuario_id'];
} else {
    $sql_insert_usuario = "INSERT INTO usuarios (nombre, correo, telefono, comunidad, contrasena) VALUES (?, ?, ?, ?, ?)";
    $stmt_insert = $conexion->prepare($sql_insert_usuario);
    $contrasena_generica = password_hash("123456", PASSWORD_DEFAULT);
    $stmt_insert->bind_param("sssss", $nombre, $email, $telefono, $barrio, $contrasena_generica);
    $stmt_insert->execute();
    $id_usuario = $stmt_insert->insert_id;
}

session_start();
$id_usuario = isset($_SESSION['usuario_id']) ? $_SESSION['usuario_id'] : 2;
$sql_reporte = "INSERT INTO reportes (id_usuario, descripcion, ubicacion, foto) VALUES (?, ?, ?, ?)";
$stmt_reporte = $conexion->prepare($sql_reporte);
$stmt_reporte->bind_param("isss", $id_usuario, $descripcion, $barrio, $foto);
$stmt_reporte->execute();

$conexion->close();


echo "<script>alert('Reporte enviado con éxito'); window.history.back();</script>";
?>
