-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-12-2013 a las 00:43:03
-- Versión del servidor: 5.5.34-0ubuntu0.13.04.1
-- Versión de PHP: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `unefa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE IF NOT EXISTS `administrativo` (
  `cedula_admin` char(13) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `cedula_est_pre` char(13) COLLATE utf8_spanish_ci NOT NULL,
  `numrep` int(11) DEFAULT NULL,
  `pasantia` char(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_persona` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `tesis` char(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `etnia_indig` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `discapacidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `lugar_est` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_rusnies` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `equivalencia` char(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `indice_geneal` double DEFAULT NULL,
  `fecing` date DEFAULT NULL,
  `hijomili` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codesp` char(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `semestre` char(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `condicion` int(11) DEFAULT NULL,
  `tipo_retiro` int(11) DEFAULT NULL,
  `idpensum` char(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula_est_pre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspectosevaluativos`
--

CREATE TABLE IF NOT EXISTS `aspectosevaluativos` (
  `idaspectos` int(11) NOT NULL,
  `nombre` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `idtipo` int(11) NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idaspectos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `idcambio` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `tabla` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `operacion` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_usu` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idcambio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`idcambio`, `fecha`, `hora`, `tabla`, `operacion`, `nombre_usu`) VALUES
(1, '2013-12-26', '12:37', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2) VALUES(V-21057251,VICTOR,MANUEL,LEON,PUENTES)', 'Usuario en session'),
(2, '2013-12-26', '12:38', 'Docente', 'INSERT INTO docente (cedula_doc,estatus,borrado) VALUES(V-21057251,A,I)', 'Usuario en session'),
(3, '2013-12-26', '12:38', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (D21057251,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,1,V-21057251)', 'Usuario en session'),
(4, '2013-12-26', '12:30', 'Departamento', 'INSERT INTO departamento (dep_nombre,dep_status)VALUES(ADMINISTRACION DEL SISTEMA,A)', 'Usuario en session'),
(5, '2013-12-26', '12:50', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'Usuario en session'),
(6, '2013-12-26', '12:17', 'Tabla_A_Editar', 'INSERT INTO modulo (mod_codigo,mod_nombre,mod_estatus,mod_color)VALUES (1,SEGURIDAD,A,#4F60B6)', 'Usuario en session'),
(7, '2013-12-26', '12:59', 'cargo', 'INSERT INTO cargo (car_nombre,car_status,fk_dep_codigo)VALUES(ADMINISTRADOR DEL SISTEMA,A,1)', 'Usuario en session'),
(8, '2013-12-26', '12:13', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'Usuario en session'),
(9, '2013-12-26', '12:48', 'Tabla_A_Editar', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (1,CARGO,A,1,2,CARGO)', 'Usuario en session'),
(10, '2013-12-26', '12:12', 'Tabla_A_Editar', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (2,DEPARTAMENTO,A,1,1,DEPARTAMENTO)', 'Usuario en session'),
(11, '2013-12-26', '12:26', 'Tabla_A_Editar', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (3,SUBMODULO,A,1,1,SUBMODULO)', 'Usuario en session'),
(12, '2013-12-26', '12:48', 'Tabla_A_Editar', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (4,MODULO,A,1,1,MODULO)', 'Usuario en session'),
(13, '2013-12-26', '12:04', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'Usuario en session'),
(14, '2013-12-26', '12:04', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'Usuario en session'),
(15, '2013-12-26', '12:04', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'Usuario en session'),
(16, '2013-12-26', '12:04', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'Usuario en session'),
(17, '2013-12-26', '12:04', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'Usuario en session'),
(18, '2013-12-26', '12:18', 'Carrera', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D21057251)', 'Usuario en session'),
(19, '2013-12-26', '12:18', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(0,D21057251)', 'Usuario en session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `car_codigo` int(11) NOT NULL,
  `car_nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fk_dep_codigo` int(11) NOT NULL,
  `car_status` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`car_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`car_codigo`, `car_nombre`, `fk_dep_codigo`, `car_status`) VALUES
(0, 'ADMINISTRADOR DEL SISTEMA', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `codesp` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `titulo` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `idciudad` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `idparroquia` int(11) NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion`
--

CREATE TABLE IF NOT EXISTS `condicion` (
  `idcondicion` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci DEFAULT NULL,
  `abreviatura` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcondicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `dep_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `dep_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dep_status` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`dep_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`dep_codigo`, `dep_nombre`, `dep_status`) VALUES
(1, 'ADMINISTRACION DEL SISTEMA', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cargo_usuario`
--

CREATE TABLE IF NOT EXISTS `detalle_cargo_usuario` (
  `det_codigo` int(11) NOT NULL,
  `fk_car_codigo` int(11) NOT NULL,
  `fk_usu_nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`det_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_cargo_usuario`
--

INSERT INTO `detalle_cargo_usuario` (`det_codigo`, `fk_car_codigo`, `fk_usu_nombre`) VALUES
(0, 0, 'D21057251');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `cedula_doc` char(13) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`cedula_doc`, `estatus`, `borrado`) VALUES
('V-21057251', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `nombre_e` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `idestado` int(11) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `codmat` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `nommat` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `horteo` int(11) NOT NULL,
  `horpra` int(11) NOT NULL,
  `horlab` int(11) NOT NULL,
  `credito` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `electiva` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `idpensum` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `prela1` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `prela2` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `prela3` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `mod_codigo` int(11) NOT NULL,
  `mod_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mod_estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `mod_color` char(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`mod_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`mod_codigo`, `mod_nombre`, `mod_estatus`, `mod_color`) VALUES
(1, 'SEGURIDAD', 'A', '#4F60B6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE IF NOT EXISTS `municipio` (
  `idmunicipio` int(11) NOT NULL,
  `nombre_m` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `idestado` int(11) NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE IF NOT EXISTS `parroquia` (
  `idparroquia` int(11) NOT NULL,
  `nombre_p` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `idmunicipio` int(11) NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idparroquia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pensum_pre`
--

CREATE TABLE IF NOT EXISTS `pensum_pre` (
  `idpensum` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `codesp` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_pensum` date NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idpensum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peraca`
--

CREATE TABLE IF NOT EXISTS `peraca` (
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`peraca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `per_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fk_car_codigo` int(11) NOT NULL,
  `fk_sub_codigo` int(11) NOT NULL,
  PRIMARY KEY (`per_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`per_codigo`, `fk_car_codigo`, `fk_sub_codigo`) VALUES
(1, 0, 1),
(2, 0, 3),
(3, 0, 2),
(4, 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `cedula` char(13) COLLATE utf8_spanish_ci NOT NULL,
  `nombre1` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellido1` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `edociv` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `lugar_naci` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_electronico` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idciudad` int(11) DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccionesp` varchar(160) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cedula`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `sexo`, `fecha_nac`, `edociv`, `lugar_naci`, `c_electronico`, `idciudad`, `telefono`, `direccionesp`) VALUES
('V-21057251', 'VICTOR', 'MANUEL', 'LEON', 'PUENTES', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE IF NOT EXISTS `proceso` (
  `idproceso` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ini` date DEFAULT NULL,
  `fecha_final` date NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `idtipo` char(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimen`
--

CREATE TABLE IF NOT EXISTS `regimen` (
  `idregimen` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_turno` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idregimen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `idseccion` int(11) NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idseccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `idsemestre` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idsemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submodulo`
--

CREATE TABLE IF NOT EXISTS `submodulo` (
  `sub_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `sub_nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fk_mod_codigo` int(11) NOT NULL,
  `sub_estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `sub_tipo` int(11) NOT NULL,
  `sub_ruta` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`sub_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `submodulo`
--

INSERT INTO `submodulo` (`sub_codigo`, `sub_nombre`, `fk_mod_codigo`, `sub_estatus`, `sub_tipo`, `sub_ruta`) VALUES
(1, 'CARGO', 1, 'A', 2, 'CARGO'),
(2, 'DEPARTAMENTO', 1, 'A', 1, 'DEPARTAMENTO'),
(3, 'SUBMODULO', 1, 'A', 1, 'SUBMODULO'),
(4, 'MODULO', 1, 'A', 1, 'MODULO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoevaluativo`
--

CREATE TABLE IF NOT EXISTS `tipoevaluativo` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_proceso`
--

CREATE TABLE IF NOT EXISTS `tipo_proceso` (
  `idtipo_pro` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `transaccion` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipo_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_retiro`
--

CREATE TABLE IF NOT EXISTS `tipo_retiro` (
  `idtipo_ret` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipo_ret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` char(128) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usu` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` char(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pregun_secre1` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pregun_secre2` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `resp1` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `resp2` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `contrasena`, `tipo_usu`, `cedula`, `pregun_secre1`, `pregun_secre2`, `resp1`, `resp2`) VALUES
('D21057251', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '1', 'V-21057251', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE IF NOT EXISTS `valoracion` (
  `idvaloracion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `valor_real` int(11) NOT NULL,
  `idtipo_eva` int(11) NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idvaloracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
