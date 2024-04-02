-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2024 a las 06:29:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `delivery`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `encomienda` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'P',
  `genero` varchar(20) NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idpedido`, `direccion`, `cliente`, `encomienda`, `estado`, `genero`, `fecha_entrega`, `create_at`, `imagen`) VALUES
(2, 'Avenida del Sol #456', 'Juan Martínez', 'Electrodomésticos', 'E', 'Electrodomésticos', '2024-03-12', '2024-03-24 14:39:22', 'cakes_packet.jpg'),
(4, 'Avenida del Mar #1011', 'Ana García', 'Productos de Belleza', 'P', 'Belleza', '2024-03-18', '2024-03-24 14:39:22', 'cookies_paket.jpg'),
(5, 'Calle de la Luna #1314', 'Pedro Pérez', 'Herramientas de Carpintería', 'P', 'Herramientas', '2024-03-20', '2024-03-24 14:39:22', 'donus_packet.jpg'),
(6, 'Avenida de las Flores #1617', 'Laura Sánchez', 'Electrónicos', 'P', 'Electrónicos', '2024-03-22', '2024-03-24 14:39:22', 'fruits.jpg'),
(7, 'Calle de las Estrellas #1920', 'Carlos González', 'Juguetes Educativos', 'P', 'Juguetes', '2024-03-25', '2024-03-24 14:39:22', 'glassFruit.jpg'),
(9, 'Calle de los Pinos #2324', 'Daniel Soto', 'Muebles Rústicos', 'P', 'Muebles', '2024-03-30', '2024-03-24 14:39:22', 'mini_packet.jpg'),
(11, 'Avenida de las Palmeras #376', 'Juana Mauricio', 'Artículos de Hogar', 'P', 'Hogar', '2024-04-02', '2024-03-24 16:00:03', 'paneton_packet.jpg'),
(12, 'Avenida de las Palmeras #376', 'Lupe Juan', 'Artículos de Hogar', 'P', 'Hogar', '2024-04-02', '2024-03-24 16:01:02', 'cakes_packet.jpg'),
(13, 'ndireccion', 'ncliente', 'nencomienda', 'P', 'delivery', NULL, '2024-03-25 00:28:30', 'chinese_food_packet.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `claveacceso` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombres`, `apellidos`, `correo`, `claveacceso`, `create_at`) VALUES
(1, 'Lucas Alfredp', 'Atuncar Valerio', 'lucasatuncar1@gmail.com', '123456', '2024-03-24 14:29:55'),
(2, 'Adriana Arlet', 'Durand BUenamarca', 'AdrianaDurand@gmail.com', '654321', '2024-03-24 14:29:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
