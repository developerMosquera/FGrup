-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-02-2018 a las 15:20:44
-- Versión del servidor: 5.7.20
-- Versión de PHP: 7.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fgrup`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL,
  `CLIENTE` varchar(100) NOT NULL,
  `NIT` varchar(20) NOT NULL,
  `DIRECCION` varchar(30) NOT NULL,
  `TELEFONO` double NOT NULL,
  `CORREO_1` varchar(50) NOT NULL,
  `CORREO_2` varchar(50) DEFAULT NULL,
  `FECHA_CREACION` datetime NOT NULL,
  `ESTADO` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID`, `CLIENTE`, `NIT`, `DIRECCION`, `TELEFONO`, `CORREO_1`, `CORREO_2`, `FECHA_CREACION`, `ESTADO`) VALUES
(1, 'Ropsohn', '342424-1', 'calle false 123', 24342433, 'ropsohn@hotmail.com', '', '2018-02-24 16:56:07', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `ID` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `EQUIPO` varchar(50) NOT NULL,
  `SERIAL_SISTEMA` decimal(50,0) NOT NULL,
  `SERIAL_REAL` varchar(50) NOT NULL,
  `MODELO` varchar(30) NOT NULL,
  `FECHA_CREACION` datetime DEFAULT NULL,
  `ESTADO` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`ID`, `ID_CLIENTE`, `EQUIPO`, `SERIAL_SISTEMA`, `SERIAL_REAL`, `MODELO`, `FECHA_CREACION`, `ESTADO`) VALUES
(1, 1, 'Disolutor', '2344346185', '23443dfre', '45677', '2018-02-24 16:56:07', 1),
(2, 1, 'sdfadf', '1914614196234', 'sadfadsf234', 'fasdf', '2018-02-24 17:04:35', 1),
(3, 1, 'fgfgh', '4196745645', 'dsfg45645', 'dgdfg', '2018-02-24 17:06:08', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `ID` int(11) NOT NULL,
  `ESTADO` varchar(30) NOT NULL,
  `DIAS_MAX` int(11) NOT NULL,
  `ESTADO_E` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`ID`, `ESTADO`, `DIAS_MAX`, `ESTADO_E`) VALUES
