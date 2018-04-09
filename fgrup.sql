-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-04-2018 a las 23:53:18
-- Versión del servidor: 10.0.34-MariaDB-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.28-0ubuntu0.16.04.1

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
  `CELULAR` varchar(40) NOT NULL,
  `CORREO_1` varchar(50) NOT NULL,
  `CORREO_2` varchar(50) DEFAULT NULL,
  `CIUDAD` varchar(140) NOT NULL,
  `CONTACTO_1` varchar(140) NOT NULL,
  `CONTACTO_2` varchar(140) NOT NULL,
  `FECHA_CREACION` datetime NOT NULL,
  `ESTADO` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID`, `CLIENTE`, `NIT`, `DIRECCION`, `TELEFONO`, `CELULAR`, `CORREO_1`, `CORREO_2`, `CIUDAD`, `CONTACTO_1`, `CONTACTO_2`, `FECHA_CREACION`, `ESTADO`) VALUES
(1, 'AQM LTDA.', '234.874.973', 'Carrera 80 # 23 - 89', 4530098, '', 'validaciones@aqm.com', '', '', '', '', '2018-02-25 18:19:08', 1),
(2, 'Quala', '562.863.819-1', 'Calle 71B # 34 - 78', 4621508, '', 'imesa@quala.com', '', '', '', '', '2018-02-25 18:21:30', 1),
(3, 'Synthesis S.A.S.', '345712097', 'Calle 21 # 34 - 56', 360912, '', 'synthesis@abbot.com', '', '', '', '', '2018-02-25 18:26:59', 1),
(4, 'Ropsohn Therapeutics', '236741234', 'Autopista Norte con 170', 2365742, '', 'estabilidades@ropsohn.com', '', '', '', '', '2018-02-25 18:30:35', 1),
(5, 'Pocaps', '866.039.827-9', 'Avenida Curramba # 34 - 67', 3459854, '', 'enrrique@procaps.com', '', '', '', '', '2018-02-25 18:38:02', 1),
(6, 'Glaxo Smithkline Panama', '235245664', 'via la playa # 34d - 34', 82736413, '', 'johan@jsk.com', '', '', '', '', '2018-02-25 18:44:09', 1),
(7, 'Amfar', '860534810', 'Carrera 31 # 25A - 42', 2680494, '', 'amfar@americanfarmagrup.com', '', '', '', '', '2018-02-25 20:11:43', 1),
(8, 'Eurofarma', '8470394837', 'Carrera 68 # 17 - 45', 43563456, '', 'Jreyes@eurofarma.coam', '', '', '', '', '2018-02-25 20:17:55', 1),
(9, 'Prueba', '32154313-1', 'cr 25 # 78 - 45', 3215214512, '7584512', 'prueba@gmail.com', 'pruebaDos@gmail.com', 'Bogotá', 'Andrea Pataquiva', 'OswaldoLuna@g.com', '2018-04-01 00:10:14', 1),
(10, 'PruebaDos', '54631-1', 'Cr 78 # 78 - 45', 3215214785, '7854644', 'Uno@g.com', '', 'Bogotá', 'Lucia Martinez', '', '2018-04-01 00:12:17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `ID` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `ID_TIPO_EQUIPO` int(11) NOT NULL,
  `ID_MARCA` int(11) NOT NULL,
  `SERIAL_SISTEMA` decimal(50,0) NOT NULL,
  `SERIAL_REAL` varchar(50) NOT NULL,
  `MODELO` varchar(30) NOT NULL,
  `FECHA_CREACION` datetime DEFAULT NULL,
  `ESTADO` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`ID`, `ID_CLIENTE`, `ID_TIPO_EQUIPO`, `ID_MARCA`, `SERIAL_SISTEMA`, `SERIAL_REAL`, `MODELO`, `FECHA_CREACION`, `ESTADO`) VALUES
(1, 10, 2, 1, '234234476467345', '234234dgfdfg-345', '3453dfg345', '2018-04-01 00:12:17', 1);

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
(1, 'Cotización', 2, 'red', '', 1),
(2, 'Posible', 20, 'yellow', 'black', 1),
(3, 'Programado', 10, 'green', '', 1),
(4, 'Ejecutado', 1, 'orange', 'black', 1),
(5, 'Predictivo', -30, '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcarEquipos`
--

