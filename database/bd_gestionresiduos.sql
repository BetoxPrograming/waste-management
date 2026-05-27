-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-05-2026 a las 01:16:20
-- Versión del servidor: 11.4.10-MariaDB-cll-lve-log
-- Versión de PHP: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `betotido_wastemanagement`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares_mapa`
--

CREATE TABLE `lugares_mapa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `latitud` decimal(10,8) NOT NULL,
  `longitud` decimal(11,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `lugares_mapa`
--

INSERT INTO `lugares_mapa` (`id`, `nombre`, `descripcion`, `tipo`, `latitud`, `longitud`) VALUES
(1, 'Punto de Reciclaje Principal', 'Recepción de plástico, vidrio, cartón y aluminio.', 'reciclaje', 9.98440000, -84.73430000),
(2, 'Centro de Acopio Comunitario', 'Punto comunal para separación y entrega de materiales reciclables.', 'reciclaje', 9.98290000, -84.73570000),
(3, 'Biodigestor Comunitario', 'Área destinada al aprovechamiento de residuos orgánicos.', 'biodigestor', 9.98190000, -84.73680000),
(4, 'Zona de Compostaje Vecinal', 'Espacio de apoyo para residuos orgánicos y educación ambiental.', 'biodigestor', 9.98520000, -84.73290000),
(5, 'Taller Ambiental Comunitario', 'Actividad sobre reciclaje y separación de residuos.', 'evento', 9.98600000, -84.73380000),
(6, 'Campaña de Limpieza Vecinal', 'Punto de encuentro para limpieza comunitaria.', 'evento', 9.98360000, -84.73190000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recolecciones`
--

CREATE TABLE `recolecciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_residuo` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `fecha_solicitada` date DEFAULT NULL,
  `fecha_confirmada` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `recolecciones`
--

INSERT INTO `recolecciones` (`id`, `id_usuario`, `tipo_residuo`, `direccion`, `estado`, `fecha_solicitada`, `fecha_confirmada`) VALUES
(1, 2, 'Peligroso', 'Calle 5, El Roble', 'Pendiente', '2026-05-26', NULL),
(2, 2, 'Reciclable', 'Calle hacia la escuela', 'Pendiente', '2026-05-26', NULL),
(3, 2, 'Reciclable', 'Sector norte de El Roble', 'En proceso', '2026-05-26', '2026-05-27'),
(4, 2, 'Tecnológico', 'Punto de reciclaje comunal', 'Pendiente', '2026-05-26', NULL),
(5, 2, 'Orgánico', 'Cerca del parque infantil', 'Completado', '2026-05-26', '2026-05-27'),
(6, 2, 'Reciclable', 'Parada frente al supermercado', 'Pendiente', '2026-05-26', NULL),
(7, 2, 'Orgánico', 'Calle secundaria 3', 'En proceso', '2026-05-26', '2026-05-27'),
(8, 2, 'Reciclable', 'Cuneta de la calle principal', 'Pendiente', '2026-05-26', NULL),
(9, 3, 'Reciclable', 'Sector oeste de El Roble', 'Pendiente', '2026-05-26', NULL),
(10, 5, 'Reciclable', 'Punto ecológico comunal', 'En proceso', '2026-05-26', '2026-05-27'),
(11, 7, 'Peligroso', 'Entrada del barrio', 'Pendiente', '2026-05-26', NULL),
(12, 10, 'Reciclable', 'Sector sur del barrio', 'Completado', '2026-05-26', '2026-05-27'),
(13, 14, 'Orgánico', 'Zona del biodigestor comunitario', 'Pendiente', '2026-05-26', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id`, `id_usuario`, `descripcion`, `foto`, `ubicacion`, `fecha`) VALUES
(1, 2, 'Se observan bolsas de basura acumuladas cerca de la acera principal desde hace varios días.', 'imagenes/reportes/bf9db113-60d5-4d80-8004-1d3b7ca0f812.png', 'Entrada principal de El Roble', '2026-05-27 01:34:08'),
(2, 2, 'Hay residuos plásticos mezclados con restos orgánicos en una zona común.', NULL, 'Parque comunal', '2026-05-27 01:34:08'),
(3, 2, 'Un contenedor se encuentra lleno y varios vecinos están dejando bolsas alrededor.', NULL, 'Frente a la pulpería central', '2026-05-27 01:34:08'),
(4, 2, 'Se reporta presencia de botellas de vidrio quebradas cerca de una zona transitada.', 'imagenes/reportes/94bf0ae0-dc94-472f-b9d3-58b8d7b83c6b.png', 'Calle hacia la escuela', '2026-05-27 01:34:08'),
(5, 2, 'Hay cartones mojados acumulados junto a un poste, posiblemente por falta de recolección.', NULL, 'Sector norte de El Roble', '2026-05-27 01:34:08'),
(6, 2, 'Se encontraron residuos electrónicos pequeños abandonados cerca del punto de reciclaje.', NULL, 'Punto de reciclaje comunal', '2026-05-27 01:34:08'),
(7, 2, 'Se reporta mal olor por acumulación de desechos orgánicos sin separar.', 'imagenes/reportes/e5ffaef4-24f9-4c7d-919e-a742459da75d.png', 'Calle secundaria 3', '2026-05-27 01:34:08'),
(8, 2, 'Hay bolsas abiertas por animales cerca de varias viviendas.', NULL, 'Barrio Los Almendros', '2026-05-27 01:34:08'),
(9, 2, 'Se observa basura dispersa después de una actividad comunitaria.', 'imagenes/reportes/a449f8d8-538f-4f02-bff2-e4b9d57f1215.png', 'Cancha comunal', '2026-05-27 01:34:08'),
(10, 2, 'Hay recipientes plásticos acumulando agua y podrían generar criaderos de mosquitos.', 'imagenes/reportes/bc0d30fd-bc4d-462f-badc-a50ac6370f5d.png', 'Zona verde detrás del salón comunal', '2026-05-27 01:34:08'),
(11, 2, 'Se reporta falta de señalización en el punto de separación de residuos.', NULL, 'Centro de acopio temporal', '2026-05-27 01:34:08'),
(12, 2, 'Un vecino dejó muebles viejos en la vía pública sin coordinar recolección.', 'imagenes/reportes/076ab454-ceb2-473f-8a0a-54208138fb69.png', 'Calle 5, El Roble', '2026-05-27 01:34:08'),
(13, 2, 'Hay residuos de poda bloqueando parcialmente la acera.', NULL, 'Cerca del parque infantil', '2026-05-27 01:34:08'),
(14, 2, 'Se encontraron latas y plásticos en una cuneta luego de la lluvia.', 'imagenes/reportes/1a459ffa-f06c-4c11-b3fc-96e5feaf307c.png', 'Calle principal', '2026-05-27 01:34:08'),
(15, 2, 'Se reporta acumulación de basura cerca de una parada de bus.', 'imagenes/reportes/0fefa675-b284-4ffb-994f-f0b5fe491d6d.png', 'Parada frente al supermercado', '2026-05-27 01:34:08'),
(16, 3, 'Se solicita revisión de un punto donde los residuos reciclables están siendo mezclados con basura común.', NULL, 'Sector oeste de El Roble', '2026-05-27 01:34:08'),
(17, 3, 'Hay bolsas de basura acumuladas en una esquina donde normalmente no pasa el camión recolector.', NULL, 'Calle Los Laureles', '2026-05-27 01:34:08'),
(18, 5, 'Se reporta que el contenedor de reciclaje para plástico está lleno desde la semana pasada.', 'imagenes/reportes/30b835c9-8887-42fd-a2eb-ad779f45ae21.png', 'Punto ecológico comunal', '2026-05-27 01:34:08'),
(19, 5, 'Se observa aceite usado derramado cerca de una alcantarilla.', NULL, 'Cercanías del minisúper', '2026-05-27 01:34:08'),
(20, 7, 'Hay residuos de construcción pequeños abandonados junto a una zona peatonal.', NULL, 'Entrada del barrio', '2026-05-27 01:34:08'),
(21, 7, 'Se solicita limpieza de una zona donde se acumularon bolsas después del fin de semana.', 'imagenes/reportes/d7eee66b-452c-4a4c-a26f-3bced52712ab.png', 'Alrededores de la cancha', '2026-05-27 01:34:08'),
(22, 10, 'Se reporta que algunos vecinos están dejando residuos fuera del horario de recolección.', NULL, 'Calle 2, El Roble', '2026-05-27 01:34:08'),
(23, 10, 'Hay una acumulación de botellas plásticas cerca del canal de agua.', NULL, 'Sector sur del barrio', '2026-05-27 01:34:08'),
(24, 14, 'Se encontraron residuos orgánicos sin embolsar cerca del punto de biodigestor.', 'imagenes/reportes/74ca70c7-d6f3-4a81-b06c-ddc037d05897.png', 'Zona del biodigestor comunitario', '2026-05-27 01:34:08'),
(25, 14, 'Se reporta falta de limpieza alrededor de los contenedores de separación.', 'imagenes/reportes/2e4f515b-f4e2-40c6-a53d-f237a8233887.png', 'Área comunal de reciclaje', '2026-05-27 01:34:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `direccion` text DEFAULT NULL,
  `numero_casa` varchar(20) DEFAULT NULL,
  `comunidad` varchar(100) NOT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `puntos` int(11) DEFAULT 0,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `telefono` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`, `direccion`, `numero_casa`, `comunidad`, `foto_perfil`, `puntos`, `fecha_registro`, `telefono`) VALUES
(1, 'Administrador', 'admin@wastemanagement.test', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Administración comunitaria', 'null', 'El Roble', '../imagenes/usuarios/1779858659_c728ceb9-7a9f-4cc5-be6d-1cfc2a30219b.png', 0, '2026-05-27 01:29:03', '0000-0000'),
(2, 'Usuario Anónimo', 'anonimo@wastemanagement.test', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'null', 'null', 'El Roble', '../imagenes/usuarios/1779858756_53e6cfe6-7ef3-4811-9841-7882cead4bdf.png', 0, '2026-05-27 01:29:03', 'null'),
(3, 'María Rodríguez', 'maria.rodriguez@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-03', 'El Roble', '../imagenes/usuarios/1779857623_cdec1932-9a64-4da1-b111-4b48960df4d3.png', 0, '2026-05-27 01:29:03', '8888-0003'),
(4, 'Carlos Méndez', 'carlos.mendez@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-04', 'El Roble', '../imagenes/usuarios/1779858290_7f18913f-3fc7-4236-a3a2-ad6f64879085.png', 0, '2026-05-27 01:29:03', '8888-0004'),
(5, 'Ana Vargas', 'ana.vargas@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-05', 'El Roble', '../imagenes/usuarios/1779858242_7c45bbcf-cb31-47e3-bc12-3ca4505c141d.png', 0, '2026-05-27 01:29:03', '8888-0005'),
(6, 'Luis Fernández', 'luis.fernandez@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-06', 'El Roble', NULL, 0, '2026-05-27 01:29:03', '8888-0006'),
(7, 'Sofía Castro', 'sofia.castro@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-07', 'El Roble', NULL, 0, '2026-05-27 01:29:03', '8888-0007'),
(8, 'Diego Morales', 'diego.morales@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-08', 'El Roble', NULL, 0, '2026-05-27 01:29:03', '8888-0008'),
(9, 'Valeria Jiménez', 'valeria.jimenez@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-09', 'El Roble', '../imagenes/usuarios/1779857974_d500a592-18e2-40f6-a50a-e347c7097d60.png', 0, '2026-05-27 01:29:03', '8888-0009'),
(10, 'Andrés Soto', 'andres.soto@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-10', 'El Roble', '../imagenes/usuarios/1779858336_30362dd5-53be-4973-b969-445e0a19759e.png', 0, '2026-05-27 01:29:03', '8888-0010'),
(11, 'Camila Herrera', 'camila.herrera@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-11', 'El Roble', NULL, 0, '2026-05-27 01:29:03', '8888-0011'),
(12, 'José Ramírez', 'jose.ramirez@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-12', 'El Roble', '../imagenes/usuarios/1779857818_2ef9be71-cea8-4d80-a395-d4297f649c76.png', 0, '2026-05-27 01:29:03', '8888-0012'),
(13, 'Daniela Rojas', 'daniela.rojas@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-13', 'El Roble', '../imagenes/usuarios/1779858499_6c3bea31-e964-47f7-b77c-111a43c998c8.png', 0, '2026-05-27 01:29:03', '7688-0013'),
(14, 'Pablo Alvarado', 'pablo.alvarado@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-14', 'El Roble', '../imagenes/usuarios/1779856930_db8dc933-290e-4037-b6fb-a7ab9699183d.png', 0, '2026-05-27 01:29:03', '8888-0014'),
(15, 'Natalia Vega', 'natalia.vega@example.com', '$2y$10$D4pXf49kIAoeKMW3g08moudvaw0BhCGk/bx2lrJ4OeZ80ajiVVvNu', 'Barrio El Roble, Puntarenas', 'A-15', 'El Roble', NULL, 0, '2026-05-27 01:29:03', '8888-0015');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_taller` (`id_taller`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `lugares_mapa`
--
ALTER TABLE `lugares_mapa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recolecciones`
--
ALTER TABLE `recolecciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugares_mapa`
--
ALTER TABLE `lugares_mapa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `recolecciones`
--
ALTER TABLE `recolecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