(1, 'Cotización', 3, 1),
(2, 'Posible', 20, 1),
(3, 'Programado', 10, 1),
(4, 'Ejecutado', 1, 1),
(5, 'Predictivo', -30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programador`
--

CREATE TABLE `programador` (
  `ID` int(11) NOT NULL,
  `LLAVE` decimal(50,0) NOT NULL,
  `SERIAL_SISTEMA` decimal(50,0) NOT NULL,
  `ID_SERVICIO` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `ID_CREADOR` int(11) NOT NULL,
  `ID_TECNICO` int(11) DEFAULT NULL,
  `ESTADO` smallint(6) NOT NULL DEFAULT '1',
  `FECHA_PROGRAMADOR` date NOT NULL,
  `COMBINACION` int(11) DEFAULT NULL,
  `ESTADO_COMBINACION` smallint(1) DEFAULT NULL,
  `FECHA_CREACION` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programador`
--

INSERT INTO `programador` (`ID`, `LLAVE`, `SERIAL_SISTEMA`, `ID_SERVICIO`, `ID_CLIENTE`, `ID_CREADOR`, `ID_TECNICO`, `ESTADO`, `FECHA_PROGRAMADOR`, `COMBINACION`, `ESTADO_COMBINACION`, `FECHA_CREACION`) VALUES
(1, '23443461851', '2344346185', 1, 1, 1, NULL, 1, '2018-02-27', NULL, NULL, '2018-02-24 16:56:07'),
(2, '19146141962341', '1914614196234', 1, 1, 1, NULL, 1, '2018-02-27', NULL, NULL, '2018-02-24 17:04:35'),
(3, '41967456451', '4196745645', 1, 1, 1, NULL, 1, '2018-02-27', NULL, NULL, '2018-02-24 17:06:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programador_historial`
--

CREATE TABLE `programador_historial` (
  `ID` int(11) NOT NULL,
  `LLAVE` decimal(50,0) NOT NULL,
  `SERIAL` decimal(50,0) NOT NULL,
  `ID_SERVICIO` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `ID_CREADOR` int(11) NOT NULL,
  `ID_TECNICO` int(11) NOT NULL,
  `ESTADO` smallint(6) NOT NULL DEFAULT '1',
  `FECHA` date NOT NULL,
  `COMBINACION` int(11) DEFAULT NULL,
  `ESTADO_COMBINACION` smallint(1) DEFAULT NULL,
  `FECHA_CREACION` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID` int(11) NOT NULL,
  `SERVICIO` varchar(100) NOT NULL,
  `ALIAS` varchar(100) NOT NULL,
  `PERIOCIDAD` smallint(6) NOT NULL,
  `CONBINACION` varchar(20) NOT NULL DEFAULT '0',
  `ESTADO` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`ID`, `SERVICIO`, `ALIAS`, `PERIOCIDAD`, `CONBINACION`, `ESTADO`) VALUES
(1, 'Mantenimiento', 'Mantenimiento', 6, '0', 1),
(2, 'Calibración', 'Calibración', 6, '0', 1),
(3, 'Correctivo', 'Correctivo', 0, '0', 1),
(4, 'Instalación', 'Instalación', 0, '0', 1),
(5, 'Calificación', 'Calificación', 12, '0', 1),
(6, 'Garantìa', 'Garantía', 0, '0', 1),
(7, 'Retrabajo', 'Garantía', 0, '0', 1),
(8, 'Revisión', 'Revisión', 0, '0', 1),
(9, 'Regeneración de resinas', 'Regeneración de resinas', 12, '0', 1),
(10, 'Capacitación', 'Capacitación', 0, '0', 1),
(11, 'Diagnostico', 'Diagnostico', 0, '0', 1),
(12, 'Validación', 'Validación', 24, '0', 1),
(13, 'Mantenimiento y calibración', 'Mantenimiento y calibración', 6, '1,2', 1),
(14, 'Mantenimiento, Calibración y Calificación', 'Mantenimiento, Calibración y Calificación', 12, '1,2,5', 1),
(15, 'Mantenimiento, Calibración y Validación', 'Mantenimiento, Calibración y Validación', 24, '1,2,12', 1),
(16, 'Mantenimiento, Calibración y Regeneración de resinas', 'Mantenimiento, Calibración y Regeneración de resinas', 12, '1,2,9', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `CONTRASENA` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PERFIL` smallint(6) NOT NULL DEFAULT '0',
  `PERMISOS` varchar(100) NOT NULL,
  `ESTADO` smallint(1) NOT NULL DEFAULT '0',
  `FECHA_VENCIMIENTO` date NOT NULL,
  `TOKEN` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `USUARIO`, `CONTRASENA`, `NOMBRE`, `PERFIL`, `PERMISOS`, `ESTADO`, `FECHA_VENCIMIENTO`, `TOKEN`) VALUES
(1, 'julian', '$2y$10$PeBxGU/nPcL7uZHI6kCtze.8ltkJoCbGgKWniaL/1Ir4u4ghXcDKi', 'Andres Julian Mosquera', 1, 'config=0,usuarios=0,', 1, '2019-10-31', '1e3cedb5de2fe8acdff2795aeb6dd851'),
(2, 'ingrid', '34fsdfsf', 'Ingrid Gonzalez', 1, '', 1, '2018-08-31', 'dsfsdfgg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ESTADO` (`ESTADO`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SERIAL` (`SERIAL_SISTEMA`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DIAS_MAX` (`DIAS_MAX`);

--
-- Indices de la tabla `programador`
--
ALTER TABLE `programador`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `LLAVE` (`LLAVE`),
  ADD KEY `SERIAL` (`SERIAL_SISTEMA`),
  ADD KEY `ESTADO_COMBINACION` (`ESTADO_COMBINACION`);

--
-- Indices de la tabla `programador_historial`
--
ALTER TABLE `programador_historial`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SERIAL` (`SERIAL`),
  ADD KEY `ESTADO_COMBINACION` (`ESTADO_COMBINACION`),
  ADD KEY `LLAVE` (`LLAVE`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ESTADO` (`ESTADO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USUARIO` (`USUARIO`),
  ADD KEY `CONTRASENA` (`CONTRASENA`),
  ADD KEY `PERFIL` (`PERFIL`),
  ADD KEY `TOKEN` (`TOKEN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `programador`
--
ALTER TABLE `programador`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `programador_historial`
--
ALTER TABLE `programador_historial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
