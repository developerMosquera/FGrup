-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-02-2018 a las 20:05:52
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
(1, 'AQM LTDA.', '234.874.973', 'Carrera 80 # 23 - 89', 4530098, 'validaciones@aqm.com', '', '2018-02-25 18:19:08', 1),
(2, 'Quala', '562.863.819-1', 'Calle 71B # 34 - 78', 4621508, 'imesa@quala.com', '', '2018-02-25 18:21:30', 1),
(3, 'Synthesis S.A.S.', '345712097', 'Calle 21 # 34 - 56', 360912, 'synthesis@abbot.com', '', '2018-02-25 18:26:59', 1),
(4, 'Ropsohn Therapeutics', '236741234', 'Autopista Norte con 170', 2365742, 'estabilidades@ropsohn.com', '', '2018-02-25 18:30:35', 1),
(5, 'Pocaps', '866.039.827-9', 'Avenida Curramba # 34 - 67', 3459854, 'enrrique@procaps.com', '', '2018-02-25 18:38:02', 1),
(6, 'Glaxo Smithkline Panama', '235245664', 'via la playa # 34d - 34', 82736413, 'johan@jsk.com', '', '2018-02-25 18:44:09', 1),
(7, 'Amfar', '860534810', 'Carrera 31 # 25A - 42', 2680494, 'amfar@americanfarmagrup.com', '', '2018-02-25 20:11:43', 1),
(8, 'Eurofarma', '8470394837', 'Carrera 68 # 17 - 45', 43563456, 'Jreyes@eurofarma.coam', '', '2018-02-25 20:17:55', 1);

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
(1, 1, 'Disolutor', '12937450', '12937450', 'VK7025', '2018-02-25 18:19:08', 1),
(2, 2, 'Camara de Estabilidad', '1789854', '0178_9854', 'ADE 995', '2018-02-25 18:21:30', 1),
(3, 3, 'Durometro', '3459862323', '345986w23', 'VK100', '2018-02-25 18:26:59', 1),
(4, 4, 'Cuarto de Estabilidad', '56873462054', '56873dft54%', '91765', '2018-02-25 18:30:35', 1),
(5, 5, 'Analizador de TOC 500', '43219856', '4321-9856', '500RL', '2018-02-25 18:38:02', 1),
(6, 6, 'Nevera ', '1144625345', 'kdDFy345', 'DRF234', '2018-02-25 18:44:09', 1),
(7, 4, 'Desintegrador ', '129374501', '129374501', 'VK100', '2018-02-25 19:07:10', 1),
(8, 6, 'Mufla', '3436455432', '3436455432', 'ert67', '2018-02-25 19:09:23', 1),
(9, 7, 'Analizador de TOC M9', '44560977', '4456-0977', 'TOC M9 Portable', '2018-02-25 20:11:43', 1),
(10, 8, 'Friabilizador', '34603866', '346038ff', 'dsvdvgsg', '2018-02-25 20:17:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `ID` int(11) NOT NULL,
  `ESTADO` varchar(30) NOT NULL,
  `DIAS_MAX` int(11) NOT NULL,
  `COLOR` varchar(15) NOT NULL,
  `TEXT_COLOR` varchar(10) NOT NULL,
  `ESTADO_E` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`ID`, `ESTADO`, `DIAS_MAX`, `COLOR`, `TEXT_COLOR`, `ESTADO_E`) VALUES
(1, 'Cotización', 3, 'red', '', 1),
(2, 'Posible', 20, 'yellow', 'black', 1),
(3, 'Programado', 10, 'green', '', 1),
(4, 'Ejecutado', 1, 'orange', 'black', 1),
(5, 'Predictivo', -30, '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `ID` int(11) NOT NULL,
  `PERFIL` varchar(30) NOT NULL,
  `ESTADO` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`ID`, `PERFIL`, `ESTADO`) VALUES
