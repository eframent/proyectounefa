-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-12-2013 a las 23:58:24
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
  `cedula_admin` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`cedula_admin`, `estatus`, `borrado`) VALUES
('10139355', 'A', 'I'),
('10644410', 'A', 'I'),
('1111111', 'A', 'I'),
('16966833', 'A', 'I'),
('17945451', 'A', 'I'),
('19164726', 'A', 'I'),
('20025035', 'A', 'I'),
('20810218', 'A', 'I'),
('20810704', 'A', 'I'),
('21056147', 'A', 'I'),
('21056392', 'A', 'I'),
('21058793', 'A', 'I'),
('21059374', 'A', 'I'),
('21060661', 'A', 'I'),
('21564059', 'A', 'I'),
('22096344', 'A', 'I'),
('22102104', 'A', 'I'),
('24683215', 'A', 'I'),
('432112', 'A', 'I'),
('84304834834', 'A', 'I'),
('99999999', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `cedula_est_pre` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `codesp` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` int(3) NOT NULL,
  `numrep` int(2) NOT NULL,
  `pasantia` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_persona` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `tesis` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `etnia_indig` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `discapacidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `lugar_est` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_rusnies` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `equivalencia` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `condicion` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_retiro` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `indice_general` float NOT NULL,
  `fecing` date NOT NULL,
  `idpensum` char(4) COLLATE utf8_spanish_ci NOT NULL,
  `hijomili` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula_est_pre`),
  KEY `FK_carrera_idx` (`codesp`),
  KEY `FK_semestre_idx` (`semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`cedula_est_pre`, `codesp`, `semestre`, `numrep`, `pasantia`, `tipo_persona`, `tesis`, `etnia_indig`, `discapacidad`, `lugar_est`, `codigo_rusnies`, `equivalencia`, `condicion`, `estatus`, `borrado`, `tipo_retiro`, `indice_general`, `fecing`, `idpensum`, `hijomili`) VALUES
('15833890', '3', 3, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'U.E.N. Eduardo Chollet', 'J76YHI3', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('19377279', '10', 3, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'U.E.N. Hilarion Lopez', '4F5RD7H', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('19637233', '10', 6, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'U.E.N. Hilarion Lopez', 'HG674FT5', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('20389912', '10', 7, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'U.E.N. Eduardo Chollet', 'HG75F4S', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('20391892', '10', 0, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'HILARION LÓPEZ', '2345678', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('20487772', '10', 0, 0, 'No', 'I', '', 'Ninguno', 'Ninguno', 'UEN Hilarion Lopez', '', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('20641588', '10', 0, 0, 'No', '', 'No', 'Ninguno', 'Ninguno', 'CHOLLET', '3434344', 'No', '-', 'A', 'I', '-', 0, '2013-03-11', '2', ''),
('20642399', '10', 4, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'PADRE DEHON', '1234567890', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('20643369', '10', 0, 0, 'Si', 'I', 'No', 'ninguno', 'Ninguno', 'UEN cholet aburrido sin ladilla hora tal', '', 'No', '-', 'A', 'I', '-', 0, '0000-00-00', '2', 'I'),
('20644287', '10', 7, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'U.E.N. Eduardo Chollet', 'K98BV42', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('20657234', '14', 0, 0, 'No', 'I', '', 'Ninguno', 'Ninguno', 'HILARION LÓPEZ', '1234342', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('20810609', '10', 7, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'LICEO PAEZ', '1234567890', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('21055336', '10', 0, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'UEN LICEO PAEZ', '', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('210593741', '10', 0, 0, '', '', '', 'Ninguno', 'Ninguno', 'padre dehon', '', '', '-', 'A', 'I', '-', 0, '2013-03-13', '2', ''),
('21394452', '10', 0, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'UEN Hilarion Lopez', '', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('22098418', '10', 0, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'UEN Hilarion Lopez', '', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('22102104', '10', 5, 0, 'No', 'I', 'No', 'ninguno', 'Ninguno', 'U.E.N. Jose Antonio Paez', 'H7RE32C', 'No', 'N', 'A', 'I', '-', 0, '0000-00-00', '2', 'I'),
('22106571', '10', 0, 0, 'No', 'I', '', 'Ninguno', 'Ninguno', 'UEN Hilarion Lopez', '', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('23298180', '10', 0, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'LICEO PAEZ', '1234567890', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I'),
('23298474', '10', 0, 0, 'No', 'I', 'No', 'ninguno', 'Ninguno', 'uen holarion lopez', '', 'No', '-', 'A', 'I', '-', 0, '0000-00-00', '2', 'I'),
('24814622', '10', 5, 0, 'No', 'I', 'No', 'Ninguno', 'Ninguno', 'LICEO PAEZ', '1234567890', 'No', 'N', 'A', 'I', '-', 0, '2013-03-11', '2', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspectosevaluativos`
--

CREATE TABLE IF NOT EXISTS `aspectosevaluativos` (
  `idaspectos` int(4) NOT NULL,
  `nombre` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `idtipo` int(2) NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idaspectos`),
  KEY `FK_tipoeva_idx` (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `aspectosevaluativos`
--

INSERT INTO `aspectosevaluativos` (`idaspectos`, `nombre`, `descripcion`, `idtipo`, `borrado`) VALUES
(1, 'Discutió y acordó el Plan Evalualuativo con los estudiantes antes de firmar el acta compromiso', 'autoevaluacion', 1, 'I'),
(2, 'Preparó el material instruccional requerido para dictar la asignatura.', '', 1, 'I'),
(3, 'Impartió las actividades académicas previstas en la planificación.', '', 1, 'I'),
(4, 'Asistió puntualmente a las actividades académicas (clases y evaluaciones)', '', 1, 'I'),
(5, 'Atendió las consultas que le hicieron los estudiantes fuera del horario de clases (tutorías, aula virtual).', '', 1, 'I'),
(6, 'Opinó sobre el rendimiento de los estudiantes utilizando para ello criterios objetivos con fines formativos.', '', 1, 'I'),
(7, 'Efectuó las evaluaciones previstas en el plan de evaluación.', '', 1, 'I'),
(8, 'Entregó a los estudiantes el resultado de las evaluaciones de cohortes y finales', '', 1, 'I'),
(9, 'Mantuvo una actitud y conducta respetuosa y ética ante los estudiantes, compañeros docentes y demás personal de la Universidad.', '', 1, 'I'),
(10, 'Respetó la integridad física y moral de los alumnos, compañeros docentes y demás personal de la Universidad.', '', 1, 'I'),
(11, 'Contribuyó al mantenimiento de la disciplina, la moral y las buenas costumbres dentro de las instalaciones.', '', 1, 'I'),
(12, 'Veló por el adecuado uso, mantenimiento y conservación de las instalaciones, equipos y enseres de la institución.', '', 1, 'I'),
(13, 'Asistió a las reuniones convocadas por  la institución', '', 1, 'I'),
(14, 'Consulto cualquier cambio en horarios, aulas y programación con su coordinador de carreras', '', 1, 'I'),
(15, 'Hizo entrega de la planificaciòn de la asignatura en las semanas 2 y 3  a la coordinación de planificación ', '', 1, 'I'),
(16, 'Hizo entrega del  diagnóstico y acta compromiso a la coordinación de planificación ', '', 1, 'I'),
(17, 'Cumplio las normas internas de la institución,uso del celular, vestimenta, otros', '', 1, 'I'),
(18, 'Hizo cumplir el protocologo de aula, antes de iniciar las actividades', '', 1, 'I'),
(19, 'Exigio el uso correcto del uniforme a los estudiantes', '', 1, 'I'),
(20, 'Respetó el aula asignada.', '', 1, 'I'),
(21, 'Asistió a las reuniones convocadas por la institución o por su coodinación', 'coordinadores', 3, 'I'),
(22, 'Cumplió puntualmente con la hora de entrada  y salida de  clases de acuerdo a su horario', 'coordinadores', 3, 'I'),
(23, 'Entregó los recaudos correspondiente a su ingreso en la fecha prevista', 'coordinadores', 3, 'I'),
(24, 'Hubo  comunicación  constantemente con su coordinación', 'coordinadores', 3, 'I'),
(25, 'Entregó los resultados de las evaluaciones (cohortes)  en el lapso indicado para ello', 'coordinadores', 3, 'I'),
(26, 'Mantuvo una actitud y conducta respetuosa y ética ante colegas, coordinadores y autoridades de la institución', 'coordinadores', 3, 'I'),
(27, 'Contribuyó al mantenimiento de la disciplina, moral y buenas costumbres dentro de la institución', 'coordinadores', 3, 'I'),
(28, 'Veló por el adecuado uso, y mantenimiento  de las instalaciones, equipos y  bienes de la institución', 'coordinadores', 3, 'I'),
(29, 'Se preocupo por el rendimiento de su grupo de clase en interacción con su coordinación', 'coordinadores', 3, 'I'),
(30, 'Atendió consultas de los estudiantes fuera de su horario de clases', 'coordinadores', 3, 'I'),
(31, 'Evaluacion Definitiva', 'coordinadores', 3, 'A'),
(33, 'Mantiene una actitud cordial y respetuosa hacia los estudiantes', 'Acompañamiento', 4, 'I'),
(34, 'Fomenta la disciplina en el curso', 'Acompañamiento', 4, 'I'),
(35, 'La presentación personal está de acuerdo a su función docente', 'Acompañamiento', 4, 'I'),
(36, 'Enuncia el contenido del objetivo, explicando claramente las actividades a desarrollar durante la clase', 'Acompañamiento', 4, 'I'),
(37, 'Se expresa con voz clara (entonación, velocidad y pronunciación adecuada) ', 'Acompañamiento', 4, 'I'),
(38, 'Da ejemplos concretos con experiencias o vivencias los relaciona con el perfil de la carrera', 'Acompañamiento', 4, 'I'),
(39, 'Relaciona los contenidos con el perfil de la carrera', 'Acompañamiento', 4, 'I'),
(40, 'Explica, amplia y deja claro los puntos de la clase', 'Acompañamiento', 4, 'I'),
(41, 'Verifica durante la clase si los estudiantes comprenden lo explicado', 'Acompañamiento', 4, 'I'),
(42, 'Asiste puntualmente  a la clase del día de hoy', 'acompañamiento', 4, 'I'),
(43, 'Cumple con el protocolo de aula', 'acompañamiento', 4, 'I'),
(44, 'Propicia la participación de los alumnos en clase', 'Acompañamiento', 4, 'I'),
(45, 'Está atento al desempeño (conducta y comportamiento) de los estudiantes durante la clase', 'Acompañamiento', 4, 'I'),
(46, 'Muestra buena disposición ante las preguntas realizadas por los estudiantes', 'Acompañamiento', 4, 'I'),
(47, 'Responde con precisión y seguridad a las preguntas formuladas por los estudiantes ', 'Acompañamiento', 4, 'I'),
(48, 'Utiliza Instrumentos de evaluación ', 'Acompañamiento', 4, 'I'),
(49, 'Utiliza recursos para la enseñanza (pizarrón, retroproyector, rotafolio, laptop, video bean, video conferencia entre otros) o material de apoyo (gráficos, lámin', 'Acompañamiento', 4, 'I'),
(50, 'Hace uso correcto de los recursos y/o del material de apoyo', 'Acompañamiento', 4, 'I'),
(51, 'Propicia el uso de las técnicas de información y comunicación (TIC) correo electrónico', 'Acompañamieto', 4, 'I'),
(52, 'Destaca y resume lo más importante', 'Acompañamiento', 4, 'I'),
(53, 'Indica brevemente los puntos a tratar en la próxima clase', 'Acompañamiento', 4, 'I'),
(54, 'Señala material bibliográfico para realizar lecturas, investigaciones, resolución de problemas, entre otras actividades', 'Acompañamiento', 4, 'I'),
(55, 'Presenta la planificación sellada y firmada por la Coordinación de Planificación y Evaluación', 'Acompañamiento', 4, 'I'),
(56, 'Existe correspondencia entre la planificación entregada a la coordinación y la sesión de clase evaluada', 'Acompañamiento', 4, 'I'),
(57, 'Lleva debidamente organizado los recaudos administrativos', 'Acompañamiento', 4, 'I'),
(58, 'Asiste puntualmente en el horario establecido', 'Estudiantes', 2, 'I'),
(59, 'Promueve el cumplimiento  del protocolo del aula', 'Estudiantes', 2, 'I'),
(60, 'Existe relación entre la programación presentada y los objetivos de la asignatura', 'Estudiantes', 2, 'I'),
(61, 'Motiva a los alumnos para insertarlos en cada tema de estudio', 'Estudiantes', 2, 'I'),
(62, 'Demuestra dominio de los contenidos propios de la asignatura', 'Estudiantes', 2, 'I'),
(63, 'Es atento y cordial en el trato con los alumnos', 'Estudiantes', 2, 'I'),
(64, 'Realiza sus intervenciones con claridad', 'Estudiantes', 2, 'I'),
(65, 'El docente utiliza y promueve el material didactico elaborado por la institución', 'Estudiantes', 2, 'I'),
(66, 'Utiliza el portafolio como estrategia de evaluación ', 'Estudiantes', 2, 'I'),
(67, 'Demuestra disposición para mejorar el rendimiento de los alumnos', 'Estudiantes', 2, 'I'),
(68, 'Asesora académicamente a los estudiantes durante el desarrollo de la asignatura', 'Estudiantes', 2, 'I'),
(69, 'Responde dudas o preguntas durante el desarrollo de la asignatura', 'Estudiantes', 2, 'I'),
(70, 'Utiliza los recursos que ofrecen las tecnologías de la información y comunicación', 'Estudiantes', 2, 'I'),
(71, 'Facilita la adquisición de los recursos bibliográficos a los alumnos', 'Estudiantes', 2, 'I'),
(72, 'El plan de evaluación de la asignatura fue acordado entre docente y alumnos', 'Estudiantes', 2, 'I'),
(73, 'Entrega los resultados de las evaluaciones a los estudiantes a tiempo', 'Estudiantes', 2, 'I'),
(74, 'La presentación personal del docente va de acuerdo a las normas de la institución', 'Estudiantes', 2, 'I'),
(75, 'Utiliza material didáctico complementario de producción propia', 'Estudiantes', 2, 'I'),
(76, 'Suministra información coherente con los contenidos de la asignatura', 'Estudiantes', 2, 'I'),
(77, 'Adapta las estrategias instruccionales a  la naturaleza de la asignatura.', 'Estudiantes', 2, 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `idcargo` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idcargo`, `nombre`, `descripcion`, `estatus`, `borrado`) VALUES
('0.1', 'admin', 'administrador', 'A', 'I'),
('0.2', 'Representante de Planificación', 'Encargado de representar el departamento de planificación en el proceso de evaluación docente ', 'A', 'I'),
('1.1', 'COORDINADOR DE SECRETARÍA', 'POSEE TODOS LOS PRIVILEGIOS EN SU ÁREA', 'A', 'I'),
('1.2', 'Analista de Control de Estudio', 'Encargado de la parte de Secretaria Seccion Control de Estudio', 'A', 'I'),
('1.3', 'AUXILIAR DE CONTROL DE ESTUDIOS', 'PUEDE VER REPORTES Y REALIZAR ASISTENCIAS EN EL SISTEMA, CONTROLADAS POR EL COORDINADOR O COORDINADORA DEL DEPARTAMENTO', 'A', 'I'),
('2.1', 'Coordinadora', 'Coordinadora del Departamento de Planificacion y Evaluacion docente', 'A', 'I'),
('2.2', 'Asistente', 'Encargada de Ayudar a la Coordinadora del Departamento de Evaluacion y Planificacion Docente', 'A', 'I'),
('2.3', 'Auxiliar de Planificacion', 'Encargado de llevar el control de las evaluaciones', 'A', 'I'),
('2.6', 'jefe de azucar ', 'noo hace nada ', 'A', 'I'),
('3.1', 'Docente de Aula', '', 'A', 'I'),
('3.2', 'Coordinadora DLD', 'Coordinadora de Desarrollo Local Docente', 'A', 'I'),
('3.3', 'JEFE DE CARRERA', 'CONTROLA LA PLANIFICACION DE SECCIÓN.', 'A', 'I'),
('3.4', 'Asistente DLD', 'Asistente de Coordinadora de Desarrollo Local Docente', 'A', 'I');

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

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`codesp`, `nombre`, `titulo`, `estatus`, `borrado`) VALUES
('1', 'Generico', '', 'A', 'I'),
('10', 'LICENCIATURA EN ECONOMÍA SOCIAL', 'LICENCIADO(A) EN ECONOMÍA SOCIAL', 'A', 'I'),
('14', 'INGENIERÌA EN GAS', 'INGENIERO EN GAS', 'A', 'I'),
('19', 'INGENIERÍA AGROINDUSTRIAL', 'INGENIERO AGROINDUSTRIAL', 'A', 'I'),
('20', 'INGENIERÍA AGRÓNOMA', 'INGENIERO EN AGRONOMÍA', 'A', 'I'),
('21', 'INGENIERÍA EN AZÚCAR', 'INGENIERO EN AZÚCAR', 'A', 'I'),
('3', 'T.S.U. EN ENFERMERÍA', 'TÉCNICO SUPERIOR UNIVERSITARIO EN ENFERMERÍA', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `idciudad` int(11) NOT NULL,
  `idparroquia` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `FK_parroquia_idx` (`idparroquia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idciudad`, `idparroquia`, `nombre`, `estatus`, `borrado`) VALUES
(0, 1119, 'acarigua', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleevaluacion`
--

CREATE TABLE IF NOT EXISTS `detalleevaluacion` (
  `numero` int(9) NOT NULL,
  `cedula` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `idvaloracion` int(2) NOT NULL,
  `idaspecto` int(4) NOT NULL,
  KEY `FK_evaluado_idx` (`cedula`),
  KEY `FK_puntaje_idx` (`idvaloracion`),
  KEY `FK_item_idx` (`idaspecto`),
  KEY `FK_evaluacion1` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalleevaluacion`
--

INSERT INTO `detalleevaluacion` (`numero`, `cedula`, `idvaloracion`, `idaspecto`) VALUES
(1, '16869503', 1, 1),
(1, '16869503', 1, 2),
(1, '16869503', 1, 3),
(1, '16869503', 1, 4),
(1, '16869503', 1, 5),
(1, '16869503', 1, 6),
(1, '16869503', 1, 7),
(1, '16869503', 1, 8),
(1, '16869503', 1, 9),
(1, '16869503', 1, 10),
(1, '16869503', 1, 11),
(1, '16869503', 1, 12),
(1, '16869503', 1, 13),
(1, '16869503', 1, 14),
(1, '16869503', 1, 15),
(1, '16869503', 1, 16),
(1, '16869503', 1, 17),
(1, '16869503', 1, 18),
(1, '16869503', 1, 19),
(1, '16869503', 1, 20),
(2, '18892789', 42, 33),
(2, '16869503', 43, 33),
(2, '21057251', 44, 33),
(2, '18892789', 42, 34),
(2, '16869503', 43, 34),
(2, '21057251', 45, 34),
(2, '18892789', 45, 35),
(2, '16869503', 43, 35),
(2, '21057251', 42, 35),
(2, '18892789', 42, 36),
(2, '16869503', 42, 36),
(2, '21057251', 42, 36),
(2, '18892789', 42, 37),
(2, '16869503', 42, 37),
(2, '21057251', 42, 37),
(2, '18892789', 42, 38),
(2, '16869503', 42, 38),
(2, '21057251', 42, 38),
(2, '18892789', 42, 39),
(2, '16869503', 42, 39),
(2, '21057251', 42, 39),
(2, '18892789', 42, 40),
(2, '16869503', 42, 40),
(2, '21057251', 42, 40),
(2, '18892789', 43, 41),
(2, '16869503', 45, 41),
(2, '21057251', 45, 41),
(2, '18892789', 42, 42),
(2, '16869503', 42, 42),
(2, '21057251', 42, 42),
(2, '18892789', 42, 43),
(2, '16869503', 42, 43),
(2, '21057251', 42, 43),
(2, '18892789', 44, 44),
(2, '16869503', 42, 44),
(2, '21057251', 43, 44),
(2, '18892789', 42, 45),
(2, '16869503', 42, 45),
(2, '21057251', 42, 45),
(2, '18892789', 42, 46),
(2, '16869503', 42, 46),
(2, '21057251', 42, 46),
(2, '18892789', 42, 47),
(2, '16869503', 42, 47),
(2, '21057251', 42, 47),
(2, '18892789', 42, 48),
(2, '16869503', 42, 48),
(2, '21057251', 42, 48),
(2, '18892789', 42, 49),
(2, '16869503', 42, 49),
(2, '21057251', 42, 49),
(2, '18892789', 42, 50),
(2, '16869503', 42, 50),
(2, '21057251', 42, 50),
(2, '18892789', 42, 51),
(2, '16869503', 42, 51),
(2, '21057251', 42, 51),
(2, '18892789', 42, 52),
(2, '16869503', 42, 52),
(2, '21057251', 42, 52),
(2, '18892789', 42, 53),
(2, '16869503', 42, 53),
(2, '21057251', 42, 53),
(2, '18892789', 42, 54),
(2, '16869503', 42, 54),
(2, '21057251', 42, 54),
(2, '18892789', 42, 55),
(2, '16869503', 42, 55),
(2, '21057251', 42, 55),
(2, '18892789', 42, 56),
(2, '16869503', 42, 56),
(2, '21057251', 42, 56),
(2, '18892789', 42, 57),
(2, '16869503', 42, 57),
(2, '21057251', 42, 57),
(3, '21056565', 1, 1),
(3, '21056565', 1, 2),
(3, '21056565', 2, 3),
(3, '21056565', 2, 4),
(3, '21056565', 3, 5),
(3, '21056565', 3, 6),
(3, '21056565', 4, 7),
(3, '21056565', 5, 8),
(3, '21056565', 4, 9),
(3, '21056565', 5, 10),
(3, '21056565', 2, 11),
(3, '21056565', 2, 12),
(3, '21056565', 1, 13),
(3, '21056565', 1, 14),
(3, '21056565', 3, 15),
(3, '21056565', 3, 16),
(3, '21056565', 5, 17),
(3, '21056565', 5, 18),
(3, '21056565', 4, 19),
(3, '21056565', 4, 20),
(4, '16869503', 6, 21),
(4, '18892789', 7, 21),
(4, '19053532', 8, 21),
(4, '19723137', 8, 21),
(4, '20024301', 6, 21),
(4, '20388959', 7, 21),
(4, '20950228', 7, 21),
(4, '21056565', 7, 21),
(4, '21057925', 7, 21),
(4, '23577484', 6, 21),
(4, '16869503', 6, 22),
(4, '18892789', 6, 22),
(4, '19053532', 6, 22),
(4, '19723137', 7, 22),
(4, '20024301', 6, 22),
(4, '20388959', 7, 22),
(4, '20950228', 6, 22),
(4, '21056565', 6, 22),
(4, '21057925', 6, 22),
(4, '23577484', 6, 22),
(4, '16869503', 7, 23),
(4, '18892789', 8, 23),
(4, '19053532', 7, 23),
(4, '19723137', 9, 23),
(4, '20024301', 7, 23),
(4, '20388959', 7, 23),
(4, '20950228', 8, 23),
(4, '21056565', 8, 23),
(4, '21057925', 7, 23),
(4, '23577484', 7, 23),
(4, '16869503', 8, 24),
(4, '18892789', 7, 24),
(4, '19053532', 7, 24),
(4, '19723137', 9, 24),
(4, '20024301', 7, 24),
(4, '20388959', 7, 24),
(4, '20950228', 7, 24),
(4, '21056565', 7, 24),
(4, '21057925', 7, 24),
(4, '23577484', 6, 24),
(4, '16869503', 6, 25),
(4, '18892789', 7, 25),
(4, '19053532', 6, 25),
(4, '19723137', 6, 25),
(4, '20024301', 7, 25),
(4, '20388959', 6, 25),
(4, '20950228', 6, 25),
(4, '21056565', 7, 25),
(4, '21057925', 6, 25),
(4, '23577484', 6, 25),
(4, '16869503', 7, 26),
(4, '18892789', 6, 26),
(4, '19053532', 6, 26),
(4, '19723137', 6, 26),
(4, '20024301', 6, 26),
(4, '20388959', 6, 26),
(4, '20950228', 6, 26),
(4, '21056565', 6, 26),
(4, '21057925', 6, 26),
(4, '23577484', 6, 26),
(4, '16869503', 6, 27),
(4, '18892789', 7, 27),
(4, '19053532', 6, 27),
(4, '19723137', 6, 27),
(4, '20024301', 6, 27),
(4, '20388959', 9, 27),
(4, '20950228', 7, 27),
(4, '21056565', 7, 27),
(4, '21057925', 7, 27),
(4, '23577484', 8, 27),
(4, '16869503', 6, 28),
(4, '18892789', 7, 28),
(4, '19053532', 7, 28),
(4, '19723137', 7, 28),
(4, '20024301', 7, 28),
(4, '20388959', 9, 28),
(4, '20950228', 7, 28),
(4, '21056565', 8, 28),
(4, '21057925', 7, 28),
(4, '23577484', 7, 28),
(4, '16869503', 6, 29),
(4, '18892789', 8, 29),
(4, '19053532', 7, 29),
(4, '19723137', 7, 29),
(4, '20024301', 9, 29),
(4, '20388959', 6, 29),
(4, '20950228', 6, 29),
(4, '21056565', 7, 29),
(4, '21057925', 7, 29),
(4, '23577484', 7, 29),
(4, '16869503', 7, 30),
(4, '18892789', 7, 30),
(4, '19053532', 9, 30),
(4, '19723137', 8, 30),
(4, '20024301', 9, 30),
(4, '20388959', 8, 30),
(4, '20950228', 7, 30),
(4, '21056565', 6, 30),
(4, '21057925', 6, 30),
(4, '23577484', 6, 30),
(6, '20024301', 1, 1),
(6, '20024301', 1, 2),
(6, '20024301', 1, 3),
(6, '20024301', 1, 4),
(6, '20024301', 1, 5),
(6, '20024301', 1, 6),
(6, '20024301', 1, 7),
(6, '20024301', 1, 8),
(6, '20024301', 1, 9),
(6, '20024301', 1, 10),
(6, '20024301', 1, 11),
(6, '20024301', 1, 12),
(6, '20024301', 1, 13),
(6, '20024301', 1, 14),
(6, '20024301', 1, 15),
(6, '20024301', 1, 16),
(6, '20024301', 1, 17),
(6, '20024301', 1, 18),
(6, '20024301', 1, 19),
(6, '20024301', 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_evaluadores`
--

CREATE TABLE IF NOT EXISTS `detalle_evaluadores` (
  `idevaluadores` int(11) NOT NULL,
  `cedula` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `codesp` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` char(6) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` int(3) NOT NULL,
  `materia` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  KEY `FK_evaluadoresde_idx` (`idevaluadores`),
  KEY `FK_evaluadode_idx` (`cedula`),
  KEY `FK_codespde_idx` (`codesp`),
  KEY `FK_seccionde_idx` (`seccion`),
  KEY `FK_semestrede_idx` (`semestre`),
  KEY `FK_materiade_idx` (`materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_evaluadores`
--

INSERT INTO `detalle_evaluadores` (`idevaluadores`, `cedula`, `codesp`, `seccion`, `semestre`, `materia`, `observaciones`) VALUES
(1, '18892789', '10', 'A', 4, '1', ''),
(1, '19053532', '14', 'B', 3, '1', ''),
(1, '23577484', '14', 'A', 4, '1', ''),
(2, '18892789', '10', 'A', 4, '1', ''),
(2, '16869503', '19', 'A', 4, '1', ''),
(2, '21057251', '19', 'A', 1, '1', ''),
(4, '19053532', '10', 'A', 2, '1', ''),
(4, '21056565', '14', 'B', 0, '1', ''),
(5, '16869503', '10', 'A', 1, '1', ''),
(6, '16869503', '10', 'A', 0, '1', ''),
(6, '19053532', '14', 'B', 3, '1', ''),
(7, '16869503', '10', 'A', 0, '1', ''),
(7, '19053532', '10', 'A', 2, '1', ''),
(8, '16869503', '10', 'A', 1, '1', ''),
(8, '19053532', '14', 'B', 3, '1', ''),
(9, '23577484', '14', 'A', 3, '1', ''),
(9, '19053532', '10', 'B', 0, '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inscrip_pre`
--

CREATE TABLE IF NOT EXISTS `detalle_inscrip_pre` (
  `num_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `codmat` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `idplanificacion` int(11) NOT NULL,
  KEY `FK_inscripcion_idx` (`num_inscripcion`),
  KEY `FK_planificacion_idx` (`idplanificacion`),
  KEY `FK_materiai_idx` (`codmat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `detalle_inscrip_pre`
--

INSERT INTO `detalle_inscrip_pre` (`num_inscripcion`, `codmat`, `idplanificacion`) VALUES
(1, 'DIN31113', 1),
(1, 'AGG33164', 1),
(2, 'ADG30213', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_insnot`
--

CREATE TABLE IF NOT EXISTS `detalle_insnot` (
  `codinsnot` int(11) NOT NULL,
  `cedula_est_pre` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `condicion` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `notdef` float NOT NULL,
  `codmat` char(8) COLLATE utf8_spanish_ci NOT NULL,
  KEY `FK_transaccionin_idx` (`codinsnot`),
  KEY `FK_pladin_idx` (`cedula_est_pre`),
  KEY `FK_materiadin_idx` (`codmat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_nota`
--

CREATE TABLE IF NOT EXISTS `detalle_nota` (
  `cedula` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `nota` int(11) NOT NULL,
  `observaciones` varchar(220) COLLATE utf8_spanish_ci NOT NULL,
  `numero` int(9) NOT NULL,
  KEY `FK_evaluado_idx` (`cedula`),
  KEY `FK_eva_idx` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_nota`
--

INSERT INTO `detalle_nota` (`cedula`, `nota`, `observaciones`, `numero`) VALUES
('16869503', 100, '', 1),
('18892789', 89, '', 2),
('16869503', 85, '', 2),
('21057251', 87, '', 2),
('21056565', 60, '', 3),
('16869503', 88, '', 4),
('18892789', 76, '', 4),
('19053532', 76, '', 4),
('19723137', 62, '', 4),
('20024301', 72, '', 4),
('20388959', 66, '', 4),
('20950228', 84, '', 4),
('21056565', 78, '', 4),
('21057925', 88, '', 4),
('23577484', 88, '', 4),
('20024301', 100, '', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_plani`
--

CREATE TABLE IF NOT EXISTS `detalle_plani` (
  `idplanificacion` int(11) NOT NULL,
  `cedula_docente` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `codmat` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `tope` int(3) NOT NULL,
  KEY `FK_docente_idx` (`cedula_docente`),
  KEY `FK_materia_idx` (`codmat`),
  KEY `FK_plan` (`idplanificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_plani`
--

INSERT INTO `detalle_plani` (`idplanificacion`, `cedula_docente`, `codmat`, `tope`) VALUES
(1, '16869503', 'AGG33164', 5),
(1, '18892789', 'DIN31113', 5),
(1, '19723137', 'ECN32135', 5),
(2, '19053532', 'ECN32145', 5),
(2, '20024301', 'CJU36114', 5),
(2, '23577484', 'CJU36124', 5),
(3, '20024301', 'AGG33174', 5),
(3, '18892789', 'AGG33184', 5),
(4, '19053532', 'AGG33174', 4),
(4, '20813208', 'AGG33164', 8),
(5, '21057925', 'AGG33174', 5),
(5, '20950228', 'ECN32135', 5),
(5, '20927391', 'ECN32145', 5),
(6, '19053532', 'DIN31133', 5),
(6, '23577484', 'CJU36124', 5),
(6, '24814246', 'ECN32225', 5),
(7, '21056565', 'AGG33184', 5),
(7, '21057925', 'ECN32124', 5),
(7, '20388959', 'CJU36114', 5),
(8, '21056565', 'CJU36114', 5),
(8, '24814246', 'ECN32124', 5),
(8, '19723137', 'AGG33184', 5),
(9, '16869503', 'DES12302', 30),
(9, '19053532', 'MAT31025', 30),
(9, '20950228', 'SOB33031', 30),
(10, '18892789', 'ECN32135', 18),
(10, '21056565', 'CYN35123', 22),
(11, '18892789', 'MAT31225', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `cedula_doc` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`cedula_doc`, `estatus`, `borrado`) VALUES
('12092424', 'A', 'I'),
('16869503', 'A', 'I'),
('18892789', 'A', 'I'),
('19053532', 'A', 'I'),
('19723137', 'A', 'I'),
('20024301', 'A', 'I'),
('20388959', 'A', 'I'),
('20813208', 'A', 'I'),
('20927391', 'A', 'I'),
('20950228', 'A', 'I'),
('21056565', 'A', 'I'),
('21057251', 'A', 'I'),
('21057925', 'A', 'I'),
('23577484', 'A', 'I'),
('24814246', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doc_car_cargo_pre`
--

CREATE TABLE IF NOT EXISTS `doc_car_cargo_pre` (
  `cedula_doc` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `codesp` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `idcargo` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  KEY `FK_codesp1_idx` (`codesp`),
  KEY `FK_peraca_idx` (`peraca`),
  KEY `FK_idcar_idx` (`idcargo`),
  KEY `FK_ced_admin_idx` (`cedula_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `doc_car_cargo_pre`
--

INSERT INTO `doc_car_cargo_pre` (`cedula_doc`, `codesp`, `idcargo`, `peraca`, `borrado`) VALUES
('20041540', '19', '0.1', '2', 'I'),
('21057251', '1', '3.1', '2', 'I'),
('18892789', '1', '3.1', '2', 'I'),
('16869503', '1', '3.1', '2', 'I'),
('19053532', '1', '3.1', '2', 'I'),
('23577484', '1', '3.1', '2', 'I'),
('21057925', '1', '3.1', '2', 'I'),
('21056565', '1', '3.1', '2', 'I'),
('19723137', '1', '3.1', '2', 'I'),
('20024301', '1', '3.1', '2', 'I'),
('20388959', '1', '3.1', '2', 'I'),
('24814246', '1', '3.1', '2', 'I'),
('20813208', '1', '3.1', '2', 'I'),
('20927391', '1', '3.1', '2', 'I'),
('20950228', '1', '3.1', '2', 'I'),
('16869503', '10', '3.3', '2', 'I'),
('19053532', '1', '0.2', '2', 'I'),
('16869503', '1', '0.2', '2', 'I'),
('19723137', '10', '3.3', '2', 'I'),
('18892789', '1', '0.2', '2', 'A'),
('21057251', '21', '2.6', '2', 'I'),
('20024301', '1', '2.1', '2', 'I'),
('20388959', '1', '2.3', '2', 'I'),
('20927391', '1', '1.1', '2', 'I'),
('20388959', '1', '0.2', '2', 'I'),
('12092424', '1', '3.1', '2', 'I'),
('12092424', '1', '0.2', '2', 'I'),
('19723137', '1', '0.2', '2', 'I'),
('23577484', '1', '1.3', '2', 'I'),
('23577484', '1', '0.2', '2', 'I'),
('18892789', '1', '3.4', '2', 'I'),
('18892789', '1', '0.2', '2', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `idestado` int(11) NOT NULL,
  `nombre_e` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `nombre_e`, `estatus`, `borrado`) VALUES
(1, 'DISTRITO CAPITAL', 'A', 'I'),
(2, 'AMAZONAS', 'A', 'I'),
(3, 'ANZOATEGUI', 'A', 'I'),
(4, 'APURE', 'A', 'I'),
(5, 'ARAGUA', 'A', 'I'),
(6, 'BARINAS', 'A', 'I'),
(7, 'MIRANDA', 'A', 'I'),
(8, 'CARABOBO', 'A', 'I'),
(9, 'COJEDES', 'A', 'I'),
(10, 'DELTA AMACURO', 'A', 'I'),
(11, 'FALCON', 'A', 'I'),
(12, 'GUARICO', 'A', 'I'),
(13, 'LARA', 'A', 'I'),
(14, 'MERIDA', 'A', 'I'),
(15, 'BOLIVAR', 'A', 'I'),
(16, 'MONAGAS', 'A', 'I'),
(17, 'NUEVA ESPARTA', 'A', 'I'),
(18, 'PORTUGUESA', 'A', 'I'),
(19, 'SUCRE', 'A', 'I'),
(20, 'TACHIRA', 'A', 'I'),
(21, 'TRUJILLO', 'A', 'I'),
(22, 'YARACUY', 'A', 'I'),
(23, 'ZULIA', 'A', 'I'),
(24, 'VARGAS', 'A', 'I'),
(25, 'D. FEDERALES', 'A', 'I'),
(26, 'CARABOBO', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
  `numero` int(9) NOT NULL,
  `idtipo` int(2) NOT NULL,
  `fechaeva` date NOT NULL,
  `horaeva` time NOT NULL,
  `curso` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `termino` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `materia` char(6) COLLATE utf8_spanish_ci NOT NULL,
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `FK_idtipo_idx` (`idtipo`),
  KEY `FK_evaluador_idx` (`cedula`),
  KEY `FK_carrera_idx` (`carrera`),
  KEY `FK_materia_idx` (`materia`),
  KEY `FK_peraca_idx` (`peraca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`numero`, `idtipo`, `fechaeva`, `horaeva`, `curso`, `cedula`, `carrera`, `termino`, `materia`, `peraca`) VALUES
(1, 1, '2013-03-11', '02:34:35', '-', '16869503', '10', '3', 'ADG302', '2'),
(2, 4, '2013-03-11', '02:52:09', '', '19053532', '10', '1', 'AGG331', '2'),
(3, 1, '2013-03-12', '08:47:00', '--', '21056565', '14', '1', 'CYN351', '2'),
(4, 3, '2013-03-13', '05:20:54', '', '19723137', '10', '2', 'AGG331', '2'),
(6, 1, '2013-03-14', '04:02:20', '-', '20024301', '14', '4', 'ADG302', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluadores`
--

CREATE TABLE IF NOT EXISTS `evaluadores` (
  `idevaluadores` int(11) NOT NULL,
  `cedula` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `idtipo` int(2) NOT NULL,
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `fechaeva` date NOT NULL,
  `horaeva` time NOT NULL,
  PRIMARY KEY (`idevaluadores`),
  KEY `FK_control_eval_idx` (`cedula`),
  KEY `FK_idtipoe_idx` (`idtipo`),
  KEY `FK_peracae_idx` (`peraca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `evaluadores`
--

INSERT INTO `evaluadores` (`idevaluadores`, `cedula`, `idtipo`, `peraca`, `fechaeva`, `horaeva`) VALUES
(1, '16869503', 4, '2', '2013-03-11', '02:38:14'),
(2, '19053532', 4, '2', '2013-03-11', '02:47:36'),
(4, '18892789', 4, '2', '2013-03-13', '05:52:52'),
(5, '20388959', 4, '2', '2013-03-14', '04:00:14'),
(6, '12092424', 4, '2', '2013-03-14', '04:23:15'),
(7, '19723137', 4, '2', '2013-04-21', '02:46:25'),
(8, '23577484', 4, '2', '2013-04-21', '03:52:10'),
(9, '18892789', 4, '2', '2013-04-22', '02:18:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_pre`
--

CREATE TABLE IF NOT EXISTS `inscripcion_pre` (
  `num_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_est_pre` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inscrip` date NOT NULL,
  `hora` time NOT NULL,
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`num_inscripcion`),
  KEY `FK_alumno_idx` (`cedula_est_pre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `inscripcion_pre`
--

INSERT INTO `inscripcion_pre` (`num_inscripcion`, `cedula_est_pre`, `fecha_inscrip`, `hora`, `peraca`) VALUES
(1, '15833890', '2013-04-18', '00:00:00', '2'),
(2, '19377279', '2013-10-03', '11:53:00', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insnot`
--

CREATE TABLE IF NOT EXISTS `insnot` (
  `codinsnot` int(11) NOT NULL,
  `idplanificacion` int(11) NOT NULL,
  PRIMARY KEY (`codinsnot`),
  KEY `FK_estudiantesin_idx` (`idplanificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `codmat` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` int(3) NOT NULL,
  `idpensum` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `credito` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `horteo` int(11) NOT NULL,
  `horpra` int(11) NOT NULL,
  `horlab` int(11) NOT NULL,
  `nommat` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `prela1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `prela2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `electiva` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `prela3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codmat`),
  KEY `FK_pen_idx` (`idpensum`),
  KEY `FK_semestre_idx` (`semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`codmat`, `semestre`, `idpensum`, `credito`, `horteo`, `horpra`, `horlab`, `nommat`, `prela1`, `prela2`, `descripcion`, `electiva`, `estatus`, `borrado`, `prela3`) VALUES
('ADG30213', 6, '2', '3', 2, 2, 0, 'METODOLOGÍA DE LA INVESTIGACIÓN I', '-', '-', '', 'N', 'A', 'I', '-'),
('ADG30223', 7, '2', '3', 2, 2, 0, 'METODOLOGÍA DE LA INVESTIGACIÓN II', 'ADG30213', '-', '', 'N', 'A', 'I', '-'),
('ADG30231', 9, '2', '1', 1, 0, 0, 'SEMINARIO DE INVESTIGACIÓN', 'AGG33133', '-', '', 'N', 'A', 'I', '-'),
('ADG37223', 1, '2', '3', 2, 3, 0, 'TÉCNICAS DE ESTUDIO', '-', '-', '', 'N', '', 'I', '-'),
('AGG33113', 8, '2', '3', 2, 2, 0, 'GERENCIA EMPRENDEDORA', 'ECN32285', '-', '', 'N', 'A', 'I', '-'),
('AGG33133', 8, '2', '3', 2, 2, 0, 'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS I', 'ADG30223', '-', '', 'N', 'A', 'I', '-'),
('AGG33143', 9, '2', '3', 2, 2, 0, 'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS II', 'AGG33133', '-', '', 'N', 'A', 'I', '-'),
('AGG33153', 9, '2', '3', 2, 2, 0, 'ÉTICA PROFESIONAL', '-', '-', '', 'N', 'A', 'I', '-'),
('AGG33164', 6, '2', '3', 3, 2, 0, 'COMERCIO INTERNACIONAL I', 'ECN32214', '-', '', 'N', 'A', 'I', '-'),
('AGG33174', 7, '2', '4', 3, 2, 0, 'COMERCIO INTERNACIONAL II', 'AGG33164', '-', '', 'N', 'A', 'I', '-'),
('AGG33184', 6, '2', '4', 3, 2, 0, 'ANÁLISIS DE ESTADOS FINANCIEROS I', '-', '-', '', 'N', 'A', 'I', '-'),
('AGG33194', 7, '2', '4', 3, 2, 0, 'ANÁLISIS DE ESTADOS FINANCIEROS II', 'AGG33184', '-', '', 'N', 'A', 'I', '-'),
('CJU36114', 3, '2', '4', 3, 2, 0, 'DERECHO MERCANTIL I', '-', '-', '', '', '', 'I', '-'),
('CJU36124', 4, '2', '4', 3, 2, 0, 'DERECHO MERCANTIL II', 'CJU36114', '-', '', 'N', '', 'I', '-'),
('CJU36215', 7, '2', '5', 4, 2, 0, 'TEORÍA Y POLÍTICA FISCAL', '-', '-', '', 'N', 'A', 'I', '-'),
('CYN35123', 2, '2', '3', 2, 2, 0, 'EDUCACIÓN AMBIENTAL', '-', '-', '', 'N', '', 'I', '-'),
('CYN35223', 1, '2', '3', 2, 2, 0, 'ECONOMÍA HOMBRE Y SOCIEDAD', '-', '-', '', 'N', '', 'I', '-'),
('DES12302', 0, '2', '3', 2, 2, 0, 'DESARROLLO SUSTENTABLE', '-', '-', '', 'N', 'A', 'I', '-'),
('DIN31113', 1, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL DE LA NACIÓN I', '-', '-', '', 'N', 'A', 'I', '-'),
('DIN31123', 2, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL DE LA NACIÓN II', 'DIN31113', '-', '', '', '', 'I', '-'),
('DIN31133', 3, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL DE LA NACIÓN III', 'DIN31123', '-', '', 'N', '', 'I', '-'),
('DIN31143', 4, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL DE LA NACIÓN IV', 'DIN31133', '-', '', 'N', '', 'I', '-'),
('DIN31153', 5, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL V', 'DIN31143', '-', '', 'N', 'A', 'I', '-'),
('DIN31163', 6, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL VI', 'DIN31153', '-', '', 'N', 'A', 'I', '-'),
('DIN31173', 7, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL VII', 'DIN31143', '-', '', 'N', 'A', 'I', '-'),
('DIN31183', 8, '2', '3', 2, 2, 0, 'DEFENSA INTEGRAL VIII', 'DIN31173', '-', '', 'N', 'A', 'I', '-'),
('ECN32114', 1, '2', '4', 3, 2, 0, 'INTRODUCCIÓN A LA ECONOMÍA', '-', '-', '', 'N', '', 'I', '-'),
('ECN32124', 1, '2', '4', 3, 3, 0, 'CONTABILIDAD I', '-', '-', '', 'N', '', 'I', '-'),
('ECN32135', 2, '2', '5', 3, 4, 0, 'CONTABILIDAD II', 'ECN32124', '-', '', 'N', '', 'I', '-'),
('ECN32145', 3, '2', '5', 3, 4, 0, 'CONTABILIDAD SOCIAL', 'ECN32135', 'SOC34114', '', 'N', '', 'I', '-'),
('ECN32154', 2, '2', '4', 3, 2, 0, 'MICROECONOMÍA', 'ECN32114', '-', '', 'N', '', 'I', '-'),
('ECN32164', 3, '2', '4', 3, 2, 0, 'MACROECONOMÍA I', 'ECN32154', '-', '', 'N', 'A', 'I', '-'),
('ECN32174', 4, '2', '4', 3, 2, 0, 'MACROECONOMÍA II', 'ECN32164', '-', '', 'N', '', 'I', '-'),
('ECN32214', 5, '2', '4', 3, 2, 0, 'MERCADO FINANCIERO', 'ECN32174', '-', '', 'N', 'A', 'I', '-'),
('ECN32225', 6, '2', '5', 4, 2, 0, 'ECONOMETRÍA I', 'MAT31364', '-', '', 'N', 'A', 'I', '-'),
('ECN32235', 7, '2', '5', 4, 2, 0, 'ECONOMETRÍA II', 'ECN32225', '-', '', 'N', 'A', 'I', '-'),
('ECN32244', 9, '2', '4', 3, 2, 0, 'DESARROLLO ECONÓMICO', '-', '-', '', 'N', 'A', 'I', '-'),
('ECN32265', 5, '2', '5', 4, 2, 0, 'POLÍTICA MONETARIA', 'CJU36124', '-', '', 'N', 'A', 'I', '-'),
('ECN32285', 8, '2', '5', 4, 2, 0, 'TEORÍA Y MODELOS DE CRECIMIENTO ECONÓMICO', '-', '-', '', 'N', 'A', 'I', '-'),
('IDI37113', 8, '2', '3', 2, 2, 0, 'INGLÉS I', '-', '-', '', '', 'A', 'I', '-'),
('IDI37123', 9, '2', '3', 2, 2, 0, 'INGLÉS II', 'IDI37113', '-', '', 'N', 'A', 'I', '-'),
('MAT31025', 0, '2', '5', 3, 4, 0, 'MATEMÁTICA ', '-', '-', '', 'N', 'A', 'I', '-'),
('MAT31114', 1, '2', '4', 3, 3, 0, 'MATEMÁTICA I', '-', '-', '', 'N', '', 'I', '-'),
('MAT31125', 2, '2', '5', 3, 4, 0, 'MATEMÁTICA II', 'MAT31114', '-', '', 'N', '', 'I', '-'),
('MAT31135', 3, '2', '5', 3, 4, 0, 'MATEMÁTICA III', 'MAT31125', '-', '', 'N', '', 'I', '-'),
('MAT31215', 3, '2', '5', 4, 2, 0, 'ESTADÍSTICA I', 'MAT31135', '-', '', 'N', '', 'I', '-'),
('MAT31225', 4, '2', '5', 4, 2, 0, 'ESTADÍSTICA II', 'MAT31215', '-', '', 'N', '', 'I', '-'),
('MAT31235', 5, '2', '5', 4, 2, 0, 'ESTADÍSTICA III', 'MAT31225', '-', '', 'N', '', 'I', '-'),
('MAT31254', 4, '2', '4', 3, 2, 0, 'MATEMÁTICA FINANCIERA I', 'MAT31135', '-', '', 'N', '', 'I', '-'),
('MAT31364', 5, '2', '4', 3, 2, 0, 'MATEMÁTICA FINANCIERA II', 'MAT31254', '-', '', 'N', '', 'I', '-'),
('SOB33031', 0, '2', '3', 3, 2, 0, 'SOBERANÍA POLÍTICA', '-', '-', '', 'N', 'A', 'I', '-'),
('SOC34114', 2, '2', '4', 3, 2, 0, 'HISTORIA ECONÓMICA DE VENEZUELA', 'SOC34214', '-', '', 'N', 'A', 'I', '-'),
('SOC34214', 3, '2', '4', 3, 2, 0, 'GEOGRAFÍA ECONÓMICA DE VENEZUELA', 'SOC34114', '-', '', 'N', '', 'I', '-'),
('SYC35113', 4, '2', '3', 2, 2, 0, 'INFORMÁTICA I', '-', '-', '', 'N', '', 'I', '-'),
('SYC35124', 5, '2', '4', 3, 2, 0, 'INFORMÁTICA II', 'SYC35113', '-', '', 'N', '', 'I', '-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE IF NOT EXISTS `municipio` (
  `idmunicipio` int(11) NOT NULL,
  `nombre_m` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idestado` int(11) NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  KEY `FK_estado_idx` (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`idmunicipio`, `nombre_m`, `idestado`, `estatus`, `borrado`) VALUES
(1, 'LIBERTADOR', 1, 'A', 'I'),
(2, 'AUTONOMO ALTO ORINOCO', 2, 'A', 'I'),
(3, 'AUTONOMO ATABAPO', 2, 'A', 'I'),
(4, 'AUTONOMO ATURES', 2, 'A', 'I'),
(5, 'AUTONOMO AUTANA', 2, 'A', 'I'),
(6, 'AUTONOMO MAROA', 2, 'A', 'I'),
(7, 'AUTONOMO MANAPIARE', 2, 'A', 'I'),
(8, 'AUTONOMO RIO NEGRO', 2, 'A', 'I'),
(9, 'ANACO', 3, 'A', 'I'),
(10, 'ARAGUA', 3, 'A', 'I'),
(11, 'FERNANDO DE PE&#209', 1, 'A', 'I'),
(12, 'FRANCISCO DEL CARMEN CARVAJAL', 3, 'A', 'I'),
(13, 'FRANCISCO DE MIRANDA', 3, 'A', 'I'),
(14, 'GUANTA', 3, 'A', 'I'),
(15, 'INDEPENDENCIA', 3, 'A', 'I'),
(16, 'JUAN ANTONIO SOTILLO', 3, 'A', 'I'),
(17, 'JUAN MANUEL CAJIGAL', 3, 'A', 'I'),
(18, 'JOSE GREGORIO MONAGAS', 3, 'A', 'I'),
(19, 'LIBERTAD', 3, 'A', 'I'),
(20, 'MANUEL EZEQUIEL BRUZUAL', 3, 'A', 'I'),
(21, 'PEDRO MARIA FREITES', 3, 'A', 'I'),
(22, 'PIRITU', 3, 'A', 'I'),
(23, 'SAN JOSE DE GUANIPA', 3, 'A', 'I'),
(24, 'SAN JUAN DE CAPISTRANO', 3, 'A', 'I'),
(25, 'SANTA ANA', 3, 'A', 'I'),
(26, 'SIMON BOLIVAR', 3, 'A', 'I'),
(27, 'SIMON RODRIGUEZ', 3, 'A', 'I'),
(28, 'SIR ARTHUR MC GREGOR', 3, 'A', 'I'),
(29, 'TURIST DIEGO BAUTISTA URBANEJA', 3, 'A', 'I'),
(30, 'ACHAGUAS', 4, 'A', 'I'),
(31, 'BIRUACA', 4, 'A', 'I'),
(32, 'MU&Ntilde', 1, 'A', 'I'),
(33, 'PAEZ', 4, 'A', 'I'),
(34, 'PEDRO CAMEJO', 4, 'A', 'I'),
(35, 'ROMULO GALLEGOS', 4, 'A', 'I'),
(36, 'SAN FERNANDO', 4, 'A', 'I'),
(37, 'BOLIVAR', 5, 'A', 'I'),
(38, 'JOSE GREGORIO MONAGAS', 5, 'A', 'I'),
(39, 'GIRARDOT', 5, 'A', 'I'),
(40, 'JOSE ANGEL LAMAS', 5, 'A', 'I'),
(41, 'JOSE FELIX RIBAS', 5, 'A', 'I'),
(42, 'JOSE RAFAEL REVENGA', 5, 'A', 'I'),
(43, 'LIBERTADOR', 5, 'A', 'I'),
(44, 'MARIO BRICE&Ntilde', 1, 'A', 'I'),
(45, 'SAN CASIMIRO', 5, 'A', 'I'),
(46, 'SAN SEBASTIAN', 5, 'A', 'I'),
(47, 'SANTIAGO MARI&Ntilde', 1, 'A', 'I'),
(48, 'SANTOS MICHELENA', 5, 'A', 'I'),
(49, 'SUCRE', 5, 'A', 'I'),
(50, 'TOVAR', 5, 'A', 'I'),
(51, 'URDANETA', 5, 'A', 'I'),
(52, 'ZAMORA', 5, 'A', 'I'),
(53, 'FRANCISCO LINARES ALCANTARA', 5, 'A', 'I'),
(54, 'OCUMARE DE LA COSTA DE ORO', 5, 'A', 'I'),
(55, 'ALBERTO ARVELO TORREALBA', 6, 'A', 'I'),
(56, 'ANTONIO JOSE DE SUCRE', 6, 'A', 'I'),
(57, 'ARISMENDI', 6, 'A', 'I'),
(58, 'BARINAS', 6, 'A', 'I'),
(59, 'BOLIVAR', 6, 'A', 'I'),
(60, 'CRUZ PAREDES', 6, 'A', 'I'),
(61, 'EZEQUIEL ZAMORA', 6, 'A', 'I'),
(62, 'OBISPOS', 6, 'A', 'I'),
(63, 'PEDRAZA', 6, 'A', 'I'),
(64, 'ROJAS', 6, 'A', 'I'),
(65, 'SOSA', 6, 'A', 'I'),
(66, 'ANDRES ELOY BLANCO', 6, 'A', 'I'),
(67, 'CARONI', 15, 'A', 'I'),
(68, 'CEDE&#209', 1, 'A', 'I'),
(69, 'EL CALLAO', 15, 'A', 'I'),
(70, 'GRAN SABANA', 15, 'A', 'I'),
(71, 'HERES', 15, 'A', 'I'),
(72, 'PIAR', 15, 'A', 'I'),
(73, 'RAUL LEONI', 15, 'A', 'I'),
(74, 'ROSCIO', 15, 'A', 'I'),
(75, 'SIFONTES', 15, 'A', 'I'),
(76, 'SUCRE', 15, 'A', 'I'),
(77, 'PADRE PEDRO CHIEN', 15, 'A', 'I'),
(78, 'BEJUMA', 8, 'A', 'I'),
(79, 'BOLIVAR', 8, 'A', 'I'),
(80, 'DIEGO IBARRA', 8, 'A', 'I'),
(81, 'GUACARA', 8, 'A', 'I'),
(82, 'JUAN JOSE MORA', 8, 'A', 'I'),
(83, 'LIBERTADOR', 8, 'A', 'I'),
(84, 'LOS GUAYOS', 8, 'A', 'I'),
(85, 'MIRANDA', 8, 'A', 'I'),
(86, 'MONTALBAN', 8, 'A', 'I'),
(87, 'NAGUANAGUA', 8, 'A', 'I'),
(88, 'PUERTO CABELLO', 8, 'A', 'I'),
(89, 'SAN DIEGO', 8, 'A', 'I'),
(90, 'SAN JOAQUIN', 8, 'A', 'I'),
(91, 'VALENCIA', 8, 'A', 'I'),
(92, 'ANZOATEGUI', 9, 'A', 'I'),
(93, 'RAUL LEONI', 9, 'A', 'I'),
(94, 'GIRARDOT', 9, 'A', 'I'),
(95, 'LIMA BLANCO', 9, 'A', 'I'),
(96, 'PAO DE SAN JUAN BAUTISTA', 9, 'A', 'I'),
(97, 'RICAURTE', 9, 'A', 'I'),
(98, 'ROMULO GALLEGOS', 9, 'A', 'I'),
(99, 'SAN CARLOS', 9, 'A', 'I'),
(100, 'TINACO', 9, 'A', 'I'),
(101, 'ANTONIO DIAZ', 10, 'A', 'I'),
(102, 'CASACOIMA', 10, 'A', 'I'),
(103, 'PEDERNALES', 10, 'A', 'I'),
(104, 'TUCUPITA', 10, 'A', 'I'),
(105, 'ACOSTA', 11, 'A', 'I'),
(106, 'BOLIVAR', 11, 'A', 'I'),
(107, 'BUCHIVACOA', 11, 'A', 'I'),
(108, 'CACIQUE MANAURE', 11, 'A', 'I'),
(109, 'CARIRUBANA', 11, 'A', 'I'),
(110, 'COLINA', 11, 'A', 'I'),
(111, 'DABAJURO', 11, 'A', 'I'),
(112, 'DEMOCRACIA', 11, 'A', 'I'),
(113, 'FALCON', 11, 'A', 'I'),
(114, 'FEDERACION', 11, 'A', 'I'),
(115, 'JACURA', 11, 'A', 'I'),
(116, 'LOS TAQUES', 11, 'A', 'I'),
(117, 'MAUROA', 11, 'A', 'I'),
(118, 'ROMULO GALLEGOS', 11, 'A', 'I'),
(119, 'MONSE&#209', 1, 'A', 'I'),
(120, 'PALMASOLA', 11, 'A', 'I'),
(121, 'PETIT', 11, 'A', 'I'),
(122, 'PIRITU', 11, 'A', 'I'),
(123, 'SAN FRANCISCO', 11, 'A', 'I'),
(124, 'SILVA', 11, 'A', 'I'),
(125, 'SUCRE', 11, 'A', 'I'),
(126, 'TOCOPERO', 11, 'A', 'I'),
(127, 'UNION', 11, 'A', 'I'),
(128, 'URUMACO', 11, 'A', 'I'),
(129, 'ZAMORA', 11, 'A', 'I'),
(130, 'CAMAGUAN', 12, 'A', 'I'),
(131, 'CHAGUARAMAS', 12, 'A', 'I'),
(132, 'EL SOCORRO', 12, 'A', 'I'),
(133, 'SAN GERONIMO DE GUAYABAL', 12, 'A', 'I'),
(134, 'FEDERACION', 12, 'A', 'I'),
(135, 'LAS MERCEDES', 12, 'A', 'I'),
(136, 'JULIAN MELLADO', 12, 'A', 'I'),
(137, 'FRANCISCO DE MIRANDA', 12, 'A', 'I'),
(138, 'JOSE TADEO MONAGAS', 12, 'A', 'I'),
(139, 'ORTIZ', 12, 'A', 'I'),
(140, 'JOSE FELIX RIBAS', 12, 'A', 'I'),
(141, 'JUAN GERMAN ROSCIO', 12, 'A', 'I'),
(142, 'SAN JOSE DE GUARIBE', 12, 'A', 'I'),
(143, 'SANTA MARIA DE IPIRE', 12, 'A', 'I'),
(144, 'PEDRO ZARAZA', 12, 'A', 'I'),
(145, 'ANDRES ELOY BLANCO', 13, 'A', 'I'),
(146, 'CRESPO', 13, 'A', 'I'),
(147, 'IRIBARREN', 13, 'A', 'I'),
(148, 'JIMENEZ', 13, 'A', 'I'),
(149, 'MORAN', 13, 'A', 'I'),
(150, 'PALAVECINO', 13, 'A', 'I'),
(151, 'SIMON PLANAS', 13, 'A', 'I'),
(152, 'TORRES', 13, 'A', 'I'),
(153, 'URDANETA', 13, 'A', 'I'),
(154, 'ALBERTO ADRIANI', 14, 'A', 'I'),
(155, 'ANDRES BELLO', 14, 'A', 'I'),
(156, 'ANTONIO PINTO SALINAS', 14, 'A', 'I'),
(157, 'ARICAGUA', 14, 'A', 'I'),
(158, 'ARZOBISPO CHACON', 14, 'A', 'I'),
(159, 'CAMPO ELIAS', 14, 'A', 'I'),
(160, 'JOSE FELIX RIBAS', 14, 'A', 'I'),
(161, 'CARDENAL QUINTERO', 14, 'A', 'I'),
(162, 'GUARAQUE', 14, 'A', 'I'),
(163, 'JULIO CESAR SALAS', 14, 'A', 'I'),
(164, 'JUSTO BRICE&#209', 1, 'A', 'I'),
(165, 'LIBERTADOR', 14, 'A', 'I'),
(166, 'MIRANDA', 14, 'A', 'I'),
(167, 'OBISPO RAMOS DE LORA', 14, 'A', 'I'),
(168, 'PADRE NOGUERA', 14, 'A', 'I'),
(169, 'PUEBLO LLANO', 14, 'A', 'I'),
(170, 'RANGEL', 14, 'A', 'I'),
(171, 'RIVAS DAVILA', 14, 'A', 'I'),
(172, 'SANTOS MARQUINA', 14, 'A', 'I'),
(173, 'SUCRE', 14, 'A', 'I'),
(174, 'TOVAR', 14, 'A', 'I'),
(175, 'TULIO FEBRES CORDERO', 14, 'A', 'I'),
(176, 'ZEA', 14, 'A', 'I'),
(177, 'ACEVEDO', 7, 'A', 'I'),
(178, 'ANDRES BELLO', 7, 'A', 'I'),
(179, 'CAMPO ELIAS', 3, 'A', 'I'),
(180, 'BRION', 7, 'A', 'I'),
(181, 'BUROZ', 7, 'A', 'I'),
(182, 'CARRIZAL', 7, 'A', 'I'),
(183, 'CHACAO', 7, 'A', 'I'),
(184, 'CRISTOBAL ROJAS', 7, 'A', 'I'),
(185, 'EL HATILLO', 7, 'A', 'I'),
(186, 'GUAICAIPURO', 7, 'A', 'I'),
(187, 'INDEPENDENCIA', 7, 'A', 'I'),
(188, 'TOMAS LANDER', 7, 'A', 'I'),
(189, 'LOS SALIAS', 7, 'A', 'I'),
(190, 'PAEZ', 7, 'A', 'I'),
(191, 'PAZ CASTILLO', 7, 'A', 'I'),
(192, 'PEDRO GUAL', 7, 'A', 'I'),
(193, 'PLAZA', 7, 'A', 'I'),
(194, 'SIMON BOLIVAR', 7, 'A', 'I'),
(195, 'SUCRE', 7, 'A', 'I'),
(196, 'URDANETA', 7, 'A', 'I'),
(197, 'ZAMORA', 7, 'A', 'I'),
(198, 'ACOSTA', 16, 'A', 'I'),
(199, 'AGUASAY', 16, 'A', 'I'),
(200, 'BRION', 16, 'A', 'I'),
(201, 'CARIPE', 16, 'A', 'I'),
(202, 'CEDE&#209', 1, 'A', 'I'),
(203, 'EZEQUIEL ZAMORA', 16, 'A', 'I'),
(204, 'LIBERTADOR', 16, 'A', 'I'),
(205, 'MATURIN', 16, 'A', 'I'),
(206, 'PIAR', 16, 'A', 'I'),
(207, 'PUNCERES', 16, 'A', 'I'),
(208, 'SANTA BARBARA', 16, 'A', 'I'),
(209, 'SOTILLO', 16, 'A', 'I'),
(210, 'URACOA', 16, 'A', 'I'),
(211, 'ANTOLIN DEL CAMPO', 17, 'A', 'I'),
(212, 'ARISMENDI', 17, 'A', 'I'),
(213, 'DIAZ', 17, 'A', 'I'),
(214, 'SIMON BOLIVAR', 17, 'A', 'I'),
(215, 'GOMEZ', 17, 'A', 'I'),
(216, 'MANEIRO', 17, 'A', 'I'),
(217, 'MARCANO', 17, 'A', 'I'),
(218, 'MARI&#209', 1, 'A', 'I'),
(219, 'PENINSULA DE MACANAO', 17, 'A', 'I'),
(220, 'TUBORES', 17, 'A', 'I'),
(221, 'VILLALBA', 17, 'A', 'I'),
(222, 'AGUA BLANCA', 18, 'A', 'I'),
(223, 'ARAURE', 18, 'A', 'I'),
(224, 'ESTELLER', 18, 'A', 'I'),
(225, 'GUANARE', 18, 'A', 'I'),
(226, 'GUANARITO', 18, 'A', 'I'),
(227, 'MONSE&#209', 1, 'A', 'I'),
(228, 'OSPINO', 18, 'A', 'I'),
(229, 'PAEZ', 18, 'A', 'I'),
(230, 'PAPELON', 18, 'A', 'I'),
(231, 'SAN GENARO DE BOCONOITO', 18, 'A', 'I'),
(232, 'SAN RAFAEL DE ONOTO', 18, 'A', 'I'),
(233, 'SANTA ROSALIA', 18, 'A', 'I'),
(234, 'SUCRE', 18, 'A', 'I'),
(235, 'TUREN', 18, 'A', 'I'),
(236, 'ANDRES ELOY BLANCO', 19, 'A', 'I'),
(237, 'ANDRES MATA', 19, 'A', 'I'),
(238, 'ARISMENDI', 19, 'A', 'I'),
(239, 'PENINSULA DE MACANAO', 19, 'A', 'I'),
(240, 'BERMUDEZ', 19, 'A', 'I'),
(241, 'BOLIVAR', 19, 'A', 'I'),
(242, 'CAJIGAL', 19, 'A', 'I'),
(243, 'CRUZ SALMERON ACOSTA', 19, 'A', 'I'),
(244, 'LIBERTADOR', 19, 'A', 'I'),
(245, 'MARI&#209', 1, 'A', 'I'),
(246, 'MEJIA', 19, 'A', 'I'),
(247, 'MONTES', 19, 'A', 'I'),
(248, 'RIBERO', 19, 'A', 'I'),
(249, 'SUCRE', 19, 'A', 'I'),
(250, 'VALDEZ', 19, 'A', 'I'),
(251, 'ANDRES BELLO', 20, 'A', 'I'),
(252, 'ANTONIO ROMULO COSTA', 20, 'A', 'I'),
(253, 'AYACUCHO', 20, 'A', 'I'),
(254, 'BOLIVAR', 20, 'A', 'I'),
(255, 'CARDENAS', 20, 'A', 'I'),
(256, 'CORDOBA', 20, 'A', 'I'),
(257, 'FERNANDEZ FEO', 20, 'A', 'I'),
(258, 'FRANCISCO DE MIRANDA', 20, 'A', 'I'),
(259, 'GARCIA DE HEVIA', 20, 'A', 'I'),
(260, 'BERMUDEZ', 20, 'A', 'I'),
(261, 'INDEPENDENCIA', 20, 'A', 'I'),
(262, 'JAUREGUI', 20, 'A', 'I'),
(263, 'JOSE MARIA VARGAS', 20, 'A', 'I'),
(264, 'JUNIN', 20, 'A', 'I'),
(265, 'LIBERTAD', 20, 'A', 'I'),
(266, 'LIBERTADOR', 20, 'A', 'I'),
(267, 'LOBATERA', 20, 'A', 'I'),
(268, 'MICHELENA', 20, 'A', 'I'),
(269, 'PANAMERICANO', 20, 'A', 'I'),
(270, 'PEDRO MARIA URE&#209', 1, 'A', 'I'),
(271, 'RAFAEL URDANETA', 20, 'A', 'I'),
(272, 'SAMUEL DARIO MALDONADO', 20, 'A', 'I'),
(273, 'SAN CRISTOBAL', 20, 'A', 'I'),
(274, 'SEBORUCO', 20, 'A', 'I'),
(275, 'SIMON RODRIGUEZ', 20, 'A', 'I'),
(276, 'SUCRE', 20, 'A', 'I'),
(277, 'TORBES', 20, 'A', 'I'),
(278, 'URIBANTE', 20, 'A', 'I'),
(279, 'GUASIMO', 20, 'A', 'I'),
(280, 'ANDRES BELLO', 21, 'A', 'I'),
(281, 'BOCONO', 21, 'A', 'I'),
(282, 'BOLIVAR', 21, 'A', 'I'),
(283, 'CANDELARIA', 21, 'A', 'I'),
(284, 'CARACHE', 21, 'A', 'I'),
(285, 'ESCUQUE', 21, 'A', 'I'),
(286, 'JOSE FELIPE MARQUEZ CA&#209', 1, 'A', 'I'),
(287, 'JUAN VICENTE CAMPO ELIAS', 21, 'A', 'I'),
(288, 'LA CEIBA', 21, 'A', 'I'),
(289, 'MIRANDA', 21, 'A', 'I'),
(290, 'MONTE CARMELO', 21, 'A', 'I'),
(291, 'MOTATAN', 21, 'A', 'I'),
(292, 'PAMPAN', 21, 'A', 'I'),
(293, 'PAMPANITO', 21, 'A', 'I'),
(294, 'RAFAEL RANGEL', 21, 'A', 'I'),
(295, 'SAN RAFAEL DE CARVAJAL', 21, 'A', 'I'),
(296, 'SUCRE', 21, 'A', 'I'),
(297, 'TRUJILLO', 21, 'A', 'I'),
(298, 'URDANETA', 21, 'A', 'I'),
(299, 'VALERA', 21, 'A', 'I'),
(300, 'ANDRES BELLO', 22, 'A', 'I'),
(301, 'BOLIVAR', 22, 'A', 'I'),
(302, 'BRUZUAL', 22, 'A', 'I'),
(303, 'COCOROTE', 22, 'A', 'I'),
(304, 'INDEPENDENCIA', 22, 'A', 'I'),
(305, 'JOSE ANTONIO PAEZ', 22, 'A', 'I'),
(306, 'LA TRINidmunicipioAD', 22, 'A', 'I'),
(307, 'MANUEL MONGE', 22, 'A', 'I'),
(308, 'NIRGUA', 22, 'A', 'I'),
(309, 'PE&#209', 1, 'A', 'I'),
(310, 'SAN FELIPE', 22, 'A', 'I'),
(311, 'SUCRE', 22, 'A', 'I'),
(312, 'PAMPAN', 22, 'A', 'I'),
(313, 'VEROES', 22, 'A', 'I'),
(314, 'ALMIRANTE PADILLA', 23, 'A', 'I'),
(315, 'BARALT', 23, 'A', 'I'),
(316, 'CABIMAS', 23, 'A', 'I'),
(317, 'CATATUMBO', 23, 'A', 'I'),
(318, 'COLON', 23, 'A', 'I'),
(319, 'FRANCISCO JAVIER PULGAR', 23, 'A', 'I'),
(320, 'JESUS ENRIQUE LOZADA', 23, 'A', 'I'),
(321, 'JESUS MARIA SEMPRUN', 23, 'A', 'I'),
(322, 'LA CA&#209', 1, 'A', 'I'),
(323, 'LAGUNILLAS', 23, 'A', 'I'),
(324, 'MACHIQUES DE PERIJA', 23, 'A', 'I'),
(325, 'MARA', 23, 'A', 'I'),
(326, 'MARACAIBO', 23, 'A', 'I'),
(327, 'MIRANDA', 23, 'A', 'I'),
(328, 'PAEZ', 23, 'A', 'I'),
(329, 'ROSARIO DE PERIJA', 23, 'A', 'I'),
(330, 'SAN FRANCISCO', 23, 'A', 'I'),
(331, 'SANTA RITA', 23, 'A', 'I'),
(332, 'SIMON BOLIVAR', 23, 'A', 'I'),
(333, 'SUCRE', 23, 'A', 'I'),
(334, 'VALMORE RODRIGUEZ', 23, 'A', 'I'),
(335, 'VARGAS', 24, 'A', 'I'),
(336, 'DEPENDENCIAS FEDERALES', 25, 'A', 'I'),
(337, 'BARUTA', 7, 'A', 'I'),
(338, 'CARACILO PARRA Y OLMEDO', 14, 'A', 'I'),
(339, 'LEONARDO INFANTE', 12, 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE IF NOT EXISTS `parroquia` (
  `idparroquia` int(11) NOT NULL AUTO_INCREMENT,
  `idmunicipio` int(11) NOT NULL,
  `nombre_p` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idparroquia`),
  KEY `FK_municipio_idx` (`idmunicipio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1120 ;

--
-- Volcado de datos para la tabla `parroquia`
--

INSERT INTO `parroquia` (`idparroquia`, `idmunicipio`, `nombre_p`, `estatus`, `borrado`) VALUES
(1, 1, ' ALTAGRACIA ', 'A', 'I'),
(2, 1, ' ANTIMANO ', 'A', 'I'),
(3, 1, ' CANDELARIA ', 'A', 'I'),
(4, 1, ' CARICUAO ', 'A', 'I'),
(5, 1, ' CATEDRAL ', 'A', 'I'),
(6, 1, ' COCHE ', 'A', 'I'),
(7, 1, ' EL JUNQUITO ', 'A', 'I'),
(8, 1, ' EL PARAISO ', 'A', 'I'),
(9, 1, ' EL RECREO ', 'A', 'I'),
(10, 1, ' EL VALLE ', 'A', 'I'),
(11, 1, ' LA PASTORA ', 'A', 'I'),
(12, 1, ' LA VEGA ', 'A', 'I'),
(13, 1, ' MACARAO ', 'A', 'I'),
(14, 1, ' SAN AGUSTIN ', 'A', 'I'),
(15, 1, ' SAN BERNARDINO ', 'A', 'I'),
(16, 1, ' SAN JOSE ', 'A', 'I'),
(17, 1, ' SAN JUAN ', 'A', 'I'),
(18, 1, ' SAN PEDRO ', 'A', 'I'),
(19, 1, ' SANTA ROSALIA ', 'A', 'I'),
(20, 1, ' SANTA TERESA ', 'A', 'I'),
(21, 1, ' SUCRE ', 'A', 'I'),
(22, 1, ' 23 DE ENERO ', 'A', 'I'),
(23, 1, ' CAPITAL ALTO ORINOCO ', 'A', 'I'),
(24, 2, ' UCATA ', 'A', 'I'),
(25, 3, ' NO URBANA PAO DE ZARATE ', 'A', 'I'),
(26, 3, ' PARAISO DE SAN JOSE ', 'A', 'I'),
(27, 4, ' SAMARIAPO ', 'A', 'I'),
(28, 5, ' VICTORINO ', 'A', 'I'),
(29, 6, ' ALTO VENTUARI ', 'A', 'I'),
(30, 7, ' CAPITAL RIO NEGRO ', 'A', 'I'),
(31, 1, ' CAPITAL ANACO ', 'A', 'I'),
(32, 1, ' SAN JOAQUIN ', 'A', 'I'),
(33, 2, ' CAPITAL ARAGUA ', 'A', 'I'),
(34, 2, ' CACHIPO ', 'A', 'I'),
(35, 3, ' CAPITAL FERNANDO DE PE&#209', 'A', 'I'),
(36, 3, ' SAN MIGUEL ', 'A', 'I'),
(37, 3, ' SUCRE ', 'A', 'I'),
(38, 4, ' VALLE DE GUANAPE ', 'A', 'I'),
(39, 4, ' SANTA ROSALIA ', 'A', 'I'),
(40, 5, ' CAPITAL FRANCISCO DE MIRANDA ', 'A', 'I'),
(41, 5, ' ATAPIRIRE ', 'A', 'I'),
(42, 5, ' BOCA DEL PAO ', 'A', 'I'),
(43, 5, ' EL PAO ', 'A', 'I'),
(44, 6, ' GUANTA ', 'A', 'I'),
(45, 3, ' PARHUE&#209', 'A', 'I'),
(46, 7, ' CAPITAL INDEPENDENCIA ', 'A', 'I'),
(47, 7, ' MAMO ', 'A', 'I'),
(48, 8, ' CAPITAL PUERTO LA CRUZ ', 'A', 'I'),
(49, 8, ' POZUELOS ', 'A', 'I'),
(50, 9, ' CAPITAL ONOTO ', 'A', 'I'),
(51, 9, ' SAN PABLO ', 'A', 'I'),
(52, 10, ' CAPITAL JOSE GREGORIO MONAGAS ', 'A', 'I'),
(53, 10, ' PIAR ', 'A', 'I'),
(54, 10, ' SAN DIEGO DE CABRUTICA ', 'A', 'I'),
(55, 10, ' SANTA CLARA ', 'A', 'I'),
(56, 10, ' UVERITO ', 'A', 'I'),
(57, 10, ' ZUATA ', 'A', 'I'),
(58, 11, ' CAPITAL LIBERTAD ', 'A', 'I'),
(59, 11, ' EL CARITO ', 'A', 'I'),
(60, 11, ' SANTA INES ', 'A', 'I'),
(61, 12, ' CAPITAL CLARINES ', 'A', 'I'),
(62, 12, ' GUANAPE ', 'A', 'I'),
(63, 12, ' SABANA DE UCHIRE ', 'A', 'I'),
(64, 13, ' CAPITAL PEDRO MARIA FREITES ', 'A', 'I'),
(65, 13, ' LIBERTADOR ', 'A', 'I'),
(66, 13, ' SANTA ROSA ', 'A', 'I'),
(67, 13, ' URICA ', 'A', 'I'),
(68, 14, ' CAPITAL PIRITU ', 'A', 'I'),
(69, 14, ' SAN FRANCISCO ', 'A', 'I'),
(70, 15, ' CAPITAL SAN JOSE DE GUANIPA ', 'A', 'I'),
(71, 16, ' CAPITAL BOCA DE UCHIRE ', 'A', 'I'),
(72, 16, ' BOCA DE CHAVEZ ', 'A', 'I'),
(73, 17, ' CAPITAL SANTA ANA ', 'A', 'I'),
(74, 17, ' PUEBLO NUEVO ', 'A', 'I'),
(75, 18, ' EL CARMEN ', 'A', 'I'),
(76, 18, ' SAN CRISTOBAL ', 'A', 'I'),
(77, 18, ' BERGANTIN ', 'A', 'I'),
(78, 18, ' CAIGUA ', 'A', 'I'),
(79, 18, ' EL PILAR ', 'A', 'I'),
(80, 18, ' SANTA INUS ', 'A', 'I'),
(81, 19, ' P. CAPITAL SIMON RODRIGUEZ ', 'A', 'I'),
(82, 20, ' EL CHAPARRO ', 'A', 'I'),
(83, 20, ' TOMAS ALFARO CALATRAVA ', 'A', 'I'),
(84, 21, ' LECHERIAS ', 'A', 'I'),
(85, 21, ' EL MORRO ', 'A', 'I'),
(86, 1, ' URBANA ACHAGUAS ', 'A', 'I'),
(87, 1, ' APURITO ', 'A', 'I'),
(88, 1, ' EL YAGUAL ', 'A', 'I'),
(89, 1, ' GUACHARA ', 'A', 'I'),
(90, 1, ' MUCURITAS ', 'A', 'I'),
(91, 1, ' QUESERAS DEL MEDIO ', 'A', 'I'),
(92, 2, ' URBANA BIRUACA ', 'A', 'I'),
(93, 3, ' URBANA BRUZUAL ', 'A', 'I'),
(94, 3, ' MANTECAL ', 'A', 'I'),
(95, 3, ' QUINTERO ', 'A', 'I'),
(96, 3, ' RINCON HONDO ', 'A', 'I'),
(97, 3, ' SAN VICENTE ', 'A', 'I'),
(98, 4, ' URBANA GUASDUALITO ', 'A', 'I'),
(99, 4, ' ARAMENDI ', 'A', 'I'),
(100, 4, ' EL AMPARO ', 'A', 'I'),
(101, 4, ' SAN CAMILO ', 'A', 'I'),
(102, 4, ' URDANETA ', 'A', 'I'),
(103, 5, ' URBANA SAN JUAN DE PAYARA ', 'A', 'I'),
(104, 5, ' CODAZZI ', 'A', 'I'),
(105, 5, ' CUNAVICHE ', 'A', 'I'),
(106, 6, ' URBANA ELORZA ', 'A', 'I'),
(107, 6, ' LA TRINIDAD ', 'A', 'I'),
(108, 7, ' URBANA SAN FERNANDO ', 'A', 'I'),
(109, 7, ' EL RECREO ', 'A', 'I'),
(110, 4, ' PE&Ntilde', 'A', 'I'),
(111, 7, ' SAN RAFAEL DE ATAMAICA ', 'A', 'I'),
(112, 1, ' CAPITAL BOLIVAR ', 'A', 'I'),
(113, 2, ' CAPITAL CAMATAGUA ', 'A', 'I'),
(114, 2, ' NO URBANA CARMEN DE CURA ', 'A', 'I'),
(115, 3, ' NO URBANA CHORONI ', 'A', 'I'),
(116, 3, ' URBANA LAS DELICIAS ', 'A', 'I'),
(117, 3, ' URBANA M. MARIA DE S JOSE ', 'A', 'I'),
(118, 3, ' URBANA JOAQUIN CRESPO ', 'A', 'I'),
(119, 3, ' URBANA PEDRO JOSE OVALLES ', 'A', 'I'),
(120, 3, ' URBANA JOSE CASANOVA GODOY ', 'A', 'I'),
(121, 3, ' URBANA ANDRES ELOY BLANCO ', 'A', 'I'),
(122, 3, ' URBANA LOS TACARIGUAS ', 'A', 'I'),
(123, 4, ' CAPITAL JOSE ANGEL LAMAS ', 'A', 'I'),
(124, 5, ' CAPITAL JOSE FELIX RIBAS ', 'A', 'I'),
(125, 5, ' CASTOR NIEVES RIOS ', 'A', 'I'),
(126, 5, ' NO URBANA LAS GUACAMAYAS ', 'A', 'I'),
(127, 5, ' NO URBANA PAO DE ZARATE ', 'A', 'I'),
(128, 5, ' NO URBANA ZUATA ', 'A', 'I'),
(129, 6, ' CAPITAL DIAZ ', 'A', 'I'),
(130, 7, ' CAPITAL LIBERTADOR ', 'A', 'I'),
(131, 7, ' NO URBANA S MARTIN DE PORRES ', 'A', 'I'),
(132, 5, ' CAPITAL MARIO BRICE&Ntilde', 'A', 'I'),
(133, 5, ' CA&Ntilde', 'A', 'I'),
(134, 9, ' CAPITAL SAN CASIMIRO ', 'A', 'I'),
(135, 9, ' NO URBANA GUIRIPA ', 'A', 'I'),
(136, 9, ' NO URBANA OLLAS DE CARAMACATE ', 'A', 'I'),
(137, 9, ' NO URBANA VALLE MORIN ', 'A', 'I'),
(138, 10, ' CAPITAL SAN SEBASTIAN ', 'A', 'I'),
(139, 5, ' CAPITAL SANTIAGO MARI&Ntilde', 'A', 'I'),
(140, 11, ' NO URBANA ARAVALO APONTE ', 'A', 'I'),
(141, 11, ' NO URBANA CHUAO ', 'A', 'I'),
(142, 11, ' NO URBANA SAMAN DE GUERE ', 'A', 'I'),
(143, 11, ' NO URBANA ALFREDO PACHECO M ', 'A', 'I'),
(144, 12, ' CAPITAL SANTOS MICHELENA ', 'A', 'I'),
(145, 12, ' NO URBANA TIARA ', 'A', 'I'),
(146, 13, ' CAPITAL SUCRE ', 'A', 'I'),
(147, 13, ' NO URBANA BELLA VISTA ', 'A', 'I'),
(148, 14, ' CAPITAL TOVAR ', 'A', 'I'),
(149, 15, ' CAPITAL URDANETA ', 'A', 'I'),
(150, 5, ' NO URBANA LAS PE&Ntilde', 'A', 'I'),
(151, 15, ' NO URBANA SAN FRANCISCO DE C ', 'A', 'I'),
(152, 15, ' NO URBANA TAGUAY ', 'A', 'I'),
(153, 16, ' CAPITAL ZAMORA ', 'A', 'I'),
(154, 16, ' NO URBANA MAGDALENO ', 'A', 'I'),
(155, 16, ' NO URBANA S FRANCISCO DE ASIS ', 'A', 'I'),
(156, 16, ' NO URBANA VALLES DE TUCUTUNEMO ', 'A', 'I'),
(157, 16, ' NO URBANA AUGUSTO MIJARES ', 'A', 'I'),
(158, 17, ' CAPITAL FRANCISCO LINARES A. ', 'A', 'I'),
(159, 17, ' NO URBANA FRANCISCO DE MIRANDA ', 'A', 'I'),
(160, 5, ' NO URBANA MONSE&Ntilde', 'A', 'I'),
(161, 18, ' CAPITAL OCM DE LA COSTA DE ORO ', 'A', 'I'),
(162, 1, ' SABANETA ', 'A', 'I'),
(163, 1, ' RODRIGUEZ DOMINGUEZ ', 'A', 'I'),
(164, 2, ' TICOPORO ', 'A', 'I'),
(165, 2, ' ANDRES BELLO ', 'A', 'I'),
(166, 2, ' NICOLAS PULIDO ', 'A', 'I'),
(167, 3, ' ARISMENDI ', 'A', 'I'),
(168, 3, ' GUADARRAMA ', 'A', 'I'),
(169, 3, ' LA UNION ', 'A', 'I'),
(170, 3, ' SAN ANTONIO ', 'A', 'I'),
(171, 4, ' BARINAS ', 'A', 'I'),
(172, 4, ' ALFREDO ARVELO LARRIVA ', 'A', 'I'),
(173, 4, ' SAN SILVESTRE ', 'A', 'I'),
(174, 4, ' SANTA INES ', 'A', 'I'),
(175, 4, ' SANTA LUCIA ', 'A', 'I'),
(176, 4, ' TORUNOS ', 'A', 'I'),
(177, 4, ' EL CARMEN ', 'A', 'I'),
(178, 4, ' ROMULO BETANCOURT ', 'A', 'I'),
(179, 4, ' CHIQUINQUIRA ', 'A', 'I'),
(180, 4, ' RAMON IGNACIO MENDEZ ', 'A', 'I'),
(181, 4, ' ALTO BARINAS ', 'A', 'I'),
(182, 4, ' MANUEL PALACIO FAJARDO ', 'A', 'I'),
(183, 4, ' JUAN A RODRIGUEZ DOMINGUEZ ', 'A', 'I'),
(184, 4, ' DOMINGA ORTIZ DE PEREZ ', 'A', 'I'),
(185, 5, ' BARINITAS ', 'A', 'I'),
(186, 5, ' ALTAMIRA ', 'A', 'I'),
(187, 5, ' CALDERAS ', 'A', 'I'),
(188, 6, ' BARRANCAS ', 'A', 'I'),
(189, 6, ' EL SOCORRO ', 'A', 'I'),
(190, 6, ' MASPARRITO ', 'A', 'I'),
(191, 7, ' SANTA BARBARA ', 'A', 'I'),
(192, 7, ' JOSE IGNACIO DEL PUMAR ', 'A', 'I'),
(193, 6, ' PEDRO BRICE&#209', 'A', 'I'),
(194, 7, ' RAMON IGNACIO MENDEZ ', 'A', 'I'),
(195, 8, ' OBISPOS ', 'A', 'I'),
(196, 8, ' EL REAL ', 'A', 'I'),
(197, 8, ' LA LUZ ', 'A', 'I'),
(198, 8, ' LOS GUASIMITOS ', 'A', 'I'),
(199, 9, ' CIUDAD BOLIVIA ', 'A', 'I'),
(200, 6, ' IGNACIO BRICE&#209', 'A', 'I'),
(201, 9, ' JOSE FELIX RIBAS ', 'A', 'I'),
(202, 9, ' PAEZ ', 'A', 'I'),
(203, 10, ' LIBERTAD ', 'A', 'I'),
(204, 10, ' DOLORES ', 'A', 'I'),
(205, 10, ' PALACIOS FAJARDO ', 'A', 'I'),
(206, 10, ' SANTA ROSA ', 'A', 'I'),
(207, 11, ' CIUDAD DE NUTRIAS ', 'A', 'I'),
(208, 11, ' EL REGALO ', 'A', 'I'),
(209, 11, ' PUERTO DE NUTRIAS ', 'A', 'I'),
(210, 11, ' SANTA CATALINA ', 'A', 'I'),
(211, 12, ' EL CANTON ', 'A', 'I'),
(212, 12, ' SANTA CRUZ DE GUACAS ', 'A', 'I'),
(213, 12, ' PUERTO VIVAS ', 'A', 'I'),
(214, 1, ' CACHAMAY ', 'A', 'I'),
(215, 67, ' CHIRICA ', 'A', 'I'),
(216, 1, ' DALLA COSTA ', 'A', 'I'),
(217, 1, ' ONCE DE ABRIL ', 'A', 'I'),
(218, 1, ' SIMON BOLIVAR ', 'A', 'I'),
(219, 1, ' UNARE ', 'A', 'I'),
(220, 1, ' UNIVERSIDAD ', 'A', 'I'),
(221, 1, ' VISTA AL SOL ', 'A', 'I'),
(222, 1, ' POZO VERDE ', 'A', 'I'),
(223, 1, ' YOCOIMA ', 'A', 'I'),
(224, 15, ' SECCION CAPITAL CEDE&#209', 'A', 'I'),
(225, 2, ' ADRIAN ', 'A', 'I'),
(226, 2, ' ASCENSION FARRERAS ', 'A', 'I'),
(227, 2, ' GUIRIA ', 'A', 'I'),
(228, 2, ' LA URBANA ', 'A', 'I'),
(229, 2, ' PIJIGUAOS ', 'A', 'I'),
(230, 3, ' CAPITAL EL CALLAO ', 'A', 'I'),
(231, 4, ' SECCION CAPITAL GRAN SABANA ', 'A', 'I'),
(232, 4, ' IKABARU ', 'A', 'I'),
(233, 5, ' AGUA SALADA ', 'A', 'I'),
(234, 5, ' CATEDRAL ', 'A', 'I'),
(235, 5, ' JOSE ANTONIO PAEZ ', 'A', 'I'),
(236, 5, ' LA SABANITA ', 'A', 'I'),
(237, 5, ' MARHUANTA ', 'A', 'I'),
(238, 5, ' VISTA HERMOSA ', 'A', 'I'),
(239, 5, ' ORINOCO ', 'A', 'I'),
(240, 5, ' PANAPANA ', 'A', 'I'),
(241, 5, ' ZEA ', 'A', 'I'),
(242, 6, ' SECCION CAPITAL PIAR ', 'A', 'I'),
(243, 6, ' ANDRES ELOY BLANCO ', 'A', 'I'),
(244, 6, ' PEDRO COVA ', 'A', 'I'),
(245, 7, ' SECCION CAPITAL RAUL LEONI ', 'A', 'I'),
(246, 7, ' BARCELONETA ', 'A', 'I'),
(247, 7, ' SAN FRANCISCO ', 'A', 'I'),
(248, 7, ' SANTA BARBARA ', 'A', 'I'),
(249, 8, ' SECCION CAPITAL ROSCIO ', 'A', 'I'),
(250, 8, ' SALOM ', 'A', 'I'),
(251, 9, ' SECCION CAPITAL SIFONTES ', 'A', 'I'),
(252, 9, ' DALLA COSTA ', 'A', 'I'),
(253, 9, ' SAN ISIDRO ', 'A', 'I'),
(254, 10, ' SECCION CAPITAL SUCRE ', 'A', 'I'),
(255, 10, ' ARIPAO ', 'A', 'I'),
(256, 10, ' GUARATARO ', 'A', 'I'),
(257, 10, ' LAS MAJADAS ', 'A', 'I'),
(258, 10, ' MOITACO ', 'A', 'I'),
(259, 11, ' CAPITAL PADRE PEDRO CHIEN ', 'A', 'I'),
(260, 1, ' URBANA BEJUMA ', 'A', 'I'),
(261, 1, ' NO URBANA CANOABO ', 'A', 'I'),
(262, 1, ' NO URBANA SIMON BOLIVAR ', 'A', 'I'),
(263, 2, ' URBANA GUIGUE ', 'A', 'I'),
(264, 2, ' NO URBANA BELUN ', 'A', 'I'),
(265, 2, ' NO URBANA TACARIGUA ', 'A', 'I'),
(266, 3, ' URBANA AGUAS CALIENTES ', 'A', 'I'),
(267, 3, ' URBANA MARIARA ', 'A', 'I'),
(268, 4, ' URBANA CIUDAD ALIANZA ', 'A', 'I'),
(269, 4, ' URBANA GUACARA ', 'A', 'I'),
(270, 4, ' NO URBANA YAGUA ', 'A', 'I'),
(271, 5, ' URBANA MORON ', 'A', 'I'),
(272, 5, ' NO URBANA URAMA ', 'A', 'I'),
(273, 6, ' URBANA TOCUYITO ', 'A', 'I'),
(274, 6, ' URBANA INDEPENDENCIA ', 'A', 'I'),
(275, 7, ' URBANA LOS GUAYOS ', 'A', 'I'),
(276, 8, ' URBANA MIRANDA ', 'A', 'I'),
(277, 9, ' URBANA MONTALBAN ', 'A', 'I'),
(278, 10, ' URBANA NAGUANAGUA ', 'A', 'I'),
(279, 11, ' URBANA BARTOLOME SALOM ', 'A', 'I'),
(280, 11, ' URBANA DEMOCRACIA ', 'A', 'I'),
(281, 11, ' URBANA FRATERNIDAD ', 'A', 'I'),
(282, 11, ' URBANA GOAIGOAZA ', 'A', 'I'),
(283, 11, ' URBANA JUAN JOSE FLORES ', 'A', 'I'),
(284, 11, ' URBANA UNION ', 'A', 'I'),
(285, 11, ' NO URBANA BORBURATA ', 'A', 'I'),
(286, 11, ' NICOLAS PULIDO ', 'A', 'I'),
(287, 12, ' URBANA SAN DIEGO ', 'A', 'I'),
(288, 13, ' URBANA SAN JOAQUIN ', 'A', 'I'),
(289, 14, ' URBANA CANDELARIA ', 'A', 'I'),
(290, 14, ' URBANA CATEDRAL ', 'A', 'I'),
(291, 14, ' URBANA EL SOCORRO ', 'A', 'I'),
(292, 8, ' URBANA MIGUEL PE&#209', 'A', 'I'),
(293, 14, ' URBANA RAFAEL URDANETA ', 'A', 'I'),
(294, 14, ' URBANA GUIGUE ', 'A', 'I'),
(295, 14, ' URBANA SAN JOSE ', 'A', 'I'),
(296, 14, ' URBANA SANTA ROSA ', 'A', 'I'),
(297, 14, ' NO URBANA NEGRO PRIMERO ', 'A', 'I'),
(298, 1, ' COJEDES ', 'A', 'I'),
(299, 1, ' JUAN DE MATA SUAREZ ', 'A', 'I'),
(300, 2, ' TINAQUILLO ', 'A', 'I'),
(301, 3, ' EL BAUL ', 'A', 'I'),
(302, 3, ' SUCRE ', 'A', 'I'),
(303, 4, ' MACAPO ', 'A', 'I'),
(304, 4, ' LA AGUADITA ', 'A', 'I'),
(305, 5, ' EL PAO ', 'A', 'I'),
(306, 6, ' LIBERTAD DE COJEDES ', 'A', 'I'),
(307, 6, ' EL AMPARO ', 'A', 'I'),
(308, 7, ' ROMULO GALLEGOS ', 'A', 'I'),
(309, 8, ' SAN CARLOS DE AUSTRIA ', 'A', 'I'),
(310, 8, ' JUAN ANGEL BRAVO ', 'A', 'I'),
(311, 8, ' MANUEL MANRIQUE ', 'A', 'I'),
(312, 9, ' GENERAL JOSE LAURENCIO SILVA ', 'A', 'I'),
(313, 1, ' CURIAPO ', 'A', 'I'),
(314, 1, ' ALMIRANTE LUIS BRION ', 'A', 'I'),
(315, 1, ' FRANCISCO ANICETO LUGO ', 'A', 'I'),
(316, 1, ' MANUEL RENAUD ', 'A', 'I'),
(317, 1, ' PADRE BARRAL ', 'A', 'I'),
(318, 1, ' SANTOS DE ABELGAS ', 'A', 'I'),
(319, 2, ' IMATACA ', 'A', 'I'),
(320, 2, ' CINCO DE JULIO ', 'A', 'I'),
(321, 2, ' JUAN BAUTISTA ARISMENDI ', 'A', 'I'),
(322, 2, ' MANUEL PIAR ', 'A', 'I'),
(323, 2, ' ROMULO GALLEGOS ', 'A', 'I'),
(324, 3, ' PEDERNALES ', 'A', 'I'),
(325, 3, ' LUIS BELTRAN PRIETO FIGUEROA ', 'A', 'I'),
(326, 4, ' SAN JOSE ', 'A', 'I'),
(327, 4, ' JOSE VIDAL MARCANO ', 'A', 'I'),
(328, 4, ' JUAN MILLAN ', 'A', 'I'),
(329, 4, ' LEONARDO RUIZ PINEDA ', 'A', 'I'),
(330, 4, ' MARISCAL ANTONIO JOSE DE SUCRE ', 'A', 'I'),
(331, 4, ' MARIA DE LA C PALACIOS BLANCO ', 'A', 'I'),
(332, 4, ' SAN RAFAEL ', 'A', 'I'),
(333, 4, ' VIRGEN DEL VALLE ', 'A', 'I'),
(334, 1, ' SAN JUAN DE LOS CAYOS ', 'A', 'I'),
(335, 1, ' CAPADARE ', 'A', 'I'),
(336, 1, ' LA PASTORA ', 'A', 'I'),
(337, 1, ' LIBERTADOR ', 'A', 'I'),
(338, 2, ' SAN LUIS ', 'A', 'I'),
(339, 2, ' ARACUA ', 'A', 'I'),
(340, 11, ' LA PE&#209', 'A', 'I'),
(341, 3, ' CAPATARIDA ', 'A', 'I'),
(342, 3, ' BARIRO ', 'A', 'I'),
(343, 3, ' BOROJO ', 'A', 'I'),
(344, 3, ' GUAJIRO ', 'A', 'I'),
(345, 3, ' SEQUE ', 'A', 'I'),
(346, 3, ' ZAZARIDA ', 'A', 'I'),
(347, 4, ' CAPITAL CACIQUE MANAURE ', 'A', 'I'),
(348, 5, ' CARIRUBANA ', 'A', 'I'),
(349, 5, ' NORTE ', 'A', 'I'),
(350, 5, ' PUNTA CARDON ', 'A', 'I'),
(351, 5, ' SANTA ANA ', 'A', 'I'),
(352, 6, ' LA VELA DE CORO ', 'A', 'I'),
(353, 6, ' ACURIGUA ', 'A', 'I'),
(354, 6, ' GUAIBACOA ', 'A', 'I'),
(355, 6, ' LAS CALDERAS ', 'A', 'I'),
(356, 6, ' MACORUCA ', 'A', 'I'),
(357, 7, ' CAPITAL DABAJURO ', 'A', 'I'),
(358, 8, ' PEDREGAL ', 'A', 'I'),
(359, 8, ' AGUA CLARA ', 'A', 'I'),
(360, 8, ' AVARIA ', 'A', 'I'),
(361, 8, ' PIEDRA GRANDE ', 'A', 'I'),
(362, 8, ' PURURECHE ', 'A', 'I'),
(363, 9, ' PUEBLO NUEVO ', 'A', 'I'),
(364, 9, ' ADICORA ', 'A', 'I'),
(365, 9, ' BARAIVED ', 'A', 'I'),
(366, 9, ' BUENA VISTA ', 'A', 'I'),
(367, 9, ' JADACAQUIVA ', 'A', 'I'),
(368, 9, ' MORUY ', 'A', 'I'),
(369, 9, ' ADAURE ', 'A', 'I'),
(370, 9, ' EL CAFE ', 'A', 'I'),
(371, 9, ' EL VINCULO ', 'A', 'I'),
(372, 10, ' CHURUGUARA ', 'A', 'I'),
(373, 10, ' AGUA LARGA ', 'A', 'I'),
(374, 10, ' EL PAUJI ', 'A', 'I'),
(375, 10, ' INDEPENDENCIA ', 'A', 'I'),
(376, 10, ' MAPARARI ', 'A', 'I'),
(377, 11, ' JACURA ', 'A', 'I'),
(378, 11, ' AGUA LINDA ', 'A', 'I'),
(379, 11, ' ARAURIMA ', 'A', 'I'),
(380, 12, ' LEONCIO MARTINEZ ', 'A', 'I'),
(381, 12, ' JUDIBANA ', 'A', 'I'),
(382, 13, ' MENE DE MAUROA ', 'A', 'I'),
(383, 13, ' CASIGUA ', 'A', 'I'),
(384, 13, ' SAN FELIX ', 'A', 'I'),
(385, 14, ' SAN ANTONIO ', 'A', 'I'),
(386, 14, ' SAN GABRIEL ', 'A', 'I'),
(387, 14, ' SANTA ANA ', 'A', 'I'),
(388, 14, ' GUZMAN GUILLERMO ', 'A', 'I'),
(389, 14, ' MITARE ', 'A', 'I'),
(390, 14, ' RIO SECO ', 'A', 'I'),
(391, 14, ' SABANETA ', 'A', 'I'),
(392, 119, ' CHICHIRIVICHE ', 'A', 'I'),
(393, 15, ' BOCA DE TOCUYO ', 'A', 'I'),
(394, 15, ' TOCUYO DE LA COSTA ', 'A', 'I'),
(395, 16, ' CAPITAL PALMASOLA ', 'A', 'I'),
(396, 17, ' CABURE ', 'A', 'I'),
(397, 17, ' COLINA ', 'A', 'I'),
(398, 17, ' CONCEPCION ', 'A', 'I'),
(399, 18, ' PIRITU ', 'A', 'I'),
(400, 18, ' SAN JOSE DE LA COSTA ', 'A', 'I'),
(401, 19, ' CAPITAL SAN FRANCISCO ', 'A', 'I'),
(402, 20, ' TUCACAS ', 'A', 'I'),
(403, 20, ' BOCA DE AROA ', 'A', 'I'),
(404, 21, ' SUCRE ', 'A', 'I'),
(405, 21, ' PECAYA ', 'A', 'I'),
(406, 22, ' CAPITAL TOCOPERO ', 'A', 'I'),
(407, 23, ' SANTA CRUZ DE BUCARAL ', 'A', 'I'),
(408, 23, ' EL CHARAL ', 'A', 'I'),
(409, 23, ' LAS VEGAS DEL TUY ', 'A', 'I'),
(410, 24, ' URUMACO ', 'A', 'I'),
(411, 24, ' BRUZUAL ', 'A', 'I'),
(412, 25, ' PUERTO CUMAREBO ', 'A', 'I'),
(413, 25, ' LA CIENAGA ', 'A', 'I'),
(414, 25, ' LA SOLEDAD ', 'A', 'I'),
(415, 25, ' PUEBLO CUMAREBO ', 'A', 'I'),
(416, 25, ' ZAZARIDA ', 'A', 'I'),
(417, 1, ' CAPITAL CAMAGUAN ', 'A', 'I'),
(418, 1, ' PUERTO MIRANDA ', 'A', 'I'),
(419, 1, ' UVERITO ', 'A', 'I'),
(420, 2, ' CHAGUARAMAS ', 'A', 'I'),
(421, 3, ' EL SOCORRO ', 'A', 'I'),
(422, 4, ' CAPITAL S GERONIM. DE GUAYABAL ', 'A', 'I'),
(423, 4, ' CAZORLA ', 'A', 'I'),
(424, 5, ' CAPITAL VALLE DE LA PASCUA ', 'A', 'I'),
(425, 5, ' ESPINO ', 'A', 'I'),
(426, 6, ' CAPITAL LAS MERCEDES ', 'A', 'I'),
(427, 6, ' CABRUTA ', 'A', 'I'),
(428, 6, ' SANTA RITA DE MANAPIRE ', 'A', 'I'),
(429, 7, ' CAPITAL EL SOMBRERO ', 'A', 'I'),
(430, 7, ' SOSA ', 'A', 'I'),
(431, 8, ' CAPITAL CALABOZO ', 'A', 'I'),
(432, 8, ' EL CALVARIO ', 'A', 'I'),
(433, 8, ' EL RASTRO ', 'A', 'I'),
(434, 8, ' GUARDATINAJAS ', 'A', 'I'),
(435, 9, ' CAPITAL ALTAGRACIA DE ORITUCO ', 'A', 'I'),
(436, 9, ' LA UNION ', 'A', 'I'),
(437, 9, ' LIBERTAD DE ORITUCO ', 'A', 'I'),
(438, 9, ' PASO REAL DE MACAIRA ', 'A', 'I'),
(439, 9, ' SAN FRANCISCO DE MACAIRA ', 'A', 'I'),
(440, 9, ' SAN RAFAEL DE ORITUCO ', 'A', 'I'),
(441, 9, ' SOUBLETTE ', 'A', 'I'),
(442, 12, ' CAPITAL JUSTO BRICE&#209', 'A', 'I'),
(443, 10, ' SAN FRANCISCO DE TIZNADOS ', 'A', 'I'),
(444, 10, ' SAN JOSE DE TIZNADOS ', 'A', 'I'),
(445, 10, ' SAN LORENZO DE TIZNADOS ', 'A', 'I'),
(446, 11, ' CAPITAL TUCUPIDO ', 'A', 'I'),
(447, 11, ' SAN RAFAEL DE LAYA ', 'A', 'I'),
(448, 12, ' CAPITAL SAN JUAN DE LOS MORROS ', 'A', 'I'),
(449, 12, ' CANTAGALLO ', 'A', 'I'),
(450, 12, ' PARAPARA ', 'A', 'I'),
(451, 13, ' SAN JOSE DE GUARIBE ', 'A', 'I'),
(452, 14, ' CAPITAL SANTA MARIA DE IPIRE ', 'A', 'I'),
(453, 14, ' ALTAMIRA ', 'A', 'I'),
(454, 15, ' CAPITAL SIMON RODRIGUEZ ', 'A', 'I'),
(455, 15, ' SAN JOSE DE UNARE ', 'A', 'I'),
(456, 1, ' PIO TAMAYO ', 'A', 'I'),
(457, 1, ' QUEBRADA HONDA DE GUACHE ', 'A', 'I'),
(458, 1, ' YACAMBU ', 'A', 'I'),
(459, 2, ' FREITEZ ', 'A', 'I'),
(460, 2, ' JOSE MARIA BLANCO ', 'A', 'I'),
(461, 3, ' CATEDRAL ', 'A', 'I'),
(462, 3, ' CONCEPCION ', 'A', 'I'),
(463, 3, ' EL CUJI ', 'A', 'I'),
(464, 3, ' JUAN DE VILLEGAS ', 'A', 'I'),
(465, 3, ' SANTA ROSA ', 'A', 'I'),
(466, 3, ' TAMACA ', 'A', 'I'),
(467, 3, ' UNION ', 'A', 'I'),
(468, 3, ' AGUEDO FELIPE ALVARADO ', 'A', 'I'),
(469, 3, ' BUENA VISTA ', 'A', 'I'),
(470, 3, ' JUAREZ ', 'A', 'I'),
(471, 4, ' JUAN BAUTISTA RODRIGUEZ ', 'A', 'I'),
(472, 4, ' CUARA ', 'A', 'I'),
(473, 4, ' DIEGO DE LOZADA ', 'A', 'I'),
(474, 4, ' PARAISO DE SAN JOSE ', 'A', 'I'),
(475, 4, ' SAN MIGUEL ', 'A', 'I'),
(476, 4, ' TINTORERO ', 'A', 'I'),
(477, 4, ' JOSE BERNARDO DORANTE ', 'A', 'I'),
(478, 4, ' CORONEL MARIANO PERAZA ', 'A', 'I'),
(479, 5, ' BOLIVAR ', 'A', 'I'),
(480, 5, ' ANZOATEGUI ', 'A', 'I'),
(481, 5, ' GERMAN RIOS LINARES ', 'A', 'I'),
(482, 5, ' HILARIO LUNA Y LUNA ', 'A', 'I'),
(483, 5, ' HUMOCARO ALTO ', 'A', 'I'),
(484, 5, ' HUMOCARO BAJO ', 'A', 'I'),
(485, 5, ' LA CANDELARIA ', 'A', 'I'),
(486, 5, ' MORAN ', 'A', 'I'),
(487, 6, ' CABUDARE ', 'A', 'I'),
(488, 6, ' JOSE GREGORIO BASTIDAS ', 'A', 'I'),
(489, 6, ' AGUA VIVA ', 'A', 'I'),
(490, 7, ' SARARE ', 'A', 'I'),
(491, 7, ' BURIA ', 'A', 'I'),
(492, 7, ' GUSTAVO VEGAS LEON ', 'A', 'I'),
(493, 8, ' TRINIDAD SAMUEL ', 'A', 'I'),
(494, 8, ' ANTONIO DIAZ ', 'A', 'I'),
(495, 8, ' CAMACARO ', 'A', 'I'),
(496, 13, ' CASTA&#209', 'A', 'I'),
(497, 8, ' CECILIO ZUBILLAGA ', 'A', 'I'),
(498, 8, ' CHIQUINQUIRA ', 'A', 'I'),
(499, 8, ' EL BLANCO ', 'A', 'I'),
(500, 8, ' ESPINOZA DE LOS MONTEROS ', 'A', 'I'),
(501, 8, ' LARA ', 'A', 'I'),
(502, 8, ' LAS MERCEDES ', 'A', 'I'),
(503, 8, ' MANUEL MORILLO ', 'A', 'I'),
(504, 13, ' MONTA&#209', 'A', 'I'),
(505, 8, ' MONTES DE OCA ', 'A', 'I'),
(506, 8, ' TORRES ', 'A', 'I'),
(507, 8, ' REYES VARGAS ', 'A', 'I'),
(508, 8, ' ALTAGRACIA ', 'A', 'I'),
(509, 9, ' SIQUISIQUE ', 'A', 'I'),
(510, 9, ' MOROTURO ', 'A', 'I'),
(511, 9, ' SAN MIGUEL ', 'A', 'I'),
(512, 9, ' XAGUAS ', 'A', 'I'),
(513, 1, ' PRESIDENTE BETANCOURT ', 'A', 'I'),
(514, 1, ' PRESIDENTE PAEZ ', 'A', 'I'),
(515, 1, ' PRESIDENTE ROMULO GALLEGOS ', 'A', 'I'),
(516, 1, ' GABRIEL PICON GONZALEZ ', 'A', 'I'),
(517, 1, ' HECTOR AMABLE MORA ', 'A', 'I'),
(518, 1, ' IDELFONSO VASQUEZ ', 'A', 'I'),
(519, 1, ' PULIDO MENDEZ ', 'A', 'I'),
(520, 2, ' CAPITAL ANDRES BELLO ', 'A', 'I'),
(521, 3, ' CAPITAL ANTONIO PINTO SALINAS ', 'A', 'I'),
(522, 3, ' MESA BOLIVAR ', 'A', 'I'),
(523, 3, ' MESA DE LAS PALMAS ', 'A', 'I'),
(524, 4, ' CAPITAL ARICAGUA ', 'A', 'I'),
(525, 4, ' SAN ANTONIO ', 'A', 'I'),
(526, 5, ' CAPITAL ARZOBISPO CHACON ', 'A', 'I'),
(527, 5, ' CAPURI ', 'A', 'I'),
(528, 5, ' CHACANTA ', 'A', 'I'),
(529, 5, ' EL MOLINO ', 'A', 'I'),
(530, 5, ' GUAIMARAL ', 'A', 'I'),
(531, 5, ' MUCUTUY ', 'A', 'I'),
(532, 5, ' MUCUCHACHI ', 'A', 'I'),
(533, 14, ' FERNANDEZ PE&#209', 'A', 'I'),
(534, 6, ' MATRIZ ', 'A', 'I'),
(535, 6, ' MONTALBAN ', 'A', 'I'),
(536, 6, ' ACEQUIAS ', 'A', 'I'),
(537, 6, ' JAJI ', 'A', 'I'),
(538, 6, ' LA MESA ', 'A', 'I'),
(539, 6, ' SAN JOSE DEL SUR ', 'A', 'I'),
(540, 7, ' CAPITAL CARACCIOLO PARRA OLMED ', 'A', 'I'),
(541, 7, ' FLORENCIO RAMIREZ ', 'A', 'I'),
(542, 8, ' CAPITAL CARDENAL QUINTERO ', 'A', 'I'),
(543, 8, ' LAS PIEDRAS ', 'A', 'I'),
(544, 9, ' CAPITAL GUARAQUE ', 'A', 'I'),
(545, 9, ' MESA DE QUINTERO ', 'A', 'I'),
(546, 9, ' RIO NEGRO ', 'A', 'I'),
(547, 10, ' CAPITAL JULIO CESAR SALAS ', 'A', 'I'),
(548, 10, ' PALMIRA ', 'A', 'I'),
(549, 14, ' CAPITAL JUSTO BRICE&#209', 'A', 'I'),
(550, 11, ' SAN CRISTOBAL DE TORONDOY ', 'A', 'I'),
(551, 12, ' ANTONIO SPINETTI DINI ', 'A', 'I'),
(552, 12, ' ARIAS ', 'A', 'I'),
(553, 12, ' CARACCIOLO PARRA PEREZ ', 'A', 'I'),
(554, 14, ' DOMINGO PE&#209', 'A', 'I'),
(555, 12, ' EL LLANO ', 'A', 'I'),
(556, 12, ' GONZALO PICON FEBRES ', 'A', 'I'),
(557, 12, ' JACINTO PLAZA ', 'A', 'I'),
(558, 12, ' JUAN RODRIGUEZ SUAREZ ', 'A', 'I'),
(559, 12, ' LASSO DE LA VEGA ', 'A', 'I'),
(560, 12, ' MARIANO PICON SALAS ', 'A', 'I'),
(561, 12, ' MILLA ', 'A', 'I'),
(562, 12, ' OSUNA RODRIGUEZ ', 'A', 'I'),
(563, 12, ' SAGRARIO ', 'A', 'I'),
(564, 12, ' EL MORRO ', 'A', 'I'),
(565, 12, ' LOS NEVADOS ', 'A', 'I'),
(566, 13, ' CAPITAL MIRANDA ', 'A', 'I'),
(567, 13, ' ANDRES ELOY BLANCO ', 'A', 'I'),
(568, 13, ' LA VENTA ', 'A', 'I'),
(569, 14, ' PI&#209', 'A', 'I'),
(570, 14, ' CAPITAL OBISPO RAMOS DE LORA ', 'A', 'I'),
(571, 14, ' EL PAUJI ', 'A', 'I'),
(572, 14, ' SAN RAFAEL DE ALCAZAR ', 'A', 'I'),
(573, 15, ' CAPITAL PADRE NOGUERA ', 'A', 'I'),
(574, 16, ' CAPITAL PUEBLO LLANO ', 'A', 'I'),
(575, 17, ' CAPITAL RANGEL ', 'A', 'I'),
(576, 17, ' CACUTE ', 'A', 'I'),
(577, 17, ' LA TOMA ', 'A', 'I'),
(578, 17, ' MUCURUBA ', 'A', 'I'),
(579, 17, ' SAN RAFAEL ', 'A', 'I'),
(580, 18, ' CAPITAL RIVAS DAVILA ', 'A', 'I'),
(581, 18, ' GERONIMO MALDONADO ', 'A', 'I'),
(582, 19, ' CAPITAL SANTOS MARQUINA ', 'A', 'I'),
(583, 20, ' CAPITAL SUCRE ', 'A', 'I'),
(584, 20, ' CHIGUARA ', 'A', 'I'),
(585, 20, ' ESTANQUEZ ', 'A', 'I'),
(586, 20, ' LA TRAMPA ', 'A', 'I'),
(587, 20, ' PUEBLO NUEVO DEL SUR ', 'A', 'I'),
(588, 20, ' SAN JUAN ', 'A', 'I'),
(589, 21, ' EL AMPARO ', 'A', 'I'),
(590, 21, ' EL LLANO ', 'A', 'I'),
(591, 21, ' SAN FRANCISCO ', 'A', 'I'),
(592, 21, ' TOVAR ', 'A', 'I'),
(593, 22, ' CAPITAL TULIO FEBRES CORDERO ', 'A', 'I'),
(594, 22, ' INDEPENDENCIA ', 'A', 'I'),
(595, 22, ' MARIA DE LA C PALACIOS BLANCO ', 'A', 'I'),
(596, 22, ' SANTA APOLONIA ', 'A', 'I'),
(597, 23, ' CAPITAL ZEA ', 'A', 'I'),
(598, 14, ' CA&#209', 'A', 'I'),
(599, 177, ' CAUCAGUA ', 'A', 'I'),
(600, 1, ' ARAGUITA ', 'A', 'I'),
(601, 1, ' AREVALO GONZALEZ ', 'A', 'I'),
(602, 1, ' CAPAYA ', 'A', 'I'),
(603, 1, ' EL CAFE ', 'A', 'I'),
(604, 1, ' MARIZAPA ', 'A', 'I'),
(605, 1, ' PANAQUIRE ', 'A', 'I'),
(606, 1, ' RIBAS ', 'A', 'I'),
(607, 2, ' SAN JOSE DE BARLOVENTO ', 'A', 'I'),
(608, 2, ' CUMBO ', 'A', 'I'),
(609, 337, ' BARUTA ', 'A', 'I'),
(610, 337, ' EL CAFETAL ', 'A', 'I'),
(611, 3, ' LAS MINAS DE BARUTA ', 'A', 'I'),
(612, 4, ' HIGUEROTE ', 'A', 'I'),
(613, 4, ' CURIEPE ', 'A', 'I'),
(614, 4, ' TACARIGUA ', 'A', 'I'),
(615, 5, ' MAMPORAL ', 'A', 'I'),
(616, 182, ' CARRIZAL ', 'A', 'I'),
(617, 183, ' CHACAO ', 'A', 'I'),
(618, 184, ' CHARALLAVE ', 'A', 'I'),
(619, 8, ' LAS BRISAS ', 'A', 'I'),
(620, 9, ' EL HATILLO ', 'A', 'I'),
(621, 10, ' LOS TEQUES ', 'A', 'I'),
(622, 7, ' ALTAGRACIA DE LA MONTA&#209', 'A', 'I'),
(623, 186, ' CECILIO ACOSTA ', 'A', 'I'),
(624, 10, ' EL JARILLO ', 'A', 'I'),
(625, 10, ' PARACOTOS ', 'A', 'I'),
(626, 10, ' SAN PEDRO ', 'A', 'I'),
(627, 10, ' TACATA ', 'A', 'I'),
(628, 11, ' SANTA TERESA DEL TUY ', 'A', 'I'),
(629, 11, ' EL CARTANAL ', 'A', 'I'),
(630, 12, ' OCUMARE DEL TUY ', 'A', 'I'),
(631, 12, ' LA DEMOCRACIA ', 'A', 'I'),
(632, 12, ' SANTA BARBARA ', 'A', 'I'),
(633, 13, ' SAN ANTONIO DE LOS ALTOS ', 'A', 'I'),
(634, 14, ' RIO CHICO ', 'A', 'I'),
(635, 14, ' EL GUAPO ', 'A', 'I'),
(636, 14, ' TACARIGUA DE LA LAGUNA ', 'A', 'I'),
(637, 14, ' PAPARO ', 'A', 'I'),
(638, 14, ' SAN FERNANDO DEL GUAPO ', 'A', 'I'),
(639, 15, ' SANTA LUCIA ', 'A', 'I'),
(640, 16, ' CUPIRA ', 'A', 'I'),
(641, 16, ' MACHURUCUTO ', 'A', 'I'),
(642, 17, ' GUARENAS ', 'A', 'I'),
(643, 18, ' SAN FRANCISCO DE YARE ', 'A', 'I'),
(644, 18, ' SAN ANTONIO DE YARE ', 'A', 'I'),
(645, 19, ' PETARE ', 'A', 'I'),
(646, 19, ' CAUCAGUITA ', 'A', 'I'),
(647, 19, ' FILA DE MARICHES ', 'A', 'I'),
(648, 19, ' LA DOLORITA ', 'A', 'I'),
(649, 19, ' LEONCIO MARTINEZ ', 'A', 'I'),
(650, 20, ' CUA ', 'A', 'I'),
(651, 20, ' NUEVA CUA ', 'A', 'I'),
(652, 21, ' GUATIRE ', 'A', 'I'),
(653, 21, ' BOLIVAR ', 'A', 'I'),
(654, 1, ' CAPITAL ACOSTA ', 'A', 'I'),
(655, 1, ' SAN FRANCISCO ', 'A', 'I'),
(656, 2, ' CAPITAL AGUASAY ', 'A', 'I'),
(657, 3, ' CAPITAL BOLIVAR ', 'A', 'I'),
(658, 4, ' CAPITAL CARIPE ', 'A', 'I'),
(659, 4, ' EL GUACHARO ', 'A', 'I'),
(660, 4, ' LA GUANOTA ', 'A', 'I'),
(661, 4, ' SABANA DE PIEDRA ', 'A', 'I'),
(662, 4, ' SAN AGUSTIN ', 'A', 'I'),
(663, 4, ' TERESEN ', 'A', 'I'),
(664, 16, ' CAPITAL CEDE&#209', 'A', 'I'),
(665, 5, ' AREO ', 'A', 'I'),
(666, 5, ' SAN FELIX ', 'A', 'I'),
(667, 5, ' VIENTO FRESCO ', 'A', 'I'),
(668, 6, ' CAPITAL EZEQUIEL ZAMORA ', 'A', 'I'),
(669, 6, ' EL TEJERO ', 'A', 'I'),
(670, 7, ' CAPITAL LIBERTADOR ', 'A', 'I'),
(671, 7, ' CHAGUARAMAS ', 'A', 'I'),
(672, 7, ' LA PETROLEA ', 'A', 'I'),
(673, 7, ' TABASCA ', 'A', 'I'),
(674, 8, ' CAPITAL MATURIN ', 'A', 'I'),
(675, 8, ' ALTO DE LOS GODOS ', 'A', 'I'),
(676, 8, ' BOQUERON ', 'A', 'I'),
(677, 8, ' LAS COCUIZAS ', 'A', 'I'),
(678, 8, ' SAN SIMON ', 'A', 'I'),
(679, 8, ' SANTA CRUZ ', 'A', 'I'),
(680, 8, ' EL COROZO ', 'A', 'I'),
(681, 8, ' EL FURRIAL ', 'A', 'I'),
(682, 8, ' JUSEPIN ', 'A', 'I'),
(683, 8, ' LA PICA ', 'A', 'I'),
(684, 8, ' SAN VICENTE ', 'A', 'I'),
(685, 9, ' CAPITAL PIAR ', 'A', 'I'),
(686, 9, ' APARICIO ', 'A', 'I'),
(687, 9, ' CHAGUARAMAL ', 'A', 'I'),
(688, 9, ' EL PINTO ', 'A', 'I'),
(689, 9, ' GUANAGUANA ', 'A', 'I'),
(690, 9, ' LA TOSCANA ', 'A', 'I'),
(691, 9, ' TAGUAYA ', 'A', 'I'),
(692, 10, ' CAPITAL PUNCERES ', 'A', 'I'),
(693, 10, ' CACHIPO ', 'A', 'I'),
(694, 11, ' CAPITAL SANTA BARBARA ', 'A', 'I'),
(695, 12, ' CAPITAL SOTILLO ', 'A', 'I'),
(696, 12, ' LOS BARRANCOS DE FAJARDO ', 'A', 'I'),
(697, 13, ' CAPITAL URACOA ', 'A', 'I'),
(698, 1, ' CAPITAL ANTOLIN DEL CAMPO ', 'A', 'I'),
(699, 2, ' CAPITAL ARISMENDI ', 'A', 'I'),
(700, 3, ' CAPITAL DIAZ ', 'A', 'I'),
(701, 3, ' ZABALA ', 'A', 'I'),
(702, 4, ' CAPITAL GARCIA ', 'A', 'I'),
(703, 4, ' FRANCISCO FAJARDO ', 'A', 'I'),
(704, 5, ' CAPITAL GOMEZ ', 'A', 'I'),
(705, 5, ' BOLIVAR ', 'A', 'I'),
(706, 5, ' GUEVARA ', 'A', 'I'),
(707, 5, ' MATASIETE ', 'A', 'I'),
(708, 5, ' SUCRE ', 'A', 'I'),
(709, 6, ' CAPITAL MANEIRO ', 'A', 'I'),
(710, 6, ' AGUIRRE ', 'A', 'I'),
(711, 7, ' CAPITAL MARCANO ', 'A', 'I'),
(712, 7, ' ADRIAN ', 'A', 'I'),
(713, 17, ' CAPITAL MARI&#209', 'A', 'I'),
(714, 9, ' CAPITAL PENINSULA DE MACANAO ', 'A', 'I'),
(715, 9, ' SAN FRANCISCO ', 'A', 'I'),
(716, 10, ' CAPITAL TUBORES ', 'A', 'I'),
(717, 10, ' LOS BARALES ', 'A', 'I'),
(718, 11, ' CAPITAL VILLALBA ', 'A', 'I'),
(719, 11, ' VICENTE FUENTES ', 'A', 'I'),
(720, 1, ' CAPITAL AGUA BLANCA ', 'A', 'I'),
(721, 2, ' CAPITAL ARAURE ', 'A', 'I'),
(722, 2, ' RIO ACARIGUA ', 'A', 'I'),
(723, 3, ' CAPITAL ESTELLER ', 'A', 'I'),
(724, 3, ' UVERAL ', 'A', 'I'),
(725, 4, ' CAPITAL GUANARE ', 'A', 'I'),
(726, 4, ' CORDOBA ', 'A', 'I'),
(727, 18, ' SAN JOSE DE LA MONTA&#209', 'A', 'I'),
(728, 4, ' SAN JUAN DE GUANAGUANARE ', 'A', 'I'),
(729, 4, ' VIRGEN DE LA COROMOTO ', 'A', 'I'),
(730, 5, ' CAPITAL GUANARITO ', 'A', 'I'),
(731, 5, ' TRINIDAD DE LA CAPILLA ', 'A', 'I'),
(732, 5, ' DIVINA PASTORA ', 'A', 'I'),
(733, 6, ' CAPITAL MONS. JOSE V. DE UNDA ', 'A', 'I'),
(734, 18, ' PE&#209', 'A', 'I'),
(735, 7, ' CAPITAL OSPINO ', 'A', 'I'),
(736, 7, ' APARICION ', 'A', 'I'),
(737, 7, ' LA ESTACION ', 'A', 'I'),
(738, 8, ' CAPITAL PAEZ ', 'A', 'I'),
(739, 8, ' PAYARA ', 'A', 'I'),
(740, 8, ' PIMPINELA ', 'A', 'I'),
(741, 8, ' RAMON PERAZA ', 'A', 'I'),
(742, 9, ' CAPITAL PAPELON ', 'A', 'I'),
(743, 18, ' CA&#209', 'A', 'I'),
(744, 10, ' CAPITAL S GENARO DE BOCONOITO ', 'A', 'I'),
(745, 10, ' ANTOLIN TOVAR ', 'A', 'I'),
(746, 11, ' CAPITAL SAN RAFAEL DE ONOTO ', 'A', 'I'),
(747, 11, ' SANTA FE ', 'A', 'I'),
(748, 11, ' THERMO MORLES ', 'A', 'I'),
(749, 12, ' CAPITAL SANTA ROSALIA ', 'A', 'I'),
(750, 12, ' FLORIDA ', 'A', 'I'),
(751, 13, ' CAPITAL S GERONIM. DE GUAYABAL ', 'A', 'I'),
(752, 13, ' CONCEPCION ', 'A', 'I'),
(753, 13, ' SAN RAFAEL DE PALO ALZADO ', 'A', 'I'),
(754, 13, ' UVENCIO ANTONIO VELASQUEZ ', 'A', 'I'),
(755, 13, ' SAN JOSE DE SAGUAZ ', 'A', 'I'),
(756, 13, ' VILLA ROSA ', 'A', 'I'),
(757, 14, ' CAPITAL TURUN ', 'A', 'I'),
(758, 14, ' CUPIRA ', 'A', 'I'),
(759, 14, ' SANTA CRUZ ', 'A', 'I'),
(760, 14, ' SAN ISIDRO LABRADOR ', 'A', 'I'),
(761, 1, ' MAIQUETIA ', 'A', 'I'),
(762, 1, ' ROMULO GALLEGOS ', 'A', 'I'),
(763, 2, ' SAN JOSE DE AEROCUAR ', 'A', 'I'),
(764, 2, ' TAVERA ACOSTA ', 'A', 'I'),
(765, 3, ' RIO CARIBE ', 'A', 'I'),
(766, 3, ' ANTONIO JOSE DE SUCRE ', 'A', 'I'),
(767, 3, ' EL MORRO DE PUERTO SANTO ', 'A', 'I'),
(768, 3, ' PUERTO SANTO ', 'A', 'I'),
(769, 3, ' SAN JUAN DE LAS GALDONAS ', 'A', 'I'),
(770, 4, ' EL PILAR ', 'A', 'I'),
(771, 4, ' EL RINCON ', 'A', 'I'),
(772, 4, ' GENERAL FRANCISCO A. VASQUEZ ', 'A', 'I'),
(773, 4, ' GUARAUNOS ', 'A', 'I'),
(774, 4, ' TUNAPUICITO ', 'A', 'I'),
(775, 4, ' UNION ', 'A', 'I'),
(776, 5, ' BOLIVAR ', 'A', 'I'),
(777, 5, ' MACARAPANA ', 'A', 'I'),
(778, 5, ' SANTA CATALINA ', 'A', 'I'),
(779, 5, ' SANTA ROSA ', 'A', 'I'),
(780, 5, ' SANTA TERESA ', 'A', 'I'),
(781, 6, ' CAPITAL BOLIVAR ', 'A', 'I'),
(782, 7, ' YAGUARAPARO ', 'A', 'I'),
(783, 7, ' EL PAUJIL ', 'A', 'I'),
(784, 7, ' LIBERTAD ', 'A', 'I'),
(785, 8, ' ARAYA ', 'A', 'I'),
(786, 8, ' CHACOPATA ', 'A', 'I'),
(787, 8, ' MANICUARE ', 'A', 'I'),
(788, 9, ' TUNAPUY ', 'A', 'I'),
(789, 9, ' CAMPO ELIAS ', 'A', 'I'),
(790, 10, ' IRAPA ', 'A', 'I'),
(791, 10, ' CAMPO CLARO ', 'A', 'I'),
(792, 10, ' MARABAL ', 'A', 'I'),
(793, 10, ' RIO CARIBE ', 'A', 'I'),
(794, 10, ' SORO ', 'A', 'I'),
(795, 11, ' CAPITAL MEJIA ', 'A', 'I'),
(796, 12, ' CUMANACOA ', 'A', 'I'),
(797, 12, ' ARENAS ', 'A', 'I'),
(798, 12, ' ARICAGUA ', 'A', 'I'),
(799, 12, ' COCOLLAR ', 'A', 'I'),
(800, 12, ' SAN FERNANDO ', 'A', 'I'),
(801, 12, ' SAN LORENZO ', 'A', 'I'),
(802, 13, ' VILLA FRONTADO (M. DE CARIACO) ', 'A', 'I'),
(803, 13, ' CARACCIOLO PARRA PUREZ ', 'A', 'I'),
(804, 13, ' RENDON ', 'A', 'I'),
(805, 13, ' SAN SEBASTIAN ', 'A', 'I'),
(806, 13, ' SANTA BARBARA ', 'A', 'I'),
(807, 14, ' ALTAGRACIA ', 'A', 'I'),
(808, 14, ' AYACUCHO ', 'A', 'I'),
(809, 14, ' SANTA INES ', 'A', 'I'),
(810, 14, ' VALENTIN VALIENTE ', 'A', 'I'),
(811, 14, ' SAN JUAN ', 'A', 'I'),
(812, 14, ' RAUL LEONI ', 'A', 'I'),
(813, 14, ' SANTA FE ', 'A', 'I'),
(814, 15, ' GUIRIA ', 'A', 'I'),
(815, 15, ' BIDEAU ', 'A', 'I'),
(816, 15, ' CRISTOBAL COLON ', 'A', 'I'),
(817, 15, ' PUNTA DE PIEDRAS ', 'A', 'I'),
(818, 1, ' CAPITAL ANDRES BELLO ', 'A', 'I'),
(819, 2, ' CAMPO ELIAS ', 'A', 'I'),
(820, 3, ' AYACUCHO ', 'A', 'I'),
(821, 3, ' RIVAS BERTI ', 'A', 'I'),
(822, 3, ' SAN PEDRO DEL RIO ', 'A', 'I'),
(823, 4, ' BOLIVAR ', 'A', 'I'),
(824, 4, ' PALOTAL ', 'A', 'I'),
(825, 4, ' JUAN VICENTE GOMEZ ', 'A', 'I'),
(826, 4, ' ISAIAS MEDINA ANGARITA ', 'A', 'I'),
(827, 5, ' CARDENAS ', 'A', 'I'),
(828, 5, ' AMENODORO RANGEL LAMUS ', 'A', 'I'),
(829, 5, ' LA FLORIDA ', 'A', 'I'),
(830, 6, ' CAPITAL CORDOBA ', 'A', 'I'),
(831, 7, ' FERNANDEZ FEO ', 'A', 'I'),
(832, 7, ' ALBERTO ADRIANI ', 'A', 'I'),
(833, 7, ' SANTO DOMINGO ', 'A', 'I'),
(834, 8, ' CAPITAL BOLIVAR ', 'A', 'I'),
(835, 9, ' CAPITAL GARCIA DE HEVIA ', 'A', 'I'),
(836, 9, ' BOCA DE GRITA ', 'A', 'I'),
(837, 9, ' JOSE ANTONIO PAEZ ', 'A', 'I'),
(838, 10, ' CAPITAL GUASIMOS ', 'A', 'I'),
(839, 11, ' INDEPENDENCIA ', 'A', 'I'),
(840, 11, ' JUAN GERMAN ROSCIO ', 'A', 'I'),
(841, 11, ' ROMAN CARDENAS ', 'A', 'I'),
(842, 12, ' JAUREGUI ', 'A', 'I'),
(843, 12, ' EMILIO CONSTANTINO GUERRERO ', 'A', 'I'),
(844, 20, ' MONSE&#209', 'A', 'I'),
(845, 13, ' CAPITAL JOSE MARIA VARGAS ', 'A', 'I'),
(846, 14, ' JUNIN ', 'A', 'I'),
(847, 14, ' LA PETROLEA ', 'A', 'I'),
(848, 14, ' QUINIMARI ', 'A', 'I'),
(849, 14, ' BRAMON ', 'A', 'I'),
(850, 15, ' LIBERTAD ', 'A', 'I'),
(851, 15, ' CIPRIANO CASTRO ', 'A', 'I'),
(852, 15, ' MANUEL FELIPE RUGELES ', 'A', 'I'),
(853, 16, ' LIBERTADOR ', 'A', 'I'),
(854, 16, ' EMETERIO OCHOA ', 'A', 'I'),
(855, 16, ' DORADAS ', 'A', 'I'),
(856, 16, ' SAN JOAQUIN DE NAVAY ', 'A', 'I'),
(857, 17, ' LOBATERA ', 'A', 'I'),
(858, 17, ' CONSTITUCION ', 'A', 'I'),
(859, 18, ' CAPITAL MICHELENA ', 'A', 'I'),
(860, 19, ' PANAMERICANO ', 'A', 'I'),
(861, 19, ' LA PALMITA ', 'A', 'I'),
(862, 20, ' PEDRO MARIA URE&#209', 'A', 'I'),
(863, 20, ' NUEVA ARCADIA ', 'A', 'I'),
(864, 21, ' CAPITAL RAFAEL URDANETA ', 'A', 'I'),
(865, 22, ' SAMUEL DARIO MALDONADO ', 'A', 'I'),
(866, 22, ' BOCONO ', 'A', 'I'),
(867, 22, ' HERNANDEZ ', 'A', 'I'),
(868, 23, ' LA CONCORDIA ', 'A', 'I'),
(869, 23, ' PEDRO MARIA MORANTES ', 'A', 'I'),
(870, 23, ' SAN JUAN BAUTISTA ', 'A', 'I'),
(871, 23, ' SAN SEBASTIAN ', 'A', 'I'),
(872, 23, ' CARDENAS ', 'A', 'I'),
(873, 24, ' CAPITAL SEBORUCO ', 'A', 'I'),
(874, 25, ' CAPITAL SIMON RODRIGUEZ ', 'A', 'I'),
(875, 26, ' SUCRE ', 'A', 'I'),
(876, 26, ' ELEAZAR LOPEZ CONTRERAS ', 'A', 'I'),
(877, 26, ' SAN PABLO ', 'A', 'I'),
(878, 27, ' CAPITAL TORBES ', 'A', 'I'),
(879, 28, ' CAPITAL URIBANTE ', 'A', 'I'),
(880, 28, ' CARDENAS ', 'A', 'I'),
(881, 28, ' JOSE VIDAL MARCANO ', 'A', 'I'),
(882, 28, ' POTOSI ', 'A', 'I'),
(883, 29, ' CAPITAL SAN JUDAS TADEO ', 'A', 'I'),
(884, 1, ' SANTA ISABEL ', 'A', 'I'),
(885, 1, ' ARAGUANEY ', 'A', 'I'),
(886, 1, ' EL JAGUITO ', 'A', 'I'),
(887, 1, ' JUAN MILLAN ', 'A', 'I'),
(888, 281, ' BOCONO ', 'A', 'I'),
(889, 2, ' EL CARMEN ', 'A', 'I'),
(890, 2, ' MESA BOLIVAR ', 'A', 'I'),
(891, 2, ' AYACUCHO ', 'A', 'I'),
(892, 2, ' BURBUSAY ', 'A', 'I'),
(893, 2, ' GENERAL RIVAS ', 'A', 'I'),
(894, 2, ' GUARAMACAL ', 'A', 'I'),
(895, 2, ' VEGA DE GUARAMACAL ', 'A', 'I'),
(896, 21, ' MONSE&#209', 'A', 'I'),
(897, 2, ' RAFAEL RANGEL ', 'A', 'I'),
(898, 2, ' SAN MIGUEL ', 'A', 'I'),
(899, 2, ' SAN JOSE ', 'A', 'I'),
(900, 3, ' SABANA GRANDE ', 'A', 'I'),
(901, 3, ' CHEREGUE ', 'A', 'I'),
(902, 3, ' GRANADOS ', 'A', 'I'),
(903, 21, ' CASTA&#209', 'A', 'I'),
(904, 4, ' ARNOLDO GABALDON ', 'A', 'I'),
(905, 4, ' BOLIVIA ', 'A', 'I'),
(906, 4, ' CARRILLO ', 'A', 'I'),
(907, 4, ' CEGARRA ', 'A', 'I'),
(908, 4, ' MANUEL SALVADOR ULLOA ', 'A', 'I'),
(909, 4, ' SAN JOSE ', 'A', 'I'),
(910, 5, ' CARACHE ', 'A', 'I'),
(911, 5, ' CUICAS ', 'A', 'I'),
(912, 5, ' LA CONCEPCION ', 'A', 'I'),
(913, 5, ' PANAMERICANA ', 'A', 'I'),
(914, 5, ' SANTA CRUZ ', 'A', 'I'),
(915, 6, ' ESCUQUE ', 'A', 'I'),
(916, 6, ' LA UNION ', 'A', 'I'),
(917, 6, ' SABANA LIBRE ', 'A', 'I'),
(918, 6, ' SANTA RITA ', 'A', 'I'),
(919, 7, ' EL SOCORRO ', 'A', 'I'),
(920, 7, ' ANTONIO JOSE DE SUCRE ', 'A', 'I'),
(921, 7, ' LOS CAPRICHOS ', 'A', 'I'),
(922, 8, ' CAMPO ELIAS ', 'A', 'I'),
(923, 8, ' ARNOLDO GABALDON ', 'A', 'I'),
(924, 9, ' SANTA APOLONIA ', 'A', 'I'),
(925, 9, ' EL JAGUITO ', 'A', 'I'),
(926, 9, ' LA CEIBA ', 'A', 'I'),
(927, 9, ' TRES DE FEBRERO ', 'A', 'I'),
(928, 10, ' EL DIVIDIVE ', 'A', 'I'),
(929, 10, ' AGUA SANTA ', 'A', 'I'),
(930, 10, ' AGUA CALIENTE ', 'A', 'I'),
(931, 10, ' EL CENIZO ', 'A', 'I'),
(932, 10, ' VALERITA ', 'A', 'I'),
(933, 11, ' MONTE CARMELO ', 'A', 'I'),
(934, 11, ' BUENA VISTA ', 'A', 'I'),
(935, 11, ' SANTA MARIA DEL HORCON ', 'A', 'I'),
(936, 12, ' MOTATAN ', 'A', 'I'),
(937, 21, ' EL BA&#209', 'A', 'I'),
(938, 12, ' JALISCO ', 'A', 'I'),
(939, 13, ' PAMPAN ', 'A', 'I'),
(940, 13, ' FLOR DE PATRIA ', 'A', 'I'),
(941, 13, ' LA PAZ ', 'A', 'I'),
(942, 13, ' SANTA ANA ', 'A', 'I'),
(943, 14, ' PAMPANITO ', 'A', 'I'),
(944, 14, ' LA CONCEPCION ', 'A', 'I'),
(945, 14, ' PAMPANITO II ', 'A', 'I'),
(946, 15, ' BETIJOQUE ', 'A', 'I'),
(947, 15, ' LA CONCEPCION ', 'A', 'I'),
(948, 15, ' LOS CEDROS ', 'A', 'I'),
(949, 15, ' JOSE GREGORIO HERNANDEZ ', 'A', 'I'),
(950, 16, ' CARVAJAL ', 'A', 'I'),
(951, 21, ' ANTONIO NICOLAS BRICE&#209', 'A', 'I'),
(952, 16, ' CAMPO ALEGRE ', 'A', 'I'),
(953, 16, ' JOSE LEONARDO SUAREZ ', 'A', 'I'),
(954, 17, ' SABANA DE MENDOZA ', 'A', 'I'),
(955, 17, ' EL PARAISO ', 'A', 'I'),
(956, 17, ' JUNIN ', 'A', 'I'),
(957, 17, ' VALMORE RODRIGUEZ ', 'A', 'I'),
(958, 18, ' ANDRES LINARES ', 'A', 'I'),
(959, 18, ' CHIQUINQUIRA ', 'A', 'I'),
(960, 18, ' CRISTOBAL MENDOZA ', 'A', 'I'),
(961, 18, ' CRUZ CARRILLO ', 'A', 'I'),
(962, 18, ' MATRIZ ', 'A', 'I'),
(963, 21, ' MONSE&#209', 'A', 'I'),
(964, 18, ' TRES ESQUINAS ', 'A', 'I'),
(965, 19, ' LA QUEBRADA ', 'A', 'I'),
(966, 19, ' CABIMBU ', 'A', 'I'),
(967, 19, ' JAJO ', 'A', 'I'),
(968, 19, ' LA MESA ', 'A', 'I'),
(969, 19, ' SANTIAGO ', 'A', 'I'),
(970, 21, ' TU&#209', 'A', 'I'),
(971, 20, ' JUAN IGNACIO MONTILLA ', 'A', 'I'),
(972, 20, ' LA BEATRIZ ', 'A', 'I'),
(973, 20, ' MERCEDES DIAZ ', 'A', 'I'),
(974, 20, ' SAN LUIS ', 'A', 'I'),
(975, 20, ' LA PUERTA ', 'A', 'I'),
(976, 20, ' MENDOZA ', 'A', 'I'),
(977, 1, ' CAPITAL ARISTIDES BASTIDAS ', 'A', 'I'),
(978, 2, ' CAPITAL BOLIVAR ', 'A', 'I'),
(979, 3, ' CAPITAL BRUZUAL ', 'A', 'I'),
(980, 3, ' CAMPO ELIAS ', 'A', 'I'),
(981, 4, ' CAPITAL COCOROTE ', 'A', 'I'),
(982, 5, ' CAPITAL INDEPENDENCIA ', 'A', 'I'),
(983, 6, ' CAPITAL JOSE ANTONIO PAEZ ', 'A', 'I'),
(984, 7, ' CAPITAL LA TRINIDAD ', 'A', 'I'),
(985, 8, ' CAPITAL MANUEL MONGE ', 'A', 'I'),
(986, 9, ' CAPITAL NIRGUA ', 'A', 'I'),
(987, 9, ' SALOM ', 'A', 'I'),
(988, 9, ' TEMERLA ', 'A', 'I'),
(989, 22, ' CAPITAL PE&#209', 'A', 'I'),
(990, 10, ' SAN ANDRES ', 'A', 'I'),
(991, 11, ' CAPITAL SAN FELIPE ', 'A', 'I'),
(992, 11, ' ALBARICO ', 'A', 'I'),
(993, 11, ' SAN JAVIER ', 'A', 'I'),
(994, 12, ' CAPITAL SUCRE ', 'A', 'I'),
(995, 13, ' CAPITAL URACHICHE ', 'A', 'I'),
(996, 14, ' CAPITAL VEROES ', 'A', 'I'),
(997, 14, ' EL GUAYABO ', 'A', 'I'),
(998, 1, ' ISLA DE TOAS ', 'A', 'I'),
(999, 1, ' MONAGAS ', 'A', 'I'),
(1000, 2, ' SAN TIMOTEO ', 'A', 'I'),
(1001, 2, ' GENERAL URDANETA ', 'A', 'I'),
(1002, 2, ' LIBERTADOR ', 'A', 'I'),
(1003, 2, ' MANUEL GUANIPA MATOS ', 'A', 'I'),
(1004, 23, ' MARCELINO BRICE&#209', 'A', 'I'),
(1005, 2, ' PUEBLO NUEVO ', 'A', 'I'),
(1006, 3, ' AMBROSIO ', 'A', 'I'),
(1007, 3, ' CARMEN HERRERA ', 'A', 'I'),
(1008, 3, ' GERMAN RIOS LINARES ', 'A', 'I'),
(1009, 3, ' LA ROSA ', 'A', 'I'),
(1010, 3, ' JORGE HERNANDEZ ', 'A', 'I'),
(1011, 3, ' ROMULO BETANCOURT ', 'A', 'I'),
(1012, 3, ' SAN BENITO ', 'A', 'I'),
(1013, 3, ' ARISTIDES CALVANI ', 'A', 'I'),
(1014, 3, ' PUNTA GORDA ', 'A', 'I'),
(1015, 4, ' ENCONTRADOS ', 'A', 'I'),
(1016, 4, ' UDON PEREZ ', 'A', 'I'),
(1017, 5, ' SAN CARLOS DEL ZULIA ', 'A', 'I'),
(1018, 5, ' MORALITO ', 'A', 'I'),
(1019, 5, ' SANTA BARBARA ', 'A', 'I'),
(1020, 5, ' SANTA CRUZ DEL ZULIA ', 'A', 'I'),
(1021, 5, ' URRIBARRI ', 'A', 'I'),
(1022, 6, ' SIMON RODRIGUEZ ', 'A', 'I'),
(1023, 6, ' CARLOS QUEVEDO ', 'A', 'I'),
(1024, 6, ' FRANCISCO JAVIER PULGAR ', 'A', 'I'),
(1025, 7, ' LA CONCEPCION ', 'A', 'I'),
(1026, 7, ' JOSE RAMON YEPES ', 'A', 'I'),
(1027, 7, ' MARIANO PARRA LEON ', 'A', 'I'),
(1028, 7, ' SAN JOSE ', 'A', 'I'),
(1029, 8, ' JESUS MARIA SEMPRUN ', 'A', 'I'),
(1030, 8, ' BARI ', 'A', 'I'),
(1031, 9, ' CONCEPCION ', 'A', 'I'),
(1032, 9, ' ANDRES BELLO ', 'A', 'I'),
(1033, 9, ' CHIQUINQUIRA ', 'A', 'I'),
(1034, 9, ' EL CARMELO ', 'A', 'I'),
(1035, 9, ' POTRERITOS ', 'A', 'I'),
(1036, 10, ' ALONSO DE OJEDA ', 'A', 'I'),
(1037, 10, ' LIBERTAD ', 'A', 'I'),
(1038, 10, ' CAMPO LARA ', 'A', 'I'),
(1039, 10, ' ELEAZAR LOPEZ CONTRERAS ', 'A', 'I'),
(1040, 10, ' URBANA SAN JOAQUIN ', 'A', 'I'),
(1041, 11, ' LIBERTAD ', 'A', 'I'),
(1042, 11, ' BARTOLOME DE LAS CASAS ', 'A', 'I'),
(1043, 11, ' RIO NEGRO ', 'A', 'I'),
(1044, 11, ' SAN JOSE DE PERIJA ', 'A', 'I'),
(1045, 12, ' SAN RAFAEL ', 'A', 'I'),
(1046, 12, ' LA SIERRITA ', 'A', 'I'),
(1047, 12, ' LAS PARCELAS ', 'A', 'I'),
(1048, 12, ' LUIS DE VICENTE ', 'A', 'I'),
(1049, 23, ' MONSE&#209', 'A', 'I'),
(1050, 12, ' RICAURTE ', 'A', 'I'),
(1051, 12, ' TAMARE ', 'A', 'I'),
(1052, 13, ' ANTONIO BORJAS ROMERO ', 'A', 'I'),
(1053, 13, ' BOLIVAR ', 'A', 'I'),
(1054, 13, ' CACIQUE MARA ', 'A', 'I'),
(1055, 13, ' CARACCIOLO PARRA PEREZ ', 'A', 'I'),
(1056, 13, ' CECILIO ACOSTA ', 'A', 'I'),
(1057, 13, ' CRISTO DE ARANZA ', 'A', 'I'),
(1058, 13, ' COQUIVACOA ', 'A', 'I'),
(1059, 13, ' CHIQUINQUIRA ', 'A', 'I'),
(1060, 13, ' FRANCISCO EUGENIO BUSTAMANTE ', 'A', 'I'),
(1061, 13, ' IDELFONSO VASQUEZ ', 'A', 'I'),
(1062, 13, ' JUANA DE AVILA ', 'A', 'I'),
(1063, 13, ' LUIS HURTADO HIGUERA ', 'A', 'I'),
(1064, 13, ' MANUEL DAGNINO ', 'A', 'I'),
(1065, 13, ' OLEGARIO VILLALOBOS ', 'A', 'I'),
(1066, 13, ' RAUL LEONI ', 'A', 'I'),
(1067, 13, ' SANTA LUCIA ', 'A', 'I'),
(1068, 13, ' VENANCIO PULGAR ', 'A', 'I'),
(1069, 13, ' SAN ISIDRO ', 'A', 'I'),
(1070, 14, ' ALTAGRACIA ', 'A', 'I'),
(1071, 14, ' ANA MARIA CAMPOS ', 'A', 'I'),
(1072, 14, ' FARIA ', 'A', 'I'),
(1073, 14, ' SAN ANTONIO ', 'A', 'I'),
(1074, 14, ' SAN JOSE ', 'A', 'I'),
(1075, 15, ' SINAMAICA ', 'A', 'I'),
(1076, 15, ' ALTA GUAJIRA ', 'A', 'I'),
(1077, 15, ' ELIAS SANCHEZ RUBIO ', 'A', 'I'),
(1078, 15, ' GUAJIRA ', 'A', 'I'),
(1079, 16, ' EL ROSARIO ', 'A', 'I'),
(1080, 16, ' DONALDO GARCIA ', 'A', 'I'),
(1081, 16, ' SIXTO ZAMBRANO ', 'A', 'I'),
(1082, 17, ' SAN FRANCISCO ', 'A', 'I'),
(1083, 17, ' EL BAJO ', 'A', 'I'),
(1084, 17, ' DOMITILA FLORES ', 'A', 'I'),
(1085, 17, ' ELIAS SANCHEZ RUBIO ', 'A', 'I'),
(1086, 17, ' LOS CORTIJOS ', 'A', 'I'),
(1087, 17, ' MARCIAL HERNANDEZ ', 'A', 'I'),
(1088, 18, ' SANTA RITA ', 'A', 'I'),
(1089, 18, ' EL MENE ', 'A', 'I'),
(1090, 18, ' JOSE CENOVIO URRIBARRI ', 'A', 'I'),
(1091, 18, ' PEDRO LUCAS URRIBARRI ', 'A', 'I'),
(1092, 19, ' MANUEL MANRIQUE ', 'A', 'I'),
(1093, 19, ' RAFAEL MARIA BARALT ', 'A', 'I'),
(1094, 19, ' RAFAEL URDANETA ', 'A', 'I'),
(1095, 20, ' BOBURES ', 'A', 'I'),
(1096, 20, ' EL BATEY ', 'A', 'I'),
(1097, 20, ' GIBRALTAR ', 'A', 'I'),
(1098, 20, ' HERAS ', 'A', 'I'),
(1099, 20, ' MONS. ARTURO CELESTINO A ', 'A', 'I'),
(1100, 20, ' ROMULO GALLEGOS ', 'A', 'I'),
(1101, 21, ' LA VICTORIA ', 'A', 'I'),
(1102, 21, ' RAFAEL URDANETA ', 'A', 'I'),
(1103, 21, ' RAUL CUENCA ', 'A', 'I'),
(1104, 335, ' CARABALLEDA ', 'A', 'I'),
(1105, 1, ' CARAYACA ', 'A', 'I'),
(1106, 335, ' CARUAO ', 'A', 'I'),
(1107, 335, ' CATIA LA MAR ', 'A', 'I'),
(1108, 335, ' EL JUNKO ', 'A', 'I'),
(1109, 1, ' LA GUAIRA ', 'A', 'I'),
(1110, 1, ' MACUTO ', 'A', 'I'),
(1111, 1, ' MAIQUETIA ', 'A', 'I'),
(1112, 1, ' NAIGUATA ', 'A', 'I'),
(1113, 1, ' RAUL LEONI ', 'A', 'I'),
(1114, 1, ' CARLOS SOUBLETTE ', 'A', 'I'),
(1115, 1, ' GRAN ROQUE ', 'A', 'I'),
(1116, 1, ' TESTIGOS, LOS ', 'A', 'I'),
(1117, 1, ' CHIMANAS ', 'A', 'I'),
(1118, 3, ' FERNANDO GIRON TOVAR ', 'A', 'I'),
(1119, 229, 'PAEZ', 'A', 'I');

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
  PRIMARY KEY (`idpensum`),
  KEY `FK_codesp_idx` (`codesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pensum_pre`
--

INSERT INTO `pensum_pre` (`idpensum`, `codesp`, `nombre`, `fecha_pensum`, `estatus`, `borrado`) VALUES
('2', '10', '2010', '0000-00-00', 'A', 'I'),
('3', '14', '2010', '0000-00-00', 'A', 'I'),
('4', '19', '2010', '0000-00-00', 'A', 'I'),
('5', '21', '2010', '0000-00-00', 'A', 'I'),
('6', '3', '2010', '0000-00-00', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peraca`
--

CREATE TABLE IF NOT EXISTS `peraca` (
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`peraca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `peraca`
--

INSERT INTO `peraca` (`peraca`, `fecha_ini`, `fecha_fin`, `nombre`, `estatus`, `borrado`) VALUES
('2', '2012-09-01', '2012-12-10', '2012-III', 'A', 'I'),
('3', '2013-01-01', '2013-07-31', '2013-2', 'I', 'I'),
('4', '2013-03-04', '2013-07-04', '2013-2', 'I', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `idcargo` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `estado` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `parroquia` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `administrativos` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `docentes` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `pensum` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `asignatura` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `lapso_aca` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `proceso` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `regimen` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_eva` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `aspecto_eva` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `valoracion` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `inscripcion_mat` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `planificacion_sec` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `inscripcion_inu` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `inscripcion_not` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `evaluacion_rep` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `seleccion_rep` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `evaluacion_coor` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `constancia_est` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `constancia_ser_com` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `planilla_ins` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `planilla_notas` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `desempeno_tipo_eva` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `desempeno_gra_act` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `promedio_item` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `evaluacion_gen_doc` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cargo` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `asigcargo` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cont_serv` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `rep_des_tip_eva` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `rep_des_car` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `recep_pla` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `list_est_sec` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `list_carrera` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `list_asig` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `list_doc` char(10) COLLATE utf8_spanish_ci NOT NULL,
  KEY `FK_cargo_idx` (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idcargo`, `estado`, `municipio`, `parroquia`, `ciudad`, `administrativos`, `docentes`, `carrera`, `pensum`, `semestre`, `asignatura`, `seccion`, `lapso_aca`, `estudiante`, `proceso`, `regimen`, `tipo_eva`, `aspecto_eva`, `valoracion`, `inscripcion_mat`, `planificacion_sec`, `inscripcion_inu`, `inscripcion_not`, `evaluacion_rep`, `seleccion_rep`, `evaluacion_coor`, `constancia_est`, `constancia_ser_com`, `planilla_ins`, `planilla_notas`, `desempeno_tipo_eva`, `desempeno_gra_act`, `promedio_item`, `evaluacion_gen_doc`, `cargo`, `asigcargo`, `cont_serv`, `rep_des_tip_eva`, `rep_des_car`, `recep_pla`, `list_est_sec`, `list_carrera`, `list_asig`, `list_doc`) VALUES
('0.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1'),
('0.2', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0'),
('1.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.0.1', '0.0.0.0.0', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '1.0.0.0.1', '0.0.0.0.0', '1.1.1.1.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1', '1', '1', '1', '0', '0', '0', '0', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('1.2', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '0.0.0.0.0', '1.1.1.1.1', '0.0.0.0.0', '1.1.1.1.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1', '0', '1', '1', '0', '0', '0', '0', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('2.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '1.1.1.1.1', '1.1.1.1.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '0.0.0.0.0', '0', '0', '0', '0', '1', '1', '1', '1', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('1.3', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '1.0.0.0.0', '1.0.0.0.0', '1', '1', '1', '1', '0', '0', '0', '0', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('2.2', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.1.0.1', '1.0.1.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0', '0', '0', '0', '1', '1', '1', '1', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('3.2', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0', '0', '0', '0', '1', '1', '1', '1', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('3.4', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0', '0', '0', '0', '0', '1', '1', '0', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('3.3', '1.1.1.0.0', '1.1.1.1.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '1.1.1.1.1', '0', '0', '0', '0', '0', '0', '0', '0', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('2.6', '1.1.1.0.0', '1.1.1.0.0', '1.1.1.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', ''),
('2.3', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '1.0.0.0.1', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0.0.0.0.0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0.0.0.0', '0.0.0.0.0', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `cedula` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `nac` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `nombre1` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellido1` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `edociv` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'S',
  `lugar_naci` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `c_electronico` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idciudad` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccionesp` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `busqueda1` (`nombre1`),
  KEY `busqueda2` (`apellido1`),
  KEY `FK_ciudad_idx` (`idciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cedula`, `nac`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `sexo`, `fecha_nac`, `edociv`, `lugar_naci`, `c_electronico`, `idciudad`, `telefono`, `direccionesp`) VALUES
('10139355', '', 'ROSALINA', 'DEL CARMEN', 'ALVARADO', 'MARTÍNEZ', '', '0000-00-00', 'S', '', '', '1', '', ''),
('10644410', 'V', 'Iraima', 'Adela', 'Marchan', 'Montelo', '', '0000-00-00', 'S', '', '', '1', '', ''),
('1111111', 'V', 'dsdssdsd', 'dsdsdsdsds', 'dsdsdsd', 'sdsdsdsds', '', '0000-00-00', 'S', '', '', '1', '', ''),
('12092424', 'V', 'alexis', '', 'rivero', '', '', '0000-00-00', 'S', '', 'vrinox@hotmail.com', '1', '', ''),
('15833890', '', 'Margaret', 'Gabriela', 'Morales', 'Morales', 'F', '1980-12-24', 'C', 'Acarigua', 'Margaret@hotmail.com', '0', '04145556060', 'Av libertador sector centro'),
('16869503', '', 'DONNY', 'MARIA', 'BOLIVAR', 'CORTEZ', 'F', '1983-11-25', 'D', 'tararigua', 'DONNY@GMAIL.COM', '0', '(0424) 576-4567', 'acarigua'),
('16966832', '', 'NAHIRUBA', 'DEL CARMEN', 'PEROZO', 'HERRERA', '', '0000-00-00', 'S', '', '', '1', '', ''),
('16966833', '', 'JESÚS ', 'ENRIQUE', 'PEROZO', 'HERRERA', '', '0000-00-00', 'S', '', '', '1', '', ''),
('17945451', '', 'Luis', 'Jose', 'Linares', 'Linares', '', '0000-00-00', 'S', '', '', '1', '', ''),
('18892789', '', 'Javier', 'Alexander', 'Aranguren', 'Aranguren', '', '2013-03-13', '', '', 'javier@hotmail.com', '1', '', ''),
('19053532', '', 'NARKY', 'MARÍA', 'CABAÑA', '', '', '0000-00-00', 'S', '', 'NARKY123@GMAIL.COM', '1', '', ''),
('19164726', '', 'JOSE', 'MARIA', 'MENDOZA', 'ESCALONA', '', '0000-00-00', 'S', '', '', '1', '', ''),
('19377279', '', 'Starling', 'Alberto', 'Rodriguez', 'Mendez', 'M', '1989-10-12', 'S', 'Acarigua', 'starling@hotmail.com', '0', '04247658493', 'Av Los agricultores Sector el palito'),
('19637233', '', 'Victor', 'Julio', 'Sequera', 'Sanchez', 'M', '1990-12-12', 'S', 'Acarigua', 'Victor@hotmail.com', '0', '04146758345', 'urb. agua clara'),
('19723137', '', 'Hector', 'Jose', 'Duran', 'Ortiz', '', '0000-00-00', 'S', '', 'Hector@hotmail.com', '1', '', ''),
('20024301', '', 'LUIS', 'ENRIQUE', 'FIGUEROA', '', '', '0000-00-00', 'S', '', 'LUISFI@HOTMAIL.COM', '1', '', ''),
('20025035', '', 'EFRAÍN', 'JOSÉ', 'MENDOZA', 'TOVAR', '', '0000-00-00', 'S', '', '', '1', '', ''),
('20041540', 'V', '', '', '', '', 'M', '1991-08-04', 'S', '', '', '', '', ''),
('20388959', '', 'CARLOS', 'GUZMAN', 'EECKHOUT', 'ARRIECHI', '', '0000-00-00', 'S', '', 'CARLOSE@GMAIL.COM', '1', '', ''),
('20389912', '', 'Eudimir', 'Eulalia', 'Sanchez', 'Pereira', 'F', '1990-01-04', 'S', 'Acarigua', 'eudimir@hotmail.com', '0', '0426463903', 'Av las lagrimas barrio san pablo'),
('20391892', '', 'CARLET', 'VANESSA', 'RIERA', '', 'F', '1992-03-12', 'S', 'ARAURE', 'CARLETVANE@HOTMAIL.COM', '0', '0412-3452345', '-URB. LLANO ALTO'),
('20487772', '', 'Maria', 'Elisa', 'Sanchez', 'Torrez', 'F', '1985-12-24', 'S', 'Guarico', 'Mariaelisatkm@gmail.com', '0', '0125104713', '- Barrio paez'),
('20641588', '', 'KERWIL', 'ALEXANDER', 'ORTZ', '', 'M', '1991-06-07', 'S', 'ARAURE', 'KERWIL@YAHOO.COM', '0', '0255-7378590', '-BARRIO BOLÍVAR'),
('20642399', '', 'MORELIS', 'DESIRE', 'MORENO', 'PEREZ', 'F', '1991-08-13', 'S', 'acarigua', 'MORELIS@HOTMAIL.COM', '0', '04141234567', 'GUAGIRA '),
('20643369', '', 'Daniel', 'Juaquin', 'Ojeda', 'Montero', 'M', '1991-05-13', 'S', 'Acarigua', 'Ojeda_montero@gmail.com', '0', '04261547856', '-Calle4 Av 3 Durigua 7 '),
('20644287', '', 'Yeismar', 'Yesenia', 'Ortiz', 'Galindez', 'F', '1992-07-23', 'S', 'Acarigua', 'Yeismar@hotmail.com', '0', '04264556363', 'Urb. mamanico'),
('20657234', '', 'MARÍA', 'EUYENY', 'OCANTO', '', '', '1991-05-20', 'S', 'ARAURE', 'MARIAEU@HOTMAIL.COM', '0', '0243214565', '-BARRIO SAN PABLO'),
('20810218', '', 'LITXY', 'RUSBELYS', 'LUCENA', 'PERALTA', '', '0000-00-00', 'S', '', '', '1', '', ''),
('20810609', '', 'JULIO ', 'MANUEL', 'TORRES', 'GOZALEZ', 'M', '1991-08-13', '-', 'acarigua', 'JULIO@HOTMAIL.COM', '0', '04141234567', 'DURIGUA'),
('20810704', '', 'Walter', 'Roberto', 'Lugo', 'Gomez', '', '0000-00-00', 'S', '', '', '1', '', ''),
('20813208', '', 'WILLIAMS', 'ALBERTO', 'GONZALEZ', '', '', '0000-00-00', 'S', '', 'WILLI209@HOTMAIL.COM', '1', '', ''),
('20927391', '', 'Maximino', 'Antonio', 'Guedez', 'Espinosa', '', '0000-00-00', 'S', '', 'Maximino@hotmail.com', '1', '', ''),
('20950228', 'V', 'ANGELO', 'JOSÉ', 'GUALTIERI', 'PÉREZ', '', '0000-00-00', 'S', '', 'ANGELO@GMAIL.COM', '1', '', ''),
('21055336', '', 'Emely', 'Virginia', 'Rojas', 'Bustamante', 'F', '1990-09-16', 'S', 'Acarigua', 'rojita@hotmail.com', '0', '04265488561', '-Gonzalo '),
('21056147', '', 'JORGE', 'MANUEL', 'GUTIERREZ', 'MEJIAS', '', '0000-00-00', 'S', '', '', '1', '', ''),
('21056392', '', 'ENGELS', 'JOSÉ', 'LÓPEZ', 'ARTEAGA', '', '0000-00-00', 'S', '', '', '1', '', ''),
('21056565', '', 'RUDYMAR', 'ESTELA', 'CORONEL', 'ARRIECHI', '', '0000-00-00', 'S', '', 'RUDYMAR@YAHOO.ES', '1', '', ''),
('21057251', 'V', 'Victor', 'Manuel', 'Leon', 'Puentes', '', '0000-00-00', 'S', '', 'vrinox@hotmail.com', '1', '', ''),
('21057925', 'V', 'MARIA', 'ELISA', 'COLMENAREZ', 'DIAZ', '', '0000-00-00', 'S', '', 'MARIAE@HOTMAIL.COM', '1', '', ''),
('21058793', 'V', 'MOISÉS', 'ALEJANDRO', 'PICHARDO', 'TORREALBA', '', '0000-00-00', 'S', '', '', '1', '', ''),
('21059374', 'V', 'VÍCTOR', 'ALFONSO', 'VILLALBA', 'MÁRQUEZ', '', '0000-00-00', 'S', '', '', '1', '', ''),
('210593741', 'V', 'VÍCTOR', '', 'VILLALBA', '', '', '2010-04-10', 'C', 'san carlos', 'DONNYB@GMAIL.COM', '0', '04244917128', '-'),
('21060661', 'V', 'ELISA', 'ANDREA', 'VARGAS', 'ALVARADO', '', '0000-00-00', 'S', '', '', '1', '', ''),
('21394452', '', 'Antony', 'Roberto', 'Toro', 'Mula', 'M', '1992-11-04', 'S', 'Nueva Esparta', 'Antonydaraco@gmail.es', '0', '04122548532', '-'),
('21564059', '', 'Miguel', 'Sebastian', 'Montilla', 'Calderon', '', '0000-00-00', 'S', '', '', '1', '', ''),
('22096344', 'V', 'EDWARD', 'ALEXANDER', 'GUTIERREZ', '', '', '0000-00-00', 'S', '', '', '1', '', ''),
('22098418', 'V', 'ROY', 'MANUEL', 'SALAS', 'DOMÍNGUEZ', 'M', '1984-04-21', 'S', 'acarigua', 'roi_cutaro@hotmail.es', '0', '04125648532', '-Acarigua'),
('22102104', '', 'Richi', 'Fabian', 'Mujica', 'Lara', 'M', '1991-07-12', 'S', 'Acarigua', 'richi@hotmail.com', '0', '04120567890', 'Calle 31 sector centro'),
('22106571', '', 'Barbara', 'Rofenda', 'Perez', 'Tamalio', 'F', '1991-04-06', 'S', 'Acarigua', 'barbychikita@hotmail.com', '0', '042161594561', '-guajira 15'),
('23298180', '', 'GLADYS', 'ADRIANA', 'PEREZ', 'BLANCO', 'F', '1992-08-01', 'S', 'acarigua', 'GLADYS@HOTMAIL.COM', '0', '04141234567', 'PAEZ'),
('23298474', '', 'leslie', '', 'nathaly', '', 'F', '2012-12-12', 'C', 'acarigua', 'lesly_@example.com', '0', '(0424) 576-4567', 'urb fundación mendoza'),
('23577484', '', 'Dulce', 'Willyinia', 'Cisneros', 'Suarez', '', '0000-00-00', 'S', '', 'dulce@hotmail.com', '1', '', ''),
('24683215', 'V', 'JOSÉ', 'WILFREDO', 'VARGAS', '', '', '0000-00-00', 'S', '', '', '1', '', ''),
('24814246', '', 'Zurissaday', 'Anais', 'Figueroa', 'Colmenarez', '', '0000-00-00', 'S', '', 'Zury@hotmail.com', '1', '', ''),
('24814622', '', 'LINDA', 'MARIA', 'SOTELDO', 'PEREZ', 'F', '1991-08-13', 'S', 'acarigua', 'LINDA@HOTMAIL.COM', '0', '04141234567', 'DURIGUA'),
('432112', '', 'aAnn', 'nhhhh', 'hjhjjjhj', 'mb bmbb', '', '0000-00-00', 'S', '', '', '1', '', ''),
('84304834834', '', 'wewewewe', 'wewew', 'wewewe', 'ewewe', '', '0000-00-00', 'S', '', '', '1', '', ''),
('99999999', '', 'aAhbhb', 'b nb nn', 'hbhkbhbh', 'b bm mb b hbh', '', '0000-00-00', 'S', '', '', '1', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planificacion_sec`
--

CREATE TABLE IF NOT EXISTS `planificacion_sec` (
  `idplanificacion` int(11) NOT NULL,
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `codesp` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `regimen` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` int(3) NOT NULL,
  `fechapla` date NOT NULL,
  `horapla` time NOT NULL,
  `seccion` char(6) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idplanificacion`),
  KEY `FK_semestre_idx` (`semestre`),
  KEY `FK_seccion_idx` (`seccion`),
  KEY `FK_peraca_idx` (`peraca`),
  KEY `FK_regimen_idx` (`regimen`),
  KEY `FK_carrera_idx` (`codesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planificacion_sec`
--

INSERT INTO `planificacion_sec` (`idplanificacion`, `peraca`, `codesp`, `regimen`, `semestre`, `fechapla`, `horapla`, `seccion`) VALUES
(1, '2', '10', '1', 1, '2013-03-11', '00:00:00', 'A'),
(2, '2', '10', '1', 2, '2013-03-11', '00:00:00', 'A'),
(3, '2', '10', '1', 3, '2013-03-11', '00:00:00', 'B'),
(4, '2', '14', '1', 1, '2013-03-11', '00:00:00', 'A'),
(5, '2', '14', '1', 2, '2013-03-11', '00:00:00', 'A'),
(6, '2', '14', '1', 3, '2013-03-12', '00:00:00', 'A'),
(7, '2', '10', '1', 0, '2013-03-12', '00:00:00', 'A'),
(8, '2', '14', '1', 0, '2013-03-12', '00:00:00', 'A'),
(9, '2', '10', '2', 0, '2013-03-12', '00:00:00', 'B'),
(10, '2', '10', '2', 2, '2013-03-13', '00:00:00', 'B'),
(11, '2', '10', '1', 4, '2013-03-14', '00:00:00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso_inscripcion`
--

CREATE TABLE IF NOT EXISTS `proceso_inscripcion` (
  `cod_pro_ins` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_final` date NOT NULL,
  `peraca` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `idtipo` char(3) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod_pro_ins`),
  KEY `FK_periodo_idx` (`peraca`),
  KEY `FK_tipo_pro_idx` (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proceso_inscripcion`
--

INSERT INTO `proceso_inscripcion` (`cod_pro_ins`, `fecha_ini`, `fecha_final`, `peraca`, `estatus`, `idtipo`) VALUES
('1', '2013-03-11', '2013-03-11', '2', 'A', '1'),
('10', '2013-03-04', '2013-07-31', '2', 'A', '5'),
('11', '2013-03-09', '2013-03-12', '2', 'A', '2'),
('5', '2013-03-01', '2013-03-15', '2', 'A', '3'),
('6', '2013-01-01', '2013-02-26', '3', 'A', '6'),
('7', '2013-03-01', '2013-03-15', '2', 'A', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimen`
--

CREATE TABLE IF NOT EXISTS `regimen` (
  `idregimen` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_turno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idregimen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `regimen`
--

INSERT INTO `regimen` (`idregimen`, `tipo_turno`, `borrado`, `descripcion`) VALUES
('1', 'Diurno', 'I', ''),
('2', 'Nocturno', 'I', ''),
('3', 'Vespertino', 'I', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `idseccion` char(6) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idseccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`idseccion`, `estatus`, `borrado`) VALUES
('A', 'A', 'I'),
('B', 'A', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `idsemestre` int(3) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idsemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`idsemestre`, `nombre`, `borrado`) VALUES
(0, 'CINU', 'I'),
(1, 'I', 'I'),
(2, 'II', 'I'),
(3, 'III', 'I'),
(4, 'IV', 'I'),
(5, 'V', 'I'),
(6, 'VI', 'I'),
(7, 'VII', 'I'),
(8, 'VIII', 'I'),
(9, 'IX', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoevaluativo`
--

CREATE TABLE IF NOT EXISTS `tipoevaluativo` (
  `idtipo` int(2) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(160) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipoevaluativo`
--

INSERT INTO `tipoevaluativo` (`idtipo`, `nombre`, `descripcion`, `borrado`) VALUES
(1, 'Autoevaluacion', 'El docente se Autoevalua', 'I'),
(2, 'Evaluacion por Estudiantes', 'cada estudiante evalua a los docentes de los que recibe clases.', 'I'),
(3, 'Evaluacion por Coordinadores', 'Los coordinadores de carrera evaluan los aspectos admisnistrativos de los docentes de sus respectivas carreras', 'I'),
(4, 'Acompañamiento Docente', 'es cuando el representante se dirige hasta la zona de trabajo del docente y lo evalua en repsentacion del departamento', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_proceso`
--

CREATE TABLE IF NOT EXISTS `tipo_proceso` (
  `idtipo_pro` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `transaccion` char(2) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipo_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_proceso`
--

INSERT INTO `tipo_proceso` (`idtipo_pro`, `nombre`, `estatus`, `borrado`, `transaccion`) VALUES
('1', 'Proceso de Autoevaluacion', 'A', 'I', '1'),
('2', 'Proceso de Evaluación po Estudiantes', 'A', 'I', '2'),
('3', 'Proceso de Evaluación por Coordinadores', 'A', 'I', '3'),
('4', 'Proceso de Acompañamiento Docente', 'A', 'I', '4'),
('5', 'proceso de incripcion ', 'A', 'I', '5'),
('6', 'planificacion sec', 'A', 'I', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `nombre` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` char(41) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usu` char(2) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `pregrun_secre1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `pregun_secre2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `resp1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `resp2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`nombre`),
  KEY `busced` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `contrasena`, `tipo_usu`, `cedula`, `pregrun_secre1`, `pregun_secre2`, `resp1`, `resp2`) VALUES
('A10139355', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '10139355', '', '', '', ''),
('A10644410', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '1', '10644410', '', '', '', ''),
('A16966833', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '16966833', '', '', '', ''),
('A19164726', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '19164726', '', '', '', ''),
('A20025035', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '20025035', '', '', '', ''),
('A20810218', 'f1bf7533816cf9dd2e5395e28f3e43a77251cf9f', '1', '20810218', '', '', '', ''),
('A21056147', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '21056147', '', '', '', ''),
('A21056392', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '21056392', '', '', '', ''),
('A21058793', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '21058793', '', '', '', ''),
('A21060661', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '21060661', '', '', '', ''),
('A22096344', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '22096344', '', '', '', ''),
('a22102104', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '1', '22102104', '', '', '', ''),
('A24683215', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '24683215', '', '', '', ''),
('admin', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '0', '20041540', '', '', '', ''),
('admindsds', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '1111111', '', '', '', ''),
('adminwewe', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '84304834834', '', '', '', ''),
('alexis', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '12092424', '', '', '', ''),
('D16869503', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '2', '16869503', '', '', '', ''),
('D18892789', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '2', '18892789', '', '', '', ''),
('D19053532', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '19053532', '', '', '', ''),
('D20024301', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '20024301', '', '', '', ''),
('D20388959', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '20388959', '', '', '', ''),
('D20813208', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '20813208', '', '', '', ''),
('D20950228', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '20950228', '', '', '', ''),
('D21056565', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '21056565', '', '', '', ''),
('d21057251', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '2', '21057251', '', '', '', ''),
('D21057925', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '21057925', '', '', '', ''),
('D21059374', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '21059374', '', '', '', ''),
('dulcecisne', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '2', '23577484', '', '', '', ''),
('E15833890', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '3', '15833890', '', '', '', ''),
('E20391892', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '3', '20391892', '', '', '', ''),
('E20642399', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '3', '20642399', '', '', '', ''),
('e20643369', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '3', '20643369', '', '', '', ''),
('E20657234', '42d590612f5606c6bf0cd8c43a08a256a1dc8290', '3', '20657234', '', '', '', ''),
('E20810609', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '3', '20810609', '', '', '', ''),
('E21055336', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '3', '21055336', '', '', '', ''),
('E21394452', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '3', '21394452', '', '', '', ''),
('E22098418', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '3', '22098418', '', '', '', ''),
('E22102104', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '3', '22102104', '', '', '', ''),
('E22106571', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '3', '22106571', '', '', '', ''),
('E22487772', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '3', '20487772', '', '', '', ''),
('E23298180', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '3', '23298180', '', '', '', ''),
('E24814540', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '3', '24814622', '', '', '', ''),
('E2641588', '42d590612f5606c6bf0cd8c43a08a256a1dc8290', '3', '20641588', '', '', '', ''),
('eudimir', '86cb31c834da0864cd8d08c097cc850ed13ee893', '3', '20389912', '', '', '', ''),
('hbhbh', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '99999999', '', '', '', ''),
('hectordu', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '2', '19723137', '', '', '', ''),
('hhhhh', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '432112', '', '', '', ''),
('leslie123', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '3', '23298474', '', '', '', ''),
('linares', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '17945451', '', '', '', ''),
('maximino', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '20927391', '', '', '', ''),
('miguelmon', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '21564059', '', '', '', ''),
('NAHIPER', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '16966832', '', '', '', ''),
('sequera', '86cb31c834da0864cd8d08c097cc850ed13ee893', '3', '19637233', '', '', '', ''),
('starling', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1', '3', '19377279', '', '', '', ''),
('victorv', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '3', '210593741', '', '', '', ''),
('walterlu', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '1', '20810704', '', '', '', ''),
('yeismar', '86cb31c834da0864cd8d08c097cc850ed13ee893', '3', '20644287', '', '', '', ''),
('zuriss', '2bcc4da77857c3506f0e9b431ae40cc986f6da7f', '2', '24814246', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE IF NOT EXISTS `valoracion` (
  `idvaloracion` int(2) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `valor_real` int(2) NOT NULL,
  `idtipo_eva` int(2) NOT NULL,
  `borrado` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idvaloracion`),
  KEY `FK_tipo_idx` (`idtipo_eva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `valoracion`
--

INSERT INTO `valoracion` (`idvaloracion`, `nombre`, `valor_real`, `idtipo_eva`, `borrado`) VALUES
(1, 'Siempre', 5, 1, 'I'),
(2, 'Casi Siempre', 4, 1, 'I'),
(3, 'Algunas veces', 3, 1, 'I'),
(4, 'Casi Nunca', 2, 1, 'I'),
(5, 'Nunca', 1, 1, 'I'),
(6, 'Siempre', 10, 3, 'I'),
(7, 'Casi Siempre', 8, 3, 'I'),
(8, 'Pocas Veces', 4, 3, 'I'),
(9, 'Nunca', 0, 3, 'I'),
(10, 'Siempre', 5, 2, 'I'),
(11, 'Casi Siempre', 4, 2, 'I'),
(12, 'Algunas Veces ', 3, 2, 'I'),
(13, 'Pocas Veces', 2, 2, 'I'),
(14, 'Nunca', 1, 2, 'I'),
(42, 'Si', 5, 4, 'I'),
(43, 'No', 0, 4, 'I'),
(44, 'no se observa', 0, 4, 'I'),
(45, 'Regular', 2, 4, 'I');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`cedula_admin`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_carrera2` FOREIGN KEY (`codesp`) REFERENCES `carrera` (`codesp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_est_pre` FOREIGN KEY (`cedula_est_pre`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_semestre2` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `aspectosevaluativos`
--
ALTER TABLE `aspectosevaluativos`
  ADD CONSTRAINT `aspectosevaluativos_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipoevaluativo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tipoeva` FOREIGN KEY (`idtipo`) REFERENCES `tipoevaluativo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idparroquia`) REFERENCES `parroquia` (`idparroquia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleevaluacion`
--
ALTER TABLE `detalleevaluacion`
  ADD CONSTRAINT `detalleevaluacion_ibfk_1` FOREIGN KEY (`idvaloracion`) REFERENCES `valoracion` (`idvaloracion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleevaluacion_ibfk_2` FOREIGN KEY (`idaspecto`) REFERENCES `aspectosevaluativos` (`idaspectos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_evaluacion1` FOREIGN KEY (`numero`) REFERENCES `evaluacion` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_evaluado1` FOREIGN KEY (`cedula`) REFERENCES `docente` (`cedula_doc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_evaluadores`
--
ALTER TABLE `detalle_evaluadores`
  ADD CONSTRAINT `FK_codespde` FOREIGN KEY (`codesp`) REFERENCES `carrera` (`codesp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_evaluadode` FOREIGN KEY (`cedula`) REFERENCES `docente` (`cedula_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_evaluadoresde` FOREIGN KEY (`idevaluadores`) REFERENCES `evaluadores` (`idevaluadores`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_seccionde` FOREIGN KEY (`seccion`) REFERENCES `seccion` (`idseccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_semestrede` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_inscrip_pre`
--
ALTER TABLE `detalle_inscrip_pre`
  ADD CONSTRAINT `detalle_inscrip_pre_ibfk_4` FOREIGN KEY (`num_inscripcion`) REFERENCES `inscripcion_pre` (`num_inscripcion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_inscrip_pre_ibfk_5` FOREIGN KEY (`codmat`) REFERENCES `materia` (`codmat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_inscrip_pre_ibfk_6` FOREIGN KEY (`idplanificacion`) REFERENCES `planificacion_sec` (`idplanificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_insnot`
--
ALTER TABLE `detalle_insnot`
  ADD CONSTRAINT `FK_transaccionin` FOREIGN KEY (`codinsnot`) REFERENCES `insnot` (`codinsnot`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_nota`
--
ALTER TABLE `detalle_nota`
  ADD CONSTRAINT `FK_eva` FOREIGN KEY (`numero`) REFERENCES `evaluacion` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_evaluado2` FOREIGN KEY (`cedula`) REFERENCES `docente` (`cedula_doc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_plani`
--
ALTER TABLE `detalle_plani`
  ADD CONSTRAINT `FK_docente1` FOREIGN KEY (`cedula_docente`) REFERENCES `docente` (`cedula_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_materia1` FOREIGN KEY (`codmat`) REFERENCES `materia` (`codmat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_plan` FOREIGN KEY (`idplanificacion`) REFERENCES `planificacion_sec` (`idplanificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `FK_docente` FOREIGN KEY (`cedula_doc`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `doc_car_cargo_pre`
--
ALTER TABLE `doc_car_cargo_pre`
  ADD CONSTRAINT `FK_ced_doc` FOREIGN KEY (`cedula_doc`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_codesp1` FOREIGN KEY (`codesp`) REFERENCES `carrera` (`codesp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_idcar` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peraca3` FOREIGN KEY (`peraca`) REFERENCES `peraca` (`peraca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipoevaluativo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_carrera3` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`codesp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_evaluador` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peraca1` FOREIGN KEY (`peraca`) REFERENCES `peraca` (`peraca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluadores`
--
ALTER TABLE `evaluadores`
  ADD CONSTRAINT `evaluadores_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipoevaluativo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_control_eval` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peracae` FOREIGN KEY (`peraca`) REFERENCES `peraca` (`peraca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripcion_pre`
--
ALTER TABLE `inscripcion_pre`
  ADD CONSTRAINT `inscripcion_pre_ibfk_1` FOREIGN KEY (`cedula_est_pre`) REFERENCES `alumno` (`cedula_est_pre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `FK_pen` FOREIGN KEY (`idpensum`) REFERENCES `pensum_pre` (`idpensum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_semestre` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`idestado`) REFERENCES `estado` (`idestado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`idmunicipio`) REFERENCES `municipio` (`idmunicipio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pensum_pre`
--
ALTER TABLE `pensum_pre`
  ADD CONSTRAINT `FK_codesp` FOREIGN KEY (`codesp`) REFERENCES `carrera` (`codesp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planificacion_sec`
--
ALTER TABLE `planificacion_sec`
  ADD CONSTRAINT `FK_carrera1` FOREIGN KEY (`codesp`) REFERENCES `carrera` (`codesp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_peraca2` FOREIGN KEY (`peraca`) REFERENCES `peraca` (`peraca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_regimen1` FOREIGN KEY (`regimen`) REFERENCES `regimen` (`idregimen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_seccion1` FOREIGN KEY (`seccion`) REFERENCES `seccion` (`idseccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_semestre1` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proceso_inscripcion`
--
ALTER TABLE `proceso_inscripcion`
  ADD CONSTRAINT `FK_periodo` FOREIGN KEY (`peraca`) REFERENCES `peraca` (`peraca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tipo_pro` FOREIGN KEY (`idtipo`) REFERENCES `tipo_proceso` (`idtipo_pro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_ced` FOREIGN KEY (`cedula`) REFERENCES `persona` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valoracion`
--
ALTER TABLE `valoracion`
  ADD CONSTRAINT `FK_tipo` FOREIGN KEY (`idtipo_eva`) REFERENCES `tipoevaluativo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `valoracion_ibfk_2` FOREIGN KEY (`idtipo_eva`) REFERENCES `tipoevaluativo` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
