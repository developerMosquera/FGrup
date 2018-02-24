-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-02-2018 a las 22:53:11
-- Versión del servidor: 10.0.33-MariaDB-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, 'Farmacias emoty', '12546988-1', 'cr 54 # 32 - 40', 7584566, 'femoty@hotmail.com', '', '0000-00-00 00:00:00', 1),
(2, 'Farmatodo', '15152154-1', 'Calle 26 # 32 - 21', 7588565, 'farmatodo@gmail.com', '', '0000-00-00 00:00:00', 1),
(3, 'Quimicos diarios', '52152477-4', 'cr 32 # 26 - 32', 6325212, 'qumic@gmail.com', '', '0000-00-00 00:00:00', 1),
(4, 'asdsad', 'sdf', 'sdf', 345345, 'dfd@g.com', '', '2018-02-22 23:21:48', 1),
(6, 'prueba concliente', 'as34', 'asdasda', 23423423, 'sadad@g.ocm', '', '2018-02-22 23:31:08', 1);

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
(21, 2, 'pruebaFinal', '56456351851833131', '564563erer33131', 'sdf33s', '2018-02-23 22:18:35', 1);

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
(1, '1254512511251', '254512511251', 1, 1, 1, 1, 1, '2018-02-15', 0, 0, '2018-02-27 00:00:00'),
(2, '4561820722876106575463553551', '456182072287610657546355355', 1, 1, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:08:40'),
(3, '1943342348', '194334234', 8, 3, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:17:48'),
(4, '119410', '1194', 10, 3, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:18:34'),
(5, '194634519469', '19463451946', 9, 2, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:19:25'),
(6, '191461194610', '1914611946', 10, 3, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:21:12'),
(7, '19146119463410', '191461194634', 10, 4, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:21:48'),
(8, '34223423518181', '3422342351818', 1, 4, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:25:00'),
(9, '161821521315143129514205231', '16182152131514312951420523', 1, 6, 1, NULL, 1, '2018-02-25', NULL, NULL, '2018-02-22 23:31:08'),
(10, '564563518518331311', '56456351851833131', 1, 2, 1, NULL, 1, '2018-02-26', NULL, NULL, '2018-02-23 22:18:35');

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

--
-- Volcado de datos para la tabla `programador_historial`
--

INSERT INTO `programador_historial` (`ID`, `LLAVE`, `SERIAL`, `ID_SERVICIO`, `ID_CLIENTE`, `ID_CREADOR`, `ID_TECNICO`, `ESTADO`, `FECHA`, `COMBINACION`, `ESTADO_COMBINACION`, `FECHA_CREACION`) VALUES
(1, '1254512511251', '254512511251', 1, 1, 1, 1, 1, '2018-02-28', 0, 0, '2018-02-20 00:00:00');

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
(2, 'Calibraciòn', 'Calibraciòn', 6, '0', 1),
(3, 'Correctivo', 'Correctivo', 0, '0', 1),
(4, 'Instalaciòn', 'Instalaciòn', 0, '0', 1),
(5, 'Calificaciòn', 'Calificaciòn', 12, '0', 1),
(6, 'Garantìa', 'Garantìa', 0, '0', 1),
(7, 'Retrabajo', 'Garantìa', 0, '0', 1),
(8, 'Revisiòn', 'Revisiòn', 0, '0', 1),
(9, 'Regeneraciòn de resinas', 'Regeneraciòn de resinas', 12, '0', 1),
(10, 'Capacitaciòn', 'Capacitaciòn', 0, '0', 1),
(11, 'Diagnostico', 'Diagnostico', 0, '0', 1),
(12, 'Validaciòn', 'Validaciòn', 24, '0', 1),
(13, 'Mantenimiento y calibraciòn', 'Mantenimiento y calibraciòn', 6, '1,2', 1),
(14, 'Mantenimiento, Calibraciòn y Calificaciòn', 'Mantenimiento, Calibraciòn y Calificaciòn', 12, '1,2,5', 1),
(15, 'Mantenimiento, Calibraciòn y Validaciòn', 'Mantenimiento, Calibraciòn y Validaciòn', 24, '1,2,12', 1),
(16, 'Mantenimiento, Calibraciòn y Regeneraciòn de resinas', 'Mantenimiento, Calibraciòn y Regeneraciòn de resinas', 12, '1,2,9', 1);

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
(1, 'julian', '$2y$10$PeBxGU/nPcL7uZHI6kCtze.8ltkJoCbGgKWniaL/1Ir4u4ghXcDKi', 'Andres Julian Mosquera', 1, 'config=0,usuarios=0,', 1, '2019-10-31', '1bd0df3c5442a11f96474cbbcabb1b7f'),
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `programador`
--
ALTER TABLE `programador`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `programador_historial`
--
ALTER TABLE `programador_historial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