(1, 'Admin', 1),
(2, 'Invitado', 1),
(3, 'Calidad', 1),
(4, 'Tecnico', 1);

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
(1, '129374501', '12937450', 1, 1, 1, NULL, 3, '2018-02-28', NULL, NULL, '2018-02-25 18:19:08'),
(2, '178985416', '1789854', 16, 2, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:21:30'),
(3, '34598623233', '3459862323', 3, 3, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:26:59'),
(4, '5687346205415', '56873462054', 15, 4, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:30:35'),
(5, '432198564', '43219856', 4, 5, 1, NULL, 2, '2018-02-28', NULL, NULL, '2018-02-25 18:38:02'),
(6, '11446253455', '1144625345', 5, 6, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:44:09'),
(7, '1293745017', '129374501', 7, 4, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 19:07:10'),
(8, '343645543213', '3436455432', 13, 6, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 19:09:23'),
(9, '4456097718', '44560977', 18, 7, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 20:11:43'),
(10, '346038666', '34603866', 6, 8, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 20:17:55'),
(11, '17898546', '1789854', 6, 2, 1, NULL, 3, '2018-03-07', NULL, NULL, '2018-02-25 20:27:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programador_historial`
--

CREATE TABLE `programador_historial` (
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
-- Volcado de datos para la tabla `programador_historial`
--

INSERT INTO `programador_historial` (`ID`, `LLAVE`, `SERIAL_SISTEMA`, `ID_SERVICIO`, `ID_CLIENTE`, `ID_CREADOR`, `ID_TECNICO`, `ESTADO`, `FECHA_PROGRAMADOR`, `COMBINACION`, `ESTADO_COMBINACION`, `FECHA_CREACION`) VALUES
(1, '129374501', '12937450', 1, 1, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:19:08'),
(2, '178985416', '1789854', 16, 2, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:21:30'),
(3, '34598623233', '3459862323', 3, 3, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:26:59'),
(4, '5687346205415', '56873462054', 15, 4, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:30:35'),
(5, '432198564', '43219856', 4, 5, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:38:02'),
(6, '11446253455', '1144625345', 5, 6, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 18:44:09'),
(7, '1293745017', '129374501', 7, 4, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 19:07:10'),
(8, '343645543213', '3436455432', 13, 6, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 19:09:23'),
(9, '4456097718', '44560977', 18, 7, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 20:11:43'),
(10, '346038666', '34603866', 6, 8, 1, NULL, 1, '2018-02-28', NULL, NULL, '2018-02-25 20:17:55'),
(11, '17898546', '1789854', 6, 2, 1, NULL, 3, '2018-03-07', NULL, NULL, '2018-02-25 20:27:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID` int(11) NOT NULL,
  `SERVICIO` varchar(100) NOT NULL,
  `ALIAS` varchar(100) NOT NULL,
  `PERIOCIDAD` smallint(6) NOT NULL,
  `PRIMER_ESTADO` smallint(6) NOT NULL,
  `CONBINACION` varchar(20) NOT NULL DEFAULT '0',
  `ESTADO` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`ID`, `SERVICIO`, `ALIAS`, `PERIOCIDAD`, `PRIMER_ESTADO`, `CONBINACION`, `ESTADO`) VALUES
(1, 'Mantenimiento', 'Mantenimiento', 6, 1, '0', 1),
(2, 'Calibración', 'Calibración', 6, 1, '0', 1),
(3, 'Correctivo', 'Correctivo', 0, 1, '0', 1),
(4, 'Instalación', 'Instalación', 0, 1, '0', 1),
(5, 'Calificación', 'Calificación', 12, 1, '0', 1),
(6, 'Garantía', 'Garantía', 0, 3, '0', 1),
(7, 'Retrabajo', 'Garantía', 0, 3, '0', 1),
(8, 'Revisión', 'Revisión', 0, 3, '0', 1),
(9, 'Regeneración de resinas', 'Regeneración de resinas', 12, 1, '0', 1),
(10, 'Capacitación', 'Capacitación', 0, 1, '0', 1),
(11, 'Diagnostico', 'Diagnostico', 0, 1, '0', 1),
(12, 'Validación', 'Validación', 24, 1, '0', 1),
(13, 'Mantenimiento y calibración', 'Mantenimiento y calibración', 6, 1, '1,2', 1),
(14, 'Mantenimiento, calibración y calificación', 'Mantenimiento, calibración y calificación', 12, 1, '1,2,5', 1),
(15, 'Mantenimiento, calibración y validación', 'Mantenimiento, calibración y validación', 24, 1, '1,2,12', 1),
(16, 'Mantenimiento, calibración y regeneración de resinas', 'Mantenimiento, calibración y regeneración de resinas', 12, 1, '1,2,9', 1),
(17, 'Calibración y calificación', 'Calibración y calificación', 12, 1, '2,5', 1),
(18, 'Instalación post venta', 'Instalación post venta', 0, 3, '0', 1),
(19, 'Capacitación post venta y/o contrato.', 'Capacitación post venta y/o contrato.', 0, 3, '0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `CONTRASENA` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `CEDULA` varchar(20) NOT NULL,
  `PERFIL` smallint(6) NOT NULL DEFAULT '0',
  `PERMISOS` varchar(100) NOT NULL,
  `ESTADO` smallint(1) NOT NULL DEFAULT '0',
  `FECHA_VENCIMIENTO` date NOT NULL,
  `TOKEN` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `USUARIO`, `CONTRASENA`, `NOMBRE`, `CEDULA`, `PERFIL`, `PERMISOS`, `ESTADO`, `FECHA_VENCIMIENTO`, `TOKEN`) VALUES
(1, 'julian', '$2y$10$PeBxGU/nPcL7uZHI6kCtze.8ltkJoCbGgKWniaL/1Ir4u4ghXcDKi', 'Andres Julian Mosquera', '1022965455', 1, 'config=0,usuarios=0,', 1, '2019-10-31', '8a7deae459e48da08b51c6a1ab7a70fd'),
(2, 'ingrid', '34fsdfsf', 'Ingrid Gonzalez', '1022974148', 1, '', 1, '2018-08-31', 'dsfsdfgg'),
(3, 'plopez', 'asda23424', 'Paulin Lopez', '114134575', 4, '', 1, '2020-12-31', ''),
(4, 'azuñiga', 'asdad34234', 'Adriana Zuñiga', '53102898', 4, '', 1, '2020-01-30', '');

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
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`ID`);

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
  ADD UNIQUE KEY `LLAVE` (`LLAVE`),
  ADD KEY `SERIAL` (`SERIAL_SISTEMA`),
  ADD KEY `ESTADO_COMBINACION` (`ESTADO_COMBINACION`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `programador`
--
ALTER TABLE `programador`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `programador_historial`
--
ALTER TABLE `programador_historial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
