-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-09-2020 a las 08:12:49
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gatosm5t_sai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_horario` int(11) NOT NULL,
  `edad_min` int(11) NOT NULL,
  `edad_max` int(11) NOT NULL,
  `id_sexo` int(11) NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `id_horario`, `edad_min`, `edad_max`, `id_sexo`, `ip`, `usuario`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Primera', 1, 18, 40, 1, '', '', '2019-04-06 00:15:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto_pago`
--

CREATE TABLE `concepto_pago` (
  `id_concepto` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `concepto_pago`
--

INSERT INTO `concepto_pago` (`id_concepto`, `descripcion`, `ip`, `usuario`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Anualidad', '', '', '2019-03-08 23:42:24', '2019-03-09 00:14:52'),
(2, 'Mensualidad', '', '', '2019-03-09 00:12:27', '2019-03-09 00:14:46'),
(3, 'Abono Anualidad', '', '', '2020-05-29 13:59:42', '0000-00-00 00:00:00'),
(4, 'Inscripcion', '', '', '2020-05-29 13:59:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_emergencia`
--

CREATE TABLE `contacto_emergencia` (
  `id_contacto_emergencia` int(11) NOT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_fijo` int(11) NOT NULL,
  `telefono_movil` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id_eps` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id_eps`, `nombre`, `ip`, `usuario`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(0, 'Seleccione', '127.0.0.1', 'Alex', '2018-08-30 23:54:07', '2018-08-30 23:54:14'),
(1, 'Sura', '127.0.0.1', 'Alex', '2018-08-30 23:53:35', '2020-06-30 16:16:16'),
(2, 'Sisben', '127.0.0.1', 'Alex', '2020-06-30 16:14:34', '2020-06-30 16:14:55'),
(3, 'Salud Total S.A. E.P.S', '127.0.0.1', 'Alex', '2020-06-30 16:14:34', '0000-00-00 00:00:00'),
(4, 'E.P.S.  Sanitas S.A.', '127.0.0.1', 'Alex', '2020-06-30 16:17:46', '0000-00-00 00:00:00'),
(5, 'Coomeva E.P.S.', '127.0.0.1', 'Alex', '2020-06-30 16:17:46', '0000-00-00 00:00:00'),
(6, 'Salud Colmena E.P.S. S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(7, 'Salud Total S.A. E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(8, 'Cafesalud E.P.S. S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(9, 'BONSALUD En Liquidación', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(10, 'E.P.S. Sanitas S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(11, 'Instituto de Seguros Sociales EPS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(12, 'Unimec E.P.S. S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(13, 'Compensar E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(14, 'EPS Progr. Comfenalco Antioquia', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(15, 'SuSalud EPS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(16, 'Colseguros E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(17, 'Comfenalco Valle E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(18, 'E.P.S. Saludcoop', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(19, 'Humana Vivir S.A. E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(20, 'Salud Colpatria E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(21, 'Coomeva E.P.S. S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(22, 'E.P.S. Famisanar LTDA.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(23, 'EPS Servicio Occidental de Salud S.A. - EPS-S.O.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(24, 'EPS Risaralda Ltda. En Liquidación', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(25, 'Caprecom EPS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(26, 'Corporanonimas en Liquidación', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(27, 'EPS CONVIDA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(28, 'CRUZ BLANCA EPS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(29, 'CAJANAL EPS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(30, 'CAPRESOCA EPS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(31, 'SOLSALUD E.P.S. S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(32, 'BARRANQUILLA SANA E.P.S. En Liquidación', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(33, 'CALISALUD E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(34, 'E.P.S. de CALDAS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(35, 'E.P.S. CONDOR S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(36, 'SELVASALUD S.A. E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(37, 'Metropolitana de Salud EPS en Liquidación', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(38, 'SALUDVIDA EPS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(39, 'ASESORÍA NACIONAL EN SALUD MEDICINA PREPAGADA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(40, 'CAFESALUD MEDICINA PREPAGADA S. A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(41, 'COMPAÑÍA DE MEDICINA PREPAGADA COLSANITAS S. A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(42, 'CAJA DE COMPENSACIÓN FAMILIAR COMFENALCO VALLE DEL', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(43, 'HUMANA S.A. COMPAÑÍA DE MEDICINA PREPAGADA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(44, 'MEDISALUD COMPAÑÍA COLOMBIANA DE MEDICINA PREPAGAD', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(45, 'MEDISÁNITAS S.A COMPAÑÍA DE MEDICINA PREPAGADA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(46, 'SALUD COLMENA S.A. MEDICINA PREPAGADA.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(47, 'SALUD COLPATRIA S.A MEDICINA PREPAGADA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(48, 'SALUD COOMEVA MEDICINA PREPAGADA S. A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(49, 'COMPAÑÍA SURAMERICANA DE SERVICIOS DE SALUD S.A SU', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(50, 'VIVIR S.A MEDICINA PREPAGADA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(51, 'Fondo de Previsión Social del Congreso de la Repúb', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(52, 'Caja de Previsión Social de la Universidad Industr', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(53, 'Caja de Previsión Social de Nariño.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(54, 'Caja de Previsión Social Municipal de Bucaramanga ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(55, 'División de Servicios Médico Asistencial de la Cor', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(56, 'División de Salud de la Universidad de Antioquia .', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(57, 'Caja de Previsión Social de la Universidad del Cau', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(58, 'Caja de Previsión Social Municipal de Ibagué.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(59, 'Caja de Previsión Departamental de Arauca.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(60, 'Servicio de Salud de la Corporación Autónoma Regio', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(61, 'Servicio Médico de las Empresas Varias de Medellín', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(62, 'Servicio Médico Universidad de Caldas.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(63, 'Departamento Médico y Odontológico del Municipio d', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(64, 'División de Servicio Médico del Municipio de Santi', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(65, 'Caja de Previsión Social Departamental del Cauca \"', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(66, 'Empresas Públicas de Medellín Departamento Médico', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(67, 'Caja de Previsión Social de Boyacá.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(68, 'Caja Departamental de Previsión de Norte de Santan', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(69, 'Caja de Previsión Social de la Superintendencia Ba', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(70, 'Caja de Previsión Social de la Universidad Tecnoló', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(71, 'Caja de Previsión Social de la Universidad Naciona', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(72, 'Instituto Colombiano de la Reforma Agraria Program', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(73, 'Industria Licorera de Caldas Servicio Médico.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(74, 'Servicio Médico de la Universidad del Valle.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(75, 'Fondo de Salud de la Universidad de Córdoba .', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(76, 'Fondo de Pasivo Social de la Empresa Puertos de Co', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(77, 'Fondo de Pasivo Social de Ferrocarriles Nacionales', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(78, 'Fondo Prestacional de la Universidad de Nariño.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(79, 'Empresa de Acueducto y Alcantarillado de Bogotá E.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(80, 'Caja de Previsión Social de la Universidad de Cart', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(81, 'COOPERATIVA DE SALUD Y DESARROLLO INTEGRAL DE LA Z', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(82, 'EMPRESA MUTUAL PARA EL DESARROLLO INTEGRAL DE LA S', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(83, 'ASOCIACION MUTUAL LA ESPERANZA ASMET SALUD ESS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(84, 'COOPERATIVA DE SALUD COMUNITARIA DE GARCIA ROVIRA ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(85, 'E CODIGOS DE ENTIDADES ADMINISTRADORAS DE PLANES D', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(86, 'ASOCIACION MUTUAL EMPRESA SOLIDARIA DE SALUD DE NA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(87, 'EMPRESA COOPERATIVA SOLIDARIA DE SALUD “ECOOPSOS”', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(88, 'SOCIEDAD SOLIDARIA DE SALUD “SOLSALUD E.P.S S.A.”', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(89, 'CAJA DE COMPENSACION FAMILIAR DE ANTIOQUIA “COMFAM', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(90, 'CAJA DE COMPENSACION FAMILIAR CARTAGO “COMFACARTAG', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(91, 'CAJA DE COMPENSACION FAMILIAR DE FENALCO DEL TOLIM', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(92, 'CAJA DE COMPENSACION FAMILIAR CAMACOL, “COMFAMILIA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(93, 'UNION TEMPORAL COMFAMILIARES EN SALUD U.T. (COMFAM', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(94, 'ASOCIACION DE CABILDOS INDIGENAS DEL CESAR DUSAKAW', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(95, 'ASOCIACION DE CABILDOS DEL RESGUARDO INDIGENA SINU', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(96, 'CAFESALUD EP.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(97, 'EMMANUEL EPS INDIGENA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(98, 'CAJA DE PREVISION SOCIAL DE COMUNCIACIONES “CAPREC', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(99, 'SALUD TOTAL S.A. E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(100, 'SELVASALUD S.A. E.PS.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(101, 'PROMOTORA DE SALUD GUAITARA EPSI', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(102, 'UNION TEMPORAL. ARS COMFENALCO (QUINDIO, SANTANDER', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(103, 'CONVENIO COMFAMA-COMFAMILIAR CAMACOL- UNION TEMPOR', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(104, 'ENTIDAD PROMOTORA DE SALUD MALLAMAS EPSI', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(105, 'CAJA DE COMPENSACION FAMILIAR DE RISARALDA, COMFAM', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(106, 'CAJA DE COMPENSACION FAMILIAR DE BARRANCABERMEJA “', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(107, 'CAJA DE COMPENSACION FAMILIAR DE CORDOBA “COMFACOR', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(108, 'CAJA DE COMPENSACION FAMILIAR DE FENALCO COMFENALC', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(109, 'CALISALUD EPS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(110, 'ASOCIACION INDIGENA DEL CAUCA “AIC”', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(111, 'ASOCIACION MUTUAL LA SUIZA DE AMERICA EPS INDIGENA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(112, 'HUMANA VIVIR S.A. EP.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(113, 'ENTIDAD PROMOTORA DE SALUD, PIJAOSALUD EPSI', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(114, 'COOMEVA EPS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(115, 'E.P.S. CONDOR S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(116, 'CAJA SALUD ARS UNION TEMPORAL', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(117, 'MUTUAL SER E.S.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(118, 'COMFENALCO ANTIOQUIA E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(119, 'ASFAMILIAS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(120, 'CAFAM', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(121, 'ASOCIACION MUTUAL BARRIOS UNIDOS DE QUIBDO E.S.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(122, 'SALUD VIDA S.A. E.P.S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(123, 'ANAS WAYUU EPS INDIGENA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(124, 'TAYRONA EPS INDIGENA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(125, 'ASEGURADORA COLSEGUROS S. A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(126, 'ACE SEGUROS S.A. (ANTES: CIGNA SEGUROS DE COLOMBIA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(127, 'SEGUROS COLPATRIA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(128, 'COMPAÑÍA AGRÍCOLA DE SEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(129, 'COMPAÑÍA ASEGURADORA DE FIANZAS S.A., CONFIANZA (V', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(130, 'COMPAÑÍA CENTRAL DE SEGUROS S.A. CENTRAL DE SEGURO', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(131, 'ABN AMRO SEGUROS (COLOMBIA) S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(132, 'COMPAÑÍA DE SEGUROS COLMENA S.A. SEGUROS COLMENA, ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(133, 'EXPRESIÓN COLMENA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(134, 'GENERALI COLOMBIA-SEGUROS GENERALES S.A', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(135, 'ROYAL & SUN ALLIANCE SEGUROS (COLOMBIA) S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(136, 'COMPAÑÍA MUNDIAL DE SEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(137, 'COMPAÑÍA SURAMERICANA DE SEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(138, 'CÓNDOR S.A. COMPAÑÍA DE SEGUROS GENERALES', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(139, 'ASEGURADORA EL LIBERTADOR, S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(140, 'CHUBB DE COLOMBIA COMPAÑÍA DE SEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(141, 'LA INTERAMERICANA COMPAÑÍA DE SEGUROS GENERALES S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(142, 'LA PREVISORA S.A. COMPAÑÍA DE SEGUROS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(143, 'SEGUROS ALFA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(144, 'MAPFRE SEGUROS GENERALES DE COLOMBIA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(145, 'SEGUROS COMERCIALES BOLÍVAR S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(146, 'SEGUROS DEL ESTADO S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(147, 'SEGUREXPO DE COLOMBIA S.A. ASEGURADORA DE CRÉDITO ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(148, 'LIBERTY SEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(149, 'BBVA SEGUROS GANADERO COMPAÑÍA DE SEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(150, 'COMPAÑÍA DE SEGUROS DE CRÉDITOS COMERCIALES S.A. C', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(151, 'ASEGURADORA DE VIDA COLSEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(152, 'SEGUROS DE VIDA COLPATRIA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(153, 'COMPAÑÍA AGRÍCOLA DE SEGUROS DE VIDA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(154, 'COMPAÑÍA DE SEGUROS BOLÍVAR S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(155, 'COMPAÑÍA DE SEGUROS DE VIDA AURORA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(156, 'SKANDIA COMPAÑÍA DE SEGUROS DE VIDA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(157, 'GENERALI COLOMBIA VIDA COMPAÑÍA DE SEGUROS S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(158, 'COMPAÑÍA SURAMERICANA DE SEGUROS DE VIDA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(159, 'AIG COLOMBIA SEGUROS DE VIDA S.A. SIGLA: AIG VIDA ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(160, 'CYBERSEGUROS DE COLOMBIA S.A. (ANTES LA NACIONAL C', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(161, 'MUNDIAL DE SEGUROS DE VIDA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(162, 'PAN AMERICAN DE COLOMBIA COMPAÑÍA DE SEGUROS DE VI', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(163, 'SEGUROS DE VIDA ALFA S.A. VIDALFA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(164, 'LIBERTY SEGUROS DE VIDA S.A. (ANTES: LATINOAMERICA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(165, 'SEGUROS DE VIDA DEL ESTADO S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(166, 'ROYAL & SUN ALLIANCE SEGUROS DE VIDA (COLOMBIA) S.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(167, 'LA PREVISORA VIDA S.A. COMPAÑÍA DE SEGUROS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(168, 'RIESGOS PROFESIONALES COLMENA S.A. COMPAÑÍA DE SEG', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(169, 'BBV SEGUROS GANADERO COMPAÑÍA DE SEGUROS DE VIDA S', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(170, 'COMPAÑÍA CENTRAL DE SEGUROS DE VIDA S.A.', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(171, 'COMPAÑÍA SURAMERICANA ADMINISTRADORA DE RIESGOS PR', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(172, 'LA EQUIDAD SEGUROS DE VIDA ORGANISMO COOPERATIVO -', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(173, 'LA EQUIDAD SEGUROS GENERALES ORGANISMO COOPERATIVO', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(174, 'IRECCIÓN DEPARTAMENTAL DE SALUD DE ANTIOQUIA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(175, 'IRECCIÓN DEPARTAMENTAL DE SALUD DE ATLÁNTICO', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(176, 'DIRECCIÓN DISTRITAL DE SALUD DE BOGOTÁ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(177, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE BOLÍVAR', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(178, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE BOYACÁ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(179, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CALDAS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(180, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CAQUETÁ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(181, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CAUCA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(182, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CESAR', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(183, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CÓRDOBA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(184, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CUNDINAMARCA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(185, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CHOCÓ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(186, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE HUILA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(187, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE GUAJIRA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(188, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE MAGDALENA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(189, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE META', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(190, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE NARIÑO', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(191, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE NORTE DE SANTA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(192, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE QUINDÍO', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(193, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE RISARALDA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(194, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE SANTANDER', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(195, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE SUCRE', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(196, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE TOLIMA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(197, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE VALLE', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(198, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE ARAUCA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(199, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE CASANARE', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(200, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE PUTUMAYO', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(201, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE SAN ANDRÉS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(202, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE AMAZONAS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(203, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE GUAINÍA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(204, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE GUAVIARE', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(205, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE VAUPÉS', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(206, 'DIRECCIÓN DEPARTAMENTAL DE SALUD DE VICHADA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(207, 'POLICÍA NACIONAL', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(208, 'ECOPETROL', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(209, 'FUERZAS MILITARES', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(210, 'FONDO DE PRESTACIONES SOCIALES DEL MAGISTERIO', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(211, 'FONDO DE PRESTACIONES SOCIALES DEL CONGRESO DE LA ', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(212, 'FONDO DE SOLIDARIDAD Y GARANTÍA – MINISTERIO DE SA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(213, 'INPEC', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(214, 'SERVICIO NACIONAL DE APRENDIZAJE - SENA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(215, 'BANCO DE LA REPÚBLICA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(216, 'EMPRESA DE TELÉFONOS DE BOGOTÁ - ETB', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(217, 'FERROCARRILES NACIONALES', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(218, 'AVIANCA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00'),
(219, 'BAVARIA', '', '', '2020-07-01 22:16:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`, `ip`, `usuario`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Activo', '', '', '2018-06-13 23:43:56', '0000-00-00 00:00:00'),
(2, 'Inactivo', '', '', '2018-06-13 23:43:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `dias` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_deportiva`
--

CREATE TABLE `informacion_deportiva` (
  `id_informacion_dep` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `id_posicion` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `observaciones` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `informacion_deportiva`
--

INSERT INTO `informacion_deportiva` (`id_informacion_dep`, `fecha_inicio`, `id_posicion`, `id_categoria`, `observaciones`, `id_miembro`, `status`, `ip`, `usuario`, `created_at`, `updated_at`) VALUES
(1, '2019-04-05', 1, 1, 'Ala', 1234567, '2', '127.0.0.1', 'Alex', '2019-04-06 00:31:01', '2019-09-03 22:54:29'),
(2, '2020-07-01', 1, 1, '', 987, '', '201.233.146.180', 'ppi', '2020-07-01 21:23:46', '2020-07-01 21:23:46'),
(3, '2020-07-01', 1, 1, '', 987, '2', '201.233.146.180', 'ppi', '2020-07-01 21:23:46', '2020-07-01 21:25:40'),
(4, '2020-07-01', 1, 1, '', 987, '', '201.233.146.180', 'ppi', '2020-07-01 21:29:38', '2020-07-01 21:29:38'),
(5, '2020-07-22', 1, 1, '', 1128468505, '1', '181.55.63.184', 'Alex', '2020-07-22 18:51:58', '2020-07-22 19:23:56'),
(6, '2020-07-21', 1, 1, '', 1212, '1', '191.95.147.24', 'Alex', '2020-07-22 21:21:01', '2020-07-22 21:21:01'),
(7, '2020-07-15', 1, 1, '', 654, '1', '191.95.147.24', 'Alex', '2020-07-22 21:45:20', '2020-07-22 21:45:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_tipo_doc` int(11) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacm` date NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_eps` int(11) NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`id`, `nombres`, `apellidos`, `id_tipo_doc`, `identificacion`, `telefono`, `direccion`, `email`, `fecha_nacm`, `id_estado`, `id_eps`, `ip`, `usuario`, `created_at`, `updated_at`) VALUES
(2, 'ccz', 'sad', 1, 1234567, 2367905, 'Calle Sol', 'ad@sa.com', '1996-01-27', 1, 1, '127.0.0.1', 0, '2019-03-08 23:56:00', '2019-11-04 09:06:20'),
(3, 'Prueba', 'Pruea', 1, 123456, 123456789, 'CL 42#63C-163', 'adsa@ds.com', '1996-06-07', 1, 1, '127.0.0.1', 0, '2019-03-09 19:26:12', '2020-04-04 07:20:13'),
(4, 'wqdWA', 'WQDSA', 1, 2147483647, 124, 'CL 42#63C-163', 'admin@phptravels.com', '1996-09-09', 2, 1, '127.0.0.1', 0, '2019-03-09 20:08:29', '2019-03-09 20:08:29'),
(6, 'ppi', 'ppi', 1, 1234567890, 124253, 'CL 42#63C-1636', 'admin@phptravels.com', '1996-09-09', 2, 1, '127.0.0.1', 0, '2019-03-09 20:37:10', '2019-09-03 21:24:21'),
(7, '', '', 0, 0, 0, '', '', '0000-00-00', 1, 0, '127.0.0.1', 0, '2019-10-26 03:26:53', '2019-10-26 03:26:53'),
(8, 'PPI', 'PPI', 1, 1212, 1232443, 'Calle sol', 'adadad@sc.com', '1996-06-11', 1, 1, '127.0.0.1', 0, '2019-10-29 10:42:01', '2019-10-29 10:42:01'),
(9, 'PPp', 'PPp', 1, 322312, 2131321, 'Calle Sol', 'sad@gmail.com', '1995-11-20', 1, 1, '127.0.0.1', 0, '2019-11-04 08:48:31', '2020-04-17 10:12:09'),
(10, 'implantar', 'implantar', 1, 213213, 123213213, 'sadasd', 'asdsad@gmail.com', '2020-02-11', 2, 1, '127.0.0.1', 0, '2020-02-15 05:33:19', '2020-02-15 05:33:28'),
(11, 'Manuel', 'Correa', 1, 1128468505, 2147483647, 'CL 70D#94D-13', 'manuelc123@gmail.com', '1988-05-23', 1, 1, '190.248.182.85', 0, '2020-06-30 21:12:38', '2020-06-30 21:12:38'),
(12, 'pepe', 'apellido', 1, 987, 1234567, 'carrera 77 #33 A 24 Edificio Torre Vicenzo apt 1001', 'pepe@gmail.com', '2020-07-11', 1, 1, '201.233.146.180', 0, '2020-07-01 21:21:01', '2020-07-01 21:21:01'),
(13, 'proyecto', 'integrador', 1, 654, 1017226238, 'Calle 77 sur No. 50A-184', 'ppityt@elpoli.edu.co', '2000-06-23', 1, 1, '191.95.147.24', 0, '2020-07-22 21:15:05', '2020-07-22 21:15:05'),
(14, 'proyecto pedagógico', 'integrador', 1, 369, 1017226238, 'Calle 77 sur No. 50A-184', 'ppityt@elpoli.edu.co', '2000-06-23', 1, 1, '191.95.147.24', 0, '2020-07-22 21:15:21', '2020-07-22 22:07:58'),
(15, 'proyecto', 'integrador', 1, 258, 1017226238, 'Calle 77 sur No. 50A-184', 'ppityt@elpoli.edu.co', '2000-06-23', 1, 1, '191.95.147.24', 0, '2020-07-22 21:15:48', '2020-07-22 21:15:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
('20171102191345'),
('20171103014428');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `fecha_pago` date NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL,
  `num_recibo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `soporte_recibo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `valor`, `fecha_pago`, `id_miembro`, `id_concepto`, `num_recibo`, `soporte_recibo`, `ip`, `usuario`, `created_at`, `updated_at`) VALUES
(1, 100000, '2019-03-08', 1234567, 1, '001', '', '', '', '2019-03-08 23:48:44', '2020-05-29 15:02:31'),
(2, 200000, '2019-03-08', 123456, 1, '002', '', '', '', '2019-03-08 23:51:05', '2020-05-29 15:02:37'),
(3, 300000, '2019-03-07', 1212, 1, '003', '', '', '', '2019-03-08 23:56:57', '2020-05-29 15:02:42'),
(4, 20000, '2019-03-08', 2147483647, 2, '004', '', '', '', '2019-03-09 00:12:53', '2020-05-29 15:02:45'),
(9, 100, '2020-06-05', 1234567, 1, 'A001', NULL, '127.0.0.1', 'Alex', '2020-05-30 05:25:01', '2020-05-30 05:25:01'),
(10, 100000, '2020-05-29', 1234567, 1, 'A002', NULL, '127.0.0.1', 'Alex', '2020-05-30 06:50:55', '2020-05-30 06:50:55'),
(11, 1000000, '2020-07-01', 987, 1, '100', NULL, '201.233.146.180', 'ppi', '2020-07-01 21:36:29', '2020-07-01 21:36:29'),
(12, 9999999999, '2020-07-24', 987, 1, '01', NULL, '191.95.147.24', 'Alex', '2020-07-22 21:50:35', '2020-07-22 21:50:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre`, `ip`, `usuario`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(0, 'Seleccione', '', '', '2018-06-13 23:49:03', '0000-00-00 00:00:00'),
(1, 'Administrador', '', '', '2018-06-13 23:49:03', '0000-00-00 00:00:00'),
(2, 'Jugador', '', '', '2018-06-13 23:49:03', '0000-00-00 00:00:00'),
(3, 'Miembro', '', '', '2018-06-13 23:49:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicion_juego`
--

CREATE TABLE `posicion_juego` (
  `id_posicion_juego` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `posicion_juego`
--

INSERT INTO `posicion_juego` (`id_posicion_juego`, `nombre`, `ip`, `usuario`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Win', '', '', '2019-04-06 00:14:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id_sexo` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id_sexo`, `nombre`, `ip`, `usuario`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Masculino', '', '', '2019-04-06 00:14:45', '0000-00-00 00:00:00'),
(2, 'Femenino', '', '', '2019-04-06 00:14:45', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc`
--

CREATE TABLE `tipo_doc` (
  `id_tipo_doc` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_doc`
--

INSERT INTO `tipo_doc` (`id_tipo_doc`, `nombre`) VALUES
(0, 'Seleccione'),
(1, 'Cédula Ciudadania'),
(2, 'Tarjeta de identidad'),
(3, 'Registro Civil'),
(4, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identificacion` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `foto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `identificacion`, `email`, `password`, `group_id`, `status`, `foto`, `ip`, `usuario`, `created_at`, `updated_at`) VALUES
(4, 'Alex', 123213132, 'alexcuba96@gmail.com', '$2y$10$sWp/Xsa7.AEjq3jMW2I7E.8ijFGjkZU0.olgh7yYwY6GRIluCQYVC', 1, 1, 'Prueba.jpg', '', '', '2019-10-17 05:00:00', '2020-08-17 20:29:58'),
(13, 'desarrolloUpdate', 123124634, 'desarrollo@grc.com', '$2y$10$ZWDEp2KvDg0x2GCzbVL/Zem3WP/DU0QxagMOksDgv3jPbk3NXfNgq', 1, 2, 'desarrollo.png', '127.0.0.1', 'Alex', '2018-06-01 23:37:20', '2020-02-20 21:19:41'),
(21, 'ds', 1234567890, 'asd@dsac.com', '$2y$10$VAYMfUVrABFCqbuJaFuJbOaxtmIkmR0r3kPfq2tl0u044KmICQd..', 2, 2, 'ds.jpg', '127.0.0.1', 'Alex', '2019-03-09 05:27:10', '2019-09-03 21:17:56'),
(22, 'ppi', 1017238239, 'alexcuba966@gmail.com', '$2y$10$rAYI/tXlul7HyAYcP.Izl.7pMF.D./jSj7uh7WbgkYI9QBx/gpaJa', 1, 2, 'ppi.jpg', '127.0.0.1', 'Alex', '2019-03-09 20:35:45', '2019-11-04 07:51:17'),
(23, 'Prueba', 1234454325, 'prueba@gmail.com', '$2y$10$v6PMDTgwPN1S0y3Gptw4Ke22tdQlZqluptEIKoJk72NnsSZFbI.Q6', 1, 2, 'Prueba.png', '127.0.0.1', 'Alex', '2019-11-04 07:23:33', '2020-02-20 20:48:08'),
(24, 'IMP', 1234521321, 'PP@GMAIL.COM', '$2y$10$ZiKeseAttiRowa8fgYxrtuSTKcRO5GdjyttoVdbUUQzpT1AcDyYiO', 2, 2, 'IMP.PNG', '127.0.0.1', 'Alex', '2020-02-15 05:30:27', '2020-06-30 23:12:56'),
(25, 'pp', 123459876, 'asd@dsf.com', '$2y$10$niDtQeX9hh8mH6wBkZ6JGehm2x0a9H1xl2lOIe/YR8CHR38b5CATq', 2, 2, 'pp.PNG', '127.0.0.1', 'Alex', '2020-03-26 21:37:17', '2020-06-30 23:13:30'),
(26, 'Prueba imp', 2147483647, 'asda@as.com', '$2y$10$5vsGzxVPExp2VbzzKR1xqOwewWvN40aBbVsl6YRPqEBIksNvs1UOe', 2, 2, 'Prueba imp.PNG', '127.0.0.1', 'Alex', '2020-04-17 10:02:00', '2020-06-30 23:13:33'),
(27, 'app', 213213424, 'app@gmail.com', '$2y$10$oDOsCWwrCmsiXWpgh7cAZu4KajRcClLIqlJWkSIqrNFUsVmyLzeNK', 2, 2, 'app.PNG', '181.55.63.184', 'Alex', '2020-06-30 22:26:35', '2020-06-30 23:12:50'),
(28, 'Manuel', 1128468505, 'manuelc123@gmail.com', '$2y$10$h8fZUsZzZaaziUPic9x3U.LwLnOBcAoSnYRLw8B4y1h/AAnWyC2Xe', 3, 2, 'Manuel.jpg', '190.248.182.85', 'Alex', '2020-06-30 22:32:15', '2020-06-30 23:13:07'),
(29, 'ppi', 123456, 'PPI@gmail.com', '$2y$10$HeMhWT983eMtBy3H32RYMu1Cf9v/fAGINWOu4lZGy.SCEGxpxKbxC', 1, 1, 'ppi.png', '190.248.182.85', 'Alex', '2020-06-30 23:22:19', '2020-06-30 23:22:19'),
(35, 'Alejandro', 1128468505, 'alejandro@gmail.com', '$2y$10$68jgGlujdut8Ylejx1g7V.mF.wP5gIW90skhz38L3XfJP4SAWmm7.', 2, 1, 'Alejandro.jpg', '190.248.182.85', 'Alex', '2020-06-30 23:25:53', '2020-07-02 03:35:59'),
(36, 'prueba', 123, 'prueba1@gmail.com', '$2y$10$iMJtm4SDWf8PycHKum0im.2OKNxHqy5VLRp9Uiz0oM3bO0T8xyt0a', 2, 2, 'prueba.png', '201.233.146.180', 'ppi', '2020-07-01 20:43:27', '2020-07-01 20:47:53'),
(38, 'martha', 4288, 'martha@gmail.com', '$2y$10$jVi.7TwPFebO2s5US9.qkehLGEqVnNj7pcKuFBE3gbBn0LN5.gW6y', 2, 2, 'martha.png', '201.233.146.180', 'ppi', '2020-07-01 21:01:11', '2020-07-01 21:02:49'),
(41, 'marthaduque', 42881, 'martha.duque@gmail.com', '$2y$10$wTyQsVDZrL.we4OZEKLl1eUExV.ljxb5x57rsUaId804h54yhpQdq', 3, 1, 'marthaduque.png', '201.233.146.180', 'ppi', '2020-07-01 21:11:11', '2020-07-01 21:13:43'),
(42, 'pepe', 987, 'pepe@gmail.com', '987', 3, 2, NULL, '201.233.146.180', 'ppi', '2020-07-01 21:21:01', '2020-07-01 21:21:01'),
(43, 'lilo', 71360558, 'jhoancarl@gmail.com', '$2y$10$08ZlduFKXNNsTcpQwxaXueGdTnEeO6fNJKwc3iG2pWqGNvvqgQ6IK', 2, 2, 'lilo.jpg', '190.248.164.245', '', '2020-07-07 02:43:47', '2020-07-07 02:43:47'),
(45, 'a', 700000000, 'a@d.com', '$2y$10$ypjsuqVEasKNrdN67H9JFOgKRwcIDM9Fr5WEhivrm9g5xeR4VmsmK', 3, 2, 'a.png', '190.248.164.245', '', '2020-07-07 02:49:20', '2020-07-07 02:49:20'),
(46, 'Prueba', 123, 'ppityt@elpoli.edu.co', '$2y$10$IfgFpmtbBVAZo9qLetFnSOmM988qztt3zSgSvQG200oEyb6XWdsn2', 2, 2, 'Prueba.jpg', '191.95.147.24', '', '2020-07-22 20:36:15', '2020-07-22 20:36:15'),
(57, 'FELIPE', 951, 'felipefranco@gmail.com', '$2y$10$Var9cn8LjpvbdVzUByRUY.qK.iiXCr7IvJeY.H/3u5T5btCkkgZqe', 2, 2, 'FELIPE.png', '181.58.38.16', '', '2020-07-23 08:21:44', '2020-07-23 08:21:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `concepto_pago`
--
ALTER TABLE `concepto_pago`
  ADD PRIMARY KEY (`id_concepto`);

--
-- Indices de la tabla `contacto_emergencia`
--
ALTER TABLE `contacto_emergencia`
  ADD PRIMARY KEY (`id_contacto_emergencia`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id_eps`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `informacion_deportiva`
--
ALTER TABLE `informacion_deportiva`
  ADD PRIMARY KEY (`id_informacion_dep`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `posicion_juego`
--
ALTER TABLE `posicion_juego`
  ADD PRIMARY KEY (`id_posicion_juego`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `tipo_doc`
--
ALTER TABLE `tipo_doc`
  ADD PRIMARY KEY (`id_tipo_doc`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `concepto_pago`
--
ALTER TABLE `concepto_pago`
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `contacto_emergencia`
--
ALTER TABLE `contacto_emergencia`
  MODIFY `id_contacto_emergencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `id_eps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `informacion_deportiva`
--
ALTER TABLE `informacion_deportiva`
  MODIFY `id_informacion_dep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `posicion_juego`
--
ALTER TABLE `posicion_juego`
  MODIFY `id_posicion_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_doc`
--
ALTER TABLE `tipo_doc`
  MODIFY `id_tipo_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