CREATE TABLE `marcarEquipos` (
  `ID` int(11) NOT NULL,
  `MARCA_EQUIPO` varchar(140) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcarEquipos`
--

INSERT INTO `marcarEquipos` (`ID`, `MARCA_EQUIPO`) VALUES
(1, 'Electrolab'),
(2, 'Varian');

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
  `LLAVE_COMBINACION` decimal(50,0) NOT NULL,
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

INSERT INTO `programador` (`ID`, `LLAVE`, `LLAVE_COMBINACION`, `SERIAL_SISTEMA`, `ID_SERVICIO`, `ID_CLIENTE`, `ID_CREADOR`, `ID_TECNICO`, `ESTADO`, `FECHA_PROGRAMADOR`, `COMBINACION`, `ESTADO_COMBINACION`, `FECHA_CREACION`) VALUES
(1, '2342344764673452', '23423447646734515', '234234476467345', 2, 10, 1, NULL, 1, '2018-04-04', NULL, NULL, '2018-04-01 00:12:17'),
(2, '2342344764673453', '23423447646734515', '234234476467345', 3, 10, 1, NULL, 1, '2018-04-04', NULL, NULL, '2018-04-01 00:12:17'),
(14, '23423447646734535', '23423447646734535', '234234476467345', 35, 10, 1, NULL, 3, '2018-04-03', NULL, NULL, '2018-04-01 01:29:29'),
(13, '23423447646734526', '23423447646734526', '234234476467345', 26, 10, 1, NULL, 3, '2018-04-03', NULL, NULL, '2018-04-01 01:29:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programador_historial`
--

CREATE TABLE `programador_historial` (
  `ID` int(11) NOT NULL,
  `LLAVE` decimal(50,0) NOT NULL,
  `LLAVE_COMBINACION` decimal(50,0) NOT NULL,
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

INSERT INTO `programador_historial` (`ID`, `LLAVE`, `LLAVE_COMBINACION`, `SERIAL_SISTEMA`, `ID_SERVICIO`, `ID_CLIENTE`, `ID_CREADOR`, `ID_TECNICO`, `ESTADO`, `FECHA_PROGRAMADOR`, `COMBINACION`, `ESTADO_COMBINACION`, `FECHA_CREACION`) VALUES
(1, '2342344764673452', '23423447646734515', '234234476467345', 2, 10, 1, NULL, 1, '2018-04-04', NULL, NULL, '2018-04-01 00:12:17'),
(2, '2342344764673453', '23423447646734515', '234234476467345', 3, 10, 1, NULL, 1, '2018-04-04', NULL, NULL, '2018-04-01 00:12:17'),
(3, '23423447646734535', '0', '234234476467345', 35, 10, 1, NULL, 3, '2018-04-11', NULL, NULL, '2018-04-01 00:55:10'),
(4, '23423447646734535', '23423447646734535', '234234476467345', 35, 10, 1, NULL, 3, '2018-04-03', NULL, NULL, '2018-04-01 01:28:52'),
(5, '23423447646734526', '23423447646734526', '234234476467345', 26, 10, 1, NULL, 3, '2018-04-03', NULL, NULL, '2018-04-01 01:29:10'),
(6, '23423447646734535', '23423447646734535', '234234476467345', 35, 10, 1, NULL, 3, '2018-04-03', NULL, NULL, '2018-04-01 01:29:29');

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
  `DIAS_MAX` smallint(6) NOT NULL,
  `CONBINACION` varchar(20) NOT NULL DEFAULT '0',
  `ESTADO` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`ID`, `SERVICIO`, `ALIAS`, `PERIOCIDAD`, `PRIMER_ESTADO`, `DIAS_MAX`, `CONBINACION`, `ESTADO`) VALUES
(1, 'Mantenimiento', 'Mantenimiento', 6, 1, 2, '0', 1),
(2, 'Calibración', 'Calibración', 6, 1, 2, '0', 1),
(3, 'Calificacion (PQ)', 'PQ ', 12, 1, 2, '0', 1),
(4, 'Calibración (MQ)', 'MQ (Paletas y canastillas)', 6, 1, 2, '0', 1),
(5, 'Calificación (PVT)', 'PVT (Paletas y canastillas)', 12, 1, 2, '0', 1),
(6, 'Mantenimiento y calibración (MQ)', 'Mantenimiento y MQ (Paletas y canastillas)', 6, 1, 2, '1,4', 1),
(7, 'Calibración (MQ) y calificación (PVT) ', 'MQ (Paletas y canastillas) y PVT (Paletas y canastillas) ', 12, 1, 2, '4,5', 1),
(8, 'Mantenimiento, calibración (MQ) y  calificación (PVT)', 'Mantenimiento, MQ (Paletas y canastillas) y PVT (Paletas y canastillas) ', 12, 1, 2, '1,4,5', 1),
(9, 'Calibración 1(MQ)', 'MQ (Paletas)', 6, 1, 2, '0', 1),
(10, 'Calificación 1(PVT)', 'PVT (Paletas)', 12, 1, 2, '0', 1),
(11, 'Mantenimiento y calibración 1(MQ)', 'Mantenimiento y MQ (Paletas)', 6, 1, 2, '1,9', 1),
(12, 'Calibración 1(MQ) y calificación 1(PVT)', 'MQ (Paletas) y PVT (Paletas)', 12, 1, 2, '9,10', 1),
(13, 'Mantenimiento, calibración 1(MQ) y calificación 1(PVT)', 'Mantenimiento, MQ (Paletas) y PVT (Paletas)', 12, 1, 2, '1,9,10', 1),
(14, 'Mantenimiento y calibración ', 'Mantenimiento y calibración ', 6, 1, 2, '1,2', 1),
(15, 'Calibración y calificación (PQ)', 'Calibración y PQ', 12, 1, 2, '2,3', 1),
(16, 'Mantenimiento, calibración y calificación (PQ)', 'Mantenimiento, calibración y PQ', 12, 1, 2, '1,2,3', 1),
(17, 'Calibración (OQ)', 'OQ', 12, 1, 2, '0', 1),
(18, 'System', 'System', 6, 1, 2, '0', 1),
(19, 'Verificación', 'Verificación', 0, 1, 2, '0', 1),
(20, 'Mantenimiento y calibración (OQ)', 'Mantenimiento y OQ', 12, 1, 2, '1,17', 1),
(21, 'Mantenimiento, calibración (OQ) y calificación (PQ)', 'Mantenimiento, OQ y PQ', 24, 1, 2, '1,17,3', 1),
(22, 'Mantenimiento y system', 'Mantenimiento y system', 6, 1, 2, '1,18', 1),
(23, 'Mantenimiento, verificación y system', 'Mantenimiento, verificación y system', 12, 1, 2, '1,19,18', 1),
(24, 'Calificación', 'Calificación', 12, 1, 2, '0', 1),
(25, 'Correctivo', 'Correctivo', 0, 1, 2, '0', 1),
(26, 'Retrabajo', 'Garantía', 0, 3, 2, '0', 1),
(27, 'Revisión', 'Revisión', 0, 3, 10, '0', 1),
(28, 'Regeneración de resinas', 'Regeneración de resinas', 12, 1, 2, '0', 1),
(29, 'Capacitación', 'Capacitación', 0, 1, 2, '0', 1),
(30, 'Diagnostico', 'Diagnostico', 0, 1, 2, '0', 1),
(31, 'Instalación traslado', 'Instalación por traslado', 0, 1, 2, '0', 1),
(32, 'Capacitación venta y/o contrato', 'Capacitación venta y/o contrato', 0, 3, 2, '0', 1),
(33, 'Instalación venta', 'Instalación venta', 0, 3, 2, '0', 1),
(34, 'Mantenimiento, calibración y regeneración de resinas ', 'Mantenimiento, calibración y regeneración de resinas ', 12, 1, 2, '1,2,28', 1),
(35, 'Garantía', 'Garantía', 0, 3, 2, '0', 1),
(36, 'Mantenimiento y verificación.', 'Mantenimiento y verificación.', 6, 1, 2, '1,19', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposEquipos`
--

CREATE TABLE `tiposEquipos` (
  `ID` int(11) NOT NULL,
  `TIPO_EQUIPO` varchar(140) NOT NULL,
  `ESTADO` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposEquipos`
--

INSERT INTO `tiposEquipos` (`ID`, `TIPO_EQUIPO`, `ESTADO`) VALUES
(1, 'Disolutor', 1),
(2, 'Camaras de estabilidad', 1),
(3, 'Cuartos de estbilidad', 1),
(4, 'Toc 900 - m9 - 500', 1),
(5, 'Chekpoint modo one line', 1),
(6, 'Chekpoint modo grap', 1),
(7, 'Inobox', 1),
(8, 'Toc 5310', 1),
(9, 'Toc 860', 1),
(10, 'Incubadoras', 1),
(11, 'Neveras', 1),
(12, 'Hornos', 1),
(13, 'Estufas', 1),
(14, 'Muflas', 1),
(15, 'Desintegradores', 1),
(16, 'Durometros', 1),
(17, 'Friabilizadores', 1),
(18, 'Ph metros', 1),
(19, 'Conductivimetros', 1),
(20, 'Bombas de vacio', 1),
(21, 'Bomba de hermeticidad', 1),
(22, 'Agitador de tamices', 1),
(23, 'Agitador de vibromatic', 1),
(24, 'Agitador electrico', 1),
(25, 'Refractometros', 1),
(26, 'Biodis', 1),
(27, 'Torcometro', 1),
(28, 'Torquimetro', 1),
(29, 'Destilador de agua', 1),
(30, 'Destilador de nitrogeno', 1),
(31, 'Penetrometro', 1),
(32, 'Determinador de grasa', 1),
(33, 'Medidor de densidad', 1),
(34, 'Determinador de celulosa y fibra', 1),
(35, 'Medidor de oxigeno', 1),
(36, 'Espectrofotometro', 1),
(37, 'Baño serologico', 1),
(38, 'Baño ultrasonido', 1),
(39, 'Baño termostado', 1),
(40, 'Baño de maria', 1),
(41, 'Deshumidificador', 1),
(42, 'lavadora de materiales', 1),
(43, 'Microscopio', 1),
(44, 'Simulador solar', 1),
(45, 'Centrifuga', 1),
(46, 'Autoclave', 1),
(47, 'Polarimetro', 1),
(48, 'Armario refrigerado', 1),
(49, 'Fusiometro', 1),
(50, 'Desgasificador', 1),
(51, 'Contador de particulas', 1),
(52, 'Viscocimetro', 1),
(53, 'Banco de sangre', 1),
(54, 'Cabina de extraccion', 1),
(55, 'Congelador', 1),
(56, 'Total solution disolutor - automuestreador y espectrofotometro', 1),
(57, 'Automuestrador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposEquiposServicios`
--

CREATE TABLE `tiposEquiposServicios` (
  `ID` int(11) NOT NULL,
  `ID_TIPO_EQUIPO` int(11) NOT NULL,
  `ID_SERVICIO` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposEquiposServicios`
--

INSERT INTO `tiposEquiposServicios` (`ID`, `ID_TIPO_EQUIPO`, `ID_SERVICIO`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 1, 7),
(6, 1, 8),
(7, 1, 9),
(8, 1, 10),
(9, 1, 11),
(10, 1, 12),
(11, 1, 13),
(12, 1, 27),
(13, 1, 26),
(14, 1, 32),
(15, 1, 33),
(16, 1, 35),
(17, 2, 1),
(18, 2, 2),
(19, 2, 3),
(20, 2, 14),
(21, 2, 15),
(22, 2, 16),
(23, 2, 27),
(24, 2, 26),
(25, 2, 32),
(26, 2, 33),
(27, 2, 35),
(28, 3, 1),
(29, 3, 2),
(30, 3, 3),
(31, 3, 14),
(32, 3, 15),
(33, 3, 16),
(34, 3, 27),
(35, 3, 26),
(36, 3, 32),
(37, 3, 33),
(38, 3, 35),
(39, 4, 1),
(40, 4, 17),
(41, 4, 3),
(42, 4, 20),
(43, 4, 21),
(44, 4, 22),
(45, 4, 23),
(46, 4, 27),
(47, 4, 26),
(48, 4, 32),
(49, 4, 33),
(50, 4, 35),
(51, 5, 1),
(52, 5, 17),
(53, 5, 3),
(54, 5, 20),
(55, 5, 21),
(56, 5, 22),
(57, 5, 23),
(58, 5, 27),
(59, 5, 26),
(60, 5, 32),
(61, 5, 33),
(62, 5, 35),
(63, 6, 1),
(64, 6, 17),
(65, 6, 3),
(66, 6, 20),
(67, 6, 21),
(68, 6, 22),
(69, 6, 23),
(70, 6, 27),
(71, 6, 26),
(72, 6, 32),
(73, 6, 33),
(74, 6, 35),
(75, 7, 1),
(76, 7, 17),
(77, 7, 20),
(78, 7, 27),
(79, 7, 26),
(80, 7, 32),
(81, 7, 33),
(82, 7, 35),
(83, 8, 1),
(84, 8, 17),
(85, 8, 20),
(86, 8, 27),
(87, 8, 26),
(88, 8, 32),
(89, 8, 33),
(90, 8, 35),
(91, 9, 1),
(92, 9, 17),
(93, 9, 3),
(94, 9, 20),
(95, 9, 21),
(96, 9, 22),
(97, 9, 23),
(98, 9, 27),
(99, 9, 26),
(100, 9, 32),
(101, 9, 33),
(102, 9, 35),
(103, 10, 1),
(104, 10, 2),
(105, 10, 3),
(106, 10, 14),
(107, 10, 15),
(108, 10, 16),
(109, 10, 27),
(110, 10, 26),
(111, 10, 32),
(112, 10, 33),
(113, 10, 35),
(114, 11, 1),
(115, 11, 2),
(116, 11, 3),
(117, 11, 14),
(118, 11, 15),
(119, 11, 16),
(120, 11, 27),
(121, 11, 26),
(122, 11, 32),
(123, 11, 33),
(124, 11, 35),
(125, 12, 1),
(126, 12, 2),
(127, 12, 3),
(128, 12, 14),
(129, 12, 15),
(130, 12, 16),
(131, 12, 27),
(132, 12, 26),
(133, 12, 32),
(134, 12, 33),
(135, 12, 35),
(136, 13, 1),
(137, 13, 2),
(138, 13, 3),
(139, 13, 14),
(140, 13, 15),
(141, 13, 16),
(142, 13, 27),
(143, 13, 26),
(144, 13, 32),
(145, 13, 33),
(146, 13, 35),
(147, 14, 1),
(148, 14, 2),
(149, 14, 14),
(150, 14, 27),
(151, 14, 26),
(152, 14, 32),
(153, 14, 33),
(154, 14, 35),
(155, 15, 1),
(156, 15, 19),
(157, 15, 36),
(158, 15, 27),
(159, 15, 26),
(160, 15, 32),
(161, 15, 33),
(162, 15, 35),
(163, 16, 1),
(164, 16, 2),
(165, 16, 14),
(166, 16, 27),
(167, 16, 26),
(168, 16, 32),
(169, 16, 33),
(170, 16, 35),
(171, 17, 1),
(172, 17, 19),
(173, 17, 36),
(174, 17, 27),
(175, 17, 26),
(176, 17, 32),
(177, 17, 33),
(178, 17, 35),
(179, 18, 1),
(180, 18, 2),
(181, 18, 14),
(182, 18, 27),
(183, 18, 26),
(184, 18, 32),
(185, 18, 33),
(186, 18, 35),
(187, 19, 1),
(188, 19, 2),
(189, 19, 14),
(190, 19, 27),
(191, 19, 26),
(192, 19, 32),
(193, 19, 33),
(194, 19, 35),
(195, 20, 1),
(196, 20, 27),
(197, 20, 26),
(198, 20, 32),
(199, 20, 33),
(200, 20, 35),
(201, 21, 1),
(202, 21, 27),
(203, 21, 26),
(204, 21, 32),
(205, 21, 33),
(206, 21, 35),
(207, 22, 1),
(208, 22, 27),
(209, 22, 26),
(210, 22, 32),
(211, 22, 33),
(212, 22, 35),
(213, 23, 1),
(214, 23, 27),
(215, 23, 26),
(216, 23, 32),
(217, 23, 33),
(218, 23, 35),
(219, 24, 1),
(220, 24, 27),
(221, 24, 26),
(222, 24, 32),
(223, 24, 33),
(224, 24, 35),
(225, 25, 1),
(226, 25, 19),
(227, 25, 36),
(228, 25, 27),
(229, 25, 26),
(230, 25, 32),
(231, 25, 33),
(232, 25, 35),
(233, 26, 1),
(234, 26, 19),
(236, 26, 36),
(237, 26, 27),
(238, 26, 26),
(239, 26, 32),
(240, 26, 33),
(241, 26, 35),
(242, 27, 1),
(243, 27, 27),
(244, 27, 26),
(245, 27, 32),
(246, 27, 33),
(247, 27, 35),
(248, 28, 1),
(249, 28, 2),
(250, 28, 14),
(251, 28, 27),
(252, 28, 26),
(253, 28, 32),
(254, 28, 33),
(255, 28, 35),
(256, 29, 1),
(257, 29, 27),
(258, 29, 26),
(259, 29, 32),
(260, 29, 33),
(261, 29, 35),
(262, 30, 1),
(263, 30, 27),
(264, 30, 26),
(265, 30, 32),
(266, 30, 33),
(267, 30, 35),
(268, 31, 1),
(269, 31, 19),
(270, 31, 36),
(271, 31, 27),
(272, 31, 26),
(273, 31, 32),
(274, 31, 33),
(275, 31, 35),
(276, 32, 1),
(277, 32, 27),
(278, 32, 26),
(279, 32, 32),
(280, 32, 33),
(281, 32, 35),
(282, 33, 1),
(283, 33, 27),
(284, 33, 26),
(285, 33, 32),
(286, 33, 33),
(287, 33, 35),
(288, 34, 1),
(289, 34, 27),
(290, 34, 26),
(291, 34, 32),
(292, 34, 33),
(293, 34, 35),
(294, 35, 1),
(295, 35, 2),
(296, 35, 14),
(297, 35, 27),
(298, 35, 26),
(299, 35, 32),
(300, 35, 33),
(301, 35, 35),
(302, 36, 1),
(303, 36, 2),
(304, 36, 14),
(305, 36, 27),
(306, 36, 26),
(307, 36, 32),
(308, 36, 33),
(309, 36, 35),
(310, 37, 1),
(311, 37, 2),
(312, 37, 14),
(313, 37, 27),
(314, 37, 26),
(315, 37, 32),
(316, 37, 33),
(317, 37, 35),
(318, 38, 1),
(319, 38, 27),
(320, 38, 26),
(321, 38, 32),
(322, 38, 33),
(323, 38, 35),
(324, 39, 1),
(325, 39, 2),
(326, 39, 14),
(327, 39, 27),
(328, 39, 26),
(329, 39, 32),
(330, 39, 33),
(331, 39, 35),
(332, 40, 1),
(333, 40, 2),
(334, 40, 14),
(335, 40, 27),
(336, 40, 26),
(337, 40, 32),
(338, 40, 33),
(339, 40, 35),
(340, 41, 1),
(341, 41, 27),
(342, 41, 26),
(343, 41, 32),
(344, 41, 33),
(345, 41, 35),
(346, 42, 1),
(347, 42, 27),
(348, 42, 26),
(349, 42, 32),
(350, 42, 33),
(351, 42, 35),
(352, 43, 1),
(353, 43, 27),
(354, 43, 26),
(355, 43, 32),
(356, 43, 33),
(357, 43, 35),
(358, 44, 1),
(359, 44, 27),
(360, 44, 26),
(361, 44, 32),
(362, 44, 33),
(363, 44, 35),
(364, 45, 1),
(365, 45, 27),
(366, 45, 26),
(367, 45, 32),
(368, 45, 33),
(369, 45, 35),
(370, 46, 1),
(371, 46, 19),
(372, 46, 36),
(373, 46, 27),
(374, 46, 26),
(375, 46, 32),
(376, 46, 33),
(377, 46, 35),
(378, 47, 1),
(379, 47, 2),
(380, 47, 14),
(381, 47, 27),
(382, 47, 26),
(383, 47, 32),
(384, 47, 33),
(385, 47, 35),
(386, 48, 1),
(387, 48, 2),
(388, 48, 3),
(389, 48, 14),
(390, 48, 15),
(391, 48, 16),
(392, 48, 27),
(393, 48, 26),
(394, 48, 32),
(395, 48, 33),
(396, 48, 35),
(397, 49, 1),
(398, 49, 2),
(399, 49, 14),
(400, 49, 27),
(401, 49, 26),
(402, 49, 32),
(403, 49, 33),
(404, 49, 35),
(405, 50, 1),
(406, 50, 27),
(407, 50, 26),
(408, 50, 32),
(409, 50, 33),
(410, 50, 35),
(411, 51, 1),
(412, 51, 17),
(413, 51, 3),
(414, 51, 20),
(415, 51, 21),
(416, 51, 27),
(417, 51, 26),
(418, 51, 32),
(419, 51, 33),
(420, 51, 35),
(421, 52, 1);

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
(1, 'julian', '$2y$10$PeBxGU/nPcL7uZHI6kCtze.8ltkJoCbGgKWniaL/1Ir4u4ghXcDKi', 'Andres Julian Mosquera', '1022965455', 1, 'config=0,usuarios=0,', 1, '2019-10-31', '39ec1e1cbc1d132a8cec69447e531ab2'),
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
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`),
  ADD KEY `ID_TIPO_EQUIPO` (`ID_TIPO_EQUIPO`),
  ADD KEY `ID_MARCA` (`ID_MARCA`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DIAS_MAX` (`DIAS_MAX`);

--
-- Indices de la tabla `marcarEquipos`
--
ALTER TABLE `marcarEquipos`
  ADD PRIMARY KEY (`ID`);

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
  ADD KEY `ESTADO_COMBINACION` (`ESTADO_COMBINACION`),
  ADD KEY `LLAVE_COMBINACION` (`LLAVE_COMBINACION`);

--
-- Indices de la tabla `programador_historial`
--
ALTER TABLE `programador_historial`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SERIAL` (`SERIAL_SISTEMA`),
  ADD KEY `ESTADO_COMBINACION` (`ESTADO_COMBINACION`),
  ADD KEY `LLAVE_COMBINACION` (`LLAVE_COMBINACION`),
  ADD KEY `LLAVE` (`LLAVE`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ESTADO` (`ESTADO`),
  ADD KEY `DIAS_MAX` (`DIAS_MAX`);

--
-- Indices de la tabla `tiposEquipos`
--
ALTER TABLE `tiposEquipos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tiposEquiposServicios`
--
ALTER TABLE `tiposEquiposServicios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_TIPO_EQUIPO` (`ID_TIPO_EQUIPO`),
  ADD KEY `ID_SERVICIO` (`ID_SERVICIO`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `marcarEquipos`
--
ALTER TABLE `marcarEquipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `programador`
--
ALTER TABLE `programador`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `programador_historial`
--
ALTER TABLE `programador_historial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT de la tabla `tiposEquipos`
--
ALTER TABLE `tiposEquipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT de la tabla `tiposEquiposServicios`
--
ALTER TABLE `tiposEquiposServicios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
