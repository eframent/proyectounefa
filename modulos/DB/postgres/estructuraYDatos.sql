--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: fecha(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION fecha(fechaentrada date, OUT fechasalida character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
 fechaSalida=to_char(fechaEntrada, 'DD-MM-YYYY');
END;
$$;


ALTER FUNCTION public.fecha(fechaentrada date, OUT fechasalida character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: CINU; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE "CINU" (
    cedula character varying(13) NOT NULL,
    rusnies character varying(20) NOT NULL,
    nombres character varying(160) NOT NULL,
    rama_edu character varying(30) NOT NULL,
    grado character varying(30),
    "IA" double precision,
    telefono character varying(14),
    correo character varying(30),
    "PROM" character varying(20),
    "POS" character varying(60),
    borrado character(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public."CINU" OWNER TO uptp;

--
-- Name: administrativo; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE administrativo (
    cedula_admin character varying(13) NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.administrativo OWNER TO uptp;

--
-- Name: alumno; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE alumno (
    cedula_est_pre character varying(13) NOT NULL,
    tipo_persona character varying(9) NOT NULL,
    etnia_indig character varying(45),
    discapacidad character varying(45),
    lugar_est character varying(160) NOT NULL,
    codigo_rusnies character varying(15) NOT NULL,
    equivalencia character varying(2),
    estatus character varying(1),
    indice_general double precision,
    fecing date,
    codesp character varying(3),
    semestre character varying(3),
    condicion integer,
    tipo_retiro integer,
    idpensum character varying(3),
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.alumno OWNER TO uptp;

--
-- Name: ambiente; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE ambiente (
    codigo character varying(3) NOT NULL,
    nombre character varying(35),
    direccion character varying(160),
    estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    borrado character(1) DEFAULT 'I'::bpchar,
    tip_cod integer
);


ALTER TABLE public.ambiente OWNER TO uptp;

--
-- Name: aspectosevaluativos; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE aspectosevaluativos (
    idaspectos integer NOT NULL,
    nombre character varying(160) NOT NULL,
    descripcion character varying(160) NOT NULL,
    idtipo integer NOT NULL,
    borrado character varying(1) NOT NULL
);


ALTER TABLE public.aspectosevaluativos OWNER TO uptp;

--
-- Name: bitacora; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE bitacora (
    idcambio bigint NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    tabla character varying(45) NOT NULL,
    operacion character varying(512) NOT NULL,
    nombre_usu character varying(20)
);


ALTER TABLE public.bitacora OWNER TO uptp;

--
-- Name: bitacora_acceso; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE bitacora_acceso (
    idacceso integer NOT NULL,
    fecha date,
    hora time without time zone,
    ip_acceso character varying(16),
    usuario character varying(15),
    operacion character varying(250)
);


ALTER TABLE public.bitacora_acceso OWNER TO uptp;

--
-- Name: bitacora_acceso_idacceso_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE bitacora_acceso_idacceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_acceso_idacceso_seq OWNER TO uptp;

--
-- Name: bitacora_acceso_idacceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE bitacora_acceso_idacceso_seq OWNED BY bitacora_acceso.idacceso;


--
-- Name: bitacora_idcambio_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE bitacora_idcambio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_idcambio_seq OWNER TO uptp;

--
-- Name: bitacora_idcambio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE bitacora_idcambio_seq OWNED BY bitacora.idcambio;


--
-- Name: bloque; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE bloque (
    blo_codigo integer NOT NULL,
    blo_rango character varying(20),
    blo_posicion smallint,
    blo_status character(1) DEFAULT 'A'::bpchar NOT NULL,
    idregimen character varying(1)
);


ALTER TABLE public.bloque OWNER TO uptp;

--
-- Name: bloques_blo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE bloques_blo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bloques_blo_codigo_seq OWNER TO uptp;

--
-- Name: bloques_blo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE bloques_blo_codigo_seq OWNED BY bloque.blo_codigo;


--
-- Name: cargo; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE cargo (
    car_codigo integer NOT NULL,
    car_nombre character varying(160) NOT NULL,
    fk_dep_codigo integer NOT NULL,
    car_status character varying(1) NOT NULL
);


ALTER TABLE public.cargo OWNER TO uptp;

--
-- Name: cargo_car_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE cargo_car_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_car_codigo_seq OWNER TO uptp;

--
-- Name: cargo_car_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE cargo_car_codigo_seq OWNED BY cargo.car_codigo;


--
-- Name: carrera; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE carrera (
    codesp character varying(3) NOT NULL,
    nombre character varying(45) NOT NULL,
    titulo character varying(160) NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.carrera OWNER TO uptp;

--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE ciudad (
    idciudad integer NOT NULL,
    nombre character varying(45) NOT NULL,
    estatus character varying(1) NOT NULL,
    idparroquia integer NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.ciudad OWNER TO uptp;

--
-- Name: condicion; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE condicion (
    idcondicion integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion character varying(160),
    abreviatura character varying(2) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.condicion OWNER TO uptp;

--
-- Name: condicion_idcondicion_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE condicion_idcondicion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condicion_idcondicion_seq OWNER TO uptp;

--
-- Name: condicion_idcondicion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE condicion_idcondicion_seq OWNED BY condicion.idcondicion;


--
-- Name: contenido; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE contenido (
    codcon integer NOT NULL,
    nombre character varying(60),
    descripcion character varying(225)
);


ALTER TABLE public.contenido OWNER TO uptp;

--
-- Name: contenido_codcon_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE contenido_codcon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contenido_codcon_seq OWNER TO uptp;

--
-- Name: contenido_codcon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE contenido_codcon_seq OWNED BY contenido.codcon;


--
-- Name: dedicacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dedicacion (
    codigo integer NOT NULL,
    nombre character varying(45),
    topehoras integer,
    borrado character(1) DEFAULT 'I'::bpchar
);


ALTER TABLE public.dedicacion OWNER TO postgres;

--
-- Name: dedicacion_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dedicacion_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dedicacion_codigo_seq OWNER TO postgres;

--
-- Name: dedicacion_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dedicacion_codigo_seq OWNED BY dedicacion.codigo;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE departamento (
    dep_codigo integer NOT NULL,
    dep_nombre character varying(45),
    dep_status character varying(1) NOT NULL
);


ALTER TABLE public.departamento OWNER TO uptp;

--
-- Name: departamento_dep_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE departamento_dep_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamento_dep_codigo_seq OWNER TO uptp;

--
-- Name: departamento_dep_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE departamento_dep_codigo_seq OWNED BY departamento.dep_codigo;


--
-- Name: detalle_cargo_usuario; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE detalle_cargo_usuario (
    det_codigo integer NOT NULL,
    fk_car_codigo integer NOT NULL,
    fk_usu_nombre character varying(15) NOT NULL
);


ALTER TABLE public.detalle_cargo_usuario OWNER TO uptp;

--
-- Name: detalle_cargo_usuario_det_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE detalle_cargo_usuario_det_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_cargo_usuario_det_codigo_seq OWNER TO uptp;

--
-- Name: detalle_cargo_usuario_det_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE detalle_cargo_usuario_det_codigo_seq OWNED BY detalle_cargo_usuario.det_codigo;


--
-- Name: detalle_est_unipla; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE detalle_est_unipla (
    codigo_up integer NOT NULL,
    codest integer NOT NULL
);


ALTER TABLE public.detalle_est_unipla OWNER TO uptp;

--
-- Name: detalle_evaluadores; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE detalle_evaluadores (
    idevaluadores integer NOT NULL,
    cedula character varying(13) NOT NULL,
    codesp character varying(3) NOT NULL,
    observaciones character varying(160),
    seccion integer NOT NULL,
    semestre character varying(3)
);


ALTER TABLE public.detalle_evaluadores OWNER TO uptp;

--
-- Name: detalle_nota; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE detalle_nota (
    numero integer NOT NULL,
    cedula character varying(13) NOT NULL,
    nota integer NOT NULL,
    observaciones character varying(220)
);


ALTER TABLE public.detalle_nota OWNER TO uptp;

--
-- Name: detalle_pm; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE detalle_pm (
    pm_codigo integer NOT NULL,
    blo_codigo integer NOT NULL,
    dia smallint,
    amb_codigo character varying(5) NOT NULL
);


ALTER TABLE public.detalle_pm OWNER TO uptp;

--
-- Name: detalle_unidad; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE detalle_unidad (
    coduni integer NOT NULL,
    codcon integer NOT NULL,
    codobj integer NOT NULL
);


ALTER TABLE public.detalle_unidad OWNER TO uptp;

--
-- Name: detalleevaluacion; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE detalleevaluacion (
    numero integer NOT NULL,
    cedula character varying(13) NOT NULL,
    idvaloracion integer NOT NULL,
    idaspecto integer NOT NULL
);


ALTER TABLE public.detalleevaluacion OWNER TO uptp;

--
-- Name: docente; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE docente (
    cedula_doc character varying(13) NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL,
    dedicacion integer
);


ALTER TABLE public.docente OWNER TO uptp;

--
-- Name: estado; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE estado (
    nombre_e character varying(45) NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL,
    idestado integer NOT NULL
);


ALTER TABLE public.estado OWNER TO uptp;

--
-- Name: estrategia; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE estrategia (
    codest integer NOT NULL,
    nombre character varying(45),
    descripcion character varying(225)
);


ALTER TABLE public.estrategia OWNER TO uptp;

--
-- Name: estrategia_codest_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE estrategia_codest_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estrategia_codest_seq OWNER TO uptp;

--
-- Name: estrategia_codest_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE estrategia_codest_seq OWNED BY estrategia.codest;


--
-- Name: evaluacion; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE evaluacion (
    numero integer NOT NULL,
    idtipo integer NOT NULL,
    fechaeva date NOT NULL,
    horaeva time without time zone NOT NULL,
    curso character varying(3) NOT NULL,
    cedula character varying(13),
    carrera character varying(3) NOT NULL,
    termino character varying(3) NOT NULL,
    materia character varying(8) NOT NULL,
    peraca character varying(3) NOT NULL
);


ALTER TABLE public.evaluacion OWNER TO uptp;

--
-- Name: evaluacion_numero_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE evaluacion_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluacion_numero_seq OWNER TO uptp;

--
-- Name: evaluacion_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE evaluacion_numero_seq OWNED BY evaluacion.numero;


--
-- Name: evaluacion_pla; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE evaluacion_pla (
    codigo_ep integer NOT NULL,
    codigo_up integer NOT NULL,
    codtec integer NOT NULL,
    tipo_tec integer NOT NULL,
    porcentaje double precision NOT NULL
);


ALTER TABLE public.evaluacion_pla OWNER TO uptp;

--
-- Name: evaluacion_pla_codigo_ep_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE evaluacion_pla_codigo_ep_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluacion_pla_codigo_ep_seq OWNER TO uptp;

--
-- Name: evaluacion_pla_codigo_ep_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE evaluacion_pla_codigo_ep_seq OWNED BY evaluacion_pla.codigo_ep;


--
-- Name: evaluadores; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE evaluadores (
    idevaluadores integer NOT NULL,
    cedula character varying(13) NOT NULL,
    idtipo integer NOT NULL,
    peraca character varying(3) NOT NULL,
    fechaeva date NOT NULL,
    horaeva time without time zone NOT NULL
);


ALTER TABLE public.evaluadores OWNER TO uptp;

--
-- Name: evaluadores_idevaluadores_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE evaluadores_idevaluadores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluadores_idevaluadores_seq OWNER TO uptp;

--
-- Name: evaluadores_idevaluadores_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE evaluadores_idevaluadores_seq OWNED BY evaluadores.idevaluadores;


--
-- Name: historial_clave; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE historial_clave (
    usuario character varying(15),
    clave character(128),
    fecha date
);


ALTER TABLE public.historial_clave OWNER TO uptp;

--
-- Name: inscripcion_pre; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE inscripcion_pre (
    num_inscripcion integer NOT NULL,
    cedula_est_pre character varying(13) NOT NULL,
    fecha_inscrip date NOT NULL,
    hora time without time zone NOT NULL,
    pm_codigo integer,
    peraca character varying(3)
);


ALTER TABLE public.inscripcion_pre OWNER TO uptp;

--
-- Name: inscripcion_pre_num_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE inscripcion_pre_num_inscripcion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscripcion_pre_num_inscripcion_seq OWNER TO uptp;

--
-- Name: inscripcion_pre_num_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE inscripcion_pre_num_inscripcion_seq OWNED BY inscripcion_pre.num_inscripcion;


--
-- Name: insnot; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE insnot (
    cedula_est_pre character varying(13),
    idinscripcion integer,
    condicion integer,
    asistencia integer,
    notadef double precision,
    notarep double precision
);


ALTER TABLE public.insnot OWNER TO uptp;

--
-- Name: materia; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE materia (
    codmat character varying(8) NOT NULL,
    nommat character varying(45) NOT NULL,
    descripcion character varying(160) NOT NULL,
    horteo integer NOT NULL,
    horpra integer NOT NULL,
    horlab integer NOT NULL,
    credito character varying(3) NOT NULL,
    electiva character varying(2) DEFAULT 'SI'::character varying NOT NULL,
    estatus character varying(1) NOT NULL,
    semestre character varying(3) NOT NULL,
    idpensum character varying(3) NOT NULL,
    prela1 character varying(8) NOT NULL,
    prela2 character varying(8) NOT NULL,
    prela3 character varying(8) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL,
    corequisito character varying(8)
);


ALTER TABLE public.materia OWNER TO uptp;

--
-- Name: modulo; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE modulo (
    mod_codigo integer NOT NULL,
    mod_nombre character varying(45),
    mod_estatus character varying(1) NOT NULL,
    mod_color character varying(12),
    mod_icon_clases character varying(45)
);


ALTER TABLE public.modulo OWNER TO uptp;

--
-- Name: modulo_mod_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE modulo_mod_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modulo_mod_codigo_seq OWNER TO uptp;

--
-- Name: modulo_mod_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE modulo_mod_codigo_seq OWNED BY modulo.mod_codigo;


--
-- Name: municipio; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE municipio (
    idmunicipio integer NOT NULL,
    nombre_m character varying(45) NOT NULL,
    estatus character varying(1) NOT NULL,
    idestado integer NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.municipio OWNER TO uptp;

--
-- Name: objetivo; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE objetivo (
    codobj integer NOT NULL,
    nombre character varying(60),
    descripcion character varying(225)
);


ALTER TABLE public.objetivo OWNER TO uptp;

--
-- Name: objetivo_codobj_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE objetivo_codobj_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetivo_codobj_seq OWNER TO uptp;

--
-- Name: objetivo_codobj_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE objetivo_codobj_seq OWNED BY objetivo.codobj;


--
-- Name: parroquia; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE parroquia (
    idparroquia integer NOT NULL,
    nombre_p character varying(45) NOT NULL,
    estatus character varying(1) NOT NULL,
    idmunicipio integer NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.parroquia OWNER TO uptp;

--
-- Name: pensum_pre; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE pensum_pre (
    idpensum character varying(3) NOT NULL,
    codesp character varying(3) NOT NULL,
    nombre character varying(20) NOT NULL,
    fecha_pensum date NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.pensum_pre OWNER TO uptp;

--
-- Name: peraca; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE peraca (
    peraca character varying(3) NOT NULL,
    nombre character varying(45) NOT NULL,
    fecha_ini date NOT NULL,
    fecha_fin date NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.peraca OWNER TO uptp;

--
-- Name: permiso; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE permiso (
    per_codigo integer NOT NULL,
    fk_car_codigo integer NOT NULL,
    fk_sub_codigo integer NOT NULL
);


ALTER TABLE public.permiso OWNER TO uptp;

--
-- Name: permiso_per_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE permiso_per_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permiso_per_codigo_seq OWNER TO uptp;

--
-- Name: permiso_per_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE permiso_per_codigo_seq OWNED BY permiso.per_codigo;


--
-- Name: permiso_proceso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permiso_proceso (
    perpro_codigo integer NOT NULL,
    fk_car_codigo integer NOT NULL,
    fk_tippro_codigo integer NOT NULL
);


ALTER TABLE public.permiso_proceso OWNER TO postgres;

--
-- Name: permiso_proceso_perpro_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permiso_proceso_perpro_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permiso_proceso_perpro_codigo_seq OWNER TO postgres;

--
-- Name: permiso_proceso_perpro_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permiso_proceso_perpro_codigo_seq OWNED BY permiso_proceso.perpro_codigo;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE persona (
    cedula character varying(13) NOT NULL,
    nombre1 character varying(20) NOT NULL,
    nombre2 character varying(45) NOT NULL,
    apellido1 character varying(20) NOT NULL,
    apellido2 character varying(45) NOT NULL,
    sexo character varying(1),
    fecha_nac date,
    edociv character varying(1) DEFAULT 'S'::bpchar NOT NULL,
    lugar_naci character varying(45),
    c_electronico character varying(45),
    idciudad integer,
    telefono character varying(15),
    direccionesp character varying(160)
);


ALTER TABLE public.persona OWNER TO uptp;

--
-- Name: plan_fecha_eva; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE plan_fecha_eva (
    codigo_pfe integer NOT NULL,
    codigo_ep integer NOT NULL,
    fecha_eva date NOT NULL,
    pm_codigo integer NOT NULL
);


ALTER TABLE public.plan_fecha_eva OWNER TO uptp;

--
-- Name: plan_fecha_eva_codigo_pfe_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE plan_fecha_eva_codigo_pfe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_fecha_eva_codigo_pfe_seq OWNER TO uptp;

--
-- Name: plan_fecha_eva_codigo_pfe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE plan_fecha_eva_codigo_pfe_seq OWNED BY plan_fecha_eva.codigo_pfe;


--
-- Name: planificacion_evaluacion; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE planificacion_evaluacion (
    idplanificacion integer NOT NULL,
    peraca character varying(3) NOT NULL,
    docente_c character varying(13),
    codmat character varying(8) NOT NULL
);


ALTER TABLE public.planificacion_evaluacion OWNER TO uptp;

--
-- Name: planificacion_evaluacion_idplanificacion_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE planificacion_evaluacion_idplanificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planificacion_evaluacion_idplanificacion_seq OWNER TO uptp;

--
-- Name: planificacion_evaluacion_idplanificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE planificacion_evaluacion_idplanificacion_seq OWNED BY planificacion_evaluacion.idplanificacion;


--
-- Name: planificacion_materias; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE planificacion_materias (
    idplanificacion integer NOT NULL,
    cedula_docente character varying(13),
    codmat character varying(8) NOT NULL,
    tope integer,
    pm_codigo integer NOT NULL
);


ALTER TABLE public.planificacion_materias OWNER TO uptp;

--
-- Name: planificacion_materias_pm_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE planificacion_materias_pm_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planificacion_materias_pm_codigo_seq OWNER TO uptp;

--
-- Name: planificacion_materias_pm_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE planificacion_materias_pm_codigo_seq OWNED BY planificacion_materias.pm_codigo;


--
-- Name: planificacion_sec; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE planificacion_sec (
    peraca character varying(3) NOT NULL,
    codesp character varying(3) NOT NULL,
    regimen character varying(1) NOT NULL,
    semestre character varying(3) NOT NULL,
    fechapla date NOT NULL,
    horapla time without time zone NOT NULL,
    seccion integer NOT NULL,
    idplanificacion integer NOT NULL
);


ALTER TABLE public.planificacion_sec OWNER TO uptp;

--
-- Name: planificacion_sec_idplanificacion_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE planificacion_sec_idplanificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planificacion_sec_idplanificacion_seq OWNER TO uptp;

--
-- Name: planificacion_sec_idplanificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE planificacion_sec_idplanificacion_seq OWNED BY planificacion_sec.idplanificacion;


--
-- Name: proceso; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE proceso (
    idproceso integer NOT NULL,
    fecha_ini date,
    fecha_final date NOT NULL,
    estatus character varying(1) NOT NULL,
    peraca character varying(3) NOT NULL,
    idtipo integer
);


ALTER TABLE public.proceso OWNER TO uptp;

--
-- Name: proceso_idproceso_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE proceso_idproceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proceso_idproceso_seq OWNER TO uptp;

--
-- Name: proceso_idproceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE proceso_idproceso_seq OWNED BY proceso.idproceso;


--
-- Name: regimen; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE regimen (
    idregimen character varying(1) NOT NULL,
    tipo_turno character varying(20) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL,
    descripcion character varying(160)
);


ALTER TABLE public.regimen OWNER TO uptp;

--
-- Name: retiro; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE retiro (
    codigo integer NOT NULL,
    tipo integer NOT NULL,
    cedula_est_pre character varying(13) NOT NULL,
    sancion integer
);


ALTER TABLE public.retiro OWNER TO uptp;

--
-- Name: retiro_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE retiro_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.retiro_codigo_seq OWNER TO uptp;

--
-- Name: retiro_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE retiro_codigo_seq OWNED BY retiro.codigo;


--
-- Name: seccion; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE seccion (
    idseccion integer NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL,
    nombre character(1)
);


ALTER TABLE public.seccion OWNER TO uptp;

--
-- Name: seccion_idseccion_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE seccion_idseccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seccion_idseccion_seq OWNER TO uptp;

--
-- Name: seccion_idseccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE seccion_idseccion_seq OWNED BY seccion.idseccion;


--
-- Name: semestre; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE semestre (
    idsemestre character varying(3) NOT NULL,
    nombre character varying(20) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.semestre OWNER TO uptp;

--
-- Name: servidor; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE servidor (
    idconfiguracion integer NOT NULL,
    intentos_fallidos_usuario integer,
    tiempo_inactividad integer,
    caducidad_clave integer,
    cantidad_preguntas integer,
    cantidad_respuestas integer,
    historial_clave integer DEFAULT 3 NOT NULL,
    codigo_seguridad boolean DEFAULT true
);


ALTER TABLE public.servidor OWNER TO uptp;

--
-- Name: COLUMN servidor.codigo_seguridad; Type: COMMENT; Schema: public; Owner: uptp
--

COMMENT ON COLUMN servidor.codigo_seguridad IS 'si se utiliza o no el codigo de verificacion por correo para la autorizacion de cambios de contraseña';


--
-- Name: servidor_idconfiguracion_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE servidor_idconfiguracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servidor_idconfiguracion_seq OWNER TO uptp;

--
-- Name: servidor_idconfiguracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE servidor_idconfiguracion_seq OWNED BY servidor.idconfiguracion;


--
-- Name: solicitud; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE solicitud (
    idsoli integer NOT NULL,
    solicitante character varying(13),
    idtipo integer,
    estatus character varying(3),
    observacion character varying(225),
    motivo character varying(160),
    regimen character varying(1),
    codesp character varying(3),
    fecha date
);


ALTER TABLE public.solicitud OWNER TO uptp;

--
-- Name: solicitud_idsoli_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE solicitud_idsoli_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitud_idsoli_seq OWNER TO uptp;

--
-- Name: solicitud_idsoli_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE solicitud_idsoli_seq OWNED BY solicitud.idsoli;


--
-- Name: submodulo; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE submodulo (
    sub_codigo integer NOT NULL,
    sub_nombre character varying(45) NOT NULL,
    fk_mod_codigo integer NOT NULL,
    sub_estatus character varying(1) NOT NULL,
    sub_tipo integer NOT NULL,
    sub_ruta character varying(60)
);


ALTER TABLE public.submodulo OWNER TO uptp;

--
-- Name: submodulo_sub_codigo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE submodulo_sub_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submodulo_sub_codigo_seq OWNER TO uptp;

--
-- Name: submodulo_sub_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE submodulo_sub_codigo_seq OWNED BY submodulo.sub_codigo;


--
-- Name: tecnica; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE tecnica (
    codtec integer NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(225)
);


ALTER TABLE public.tecnica OWNER TO uptp;

--
-- Name: tecnica_codtec_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE tecnica_codtec_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tecnica_codtec_seq OWNER TO uptp;

--
-- Name: tecnica_codtec_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE tecnica_codtec_seq OWNED BY tecnica.codtec;


--
-- Name: tipo_ambiente; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE tipo_ambiente (
    tip_nombre character varying(40) NOT NULL,
    tip_descripcion character varying(160),
    tip_estatus character(1) DEFAULT 'A'::bpchar NOT NULL,
    tip_cod integer NOT NULL
);


ALTER TABLE public.tipo_ambiente OWNER TO uptp;

--
-- Name: tipo_ambiente_tip_cod_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE tipo_ambiente_tip_cod_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_ambiente_tip_cod_seq OWNER TO uptp;

--
-- Name: tipo_ambiente_tip_cod_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE tipo_ambiente_tip_cod_seq OWNED BY tipo_ambiente.tip_cod;


--
-- Name: tipo_proceso; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE tipo_proceso (
    idtipo_pro integer NOT NULL,
    nombre character varying(45) NOT NULL,
    estatus character varying(1) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL,
    padre integer,
    modulo integer,
    holgura integer DEFAULT 0
);


ALTER TABLE public.tipo_proceso OWNER TO uptp;

--
-- Name: tipo_proceso_idtipo_pro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_proceso_idtipo_pro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_proceso_idtipo_pro_seq OWNER TO postgres;

--
-- Name: tipo_proceso_idtipo_pro_seq1; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE tipo_proceso_idtipo_pro_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_proceso_idtipo_pro_seq1 OWNER TO uptp;

--
-- Name: tipo_proceso_idtipo_pro_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE tipo_proceso_idtipo_pro_seq1 OWNED BY tipo_proceso.idtipo_pro;


--
-- Name: tipo_retiro; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE tipo_retiro (
    idtipo_ret integer NOT NULL,
    nombre character varying(45) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL,
    estatus character varying(1) DEFAULT 'A'::character varying NOT NULL,
    abreviatura character varying(10)
);


ALTER TABLE public.tipo_retiro OWNER TO uptp;

--
-- Name: tipo_retiro_idtipo_ret_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE tipo_retiro_idtipo_ret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_retiro_idtipo_ret_seq OWNER TO uptp;

--
-- Name: tipo_retiro_idtipo_ret_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE tipo_retiro_idtipo_ret_seq OWNED BY tipo_retiro.idtipo_ret;


--
-- Name: tipo_solicitud; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE tipo_solicitud (
    idtipo integer NOT NULL,
    nombre character varying(45),
    estatus character varying(1)
);


ALTER TABLE public.tipo_solicitud OWNER TO uptp;

--
-- Name: tipo_solicitud_idtipo_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE tipo_solicitud_idtipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_solicitud_idtipo_seq OWNER TO uptp;

--
-- Name: tipo_solicitud_idtipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE tipo_solicitud_idtipo_seq OWNED BY tipo_solicitud.idtipo;


--
-- Name: tipoevaluativo; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE tipoevaluativo (
    idtipo integer NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(160) NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.tipoevaluativo OWNER TO uptp;

--
-- Name: unidad; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE unidad (
    coduni integer NOT NULL,
    codmat character varying(8) NOT NULL,
    nombre character varying(60) NOT NULL,
    estatus character varying(1) DEFAULT 'A'::character varying NOT NULL
);


ALTER TABLE public.unidad OWNER TO uptp;

--
-- Name: unidad_coduni_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE unidad_coduni_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_coduni_seq OWNER TO uptp;

--
-- Name: unidad_coduni_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE unidad_coduni_seq OWNED BY unidad.coduni;


--
-- Name: unidad_pla; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE unidad_pla (
    codigo_up integer NOT NULL,
    idplanificacion integer NOT NULL,
    coduni integer NOT NULL
);


ALTER TABLE public.unidad_pla OWNER TO uptp;

--
-- Name: unidad_pla_codigo_up_seq; Type: SEQUENCE; Schema: public; Owner: uptp
--

CREATE SEQUENCE unidad_pla_codigo_up_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_pla_codigo_up_seq OWNER TO uptp;

--
-- Name: unidad_pla_codigo_up_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptp
--

ALTER SEQUENCE unidad_pla_codigo_up_seq OWNED BY unidad_pla.codigo_up;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE usuario (
    nombre character varying(15) NOT NULL,
    contrasena character(128) NOT NULL,
    tipo_usu character varying(1) NOT NULL,
    cedula character varying(13),
    sesion_abierta character(1),
    intentos_fallidos integer DEFAULT 0,
    estatus character(1) DEFAULT 'P'::bpchar
);


ALTER TABLE public.usuario OWNER TO uptp;

--
-- Name: usuario_pregunta; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE usuario_pregunta (
    usuario character varying(15),
    pregunta character varying(225) NOT NULL,
    respuesta character varying(225) NOT NULL
);


ALTER TABLE public.usuario_pregunta OWNER TO uptp;

--
-- Name: valoracion; Type: TABLE; Schema: public; Owner: uptp; Tablespace: 
--

CREATE TABLE valoracion (
    idvaloracion integer NOT NULL,
    nombre character varying(20) NOT NULL,
    valor_real integer NOT NULL,
    idtipo_eva integer NOT NULL,
    borrado character varying(1) DEFAULT 'I'::bpchar NOT NULL
);


ALTER TABLE public.valoracion OWNER TO uptp;

--
-- Name: idcambio; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY bitacora ALTER COLUMN idcambio SET DEFAULT nextval('bitacora_idcambio_seq'::regclass);


--
-- Name: idacceso; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY bitacora_acceso ALTER COLUMN idacceso SET DEFAULT nextval('bitacora_acceso_idacceso_seq'::regclass);


--
-- Name: blo_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY bloque ALTER COLUMN blo_codigo SET DEFAULT nextval('bloques_blo_codigo_seq'::regclass);


--
-- Name: car_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY cargo ALTER COLUMN car_codigo SET DEFAULT nextval('cargo_car_codigo_seq'::regclass);


--
-- Name: idcondicion; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY condicion ALTER COLUMN idcondicion SET DEFAULT nextval('condicion_idcondicion_seq'::regclass);


--
-- Name: codcon; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY contenido ALTER COLUMN codcon SET DEFAULT nextval('contenido_codcon_seq'::regclass);


--
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dedicacion ALTER COLUMN codigo SET DEFAULT nextval('dedicacion_codigo_seq'::regclass);


--
-- Name: dep_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY departamento ALTER COLUMN dep_codigo SET DEFAULT nextval('departamento_dep_codigo_seq'::regclass);


--
-- Name: det_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_cargo_usuario ALTER COLUMN det_codigo SET DEFAULT nextval('detalle_cargo_usuario_det_codigo_seq'::regclass);


--
-- Name: codest; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY estrategia ALTER COLUMN codest SET DEFAULT nextval('estrategia_codest_seq'::regclass);


--
-- Name: numero; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion ALTER COLUMN numero SET DEFAULT nextval('evaluacion_numero_seq'::regclass);


--
-- Name: codigo_ep; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion_pla ALTER COLUMN codigo_ep SET DEFAULT nextval('evaluacion_pla_codigo_ep_seq'::regclass);


--
-- Name: idevaluadores; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluadores ALTER COLUMN idevaluadores SET DEFAULT nextval('evaluadores_idevaluadores_seq'::regclass);


--
-- Name: num_inscripcion; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY inscripcion_pre ALTER COLUMN num_inscripcion SET DEFAULT nextval('inscripcion_pre_num_inscripcion_seq'::regclass);


--
-- Name: mod_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY modulo ALTER COLUMN mod_codigo SET DEFAULT nextval('modulo_mod_codigo_seq'::regclass);


--
-- Name: codobj; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY objetivo ALTER COLUMN codobj SET DEFAULT nextval('objetivo_codobj_seq'::regclass);


--
-- Name: per_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY permiso ALTER COLUMN per_codigo SET DEFAULT nextval('permiso_per_codigo_seq'::regclass);


--
-- Name: perpro_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_proceso ALTER COLUMN perpro_codigo SET DEFAULT nextval('permiso_proceso_perpro_codigo_seq'::regclass);


--
-- Name: codigo_pfe; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY plan_fecha_eva ALTER COLUMN codigo_pfe SET DEFAULT nextval('plan_fecha_eva_codigo_pfe_seq'::regclass);


--
-- Name: idplanificacion; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_evaluacion ALTER COLUMN idplanificacion SET DEFAULT nextval('planificacion_evaluacion_idplanificacion_seq'::regclass);


--
-- Name: pm_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_materias ALTER COLUMN pm_codigo SET DEFAULT nextval('planificacion_materias_pm_codigo_seq'::regclass);


--
-- Name: idplanificacion; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_sec ALTER COLUMN idplanificacion SET DEFAULT nextval('planificacion_sec_idplanificacion_seq'::regclass);


--
-- Name: idproceso; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY proceso ALTER COLUMN idproceso SET DEFAULT nextval('proceso_idproceso_seq'::regclass);


--
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY retiro ALTER COLUMN codigo SET DEFAULT nextval('retiro_codigo_seq'::regclass);


--
-- Name: idseccion; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY seccion ALTER COLUMN idseccion SET DEFAULT nextval('seccion_idseccion_seq'::regclass);


--
-- Name: idconfiguracion; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY servidor ALTER COLUMN idconfiguracion SET DEFAULT nextval('servidor_idconfiguracion_seq'::regclass);


--
-- Name: idsoli; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY solicitud ALTER COLUMN idsoli SET DEFAULT nextval('solicitud_idsoli_seq'::regclass);


--
-- Name: sub_codigo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY submodulo ALTER COLUMN sub_codigo SET DEFAULT nextval('submodulo_sub_codigo_seq'::regclass);


--
-- Name: codtec; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY tecnica ALTER COLUMN codtec SET DEFAULT nextval('tecnica_codtec_seq'::regclass);


--
-- Name: tip_cod; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY tipo_ambiente ALTER COLUMN tip_cod SET DEFAULT nextval('tipo_ambiente_tip_cod_seq'::regclass);


--
-- Name: idtipo_pro; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY tipo_proceso ALTER COLUMN idtipo_pro SET DEFAULT nextval('tipo_proceso_idtipo_pro_seq1'::regclass);


--
-- Name: idtipo_ret; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY tipo_retiro ALTER COLUMN idtipo_ret SET DEFAULT nextval('tipo_retiro_idtipo_ret_seq'::regclass);


--
-- Name: idtipo; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY tipo_solicitud ALTER COLUMN idtipo SET DEFAULT nextval('tipo_solicitud_idtipo_seq'::regclass);


--
-- Name: coduni; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY unidad ALTER COLUMN coduni SET DEFAULT nextval('unidad_coduni_seq'::regclass);


--
-- Name: codigo_up; Type: DEFAULT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY unidad_pla ALTER COLUMN codigo_up SET DEFAULT nextval('unidad_pla_codigo_up_seq'::regclass);


--
-- Data for Name: CINU; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Data for Name: administrativo; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO administrativo VALUES ('V-4925159', 'A', 'I');
INSERT INTO administrativo VALUES ('V-21060661', 'A', 'I');
INSERT INTO administrativo VALUES ('V-21059374', 'A', 'I');


--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO alumno VALUES ('V-21057678', 'CIVIL', NULL, NULL, '11111', '11111', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057292', 'CIVIL', NULL, NULL, '11152', '11152', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057291', 'CIVIL', NULL, NULL, '11151', '11151', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057290', 'CIVIL', NULL, NULL, '11150', '11150', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057289', 'CIVIL', NULL, NULL, '11149', '11149', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057288', 'CIVIL', NULL, NULL, '11148', '11148', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057287', 'CIVIL', NULL, NULL, '11147', '11147', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057286', 'CIVIL', NULL, NULL, '11146', '11146', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057285', 'CIVIL', NULL, NULL, '11145', '11145', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057284', 'CIVIL', NULL, NULL, '11144', '11144', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057283', 'CIVIL', NULL, NULL, '11143', '11143', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057281', 'CIVIL', NULL, NULL, '11141', '11141', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057280', 'CIVIL', NULL, NULL, '11140', '11140', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057258', 'CIVIL', NULL, NULL, '11118', '11118', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057257', 'CIVIL', NULL, NULL, '11117', '11117', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057256', 'CIVIL', NULL, NULL, '11116', '11116', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057255', 'CIVIL', NULL, NULL, '11115', '11115', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057254', 'CIVIL', NULL, NULL, '11114', '11114', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057253', 'CIVIL', NULL, NULL, '11113', '11113', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057252', 'CIVIL', NULL, NULL, '11112', '11112', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-18892789', 'A', '', 'NO POSEE', 'SANDBKASNDBKA', '1111111', NULL, 'A', 19, '2014-02-08', '19', '0', 1, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057259', 'CIVIL', NULL, NULL, '11119', '11119', NULL, 'A', NULL, '2014-03-08', '10', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-20847202', 'I', 'NO  TIENE', 'NO TIENE', '', '', NULL, 'A', NULL, '2014-11-15', '10', '1', 1, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-20041544', 'A', '', '', 'E.T.I "PADRE DEHON LEON"', '1212', NULL, 'A', 15, '2015-02-11', '10', '1', 2, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-20025035', 'A', '', '', 'ANA SUSANA DUSET', '99012913', NULL, 'I', 0, '2014-03-10', '10', '1', 1, 1, '2', 'I');
INSERT INTO alumno VALUES ('V-17945451', 'CIVIL', NULL, NULL, '121211', '121211', NULL, 'A', NULL, '2014-04-06', '14', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-17945459', 'CIVIL', NULL, NULL, '121219', '121219', NULL, 'A', NULL, '2014-04-28', '14', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-17945458', 'CIVIL', NULL, NULL, '121218', '121218', NULL, 'A', NULL, '2014-04-28', '14', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-17945456', 'CIVIL', NULL, NULL, '121216', '121216', NULL, 'A', NULL, '2014-04-28', '14', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-17945455', 'CIVIL', NULL, NULL, '121215', '121215', NULL, 'A', NULL, '2014-04-28', '14', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-17945453', 'CIVIL', NULL, NULL, '121213', '121213', NULL, 'A', NULL, '2014-04-28', '14', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-17945452', 'CIVIL', NULL, NULL, '121212', '121212', NULL, 'A', NULL, '2014-04-28', '14', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-17945460', 'CIVIL', NULL, NULL, '121220', '121220', NULL, 'A', NULL, '2014-04-28', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057269', 'CIVIL', NULL, NULL, '11129', '11129', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057268', 'CIVIL', NULL, NULL, '11128', '11128', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057267', 'CIVIL', NULL, NULL, '11127', '11127', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057266', 'CIVIL', NULL, NULL, '11126', '11126', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057265', 'CIVIL', NULL, NULL, '11125', '11125', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057264', 'CIVIL', NULL, NULL, '11124', '11124', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057262', 'CIVIL', NULL, NULL, '11122', '11122', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057261', 'CIVIL', NULL, NULL, '11121', '11121', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057260', 'CIVIL', NULL, NULL, '11120', '11120', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057263', 'CIVIL', NULL, NULL, '11123', '11123', NULL, 'A', NULL, '2014-03-08', '21', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057279', 'CIVIL', NULL, NULL, '11139', '11139', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057278', 'CIVIL', NULL, NULL, '11138', '11138', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057277', 'CIVIL', NULL, NULL, '11137', '11137', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057276', 'CIVIL', NULL, NULL, '11136', '11136', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057275', 'CIVIL', NULL, NULL, '11135', '11135', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057274', 'CIVIL', NULL, NULL, '11134', '11134', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057273', 'CIVIL', NULL, NULL, '11133', '11133', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057271', 'CIVIL', NULL, NULL, '11131', '11131', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057270', 'CIVIL', NULL, NULL, '11130', '11130', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057272', 'CIVIL', NULL, NULL, '11132', '11132', NULL, 'A', NULL, '2014-03-08', '3', NULL, NULL, NULL, '2', 'I');
INSERT INTO alumno VALUES ('V-21057282', 'CIVIL', NULL, NULL, '11142', '11142', NULL, 'A', NULL, '2014-03-08', '20', NULL, NULL, NULL, '2', 'I');


--
-- Data for Name: ambiente; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO ambiente VALUES ('3', 'AULA-1', 'PRIMER PISO A1', 'A', 'I', 2);
INSERT INTO ambiente VALUES ('4', 'AULA-2', 'PRIMER PISO A2', 'A', 'I', 2);
INSERT INTO ambiente VALUES ('5', 'AULA-3', 'SEGUNDO PISO A3', 'A', 'I', 2);
INSERT INTO ambiente VALUES ('6', 'AULA-4', 'SEGUNDO PISO A4', 'A', 'I', 2);
INSERT INTO ambiente VALUES ('7', 'AULA-5', 'TERCER PISO A5', 'A', 'I', 2);
INSERT INTO ambiente VALUES ('8', 'AULA-6', 'TERCER PISO A6', 'A', 'I', 2);
INSERT INTO ambiente VALUES ('9', 'CANCHA-1', 'FRENTE EXTERIOR', 'A', 'I', 3);
INSERT INTO ambiente VALUES ('10', 'CANCHA-2', 'FRENTE INTERIOR', 'A', 'I', 3);
INSERT INTO ambiente VALUES ('2', 'LAB2', 'LABORATORIO DE ARROZ', 'A', 'I', 1);
INSERT INTO ambiente VALUES ('1', 'LAB1', 'SFDSFDDSF', 'A', 'I', 1);


--
-- Data for Name: aspectosevaluativos; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO aspectosevaluativos VALUES (1, 'Discutió y acordó el Plan Evalualuativo con los estudiantes antes de firmar el acta compromiso', 'autoevaluacion', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (2, 'Preparó el material instruccional requerido para dictar la asignatura.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (3, 'Impartió las actividades académicas previstas en la planificación.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (4, 'Asistió puntualmente a las actividades académicas (clases y evaluaciones)', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (5, 'Atendió las consultas que le hicieron los estudiantes fuera del horario de clases (tutorías, aula virtual).', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (6, 'Opinó sobre el rendimiento de los estudiantes utilizando para ello criterios objetivos con fines formativos.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (7, 'Efectuó las evaluaciones previstas en el plan de evaluación.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (8, 'Entregó a los estudiantes el resultado de las evaluaciones de cohortes y finales', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (9, 'Mantuvo una actitud y conducta respetuosa y ética ante los estudiantes, compañeros docentes y demás personal de la Universidad.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (10, 'Respetó la integridad física y moral de los alumnos, compañeros docentes y demás personal de la Universidad.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (11, 'Contribuyó al mantenimiento de la disciplina, la moral y las buenas costumbres dentro de las instalaciones.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (12, 'Veló por el adecuado uso, mantenimiento y conservación de las instalaciones, equipos y enseres de la institución.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (13, 'Asistió a las reuniones convocadas por  la institución', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (14, 'Consulto cualquier cambio en horarios, aulas y programación con su coordinador de carreras', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (15, 'Hizo entrega de la planificaciòn de la asignatura en las semanas 2 y 3  a la coordinación de planificación ', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (16, 'Hizo entrega del  diagnóstico y acta compromiso a la coordinación de planificación ', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (17, 'Cumplio las normas internas de la institución,uso del celular, vestimenta, otros', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (18, 'Hizo cumplir el protocologo de aula, antes de iniciar las actividades', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (19, 'Exigio el uso correcto del uniforme a los estudiantes', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (20, 'Respetó el aula asignada.', '', 1, 'I');
INSERT INTO aspectosevaluativos VALUES (21, 'Asistió a las reuniones convocadas por la institución o por su coodinación', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (22, 'Cumplió puntualmente con la hora de entrada  y salida de  clases de acuerdo a su horario', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (23, 'Entregó los recaudos correspondiente a su ingreso en la fecha prevista', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (24, 'Hubo  comunicación  constantemente con su coordinación', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (25, 'Entregó los resultados de las evaluaciones (cohortes)  en el lapso indicado para ello', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (26, 'Mantuvo una actitud y conducta respetuosa y ética ante colegas, coordinadores y autoridades de la institución', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (27, 'Contribuyó al mantenimiento de la disciplina, moral y buenas costumbres dentro de la institución', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (28, 'Veló por el adecuado uso, y mantenimiento  de las instalaciones, equipos y  bienes de la institución', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (29, 'Se preocupo por el rendimiento de su grupo de clase en interacción con su coordinación', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (30, 'Atendió consultas de los estudiantes fuera de su horario de clases', 'coordinadores', 3, 'I');
INSERT INTO aspectosevaluativos VALUES (31, 'Evaluacion Definitiva', 'coordinadores', 3, 'A');
INSERT INTO aspectosevaluativos VALUES (33, 'Mantiene una actitud cordial y respetuosa hacia los estudiantes', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (34, 'Fomenta la disciplina en el curso', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (35, 'La presentación personal está de acuerdo a su función docente', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (36, 'Enuncia el contenido del objetivo, explicando claramente las actividades a desarrollar durante la clase', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (37, 'Se expresa con voz clara (entonación, velocidad y pronunciación adecuada) ', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (38, 'Da ejemplos concretos con experiencias o vivencias los relaciona con el perfil de la carrera', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (39, 'Relaciona los contenidos con el perfil de la carrera', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (40, 'Explica, amplia y deja claro los puntos de la clase', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (41, 'Verifica durante la clase si los estudiantes comprenden lo explicado', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (42, 'Asiste puntualmente  a la clase del día de hoy', 'acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (43, 'Cumple con el protocolo de aula', 'acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (44, 'Propicia la participación de los alumnos en clase', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (45, 'Está atento al desempeño (conducta y comportamiento) de los estudiantes durante la clase', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (46, 'Muestra buena disposición ante las preguntas realizadas por los estudiantes', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (47, 'Responde con precisión y seguridad a las preguntas formuladas por los estudiantes ', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (48, 'Utiliza Instrumentos de evaluación ', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (49, 'Utiliza recursos para la enseñanza (pizarrón, retroproyector, rotafolio, laptop, video bean, video conferencia entre otros) o material de apoyo (gráficos, lámin', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (50, 'Hace uso correcto de los recursos y/o del material de apoyo', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (51, 'Propicia el uso de las técnicas de información y comunicación (TIC) correo electrónico', 'Acompañamieto', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (52, 'Destaca y resume lo más importante', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (53, 'Indica brevemente los puntos a tratar en la próxima clase', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (54, 'Señala material bibliográfico para realizar lecturas, investigaciones, resolución de problemas, entre otras actividades', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (55, 'Presenta la planificación sellada y firmada por la Coordinación de Planificación y Evaluación', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (56, 'Existe correspondencia entre la planificación entregada a la coordinación y la sesión de clase evaluada', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (57, 'Lleva debidamente organizado los recaudos administrativos', 'Acompañamiento', 4, 'I');
INSERT INTO aspectosevaluativos VALUES (58, 'Asiste puntualmente en el horario establecido', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (59, 'Promueve el cumplimiento  del protocolo del aula', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (60, 'Existe relación entre la programación presentada y los objetivos de la asignatura', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (61, 'Motiva a los alumnos para insertarlos en cada tema de estudio', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (62, 'Demuestra dominio de los contenidos propios de la asignatura', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (63, 'Es atento y cordial en el trato con los alumnos', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (64, 'Realiza sus intervenciones con claridad', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (65, 'El docente utiliza y promueve el material didactico elaborado por la institución', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (66, 'Utiliza el portafolio como estrategia de evaluación ', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (67, 'Demuestra disposición para mejorar el rendimiento de los alumnos', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (68, 'Asesora académicamente a los estudiantes durante el desarrollo de la asignatura', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (69, 'Responde dudas o preguntas durante el desarrollo de la asignatura', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (70, 'Utiliza los recursos que ofrecen las tecnologías de la información y comunicación', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (71, 'Facilita la adquisición de los recursos bibliográficos a los alumnos', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (72, 'El plan de evaluación de la asignatura fue acordado entre docente y alumnos', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (73, 'Entrega los resultados de las evaluaciones a los estudiantes a tiempo', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (74, 'La presentación personal del docente va de acuerdo a las normas de la institución', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (75, 'Utiliza material didáctico complementario de producción propia', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (76, 'Suministra información coherente con los contenidos de la asignatura', 'Estudiantes', 2, 'I');
INSERT INTO aspectosevaluativos VALUES (77, 'Adapta las estrategias instruccionales a  la naturaleza de la asignatura.', 'Estudiantes', 2, 'I');


--
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO bitacora VALUES (1846, '2014-11-14', '03:20:00', 'Tabla_A_Editar', '', 'D15341271');
INSERT INTO bitacora VALUES (1847, '2014-11-14', '03:24:00', 'Tabla_A_Editar', '', 'D15341271');
INSERT INTO bitacora VALUES (1848, '2014-11-14', '03:17:00', 'Servidor', '', 'D15341271');
INSERT INTO bitacora VALUES (1849, '2014-11-14', '03:34:00', 'Servidor', '', 'D15341271');
INSERT INTO bitacora VALUES (1850, '2014-11-14', '03:36:00', 'Servidor', '', 'D15341271');
INSERT INTO bitacora VALUES (1851, '2014-11-14', '03:11:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=4, caducidad_clave=31, Tiempo_inactividad=200, cantidad_preguntas=2, cantidad_respuestas=1 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (1852, '2014-11-14', '03:37:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=300, cantidad_preguntas=2, cantidad_respuestas=1 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (1853, '2014-11-14', '08:53:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA fecha_nac=01-11-1927, lugar_naci=BARINAS edociv=V, sexo=F telefono=0255-6143127, c_electronico= idciudad=1, direccionesp= WHERE (cedula=-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1854, '2014-11-14', '08:20:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA fecha_nac=01-11-1927, lugar_naci=BARINAS edociv=V, sexo=F telefono=0255-6143127, c_electronico= idciudad=1, direccionesp= WHERE (cedula=-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1855, '2014-11-14', '08:09:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA fecha_nac=01-11-1927, lugar_naci=BARINAS edociv=V, sexo=F telefono=0255-6143127, c_electronico=, idciudad=1, direccionesp= WHERE (cedula=-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1856, '2014-11-14', '08:10:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1927, lugar_naci=BARINAS, edociv=V, sexo=F, telefono=0255-6143127, c_electronico=, idciudad=1, direccionesp= WHERE (cedula=-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1857, '2014-11-14', '09:54:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1927, lugar_naci=BARINAS, edociv=V, sexo=F, telefono=0255-6143127, c_electronico=, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1858, '2014-11-14', '09:42:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1927, lugar_naci=BARINAS, edociv=V, sexo=F, telefono=0255-6143127, c_electronico=, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=V-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1859, '2014-11-14', '09:18:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1927, lugar_naci=BARINAS, edociv=V, sexo=F, telefono=0255-6143127, c_electronico=RAFAELA@TESTING-CASE.COM.VE, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=V-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1860, '2014-11-14', '09:19:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1928, lugar_naci=BARINAS, edociv=V, sexo=F, telefono=0255-6143127, c_electronico=RAFAELA@TESTING-CASE.COM.VE, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=V-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1861, '2014-11-14', '09:10:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1927, lugar_naci=NUTRIAS, edociv=V, sexo=F, telefono=0424-5712321, c_electronico=RAFAELA@TESTING-CASE.COM.VE, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=V-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1862, '2014-11-14', '09:06:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1928, lugar_naci=NUTRIAS, edociv=V, sexo=F, telefono=0424-5712321, c_electronico=RAFAELA@TESTING-CASE.COM.VE, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=V-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1879, '2014-11-14', '11:30:00', 'Persona', 'UPDATE persona SET  nombre1=RAFAELA, nombre2=MARIA, apellido1=HERRERA, apellido2=PARRA, fecha_nac=01-11-1927, lugar_naci=NUTRIAS, edociv=V, sexo=F, telefono=0424-5712321, c_electronico=RAFAELA@TESTING-CASE.COM.VE, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=V-1988857)', 'D1988857');
INSERT INTO bitacora VALUES (1880, '2014-11-14', '11:30:00', 'Usuario', 'UPDATE usuario SET contrasena=fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2, estatus=A WHERE nombre=D1988857', 'D1988857');
INSERT INTO bitacora VALUES (1881, '2014-11-14', '11:30:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D1988857,fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2,2014/11/14)', 'D1988857');
INSERT INTO bitacora VALUES (1882, '2014-11-14', '11:30:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=D1988857', 'D1988857');
INSERT INTO bitacora VALUES (1883, '2014-11-14', '11:30:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D1988857,,)', 'D1988857');
INSERT INTO bitacora VALUES (1884, '2014-11-14', '11:30:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D1988857,¿NOMBRE DE TU MASCOTA?,MURRUNGO)', 'D1988857');
INSERT INTO bitacora VALUES (1885, '2014-11-14', '11:02:00', 'Persona', 'UPDATE persona SET  nombre1=ANA, nombre2=GABRIELA, apellido1=LEON, apellido2=PUENTES, fecha_nac=07-07-1981, lugar_naci=BARINAS, edociv=S, sexo=F, telefono=0412-5246399, c_electronico=ANYGABY@HOTMAIL.COM, idciudad=1, direccionesp=AGUA CLARA WHERE (cedula=V-15341271)', 'D15341271');
INSERT INTO bitacora VALUES (1886, '2014-11-14', '11:02:00', 'Usuario', 'UPDATE usuario SET contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A WHERE nombre=D15341271', 'D15341271');
INSERT INTO bitacora VALUES (1887, '2014-11-14', '11:02:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/11/14)', 'D15341271');
INSERT INTO bitacora VALUES (1888, '2014-11-14', '11:02:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=D15341271', 'D15341271');
INSERT INTO bitacora VALUES (1889, '2014-11-14', '11:02:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D15341271,¿NOMBRE DE MI HIJA?,VERONICA)', 'D15341271');
INSERT INTO bitacora VALUES (1890, '2014-11-14', '11:02:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D15341271,¿SEGUNDO NOMBRE DE MI HIJA?,ANDREYNA)', 'D15341271');
INSERT INTO bitacora VALUES (1891, '2014-11-15', '12:42:00', 'Usuario', 'UPDATE usuario SET  contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', 'D1988857');
INSERT INTO bitacora VALUES (1892, '2014-11-15', '12:42:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D1988857,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2014/11/15)', 'D1988857');
INSERT INTO bitacora VALUES (1893, '2014-11-15', '07:43:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,fecha_nac,lugar_naci,edociv,sexo,telefono,c_electronico,idciudad) VALUES (V-20847202,JORGE,ANTONIO,CERPA,PLAZA,07-06-1991,MERIDA,S,M,0412-6779231,JORENCERCAS@HOTMAIL.COM,1)', 'D15341271');
INSERT INTO bitacora VALUES (1894, '2014-11-15', '07:43:00', 'Estudiante', 'INSERT INTO alumno (cedula_est_pre,fecing,codesp,semestre,idpensum,lugar_est,codigo_rusnies,tipo_retiro,condicion,tipo_persona,indice_general,etnia_indig,discapacidad,estatus) VALUES (V-20847202,15/11/2014,10,1,2,,,Null,1,I,Null,NO  TIENE,NO TIENE,A)', 'D15341271');
INSERT INTO bitacora VALUES (2087, '2014-11-27', '03:27:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E20025035,¿COMO SE LLAMA MI PERRO?,CANABIS)', 'E20025035');
INSERT INTO bitacora VALUES (1895, '2014-11-15', '07:43:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (D20847202,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,3,V-20847202)', 'D15341271');
INSERT INTO bitacora VALUES (1896, '2014-11-18', '01:06:00', 'Tabla_A_Editar', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (43,CONFIGURACION,A,4,1,vis_Servidor.php)', 'D15341271');
INSERT INTO bitacora VALUES (1897, '2014-11-18', '01:39:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (1898, '2014-11-18', '01:15:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (1899, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (1900, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (1901, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (1902, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (1903, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (1904, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (1905, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (1906, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (1907, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (1908, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (1909, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (1910, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (1911, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (1912, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (1913, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (1914, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (1915, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (1916, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (1917, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (1918, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (1919, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (1920, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (1921, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (1922, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (1923, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (1924, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (1925, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (1926, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (1927, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (1928, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (1929, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (1930, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (1931, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (1932, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (1933, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2281, '2015-02-17', '06:52:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=16', 'D15341271');
INSERT INTO bitacora VALUES (1934, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (1935, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (1936, '2014-11-18', '01:15:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (1937, '2014-11-18', '02:03:00', 'Tabla_A_Editar', 'UPDATE submodulo SET sub_nombre=CONFIGURACION,sub_estatus=A,fk_mod_codigo=4,sub_tipo=1,sub_ruta=vis_Servidor.php?buscar WHERE (sub_codigo=43)', 'D15341271');
INSERT INTO bitacora VALUES (1939, '2014-11-18', '06:18:00', 'Usuario', 'UPDATE usuario SET  contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (1940, '2014-11-18', '06:18:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/11/18)', 'D15341271');
INSERT INTO bitacora VALUES (1941, '2014-11-19', '05:20:00', 'Usuario', 'UPDATE usuario SET  contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (1942, '2014-11-19', '05:20:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2014/11/19)', 'D15341271');
INSERT INTO bitacora VALUES (1943, '2014-11-19', '05:01:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,fecha_nac,lugar_naci,edociv,sexo,telefono,c_electronico,idciudad) VALUES (V-1234567,VIC,MAN,LE,ON,07-06-1991,BARINAS,S,M,0255-6143127,JORENCERCAS@HOTMAIL.COM,1)', 'D15341271');
INSERT INTO bitacora VALUES (1944, '2014-11-19', '05:01:00', 'Estudiante', 'INSERT INTO alumno (cedula_est_pre,fecing,codesp,semestre,idpensum,lugar_est,codigo_rusnies,tipo_retiro,condicion,tipo_persona,indice_general,etnia_indig,discapacidad,estatus) VALUES (V-1234567,19/11/2014,10,1,2,,,Null,1,I,Null,NO TIENE,NO TIENE ,A)', 'D15341271');
INSERT INTO bitacora VALUES (1945, '2014-11-19', '05:01:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (E1234,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,3,V-1234567)', 'D15341271');
INSERT INTO bitacora VALUES (1946, '2014-11-21', '01:29:00', 'Tabla_A_Editar', 'UPDATE submodulo SET sub_nombre=CONFIGURACION,sub_estatus=A,fk_mod_codigo=4,sub_tipo=2,sub_ruta=vis_ServConf.php?buscar WHERE (sub_codigo=43)', 'D15341271');
INSERT INTO bitacora VALUES (1947, '2014-11-21', '01:46:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=4, caducidad_clave=30, Tiempo_inactividad=300, cantidad_preguntas=2, cantidad_respuestas=1 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (1948, '2014-11-21', '01:12:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=01-01-2014,fecha_fin=06-06-2014,estatus=I,nombre=2013-I WHERE peraca=1', 'D15341271');
INSERT INTO bitacora VALUES (1949, '2014-11-21', '01:39:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=01-01-2012,fecha_fin=01-05-2012,estatus=A,nombre=2012-I WHERE peraca=2', 'D15341271');
INSERT INTO bitacora VALUES (1950, '2014-11-22', '07:46:00', 'Usuario', 'UPDATE usuario SET  contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (1987, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (1951, '2014-11-22', '07:46:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2014/11/22)', 'D15341271');
INSERT INTO bitacora VALUES (1952, '2014-11-22', '07:13:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2) VALUES(-21060661,ELISA,ANDREA,VARGAS,ALVARADO)', 'D15341271');
INSERT INTO bitacora VALUES (1953, '2014-11-22', '07:13:00', 'Administrativo', 'INSERT INTO administrativo (cedula_admin,estatus,borrado) VALUES(-21060661,A,I)', 'D15341271');
INSERT INTO bitacora VALUES (1954, '2014-11-22', '07:13:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (A21060661,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,1,-21060661)', 'D15341271');
INSERT INTO bitacora VALUES (1955, '2014-11-22', '08:39:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2) VALUES(V-21060661,ELISA,ANDREA,VARGAS,ALVARADO)', 'D15341271');
INSERT INTO bitacora VALUES (1956, '2014-11-22', '08:39:00', 'Administrativo', 'INSERT INTO administrativo (cedula_admin,estatus,borrado) VALUES(V-21060661,A,I)', 'D15341271');
INSERT INTO bitacora VALUES (1957, '2014-11-22', '08:39:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (A21060661,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,1,V-21060661)', 'D15341271');
INSERT INTO bitacora VALUES (1958, '2014-11-22', '09:20:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2) VALUES(V-21059293,BORRADOR,,BORRADOR,)', 'D15341271');
INSERT INTO bitacora VALUES (1959, '2014-11-22', '09:20:00', 'Docente', 'INSERT INTO docente (cedula_doc,estatus,borrado) VALUES(V-21059293,A,I)', 'D15341271');
INSERT INTO bitacora VALUES (1960, '2014-11-22', '09:20:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (D21059293,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2,V-21059293)', 'D15341271');
INSERT INTO bitacora VALUES (1961, '2014-11-22', '09:37:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2) VALUES(V-21060662,AAAAAAAAAAA,,AAAAAAAAAA,)', 'D15341271');
INSERT INTO bitacora VALUES (1962, '2014-11-22', '09:37:00', 'Administrativo', 'INSERT INTO administrativo (cedula_admin,estatus,borrado) VALUES(V-21060662,A,I)', 'D15341271');
INSERT INTO bitacora VALUES (1963, '2014-11-22', '09:37:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (A21060662,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,1,V-21060662)', 'D15341271');
INSERT INTO bitacora VALUES (1964, '2014-11-22', '01:03:00', 'Usuario', 'UPDATE usuario SET  contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (1965, '2014-11-22', '01:03:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/11/22)', 'D15341271');
INSERT INTO bitacora VALUES (1966, '2014-11-22', '01:32:00', 'Usuario', 'UPDATE usuario SET  contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A  WHERE nombre=D15341271 ', '');
INSERT INTO bitacora VALUES (1967, '2014-11-22', '01:32:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2014/11/22)', '');
INSERT INTO bitacora VALUES (2088, '2014-11-27', '03:27:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E20025035,¿COMO SE LLAMA MI TIA?,ALBA)', 'E20025035');
INSERT INTO bitacora VALUES (1968, '2014-11-22', '01:55:00', 'Usuario', 'UPDATE usuario SET  contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A  WHERE nombre=D15341271 ', '');
INSERT INTO bitacora VALUES (1969, '2014-11-22', '01:55:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/11/22)', '');
INSERT INTO bitacora VALUES (1970, '2014-11-22', '01:01:00', 'Usuario', 'UPDATE usuario SET  contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A  WHERE nombre=D15341271 ', '');
INSERT INTO bitacora VALUES (1971, '2014-11-22', '01:01:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2014/11/22)', '');
INSERT INTO bitacora VALUES (1972, '2014-11-22', '01:54:00', 'Usuario', 'UPDATE usuario SET  contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A  WHERE nombre=D15341271 ', '');
INSERT INTO bitacora VALUES (1973, '2014-11-22', '01:54:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2014/11/22)', '');
INSERT INTO bitacora VALUES (1974, '2014-11-26', '03:54:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (1975, '2014-11-26', '03:42:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (1976, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (1977, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (1978, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (1979, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (1980, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (1981, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (1982, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (1983, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (1984, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (1985, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (1986, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (1988, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (1989, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (1990, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (1991, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (1992, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (1993, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (1994, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (1995, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (1996, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (1997, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (1998, '2014-11-26', '03:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (1999, '2014-11-26', '03:41:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2000, '2014-11-26', '03:50:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2001, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2002, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2003, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2004, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2005, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2006, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (3292, '2015-05-20', '04:13:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2007, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2008, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2009, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2010, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2011, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2012, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2013, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2014, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2015, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2016, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2017, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2018, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2019, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2020, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2021, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2022, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2023, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2024, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2025, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2026, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2027, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2028, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2029, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2030, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2031, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2032, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2033, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2034, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2035, '2014-11-26', '03:57:00', 'Carrera', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=E17945456)', 'D15341271');
INSERT INTO bitacora VALUES (2036, '2014-11-26', '03:58:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(2,E17945456)', 'D15341271');
INSERT INTO bitacora VALUES (2037, '2014-11-26', '03:00:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-20025035) AND (peraca=2) AND (pm_codigo=160)', 'E20025035');
INSERT INTO bitacora VALUES (2038, '2014-11-26', '03:00:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-20025035) AND (peraca=2) AND (pm_codigo=163)', 'E20025035');
INSERT INTO bitacora VALUES (2039, '2014-11-26', '03:00:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-20025035) AND (peraca=2) AND (pm_codigo=164)', 'E20025035');
INSERT INTO bitacora VALUES (2040, '2014-11-26', '03:00:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-20025035) AND (peraca=2) AND (pm_codigo=162)', 'E20025035');
INSERT INTO bitacora VALUES (2041, '2014-11-26', '03:00:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-20025035) AND (peraca=2) AND (pm_codigo=165)', 'E20025035');
INSERT INTO bitacora VALUES (2042, '2014-11-26', '04:10:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (11,2,11-11-2014,11-10-2015,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (2043, '2014-11-26', '03:45:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2044, '2014-11-26', '03:50:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2045, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2046, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2047, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2089, '2014-11-27', '03:58:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2014-11-27,15:15:58,160,2)', 'E20025035');
INSERT INTO bitacora VALUES (2048, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2049, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2050, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2051, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2052, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2053, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2054, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2055, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2056, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2057, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2058, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2059, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2060, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2061, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2062, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2063, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2064, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2065, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2066, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2067, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2068, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2069, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2070, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2071, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2072, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2073, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2074, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2075, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2076, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2077, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2078, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2079, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2080, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2081, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2082, '2014-11-26', '03:50:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2083, '2014-11-27', '03:27:00', 'Persona', 'UPDATE persona SET  nombre1=EFRAIN, nombre2=JOSE, apellido1=MENDOZA, apellido2=TOVAR, fecha_nac=03-03-1991, lugar_naci=ACARIGUA, edociv=S, sexo=M, telefono=00000000, c_electronico=@NOMELOSE, idciudad=1, direccionesp=DURIGUA WHERE (cedula=V-20025035)', 'E20025035');
INSERT INTO bitacora VALUES (2084, '2014-11-27', '03:27:00', 'Usuario', 'UPDATE usuario SET contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A WHERE nombre=E20025035', 'E20025035');
INSERT INTO bitacora VALUES (2085, '2014-11-27', '03:27:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(E20025035,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/11/27)', 'E20025035');
INSERT INTO bitacora VALUES (2086, '2014-11-27', '03:27:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=E20025035', 'E20025035');
INSERT INTO bitacora VALUES (2090, '2014-11-27', '03:58:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2014-11-27,15:15:58,164,2)', 'E20025035');
INSERT INTO bitacora VALUES (2091, '2014-11-27', '03:58:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2014-11-27,15:15:58,165,2)', 'E20025035');
INSERT INTO bitacora VALUES (2092, '2014-11-27', '03:58:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2014-11-27,15:15:58,163,2)', 'E20025035');
INSERT INTO bitacora VALUES (2093, '2014-12-01', '05:10:00', 'Departamento', 'INSERT INTO departamento (dep_nombre,dep_status)VALUES(INFORMATICA,A)', 'D15341271');
INSERT INTO bitacora VALUES (2094, '2014-12-01', '05:50:00', 'Tabla_A_Editar', 'INSERT INTO modulo (mod_codigo,mod_nombre,mod_estatus,mod_color)VALUES (12,AUDITORIA,A,#36B128)', 'D15341271');
INSERT INTO bitacora VALUES (2095, '2014-12-01', '05:39:00', 'Tabla_A_Editar', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (100,BITACORA,A,12,1,vis_ServConf.php)', 'D15341271');
INSERT INTO bitacora VALUES (2096, '2014-12-01', '05:19:00', 'cargo', 'INSERT INTO cargo (car_nombre,car_status,fk_dep_codigo)VALUES(COORDINADOR DE INFORMATICA,A,5)', 'D15341271');
INSERT INTO bitacora VALUES (2097, '2014-12-01', '05:16:00', 'Carrera', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D15341271)', 'D15341271');
INSERT INTO bitacora VALUES (2098, '2014-12-01', '05:16:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(3,D15341271)', 'D15341271');
INSERT INTO bitacora VALUES (2099, '2014-12-01', '05:51:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2100, '2014-12-01', '05:38:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2101, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2102, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2103, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2104, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2105, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2106, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2107, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2108, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2109, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2110, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2111, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2112, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2113, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2114, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2115, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2116, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2117, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2118, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2119, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2120, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2121, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2122, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2123, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2124, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2125, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2126, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2127, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2128, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2129, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2130, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2131, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2132, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2133, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2134, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2135, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2136, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2137, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2138, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2139, '2014-12-01', '05:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2140, '2014-12-01', '05:07:00', 'Usuario', 'UPDATE usuario SET  contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A  WHERE nombre=D15341271 ', '');
INSERT INTO bitacora VALUES (2141, '2014-12-01', '05:07:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/12/01)', '');
INSERT INTO bitacora VALUES (2142, '2014-12-01', '05:42:00', 'Persona', 'UPDATE persona SET  nombre1=EFRAIN, nombre2=JOSE, apellido1=MENDOZA, apellido2=TOVAR, fecha_nac=20-03-1992, lugar_naci=ACARIGUA, edociv=S, sexo=M, telefono=00000000, c_electronico=@NOMELOSE, idciudad=1, direccionesp=DURIGUA WHERE (cedula=V-20025035)', 'E20025035');
INSERT INTO bitacora VALUES (2143, '2014-12-01', '05:42:00', 'Usuario', 'UPDATE usuario SET contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A WHERE nombre=E20025035', 'E20025035');
INSERT INTO bitacora VALUES (2144, '2014-12-01', '05:42:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(E20025035,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/12/01)', 'E20025035');
INSERT INTO bitacora VALUES (2145, '2014-12-01', '05:42:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=E20025035', 'E20025035');
INSERT INTO bitacora VALUES (2146, '2014-12-01', '05:42:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E20025035,¿NOMBRE DE MI PERRO?,MIA)', 'E20025035');
INSERT INTO bitacora VALUES (2147, '2014-12-01', '05:42:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E20025035,¿NOMBRE DE MADRE?,ESTANISLAA)', 'E20025035');
INSERT INTO bitacora VALUES (2148, '2014-12-01', '06:28:00', 'Usuario', 'UPDATE usuario SET  contrasena=fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (2149, '2014-12-01', '06:28:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2,2014/12/01)', 'D15341271');
INSERT INTO bitacora VALUES (2150, '2014-12-01', '06:30:00', 'Usuario', 'UPDATE usuario SET  contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (2151, '2014-12-01', '06:30:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2014/12/01)', 'D15341271');
INSERT INTO bitacora VALUES (2152, '2014-12-01', '12:13:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=2, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2153, '2015-01-14', '05:46:00', 'Usuario', 'UPDATE usuario SET  contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A  WHERE nombre=A4925159 ', 'A4925159');
INSERT INTO bitacora VALUES (2154, '2015-01-14', '05:46:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(A4925159,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2015/01/14)', 'A4925159');
INSERT INTO bitacora VALUES (2155, '2015-01-14', '05:35:00', 'Persona', 'UPDATE persona SET  nombre1=ANA, nombre2=ISABEL, apellido1=PUENTES, apellido2=HERRERA, fecha_nac=23-04-1959, lugar_naci=BARINAS, edociv=C, sexo=M, telefono=, c_electronico=ANAYSAP@GAMIL.COM, idciudad=1, direccionesp= WHERE (cedula=V-4925159)', 'A4925159');
INSERT INTO bitacora VALUES (2156, '2015-01-14', '05:35:00', 'Usuario', 'UPDATE usuario SET contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A WHERE nombre=A4925159', 'A4925159');
INSERT INTO bitacora VALUES (2157, '2015-01-14', '05:35:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(A4925159,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2015/01/14)', 'A4925159');
INSERT INTO bitacora VALUES (2158, '2015-01-14', '05:35:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=A4925159', 'A4925159');
INSERT INTO bitacora VALUES (2159, '2015-01-14', '05:35:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A4925159,ASDF,ASDF)', 'A4925159');
INSERT INTO bitacora VALUES (2160, '2015-01-14', '05:35:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A4925159,ASD,DASD)', 'A4925159');
INSERT INTO bitacora VALUES (2161, '2015-01-14', '05:04:00', 'Persona', 'UPDATE persona SET  nombre1=ANA, nombre2=YSABEL, apellido1=PUENTES, apellido2=HERRERA, fecha_nac=23-04-1959, lugar_naci=BARINAS, edociv=C, sexo=M, telefono=, c_electronico=ANAYSAP@GAMIL.COM, idciudad=1, direccionesp= WHERE (cedula=V-4925159)', 'A4925159');
INSERT INTO bitacora VALUES (2162, '2015-01-14', '05:04:00', 'Usuario', 'UPDATE usuario SET contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A WHERE nombre=A4925159', 'A4925159');
INSERT INTO bitacora VALUES (2163, '2015-01-14', '05:04:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(A4925159,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2015/01/14)', 'A4925159');
INSERT INTO bitacora VALUES (2164, '2015-01-14', '05:04:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=A4925159', 'A4925159');
INSERT INTO bitacora VALUES (2165, '2015-01-14', '05:04:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A4925159,NOMBRE COMPLETO?,ANA YSABEL)', 'A4925159');
INSERT INTO bitacora VALUES (2166, '2015-01-14', '05:04:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A4925159,NOMBRE IMCOMPLETO?,YSA)', 'A4925159');
INSERT INTO bitacora VALUES (2167, '2015-01-19', '03:26:00', 'Persona', 'UPDATE persona SET  nombre1=ANA, nombre2=YSABEL, apellido1=PUENTES, apellido2=HERRERA, fecha_nac=23-04-1959, lugar_naci=BARINAS, edociv=C, sexo=M, telefono=, c_electronico=ANAYSAP@GAMIL.COM, idciudad=1, direccionesp= WHERE (cedula=V-4925159)', 'A4925159');
INSERT INTO bitacora VALUES (2168, '2015-01-19', '03:26:00', 'Usuario', 'UPDATE usuario SET contrasena=fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2, estatus=A WHERE nombre=A4925159', 'A4925159');
INSERT INTO bitacora VALUES (2169, '2015-01-19', '03:26:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(A4925159,fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2,2015/01/19)', 'A4925159');
INSERT INTO bitacora VALUES (2170, '2015-01-19', '03:26:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=A4925159', 'A4925159');
INSERT INTO bitacora VALUES (2171, '2015-01-19', '03:26:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A4925159,¿NOMBRE COMPLETO?,ANA YSABEL)', 'A4925159');
INSERT INTO bitacora VALUES (2172, '2015-01-19', '03:26:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A4925159,¿NOMBRE IMCOMPLETO?,YSA)', 'A4925159');
INSERT INTO bitacora VALUES (2173, '2015-01-19', '03:45:00', 'Persona', 'UPDATE persona SET  nombre1=VICTOR, nombre2=MANUEL, apellido1=LEON, apellido2=PUENTES, fecha_nac=06-06-1991, lugar_naci=ACARIGUA, edociv=S, sexo=M, telefono=0255-6143127, c_electronico=VRINOX@HOTMAIL.COM, idciudad=1, direccionesp=ACARIGUA WHERE (cedula=V-21057251)', 'D21057251');
INSERT INTO bitacora VALUES (2174, '2015-01-19', '03:45:00', 'Usuario', 'UPDATE usuario SET contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A WHERE nombre=D21057251', 'D21057251');
INSERT INTO bitacora VALUES (2175, '2015-01-19', '03:45:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D21057251,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2015/01/19)', 'D21057251');
INSERT INTO bitacora VALUES (2176, '2015-01-19', '03:45:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=D21057251', 'D21057251');
INSERT INTO bitacora VALUES (2177, '2015-01-19', '03:45:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D21057251,¿NOMBRE DE TU MADRE?,ANA YSABEL)', 'D21057251');
INSERT INTO bitacora VALUES (2178, '2015-01-19', '03:45:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D21057251,¿NOMBRE DE TU PERRO?,HUNTER)', 'D21057251');
INSERT INTO bitacora VALUES (2179, '2015-01-19', '04:15:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=01-01-2012,fecha_fin=01-05-2012,estatus=I,nombre=2012-I WHERE peraca=2', 'D15341271');
INSERT INTO bitacora VALUES (2180, '2015-01-19', '04:42:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=01-01-2014,fecha_fin=06-06-2015,estatus=A,nombre=2013-I WHERE peraca=1', 'D15341271');
INSERT INTO bitacora VALUES (2181, '2015-02-06', '10:35:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (1,,P,reingreso por 2 años de inactividad,-,-', 'E20025035');
INSERT INTO bitacora VALUES (2182, '2015-02-06', '10:33:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (1,,P,reingreso por 2 años de inactividad,Null,-', 'E20025035');
INSERT INTO bitacora VALUES (2183, '2015-02-06', '10:57:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (1,,P,reingreso por 2 años de inactividad,Null,14', 'E20025035');
INSERT INTO bitacora VALUES (2184, '2015-02-06', '10:25:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (1,,P,reingreso por 2 años de inactividad,Null,14', 'E20025035');
INSERT INTO bitacora VALUES (2185, '2015-02-06', '10:09:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (&#039;1&#039;,&#039;&#039;,&#039;P&#039;,&#039;reingreso por 2 a&ntilde;os de inactividad&#039;,Null,&#039;14&#039;', 'E20025035');
INSERT INTO bitacora VALUES (2186, '2015-02-06', '10:46:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (&#039;1&#039;,&#039;&#039;,&#039;P&#039;,&#039;reingreso por 2 a&ntilde;os de inactividad&#039;,Null,&#039;14&#039;', 'E20025035');
INSERT INTO bitacora VALUES (2187, '2015-02-06', '10:09:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (&#039;1&#039;,&#039;&#039;,&#039;P&#039;,&#039;reingreso por 2 a&ntilde;os de inactividad&#039;,Null,&#039;14&#039;)', 'E20025035');
INSERT INTO bitacora VALUES (2188, '2015-02-06', '10:29:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (1,,P,reingreso por 2 años de inactividad,Null,14)', 'E20025035');
INSERT INTO bitacora VALUES (2189, '2015-02-06', '11:25:00', 'Solicitud', 'INSERT INTO solicitud (idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (1,,P,reingreso por 2 años de inactividad,Null,14)', 'E20025035');
INSERT INTO bitacora VALUES (2190, '2015-02-06', '11:54:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (V-20025035,1,,P,cambio por 2 años de inactividad,Null,19)', 'E20025035');
INSERT INTO bitacora VALUES (2191, '2015-02-06', '11:00:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (V-20025035,1,,P,por chinkunguya,Null,Null)', 'E20025035');
INSERT INTO bitacora VALUES (2192, '2015-02-06', '11:00:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp)VALUES (V-20025035,1,,P,por chinkunguya,Null,Null)', 'E20025035');
INSERT INTO bitacora VALUES (2193, '2015-02-09', '10:42:00', 'Persona', 'UPDATE persona SET  nombre1=MARIA, nombre2=DODOBUTO, apellido1=JOSE, apellido2=GONZALEZ, fecha_nac=03-01-1991, lugar_naci=ACARIGUA, edociv=S, sexo=F, telefono=0414-5171640, c_electronico=VRINOX@HOTMAIL.COM, idciudad=1, direccionesp=EL PILAR WHERE (cedula=V-21057252)', 'E21057252');
INSERT INTO bitacora VALUES (2194, '2015-02-09', '10:42:00', 'Usuario', 'UPDATE usuario SET contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A WHERE nombre=E21057252', 'E21057252');
INSERT INTO bitacora VALUES (2195, '2015-02-09', '10:42:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(E21057252,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2015/02/09)', 'E21057252');
INSERT INTO bitacora VALUES (2196, '2015-02-09', '10:42:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=E21057252', 'E21057252');
INSERT INTO bitacora VALUES (2197, '2015-02-09', '10:42:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E21057252,YO NOSE ¿TU SABES?,NO)', 'E21057252');
INSERT INTO bitacora VALUES (2198, '2015-02-09', '10:42:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E21057252,PUES NI IDEA ¿Y TU?,IGUAL)', 'E21057252');
INSERT INTO bitacora VALUES (2199, '2015-02-09', '10:39:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2200, '2015-02-09', '10:45:00', 'Persona', 'UPDATE persona SET  nombre1=MARIA, nombre2=JOSE, apellido1=COLMENAREZ, apellido2=COLMENAREZ, fecha_nac=01-01-1991, lugar_naci=ACARIGUA, edociv=S, sexo=F, telefono=0414-5171639, c_electronico=VRINOX@HOTMAIL.COM, idciudad=1, direccionesp=MOLINOS WHERE (cedula=V-21057253)', 'E21057253');
INSERT INTO bitacora VALUES (2201, '2015-02-09', '10:45:00', 'Usuario', 'UPDATE usuario SET contrasena=2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8, estatus=A WHERE nombre=E21057253', 'E21057253');
INSERT INTO bitacora VALUES (2202, '2015-02-09', '10:45:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(E21057253,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2015/02/09)', 'E21057253');
INSERT INTO bitacora VALUES (2203, '2015-02-09', '10:45:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=E21057253', 'E21057253');
INSERT INTO bitacora VALUES (2204, '2015-02-09', '10:45:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E21057253,¿NOMBRE DE TU PRIMO?,JHON)', 'E21057253');
INSERT INTO bitacora VALUES (2205, '2015-02-09', '10:45:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E21057253,¿NOMBRE DE TU TIA?,ALBA)', 'E21057253');
INSERT INTO bitacora VALUES (2206, '2015-02-09', '10:45:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(E21057253,¿TU PRIMER NOMBRE?,EFRAIN)', 'E21057253');
INSERT INTO bitacora VALUES (2207, '2015-02-11', '12:37:00', 'Usuario', 'UPDATE usuario SET  contrasena=80f598a0022f00738ad71a6873c1e846c6657a473d84e3268e97e03597ccc352b45e660c6bd6c5014731297c17147a002711a9d4821e76f87a27d18f298167c8, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (2208, '2015-02-11', '12:37:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,80f598a0022f00738ad71a6873c1e846c6657a473d84e3268e97e03597ccc352b45e660c6bd6c5014731297c17147a002711a9d4821e76f87a27d18f298167c8,2015/02/11)', 'D15341271');
INSERT INTO bitacora VALUES (2209, '2015-02-11', '04:59:00', 'Periodo Academico', 'INSERT INTO peraca (peraca,fecha_ini,fecha_fin,estatus,nombre,borrado)  VALUES (4,2015-01-19,2015-05-19,I,2015-I,I)', 'D15341271');
INSERT INTO bitacora VALUES (2210, '2015-02-11', '08:24:00', 'Usuario', 'UPDATE usuario SET  contrasena=d23054175dec77d75b9a34c1fa89539f08da3551ddf3b492778d4e5546e022d5f859aa6fde9391fb55a90d62ecd0db3c02291672455123c24e11e2755c7052e6, estatus=A  WHERE nombre=D20041540 ', 'D20041540');
INSERT INTO bitacora VALUES (2211, '2015-02-11', '08:24:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D20041540,d23054175dec77d75b9a34c1fa89539f08da3551ddf3b492778d4e5546e022d5f859aa6fde9391fb55a90d62ecd0db3c02291672455123c24e11e2755c7052e6,2015/02/11)', 'D20041540');
INSERT INTO bitacora VALUES (2212, '2015-02-11', '08:07:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-01,estatus=A,nombre=2015-I WHERE peraca=1', 'D15341271');
INSERT INTO bitacora VALUES (2213, '2015-02-11', '08:34:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (15,1,2015-02-01,2015-01-31,A,6)', 'D15341271');
INSERT INTO bitacora VALUES (2214, '2015-02-11', '08:02:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (16,1,2015-02-01,2015-02-20,A,6)', 'D15341271');
INSERT INTO bitacora VALUES (2215, '2015-02-11', '09:54:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (20,1,2015-01-19,2015-02-20,A,2)', 'D15341271');
INSERT INTO bitacora VALUES (2216, '2015-02-11', '09:53:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,fecha_nac,lugar_naci,edociv,sexo,telefono,c_electronico,idciudad) VALUES (V-20041544,YORFREN ,JAVIER,SILVA,GARCES,1991-01-01,ACARIGUA,S,M,04143737713,JAVIER-AF2516@HOTMAIL.COM,1)', 'D15341271');
INSERT INTO bitacora VALUES (2217, '2015-02-11', '09:53:00', 'Estudiante', 'INSERT INTO alumno (cedula_est_pre,fecing,codesp,semestre,idpensum,lugar_est,codigo_rusnies,tipo_retiro,condicion,tipo_persona,indice_general,etnia_indig,discapacidad,estatus) VALUES (V-20041544,2015-02-11,10,1,2,E.T.I "PADRE DEHON LEON",1212,Null,2,A,15,,,A)', 'D15341271');
INSERT INTO bitacora VALUES (2218, '2015-02-11', '09:53:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (E20041544,8c9ec9f0ac6ad6fea526dad1171e7507262d0ea9541a2e6ddcc5767a239d1da9edea948dbde5494bb7fb27df24d6ac5dfc3ad47cc52af76a7e9146c5125c6cf5,3,V-20041544)', 'D15341271');
INSERT INTO bitacora VALUES (2219, '2015-02-12', '10:08:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2220, '2015-02-12', '10:59:00', 'Tabla_A_Editar', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (45,BANDEJA DE SOLICITUDES,A,2,2,vis_Bandeja.php)', 'D15341271');
INSERT INTO bitacora VALUES (2221, '2015-02-12', '10:41:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2222, '2015-02-12', '10:46:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2223, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2224, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2225, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2226, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2227, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2228, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2229, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2230, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2231, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2232, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2233, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2234, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2235, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2236, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2237, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2238, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (2239, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2240, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2241, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2242, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2243, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2244, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2245, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2246, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2247, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2248, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2249, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2250, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2251, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2252, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2253, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2254, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2255, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2256, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2257, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2258, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2259, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2260, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2261, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2262, '2015-02-12', '10:46:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2263, '2015-02-14', '06:56:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=22', 'D15341271');
INSERT INTO bitacora VALUES (2264, '2015-02-14', '06:57:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=22', 'D15341271');
INSERT INTO bitacora VALUES (2265, '2015-02-14', '06:41:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=23', 'D15341271');
INSERT INTO bitacora VALUES (2266, '2015-02-14', '06:57:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=29', 'D15341271');
INSERT INTO bitacora VALUES (2267, '2015-02-14', '06:31:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=31', 'D15341271');
INSERT INTO bitacora VALUES (2268, '2015-02-14', '06:42:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,(SELECT idtipo FROM tipo_solicitud WHERE nombre =RPS),,P,gastritis,Null,Null,2015-02-14)', 'E20025035');
INSERT INTO bitacora VALUES (2269, '2015-02-14', '07:49:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=55', 'D15341271');
INSERT INTO bitacora VALUES (2270, '2015-02-14', '07:25:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=55', 'D15341271');
INSERT INTO bitacora VALUES (2271, '2015-02-14', '07:07:00', 'Cancelacion de Matricula(solicitud)', 'UPDATE alumno SET estatus=I, tipo_retiro=

                        (SELECT idtipo_ret FROM tipo_retiro WHERE abreviatura=

                            (SELECT ts.nombre FROM solicitud AS s 

                             INNER JOIN tipo_solicitud AS ts ON(ts.idtipo=s.idtipo)

                             WHERE s.idsoli=55

                            )

                        ) WHERE cedula_est_pre=(SELECT solicitante FROM solicitud WHERE idsoli=55)', 'D15341271');
INSERT INTO bitacora VALUES (2272, '2015-02-14', '07:07:00', 'Cancelacion de Matricula(solicitud)', 'INSERT INTO retiro (tipo,cedula_est_pre) VALUES 

                         ((SELECT idtipo_ret FROM tipo_retiro WHERE abreviatura=

                            (SELECT ts.nombre FROM solicitud AS s 

                             INNER JOIN tipo_solicitud AS ts ON(ts.idtipo=s.idtipo)

                             WHERE s.idsoli=55

                            )

                            ),(SELECT solicitante FROM solicitud WHERE idsoli=55))', 'D15341271');
INSERT INTO bitacora VALUES (2273, '2015-02-14', '07:07:00', 'Cancelacion de Matricula(solicitud)', 'UPDATE solicitud SET estatus=A WHERE idsoli=55', 'D15341271');
INSERT INTO bitacora VALUES (2274, '2015-02-14', '08:07:00', 'Solicitud', 'UPDATE solicitud SET estatus=E, observacion=se sugiere utilizar pensum|| ||(SELECT nombre FROM pensum_pre WHERE idpensum=2) WHERE idsoli=21', '');
INSERT INTO bitacora VALUES (2275, '2015-02-14', '08:18:00', 'Solicitud', 'UPDATE solicitud SET estatus=E, observacion=se sugiere utilizar pensum|| ||(SELECT nombre FROM pensum_pre WHERE idpensum=2) WHERE idsoli=26', '');
INSERT INTO bitacora VALUES (2276, '2015-02-16', '09:36:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D15341271');
INSERT INTO bitacora VALUES (2277, '2015-02-16', '09:37:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D15341271');
INSERT INTO bitacora VALUES (2278, '2015-02-16', '09:27:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2279, '2015-02-16', '09:59:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2280, '2015-02-17', '06:00:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=45', 'D15341271');
INSERT INTO bitacora VALUES (2282, '2015-02-19', '11:51:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=500, cantidad_preguntas=3, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2283, '2015-02-19', '11:23:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=, caducidad_clave=, Tiempo_inactividad=, cantidad_preguntas=, cantidad_respuestas= WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2284, '2015-02-19', '11:51:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=, caducidad_clave=, Tiempo_inactividad=, cantidad_preguntas=, cantidad_respuestas= WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2285, '2015-02-19', '11:35:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2286, '2015-02-19', '11:28:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=500, cantidad_preguntas=3, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2287, '2015-02-19', '11:27:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2288, '2015-02-19', '11:00:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=500, cantidad_preguntas=3, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2289, '2015-02-19', '11:35:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2 WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2290, '2015-02-19', '11:25:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2 historial_clave=4 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2291, '2015-02-19', '11:30:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2 historial_clave=4 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2292, '2015-02-19', '11:06:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2293, '2015-02-19', '11:51:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4 WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2294, '2015-02-20', '01:34:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=CONFIGURACION,sub_estatus=A,fk_mod_codigo=4,sub_tipo=2,sub_ruta=vis_ServConf.php WHERE (sub_codigo=43)', 'D15341271');
INSERT INTO bitacora VALUES (2295, '2015-02-20', '01:46:00', 'Proceso', 'UPDATE proceso SET peraca=1,fecha_ini=2015-02-01,fecha_final=2015-03-20,estatus=A,idtipo=5 WHERE idproceso=2', 'D15341271');
INSERT INTO bitacora VALUES (2296, '2015-02-21', '01:58:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4 codigo_seguridad=false WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2297, '2015-02-21', '02:54:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4 codigo_seguridad=false WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2298, '2015-02-21', '02:26:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4 codigo_seguridad=false WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2299, '2015-02-21', '02:50:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=false WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2300, '2015-02-21', '02:44:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=t WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2301, '2015-02-21', '02:28:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=f WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2302, '2015-02-21', '12:15:00', 'Usuario', 'UPDATE usuario SET  contrasena=cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960, estatus=A  WHERE nombre=D21057251 ', 'D21057251');
INSERT INTO bitacora VALUES (2303, '2015-02-21', '12:15:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D21057251,cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960,2015/02/21)', 'D21057251');
INSERT INTO bitacora VALUES (2304, '2015-02-21', '12:01:00', 'Usuario', 'UPDATE usuario SET  contrasena=80f598a0022f00738ad71a6873c1e846c6657a473d84e3268e97e03597ccc352b45e660c6bd6c5014731297c17147a002711a9d4821e76f87a27d18f298167c8, estatus=A  WHERE nombre=D21057251 ', 'D21057251');
INSERT INTO bitacora VALUES (2305, '2015-02-21', '12:01:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D21057251,80f598a0022f00738ad71a6873c1e846c6657a473d84e3268e97e03597ccc352b45e660c6bd6c5014731297c17147a002711a9d4821e76f87a27d18f298167c8,2015/02/21)', 'D21057251');
INSERT INTO bitacora VALUES (2306, '2015-02-21', '12:01:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D21057251)', 'D15341271');
INSERT INTO bitacora VALUES (2307, '2015-02-21', '12:01:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(6,D21057251)', 'D15341271');
INSERT INTO bitacora VALUES (2308, '2015-02-21', '12:17:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=4,car_status=A WHERE(car_nombre=JEFE DE SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2309, '2015-02-21', '12:05:00', 'cargo', 'INSERT INTO cargo (car_nombre,car_status,fk_dep_codigo)VALUES(JEFE DE SEGURIDAD,A,2)', 'D15341271');
INSERT INTO bitacora VALUES (2310, '2015-02-21', '12:27:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=JEFE DE SEGURIDAD)', 'D15341271');
INSERT INTO bitacora VALUES (2311, '2015-02-21', '12:48:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D15341271');
INSERT INTO bitacora VALUES (2312, '2015-02-21', '12:48:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D15341271');
INSERT INTO bitacora VALUES (2313, '2015-02-21', '12:48:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D15341271');
INSERT INTO bitacora VALUES (2314, '2015-02-21', '12:48:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D15341271');
INSERT INTO bitacora VALUES (2315, '2015-02-21', '12:48:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D15341271');
INSERT INTO bitacora VALUES (2316, '2015-02-21', '12:48:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D15341271');
INSERT INTO bitacora VALUES (2317, '2015-02-21', '12:48:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D15341271');
INSERT INTO bitacora VALUES (2318, '2015-02-21', '12:48:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D15341271');
INSERT INTO bitacora VALUES (2319, '2015-02-21', '12:54:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D21057251)', 'D15341271');
INSERT INTO bitacora VALUES (2320, '2015-02-21', '12:54:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(10,D21057251)', 'D15341271');
INSERT INTO bitacora VALUES (2321, '2015-02-23', '12:32:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,1,,P,me dio cancer,Null,Null,2015-02-23)', 'E20025035');
INSERT INTO bitacora VALUES (2322, '2015-02-23', '12:02:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=t WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2323, '2015-02-23', '03:03:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=f WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2324, '2015-02-23', '04:37:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=t WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2325, '2015-02-23', '04:15:00', 'Proceso', 'UPDATE proceso SET peraca=1,fecha_ini=2015-01-19,fecha_final=2015-06-20,estatus=A,idtipo=2 WHERE idproceso=20', 'D15341271');
INSERT INTO bitacora VALUES (2326, '2015-02-23', '04:34:00', 'Proceso', 'UPDATE proceso SET peraca=1,fecha_ini=2015-01-19,fecha_final=2015-06-20,estatus=A,idtipo=6 WHERE idproceso=16', 'D15341271');
INSERT INTO bitacora VALUES (2327, '2015-02-23', '04:26:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2328, '2015-02-23', '04:03:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=4,car_status=A WHERE(car_nombre=COORDINADOR ACADEMICO)', 'D15341271');
INSERT INTO bitacora VALUES (2329, '2015-02-24', '02:30:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= CONFIRMACION CINU , estatus=A, padre=6, WHERE(idtipo_pro=2)', 'D15341271');
INSERT INTO bitacora VALUES (2330, '2015-02-24', '02:05:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= CONFIRMACION CINU , estatus=A, padre=6  WHERE(idtipo_pro=2)', 'D15341271');
INSERT INTO bitacora VALUES (2331, '2015-02-24', '02:30:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= INSCRIPCION , estatus=A, padre=3  WHERE(idtipo_pro=5)', 'D15341271');
INSERT INTO bitacora VALUES (2332, '2015-02-24', '04:02:00', 'Proceso', 'UPDATE proceso SET borrado=I WHERE idproceso=6', 'D15341271');
INSERT INTO bitacora VALUES (2333, '2015-02-24', '04:23:00', 'Proceso', 'DELETE FROM proceso WHERE idproceso=6', 'D15341271');
INSERT INTO bitacora VALUES (2334, '2015-02-24', '06:49:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,1,2015-01-31,2015-02-12,A,5)', 'D15341271');
INSERT INTO bitacora VALUES (2335, '2015-02-24', '06:39:00', 'Proceso', 'DELETE FROM proceso WHERE idproceso=1', 'D15341271');
INSERT INTO bitacora VALUES (2336, '2015-02-24', '07:43:00', 'Proceso', '', 'D15341271');
INSERT INTO bitacora VALUES (2337, '2015-02-24', '07:48:00', 'Proceso', '', 'D15341271');
INSERT INTO bitacora VALUES (2338, '2015-02-24', '08:24:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,1,2015-01-19,2015-05-10,A,6)', 'D15341271');
INSERT INTO bitacora VALUES (2339, '2015-02-24', '11:56:00', 'Proceso', 'UPDATE proceso SET peraca=1,fecha_ini=2015-01-20,fecha_final=2015-03-20,estatus=A,idtipo=6 WHERE idproceso=1', 'D15341271');
INSERT INTO bitacora VALUES (2340, '2015-02-24', '11:38:00', 'Proceso', 'DELETE FROM proceso WHERE idproceso=7', 'D15341271');
INSERT INTO bitacora VALUES (2341, '2015-02-24', '11:44:00', 'Proceso', 'DELETE FROM proceso WHERE idproceso=1', 'D15341271');
INSERT INTO bitacora VALUES (2342, '2015-02-24', '11:54:00', 'Proceso', 'DELETE FROM proceso WHERE idproceso=2', 'D15341271');
INSERT INTO bitacora VALUES (2343, '2015-02-24', '11:01:00', 'Proceso', 'DELETE FROM proceso WHERE idproceso=3', 'D15341271');
INSERT INTO bitacora VALUES (2344, '2015-02-24', '11:11:00', 'Proceso', 'DELETE FROM proceso WHERE idproceso=4', 'D15341271');
INSERT INTO bitacora VALUES (2345, '2015-02-24', '11:41:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-18892789,JAVIER,ALEXANDER,ARANGUREN,ARANGUREN,ARANGUREN_3@HOTMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (2346, '2015-02-25', '09:24:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,1,2015-02-01,2015-03-10,A,6)', 'D15341271');
INSERT INTO bitacora VALUES (2347, '2015-02-25', '09:13:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=f WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2348, '2015-03-04', '08:17:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=t WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2349, '2015-03-04', '08:50:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=f WHERE(idconfiguracion=1)', 'D15341271');
INSERT INTO bitacora VALUES (2350, '2015-03-04', '08:28:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= PROYECCION , estatus=A, padre=2  WHERE(idtipo_pro=3)', 'D15341271');
INSERT INTO bitacora VALUES (2351, '2015-03-04', '08:27:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= ADICION Y RETIRO DE MATERIAS , estatus=A, padre=5  WHERE(idtipo_pro=7)', 'D15341271');
INSERT INTO bitacora VALUES (2352, '2015-03-04', '08:40:00', 'Proceso', 'UPDATE proceso SET peraca=1,fecha_ini=2015-02-01,fecha_final=2015-02-22,estatus=A,idtipo=6 WHERE idproceso=1', 'D15341271');
INSERT INTO bitacora VALUES (2353, '2015-03-04', '08:23:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (2,1,2015-05-23,2015-05-30,A,2)', 'D15341271');
INSERT INTO bitacora VALUES (2354, '2015-03-04', '08:52:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=  PROYECCION , estatus=A, padre=-  WHERE(idtipo_pro=3)', 'D15341271');
INSERT INTO bitacora VALUES (2355, '2015-03-04', '08:09:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=  CONFIRMACION CINU , estatus=A, padre=NULL  WHERE(idtipo_pro=2)', 'D15341271');
INSERT INTO bitacora VALUES (2356, '2015-03-04', '08:59:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (3,1,2015-01-19,2015-02-02,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (2357, '2015-03-04', '08:14:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (4,1,2015-02-02,2015-02-16,A,5)', 'D15341271');
INSERT INTO bitacora VALUES (2358, '2015-02-10', '09:58:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2015-02-10,09:19:58,152,1)', 'E20025035');
INSERT INTO bitacora VALUES (2391, '2015-03-10', '10:26:00', 'Proceso', 'UPDATE proceso SET peraca=1,fecha_ini=2015-01-19,fecha_final=2015-05-18,estatus=A,idtipo=3 WHERE idproceso=3', 'D15341271');
INSERT INTO bitacora VALUES (2392, '2015-03-10', '10:00:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-01,estatus=I,nombre=2015-I WHERE peraca=1', 'D15341271');
INSERT INTO bitacora VALUES (2393, '2015-03-10', '10:07:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-05-19,estatus=A,nombre=2015-I WHERE peraca=4', 'D15341271');
INSERT INTO bitacora VALUES (2394, '2015-03-10', '11:03:00', 'Proceso', 'INSERT INTO proceso (idproceso,peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (,4,2015-02-02,2015-05-19,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (2395, '2015-03-10', '11:42:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (4,2015-02-02,2015-05-19,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (2396, '2015-03-10', '11:15:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (4,2015-02-02,2015-05-19,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (2397, '2015-03-10', '11:08:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=A,nombre=2015-I WHERE peraca=4', 'D15341271');
INSERT INTO bitacora VALUES (2398, '2015-03-10', '11:35:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (4,2015-05-19,2015-05-21,A,5)', 'D15341271');
INSERT INTO bitacora VALUES (2399, '2015-03-10', '01:59:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=I,nombre=2015-I WHERE nombre=2015-I', 'D15341271');
INSERT INTO bitacora VALUES (2400, '2015-03-10', '01:24:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=A,nombre=2015-I WHERE nombre=2015-I', 'D15341271');
INSERT INTO bitacora VALUES (2401, '2015-03-10', '03:57:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D21057251');
INSERT INTO bitacora VALUES (2402, '2015-03-10', '03:52:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D21057251');
INSERT INTO bitacora VALUES (2403, '2015-03-10', '03:49:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2404, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2405, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2406, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2407, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2408, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2409, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2410, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2411, '2015-03-10', '03:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2412, '2015-03-10', '03:56:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= AUTOEVALUACION , estatus=A, padre=NULL  modulo=3  WHERE(idtipo_pro=1)', 'D21057251');
INSERT INTO bitacora VALUES (2413, '2015-03-10', '03:18:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= AUTOEVALUACION , estatus=A, padre=NULL,  modulo=3  WHERE(idtipo_pro=1)', 'D21057251');
INSERT INTO bitacora VALUES (2414, '2015-03-10', '03:55:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre= CONFIRMACION CINU , estatus=A, padre=6,  modulo=2  WHERE(idtipo_pro=2)', 'D21057251');
INSERT INTO bitacora VALUES (2415, '2015-03-10', '03:20:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=PROYECCION , estatus=A, padre=NULL,  modulo=2  WHERE(idtipo_pro=3)', 'D21057251');
INSERT INTO bitacora VALUES (2416, '2015-03-10', '03:48:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=INSCRIPCION , estatus=A, padre=3,  modulo=2  WHERE(idtipo_pro=5)', 'D21057251');
INSERT INTO bitacora VALUES (2417, '2015-03-10', '03:08:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=ADICION Y RETIRO DE MATERIAS , estatus=A, padre=5,  modulo=2  WHERE(idtipo_pro=7)', 'D21057251');
INSERT INTO bitacora VALUES (2418, '2015-03-10', '03:22:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=IMPORTACION CINU, estatus=A, padre=NULL,  modulo=2  WHERE(idtipo_pro=6)', 'D21057251');
INSERT INTO bitacora VALUES (2419, '2015-03-10', '04:13:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=JEFE DE SEGURIDAD)', 'D21057251');
INSERT INTO bitacora VALUES (2422, '2015-03-10', '04:38:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2423, '2015-03-10', '04:38:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2424, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2425, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2426, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2427, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2428, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2429, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2430, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2431, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2432, '2015-03-10', '04:38:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2433, '2015-03-10', '04:36:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2434, '2015-03-10', '04:36:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2435, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2436, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2437, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2438, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2439, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2440, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2441, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2442, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2443, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2444, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D21057251');
INSERT INTO bitacora VALUES (2445, '2015-03-10', '04:36:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D21057251');
INSERT INTO bitacora VALUES (2446, '2015-03-10', '04:53:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2447, '2015-03-10', '04:53:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2448, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2449, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2450, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2451, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2452, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2453, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2454, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2455, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2456, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D21057251');
INSERT INTO bitacora VALUES (2457, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D21057251');
INSERT INTO bitacora VALUES (2458, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2459, '2015-03-10', '04:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2460, '2015-03-10', '04:24:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2461, '2015-03-10', '04:24:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2462, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2463, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2464, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2465, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2466, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2467, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2468, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2469, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2470, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D21057251');
INSERT INTO bitacora VALUES (2471, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D21057251');
INSERT INTO bitacora VALUES (2472, '2015-03-10', '04:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2473, '2015-03-10', '04:32:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2474, '2015-03-10', '04:32:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2475, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2476, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2477, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2478, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2479, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2480, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2481, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2482, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2483, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D21057251');
INSERT INTO bitacora VALUES (2484, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D21057251');
INSERT INTO bitacora VALUES (2485, '2015-03-10', '04:32:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2486, '2015-03-10', '04:56:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2487, '2015-03-10', '04:56:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2488, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),14)', 'D21057251');
INSERT INTO bitacora VALUES (2489, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2490, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2491, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2492, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2493, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2494, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2495, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2496, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2497, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D21057251');
INSERT INTO bitacora VALUES (2498, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D21057251');
INSERT INTO bitacora VALUES (2499, '2015-03-10', '04:56:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2500, '2015-03-11', '07:25:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D15341271');
INSERT INTO bitacora VALUES (2501, '2015-03-11', '08:59:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2502, '2015-03-11', '08:05:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2503, '2015-03-11', '08:05:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2504, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2505, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2506, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2507, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2508, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2509, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2510, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2511, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2512, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2513, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2514, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2515, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2516, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2517, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2518, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2519, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2520, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2521, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2522, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2523, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2524, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2525, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2526, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2527, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2528, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2529, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2530, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2531, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2532, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2533, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2534, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2535, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (2536, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2537, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2538, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2539, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2540, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2541, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2542, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2543, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2544, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2545, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2546, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2547, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2548, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2549, '2015-03-11', '08:05:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2550, '2015-03-11', '08:49:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2551, '2015-03-11', '08:49:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2552, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2553, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2554, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2555, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (2556, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (2557, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2558, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2559, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2560, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2561, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2562, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2563, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2564, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2565, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2566, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2567, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2568, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2569, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2570, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2571, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2572, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2573, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2574, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2575, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2576, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2577, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2578, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2579, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2580, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2581, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2582, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2583, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2584, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2585, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2586, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2587, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2588, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2589, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2590, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2591, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2592, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2593, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2594, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2595, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2596, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2597, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2598, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2599, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2600, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2601, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2602, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2603, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2604, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2605, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2606, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2607, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2608, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2609, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2610, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2611, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2612, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2613, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2614, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2615, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2616, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2617, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2618, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2619, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2620, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2621, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2622, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2623, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2624, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2625, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2626, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2627, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2628, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2629, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2630, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2631, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2632, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2633, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2634, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2635, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2636, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2637, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2638, '2015-03-11', '08:49:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2642, '2015-03-11', '08:52:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2643, '2015-03-11', '08:52:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2644, '2015-03-11', '08:52:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2645, '2015-03-11', '08:24:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', '');
INSERT INTO bitacora VALUES (2646, '2015-03-11', '08:24:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', '');
INSERT INTO bitacora VALUES (2647, '2015-03-11', '08:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', '');
INSERT INTO bitacora VALUES (2648, '2015-03-11', '08:44:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', '');
INSERT INTO bitacora VALUES (2649, '2015-03-11', '08:44:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', '');
INSERT INTO bitacora VALUES (2650, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', '');
INSERT INTO bitacora VALUES (2651, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', '');
INSERT INTO bitacora VALUES (2652, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', '');
INSERT INTO bitacora VALUES (2653, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', '');
INSERT INTO bitacora VALUES (2654, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', '');
INSERT INTO bitacora VALUES (2655, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', '');
INSERT INTO bitacora VALUES (2656, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', '');
INSERT INTO bitacora VALUES (2657, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', '');
INSERT INTO bitacora VALUES (2658, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', '');
INSERT INTO bitacora VALUES (2659, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', '');
INSERT INTO bitacora VALUES (2660, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', '');
INSERT INTO bitacora VALUES (2661, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', '');
INSERT INTO bitacora VALUES (2662, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', '');
INSERT INTO bitacora VALUES (2663, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', '');
INSERT INTO bitacora VALUES (2664, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', '');
INSERT INTO bitacora VALUES (2665, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', '');
INSERT INTO bitacora VALUES (2666, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', '');
INSERT INTO bitacora VALUES (2667, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', '');
INSERT INTO bitacora VALUES (2668, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', '');
INSERT INTO bitacora VALUES (2669, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', '');
INSERT INTO bitacora VALUES (2670, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', '');
INSERT INTO bitacora VALUES (2671, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', '');
INSERT INTO bitacora VALUES (2672, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', '');
INSERT INTO bitacora VALUES (2673, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', '');
INSERT INTO bitacora VALUES (2674, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', '');
INSERT INTO bitacora VALUES (2675, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', '');
INSERT INTO bitacora VALUES (2676, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', '');
INSERT INTO bitacora VALUES (2677, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', '');
INSERT INTO bitacora VALUES (2678, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', '');
INSERT INTO bitacora VALUES (2679, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', '');
INSERT INTO bitacora VALUES (2680, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', '');
INSERT INTO bitacora VALUES (2681, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', '');
INSERT INTO bitacora VALUES (2682, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', '');
INSERT INTO bitacora VALUES (2683, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', '');
INSERT INTO bitacora VALUES (2684, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', '');
INSERT INTO bitacora VALUES (2685, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', '');
INSERT INTO bitacora VALUES (2686, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', '');
INSERT INTO bitacora VALUES (2687, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', '');
INSERT INTO bitacora VALUES (2688, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', '');
INSERT INTO bitacora VALUES (2689, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', '');
INSERT INTO bitacora VALUES (2690, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', '');
INSERT INTO bitacora VALUES (2691, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', '');
INSERT INTO bitacora VALUES (2692, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', '');
INSERT INTO bitacora VALUES (2693, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', '');
INSERT INTO bitacora VALUES (2694, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', '');
INSERT INTO bitacora VALUES (2695, '2015-03-11', '08:44:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', '');
INSERT INTO bitacora VALUES (2696, '2015-03-11', '08:04:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', '');
INSERT INTO bitacora VALUES (2697, '2015-03-11', '08:04:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', '');
INSERT INTO bitacora VALUES (2698, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', '');
INSERT INTO bitacora VALUES (2699, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', '');
INSERT INTO bitacora VALUES (2700, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', '');
INSERT INTO bitacora VALUES (2701, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', '');
INSERT INTO bitacora VALUES (2702, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', '');
INSERT INTO bitacora VALUES (2703, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', '');
INSERT INTO bitacora VALUES (2704, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', '');
INSERT INTO bitacora VALUES (2705, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', '');
INSERT INTO bitacora VALUES (2706, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', '');
INSERT INTO bitacora VALUES (2707, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', '');
INSERT INTO bitacora VALUES (2708, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', '');
INSERT INTO bitacora VALUES (2709, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', '');
INSERT INTO bitacora VALUES (2710, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', '');
INSERT INTO bitacora VALUES (2711, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', '');
INSERT INTO bitacora VALUES (2712, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', '');
INSERT INTO bitacora VALUES (2713, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', '');
INSERT INTO bitacora VALUES (2714, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', '');
INSERT INTO bitacora VALUES (2715, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', '');
INSERT INTO bitacora VALUES (2716, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', '');
INSERT INTO bitacora VALUES (2717, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', '');
INSERT INTO bitacora VALUES (2718, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', '');
INSERT INTO bitacora VALUES (2719, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', '');
INSERT INTO bitacora VALUES (2720, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', '');
INSERT INTO bitacora VALUES (2721, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', '');
INSERT INTO bitacora VALUES (2722, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', '');
INSERT INTO bitacora VALUES (2723, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', '');
INSERT INTO bitacora VALUES (2724, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', '');
INSERT INTO bitacora VALUES (2725, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', '');
INSERT INTO bitacora VALUES (2726, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', '');
INSERT INTO bitacora VALUES (2727, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', '');
INSERT INTO bitacora VALUES (2728, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', '');
INSERT INTO bitacora VALUES (2729, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', '');
INSERT INTO bitacora VALUES (2730, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', '');
INSERT INTO bitacora VALUES (2731, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', '');
INSERT INTO bitacora VALUES (2732, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', '');
INSERT INTO bitacora VALUES (2733, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', '');
INSERT INTO bitacora VALUES (2734, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', '');
INSERT INTO bitacora VALUES (2735, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', '');
INSERT INTO bitacora VALUES (2736, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', '');
INSERT INTO bitacora VALUES (2737, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', '');
INSERT INTO bitacora VALUES (2738, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', '');
INSERT INTO bitacora VALUES (2739, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', '');
INSERT INTO bitacora VALUES (2740, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', '');
INSERT INTO bitacora VALUES (2741, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', '');
INSERT INTO bitacora VALUES (2742, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', '');
INSERT INTO bitacora VALUES (2743, '2015-03-11', '08:04:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', '');
INSERT INTO bitacora VALUES (2744, '2015-03-11', '08:32:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (4,2015-02-04,2015-05-05,A,6)', 'D15341271');
INSERT INTO bitacora VALUES (2745, '2015-03-11', '08:54:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D21057251');
INSERT INTO bitacora VALUES (2746, '2015-03-11', '09:57:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=JEFE DE SEGURIDAD)', 'D15341271');
INSERT INTO bitacora VALUES (2747, '2015-03-11', '09:08:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D15341271');
INSERT INTO bitacora VALUES (2748, '2015-03-11', '08:33:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D21057251');
INSERT INTO bitacora VALUES (2749, '2015-03-11', '08:02:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA))', 'D21057251');
INSERT INTO bitacora VALUES (2750, '2015-03-11', '08:02:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA))', 'D21057251');
INSERT INTO bitacora VALUES (2751, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),14)', 'D21057251');
INSERT INTO bitacora VALUES (2752, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),13)', 'D21057251');
INSERT INTO bitacora VALUES (2753, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),10)', 'D21057251');
INSERT INTO bitacora VALUES (2754, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),2)', 'D21057251');
INSERT INTO bitacora VALUES (2755, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),4)', 'D21057251');
INSERT INTO bitacora VALUES (2756, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),5)', 'D21057251');
INSERT INTO bitacora VALUES (2757, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),38)', 'D21057251');
INSERT INTO bitacora VALUES (2758, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),17)', 'D21057251');
INSERT INTO bitacora VALUES (2759, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),32)', 'D21057251');
INSERT INTO bitacora VALUES (2760, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),33)', 'D21057251');
INSERT INTO bitacora VALUES (2761, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),34)', 'D21057251');
INSERT INTO bitacora VALUES (2762, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),40)', 'D21057251');
INSERT INTO bitacora VALUES (2763, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),39)', 'D21057251');
INSERT INTO bitacora VALUES (2764, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),18)', 'D21057251');
INSERT INTO bitacora VALUES (2765, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),15)', 'D21057251');
INSERT INTO bitacora VALUES (2766, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),16)', 'D21057251');
INSERT INTO bitacora VALUES (2767, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),5)', 'D21057251');
INSERT INTO bitacora VALUES (2768, '2015-03-11', '08:02:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),1)', 'D21057251');
INSERT INTO bitacora VALUES (2769, '2015-03-11', '09:00:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA))', 'D21057251');
INSERT INTO bitacora VALUES (2770, '2015-03-11', '09:00:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA))', 'D21057251');
INSERT INTO bitacora VALUES (2771, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),4)', 'D21057251');
INSERT INTO bitacora VALUES (2772, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),14)', 'D21057251');
INSERT INTO bitacora VALUES (2773, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),2)', 'D21057251');
INSERT INTO bitacora VALUES (2774, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),10)', 'D21057251');
INSERT INTO bitacora VALUES (2775, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),5)', 'D21057251');
INSERT INTO bitacora VALUES (2776, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),13)', 'D21057251');
INSERT INTO bitacora VALUES (2777, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),17)', 'D21057251');
INSERT INTO bitacora VALUES (2778, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),16)', 'D21057251');
INSERT INTO bitacora VALUES (2779, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),18)', 'D21057251');
INSERT INTO bitacora VALUES (2780, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),39)', 'D21057251');
INSERT INTO bitacora VALUES (2781, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),32)', 'D21057251');
INSERT INTO bitacora VALUES (2782, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),38)', 'D21057251');
INSERT INTO bitacora VALUES (2783, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),15)', 'D21057251');
INSERT INTO bitacora VALUES (2784, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),33)', 'D21057251');
INSERT INTO bitacora VALUES (2785, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),5)', 'D21057251');
INSERT INTO bitacora VALUES (2786, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),40)', 'D21057251');
INSERT INTO bitacora VALUES (2787, '2015-03-11', '09:00:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ANALISTA),34)', 'D21057251');
INSERT INTO bitacora VALUES (2788, '2015-03-15', '12:54:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=t WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2789, '2015-03-15', '12:26:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=I,nombre=2015-I WHERE nombre=2015-I', 'D15341271');
INSERT INTO bitacora VALUES (2790, '2015-03-15', '12:39:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=A,nombre=2015-II WHERE nombre=2015-II', 'D15341271');
INSERT INTO bitacora VALUES (2791, '2015-03-16', '03:43:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D15341271');
INSERT INTO bitacora VALUES (2792, '2015-03-16', '03:07:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=I,nombre=2015-II WHERE nombre=2015-II', 'D15341271');
INSERT INTO bitacora VALUES (2793, '2015-03-16', '03:24:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=A,nombre=2015-I WHERE nombre=2015-I', 'D15341271');
INSERT INTO bitacora VALUES (2794, '2015-03-16', '03:33:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=I,nombre=2015-I WHERE nombre=2015-I', 'D15341271');
INSERT INTO bitacora VALUES (2795, '2015-03-16', '03:42:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=A,nombre=2015-II WHERE nombre=2015-II', 'D15341271');
INSERT INTO bitacora VALUES (2796, '2015-03-16', '04:51:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-02-02,2015-04-20,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (2797, '2015-03-16', '04:13:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-04-20,2015-04-21,A,5)', 'D15341271');
INSERT INTO bitacora VALUES (2798, '2015-03-16', '06:29:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D21057251');
INSERT INTO bitacora VALUES (2799, '2015-03-17', '10:25:00', 'Submodulo', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (44,ESTUDIANTE INSCRITOS,A,2,3,vis_Rep_Listado_Inc_Car_Sem.php)', 'D15341271');
INSERT INTO bitacora VALUES (2800, '2015-03-17', '10:44:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2801, '2015-03-17', '10:53:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2802, '2015-03-17', '10:53:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2803, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2804, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2805, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2806, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2807, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2808, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2809, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2810, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2811, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2812, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2813, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2814, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2815, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2816, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2817, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2818, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2819, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D15341271');
INSERT INTO bitacora VALUES (2820, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2821, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2822, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2823, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2824, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2825, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2826, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2827, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2828, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2829, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2830, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2831, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2832, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2833, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2834, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2835, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2836, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2837, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2838, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2839, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2840, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2841, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (2842, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2843, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2844, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2845, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2846, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2847, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2848, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2849, '2015-03-17', '10:53:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2850, '2015-03-24', '02:32:00', 'Servidor', 'UPDATE servidor SET Intentos_fallidos_usuario=3, caducidad_clave=30, Tiempo_inactividad=400, cantidad_preguntas=3, cantidad_respuestas=2, historial_clave=4, codigo_seguridad=f WHERE(idconfiguracion=1)', 'D21057251');
INSERT INTO bitacora VALUES (2851, '2015-03-25', '06:42:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-03-10,2015-04-29,A,6)', 'D15341271');
INSERT INTO bitacora VALUES (2852, '2015-03-25', '07:14:00', 'Submodulo', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (47,REPORTE BITACORA,A,4,3,vis_Rep_Bitacora.php)', 'D15341271');
INSERT INTO bitacora VALUES (2853, '2015-03-25', '07:54:00', 'Submodulo', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (48,REPORTE BITACORA ACCESO,A,4,3,vis_Rep_Bit_Acceso.php)', 'D15341271');
INSERT INTO bitacora VALUES (2854, '2015-03-25', '07:14:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2855, '2015-03-25', '07:18:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2856, '2015-03-25', '07:18:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2857, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2858, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2859, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2860, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2861, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2862, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2863, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2864, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2865, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2866, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2867, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2868, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2869, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2870, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2871, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2872, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2873, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),47)', 'D15341271');
INSERT INTO bitacora VALUES (2874, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),48)', 'D15341271');
INSERT INTO bitacora VALUES (2875, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2876, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2877, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2878, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2879, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2880, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2881, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2882, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2883, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2884, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2885, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2886, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2887, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2888, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2889, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (2890, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2891, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D15341271');
INSERT INTO bitacora VALUES (2892, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2893, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (2894, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (2895, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (2896, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (2897, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (2898, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (2899, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (2900, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (2901, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (2902, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2903, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (2904, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2905, '2015-03-25', '07:18:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2906, '2015-03-25', '08:20:00', 'Usuario', 'UPDATE usuario SET  contrasena=9b764dd90c2da7de846c9acfa9d39fec5db056b4cf291fb83b576b45e2375d1dfe93883ee467b3a425ea439e6d40d876178555c72657887cc81d40164b0011aa, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (2907, '2015-03-25', '08:20:00', 'historial_clave', 'INSERT INTO historial_clave (usuario,clave,fecha) VALUES(D15341271,9b764dd90c2da7de846c9acfa9d39fec5db056b4cf291fb83b576b45e2375d1dfe93883ee467b3a425ea439e6d40d876178555c72657887cc81d40164b0011aa,2015/03/25)', 'D15341271');
INSERT INTO bitacora VALUES (2908, '2015-03-25', '08:56:00', 'cargo', 'INSERT INTO cargo (car_nombre,car_status,fk_dep_codigo)VALUES(PROBADOR,A,2)', 'D15341271');
INSERT INTO bitacora VALUES (2909, '2015-03-25', '08:12:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=PROBADOR)', 'D15341271');
INSERT INTO bitacora VALUES (2910, '2015-03-25', '08:35:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR))', 'D15341271');
INSERT INTO bitacora VALUES (2911, '2015-03-25', '08:35:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR))', 'D15341271');
INSERT INTO bitacora VALUES (2912, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),3)', 'D15341271');
INSERT INTO bitacora VALUES (2913, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),1)', 'D15341271');
INSERT INTO bitacora VALUES (2914, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),10)', 'D15341271');
INSERT INTO bitacora VALUES (2915, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),2)', 'D15341271');
INSERT INTO bitacora VALUES (2916, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),12)', 'D15341271');
INSERT INTO bitacora VALUES (2917, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),17)', 'D15341271');
INSERT INTO bitacora VALUES (2918, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),16)', 'D15341271');
INSERT INTO bitacora VALUES (2919, '2015-03-25', '08:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),22)', 'D15341271');
INSERT INTO bitacora VALUES (2920, '2015-03-25', '08:58:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR))', 'D15341271');
INSERT INTO bitacora VALUES (2921, '2015-03-25', '08:58:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR))', 'D15341271');
INSERT INTO bitacora VALUES (2922, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),10)', 'D15341271');
INSERT INTO bitacora VALUES (2923, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),12)', 'D15341271');
INSERT INTO bitacora VALUES (2924, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),3)', 'D15341271');
INSERT INTO bitacora VALUES (2925, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),1)', 'D15341271');
INSERT INTO bitacora VALUES (2926, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),2)', 'D15341271');
INSERT INTO bitacora VALUES (2927, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),16)', 'D15341271');
INSERT INTO bitacora VALUES (2928, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),17)', 'D15341271');
INSERT INTO bitacora VALUES (2929, '2015-03-25', '08:58:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=PROBADOR),22)', 'D15341271');
INSERT INTO bitacora VALUES (2930, '2015-03-25', '08:47:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=I,nombre=2015-II WHERE nombre=2015-II', 'D15341271');
INSERT INTO bitacora VALUES (2931, '2015-03-25', '08:48:00', 'Periodo Academico', 'INSERT INTO peraca (peraca,fecha_ini,fecha_fin,estatus,nombre,borrado)  VALUES ((SELECT MAX(cast(peraca AS int)+1) FROM peraca),2015-02-26,2015-06-10,I,2015-III,I)', 'D15341271');
INSERT INTO bitacora VALUES (2932, '2015-03-25', '08:08:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-02-26,fecha_fin=2015-06-10,estatus=A,nombre=2015-III WHERE nombre=2015-III', 'D15341271');
INSERT INTO bitacora VALUES (2933, '2015-03-25', '09:23:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (5,2015-03-20,2015-05-01,A,6)', 'D15341271');
INSERT INTO bitacora VALUES (2934, '2015-03-25', '09:13:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (5,2015-05-16,2015-06-08,A,2)', 'D15341271');
INSERT INTO bitacora VALUES (2935, '2015-03-25', '09:18:00', 'Proceso', 'DELETE FROM proceso WHERE peraca=5 AND idtipo=2  ', 'D15341271');
INSERT INTO bitacora VALUES (2936, '2015-03-25', '09:13:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (5,2015-05-11,2015-06-08,A,2)', 'D15341271');
INSERT INTO bitacora VALUES (2937, '2015-04-06', '02:34:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=JEFE DE SEGURIDAD)', 'D21057251');
INSERT INTO bitacora VALUES (2938, '2015-04-06', '02:03:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2939, '2015-04-06', '02:03:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (2940, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),14)', 'D21057251');
INSERT INTO bitacora VALUES (2941, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (2942, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),45)', 'D21057251');
INSERT INTO bitacora VALUES (2943, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D21057251');
INSERT INTO bitacora VALUES (2944, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D21057251');
INSERT INTO bitacora VALUES (2945, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (2946, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),48)', 'D21057251');
INSERT INTO bitacora VALUES (2947, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),47)', 'D21057251');
INSERT INTO bitacora VALUES (2948, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (2949, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (2950, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (2951, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (2952, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (2953, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (2954, '2015-04-06', '02:03:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (2955, '2015-04-06', '02:02:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,1,,P,Salud,Null,14,2015-04-06)', 'E20025035');
INSERT INTO bitacora VALUES (2956, '2015-04-07', '05:04:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (5,2015-04-01,2015-05-01,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (2957, '2015-04-07', '05:27:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (5,2015-05-01,2015-06-01,A,5)', 'D15341271');
INSERT INTO bitacora VALUES (2958, '2015-05-07', '06:12:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2015-05-07,18:50:12,229,5)', 'E20025035');
INSERT INTO bitacora VALUES (2959, '2015-05-07', '06:12:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2015-05-07,18:50:12,230,5)', 'E20025035');
INSERT INTO bitacora VALUES (2960, '2015-04-14', '02:47:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=1,car_status=A WHERE(car_nombre=ANALISTA)', 'D15341271');
INSERT INTO bitacora VALUES (2961, '2015-04-24', '07:14:00', 'Planificacion De Secciones', 'DELETE FROM planificacion_sec WHERE (idplanificacion=57)', 'A4925159');
INSERT INTO bitacora VALUES (2962, '2015-04-24', '09:01:00', 'Submodulo', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (49,DEDICACION,A,1,1,vis_Dedicacion.php)', 'D15341271');
INSERT INTO bitacora VALUES (2963, '2015-04-24', '09:20:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (2964, '2015-04-24', '09:24:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2965, '2015-04-24', '09:24:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (2966, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (2967, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2968, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (2969, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (2970, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (2971, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (2972, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (2973, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (2974, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (2975, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),48)', 'D15341271');
INSERT INTO bitacora VALUES (2976, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),47)', 'D15341271');
INSERT INTO bitacora VALUES (2977, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (2978, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (2979, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (2980, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (2981, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (2982, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (2983, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (2984, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),49)', 'D15341271');
INSERT INTO bitacora VALUES (2985, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (2986, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (2987, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (2988, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (2989, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (2990, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (2991, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (2992, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (2993, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (2994, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (2995, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (2996, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (2997, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (2998, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (2999, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3000, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3001, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D15341271');
INSERT INTO bitacora VALUES (3002, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3003, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (3004, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (3005, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (3006, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (3007, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (3008, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (3009, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (3010, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (3011, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (3012, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (3013, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (3014, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3015, '2015-04-24', '09:24:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3016, '2015-04-24', '09:50:00', 'Dedicacion', 'INSERT INTO dedicacion (topeHoras, codigo, nombre)VALUES (36,1, DEDICACION EXCLUSIVA)', 'D15341271');
INSERT INTO bitacora VALUES (3017, '2015-04-24', '09:12:00', 'Dedicacion', 'INSERT INTO dedicacion (topeHoras, codigo, nombre)VALUES (36,1,DEDICACION EXCLUSIVA)', 'D15341271');
INSERT INTO bitacora VALUES (3018, '2015-04-24', '09:25:00', 'Dedicacion', 'INSERT INTO dedicacion (topehoras, codigo, nombre)VALUES (36,1,DEDICACION EXCLUSIVA)', 'D15341271');
INSERT INTO bitacora VALUES (3019, '2015-04-24', '09:24:00', 'Dedicacion', 'UPDATE dedicacion SET topehoras=18,nombre=MEDIO TIEMPO WHERE (codigo=1)', 'D15341271');
INSERT INTO bitacora VALUES (3020, '2015-04-24', '09:32:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-23567893,JOSE,,KOKLIN,,KOKLING@GMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3021, '2015-04-24', '09:32:00', 'Docente', 'INSERT INTO docente (cedula_doc,estatus,borrado,dedicacion) VALUES(V-23567893,A,I()', 'D15341271');
INSERT INTO bitacora VALUES (3022, '2015-04-24', '09:45:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-23567893,JOSE,,KOKLIN,,KOKLING@GMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3023, '2015-04-24', '09:03:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-23567893,JOSE,,KOKLIN,,KOKLING@GMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3024, '2015-04-24', '09:03:00', 'Docente', 'INSERT INTO docente (cedula_doc,estatus,borrado,dedicacion) VALUES(V-23567893,A,I()', 'D15341271');
INSERT INTO bitacora VALUES (3025, '2015-04-24', '09:29:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-23567893,JORGE,,KOKLIN,,KOKLING@GMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3026, '2015-04-24', '09:29:00', 'Docente', 'INSERT INTO docente (cedula_doc,estatus,borrado,dedicacion) VALUES(V-23567893,A,I1)', 'D15341271');
INSERT INTO bitacora VALUES (3027, '2015-04-24', '09:31:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-23567893,JORGE,,KOKLIN,,KOKLING@GMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3028, '2015-04-24', '09:31:00', 'Docente', 'INSERT INTO docente (cedula_doc,estatus,borrado,dedicacion) VALUES(V-23567893,A,I,1)', 'D15341271');
INSERT INTO bitacora VALUES (3029, '2015-04-24', '09:31:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (D23567893,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2,V-23567893)', 'D15341271');
INSERT INTO bitacora VALUES (3030, '2015-04-27', '01:58:00', 'Submodulo', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (50,REPORTE HORARIO,A,5,3,vis_Rep_Horario.php)', 'D15341271');
INSERT INTO bitacora VALUES (3031, '2015-04-27', '01:17:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (3032, '2015-04-27', '01:25:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3033, '2015-04-27', '01:25:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3034, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (3035, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (3036, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (3037, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (3038, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (3039, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (3040, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (3041, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),48)', 'D15341271');
INSERT INTO bitacora VALUES (3042, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (3043, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),47)', 'D15341271');
INSERT INTO bitacora VALUES (3044, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (3045, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (3046, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (3047, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (3048, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (3049, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (3050, '2015-04-27', '01:25:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (3051, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (3052, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),50)', 'D15341271');
INSERT INTO bitacora VALUES (3053, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (3054, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (3055, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (3056, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),49)', 'D15341271');
INSERT INTO bitacora VALUES (3057, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3058, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (3059, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (3060, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3061, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (3062, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (3063, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3064, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (3065, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3066, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (3067, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3068, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (3069, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3070, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D15341271');
INSERT INTO bitacora VALUES (3071, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3072, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (3073, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (3074, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (3075, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (3076, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (3077, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (3078, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (3079, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (3080, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (3081, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (3082, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3083, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3084, '2015-04-27', '01:26:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3085, '2015-04-30', '04:50:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=JEFE DE SEGURIDAD)', 'D15341271');
INSERT INTO bitacora VALUES (3086, '2015-04-30', '04:06:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D15341271');
INSERT INTO bitacora VALUES (3087, '2015-04-30', '04:06:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D15341271');
INSERT INTO bitacora VALUES (3088, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),14)', 'D15341271');
INSERT INTO bitacora VALUES (3089, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D15341271');
INSERT INTO bitacora VALUES (3090, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D15341271');
INSERT INTO bitacora VALUES (3091, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D15341271');
INSERT INTO bitacora VALUES (3092, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),45)', 'D15341271');
INSERT INTO bitacora VALUES (3093, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D15341271');
INSERT INTO bitacora VALUES (3094, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),50)', 'D15341271');
INSERT INTO bitacora VALUES (3095, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D15341271');
INSERT INTO bitacora VALUES (3096, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D15341271');
INSERT INTO bitacora VALUES (3097, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D15341271');
INSERT INTO bitacora VALUES (3098, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D15341271');
INSERT INTO bitacora VALUES (3099, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D15341271');
INSERT INTO bitacora VALUES (3100, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D15341271');
INSERT INTO bitacora VALUES (3101, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),48)', 'D15341271');
INSERT INTO bitacora VALUES (3102, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),47)', 'D15341271');
INSERT INTO bitacora VALUES (3103, '2015-04-30', '04:06:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D15341271');
INSERT INTO bitacora VALUES (3104, '2015-05-02', '10:54:00', 'Tipo de Proceso', 'INSERT INTO tipo_proceso (idtipo_pro,nombre,estatus,borrado,padre,modulo)VALUES(8,CARGA DE NOTAS, A,I,5,5)', 'D15341271');
INSERT INTO bitacora VALUES (3105, '2015-05-02', '10:27:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (3106, '2015-05-02', '10:35:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3107, '2015-05-02', '10:35:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3108, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (3109, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (3110, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (3111, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (3112, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (3113, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (3114, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (3115, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (3116, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (3117, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (3118, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),47)', 'D15341271');
INSERT INTO bitacora VALUES (3119, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (3120, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),48)', 'D15341271');
INSERT INTO bitacora VALUES (3121, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (3122, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),50)', 'D15341271');
INSERT INTO bitacora VALUES (3123, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (3124, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (3125, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (3126, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (3127, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (3128, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3129, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (3130, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (3131, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (3132, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3133, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (3134, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3135, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (3136, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),49)', 'D15341271');
INSERT INTO bitacora VALUES (3137, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (3138, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3139, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (3140, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (3141, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3142, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (3143, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (3144, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3145, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D15341271');
INSERT INTO bitacora VALUES (3146, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3147, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (3148, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (3149, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (3150, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (3151, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (3152, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (3153, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (3154, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (3155, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (3156, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3157, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3158, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (3159, '2015-05-02', '10:35:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3160, '2015-05-02', '10:06:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-02-26,fecha_fin=2015-06-10,estatus=I,nombre=2015-III WHERE nombre=2015-III', 'D15341271');
INSERT INTO bitacora VALUES (3161, '2015-05-02', '10:23:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2012-01-01,fecha_fin=2012-05-01,estatus=A,nombre=2012-I WHERE nombre=2012-I', 'D15341271');
INSERT INTO bitacora VALUES (3162, '2015-05-02', '10:36:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-04-21,2015-05-21,A,8)', 'D15341271');
INSERT INTO bitacora VALUES (3163, '2015-05-02', '10:13:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D20041540)', 'D15341271');
INSERT INTO bitacora VALUES (3164, '2015-05-02', '10:13:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(10,D20041540)', 'D15341271');
INSERT INTO bitacora VALUES (3165, '2015-05-02', '07:30:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-02-26,fecha_fin=2015-06-10,estatus=A,nombre=2015-III WHERE nombre=2015-III', 'D15341271');
INSERT INTO bitacora VALUES (3166, '2015-05-02', '07:42:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=I,nombre=2015-II WHERE nombre=2015-II', 'D15341271');
INSERT INTO bitacora VALUES (3167, '2015-05-02', '07:17:00', 'Proceso', 'DELETE FROM proceso WHERE peraca=5 AND idtipo=5  ', 'D15341271');
INSERT INTO bitacora VALUES (3168, '2015-05-02', '07:25:00', 'Proceso', 'DELETE FROM proceso WHERE peraca=5 AND idtipo=3  ', 'D15341271');
INSERT INTO bitacora VALUES (3169, '2015-05-02', '07:59:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (5,2015-05-01,2015-06-01,A,3)', 'D15341271');
INSERT INTO bitacora VALUES (3170, '2015-05-03', '11:50:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,3,,P,no me gusta la carrera,Null,14,2015-05-03)', 'E20025035');
INSERT INTO bitacora VALUES (3171, '2015-05-03', '11:05:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,(SELECT idtipo FROM tipo_solicitud WHERE nombre =RPS),,P,no me,Null,Null,2015-05-03)', 'E20025035');
INSERT INTO bitacora VALUES (3172, '2015-05-03', '11:25:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,(SELECT idtipo FROM tipo_solicitud WHERE nombre =RMS),,P,ha,Null,Null,2015-05-03)', 'E20025035');
INSERT INTO bitacora VALUES (3173, '2015-05-03', '11:33:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,(SELECT idtipo FROM tipo_solicitud WHERE nombre =RPV),,P,losi,Null,Null,2015-05-03)', 'E20025035');
INSERT INTO bitacora VALUES (3174, '2015-05-03', '01:49:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,1,,P,hola,1,19,2015-05-03)', 'E20025035');
INSERT INTO bitacora VALUES (3175, '2015-05-03', '02:51:00', 'Cancelacion de Matricula(solicitud)', 'UPDATE alumno SET estatus=I, tipo_retiro=
						(SELECT idtipo_ret FROM tipo_retiro WHERE abreviatura=
							(SELECT ts.nombre FROM solicitud AS s 
							 INNER JOIN tipo_solicitud AS ts ON(ts.idtipo=s.idtipo)
							 WHERE s.idsoli=61
							)
						) WHERE cedula_est_pre=(SELECT solicitante FROM solicitud WHERE idsoli=61)', 'D21057251');
INSERT INTO bitacora VALUES (3176, '2015-05-03', '02:51:00', 'Cancelacion de Matricula(solicitud)', 'INSERT INTO retiro (tipo,cedula_est_pre) VALUES 
						 ((SELECT idtipo_ret FROM tipo_retiro WHERE abreviatura=
							(SELECT ts.nombre FROM solicitud AS s 
							 INNER JOIN tipo_solicitud AS ts ON(ts.idtipo=s.idtipo)
							 WHERE s.idsoli=61
							)
							),(SELECT solicitante FROM solicitud WHERE idsoli=61))', 'D21057251');
INSERT INTO bitacora VALUES (3177, '2015-05-03', '02:51:00', 'Cancelacion de Matricula(solicitud)', 'UPDATE solicitud SET estatus=A WHERE idsoli=61', 'D21057251');
INSERT INTO bitacora VALUES (3178, '2015-05-03', '02:48:00', 'Solicitud', 'UPDATE solicitud SET estatus=R WHERE idsoli=59', 'D21057251');
INSERT INTO bitacora VALUES (3179, '2015-05-03', '05:35:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=PROYECCION , estatus=A, padre=NULL,  modulo=2,holgura=90  WHERE(idtipo_pro=3)', 'D15341271');
INSERT INTO bitacora VALUES (3180, '2015-05-03', '05:50:00', 'Proceso', 'DELETE FROM proceso WHERE peraca=1 AND idtipo=8  ', 'D15341271');
INSERT INTO bitacora VALUES (3181, '2015-05-03', '05:57:00', 'Proceso', 'DELETE FROM proceso WHERE peraca=1 AND idtipo=5  ', 'D15341271');
INSERT INTO bitacora VALUES (3182, '2015-05-03', '09:02:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET nombre=PROYECCION , estatus=A, padre=NULL,  modulo=2,holgura=7  WHERE(idtipo_pro=3)', 'D15341271');
INSERT INTO bitacora VALUES (3183, '2015-05-03', '09:33:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-05-27,2015-06-03,A,5)', 'D15341271');
INSERT INTO bitacora VALUES (3184, '2015-05-04', '09:04:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-06-03,2015-06-13,A,8)', 'D15341271');
INSERT INTO bitacora VALUES (3185, '2015-05-04', '09:31:00', 'Proceso', 'DELETE FROM proceso WHERE peraca=1 AND idtipo=8  ', 'D15341271');
INSERT INTO bitacora VALUES (3186, '2015-05-04', '09:53:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-06-03,2015-06-15,A,8)', 'D15341271');
INSERT INTO bitacora VALUES (3187, '2015-05-04', '09:25:00', 'Usuario', 'UPDATE usuario SET  contrasena=fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2, estatus=A  WHERE nombre=D15341271 ', 'D15341271');
INSERT INTO bitacora VALUES (3188, '2015-05-04', '01:59:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-GLOBE WHERE (mod_codigo=1)', 'D21057251');
INSERT INTO bitacora VALUES (3189, '2015-05-04', '01:31:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-CLOSE WHERE (mod_codigo=1)', 'D21057251');
INSERT INTO bitacora VALUES (3190, '2015-05-04', '01:48:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-GLOBE WHERE (mod_codigo=1)', 'D21057251');
INSERT INTO bitacora VALUES (3191, '2015-05-04', '01:33:00', 'Modulo', 'UPDATE modulo SET mod_nombre=ACADEMICO,mod_estatus=A, mod_color=#1ABC9C, mod_icon_clases=ICON ICON-WHITE ICON-BOOK WHERE (mod_codigo=5)', 'D21057251');
INSERT INTO bitacora VALUES (3192, '2015-05-04', '01:21:00', 'Modulo', 'UPDATE modulo SET mod_nombre=SECRETARIA,mod_estatus=A, mod_color=#2980B9, mod_icon_clases=ICON ICON-WHITE ICON-BRIEFCASE WHERE (mod_codigo=2)', 'D21057251');
INSERT INTO bitacora VALUES (3193, '2015-05-04', '01:32:00', 'Modulo', 'UPDATE modulo SET mod_nombre=EVALUACION DOCENTE,mod_estatus=A, mod_color=#F39C12, mod_icon_clases=ICON32 ICON-BLUE ICON-USERS WHERE (mod_codigo=3)', 'D21057251');
INSERT INTO bitacora VALUES (3194, '2015-05-04', '01:10:00', 'Modulo', 'UPDATE modulo SET mod_nombre=EVALUACION DOCENTE,mod_estatus=A, mod_color=#F39C12, mod_icon_clases=ICON ICON-RED ICON-USERS WHERE (mod_codigo=3)', 'D15341271');
INSERT INTO bitacora VALUES (3195, '2015-05-04', '01:32:00', 'Modulo', 'UPDATE modulo SET mod_nombre=EVALUACION DOCENTE,mod_estatus=A, mod_color=#F39C12, mod_icon_clases=ICON ICON-WHITE ICON-USERS WHERE (mod_codigo=3)', 'D15341271');
INSERT INTO bitacora VALUES (3196, '2015-05-04', '01:52:00', 'Modulo', 'UPDATE modulo SET mod_nombre=EVALUACION DOCENTE,mod_estatus=A, mod_color=#F39C12, mod_icon_clases=ICON ICON-WHITE ICON-COMPOSE WHERE (mod_codigo=3)', 'D15341271');
INSERT INTO bitacora VALUES (3197, '2015-05-04', '02:28:00', 'Modulo', 'UPDATE modulo SET mod_nombre=SEGURIDAD,mod_estatus=A, mod_color=#34495E, mod_icon_clases=ICON ICON-WHITE ICON-LOCKED WHERE (mod_codigo=4)', 'D15341271');
INSERT INTO bitacora VALUES (3198, '2015-05-04', '02:56:00', 'Modulo', 'UPDATE modulo SET mod_nombre=SEGURIDAD,mod_estatus=A, mod_color=#34495E, mod_icon_clases=ICON ICON-WHITE ICON-KEY WHERE (mod_codigo=4)', 'D15341271');
INSERT INTO bitacora VALUES (3199, '2015-05-04', '02:11:00', 'Modulo', 'UPDATE modulo SET mod_nombre=SEGURIDAD,mod_estatus=A, mod_color=#34495E, mod_icon_clases=ICON ICON-WHITE ICON-LOCKED WHERE (mod_codigo=4)', 'D15341271');
INSERT INTO bitacora VALUES (3200, '2015-05-04', '02:12:00', 'Modulo', 'UPDATE modulo SET mod_nombre=AUDITORIA,mod_estatus=A, mod_color=#36B128, mod_icon_clases=ICON ICON-WHITE ICON-PROFILE WHERE (mod_codigo=12)', 'D15341271');
INSERT INTO bitacora VALUES (3201, '2015-05-04', '02:36:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-WEB WHERE (mod_codigo=1)', 'D15341271');
INSERT INTO bitacora VALUES (3202, '2015-05-04', '05:16:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-GLOBAL WHERE (mod_codigo=1)', 'D21057251');
INSERT INTO bitacora VALUES (3203, '2015-05-04', '05:11:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-GLOBE WHERE (mod_codigo=1)', 'D21057251');
INSERT INTO bitacora VALUES (3204, '2015-05-04', '05:09:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=TIPO DE AMBIENTE,sub_estatus=A,fk_mod_codigo=5,sub_tipo=1,sub_ruta=vis_Tipo_Ambiente.php WHERE (sub_codigo=37)', 'D15341271');
INSERT INTO bitacora VALUES (3205, '2015-05-04', '05:41:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=BITÁCORA,sub_estatus=A,fk_mod_codigo=12,sub_tipo=1,sub_ruta=vis_ServConf.php WHERE (sub_codigo=100)', 'D15341271');
INSERT INTO bitacora VALUES (3206, '2015-05-04', '05:08:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=BITACORA,sub_estatus=A,fk_mod_codigo=12,sub_tipo=1,sub_ruta=vis_ServConf.php WHERE (sub_codigo=100)', 'D15341271');
INSERT INTO bitacora VALUES (3207, '2015-05-04', '05:17:00', 'Proceso', 'DELETE FROM proceso WHERE peraca=1 AND idtipo=8  ', 'D15341271');
INSERT INTO bitacora VALUES (3208, '2015-05-04', '05:40:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-06-03,2015-06-13,A,8)', 'D15341271');
INSERT INTO bitacora VALUES (3209, '2015-05-04', '05:31:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-WEB WHERE (mod_codigo=1)', 'D15341271');
INSERT INTO bitacora VALUES (3210, '2015-05-04', '06:15:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-COMPOSE WHERE (mod_codigo=1)', 'D15341271');
INSERT INTO bitacora VALUES (3211, '2015-05-04', '06:34:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-WEB WHERE (mod_codigo=1)', 'D15341271');
INSERT INTO bitacora VALUES (3212, '2015-05-06', '12:10:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-BOOK WHERE (mod_codigo=1)', 'D21057251');
INSERT INTO bitacora VALUES (3213, '2015-05-06', '12:28:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-WEB WHERE (mod_codigo=1)', 'D21057251');
INSERT INTO bitacora VALUES (3214, '2015-05-07', '08:50:00', 'Submodulo', 'INSERT INTO submodulo (sub_codigo,sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (51,RESULTADO INSCRIPCION,A,2,3,vis_Rep_Inscritos.php)', 'D21057251');
INSERT INTO bitacora VALUES (3215, '2015-05-07', '08:11:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D21057251');
INSERT INTO bitacora VALUES (3216, '2015-05-07', '08:17:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D21057251');
INSERT INTO bitacora VALUES (3217, '2015-05-07', '08:17:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D21057251');
INSERT INTO bitacora VALUES (3218, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D21057251');
INSERT INTO bitacora VALUES (3219, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D21057251');
INSERT INTO bitacora VALUES (3220, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D21057251');
INSERT INTO bitacora VALUES (3221, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D21057251');
INSERT INTO bitacora VALUES (3222, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D21057251');
INSERT INTO bitacora VALUES (3223, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),48)', 'D21057251');
INSERT INTO bitacora VALUES (3224, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D21057251');
INSERT INTO bitacora VALUES (3225, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D21057251');
INSERT INTO bitacora VALUES (3226, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D21057251');
INSERT INTO bitacora VALUES (3227, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D21057251');
INSERT INTO bitacora VALUES (3228, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D21057251');
INSERT INTO bitacora VALUES (3229, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D21057251');
INSERT INTO bitacora VALUES (3230, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),47)', 'D21057251');
INSERT INTO bitacora VALUES (3231, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D21057251');
INSERT INTO bitacora VALUES (3232, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D21057251');
INSERT INTO bitacora VALUES (3233, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D21057251');
INSERT INTO bitacora VALUES (3234, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),50)', 'D21057251');
INSERT INTO bitacora VALUES (3235, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D21057251');
INSERT INTO bitacora VALUES (3236, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D21057251');
INSERT INTO bitacora VALUES (3237, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D21057251');
INSERT INTO bitacora VALUES (3238, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),51)', 'D21057251');
INSERT INTO bitacora VALUES (3239, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D21057251');
INSERT INTO bitacora VALUES (3240, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D21057251');
INSERT INTO bitacora VALUES (3241, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D21057251');
INSERT INTO bitacora VALUES (3242, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D21057251');
INSERT INTO bitacora VALUES (3243, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D21057251');
INSERT INTO bitacora VALUES (3244, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D21057251');
INSERT INTO bitacora VALUES (3245, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D21057251');
INSERT INTO bitacora VALUES (3246, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D21057251');
INSERT INTO bitacora VALUES (3247, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D21057251');
INSERT INTO bitacora VALUES (3248, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D21057251');
INSERT INTO bitacora VALUES (3249, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D21057251');
INSERT INTO bitacora VALUES (3250, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),49)', 'D21057251');
INSERT INTO bitacora VALUES (3251, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D21057251');
INSERT INTO bitacora VALUES (3252, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D21057251');
INSERT INTO bitacora VALUES (3253, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D21057251');
INSERT INTO bitacora VALUES (3254, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D21057251');
INSERT INTO bitacora VALUES (3255, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D21057251');
INSERT INTO bitacora VALUES (3256, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D21057251');
INSERT INTO bitacora VALUES (3257, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D21057251');
INSERT INTO bitacora VALUES (3258, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D21057251');
INSERT INTO bitacora VALUES (3259, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D21057251');
INSERT INTO bitacora VALUES (3260, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D21057251');
INSERT INTO bitacora VALUES (3261, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D21057251');
INSERT INTO bitacora VALUES (3262, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D21057251');
INSERT INTO bitacora VALUES (3263, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D21057251');
INSERT INTO bitacora VALUES (3264, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D21057251');
INSERT INTO bitacora VALUES (3265, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D21057251');
INSERT INTO bitacora VALUES (3266, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D21057251');
INSERT INTO bitacora VALUES (3267, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D21057251');
INSERT INTO bitacora VALUES (3268, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D21057251');
INSERT INTO bitacora VALUES (3269, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D21057251');
INSERT INTO bitacora VALUES (3270, '2015-05-07', '08:17:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D21057251');
INSERT INTO bitacora VALUES (3271, '2015-05-07', '08:09:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=JEFE DE SEGURIDAD)', 'D21057251');
INSERT INTO bitacora VALUES (3272, '2015-05-07', '08:39:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (3273, '2015-05-07', '08:39:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD))', 'D21057251');
INSERT INTO bitacora VALUES (3274, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),100)', 'D21057251');
INSERT INTO bitacora VALUES (3275, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),14)', 'D21057251');
INSERT INTO bitacora VALUES (3276, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),13)', 'D21057251');
INSERT INTO bitacora VALUES (3277, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),51)', 'D21057251');
INSERT INTO bitacora VALUES (3278, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),5)', 'D21057251');
INSERT INTO bitacora VALUES (3279, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),2)', 'D21057251');
INSERT INTO bitacora VALUES (3280, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),45)', 'D21057251');
INSERT INTO bitacora VALUES (3281, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),1)', 'D21057251');
INSERT INTO bitacora VALUES (3282, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),26)', 'D21057251');
INSERT INTO bitacora VALUES (3283, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),29)', 'D21057251');
INSERT INTO bitacora VALUES (3284, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),28)', 'D21057251');
INSERT INTO bitacora VALUES (3285, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),27)', 'D21057251');
INSERT INTO bitacora VALUES (3286, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),43)', 'D21057251');
INSERT INTO bitacora VALUES (3287, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),25)', 'D21057251');
INSERT INTO bitacora VALUES (3288, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),47)', 'D21057251');
INSERT INTO bitacora VALUES (3289, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),48)', 'D21057251');
INSERT INTO bitacora VALUES (3290, '2015-05-07', '08:39:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SEGURIDAD),50)', 'D21057251');
INSERT INTO bitacora VALUES (3291, '2015-05-20', '04:46:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=4,car_status=A WHERE(car_nombre=JEFE DE SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (3293, '2015-05-20', '05:44:00', 'Tipo de Proceso', 'INSERT INTO tipo_proceso (idtipo_pro,nombre,estatus,borrado,padre,modulo,holgura)VALUES(9,KSADLKAJSNDL,A,I,NULL,5,0,)', 'D15341271');
INSERT INTO bitacora VALUES (3294, '2015-05-20', '05:06:00', 'Tipo de Proceso', 'INSERT INTO tipo_proceso (idtipo_pro,nombre,estatus,borrado,padre,modulo,holgura)VALUES(9,KSADLKAJSNDL,A,I,NULL,5,0)', 'D15341271');
INSERT INTO bitacora VALUES (3295, '2015-05-20', '05:28:00', 'Tipo de Proceso', 'UPDATE tipo_proceso SET borrado=A WHERE(idtipo_pro=9)', 'D15341271');
INSERT INTO bitacora VALUES (3296, '2015-05-20', '06:39:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=PROCESO,sub_estatus=A,fk_mod_codigo=4,sub_tipo=1,sub_ruta=vis_Proceso.php WHERE (sub_codigo=14)', 'D15341271');
INSERT INTO bitacora VALUES (3297, '2015-05-20', '06:00:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=TIPO DE PROCESO,sub_estatus=A,fk_mod_codigo=4,sub_tipo=1,sub_ruta=vis_TipoPro.php WHERE (sub_codigo=13)', 'D15341271');
INSERT INTO bitacora VALUES (3298, '2015-05-20', '06:27:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=ADMINISTRATIVO,sub_estatus=A,fk_mod_codigo=6,sub_tipo=1,sub_ruta=vis_Administrativo.php WHERE (sub_nombre=ADMINISTRATIVO)', 'D15341271');
INSERT INTO bitacora VALUES (3299, '2015-05-20', '06:02:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=ADMINISTRATIVO,sub_estatus=A,fk_mod_codigo=1,sub_tipo=1,sub_ruta=vis_Administrativo.php WHERE (sub_nombre=ADMINISTRATIVO)', 'D15341271');
INSERT INTO bitacora VALUES (3300, '2015-05-20', '07:37:00', 'Modulo', 'DELETE FROM modulo WHERE (mod_nombre=POSTGRADO)', 'D15341271');
INSERT INTO bitacora VALUES (3301, '2015-05-20', '07:10:00', 'Modulo', 'INSERT INTO modulo (mod_nombre,mod_estatus,mod_color,mod_icon_clases)VALUES (POSTGRADO,A,#C92828,ICON ICON-WHITE ICON-GLOBE)', 'D15341271');
INSERT INTO bitacora VALUES (3302, '2015-05-20', '07:39:00', 'Modulo', 'INSERT INTO modulo (mod_nombre,mod_estatus,mod_color,mod_icon_clases)VALUES (POSTGRADO,A,#A92525,ICON ICON-WHITE ICON-LOCKED)', 'D15341271');
INSERT INTO bitacora VALUES (3303, '2015-05-20', '07:39:00', 'Modulo', '', 'D15341271');
INSERT INTO bitacora VALUES (3304, '2015-05-21', '02:08:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-CLIPBOARD WHERE (mod_nombre=GENERAL)', 'D21057251');
INSERT INTO bitacora VALUES (3305, '2015-05-21', '02:28:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-GLOBE WHERE (mod_nombre=GENERAL)', 'D21057251');
INSERT INTO bitacora VALUES (3306, '2015-05-21', '02:12:00', 'Modulo', 'UPDATE modulo SET mod_nombre=SECRETARIA,mod_estatus=A, mod_color=#2980B9, mod_icon_clases=ICON ICON-WHITE ICON-HOME WHERE (mod_nombre=SECRETARIA)', 'D21057251');
INSERT INTO bitacora VALUES (3307, '2015-05-21', '02:39:00', 'Modulo', 'UPDATE modulo SET mod_nombre=SECRETARIA,mod_estatus=A, mod_color=#2980B9, mod_icon_clases=ICON ICON-WHITE ICON-BRIEFCASE WHERE (mod_nombre=SECRETARIA)', 'D21057251');
INSERT INTO bitacora VALUES (3308, '2015-05-22', '03:12:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-CLOCK WHERE (mod_nombre=GENERAL)', 'D15341271');
INSERT INTO bitacora VALUES (3309, '2015-05-22', '03:33:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-WEB WHERE (mod_nombre=GENERAL)', 'D15341271');
INSERT INTO bitacora VALUES (3310, '2015-05-22', '03:49:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (3311, '2015-05-22', '03:13:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3312, '2015-05-22', '03:13:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3313, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (3314, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (3315, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (3316, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (3317, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3318, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (3319, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3320, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3321, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D15341271');
INSERT INTO bitacora VALUES (3322, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3323, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (3324, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (3325, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (3326, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3327, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (3328, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (3329, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),51)', 'D15341271');
INSERT INTO bitacora VALUES (3330, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (3331, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (3332, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),47)', 'D15341271');
INSERT INTO bitacora VALUES (3333, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (3334, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (3335, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (3336, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (3337, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (3338, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (3339, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (3340, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),48)', 'D15341271');
INSERT INTO bitacora VALUES (3341, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (3342, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (3343, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (3344, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),50)', 'D15341271');
INSERT INTO bitacora VALUES (3345, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (3346, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (3347, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (3348, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (3349, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3350, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (3351, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (3352, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (3353, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3354, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (3355, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3356, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (3357, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (3358, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3359, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3360, '2015-05-22', '03:13:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),49)', 'D15341271');
INSERT INTO bitacora VALUES (3361, '2015-05-22', '03:22:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3362, '2015-05-22', '03:22:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA))', 'D15341271');
INSERT INTO bitacora VALUES (3363, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),48)', 'D15341271');
INSERT INTO bitacora VALUES (3364, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),47)', 'D15341271');
INSERT INTO bitacora VALUES (3365, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),13)', 'D15341271');
INSERT INTO bitacora VALUES (3366, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),14)', 'D15341271');
INSERT INTO bitacora VALUES (3367, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),26)', 'D15341271');
INSERT INTO bitacora VALUES (3368, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),43)', 'D15341271');
INSERT INTO bitacora VALUES (3369, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),28)', 'D15341271');
INSERT INTO bitacora VALUES (3370, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),27)', 'D15341271');
INSERT INTO bitacora VALUES (3371, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),25)', 'D15341271');
INSERT INTO bitacora VALUES (3372, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),29)', 'D15341271');
INSERT INTO bitacora VALUES (3373, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),50)', 'D15341271');
INSERT INTO bitacora VALUES (3374, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),37)', 'D15341271');
INSERT INTO bitacora VALUES (3375, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),36)', 'D15341271');
INSERT INTO bitacora VALUES (3376, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),35)', 'D15341271');
INSERT INTO bitacora VALUES (3377, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),23)', 'D15341271');
INSERT INTO bitacora VALUES (3378, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (3379, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),100)', 'D15341271');
INSERT INTO bitacora VALUES (3380, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),21)', 'D15341271');
INSERT INTO bitacora VALUES (3381, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),19)', 'D15341271');
INSERT INTO bitacora VALUES (3382, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),20)', 'D15341271');
INSERT INTO bitacora VALUES (3383, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),22)', 'D15341271');
INSERT INTO bitacora VALUES (3384, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (3385, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),1)', 'D15341271');
INSERT INTO bitacora VALUES (3386, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3387, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),49)', 'D15341271');
INSERT INTO bitacora VALUES (3388, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),8)', 'D15341271');
INSERT INTO bitacora VALUES (3389, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),11)', 'D15341271');
INSERT INTO bitacora VALUES (3390, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),4)', 'D15341271');
INSERT INTO bitacora VALUES (3391, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3392, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3393, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3394, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),10)', 'D15341271');
INSERT INTO bitacora VALUES (3395, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3396, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),9)', 'D15341271');
INSERT INTO bitacora VALUES (3397, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),12)', 'D15341271');
INSERT INTO bitacora VALUES (3398, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3399, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),15)', 'D15341271');
INSERT INTO bitacora VALUES (3400, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),38)', 'D15341271');
INSERT INTO bitacora VALUES (3401, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),33)', 'D15341271');
INSERT INTO bitacora VALUES (3402, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),32)', 'D15341271');
INSERT INTO bitacora VALUES (3403, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),44)', 'D15341271');
INSERT INTO bitacora VALUES (3404, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),51)', 'D15341271');
INSERT INTO bitacora VALUES (3405, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),17)', 'D15341271');
INSERT INTO bitacora VALUES (3406, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),16)', 'D15341271');
INSERT INTO bitacora VALUES (3407, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),5)', 'D15341271');
INSERT INTO bitacora VALUES (3408, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),7)', 'D15341271');
INSERT INTO bitacora VALUES (3409, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),40)', 'D15341271');
INSERT INTO bitacora VALUES (3410, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),18)', 'D15341271');
INSERT INTO bitacora VALUES (3411, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),34)', 'D15341271');
INSERT INTO bitacora VALUES (3412, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3413, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),39)', 'D15341271');
INSERT INTO bitacora VALUES (3414, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),45)', 'D15341271');
INSERT INTO bitacora VALUES (3415, '2015-05-22', '03:22:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=ADMINISTRADOR DEL SISTEMA),3)', 'D15341271');
INSERT INTO bitacora VALUES (3416, '2015-05-25', '11:54:00', 'Proceso', 'INSERT INTO proceso (peraca,fecha_ini,fecha_final,estatus,idtipo)  VALUES (1,2015-05-29,2015-05-31,A,2)', 'D15341271');
INSERT INTO bitacora VALUES (3417, '2015-05-26', '12:28:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-20657234,MARIA,EUYENNY,OCANTO,MEJIAS,LACHIQUITA19952@HOTMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3418, '2015-05-26', '12:28:00', 'Docente', 'INSERT INTO docente (cedula_doc,estatus,borrado,dedicacion) VALUES(V-20657234,A,I,1)', 'D15341271');
INSERT INTO bitacora VALUES (3419, '2015-05-26', '12:29:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (D20657234,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,2,V-20657234)', 'D15341271');
INSERT INTO bitacora VALUES (3420, '2015-05-26', '12:40:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D20657234)', 'D15341271');
INSERT INTO bitacora VALUES (3421, '2015-05-26', '12:40:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(7,D20657234)', 'D15341271');
INSERT INTO bitacora VALUES (3422, '2015-05-26', '12:54:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-21058793,MOISES,ALEJANDRO,PICHARDO,TORREALBA,MOISES.PICHARDO@HOTMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3423, '2015-05-26', '12:49:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D21058793)', 'D15341271');
INSERT INTO bitacora VALUES (3424, '2015-05-26', '12:49:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(1,D21058793)', 'D15341271');
INSERT INTO bitacora VALUES (3425, '2015-05-26', '12:28:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=3,car_status=A WHERE(car_nombre=JEFE DE SECRETARIA)', 'D15341271');
INSERT INTO bitacora VALUES (3426, '2015-05-26', '12:42:00', 'Asignar', 'DELETE FROM permiso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA))', 'D15341271');
INSERT INTO bitacora VALUES (3427, '2015-05-26', '12:42:00', 'Asignar', 'DELETE FROM permiso_proceso WHERE(fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA))', 'D15341271');
INSERT INTO bitacora VALUES (3428, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),12)', 'D15341271');
INSERT INTO bitacora VALUES (3429, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),2)', 'D15341271');
INSERT INTO bitacora VALUES (3430, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),44)', 'D15341271');
INSERT INTO bitacora VALUES (3431, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),18)', 'D15341271');
INSERT INTO bitacora VALUES (3432, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),45)', 'D15341271');
INSERT INTO bitacora VALUES (3433, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),15)', 'D15341271');
INSERT INTO bitacora VALUES (3434, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),17)', 'D15341271');
INSERT INTO bitacora VALUES (3435, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),51)', 'D15341271');
INSERT INTO bitacora VALUES (3436, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),6)', 'D15341271');
INSERT INTO bitacora VALUES (3437, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),39)', 'D15341271');
INSERT INTO bitacora VALUES (3438, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),16)', 'D15341271');
INSERT INTO bitacora VALUES (3439, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),32)', 'D15341271');
INSERT INTO bitacora VALUES (3440, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),38)', 'D15341271');
INSERT INTO bitacora VALUES (3441, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),40)', 'D15341271');
INSERT INTO bitacora VALUES (3442, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),34)', 'D15341271');
INSERT INTO bitacora VALUES (3443, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),33)', 'D15341271');
INSERT INTO bitacora VALUES (3444, '2015-05-26', '12:42:00', 'Asignar', 'INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ((SELECT car_codigo FROM cargo WHERE car_nombre=JEFE DE SECRETARIA),14)', 'D15341271');
INSERT INTO bitacora VALUES (3445, '2015-05-26', '12:43:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=A21060661)', 'D15341271');
INSERT INTO bitacora VALUES (3446, '2015-05-26', '12:44:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(2,A21060661)', 'D15341271');
INSERT INTO bitacora VALUES (3447, '2015-05-26', '12:55:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-21059374,VICTOR,ALFONSO,VILLALBA,MARQUEZ,VICTORVILLALBA_211@HOTMAIL.ES)', 'D15341271');
INSERT INTO bitacora VALUES (3448, '2015-05-26', '12:55:00', 'Administrativo', 'INSERT INTO administrativo (cedula_admin,estatus,borrado) VALUES(V-21059374,A,I)', 'D15341271');
INSERT INTO bitacora VALUES (3449, '2015-05-26', '12:56:00', 'Usuario', 'INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES (A21059374,2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8,1,V-21059374)', 'D15341271');
INSERT INTO bitacora VALUES (3450, '2015-05-26', '12:41:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=A21059374)', 'D15341271');
INSERT INTO bitacora VALUES (3451, '2015-05-26', '12:41:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(7,A21059374)', 'D15341271');
INSERT INTO bitacora VALUES (3452, '2015-05-26', '12:37:00', 'Asignar Cargo', 'DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre=D21057251)', 'D15341271');
INSERT INTO bitacora VALUES (3453, '2015-05-26', '12:37:00', 'Carrera', 'INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES(3,D21057251)', 'D15341271');
INSERT INTO bitacora VALUES (3454, '2015-05-26', '12:10:00', 'Persona', 'INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES(V-17945451,LUIS,CARLOS,LINARES,CATARI,LINARES0134@GMAIL.COM)', 'D15341271');
INSERT INTO bitacora VALUES (3455, '2015-05-26', '01:13:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=I,nombre=2015-II WHERE nombre=2015-II', 'D15341271');
INSERT INTO bitacora VALUES (3456, '2015-05-26', '01:33:00', 'Persona', 'UPDATE persona SET  nombre1=VICTOR, nombre2=ALFONSO, apellido1=VILLALBA, apellido2=MARQUEZ, fecha_nac=1992-07-10, lugar_naci=ARAURE, edociv=S, sexo=M, telefono=, c_electronico=VICTORVILLALBA_211@HOTMAIL.ES, idciudad=1, direccionesp= WHERE (cedula=V-21059374)', 'A21059374');
INSERT INTO bitacora VALUES (3457, '2015-05-26', '01:33:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=A21059374', 'A21059374');
INSERT INTO bitacora VALUES (3458, '2015-05-26', '01:33:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A21059374,¿NOMBRE DE MASCOTA?,LUCY)', 'A21059374');
INSERT INTO bitacora VALUES (3459, '2015-05-26', '01:33:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A21059374,¿PRIMER NOMBRE?,VICTOR)', 'A21059374');
INSERT INTO bitacora VALUES (3460, '2015-05-26', '01:33:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(A21059374,¿SEGUNDO APELLIDO?,MARQUEZ)', 'A21059374');
INSERT INTO bitacora VALUES (3461, '2015-05-26', '02:05:00', 'Periodo Academico', 'UPDATE peraca SET fecha_ini=2015-01-19,fecha_fin=2015-06-06,estatus=A,nombre=2015-II WHERE nombre=2015-II', 'D15341271');
INSERT INTO bitacora VALUES (3462, '2015-05-26', '02:12:00', 'Modulo', 'DELETE FROM modulo WHERE (mod_nombre=AUDITORIA)', 'D15341271');
INSERT INTO bitacora VALUES (3463, '2015-05-26', '03:44:00', 'Modulo', 'INSERT INTO modulo (mod_nombre,mod_estatus,mod_color,mod_icon_clases)VALUES (AUDITORIA,A,#1030AC,ICON ICON-WHITE ICON-RSSFEED)', 'D15341271');
INSERT INTO bitacora VALUES (3464, '2015-05-26', '03:58:00', 'Submodulo', 'INSERT INTO submodulo (sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (BITACORA,A,12,2,vis_ServConf.php)', 'D15341271');
INSERT INTO bitacora VALUES (3465, '2015-05-26', '03:19:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=CONFIGURACION,sub_estatus=A,fk_mod_codigo=12,sub_tipo=2,sub_ruta=vis_ServConf.php WHERE (sub_nombre=CONFIGURACION)', 'D15341271');
INSERT INTO bitacora VALUES (3466, '2015-05-26', '03:54:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=2,car_status=A WHERE(car_nombre=ADMINISTRADOR DEL SISTEMA)', 'D15341271');
INSERT INTO bitacora VALUES (3467, '2015-05-26', '03:01:00', 'Modulo', 'UPDATE modulo SET mod_nombre=AUDITORIA,mod_estatus=A, mod_color=#1030AC, mod_icon_clases=ICON ICON-WHITE ICON-STAR-ON WHERE (mod_nombre=AUDITORIA)', 'D15341271');
INSERT INTO bitacora VALUES (3468, '2015-05-26', '03:31:00', 'Persona', 'UPDATE persona SET  nombre1=MOISES, nombre2=ALEJADRO, apellido1=PICHARDO, apellido2=TORREALBA, fecha_nac=1992-09-01, lugar_naci=ACARIGUA, edociv=S, sexo=M, telefono=0000000000, c_electronico=MOISES.PICHARDO@HOTMAIL.COM, idciudad=1, direccionesp= WHERE (cedula=V-21058793)', 'D21058793');
INSERT INTO bitacora VALUES (3469, '2015-05-26', '03:31:00', 'usuario_pregunta', 'DELETE FROM usuario_pregunta WHERE usuario=D21058793', 'D21058793');
INSERT INTO bitacora VALUES (3470, '2015-05-26', '03:31:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D21058793,¿NOMBRE DE MASCOTA?,LOGAN)', 'D21058793');
INSERT INTO bitacora VALUES (3471, '2015-05-26', '03:31:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D21058793,¿PRIMER NOMBRE?,MOISES)', 'D21058793');
INSERT INTO bitacora VALUES (3472, '2015-05-26', '03:31:00', 'usuario_pregunta', 'INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES(D21058793,¿SEGUNDO APELLIDO?,TORREALBA)', 'D21058793');
INSERT INTO bitacora VALUES (3473, '2015-05-29', '04:22:00', 'Solicitud', 'INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES (V-20025035,1,,P,por motivo de salud,Null,Null,2015-05-29)', 'E20025035');
INSERT INTO bitacora VALUES (3474, '2015-05-29', '04:25:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-20025035) AND (peraca=1) AND (pm_codigo=138)', 'E20025035');
INSERT INTO bitacora VALUES (3475, '2015-05-29', '04:25:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-20025035) AND (peraca=1) AND (pm_codigo=139)', 'E20025035');
INSERT INTO bitacora VALUES (3476, '2015-05-29', '04:25:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2015-05-29,16:04:25,254,1)', 'E20025035');
INSERT INTO bitacora VALUES (3477, '2015-05-29', '04:25:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-20025035,2015-05-29,16:04:25,255,1)', 'E20025035');
INSERT INTO bitacora VALUES (3478, '2015-05-28', '07:52:00', 'Usuario', 'UPDATE usuario SET  contrasena=939b3c5d9e2aeb037cad38b300be67830861186da01a24b7e446a6a7378341e3d5fe0bb983f75d20f84a180fca25958650325126a042cdbc1343f56a81edc176, estatus=A  WHERE nombre=D21057251 ', 'D21057251');
INSERT INTO bitacora VALUES (3479, '2015-05-28', '07:25:00', 'Submodulo', 'INSERT INTO submodulo (sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (BITACORA,A,12,2,vis_ServConf.php)', 'D21057251');
INSERT INTO bitacora VALUES (3480, '2015-05-28', '07:34:00', 'Submodulo', 'INSERT INTO submodulo (sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)VALUES (BITACORA,A,12,2,vis_ServConf.php)', 'D21057251');
INSERT INTO bitacora VALUES (3481, '2015-05-28', '09:03:00', 'Submodulo', 'UPDATE submodulo SET sub_nombre=CONFIGURACION,sub_estatus=A,fk_mod_codigo=4,sub_tipo=2,sub_ruta=vis_ServConf.php WHERE (sub_nombre=CONFIGURACION)', 'D21057251');
INSERT INTO bitacora VALUES (3482, '2015-05-28', '09:26:00', 'Modulo', 'DELETE FROM modulo WHERE (mod_nombre=AUDITORIA)', 'D21057251');
INSERT INTO bitacora VALUES (3514, '2015-05-29', '01:20:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-PDF WHERE (mod_nombre=GENERAL)', 'D21057251');
INSERT INTO bitacora VALUES (3515, '2015-05-29', '01:46:00', 'Modulo', 'UPDATE modulo SET mod_nombre=GENERAL,mod_estatus=A, mod_color=#2C3E50, mod_icon_clases=ICON ICON-WHITE ICON-WEB WHERE (mod_nombre=GENERAL)', 'D21057251');
INSERT INTO bitacora VALUES (3516, '2015-05-29', '03:45:00', 'cargo', 'UPDATE cargo SET fk_dep_codigo=4,car_status=A WHERE(car_nombre=COORDINADOR DE CARRERA EN LICENCIATURA EN ECONOMIA SOCIAL)', 'D15341271');
INSERT INTO bitacora VALUES (3517, '2015-05-29', '09:54:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-17945451) AND (peraca=1) AND (pm_codigo=1)', 'E17945451');
INSERT INTO bitacora VALUES (3518, '2015-05-29', '09:54:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-17945451,2015-05-29,21:38:54,139,1)', 'E17945451');
INSERT INTO bitacora VALUES (3519, '2015-05-29', '09:54:00', 'Inscripcion', 'INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES (V-17945451,2015-05-29,21:38:54,137,1)', 'E17945451');
INSERT INTO bitacora VALUES (3520, '2015-05-29', '09:25:00', 'Inscripcion', 'DELETE FROM inscripcion_pre WHERE(cedula_est_pre=V-17945451) AND (peraca=1) AND (pm_codigo=137)', 'E17945451');
INSERT INTO bitacora VALUES (3521, '2015-06-03', '09:38:00', 'Planificacion De Secciones', 'DELETE FROM planificacion_sec WHERE (idplanificacion=61)', 'A4925159');


--
-- Data for Name: bitacora_acceso; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO bitacora_acceso VALUES (7, '2014-11-14', '07:35:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (8, '2014-11-14', '07:39:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (9, '2014-11-14', '07:47:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (10, '2014-11-14', '07:14:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (11, '2014-11-14', '07:37:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (12, '2014-11-14', '07:40:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (13, '2014-11-14', '08:20:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (14, '2014-11-14', '08:33:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (15, '2014-11-14', '08:11:00', '127.0.0.1', 'D21057251', 'Usuario Bloqueado');
INSERT INTO bitacora_acceso VALUES (16, '2014-11-14', '08:28:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (17, '2014-11-14', '08:31:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (18, '2014-11-14', '08:40:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (19, '2014-11-14', '08:59:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (20, '2014-11-14', '08:12:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (21, '2014-11-14', '08:10:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (22, '2014-11-14', '08:14:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (23, '2014-11-14', '08:51:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (24, '2014-11-14', '08:55:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (25, '2014-11-14', '08:26:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (26, '2014-11-14', '08:30:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (27, '2014-11-14', '08:10:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (28, '2014-11-14', '08:15:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (29, '2014-11-14', '08:38:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (30, '2014-11-14', '08:42:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (31, '2014-11-14', '08:14:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (32, '2014-11-14', '08:18:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (33, '2014-11-14', '08:32:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (34, '2014-11-14', '08:59:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (35, '2014-11-14', '08:18:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (36, '2014-11-14', '08:23:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (37, '2014-11-14', '08:14:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (38, '2014-11-14', '08:18:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (39, '2014-11-14', '08:04:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (40, '2014-11-14', '08:13:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (41, '2014-11-14', '08:07:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (42, '2014-11-14', '08:10:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (43, '2014-11-14', '08:23:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (44, '2014-11-14', '08:27:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (45, '2014-11-14', '08:37:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (46, '2014-11-14', '08:41:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (47, '2014-11-14', '09:04:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (48, '2014-11-14', '09:08:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (49, '2014-11-14', '09:56:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (50, '2014-11-14', '09:59:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (51, '2014-11-14', '09:56:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (52, '2014-11-14', '09:02:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (53, '2014-11-14', '09:15:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (54, '2014-11-14', '09:22:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (55, '2014-11-14', '09:58:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (56, '2014-11-14', '09:03:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (57, '2014-11-14', '09:01:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (58, '2014-11-14', '09:05:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (59, '2014-11-14', '09:40:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (60, '2014-11-14', '09:43:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (61, '2014-11-14', '09:48:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (62, '2014-11-14', '09:52:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (63, '2014-11-14', '09:00:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (64, '2014-11-14', '09:04:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (65, '2014-11-14', '09:19:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (66, '2014-11-14', '09:46:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (67, '2014-11-14', '09:28:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (68, '2014-11-14', '09:32:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (69, '2014-11-14', '09:36:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (70, '2014-11-14', '09:39:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (71, '2014-11-14', '09:57:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (72, '2014-11-14', '09:39:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (73, '2014-11-14', '09:01:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (74, '2014-11-14', '09:06:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (75, '2014-11-14', '09:53:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (76, '2014-11-14', '09:05:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (77, '2014-11-14', '09:05:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (78, '2014-11-14', '09:09:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (79, '2014-11-14', '09:57:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (80, '2014-11-14', '09:02:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (81, '2014-11-14', '09:55:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (82, '2014-11-14', '09:00:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (83, '2014-11-14', '09:33:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (84, '2014-11-14', '09:36:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (85, '2014-11-14', '09:03:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (86, '2014-11-14', '09:06:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (87, '2014-11-14', '09:37:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (88, '2014-11-14', '09:43:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (89, '2014-11-14', '09:08:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (90, '2014-11-14', '09:12:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (91, '2014-11-14', '09:57:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (92, '2014-11-14', '09:00:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (93, '2014-11-14', '09:39:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (94, '2014-11-14', '09:12:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (95, '2014-11-14', '09:13:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (96, '2014-11-14', '09:17:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (97, '2014-11-14', '09:19:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (98, '2014-11-14', '09:22:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (99, '2014-11-14', '09:10:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (100, '2014-11-14', '09:12:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (101, '2014-11-14', '10:48:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (102, '2014-11-14', '10:52:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (103, '2014-11-14', '10:54:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (104, '2014-11-14', '10:57:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (105, '2014-11-14', '10:12:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (106, '2014-11-14', '10:15:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (107, '2014-11-14', '10:32:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (108, '2014-11-14', '10:36:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (109, '2014-11-14', '10:30:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (110, '2014-11-14', '10:22:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (111, '2014-11-14', '10:25:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (113, '2014-11-14', '10:48:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (114, '2014-11-14', '10:51:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (116, '2014-11-14', '11:30:00', '127.0.0.1', 'D1988857', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (117, '2014-11-14', '11:37:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (118, '2014-11-14', '11:41:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (119, '2014-11-14', '11:44:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (120, '2014-11-14', '11:58:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (121, '2014-11-14', '11:07:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (122, '2014-11-14', '11:14:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (123, '2014-11-14', '11:02:00', '127.0.0.1', 'D15341271', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (124, '2014-11-14', '11:43:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (125, '2014-11-14', '11:21:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (126, '2014-11-14', '11:52:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (127, '2014-11-14', '11:06:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (128, '2014-11-15', '12:42:00', '127.0.0.1', 'D1988857', 'Cambio De Clave, Clave Caducada');
INSERT INTO bitacora_acceso VALUES (129, '2014-11-15', '12:19:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (130, '2014-11-15', '12:32:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (131, '2014-11-15', '12:03:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (132, '2014-11-15', '12:15:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (134, '2014-11-15', '01:12:00', '127.0.0.1', 'D1988857', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (135, '2014-11-15', '07:57:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (136, '2014-11-18', '10:21:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (137, '2014-11-18', '01:20:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (138, '2014-11-18', '01:01:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (139, '2014-11-18', '01:06:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (140, '2014-11-18', '06:46:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (141, '2014-11-18', '06:44:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (142, '2014-11-18', '06:50:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (143, '2014-11-18', '06:44:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (144, '2014-11-18', '06:56:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (145, '2014-11-18', '06:32:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (146, '2014-11-18', '06:37:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (147, '2014-11-18', '06:11:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (148, '2014-11-18', '06:18:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (149, '2014-11-18', '06:55:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (150, '2014-11-18', '06:00:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (151, '2014-11-18', '06:18:00', '127.0.0.1', 'D15341271', 'Cambio De Clave, Clave Caducada');
INSERT INTO bitacora_acceso VALUES (152, '2014-11-18', '06:22:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (153, '2014-11-18', '06:38:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (154, '2014-11-18', '06:40:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (155, '2014-11-18', '06:56:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (156, '2014-11-18', '06:51:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (157, '2014-11-18', '06:04:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (158, '2014-11-18', '06:07:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (159, '2014-11-18', '06:14:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (160, '2014-11-18', '06:20:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (161, '2014-11-18', '06:26:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (163, '2014-11-19', '05:08:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (164, '2014-11-19', '05:20:00', '127.0.0.1', 'D15341271', 'Cambio De Clave, Clave Caducada');
INSERT INTO bitacora_acceso VALUES (165, '2014-11-19', '05:23:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (166, '2014-11-19', '05:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (167, '2014-11-20', '10:37:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (168, '2014-11-20', '10:50:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (169, '2014-11-20', '10:10:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (170, '2014-11-20', '03:24:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (171, '2014-11-21', '09:04:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (172, '2014-11-21', '10:46:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (174, '2014-11-21', '10:52:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (175, '2014-11-21', '10:07:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (178, '2014-11-21', '10:18:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (179, '2014-11-21', '10:24:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (196, '2014-11-21', '01:59:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (197, '2014-11-21', '01:18:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (199, '2014-11-21', '01:34:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (200, '2014-11-21', '01:38:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (201, '2014-11-21', '01:40:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (202, '2014-11-21', '01:55:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (203, '2014-11-21', '01:25:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (204, '2014-11-21', '01:29:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (205, '2014-11-21', '01:37:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (206, '2014-11-21', '01:11:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (207, '2014-11-21', '04:40:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (208, '2014-11-21', '05:21:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (209, '2014-11-21', '05:32:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (210, '2014-11-21', '05:03:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (211, '2014-11-21', '05:09:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (212, '2014-11-22', '07:38:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (213, '2014-11-22', '07:46:00', '127.0.0.1', 'D15341271', 'Cambio De Clave, Clave Caducada');
INSERT INTO bitacora_acceso VALUES (217, '2014-11-22', '09:54:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (218, '2014-11-22', '09:03:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (219, '2014-11-22', '09:54:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (220, '2014-11-22', '09:59:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (221, '2014-11-22', '09:02:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (224, '2014-11-22', '09:51:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (225, '2014-11-22', '09:57:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (226, '2014-11-22', '09:39:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (227, '2014-11-22', '09:14:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (228, '2014-11-22', '01:33:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (229, '2014-11-22', '01:43:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (230, '2014-11-22', '01:15:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (231, '2014-11-22', '01:19:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (232, '2014-11-22', '01:49:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (233, '2014-11-22', '01:53:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (234, '2014-11-22', '01:03:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (235, '2014-11-22', '01:06:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (236, '2014-11-22', '01:11:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (237, '2014-11-22', '01:15:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (238, '2014-11-22', '01:32:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (240, '2014-11-22', '01:55:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (241, '2014-11-22', '01:01:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (242, '2014-11-22', '01:54:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (243, '2014-11-22', '01:18:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (244, '2014-11-22', '01:26:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (253, '2014-11-25', '10:11:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (254, '2014-11-25', '10:30:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (255, '2014-11-25', '10:15:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (256, '2014-11-25', '10:12:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (257, '2014-11-25', '10:10:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (258, '2014-11-25', '03:20:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (259, '2014-11-25', '03:27:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (260, '2014-11-26', '12:48:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (261, '2014-11-26', '12:18:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (262, '2014-11-26', '12:54:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (263, '2014-11-26', '12:59:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (264, '2014-11-26', '03:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (265, '2014-11-26', '03:29:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE17945451');
INSERT INTO bitacora_acceso VALUES (266, '2014-11-26', '03:22:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (267, '2014-11-26', '03:49:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (268, '2014-11-26', '03:35:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (269, '2014-11-26', '03:12:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (270, '2014-11-26', '03:14:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (271, '2014-11-26', '03:43:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioD20041540');
INSERT INTO bitacora_acceso VALUES (272, '2014-11-26', '03:51:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (273, '2014-11-26', '03:27:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (274, '2014-11-26', '04:11:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (275, '2014-11-26', '04:50:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (276, '2014-11-26', '04:13:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (277, '2014-11-26', '04:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (278, '2014-11-26', '04:21:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (279, '2014-11-26', '04:01:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (280, '2014-11-26', '04:15:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (281, '2014-11-26', '04:37:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (282, '2014-11-26', '04:32:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (283, '2014-11-26', '04:23:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (284, '2014-11-26', '04:49:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (285, '2014-11-26', '04:41:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (286, '2014-11-26', '05:32:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (287, '2014-11-26', '05:49:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (288, '2014-11-26', '06:04:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (289, '2014-11-26', '03:07:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (290, '2014-11-26', '03:13:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (291, '2014-11-26', '03:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (292, '2014-11-27', '03:11:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (293, '2014-11-27', '03:27:00', '127.0.0.1', 'E20025035', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (294, '2014-11-27', '03:10:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (295, '2014-11-27', '03:49:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (296, '2014-11-30', '06:33:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (297, '2014-11-30', '06:46:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (298, '2014-11-30', '06:53:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (299, '2014-11-30', '06:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (300, '2014-11-30', '07:06:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (301, '2014-11-30', '12:13:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (302, '2014-11-30', '02:01:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (303, '2014-11-30', '03:02:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE21057292');
INSERT INTO bitacora_acceso VALUES (304, '2014-12-01', '03:16:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (305, '2014-12-01', '03:35:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (306, '2014-12-01', '04:45:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (307, '2014-12-01', '04:41:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (308, '2014-12-01', '05:33:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (309, '2014-12-01', '05:07:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (310, '2014-12-01', '05:20:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (311, '2014-12-01', '05:28:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (312, '2014-12-01', '05:34:00', '127.0.0.1', 'E20025035', 'Usuario Bloqueado');
INSERT INTO bitacora_acceso VALUES (313, '2014-12-01', '05:13:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (314, '2014-12-01', '05:15:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE20025035');
INSERT INTO bitacora_acceso VALUES (315, '2014-12-01', '05:24:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (316, '2014-12-01', '05:06:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (317, '2014-12-01', '05:29:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (318, '2014-12-01', '05:53:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (319, '2014-12-01', '05:42:00', '127.0.0.1', 'E20025035', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (320, '2014-12-01', '05:21:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (321, '2014-12-01', '05:18:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (322, '2014-12-01', '05:11:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (323, '2014-12-01', '05:34:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (324, '2014-12-01', '06:50:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (325, '2014-12-01', '06:28:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (326, '2014-12-01', '06:28:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (327, '2014-12-01', '06:04:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (328, '2014-12-01', '06:30:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (329, '2014-12-01', '06:24:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE1234');
INSERT INTO bitacora_acceso VALUES (330, '2014-12-01', '06:25:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE17945455');
INSERT INTO bitacora_acceso VALUES (331, '2014-12-01', '06:26:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE17945458');
INSERT INTO bitacora_acceso VALUES (332, '2014-12-01', '06:38:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (333, '2014-12-01', '12:48:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (334, '2014-12-01', '12:45:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (335, '2014-12-01', '12:59:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (336, '2014-12-01', '12:21:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (337, '2014-12-01', '12:31:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (338, '2014-12-01', '12:44:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (340, '2015-01-14', '05:00:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (341, '2015-01-14', '05:46:00', '127.0.0.1', 'A4925159', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (342, '2015-01-14', '05:53:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (343, '2015-01-14', '05:46:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (344, '2015-01-14', '05:10:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (345, '2015-01-14', '05:35:00', '127.0.0.1', 'A4925159', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (346, '2015-01-14', '05:38:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (347, '2015-01-14', '05:57:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (348, '2015-01-14', '05:04:00', '127.0.0.1', 'A4925159', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (349, '2015-01-14', '05:24:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (350, '2015-01-14', '05:55:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (351, '2015-01-14', '06:22:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (352, '2015-01-14', '06:40:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (353, '2015-01-14', '06:26:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (354, '2015-01-14', '06:41:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (355, '2015-01-14', '06:32:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (356, '2015-01-14', '06:50:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (357, '2015-01-14', '06:11:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (358, '2015-01-19', '02:04:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (359, '2015-01-19', '02:35:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (360, '2015-01-19', '02:21:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (361, '2015-01-19', '02:38:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (362, '2015-01-19', '03:33:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (363, '2015-01-19', '03:37:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (364, '2015-01-19', '03:12:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (365, '2015-01-19', '03:30:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (366, '2015-01-19', '03:53:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (367, '2015-01-19', '03:22:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (368, '2015-01-19', '03:36:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (369, '2015-01-19', '03:22:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (370, '2015-01-19', '03:42:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (371, '2015-01-19', '03:30:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (372, '2015-01-19', '03:49:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (373, '2015-01-19', '03:57:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (374, '2015-01-19', '03:21:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (375, '2015-01-19', '03:18:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (376, '2015-01-19', '03:34:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (377, '2015-01-19', '03:26:00', '127.0.0.1', 'A4925159', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (378, '2015-01-19', '03:02:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (379, '2015-01-19', '03:31:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (380, '2015-01-19', '03:45:00', '127.0.0.1', 'D21057251', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (381, '2015-01-19', '03:33:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (382, '2015-01-19', '03:46:00', '127.0.0.1', 'D15341271', 'Usuario Bloqueado');
INSERT INTO bitacora_acceso VALUES (383, '2015-01-19', '03:47:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (384, '2015-01-19', '04:47:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (385, '2015-01-19', '04:05:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (386, '2015-01-19', '04:12:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (387, '2015-01-19', '04:25:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (388, '2015-01-19', '05:37:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (389, '2015-01-20', '05:56:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (390, '2015-01-20', '05:03:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (391, '2015-01-20', '05:18:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (392, '2015-01-28', '04:54:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (393, '2015-01-28', '04:22:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (394, '2015-01-28', '04:24:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD1988857');
INSERT INTO bitacora_acceso VALUES (395, '2015-01-28', '04:54:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (396, '2015-01-28', '04:08:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (397, '2015-01-28', '06:46:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (398, '2015-02-06', '05:09:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (399, '2015-02-06', '05:14:00', '127.0.0.1', 'A4925159', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (400, '2015-02-06', '05:25:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (402, '2015-02-06', '10:44:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (403, '2015-02-08', '10:19:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (404, '2015-02-09', '06:55:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (405, '2015-02-09', '09:53:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (406, '2015-02-09', '09:06:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (407, '2015-02-09', '09:48:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (408, '2015-02-09', '09:47:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (409, '2015-02-09', '09:21:00', '127.0.0.1', 'E21057252', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (410, '2015-02-09', '10:42:00', '127.0.0.1', 'E21057252', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (411, '2015-02-09', '10:06:00', '127.0.0.1', 'E21057252', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (412, '2015-02-09', '10:06:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (413, '2015-02-09', '10:22:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (414, '2015-02-09', '10:23:00', '127.0.0.1', 'E21057252', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (415, '2015-02-09', '10:37:00', '127.0.0.1', 'E21057252', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (416, '2015-02-09', '10:33:00', '127.0.0.1', 'E21057253', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (417, '2015-02-09', '10:45:00', '127.0.0.1', 'E21057253', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (418, '2015-02-10', '12:11:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (419, '2015-02-10', '11:40:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (420, '2015-02-10', '11:57:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (421, '2015-02-10', '11:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (422, '2015-02-10', '11:05:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (424, '2015-02-10', '11:40:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (425, '2015-02-11', '12:17:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (426, '2015-02-11', '12:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (427, '2015-02-11', '12:44:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (428, '2015-02-11', '12:56:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (429, '2015-02-11', '12:22:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (430, '2015-02-11', '12:41:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (431, '2015-02-11', '12:37:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (432, '2015-02-11', '12:35:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (433, '2015-02-11', '12:12:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (434, '2015-02-11', '04:32:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (435, '2015-02-11', '08:14:00', '127.0.0.1', 'D20041540', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (436, '2015-02-11', '08:24:00', '127.0.0.1', 'D20041540', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (437, '2015-02-11', '08:05:00', '127.0.0.1', 'D20041540', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (438, '2015-02-11', '08:44:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (439, '2015-02-11', '12:37:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (440, '2015-02-12', '10:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (442, '2015-02-12', '01:57:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (443, '2015-02-12', '02:17:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (444, '2015-02-12', '03:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (445, '2015-02-12', '05:57:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (447, '2015-02-12', '09:48:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (448, '2015-02-13', '02:43:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (449, '2015-02-13', '02:01:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (450, '2015-02-13', '02:14:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (451, '2015-02-13', '02:39:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioD21059298');
INSERT INTO bitacora_acceso VALUES (452, '2015-02-13', '02:40:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioD21058793');
INSERT INTO bitacora_acceso VALUES (453, '2015-02-13', '02:41:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE21057678');
INSERT INTO bitacora_acceso VALUES (454, '2015-02-13', '02:42:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioD20847202');
INSERT INTO bitacora_acceso VALUES (455, '2015-02-13', '02:43:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE21057267');
INSERT INTO bitacora_acceso VALUES (456, '2015-02-13', '02:43:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE21057266');
INSERT INTO bitacora_acceso VALUES (457, '2015-02-13', '02:44:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE21057264');
INSERT INTO bitacora_acceso VALUES (458, '2015-02-13', '02:45:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioE21057263');
INSERT INTO bitacora_acceso VALUES (459, '2015-02-13', '02:38:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE21057253');
INSERT INTO bitacora_acceso VALUES (460, '2015-02-13', '02:19:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (461, '2015-02-13', '03:33:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (462, '2015-02-14', '04:21:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (463, '2015-02-14', '05:48:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (464, '2015-02-14', '06:41:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (465, '2015-02-14', '06:57:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (466, '2015-02-14', '06:32:00', '127.0.0.1', 'E20025035', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (467, '2015-02-14', '06:43:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (468, '2015-02-16', '05:40:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (469, '2015-02-16', '05:06:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (470, '2015-02-16', '05:55:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (471, '2015-02-16', '05:01:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (472, '2015-02-16', '05:26:00', '127.0.0.1', 'D21057251', 'Usuario Bloqueado');
INSERT INTO bitacora_acceso VALUES (473, '2015-02-16', '05:47:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (474, '2015-02-16', '05:06:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioD21057251');
INSERT INTO bitacora_acceso VALUES (475, '2015-02-16', '05:11:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (476, '2015-02-16', '05:23:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (477, '2015-02-16', '09:15:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (478, '2015-02-16', '09:34:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (479, '2015-02-16', '09:12:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (480, '2015-02-16', '09:13:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (481, '2015-02-16', '09:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (482, '2015-02-16', '09:09:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (483, '2015-02-16', '09:21:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (484, '2015-02-16', '09:22:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (485, '2015-02-16', '09:14:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (486, '2015-02-16', '09:14:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (487, '2015-02-16', '09:18:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (488, '2015-02-16', '09:33:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (489, '2015-02-16', '10:13:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (490, '2015-02-16', '10:21:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (491, '2015-02-17', '06:14:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (492, '2015-02-17', '06:34:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (493, '2015-02-17', '07:38:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (494, '2015-02-17', '07:52:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (495, '2015-02-17', '07:32:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (496, '2015-02-17', '07:44:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (497, '2015-02-17', '07:23:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (498, '2015-02-17', '07:20:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (499, '2015-02-17', '07:38:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (500, '2015-02-17', '07:44:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada Con Exito');
INSERT INTO bitacora_acceso VALUES (501, '2015-02-17', '08:52:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (502, '2015-02-17', '08:58:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (503, '2015-02-17', '08:09:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (504, '2015-02-17', '08:26:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (505, '2015-02-17', '08:21:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (506, '2015-02-17', '08:32:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (507, '2015-02-17', '08:51:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (508, '2015-02-17', '08:57:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: _Bandeja.php');
INSERT INTO bitacora_acceso VALUES (509, '2015-02-17', '08:11:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (510, '2015-02-17', '08:32:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: Bandeja.php');
INSERT INTO bitacora_acceso VALUES (511, '2015-02-17', '08:08:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (512, '2015-02-17', '08:15:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: Bandeja.php');
INSERT INTO bitacora_acceso VALUES (513, '2015-02-17', '08:50:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (514, '2015-02-17', '08:48:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: Bandeja.php');
INSERT INTO bitacora_acceso VALUES (515, '2015-02-17', '08:33:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (516, '2015-02-17', '08:13:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (517, '2015-02-19', '12:47:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (518, '2015-02-19', '12:22:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (519, '2015-02-19', '08:17:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (520, '2015-02-19', '08:16:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (521, '2015-02-19', '08:32:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (522, '2015-02-19', '09:54:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (523, '2015-02-19', '09:17:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (524, '2015-02-19', '09:46:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (525, '2015-02-19', '10:55:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (526, '2015-02-19', '10:57:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (527, '2015-02-19', '10:09:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (528, '2015-02-19', '10:17:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: ServConf.php');
INSERT INTO bitacora_acceso VALUES (529, '2015-02-19', '10:47:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (530, '2015-02-19', '10:10:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: ServConf.php');
INSERT INTO bitacora_acceso VALUES (531, '2015-02-19', '10:40:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (532, '2015-02-19', '10:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: ServConf.php');
INSERT INTO bitacora_acceso VALUES (533, '2015-02-19', '10:42:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (534, '2015-02-19', '10:06:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (535, '2015-02-19', '10:44:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (536, '2015-02-19', '11:50:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (537, '2015-02-19', '11:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (538, '2015-02-20', '12:50:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (539, '2015-02-20', '12:52:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (540, '2015-02-20', '12:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (541, '2015-02-20', '12:12:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (542, '2015-02-20', '12:50:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (543, '2015-02-20', '01:47:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (544, '2015-02-20', '01:59:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (545, '2015-02-20', '01:06:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: ServConf.php');
INSERT INTO bitacora_acceso VALUES (546, '2015-02-20', '01:17:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (547, '2015-02-20', '01:47:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (548, '2015-02-20', '01:51:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (549, '2015-02-20', '01:04:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (550, '2015-02-20', '01:16:00', '127.0.0.1', 'E20025035', 'Session Cerrada por Entrar en zona no permitida: diante');
INSERT INTO bitacora_acceso VALUES (551, '2015-02-20', '01:33:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (552, '2015-02-20', '01:17:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (553, '2015-02-20', '01:29:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (554, '2015-02-20', '01:39:00', '127.0.0.1', 'E20025035', 'Session Cerrada por Entrar en zona no permitida: diante');
INSERT INTO bitacora_acceso VALUES (555, '2015-02-20', '01:57:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (556, '2015-02-20', '01:36:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (557, '2015-02-20', '01:47:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (558, '2015-02-20', '01:50:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (559, '2015-02-20', '01:01:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (560, '2015-02-20', '11:24:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (561, '2015-02-20', '05:57:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (562, '2015-02-20', '05:28:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (563, '2015-02-21', '12:53:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (564, '2015-02-21', '12:59:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (565, '2015-02-21', '12:57:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (566, '2015-02-21', '12:59:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (567, '2015-02-21', '01:04:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (568, '2015-02-21', '01:07:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (569, '2015-02-21', '01:45:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (570, '2015-02-21', '01:45:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (571, '2015-02-21', '01:07:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (572, '2015-02-21', '01:07:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (573, '2015-02-21', '01:31:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (574, '2015-02-21', '02:36:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (575, '2015-02-21', '02:14:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (576, '2015-02-21', '02:36:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (577, '2015-02-21', '02:12:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (578, '2015-02-21', '02:12:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (579, '2015-02-21', '02:31:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (580, '2015-02-21', '02:32:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (581, '2015-02-21', '03:30:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (582, '2015-02-21', '03:09:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (583, '2015-02-21', '03:24:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (584, '2015-02-21', '03:53:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (585, '2015-02-21', '12:43:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (586, '2015-02-21', '12:51:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (587, '2015-02-21', '12:00:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (588, '2015-02-21', '12:15:00', '127.0.0.1', 'D21057251', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (589, '2015-02-21', '12:21:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (590, '2015-02-21', '12:48:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (591, '2015-02-21', '12:01:00', '127.0.0.1', 'D21057251', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (592, '2015-02-21', '12:19:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (593, '2015-02-21', '12:39:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (594, '2015-02-21', '12:52:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (595, '2015-02-21', '12:06:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (596, '2015-02-21', '12:25:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (597, '2015-02-21', '12:34:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (598, '2015-02-21', '12:57:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (599, '2015-02-21', '12:12:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (600, '2015-02-21', '12:09:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (601, '2015-02-23', '11:03:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (602, '2015-02-23', '11:32:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (603, '2015-02-23', '11:51:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (604, '2015-02-23', '12:43:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (605, '2015-02-23', '12:54:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (606, '2015-02-23', '12:35:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (607, '2015-02-23', '12:45:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (608, '2015-02-23', '12:33:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (609, '2015-02-23', '12:46:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (610, '2015-02-23', '12:57:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (611, '2015-02-23', '12:06:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (612, '2015-02-23', '12:13:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (613, '2015-02-23', '12:23:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (614, '2015-02-23', '12:46:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (615, '2015-02-23', '01:01:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (616, '2015-02-23', '01:08:00', '127.0.0.1', 'D15341271', 'Session Cerrada por Entrar en zona no permitida: vistas');
INSERT INTO bitacora_acceso VALUES (617, '2015-02-23', '01:19:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (618, '2015-02-23', '03:54:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (619, '2015-02-23', '03:08:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (620, '2015-02-23', '03:42:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (621, '2015-02-23', '04:41:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (622, '2015-02-23', '04:13:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (623, '2015-02-23', '04:25:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (624, '2015-02-23', '04:12:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (625, '2015-02-23', '04:40:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (626, '2015-02-23', '04:50:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (627, '2015-02-23', '04:58:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (628, '2015-02-23', '04:48:00', '127.0.0.1', 'D15341271', 'Session Cerrada por Entrar en zona no permitida: vistas');
INSERT INTO bitacora_acceso VALUES (629, '2015-02-23', '04:37:00', '', 'D21057251', 'Usuario Bloqueado');
INSERT INTO bitacora_acceso VALUES (630, '2015-02-23', '04:24:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (631, '2015-02-23', '04:36:00', '127.0.0.1', 'D15341271', 'Session Cerrada por Entrar en zona no permitida: iguracion de Servidor');
INSERT INTO bitacora_acceso VALUES (632, '2015-02-23', '04:58:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (633, '2015-02-23', '04:32:00', '127.0.0.1', 'D15341271', 'Desbloqueo de UsuarioD21057251');
INSERT INTO bitacora_acceso VALUES (634, '2015-02-23', '04:54:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (635, '2015-02-23', '04:11:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (636, '2015-02-23', '04:21:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (637, '2015-02-24', '02:30:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (638, '2015-02-24', '03:58:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (639, '2015-02-24', '03:13:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (640, '2015-02-24', '03:19:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (641, '2015-02-24', '03:19:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (642, '2015-02-24', '07:55:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (643, '2015-02-24', '07:04:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (644, '2015-02-24', '07:09:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (645, '2015-02-24', '07:25:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (646, '2015-02-24', '08:49:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (647, '2015-02-24', '08:52:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (648, '2015-02-24', '08:54:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (649, '2015-02-24', '11:15:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (650, '2015-02-24', '11:11:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (651, '2015-02-24', '11:18:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (652, '2015-02-24', '11:23:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (653, '2015-02-25', '09:06:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (654, '2015-03-01', '02:35:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (655, '2015-03-01', '02:53:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (656, '2015-03-01', '02:11:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (657, '2015-03-01', '02:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (658, '2015-03-04', '08:23:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (659, '2015-03-04', '08:38:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (660, '2015-03-04', '08:57:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (661, '2015-03-04', '08:00:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (662, '2015-03-04', '08:46:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (663, '2015-03-04', '08:01:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (664, '2015-03-04', '08:05:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (665, '2015-03-04', '08:29:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (666, '2015-03-04', '08:05:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (667, '2015-03-04', '08:26:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (668, '2015-03-04', '08:24:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (669, '2015-03-04', '08:33:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (670, '2015-01-23', '08:34:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (671, '2015-01-23', '08:15:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (672, '2015-02-10', '09:39:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (673, '2015-02-10', '09:09:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (674, '2015-02-10', '09:20:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (675, '2015-02-10', '09:47:00', '127.0.0.1', 'E17945452', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (676, '2015-02-10', '09:29:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (677, '2015-02-10', '09:05:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (678, '2015-02-10', '09:14:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (702, '2015-03-06', '11:55:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (703, '2015-03-06', '11:03:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (704, '2015-03-08', '08:19:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (705, '2015-03-08', '08:53:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (706, '2015-03-08', '08:04:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (707, '2015-03-08', '08:16:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (708, '2015-03-08', '08:25:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (709, '2015-03-08', '08:43:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (710, '2015-03-08', '08:33:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (711, '2015-03-08', '09:15:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (712, '2015-03-08', '09:16:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioE17945452');
INSERT INTO bitacora_acceso VALUES (713, '2015-03-08', '09:20:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (714, '2015-03-10', '10:25:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (715, '2015-03-10', '10:52:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (716, '2015-03-10', '10:03:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (717, '2015-03-10', '10:30:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (718, '2015-03-10', '10:27:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (719, '2015-03-10', '10:00:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (720, '2015-03-10', '10:09:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (721, '2015-03-10', '10:11:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (722, '2015-03-10', '10:20:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (723, '2015-03-10', '01:10:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (724, '2015-03-10', '01:25:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (725, '2015-03-10', '03:20:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (726, '2015-03-10', '05:30:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (727, '2015-03-11', '07:57:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (728, '2015-03-11', '08:53:00', '127.0.0.1', 'D15341271', 'Session Cerrada por Entrar en zona no permitida: Submodulo.php');
INSERT INTO bitacora_acceso VALUES (729, '2015-03-11', '08:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (730, '2015-03-11', '08:40:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (731, '2015-03-11', '08:35:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioA4925159');
INSERT INTO bitacora_acceso VALUES (732, '2015-03-11', '08:36:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (733, '2015-03-11', '08:37:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (734, '2015-03-11', '08:40:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (735, '2015-03-11', '08:51:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (736, '2015-03-11', '09:21:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (737, '2015-03-11', '09:31:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (738, '2015-03-11', '09:34:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (739, '2015-03-11', '09:42:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (740, '2015-03-11', '09:10:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (741, '2015-03-11', '09:48:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (742, '2015-03-11', '08:09:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (743, '2015-03-11', '09:11:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (744, '2015-03-15', '12:21:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (745, '2015-03-15', '12:35:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: nte');
INSERT INTO bitacora_acceso VALUES (746, '2015-03-15', '12:02:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (747, '2015-03-15', '12:55:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: nte');
INSERT INTO bitacora_acceso VALUES (748, '2015-03-15', '12:27:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (749, '2015-03-15', '12:34:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: nte');
INSERT INTO bitacora_acceso VALUES (750, '2015-03-15', '12:15:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (751, '2015-03-15', '12:28:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (752, '2015-03-15', '12:41:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (753, '2015-03-15', '12:29:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (754, '2015-03-15', '12:41:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD1988857');
INSERT INTO bitacora_acceso VALUES (755, '2015-03-15', '12:47:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (756, '2015-03-15', '12:33:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (757, '2015-03-15', '12:48:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (758, '2015-03-15', '12:37:00', '127.0.0.1', 'D1988857', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (759, '2015-03-15', '12:52:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (760, '2015-03-15', '12:10:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (761, '2015-03-15', '12:31:00', '127.0.0.1', 'D1988857', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (762, '2015-03-15', '01:41:00', '127.0.0.1', 'D1988857', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (763, '2015-03-15', '04:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (764, '2015-03-15', '04:36:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (765, '2015-03-15', '05:18:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (766, '2015-03-15', '05:00:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (767, '2015-03-16', '09:45:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (768, '2015-03-16', '09:13:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (769, '2015-03-16', '03:28:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (770, '2015-03-16', '03:53:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (771, '2015-03-16', '03:02:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (772, '2015-03-16', '03:27:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (773, '2015-03-16', '03:42:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (774, '2015-03-16', '03:20:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (775, '2015-03-16', '03:42:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (776, '2015-03-16', '03:57:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (777, '2015-03-16', '03:08:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (778, '2015-03-16', '03:59:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (779, '2015-03-16', '03:08:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (780, '2015-03-16', '03:29:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (781, '2015-03-16', '03:17:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (782, '2015-03-16', '03:44:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (783, '2015-03-16', '03:55:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (784, '2015-03-16', '04:45:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (785, '2015-03-16', '04:54:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (786, '2015-03-16', '04:47:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (787, '2015-03-16', '04:57:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (788, '2015-03-16', '06:40:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (789, '2015-03-16', '06:12:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (790, '2015-03-16', '06:46:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (791, '2015-03-17', '09:33:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (792, '2015-03-17', '09:22:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (793, '2015-03-17', '10:08:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (794, '2015-03-17', '10:19:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (795, '2015-03-18', '05:02:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (796, '2015-03-18', '02:21:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (797, '2015-03-18', '02:36:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (798, '2015-03-18', '02:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (799, '2015-03-23', '03:48:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (800, '2015-03-23', '03:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (801, '2015-03-23', '03:16:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (802, '2015-03-23', '03:22:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (803, '2015-03-23', '03:39:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (804, '2015-03-23', '05:12:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (805, '2015-03-23', '09:54:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (806, '2015-03-23', '09:43:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (807, '2015-03-23', '09:52:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (808, '2015-03-23', '09:40:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (809, '2015-03-24', '01:35:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (810, '2015-03-24', '02:30:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (811, '2015-03-24', '02:19:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (812, '2015-03-24', '02:35:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (813, '2015-03-24', '02:44:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (814, '2015-03-24', '02:51:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (815, '2015-03-24', '02:52:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (816, '2015-03-25', '06:55:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (817, '2015-03-25', '06:25:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (818, '2015-03-25', '07:59:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (819, '2015-03-25', '07:30:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (820, '2015-03-25', '07:09:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (821, '2015-03-25', '07:21:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (822, '2015-03-25', '07:37:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (823, '2015-03-25', '07:48:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (824, '2015-03-25', '07:09:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (825, '2015-03-25', '07:27:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (826, '2015-03-25', '07:30:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (827, '2015-03-25', '08:08:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (828, '2015-03-25', '08:12:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (829, '2015-03-25', '08:26:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (830, '2015-03-25', '08:20:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (831, '2015-03-25', '08:58:00', '127.0.0.1', 'D15341271', 'Session Cerrada por Entrar en zona no permitida: ____zonaEstudiante');
INSERT INTO bitacora_acceso VALUES (832, '2015-03-25', '08:56:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (833, '2015-03-25', '08:16:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (834, '2015-03-25', '08:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (835, '2015-03-25', '09:56:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (836, '2015-03-25', '09:19:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (837, '2015-06-04', '06:21:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (838, '2015-04-06', '02:44:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (839, '2015-04-06', '02:23:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (840, '2015-04-06', '02:32:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (841, '2015-04-06', '02:05:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (842, '2015-04-06', '02:15:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (843, '2015-04-06', '02:49:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (844, '2015-04-06', '08:56:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (845, '2015-04-06', '09:38:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (846, '2015-04-07', '05:11:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (847, '2015-04-07', '05:12:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (848, '2015-04-07', '05:25:00', '127.0.0.1', 'D15341271', 'Usuario Bloqueado');
INSERT INTO bitacora_acceso VALUES (849, '2015-04-07', '05:45:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (850, '2015-04-07', '05:10:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (851, '2015-04-07', '05:34:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (852, '2015-04-07', '05:16:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (853, '2015-04-07', '05:44:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (854, '2015-04-07', '05:22:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (855, '2015-04-07', '05:43:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (856, '2015-04-07', '05:32:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (857, '2015-04-07', '05:46:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (858, '2015-04-07', '05:08:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (859, '2015-04-07', '05:25:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (860, '2015-05-19', '05:47:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (861, '2015-05-19', '05:59:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (862, '2015-05-19', '05:50:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (863, '2015-05-19', '05:11:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (864, '2015-05-19', '05:15:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (865, '2015-04-07', '05:43:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (866, '2015-04-07', '06:22:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (867, '2015-04-07', '06:40:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (868, '2015-04-07', '06:18:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (869, '2015-04-07', '06:33:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (870, '2015-04-07', '06:31:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (871, '2015-04-07', '06:05:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (872, '2015-04-07', '06:23:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (873, '2015-05-07', '06:52:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (874, '2015-05-07', '06:00:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (875, '2015-05-07', '06:26:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (876, '2015-05-07', '06:40:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (877, '2015-05-07', '06:55:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (878, '2015-05-07', '06:27:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (879, '2015-05-07', '06:40:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (880, '2015-05-07', '06:27:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (881, '2015-05-07', '06:42:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (882, '2015-05-07', '06:36:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (883, '2015-05-07', '06:39:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (884, '2015-05-07', '06:40:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (885, '2015-05-07', '06:09:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (886, '2015-05-07', '06:09:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (887, '2015-04-08', '04:16:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (888, '2015-04-08', '10:37:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (889, '2015-04-08', '10:02:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (890, '2015-04-08', '10:22:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (891, '2015-04-08', '10:15:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (892, '2015-04-08', '10:41:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (893, '2015-04-08', '10:41:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (894, '2015-04-08', '10:27:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (895, '2015-04-08', '10:27:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (896, '2015-04-08', '10:01:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (897, '2015-04-08', '10:01:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (898, '2015-04-08', '10:26:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (899, '2015-04-08', '10:26:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (900, '2015-04-08', '10:41:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (901, '2015-04-08', '10:41:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (902, '2015-04-08', '10:52:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (903, '2015-04-08', '10:52:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (904, '2015-04-08', '10:25:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (905, '2015-04-08', '10:25:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (906, '2015-04-08', '10:57:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (907, '2015-04-08', '10:31:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (908, '2015-04-08', '10:02:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (909, '2015-04-08', '10:07:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (910, '2015-04-08', '10:20:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (911, '2015-04-08', '10:58:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (912, '2015-04-08', '10:11:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (913, '2015-04-08', '10:15:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (914, '2015-04-08', '11:39:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (915, '2015-04-08', '11:58:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (916, '2015-04-08', '11:32:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (917, '2015-04-08', '11:00:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (918, '2015-04-08', '11:54:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (919, '2015-04-08', '11:48:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (920, '2015-04-13', '10:12:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (921, '2015-04-13', '10:18:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (922, '2015-04-14', '02:38:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (923, '2015-04-19', '03:06:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (924, '2015-04-19', '03:22:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (925, '2015-04-19', '03:35:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (926, '2015-04-19', '05:12:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (927, '2015-04-19', '05:26:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (928, '2015-04-19', '05:44:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (929, '2015-04-19', '05:07:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (930, '2015-04-19', '05:59:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (931, '2015-04-19', '05:06:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (932, '2015-04-19', '06:52:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (933, '2015-04-19', '06:24:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (934, '2015-04-19', '06:34:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (935, '2015-04-19', '06:45:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (936, '2015-04-19', '06:47:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (937, '2015-04-19', '06:50:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (938, '2015-04-19', '06:25:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (939, '2015-04-19', '06:43:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (940, '2015-04-19', '06:58:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioA4925159');
INSERT INTO bitacora_acceso VALUES (941, '2015-04-19', '07:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (942, '2015-04-19', '07:12:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (943, '2015-04-19', '07:12:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (944, '2015-04-21', '05:07:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (945, '2015-04-21', '06:12:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (946, '2015-04-21', '06:46:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (947, '2015-04-21', '08:18:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (948, '2015-04-21', '08:35:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioA4925159');
INSERT INTO bitacora_acceso VALUES (949, '2015-04-21', '08:39:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (950, '2015-04-21', '08:51:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (951, '2015-04-21', '10:01:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (952, '2015-04-21', '10:12:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioA4925159');
INSERT INTO bitacora_acceso VALUES (953, '2015-04-21', '10:16:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (954, '2015-04-21', '10:30:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (955, '2015-04-21', '11:26:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (956, '2015-04-21', '11:54:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (957, '2015-04-22', '12:16:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (958, '2015-04-22', '12:50:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (959, '2015-04-22', '09:39:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (960, '2015-04-22', '09:57:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioE20025035');
INSERT INTO bitacora_acceso VALUES (961, '2015-04-22', '09:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (962, '2015-04-22', '09:12:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (963, '2015-04-22', '09:33:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (964, '2015-04-22', '09:45:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (965, '2015-04-22', '09:38:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (966, '2015-04-22', '09:49:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (967, '2015-04-22', '09:01:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (968, '2015-04-24', '05:51:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (969, '2015-04-24', '08:19:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (970, '2015-04-24', '09:13:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (971, '2015-04-24', '09:26:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (972, '2015-04-24', '09:35:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (973, '2015-04-24', '10:14:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (974, '2015-04-27', '01:09:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (975, '2015-04-27', '01:27:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (976, '2015-04-27', '01:36:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (977, '2015-04-27', '01:43:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (978, '2015-04-27', '01:56:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (979, '2015-04-27', '01:41:00', '127.0.0.1', 'D15341271', 'Session Cerrada por Entrar en zona no permitida: Rep_Horario.php');
INSERT INTO bitacora_acceso VALUES (980, '2015-04-27', '01:03:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (981, '2015-04-28', '10:15:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (982, '2015-04-28', '10:28:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (983, '2015-04-28', '10:36:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: Rep_Horario.php');
INSERT INTO bitacora_acceso VALUES (984, '2015-04-28', '10:47:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (985, '2015-04-29', '10:03:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (986, '2015-04-29', '06:40:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (987, '2015-04-30', '12:04:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (988, '2015-04-30', '12:18:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (989, '2015-04-30', '12:08:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (990, '2015-04-30', '12:20:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (991, '2015-04-30', '08:04:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (992, '2015-04-30', '08:55:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (993, '2015-04-30', '08:00:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (994, '2015-04-30', '08:12:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (995, '2015-04-30', '08:14:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (996, '2015-04-30', '08:26:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (997, '2015-04-30', '09:22:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (998, '2015-04-30', '09:34:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (999, '2015-04-30', '09:25:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1000, '2015-04-30', '09:37:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1001, '2015-04-30', '09:45:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1002, '2015-04-30', '09:45:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1003, '2015-04-30', '09:54:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1004, '2015-04-30', '03:56:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1005, '2015-04-30', '03:09:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (1006, '2015-04-30', '03:15:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1007, '2015-04-30', '03:24:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1008, '2015-04-30', '04:20:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1009, '2015-04-30', '04:31:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1010, '2015-04-30', '05:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1011, '2015-04-30', '05:38:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1012, '2015-04-30', '05:39:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1013, '2015-04-30', '05:06:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1014, '2015-04-30', '05:02:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1015, '2015-04-30', '05:14:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1016, '2015-04-30', '07:27:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1017, '2015-04-30', '08:55:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1018, '2015-04-30', '09:27:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1019, '2015-05-01', '01:35:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1020, '2015-05-01', '02:20:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1021, '2015-05-01', '02:46:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (1022, '2015-05-01', '05:44:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1023, '2015-05-01', '05:58:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1024, '2015-05-01', '05:47:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1025, '2015-05-01', '05:02:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1026, '2015-05-01', '05:08:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1027, '2015-05-01', '05:52:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1028, '2015-05-01', '05:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1029, '2015-05-01', '05:14:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1030, '2015-05-01', '06:50:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1031, '2015-05-01', '06:02:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1032, '2015-05-01', '06:19:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1033, '2015-05-01', '06:44:00', '127.0.0.1', 'D20041540', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1034, '2015-05-01', '06:09:00', '127.0.0.1', 'D20041540', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1035, '2015-05-02', '10:03:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1036, '2015-05-02', '10:40:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1037, '2015-05-02', '10:51:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1038, '2015-05-02', '10:25:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1039, '2015-05-02', '10:54:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1040, '2015-05-02', '10:08:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1041, '2015-05-02', '10:22:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1042, '2015-05-02', '10:37:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1043, '2015-05-02', '10:47:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (1044, '2015-05-02', '10:51:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1045, '2015-05-02', '10:02:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1046, '2015-05-02', '10:07:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1047, '2015-05-02', '10:25:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1048, '2015-05-02', '10:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1049, '2015-05-02', '10:15:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1050, '2015-05-02', '11:49:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1051, '2015-05-02', '11:04:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1052, '2015-05-02', '11:03:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1053, '2015-05-02', '11:19:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1054, '2015-05-02', '02:10:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1055, '2015-05-02', '02:50:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1056, '2015-05-02', '02:53:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1057, '2015-05-02', '02:11:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1058, '2015-05-02', '06:54:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1059, '2015-05-02', '06:20:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1060, '2015-05-02', '06:38:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1061, '2015-05-02', '06:47:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1062, '2015-05-02', '07:56:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1063, '2015-05-02', '07:11:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1064, '2015-05-02', '07:22:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1065, '2015-05-02', '07:51:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1066, '2015-05-02', '07:07:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1067, '2015-05-02', '07:00:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1068, '2015-05-02', '07:13:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1069, '2015-05-02', '07:24:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1070, '2015-05-02', '07:31:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1071, '2015-05-02', '08:47:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1072, '2015-05-02', '08:02:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1073, '2015-05-02', '08:22:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1074, '2015-05-02', '08:04:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1075, '2015-05-02', '08:27:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1076, '2015-05-02', '08:39:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1077, '2015-05-02', '08:46:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1078, '2015-05-02', '09:56:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1079, '2015-05-02', '09:05:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1080, '2015-05-02', '10:25:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1081, '2015-05-02', '10:36:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1082, '2015-05-02', '10:47:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1083, '2015-05-02', '10:09:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1084, '2015-05-03', '09:06:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1085, '2015-05-03', '09:30:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1086, '2015-05-03', '09:56:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1087, '2015-05-03', '10:12:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1088, '2015-05-03', '11:29:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1089, '2015-05-03', '11:39:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1090, '2015-05-03', '11:39:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1091, '2015-05-03', '11:56:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1092, '2015-05-03', '11:14:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1093, '2015-05-03', '11:27:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1094, '2015-05-03', '11:38:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1095, '2015-05-03', '11:47:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1096, '2015-05-03', '01:14:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1097, '2015-05-03', '01:38:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1098, '2015-05-03', '01:23:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1099, '2015-05-03', '01:37:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1100, '2015-05-03', '02:59:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1101, '2015-05-03', '05:17:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1102, '2015-05-03', '05:41:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1103, '2015-05-03', '06:34:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1104, '2015-05-03', '06:45:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1105, '2015-05-03', '06:54:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1106, '2015-05-03', '06:12:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (1107, '2015-05-03', '09:10:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1108, '2015-05-03', '09:21:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1109, '2015-05-03', '11:30:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1110, '2015-05-04', '09:37:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1111, '2015-05-04', '09:57:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1112, '2015-05-04', '09:05:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1113, '2015-05-04', '09:11:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1114, '2015-05-04', '09:29:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1115, '2015-05-04', '09:27:00', '127.0.0.1', 'D15341271', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (1116, '2015-05-04', '10:51:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1117, '2015-05-04', '10:10:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: ____zonaEstudiante');
INSERT INTO bitacora_acceso VALUES (1118, '2015-05-04', '10:41:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1119, '2015-05-04', '10:54:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (1120, '2015-05-04', '10:01:00', '127.0.0.1', 'D21057251', 'Session Cerrada por Entrar en zona no permitida: ____zonaEstudiante');
INSERT INTO bitacora_acceso VALUES (1121, '2015-05-04', '10:28:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1122, '2015-05-04', '11:05:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1123, '2015-05-04', '11:16:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1124, '2015-05-04', '11:53:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1125, '2015-05-04', '11:05:00', '127.0.0.1', 'D3593619', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1126, '2015-05-04', '01:18:00', '127.0.0.1', 'D3593619', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1127, '2015-05-04', '01:58:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1128, '2015-05-04', '01:54:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1129, '2015-05-04', '01:35:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1130, '2015-05-04', '02:16:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1131, '2015-05-04', '02:26:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1132, '2015-05-04', '02:51:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1133, '2015-05-04', '02:00:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1134, '2015-05-04', '02:46:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1135, '2015-05-04', '02:59:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1136, '2015-05-04', '02:37:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1137, '2015-05-04', '04:43:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1138, '2015-05-04', '05:19:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1139, '2015-05-04', '05:43:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1140, '2015-05-04', '05:02:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1141, '2015-05-04', '05:17:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1142, '2015-05-04', '05:25:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1143, '2015-05-04', '05:36:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1144, '2015-05-04', '06:16:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1145, '2015-05-04', '06:49:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1146, '2015-05-04', '06:37:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1147, '2015-05-04', '09:14:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1148, '2015-05-04', '09:02:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1149, '2015-05-04', '09:10:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1150, '2015-05-04', '09:14:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1151, '2015-05-04', '10:15:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1152, '2015-05-04', '11:12:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1153, '2015-05-04', '11:27:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1154, '2015-05-04', '11:58:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1155, '2015-05-04', '11:17:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1156, '2015-05-06', '12:32:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1157, '2015-05-06', '09:40:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1158, '2015-05-07', '08:35:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1159, '2015-05-14', '07:37:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1160, '2015-05-14', '07:28:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1161, '2015-05-14', '07:35:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1162, '2015-05-20', '04:35:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1163, '2015-05-20', '05:28:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1164, '2015-05-20', '05:09:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1165, '2015-05-20', '06:13:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1166, '2015-05-20', '06:34:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1167, '2015-05-20', '06:57:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1168, '2015-05-20', '08:31:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1169, '2015-05-20', '08:47:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (1170, '2015-05-20', '08:50:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1171, '2015-05-20', '08:04:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1172, '2015-05-21', '12:10:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1173, '2015-05-21', '01:43:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1174, '2015-05-21', '02:14:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1175, '2015-05-21', '03:07:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1176, '2015-05-22', '03:03:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1177, '2015-05-22', '03:22:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioD15341271');
INSERT INTO bitacora_acceso VALUES (1178, '2015-05-22', '03:31:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1179, '2015-05-22', '03:41:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1180, '2015-05-22', '03:58:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1181, '2015-05-25', '07:32:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1182, '2015-05-25', '07:43:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1183, '2015-05-25', '08:03:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1184, '2015-05-25', '08:09:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1185, '2015-05-25', '09:26:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1186, '2015-05-25', '10:03:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1187, '2015-05-25', '10:27:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1188, '2015-05-25', '10:56:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1189, '2015-05-25', '10:07:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1190, '2015-05-25', '10:42:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1191, '2015-05-25', '10:57:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1192, '2015-05-25', '10:51:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1193, '2015-05-25', '10:03:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1194, '2015-05-25', '10:09:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1195, '2015-05-25', '10:24:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1196, '2015-05-25', '10:27:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1197, '2015-05-25', '10:41:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1198, '2015-05-25', '11:11:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1199, '2015-05-25', '11:20:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1200, '2015-05-26', '12:34:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1201, '2015-05-26', '12:45:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1202, '2015-05-26', '12:15:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1203, '2015-05-26', '12:28:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1204, '2015-05-26', '12:43:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1205, '2015-05-26', '12:00:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1206, '2015-05-26', '12:12:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1207, '2015-05-26', '12:26:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1208, '2015-05-26', '12:52:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1209, '2015-05-26', '12:04:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1210, '2015-05-26', '01:54:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1211, '2015-05-26', '01:14:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1212, '2015-05-26', '01:38:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1213, '2015-05-26', '01:04:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1214, '2015-05-26', '01:18:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1215, '2015-05-26', '01:04:00', '127.0.0.1', 'A21059374', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1216, '2015-05-26', '01:33:00', '127.0.0.1', 'A21059374', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (1217, '2015-05-26', '02:02:00', '127.0.0.1', 'A21059374', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1218, '2015-05-26', '02:11:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1219, '2015-05-26', '02:16:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1220, '2015-05-26', '02:36:00', '127.0.0.1', 'A21059374', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1221, '2015-05-26', '02:03:00', '127.0.0.1', 'A21059374', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1222, '2015-05-26', '02:34:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1223, '2015-05-26', '02:28:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1224, '2015-05-26', '02:46:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1225, '2015-05-26', '02:16:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1226, '2015-05-26', '02:10:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1227, '2015-05-26', '02:24:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1228, '2015-05-26', '03:20:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1229, '2015-05-26', '03:50:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1230, '2015-05-26', '03:56:00', '127.0.0.1', 'D21058793', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1231, '2015-05-26', '03:31:00', '127.0.0.1', 'D21058793', 'Cambio De Clave Primera Vez');
INSERT INTO bitacora_acceso VALUES (1232, '2015-05-26', '03:25:00', '127.0.0.1', 'D21058793', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1233, '2015-05-26', '03:03:00', '127.0.0.1', 'A21059374', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1234, '2015-05-26', '03:52:00', '127.0.0.1', 'A21059374', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1235, '2015-05-26', '03:59:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1236, '2015-05-26', '03:19:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1237, '2015-05-26', '03:12:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1238, '2015-05-29', '03:09:00', '127.0.0.1', 'D15341271', 'Session Cerrada por Entrar en zona no permitida: ____zonaEstudiante');
INSERT INTO bitacora_acceso VALUES (1239, '2015-05-29', '03:15:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1240, '2015-05-29', '04:39:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1241, '2015-05-29', '04:22:00', '127.0.0.1', 'A21059374', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1242, '2015-05-29', '04:45:00', '127.0.0.1', 'A21059374', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1243, '2015-05-29', '04:29:00', '127.0.0.1', 'A21059374', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1244, '2015-05-29', '04:27:00', '127.0.0.1', 'A21059374', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1245, '2015-05-29', '04:41:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1246, '2015-05-29', '04:22:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1247, '2015-05-29', '04:48:00', '127.0.0.1', 'D20657234', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1248, '2015-05-29', '04:39:00', '127.0.0.1', 'D20657234', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1249, '2015-05-29', '04:03:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1250, '2015-05-29', '04:44:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1251, '2015-05-29', '04:05:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1252, '2015-05-29', '04:53:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1253, '2015-05-29', '04:30:00', '127.0.0.1', 'A21059374', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1254, '2015-05-29', '04:02:00', '127.0.0.1', 'A21059374', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1255, '2015-05-29', '04:33:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1256, '2015-05-28', '07:57:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1257, '2015-05-28', '07:52:00', '127.0.0.1', 'D21057251', 'Cambio De Clave ');
INSERT INTO bitacora_acceso VALUES (1258, '2015-05-28', '07:59:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1259, '2015-05-28', '09:21:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1292, '2015-05-28', '09:20:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1293, '2015-05-28', '09:10:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1294, '2015-05-28', '09:32:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1295, '2015-05-28', '09:41:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1296, '2015-05-28', '09:54:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1297, '2015-05-28', '11:29:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1298, '2015-05-29', '01:00:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1299, '2015-05-29', '03:14:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1300, '2015-05-29', '03:49:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1301, '2015-05-29', '09:34:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1302, '2015-05-29', '09:37:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1303, '2015-05-29', '09:52:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1304, '2015-05-29', '09:06:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1305, '2015-05-29', '09:18:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1306, '2015-05-29', '09:54:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1307, '2015-05-29', '09:42:00', '127.0.0.1', 'E17945451', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1308, '2015-05-29', '09:03:00', '127.0.0.1', 'E17945451', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1309, '2015-05-29', '09:15:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1310, '2015-05-29', '09:57:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1311, '2015-05-29', '09:09:00', '127.0.0.1', 'E20025035', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1312, '2015-05-29', '09:38:00', '127.0.0.1', 'E20025035', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1313, '2015-05-29', '09:06:00', '127.0.0.1', 'E17945451', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1314, '2015-05-29', '09:29:00', '127.0.0.1', 'E17945451', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1315, '2015-05-29', '10:22:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1316, '2015-05-29', '10:45:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1317, '2015-05-30', '11:36:00', '127.0.0.1', 'D15341271', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1318, '2015-05-30', '11:53:00', '127.0.0.1', 'D15341271', 'Sesion Cerrada de Manera Forzosa a usuarioD21057251');
INSERT INTO bitacora_acceso VALUES (1319, '2015-05-30', '03:42:00', '127.0.0.1', 'D15341271', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1320, '2015-05-30', '05:05:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1321, '2015-05-30', '06:10:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1322, '2015-05-31', '12:43:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1323, '2015-05-31', '02:40:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1324, '2015-06-03', '08:02:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1325, '2015-06-03', '10:22:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1326, '2015-06-03', '10:09:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1327, '2015-06-03', '10:10:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1328, '2015-06-03', '10:23:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1329, '2015-06-03', '11:20:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1330, '2015-06-03', '11:30:00', '127.0.0.1', 'D21057251', 'Sesion Cerrada de Manera Forzosa a usuarioA4925159');
INSERT INTO bitacora_acceso VALUES (1331, '2015-06-03', '11:33:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1332, '2015-06-04', '09:52:00', '127.0.0.1', 'D21057251', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1333, '2015-06-04', '09:37:00', '127.0.0.1', 'D21057251', 'Session Cerrada con Exito');
INSERT INTO bitacora_acceso VALUES (1334, '2015-06-04', '09:49:00', '127.0.0.1', 'A4925159', 'Acceso Realizado con Exito');
INSERT INTO bitacora_acceso VALUES (1335, '2015-06-04', '09:22:00', '127.0.0.1', 'A4925159', 'Session Cerrada con Exito');


--
-- Name: bitacora_acceso_idacceso_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('bitacora_acceso_idacceso_seq', 1335, true);


--
-- Name: bitacora_idcambio_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('bitacora_idcambio_seq', 3521, true);


--
-- Data for Name: bloque; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO bloque VALUES (5, '10:25AM a 11:10AM', 5, 'A', '2');
INSERT INTO bloque VALUES (4, '9:35AM a 10:20AM', 4, 'A', '2');
INSERT INTO bloque VALUES (3, '8:50AM a 9:35AM', 3, 'A', '2');
INSERT INTO bloque VALUES (2, '8:00AM a 8:45AM', 2, 'A', '2');
INSERT INTO bloque VALUES (6, '11:10AM a 11:55AM', 6, 'A', '2');
INSERT INTO bloque VALUES (7, '6:30PM A 7:15PM', 7, 'A', '1');
INSERT INTO bloque VALUES (8, '7:15PM A 8:00PM', 8, 'A', '1');
INSERT INTO bloque VALUES (9, '8:05PM A 8:50PM', 9, 'A', '1');
INSERT INTO bloque VALUES (10, '8:50PM A 9:35PM', 10, 'A', '1');
INSERT INTO bloque VALUES (11, '9:40PM A 10:25PM', 11, 'A', '1');
INSERT INTO bloque VALUES (12, '10:25PM A 11:10PM', 12, 'A', '1');
INSERT INTO bloque VALUES (1, '7:15AM a 8:00AM', 1, 'A', '2');


--
-- Name: bloques_blo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('bloques_blo_codigo_seq', 6, true);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO cargo VALUES (8, 'COORDINADOR DE CARRERA EN INGENIERIA EN GAS', 4, 'A');
INSERT INTO cargo VALUES (4, 'COORDINADORA DE PLANIFICACION', 1, 'A');
INSERT INTO cargo VALUES (9, 'COORDINADOR DE INFORMATICA', 5, 'A');
INSERT INTO cargo VALUES (5, 'COORDINADOR ACADEMICO', 4, 'A');
INSERT INTO cargo VALUES (11, 'PROBADOR', 2, 'A');
INSERT INTO cargo VALUES (2, 'ANALISTA', 1, 'A');
INSERT INTO cargo VALUES (10, 'JEFE DE SEGURIDAD', 2, 'A');
INSERT INTO cargo VALUES (6, 'JEFE DE SISTEMA', 4, 'A');
INSERT INTO cargo VALUES (1, 'JEFE DE SECRETARIA', 3, 'A');
INSERT INTO cargo VALUES (3, 'ADMINISTRADOR DEL SISTEMA', 2, 'A');
INSERT INTO cargo VALUES (7, 'COORDINADOR DE CARRERA EN LICENCIATURA EN ECONOMIA SOCIAL', 4, 'A');


--
-- Name: cargo_car_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('cargo_car_codigo_seq', 11, true);


--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO carrera VALUES ('1', 'Generico', '', 'A', 'I');
INSERT INTO carrera VALUES ('14', 'INGENIERIA EN GAS', 'INGENIERO EN GAS', 'A', 'I');
INSERT INTO carrera VALUES ('19', 'INGENIERIA AGROINDUSTRIAL', 'INGENIERO AGROINDUSTRIAL', 'A', 'I');
INSERT INTO carrera VALUES ('20', 'INGENIERIA AGRONOMA', 'INGENIERO EN AGRONOMÍA', 'A', 'I');
INSERT INTO carrera VALUES ('3', 'T.S.U. EN ENFERMERIA', 'TÉCNICO SUPERIOR UNIVERSITARIO EN ENFERMERÍA', 'A', 'I');
INSERT INTO carrera VALUES ('21', 'INGENIERIA EN AZUCAR', 'INGENIERO EN AZÚCAR', 'A', 'I');
INSERT INTO carrera VALUES ('10', 'LICENCIATURA EN ECONOMIA SOCIAL', 'LICENCIADO(A) EN ECONOMÍA SOCIAL', 'A', 'I');


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO ciudad VALUES (1, 'ACARIGUA', 'A', 1, 'I');


--
-- Data for Name: condicion; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO condicion VALUES (1, 'NORMAL', ' ', 'N ', 'I');
INSERT INTO condicion VALUES (2, 'APROBADO', 'NOTA CUALITATIVA DE APROBACION ', 'A', 'I');
INSERT INTO condicion VALUES (4, 'REPROBADO', NULL, 'R', 'I');
INSERT INTO condicion VALUES (3, 'PASADO', ' ', 'P', 'I');


--
-- Name: condicion_idcondicion_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('condicion_idcondicion_seq', 1, false);


--
-- Data for Name: contenido; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: contenido_codcon_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('contenido_codcon_seq', 1, false);


--
-- Data for Name: dedicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dedicacion VALUES (1, 'MEDIO TIEMPO', 18, 'I');


--
-- Name: dedicacion_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dedicacion_codigo_seq', 1, false);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO departamento VALUES (1, 'PLANIFICACIÓN', 'A');
INSERT INTO departamento VALUES (2, 'ADMINISTRACION DEL SISTEMA', 'A');
INSERT INTO departamento VALUES (3, 'SECRETARIA', 'A');
INSERT INTO departamento VALUES (4, 'ACADEMICO', 'A');
INSERT INTO departamento VALUES (5, 'INFORMATICA', 'A');


--
-- Name: departamento_dep_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('departamento_dep_codigo_seq', 5, true);


--
-- Data for Name: detalle_cargo_usuario; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO detalle_cargo_usuario VALUES (26, 7, 'A4925159');
INSERT INTO detalle_cargo_usuario VALUES (29, 2, 'E17945456');
INSERT INTO detalle_cargo_usuario VALUES (30, 3, 'D15341271');
INSERT INTO detalle_cargo_usuario VALUES (33, 10, 'D20041540');
INSERT INTO detalle_cargo_usuario VALUES (34, 7, 'D20657234');
INSERT INTO detalle_cargo_usuario VALUES (35, 1, 'D21058793');
INSERT INTO detalle_cargo_usuario VALUES (36, 2, 'A21060661');
INSERT INTO detalle_cargo_usuario VALUES (37, 7, 'A21059374');
INSERT INTO detalle_cargo_usuario VALUES (38, 3, 'D21057251');


--
-- Name: detalle_cargo_usuario_det_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('detalle_cargo_usuario_det_codigo_seq', 38, true);


--
-- Data for Name: detalle_est_unipla; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Data for Name: detalle_evaluadores; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO detalle_evaluadores VALUES (1, 'V-21057251', '10', '', 3, '1');


--
-- Data for Name: detalle_nota; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO detalle_nota VALUES (2, 'V-15341271', 100, NULL);
INSERT INTO detalle_nota VALUES (3, 'V-1988857', 99, NULL);
INSERT INTO detalle_nota VALUES (1, 'V-21057251', 91, NULL);


--
-- Data for Name: detalle_pm; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO detalle_pm VALUES (142, 7, 1, '5');
INSERT INTO detalle_pm VALUES (142, 8, 1, '5');
INSERT INTO detalle_pm VALUES (142, 9, 1, '5');
INSERT INTO detalle_pm VALUES (142, 7, 3, '1');
INSERT INTO detalle_pm VALUES (142, 8, 3, '1');
INSERT INTO detalle_pm VALUES (142, 9, 3, '1');
INSERT INTO detalle_pm VALUES (143, 7, 2, '10');
INSERT INTO detalle_pm VALUES (143, 8, 2, '10');
INSERT INTO detalle_pm VALUES (143, 9, 2, '10');
INSERT INTO detalle_pm VALUES (143, 10, 2, '10');
INSERT INTO detalle_pm VALUES (144, 10, 1, '5');
INSERT INTO detalle_pm VALUES (144, 11, 1, '5');
INSERT INTO detalle_pm VALUES (144, 12, 1, '5');
INSERT INTO detalle_pm VALUES (144, 10, 3, '5');
INSERT INTO detalle_pm VALUES (144, 11, 3, '5');
INSERT INTO detalle_pm VALUES (145, 11, 2, '4');
INSERT INTO detalle_pm VALUES (145, 12, 2, '4');
INSERT INTO detalle_pm VALUES (145, 7, 4, '5');
INSERT INTO detalle_pm VALUES (145, 8, 4, '5');
INSERT INTO detalle_pm VALUES (146, 9, 4, '5');
INSERT INTO detalle_pm VALUES (146, 10, 4, '5');
INSERT INTO detalle_pm VALUES (146, 11, 4, '5');
INSERT INTO detalle_pm VALUES (146, 7, 5, '7');
INSERT INTO detalle_pm VALUES (146, 8, 5, '7');
INSERT INTO detalle_pm VALUES (137, 1, 1, '7');
INSERT INTO detalle_pm VALUES (137, 2, 1, '7');
INSERT INTO detalle_pm VALUES (137, 3, 1, '7');
INSERT INTO detalle_pm VALUES (137, 4, 1, '7');
INSERT INTO detalle_pm VALUES (138, 5, 1, '7');
INSERT INTO detalle_pm VALUES (138, 6, 1, '7');
INSERT INTO detalle_pm VALUES (138, 1, 2, '5');
INSERT INTO detalle_pm VALUES (138, 2, 2, '5');
INSERT INTO detalle_pm VALUES (138, 3, 4, '5');
INSERT INTO detalle_pm VALUES (138, 4, 4, '5');
INSERT INTO detalle_pm VALUES (139, 1, 4, '5');
INSERT INTO detalle_pm VALUES (139, 2, 4, '5');
INSERT INTO detalle_pm VALUES (139, 3, 3, '6');
INSERT INTO detalle_pm VALUES (139, 4, 3, '6');
INSERT INTO detalle_pm VALUES (139, 5, 3, '6');
INSERT INTO detalle_pm VALUES (139, 6, 3, '6');
INSERT INTO detalle_pm VALUES (140, 3, 2, '5');
INSERT INTO detalle_pm VALUES (140, 4, 2, '5');
INSERT INTO detalle_pm VALUES (140, 3, 5, '5');
INSERT INTO detalle_pm VALUES (140, 4, 5, '5');
INSERT INTO detalle_pm VALUES (140, 5, 5, '5');
INSERT INTO detalle_pm VALUES (141, 1, 3, '6');
INSERT INTO detalle_pm VALUES (141, 2, 3, '6');
INSERT INTO detalle_pm VALUES (141, 1, 5, '5');
INSERT INTO detalle_pm VALUES (141, 2, 5, '5');
INSERT INTO detalle_pm VALUES (146, 9, 5, '7');
INSERT INTO detalle_pm VALUES (150, 1, 1, '6');
INSERT INTO detalle_pm VALUES (150, 2, 1, '6');
INSERT INTO detalle_pm VALUES (150, 3, 1, '6');
INSERT INTO detalle_pm VALUES (150, 4, 1, '6');
INSERT INTO detalle_pm VALUES (151, 1, 3, '5');
INSERT INTO detalle_pm VALUES (151, 2, 3, '5');
INSERT INTO detalle_pm VALUES (151, 1, 4, '2');
INSERT INTO detalle_pm VALUES (151, 2, 4, '2');
INSERT INTO detalle_pm VALUES (151, 3, 4, '2');
INSERT INTO detalle_pm VALUES (151, 4, 4, '2');
INSERT INTO detalle_pm VALUES (152, 5, 2, '5');
INSERT INTO detalle_pm VALUES (152, 6, 2, '5');
INSERT INTO detalle_pm VALUES (152, 4, 3, '5');
INSERT INTO detalle_pm VALUES (152, 5, 3, '5');
INSERT INTO detalle_pm VALUES (152, 5, 4, '2');
INSERT INTO detalle_pm VALUES (152, 6, 4, '2');
INSERT INTO detalle_pm VALUES (153, 5, 1, '6');
INSERT INTO detalle_pm VALUES (153, 6, 1, '6');
INSERT INTO detalle_pm VALUES (153, 1, 2, '2');
INSERT INTO detalle_pm VALUES (153, 2, 2, '2');
INSERT INTO detalle_pm VALUES (154, 1, 1, '2');
INSERT INTO detalle_pm VALUES (154, 2, 1, '2');
INSERT INTO detalle_pm VALUES (154, 3, 1, '2');
INSERT INTO detalle_pm VALUES (154, 1, 2, '6');
INSERT INTO detalle_pm VALUES (154, 2, 2, '6');
INSERT INTO detalle_pm VALUES (154, 3, 2, '6');
INSERT INTO detalle_pm VALUES (155, 6, 2, '7');
INSERT INTO detalle_pm VALUES (155, 5, 2, '7');
INSERT INTO detalle_pm VALUES (155, 5, 4, '5');
INSERT INTO detalle_pm VALUES (155, 6, 4, '5');
INSERT INTO detalle_pm VALUES (156, 1, 1, '3');
INSERT INTO detalle_pm VALUES (156, 2, 1, '3');
INSERT INTO detalle_pm VALUES (156, 3, 1, '3');
INSERT INTO detalle_pm VALUES (156, 4, 1, '3');
INSERT INTO detalle_pm VALUES (157, 5, 2, '6');
INSERT INTO detalle_pm VALUES (157, 6, 2, '6');
INSERT INTO detalle_pm VALUES (157, 1, 4, '6');
INSERT INTO detalle_pm VALUES (157, 2, 4, '6');
INSERT INTO detalle_pm VALUES (157, 3, 4, '6');
INSERT INTO detalle_pm VALUES (157, 4, 4, '6');
INSERT INTO detalle_pm VALUES (158, 5, 4, '6');
INSERT INTO detalle_pm VALUES (158, 6, 4, '6');
INSERT INTO detalle_pm VALUES (158, 1, 5, '6');
INSERT INTO detalle_pm VALUES (158, 2, 5, '6');
INSERT INTO detalle_pm VALUES (158, 3, 5, '6');
INSERT INTO detalle_pm VALUES (159, 4, 5, '6');
INSERT INTO detalle_pm VALUES (159, 5, 5, '6');
INSERT INTO detalle_pm VALUES (159, 6, 5, '6');
INSERT INTO detalle_pm VALUES (159, 1, 3, '7');
INSERT INTO detalle_pm VALUES (159, 2, 3, '7');
INSERT INTO detalle_pm VALUES (160, 1, 1, '1');
INSERT INTO detalle_pm VALUES (160, 2, 1, '1');
INSERT INTO detalle_pm VALUES (160, 3, 1, '1');
INSERT INTO detalle_pm VALUES (160, 4, 1, '1');
INSERT INTO detalle_pm VALUES (161, 1, 2, '5');
INSERT INTO detalle_pm VALUES (161, 2, 2, '5');
INSERT INTO detalle_pm VALUES (161, 3, 2, '5');
INSERT INTO detalle_pm VALUES (161, 4, 2, '5');
INSERT INTO detalle_pm VALUES (161, 5, 2, '5');
INSERT INTO detalle_pm VALUES (161, 6, 2, '5');
INSERT INTO detalle_pm VALUES (162, 1, 3, '5');
INSERT INTO detalle_pm VALUES (162, 2, 3, '5');
INSERT INTO detalle_pm VALUES (162, 1, 4, '5');
INSERT INTO detalle_pm VALUES (162, 2, 4, '5');
INSERT INTO detalle_pm VALUES (162, 3, 4, '5');
INSERT INTO detalle_pm VALUES (163, 5, 1, '1');
INSERT INTO detalle_pm VALUES (163, 6, 1, '1');
INSERT INTO detalle_pm VALUES (163, 4, 4, '5');
INSERT INTO detalle_pm VALUES (163, 5, 4, '5');
INSERT INTO detalle_pm VALUES (163, 6, 4, '5');
INSERT INTO detalle_pm VALUES (164, 3, 3, '5');
INSERT INTO detalle_pm VALUES (164, 4, 3, '5');
INSERT INTO detalle_pm VALUES (164, 1, 5, '5');
INSERT INTO detalle_pm VALUES (164, 2, 5, '5');
INSERT INTO detalle_pm VALUES (164, 3, 5, '5');
INSERT INTO detalle_pm VALUES (164, 4, 5, '5');
INSERT INTO detalle_pm VALUES (165, 5, 3, '5');
INSERT INTO detalle_pm VALUES (165, 6, 3, '5');
INSERT INTO detalle_pm VALUES (165, 5, 5, '5');
INSERT INTO detalle_pm VALUES (165, 6, 5, '5');
INSERT INTO detalle_pm VALUES (167, 1, 1, '5');
INSERT INTO detalle_pm VALUES (167, 2, 1, '5');
INSERT INTO detalle_pm VALUES (167, 3, 1, '5');
INSERT INTO detalle_pm VALUES (167, 4, 1, '5');
INSERT INTO detalle_pm VALUES (167, 1, 2, '5');
INSERT INTO detalle_pm VALUES (167, 2, 2, '5');
INSERT INTO detalle_pm VALUES (167, 3, 2, '5');
INSERT INTO detalle_pm VALUES (168, 4, 2, '5');
INSERT INTO detalle_pm VALUES (168, 5, 2, '5');
INSERT INTO detalle_pm VALUES (168, 6, 2, '5');
INSERT INTO detalle_pm VALUES (168, 1, 4, '5');
INSERT INTO detalle_pm VALUES (168, 2, 4, '5');
INSERT INTO detalle_pm VALUES (169, 1, 3, '5');
INSERT INTO detalle_pm VALUES (169, 2, 3, '5');
INSERT INTO detalle_pm VALUES (169, 3, 3, '5');
INSERT INTO detalle_pm VALUES (169, 4, 3, '5');
INSERT INTO detalle_pm VALUES (170, 5, 1, '5');
INSERT INTO detalle_pm VALUES (170, 6, 1, '5');
INSERT INTO detalle_pm VALUES (170, 5, 3, '5');
INSERT INTO detalle_pm VALUES (170, 6, 3, '5');
INSERT INTO detalle_pm VALUES (171, 1, 5, '5');
INSERT INTO detalle_pm VALUES (171, 2, 5, '5');
INSERT INTO detalle_pm VALUES (171, 3, 5, '5');
INSERT INTO detalle_pm VALUES (171, 4, 5, '5');
INSERT INTO detalle_pm VALUES (171, 5, 5, '5');
INSERT INTO detalle_pm VALUES (172, 3, 4, '5');
INSERT INTO detalle_pm VALUES (172, 4, 4, '5');
INSERT INTO detalle_pm VALUES (172, 5, 4, '5');
INSERT INTO detalle_pm VALUES (172, 6, 4, '5');
INSERT INTO detalle_pm VALUES (172, 6, 5, '5');
INSERT INTO detalle_pm VALUES (173, 4, 5, '2');
INSERT INTO detalle_pm VALUES (173, 5, 5, '2');
INSERT INTO detalle_pm VALUES (173, 6, 5, '2');
INSERT INTO detalle_pm VALUES (173, 3, 4, '7');
INSERT INTO detalle_pm VALUES (173, 4, 4, '7');
INSERT INTO detalle_pm VALUES (173, 1, 3, '3');
INSERT INTO detalle_pm VALUES (173, 2, 3, '3');
INSERT INTO detalle_pm VALUES (174, 3, 2, '2');
INSERT INTO detalle_pm VALUES (174, 4, 2, '2');
INSERT INTO detalle_pm VALUES (174, 1, 5, '2');
INSERT INTO detalle_pm VALUES (174, 2, 5, '2');
INSERT INTO detalle_pm VALUES (174, 3, 5, '2');
INSERT INTO detalle_pm VALUES (174, 3, 3, '7');
INSERT INTO detalle_pm VALUES (174, 4, 3, '7');
INSERT INTO detalle_pm VALUES (175, 1, 1, '5');
INSERT INTO detalle_pm VALUES (175, 2, 1, '5');
INSERT INTO detalle_pm VALUES (175, 3, 1, '5');
INSERT INTO detalle_pm VALUES (175, 1, 2, '7');
INSERT INTO detalle_pm VALUES (175, 2, 2, '7');
INSERT INTO detalle_pm VALUES (176, 5, 2, '3');
INSERT INTO detalle_pm VALUES (176, 6, 2, '3');
INSERT INTO detalle_pm VALUES (176, 5, 3, '7');
INSERT INTO detalle_pm VALUES (176, 6, 3, '7');
INSERT INTO detalle_pm VALUES (177, 1, 4, '7');
INSERT INTO detalle_pm VALUES (177, 2, 4, '7');
INSERT INTO detalle_pm VALUES (177, 4, 1, '5');
INSERT INTO detalle_pm VALUES (177, 5, 1, '5');
INSERT INTO detalle_pm VALUES (178, 1, 6, '5');
INSERT INTO detalle_pm VALUES (178, 2, 6, '5');
INSERT INTO detalle_pm VALUES (178, 3, 6, '5');
INSERT INTO detalle_pm VALUES (178, 4, 6, '5');
INSERT INTO detalle_pm VALUES (178, 5, 6, '5');
INSERT INTO detalle_pm VALUES (179, 3, 2, '7');
INSERT INTO detalle_pm VALUES (179, 4, 2, '7');
INSERT INTO detalle_pm VALUES (179, 1, 4, '3');
INSERT INTO detalle_pm VALUES (179, 2, 4, '3');
INSERT INTO detalle_pm VALUES (179, 1, 5, '7');
INSERT INTO detalle_pm VALUES (179, 2, 5, '7');
INSERT INTO detalle_pm VALUES (179, 3, 5, '7');
INSERT INTO detalle_pm VALUES (180, 5, 1, '3');
INSERT INTO detalle_pm VALUES (180, 6, 1, '3');
INSERT INTO detalle_pm VALUES (180, 1, 2, '3');
INSERT INTO detalle_pm VALUES (180, 2, 2, '3');
INSERT INTO detalle_pm VALUES (180, 3, 3, '5');
INSERT INTO detalle_pm VALUES (180, 6, 3, '5');
INSERT INTO detalle_pm VALUES (181, 4, 3, '3');
INSERT INTO detalle_pm VALUES (181, 5, 3, '3');
INSERT INTO detalle_pm VALUES (181, 4, 5, '7');
INSERT INTO detalle_pm VALUES (181, 5, 5, '7');
INSERT INTO detalle_pm VALUES (181, 6, 5, '7');
INSERT INTO detalle_pm VALUES (182, 1, 3, '8');
INSERT INTO detalle_pm VALUES (182, 2, 3, '8');
INSERT INTO detalle_pm VALUES (182, 1, 6, '6');
INSERT INTO detalle_pm VALUES (182, 2, 6, '6');
INSERT INTO detalle_pm VALUES (182, 3, 6, '6');
INSERT INTO detalle_pm VALUES (183, 4, 6, '6');
INSERT INTO detalle_pm VALUES (183, 5, 6, '6');
INSERT INTO detalle_pm VALUES (183, 6, 6, '6');
INSERT INTO detalle_pm VALUES (183, 5, 4, '3');
INSERT INTO detalle_pm VALUES (183, 6, 4, '3');
INSERT INTO detalle_pm VALUES (184, 1, 1, '8');
INSERT INTO detalle_pm VALUES (184, 2, 1, '8');
INSERT INTO detalle_pm VALUES (184, 3, 1, '8');
INSERT INTO detalle_pm VALUES (184, 3, 2, '3');
INSERT INTO detalle_pm VALUES (184, 4, 2, '3');
INSERT INTO detalle_pm VALUES (185, 4, 1, '8');
INSERT INTO detalle_pm VALUES (185, 5, 1, '8');
INSERT INTO detalle_pm VALUES (185, 6, 1, '8');
INSERT INTO detalle_pm VALUES (185, 3, 3, '8');
INSERT INTO detalle_pm VALUES (185, 4, 3, '8');
INSERT INTO detalle_pm VALUES (185, 5, 3, '8');
INSERT INTO detalle_pm VALUES (185, 6, 3, '8');
INSERT INTO detalle_pm VALUES (186, 3, 4, '3');
INSERT INTO detalle_pm VALUES (186, 4, 4, '3');
INSERT INTO detalle_pm VALUES (186, 1, 5, '3');
INSERT INTO detalle_pm VALUES (186, 2, 5, '3');
INSERT INTO detalle_pm VALUES (186, 3, 5, '3');
INSERT INTO detalle_pm VALUES (187, 1, 2, '8');
INSERT INTO detalle_pm VALUES (187, 2, 2, '8');
INSERT INTO detalle_pm VALUES (187, 1, 3, '4');
INSERT INTO detalle_pm VALUES (187, 2, 3, '4');
INSERT INTO detalle_pm VALUES (187, 4, 5, '3');
INSERT INTO detalle_pm VALUES (187, 5, 5, '3');
INSERT INTO detalle_pm VALUES (187, 6, 5, '3');
INSERT INTO detalle_pm VALUES (188, 5, 2, '8');
INSERT INTO detalle_pm VALUES (188, 6, 2, '8');
INSERT INTO detalle_pm VALUES (188, 1, 4, '8');
INSERT INTO detalle_pm VALUES (188, 2, 4, '8');
INSERT INTO detalle_pm VALUES (188, 5, 4, '8');
INSERT INTO detalle_pm VALUES (189, 6, 4, '8');
INSERT INTO detalle_pm VALUES (189, 4, 6, '7');
INSERT INTO detalle_pm VALUES (189, 6, 6, '7');
INSERT INTO detalle_pm VALUES (189, 5, 6, '7');
INSERT INTO detalle_pm VALUES (190, 3, 3, '4');
INSERT INTO detalle_pm VALUES (190, 4, 3, '4');
INSERT INTO detalle_pm VALUES (190, 5, 3, '4');
INSERT INTO detalle_pm VALUES (190, 6, 3, '4');
INSERT INTO detalle_pm VALUES (191, 4, 1, '2');
INSERT INTO detalle_pm VALUES (191, 5, 1, '2');
INSERT INTO detalle_pm VALUES (191, 6, 1, '2');
INSERT INTO detalle_pm VALUES (191, 3, 2, '8');
INSERT INTO detalle_pm VALUES (191, 4, 2, '8');
INSERT INTO detalle_pm VALUES (192, 1, 1, '4');
INSERT INTO detalle_pm VALUES (192, 2, 1, '4');
INSERT INTO detalle_pm VALUES (192, 3, 1, '4');
INSERT INTO detalle_pm VALUES (192, 1, 2, '4');
INSERT INTO detalle_pm VALUES (192, 2, 2, '4');
INSERT INTO detalle_pm VALUES (193, 5, 2, '4');
INSERT INTO detalle_pm VALUES (193, 6, 2, '4');
INSERT INTO detalle_pm VALUES (193, 1, 3, '2');
INSERT INTO detalle_pm VALUES (193, 2, 3, '2');
INSERT INTO detalle_pm VALUES (194, 3, 4, '8');
INSERT INTO detalle_pm VALUES (194, 4, 4, '8');
INSERT INTO detalle_pm VALUES (194, 1, 5, '8');
INSERT INTO detalle_pm VALUES (194, 2, 5, '8');
INSERT INTO detalle_pm VALUES (194, 3, 5, '8');
INSERT INTO detalle_pm VALUES (195, 3, 2, '4');
INSERT INTO detalle_pm VALUES (195, 4, 2, '4');
INSERT INTO detalle_pm VALUES (195, 1, 5, '1');
INSERT INTO detalle_pm VALUES (195, 2, 5, '1');
INSERT INTO detalle_pm VALUES (196, 7, 1, '6');
INSERT INTO detalle_pm VALUES (196, 8, 1, '6');
INSERT INTO detalle_pm VALUES (196, 9, 1, '6');
INSERT INTO detalle_pm VALUES (196, 7, 2, '1');
INSERT INTO detalle_pm VALUES (196, 8, 2, '1');
INSERT INTO detalle_pm VALUES (197, 10, 1, '6');
INSERT INTO detalle_pm VALUES (197, 11, 1, '6');
INSERT INTO detalle_pm VALUES (197, 12, 1, '6');
INSERT INTO detalle_pm VALUES (197, 7, 4, '6');
INSERT INTO detalle_pm VALUES (197, 8, 4, '6');
INSERT INTO detalle_pm VALUES (197, 9, 4, '6');
INSERT INTO detalle_pm VALUES (199, 10, 1, '7');
INSERT INTO detalle_pm VALUES (199, 11, 1, '7');
INSERT INTO detalle_pm VALUES (199, 12, 1, '7');
INSERT INTO detalle_pm VALUES (199, 9, 3, '2');
INSERT INTO detalle_pm VALUES (199, 10, 3, '2');
INSERT INTO detalle_pm VALUES (199, 11, 3, '2');
INSERT INTO detalle_pm VALUES (236, 1, 1, '1');
INSERT INTO detalle_pm VALUES (236, 3, 1, '1');
INSERT INTO detalle_pm VALUES (236, 2, 1, '1');
INSERT INTO detalle_pm VALUES (236, 4, 1, '1');
INSERT INTO detalle_pm VALUES (244, 1, 5, '1');
INSERT INTO detalle_pm VALUES (244, 2, 5, '1');
INSERT INTO detalle_pm VALUES (244, 3, 5, '1');
INSERT INTO detalle_pm VALUES (244, 4, 5, '1');
INSERT INTO detalle_pm VALUES (244, 5, 5, '1');
INSERT INTO detalle_pm VALUES (245, 6, 1, '7');
INSERT INTO detalle_pm VALUES (245, 5, 1, '7');
INSERT INTO detalle_pm VALUES (245, 4, 1, '3');
INSERT INTO detalle_pm VALUES (245, 3, 1, '3');
INSERT INTO detalle_pm VALUES (246, 1, 3, '1');
INSERT INTO detalle_pm VALUES (246, 2, 3, '1');
INSERT INTO detalle_pm VALUES (246, 1, 4, '1');
INSERT INTO detalle_pm VALUES (246, 2, 4, '1');
INSERT INTO detalle_pm VALUES (246, 3, 4, '1');
INSERT INTO detalle_pm VALUES (250, 3, 3, '1');
INSERT INTO detalle_pm VALUES (250, 4, 3, '1');
INSERT INTO detalle_pm VALUES (250, 4, 4, '1');
INSERT INTO detalle_pm VALUES (250, 5, 4, '1');
INSERT INTO detalle_pm VALUES (251, 1, 2, '1');
INSERT INTO detalle_pm VALUES (251, 2, 2, '1');
INSERT INTO detalle_pm VALUES (251, 1, 4, '2');
INSERT INTO detalle_pm VALUES (251, 2, 4, '2');
INSERT INTO detalle_pm VALUES (251, 3, 4, '2');
INSERT INTO detalle_pm VALUES (252, 5, 1, '1');
INSERT INTO detalle_pm VALUES (252, 6, 1, '1');
INSERT INTO detalle_pm VALUES (252, 5, 3, '2');
INSERT INTO detalle_pm VALUES (252, 6, 3, '2');
INSERT INTO detalle_pm VALUES (252, 1, 5, '2');
INSERT INTO detalle_pm VALUES (252, 2, 5, '2');
INSERT INTO detalle_pm VALUES (253, 1, 1, '2');
INSERT INTO detalle_pm VALUES (253, 2, 1, '2');
INSERT INTO detalle_pm VALUES (253, 3, 5, '2');
INSERT INTO detalle_pm VALUES (253, 4, 5, '2');
INSERT INTO detalle_pm VALUES (253, 5, 5, '2');


--
-- Data for Name: detalle_unidad; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Data for Name: detalleevaluacion; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 1);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 2);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 3);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 4);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 5);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 6);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 7);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 8);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 9);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 10);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 11);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 12);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 13);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 14);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 15);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 16);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 17);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 18);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 19);
INSERT INTO detalleevaluacion VALUES (2, 'V-15341271', 1, 20);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 1);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 2);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 3);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 4);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 5);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 6);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 7);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 8);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 9);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 10);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 11);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 12);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 13);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 14);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 2, 15);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 16);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 17);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 18);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 19);
INSERT INTO detalleevaluacion VALUES (3, 'V-1988857', 1, 20);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 1);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 2);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 3);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 3, 4);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 3, 5);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 3, 6);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 4, 7);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 8);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 9);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 10);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 11);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 12);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 13);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 14);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 15);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 16);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 17);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 18);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 19);
INSERT INTO detalleevaluacion VALUES (1, 'V-21057251', 1, 20);


--
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO docente VALUES ('V-15341271', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-21058793', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-20041540', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-18892789', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-21057251', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-1988857', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-21059298', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-3593619', 'A', 'I', 1);
INSERT INTO docente VALUES ('V-20657234', 'A', 'I', 1);


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO estado VALUES ('AMAZONAS', 'A', 'I', 2);
INSERT INTO estado VALUES ('ANZOATEGUI', 'A', 'I', 3);
INSERT INTO estado VALUES ('APURE', 'A', 'I', 4);
INSERT INTO estado VALUES ('ARAGUA', 'A', 'I', 5);
INSERT INTO estado VALUES ('BARINAS', 'A', 'I', 6);
INSERT INTO estado VALUES ('MIRANDA', 'A', 'I', 7);
INSERT INTO estado VALUES ('CARABOBO', 'A', 'I', 8);
INSERT INTO estado VALUES ('COJEDES', 'A', 'I', 9);
INSERT INTO estado VALUES ('DELTA AMACURO', 'A', 'I', 10);
INSERT INTO estado VALUES ('FALCON', 'A', 'I', 11);
INSERT INTO estado VALUES ('GUARICO', 'A', 'I', 12);
INSERT INTO estado VALUES ('LARA', 'A', 'I', 13);
INSERT INTO estado VALUES ('MERIDA', 'A', 'I', 14);
INSERT INTO estado VALUES ('BOLIVAR', 'A', 'I', 15);
INSERT INTO estado VALUES ('MONAGAS', 'A', 'I', 16);
INSERT INTO estado VALUES ('NUEVA ESPARTA', 'A', 'I', 17);
INSERT INTO estado VALUES ('PORTUGUESA', 'A', 'I', 18);
INSERT INTO estado VALUES ('SUCRE', 'A', 'I', 19);
INSERT INTO estado VALUES ('TACHIRA', 'A', 'I', 20);
INSERT INTO estado VALUES ('TRUJILLO', 'A', 'I', 21);
INSERT INTO estado VALUES ('YARACUY', 'A', 'I', 22);
INSERT INTO estado VALUES ('ZULIA', 'A', 'I', 23);
INSERT INTO estado VALUES ('VARGAS', 'A', 'I', 24);
INSERT INTO estado VALUES ('D. FEDERALES', 'A', 'I', 25);
INSERT INTO estado VALUES ('CARABOBO', 'A', 'I', 26);
INSERT INTO estado VALUES ('DISTRITO CAPITAL', 'I', 'I', 1);


--
-- Data for Name: estrategia; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: estrategia_codest_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('estrategia_codest_seq', 1, false);


--
-- Data for Name: evaluacion; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO evaluacion VALUES (2, 1, '2014-10-26', '12:48:32', '-', 'V-15341271', '10', '2', 'ADG30213', '1');
INSERT INTO evaluacion VALUES (3, 1, '2015-01-19', '04:44:26', 'asf', 'V-1988857', '10', '0', 'ADG30213', '1');
INSERT INTO evaluacion VALUES (1, 1, '2015-02-16', '05:15:40', '90', 'V-21057251', '10', '9', 'ADG30213', '1');


--
-- Name: evaluacion_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('evaluacion_numero_seq', 1, false);


--
-- Data for Name: evaluacion_pla; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: evaluacion_pla_codigo_ep_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('evaluacion_pla_codigo_ep_seq', 1, false);


--
-- Data for Name: evaluadores; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO evaluadores VALUES (1, 'V-21058793', 4, '1', '2014-11-08', '07:39:51');


--
-- Name: evaluadores_idevaluadores_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('evaluadores_idevaluadores_seq', 1, false);


--
-- Data for Name: historial_clave; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO historial_clave VALUES ('D1988857', 'fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('D1988857', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('E20025035', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('E20025035', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('A4925159', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('A4925159', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('A4925159', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('A4925159', 'fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2', '2015-04-04');
INSERT INTO historial_clave VALUES ('E21057252', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('E21057253', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', '80f598a0022f00738ad71a6873c1e846c6657a473d84e3268e97e03597ccc352b45e660c6bd6c5014731297c17147a002711a9d4821e76f87a27d18f298167c8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D20041540', 'd23054175dec77d75b9a34c1fa89539f08da3551ddf3b492778d4e5546e022d5f859aa6fde9391fb55a90d62ecd0db3c02291672455123c24e11e2755c7052e6', '2015-04-04');
INSERT INTO historial_clave VALUES ('D21057251', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D21057251', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-04-04');
INSERT INTO historial_clave VALUES ('D21057251', '80f598a0022f00738ad71a6873c1e846c6657a473d84e3268e97e03597ccc352b45e660c6bd6c5014731297c17147a002711a9d4821e76f87a27d18f298167c8', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', '9b764dd90c2da7de846c9acfa9d39fec5db056b4cf291fb83b576b45e2375d1dfe93883ee467b3a425ea439e6d40d876178555c72657887cc81d40164b0011aa', '2015-04-04');
INSERT INTO historial_clave VALUES ('D15341271', 'fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2', '2015-05-04');
INSERT INTO historial_clave VALUES ('A21059374', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2015-05-26');
INSERT INTO historial_clave VALUES ('D21058793', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2015-05-26');
INSERT INTO historial_clave VALUES ('D21057251', '939b3c5d9e2aeb037cad38b300be67830861186da01a24b7e446a6a7378341e3d5fe0bb983f75d20f84a180fca25958650325126a042cdbc1343f56a81edc176', '2015-05-28');


--
-- Data for Name: inscripcion_pre; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO inscripcion_pre VALUES (15, 'V-21057279', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (16, 'V-21057278', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (17, 'V-21057277', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (18, 'V-21057276', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (19, 'V-21057275', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (20, 'V-21057274', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (21, 'V-21057273', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (22, 'V-21057272', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (23, 'V-21057271', '2014-03-08', '18:19:41', 1, '1');
INSERT INTO inscripcion_pre VALUES (144, 'V-17945460', '2014-04-28', '16:22:59', 1, '1');
INSERT INTO inscripcion_pre VALUES (145, 'V-17945459', '2014-04-28', '16:22:59', 1, '1');
INSERT INTO inscripcion_pre VALUES (146, 'V-17945458', '2014-04-28', '16:22:59', 1, '1');
INSERT INTO inscripcion_pre VALUES (147, 'V-17945456', '2014-04-28', '16:22:59', 1, '1');
INSERT INTO inscripcion_pre VALUES (148, 'V-17945455', '2014-04-28', '16:22:59', 1, '1');
INSERT INTO inscripcion_pre VALUES (149, 'V-17945453', '2014-04-28', '16:22:59', 1, '1');
INSERT INTO inscripcion_pre VALUES (150, 'V-17945452', '2014-04-28', '16:22:59', 1, '1');
INSERT INTO inscripcion_pre VALUES (167, 'V-21057678', '2014-10-29', '05:28:21', 140, '1');
INSERT INTO inscripcion_pre VALUES (174, 'V-21057292', '2014-10-29', '05:30:03', 140, '1');
INSERT INTO inscripcion_pre VALUES (175, 'V-21057291', '2014-10-29', '05:31:39', 156, '1');
INSERT INTO inscripcion_pre VALUES (176, 'V-21057291', '2014-10-29', '05:31:39', 159, '1');
INSERT INTO inscripcion_pre VALUES (177, 'V-21057291', '2014-10-29', '05:31:39', 157, '1');
INSERT INTO inscripcion_pre VALUES (178, 'V-21057291', '2014-10-29', '05:31:39', 158, '1');
INSERT INTO inscripcion_pre VALUES (180, 'V-21057290', '2014-10-29', '05:32:17', 142, '1');
INSERT INTO inscripcion_pre VALUES (181, 'V-21057290', '2014-10-29', '05:32:17', 145, '1');
INSERT INTO inscripcion_pre VALUES (182, 'V-21057290', '2014-10-29', '05:32:17', 143, '1');
INSERT INTO inscripcion_pre VALUES (183, 'V-21057290', '2014-10-29', '05:32:17', 144, '1');
INSERT INTO inscripcion_pre VALUES (184, 'V-21057290', '2014-10-29', '05:32:17', 146, '1');
INSERT INTO inscripcion_pre VALUES (187, 'V-21057289', '2014-10-29', '05:33:07', 159, '1');
INSERT INTO inscripcion_pre VALUES (188, 'V-21057289', '2014-10-29', '05:33:07', 138, '1');
INSERT INTO inscripcion_pre VALUES (189, 'V-21057288', '2014-10-29', '05:34:19', 140, '1');
INSERT INTO inscripcion_pre VALUES (190, 'V-21057288', '2014-10-29', '05:34:19', 139, '1');
INSERT INTO inscripcion_pre VALUES (193, 'V-21057287', '2014-10-29', '05:36:22', 159, '1');
INSERT INTO inscripcion_pre VALUES (195, 'V-21057287', '2014-10-29', '05:36:22', 158, '1');
INSERT INTO inscripcion_pre VALUES (197, 'V-21057286', '2014-10-29', '05:38:10', 159, '1');
INSERT INTO inscripcion_pre VALUES (198, 'V-21057286', '2014-10-29', '05:38:10', 157, '1');
INSERT INTO inscripcion_pre VALUES (199, 'V-21057286', '2014-10-29', '05:38:10', 137, '1');
INSERT INTO inscripcion_pre VALUES (202, 'V-21057285', '2014-10-29', '05:39:42', 140, '1');
INSERT INTO inscripcion_pre VALUES (203, 'V-21057285', '2014-10-29', '05:39:42', 141, '1');
INSERT INTO inscripcion_pre VALUES (205, 'V-21057285', '2014-10-29', '05:39:42', 138, '1');
INSERT INTO inscripcion_pre VALUES (207, 'V-21057284', '2014-10-29', '05:40:39', 155, '1');
INSERT INTO inscripcion_pre VALUES (208, 'V-21057284', '2014-10-29', '05:40:39', 159, '1');
INSERT INTO inscripcion_pre VALUES (210, 'V-21057283', '2014-10-29', '05:42:27', 154, '1');
INSERT INTO inscripcion_pre VALUES (211, 'V-21057283', '2014-10-29', '05:42:27', 159, '1');
INSERT INTO inscripcion_pre VALUES (212, 'V-21057283', '2014-10-29', '05:42:27', 145, '1');
INSERT INTO inscripcion_pre VALUES (213, 'V-21057283', '2014-10-29', '05:42:27', 158, '1');
INSERT INTO inscripcion_pre VALUES (214, 'V-21057283', '2014-10-29', '05:42:27', 139, '1');
INSERT INTO inscripcion_pre VALUES (215, 'V-21057282', '2014-10-29', '05:43:35', 141, '1');
INSERT INTO inscripcion_pre VALUES (216, 'V-21057282', '2014-10-29', '05:43:35', 138, '1');
INSERT INTO inscripcion_pre VALUES (218, 'V-21057282', '2014-10-29', '05:43:35', 156, '1');
INSERT INTO inscripcion_pre VALUES (219, 'V-21057281', '2014-10-29', '05:44:47', 145, '1');
INSERT INTO inscripcion_pre VALUES (220, 'V-21057281', '2014-10-29', '05:44:47', 144, '1');
INSERT INTO inscripcion_pre VALUES (221, 'V-21057281', '2014-10-29', '05:44:47', 146, '1');
INSERT INTO inscripcion_pre VALUES (222, 'V-21057281', '2014-10-29', '05:44:47', 142, '1');
INSERT INTO inscripcion_pre VALUES (223, 'V-21057281', '2014-10-29', '05:44:47', 143, '1');
INSERT INTO inscripcion_pre VALUES (224, 'V-21057281', '2014-10-29', '05:44:47', 158, '1');
INSERT INTO inscripcion_pre VALUES (229, 'V-21057280', '2014-10-29', '05:47:27', 140, '1');
INSERT INTO inscripcion_pre VALUES (171, 'V-21057292', '2014-10-29', '05:30:03', 143, '1');
INSERT INTO inscripcion_pre VALUES (179, 'V-21057291', '2014-10-29', '05:31:39', 141, '1');
INSERT INTO inscripcion_pre VALUES (165, 'V-21057678', '2014-10-29', '05:28:21', 137, '1');
INSERT INTO inscripcion_pre VALUES (169, 'V-21057678', '2014-10-29', '05:28:21', 141, '1');
INSERT INTO inscripcion_pre VALUES (226, 'V-21057280', '2014-10-29', '05:47:27', 143, '1');
INSERT INTO inscripcion_pre VALUES (200, 'V-21057286', '2014-10-29', '05:38:10', 141, '1');
INSERT INTO inscripcion_pre VALUES (191, 'V-21057288', '2014-10-29', '05:34:19', 137, '1');
INSERT INTO inscripcion_pre VALUES (192, 'V-21057288', '2014-10-29', '05:34:19', 142, '1');
INSERT INTO inscripcion_pre VALUES (170, 'V-21057292', '2014-10-29', '05:30:03', 137, '1');
INSERT INTO inscripcion_pre VALUES (227, 'V-21057280', '2014-10-29', '05:47:27', 137, '1');
INSERT INTO inscripcion_pre VALUES (201, 'V-21057285', '2014-10-29', '05:39:42', 137, '1');
INSERT INTO inscripcion_pre VALUES (225, 'V-21057280', '2014-10-29', '05:47:27', 138, '1');
INSERT INTO inscripcion_pre VALUES (173, 'V-21057292', '2014-10-29', '05:30:03', 146, '1');
INSERT INTO inscripcion_pre VALUES (186, 'V-21057289', '2014-10-29', '05:33:07', 139, '1');
INSERT INTO inscripcion_pre VALUES (217, 'V-21057282', '2014-10-29', '05:43:35', 139, '1');
INSERT INTO inscripcion_pre VALUES (204, 'V-21057285', '2014-10-29', '05:39:42', 139, '1');
INSERT INTO inscripcion_pre VALUES (185, 'V-21057289', '2014-10-29', '05:33:07', 155, '1');
INSERT INTO inscripcion_pre VALUES (284, 'V-17945451', '2015-05-29', '21:38:54', 139, '1');
INSERT INTO inscripcion_pre VALUES (228, 'V-21057280', '2014-10-29', '05:47:27', 146, '1');
INSERT INTO inscripcion_pre VALUES (168, 'V-21057678', '2014-10-29', '05:28:21', 146, '1');
INSERT INTO inscripcion_pre VALUES (209, 'V-21057284', '2014-10-29', '05:40:39', 146, '1');
INSERT INTO inscripcion_pre VALUES (196, 'V-21057287', '2014-10-29', '05:36:22', 146, '1');
INSERT INTO inscripcion_pre VALUES (166, 'V-21057678', '2014-10-29', '05:28:21', 150, '1');
INSERT INTO inscripcion_pre VALUES (194, 'V-21057287', '2014-10-29', '05:36:22', 138, '1');
INSERT INTO inscripcion_pre VALUES (172, 'V-21057292', '2014-10-29', '05:30:03', 142, '1');
INSERT INTO inscripcion_pre VALUES (206, 'V-21057284', '2014-10-29', '05:40:39', 138, '1');


--
-- Name: inscripcion_pre_num_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('inscripcion_pre_num_inscripcion_seq', 285, true);


--
-- Data for Name: insnot; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO insnot VALUES ('V-21057279', 15, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057278', 16, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057277', 17, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057276', 18, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057275', 19, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057274', 20, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057273', 21, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057272', 22, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057271', 23, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-17945460', 144, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-17945459', 145, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-17945458', 146, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-17945456', 147, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-17945455', 148, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-17945453', 149, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-17945452', 150, 2, 0, 0, 0);
INSERT INTO insnot VALUES ('V-21057287', 194, 3, 100, 11, NULL);
INSERT INTO insnot VALUES ('V-21057284', 206, 3, 100, 15.3000000000000007, NULL);
INSERT INTO insnot VALUES ('V-21057678', 166, 3, 100, 11.1999999999999993, NULL);
INSERT INTO insnot VALUES ('V-21057283', 210, 3, 100, 10, NULL);
INSERT INTO insnot VALUES ('V-21057290', 182, 3, 100, 10, NULL);
INSERT INTO insnot VALUES ('V-21057280', 226, 3, 100, 12, NULL);
INSERT INTO insnot VALUES ('V-21057292', 171, 3, 100, 13, NULL);
INSERT INTO insnot VALUES ('V-21057281', 223, 3, 100, 0, NULL);
INSERT INTO insnot VALUES ('V-21057678', 167, 3, 100, 10, NULL);
INSERT INTO insnot VALUES ('V-21057288', 189, 3, 100, 12, NULL);
INSERT INTO insnot VALUES ('V-21057285', 202, 3, 100, 15, NULL);
INSERT INTO insnot VALUES ('V-21057292', 174, 3, 100, 13, NULL);
INSERT INTO insnot VALUES ('V-21057280', 229, 3, 100, 0, NULL);
INSERT INTO insnot VALUES ('V-21057292', 172, 3, 100, 10, NULL);
INSERT INTO insnot VALUES ('V-21057280', 225, 3, 100, 1, NULL);
INSERT INTO insnot VALUES ('V-21057678', 168, 3, 100, 11, NULL);
INSERT INTO insnot VALUES ('V-21057284', 209, 3, 100, 13, NULL);
INSERT INTO insnot VALUES ('V-21057287', 196, 3, 100, 19.3000000000000007, NULL);
INSERT INTO insnot VALUES ('V-21057288', 190, 3, 100, 15, NULL);
INSERT INTO insnot VALUES ('V-21057289', 186, 3, 100, 10, NULL);
INSERT INTO insnot VALUES ('V-21057280', 228, 3, 100, 25, NULL);
INSERT INTO insnot VALUES ('V-21057282', 217, 3, 100, 0, NULL);
INSERT INTO insnot VALUES ('V-21057283', 214, 3, 100, 12, NULL);
INSERT INTO insnot VALUES ('V-21057285', 204, 3, 100, 0, NULL);


--
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO materia VALUES ('ADG30213', 'METODOLOGÍA DE LA INVESTIGACIÓN I', '', 2, 2, 0, '3', 'N', 'A', '6', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ADG30223', 'METODOLOGÍA DE LA INVESTIGACIÓN II', '', 2, 2, 0, '3', 'N', 'A', '7', '2', 'ADG30213', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ADG30231', 'SEMINARIO DE INVESTIGACIÓN', '', 1, 0, 0, '1', 'N', 'A', '9', '2', 'AGG33133', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ADG37223', 'TÉCNICAS DE ESTUDIO', '', 2, 3, 0, '3', 'N', ' ', '1', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33113', 'GERENCIA EMPRENDEDORA', '', 2, 2, 0, '3', 'N', 'A', '8', '2', 'ECN32285', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33133', 'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS I', '', 2, 2, 0, '3', 'N', 'A', '8', '2', 'ADG30223', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33143', 'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS II', '', 2, 2, 0, '3', 'N', 'A', '9', '2', 'AGG33133', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33153', 'ÉTICA PROFESIONAL', '', 2, 2, 0, '3', 'N', 'A', '9', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33164', 'COMERCIO INTERNACIONAL I', '', 3, 2, 0, '3', 'N', 'A', '6', '2', 'ECN32214', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33174', 'COMERCIO INTERNACIONAL II', '', 3, 2, 0, '4', 'N', 'A', '7', '2', 'AGG33164', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33184', 'ANÁLISIS DE ESTADOS FINANCIEROS I', '', 3, 2, 0, '4', 'N', 'A', '6', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('AGG33194', 'ANÁLISIS DE ESTADOS FINANCIEROS II', '', 3, 2, 0, '4', 'N', 'A', '7', '2', 'AGG33184', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('CJU36114', 'DERECHO MERCANTIL I', '', 3, 2, 0, '4', '', ' ', '3', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('CJU36124', 'DERECHO MERCANTIL II', '', 3, 2, 0, '4', 'N', ' ', '4', '2', 'CJU36114', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('CJU36215', 'TEORÍA Y POLÍTICA FISCAL', '', 4, 2, 0, '5', 'N', 'A', '7', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('CYN35123', 'EDUCACIÓN AMBIENTAL', '', 2, 2, 0, '3', 'N', ' ', '2', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('CYN35223', 'ECONOMÍA HOMBRE Y SOCIEDAD', '', 2, 2, 0, '3', 'N', ' ', '1', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DES12302', 'DESARROLLO SUSTENTABLE', '', 2, 2, 0, '3', 'N', 'A', '0', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31113', 'DEFENSA INTEGRAL DE LA NACIÓN I', '', 2, 2, 0, '3', 'N', 'A', '1', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31123', 'DEFENSA INTEGRAL DE LA NACIÓN II', '', 2, 2, 0, '3', '', ' ', '2', '2', 'DIN31113', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31133', 'DEFENSA INTEGRAL DE LA NACIÓN III', '', 2, 2, 0, '3', 'N', ' ', '3', '2', 'DIN31123', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31143', 'DEFENSA INTEGRAL DE LA NACIÓN IV', '', 2, 2, 0, '3', 'N', ' ', '4', '2', 'DIN31133', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31153', 'DEFENSA INTEGRAL V', '', 2, 2, 0, '3', 'N', 'A', '5', '2', 'DIN31143', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31163', 'DEFENSA INTEGRAL VI', '', 2, 2, 0, '3', 'N', 'A', '6', '2', 'DIN31153', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31173', 'DEFENSA INTEGRAL VII', '', 2, 2, 0, '3', 'N', 'A', '7', '2', 'DIN31143', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('DIN31183', 'DEFENSA INTEGRAL VIII', '', 2, 2, 0, '3', 'N', 'A', '8', '2', 'DIN31173', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32114', 'INTRODUCCIÓN A LA ECONOMÍA', '', 3, 2, 0, '4', 'N', ' ', '1', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32135', 'CONTABILIDAD II', '', 3, 4, 0, '5', 'N', ' ', '2', '2', 'ECN32124', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32145', 'CONTABILIDAD SOCIAL', '', 3, 4, 0, '5', 'N', ' ', '3', '2', 'ECN32135', 'SOC34114', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32154', 'MICROECONOMÍA', '', 3, 2, 0, '4', 'N', ' ', '2', '2', 'ECN32114', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32164', 'MACROECONOMÍA I', '', 3, 2, 0, '4', 'N', 'A', '3', '2', 'ECN32154', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32174', 'MACROECONOMÍA II', '', 3, 2, 0, '4', 'N', ' ', '4', '2', 'ECN32164', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32214', 'MERCADO FINANCIERO', '', 3, 2, 0, '4', 'N', 'A', '5', '2', 'ECN32174', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32225', 'ECONOMETRÍA I', '', 4, 2, 0, '5', 'N', 'A', '6', '2', 'MAT31364', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32235', 'ECONOMETRÍA II', '', 4, 2, 0, '5', 'N', 'A', '7', '2', 'ECN32225', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32244', 'DESARROLLO ECONÓMICO', '', 3, 2, 0, '4', 'N', 'A', '9', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32265', 'POLÍTICA MONETARIA', '', 4, 2, 0, '5', 'N', 'A', '5', '2', 'CJU36124', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32285', 'TEORÍA Y MODELOS DE CRECIMIENTO ECONÓMICO', '', 4, 2, 0, '5', 'N', 'A', '8', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('IDI37113', 'INGLÉS I', '', 2, 2, 0, '3', '', 'A', '8', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('IDI37123', 'INGLÉS II', '', 2, 2, 0, '3', 'N', 'A', '9', '2', 'IDI37113', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31025', 'MATEMÁTICA ', '', 3, 4, 0, '5', 'N', 'A', '0', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31114', 'MATEMÁTICA I', '', 3, 3, 0, '4', 'N', ' ', '1', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31125', 'MATEMÁTICA II', '', 3, 4, 0, '5', 'N', ' ', '2', '2', 'MAT31114', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31135', 'MATEMÁTICA III', '', 3, 4, 0, '5', 'N', ' ', '3', '2', 'MAT31125', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31215', 'ESTADÍSTICA I', '', 4, 2, 0, '5', 'N', ' ', '3', '2', 'MAT31135', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31225', 'ESTADÍSTICA II', '', 4, 2, 0, '5', 'N', ' ', '4', '2', 'MAT31215', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31235', 'ESTADÍSTICA III', '', 4, 2, 0, '5', 'N', ' ', '5', '2', 'MAT31225', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31254', 'MATEMÁTICA FINANCIERA I', '', 3, 2, 0, '4', 'N', ' ', '4', '2', 'MAT31135', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('MAT31364', 'MATEMÁTICA FINANCIERA II', '', 3, 2, 0, '4', 'N', ' ', '5', '2', 'MAT31254', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('SOB33031', 'SOBERANÍA POLÍTICA', '', 3, 2, 0, '3', 'N', 'A', '0', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('SOC34214', 'GEOGRAFÍA ECONÓMICA DE VENEZUELA', '', 3, 2, 0, '4', 'N', ' ', '3', '2', 'SOC34114', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('SYC35113', 'INFORMÁTICA I', '', 2, 2, 0, '3', 'N', ' ', '4', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('SYC35124', 'INFORMÁTICA II', '', 3, 2, 0, '4', 'N', ' ', '5', '2', 'SYC35113', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('ECN32124', 'CONTABILIDAD I', '  ', 3, 3, 0, '4', '', '', '1', '2', '-', '-', '-', 'I', NULL);
INSERT INTO materia VALUES ('CINU10', 'CURSO INTROCTORIO NACIONAL UNIFICADO', '', 0, 0, 0, '0', 'N', 'A', '0', '2', '-', '-', '-', 'i', NULL);
INSERT INTO materia VALUES ('SOC34114', 'HISTORIA ECONÓMICA DE VENEZUELA', '', 3, 2, 0, '4', 'N', 'A', '2', '2', '-', '-', '-', 'I', NULL);


--
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO modulo VALUES (5, 'ACADEMICO', 'A', '#1ABC9C', 'ICON ICON-WHITE ICON-BOOK');
INSERT INTO modulo VALUES (3, 'EVALUACION DOCENTE', 'A', '#F39C12', 'ICON ICON-WHITE ICON-COMPOSE');
INSERT INTO modulo VALUES (4, 'SEGURIDAD', 'A', '#34495E', 'ICON ICON-WHITE ICON-LOCKED');
INSERT INTO modulo VALUES (11, 'POSTGRADO', 'A', '#A92525', 'ICON ICON-WHITE ICON-LOCKED');
INSERT INTO modulo VALUES (2, 'SECRETARIA', 'A', '#2980B9', 'ICON ICON-WHITE ICON-BRIEFCASE');
INSERT INTO modulo VALUES (1, 'GENERAL', 'A', '#2C3E50', 'ICON ICON-WHITE ICON-WEB');


--
-- Name: modulo_mod_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('modulo_mod_codigo_seq', 12, true);


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO municipio VALUES (1, 'LIBERTADOR', 'A', 1, 'I');
INSERT INTO municipio VALUES (3, 'AUTONOMO ATABAPO', 'A', 2, 'I');
INSERT INTO municipio VALUES (4, 'AUTONOMO ATURES', 'A', 2, 'I');
INSERT INTO municipio VALUES (5, 'AUTONOMO AUTANA', 'A', 2, 'I');
INSERT INTO municipio VALUES (6, 'AUTONOMO MAROA', 'A', 2, 'I');
INSERT INTO municipio VALUES (7, 'AUTONOMO MANAPIARE', 'A', 2, 'I');
INSERT INTO municipio VALUES (8, 'AUTONOMO RIO NEGRO', 'A', 2, 'I');
INSERT INTO municipio VALUES (9, 'ANACO', 'A', 3, 'I');
INSERT INTO municipio VALUES (10, 'ARAGUA', 'A', 3, 'I');
INSERT INTO municipio VALUES (11, 'FERNANDO DE PEÑO', 'A', 1, 'I');
INSERT INTO municipio VALUES (12, 'FRANCISCO DEL CARMEN CARVAJAL', 'A', 3, 'I');
INSERT INTO municipio VALUES (13, 'FRANCISCO DE MIRANDA', 'A', 3, 'I');
INSERT INTO municipio VALUES (14, 'GUANTA', 'A', 3, 'I');
INSERT INTO municipio VALUES (15, 'INDEPENDENCIA', 'A', 3, 'I');
INSERT INTO municipio VALUES (16, 'JUAN ANTONIO SOTILLO', 'A', 3, 'I');
INSERT INTO municipio VALUES (17, 'JUAN MANUEL CAJIGAL', 'A', 3, 'I');
INSERT INTO municipio VALUES (18, 'JOSE GREGORIO MONAGAS', 'A', 3, 'I');
INSERT INTO municipio VALUES (19, 'LIBERTAD', 'A', 3, 'I');
INSERT INTO municipio VALUES (20, 'MANUEL EZEQUIEL BRUZUAL', 'A', 3, 'I');
INSERT INTO municipio VALUES (21, 'PEDRO MARIA FREITES', 'A', 3, 'I');
INSERT INTO municipio VALUES (22, 'PIRITU', 'A', 3, 'I');
INSERT INTO municipio VALUES (23, 'SAN JOSE DE GUANIPA', 'A', 3, 'I');
INSERT INTO municipio VALUES (24, 'SAN JUAN DE CAPISTRANO', 'A', 3, 'I');
INSERT INTO municipio VALUES (25, 'SANTA ANA', 'A', 3, 'I');
INSERT INTO municipio VALUES (26, 'SIMON BOLIVAR', 'A', 3, 'I');
INSERT INTO municipio VALUES (27, 'SIMON RODRIGUEZ', 'A', 3, 'I');
INSERT INTO municipio VALUES (28, 'SIR ARTHUR MC GREGOR', 'A', 3, 'I');
INSERT INTO municipio VALUES (29, 'TURIST DIEGO BAUTISTA URBANEJA', 'A', 3, 'I');
INSERT INTO municipio VALUES (30, 'ACHAGUAS', 'A', 4, 'I');
INSERT INTO municipio VALUES (31, 'BIRUACA', 'A', 4, 'I');
INSERT INTO municipio VALUES (32, 'MU', 'A', 1, 'I');
INSERT INTO municipio VALUES (33, 'PAEZ', 'A', 4, 'I');
INSERT INTO municipio VALUES (34, 'PEDRO CAMEJO', 'A', 4, 'I');
INSERT INTO municipio VALUES (35, 'ROMULO GALLEGOS', 'A', 4, 'I');
INSERT INTO municipio VALUES (36, 'SAN FERNANDO', 'A', 4, 'I');
INSERT INTO municipio VALUES (37, 'BOLIVAR', 'A', 5, 'I');
INSERT INTO municipio VALUES (38, 'JOSE GREGORIO MONAGAS', 'A', 5, 'I');
INSERT INTO municipio VALUES (39, 'GIRARDOT', 'A', 5, 'I');
INSERT INTO municipio VALUES (40, 'JOSE ANGEL LAMAS', 'A', 5, 'I');
INSERT INTO municipio VALUES (41, 'JOSE FELIX RIBAS', 'A', 5, 'I');
INSERT INTO municipio VALUES (42, 'JOSE RAFAEL REVENGA', 'A', 5, 'I');
INSERT INTO municipio VALUES (43, 'LIBERTADOR', 'A', 5, 'I');
INSERT INTO municipio VALUES (44, 'MARIO BRICEÑA', 'A', 1, 'I');
INSERT INTO municipio VALUES (45, 'SAN CASIMIRO', 'A', 5, 'I');
INSERT INTO municipio VALUES (46, 'SAN SEBASTIAN', 'A', 5, 'I');
INSERT INTO municipio VALUES (47, 'SANTIAGO MARIÑO', 'A', 1, 'I');
INSERT INTO municipio VALUES (48, 'SANTOS MICHELENA', 'A', 5, 'I');
INSERT INTO municipio VALUES (49, 'SUCRE', 'A', 5, 'I');
INSERT INTO municipio VALUES (50, 'TOVAR', 'A', 5, 'I');
INSERT INTO municipio VALUES (51, 'URDANETA', 'A', 5, 'I');
INSERT INTO municipio VALUES (52, 'ZAMORA', 'A', 5, 'I');
INSERT INTO municipio VALUES (53, 'FRANCISCO LINARES ALCANTARA', 'A', 5, 'I');
INSERT INTO municipio VALUES (54, 'OCUMARE DE LA COSTA DE ORO', 'A', 5, 'I');
INSERT INTO municipio VALUES (55, 'ALBERTO ARVELO TORREALBA', 'A', 6, 'I');
INSERT INTO municipio VALUES (56, 'ANTONIO JOSE DE SUCRE', 'A', 6, 'I');
INSERT INTO municipio VALUES (57, 'ARISMENDI', 'A', 6, 'I');
INSERT INTO municipio VALUES (58, 'BARINAS', 'A', 6, 'I');
INSERT INTO municipio VALUES (59, 'BOLIVAR', 'A', 6, 'I');
INSERT INTO municipio VALUES (60, 'CRUZ PAREDES', 'A', 6, 'I');
INSERT INTO municipio VALUES (61, 'EZEQUIEL ZAMORA', 'A', 6, 'I');
INSERT INTO municipio VALUES (62, 'OBISPOS', 'A', 6, 'I');
INSERT INTO municipio VALUES (63, 'PEDRAZA', 'A', 6, 'I');
INSERT INTO municipio VALUES (64, 'ROJAS', 'A', 6, 'I');
INSERT INTO municipio VALUES (65, 'SOSA', 'A', 6, 'I');
INSERT INTO municipio VALUES (66, 'ANDRES ELOY BLANCO', 'A', 6, 'I');
INSERT INTO municipio VALUES (67, 'CARONI', 'A', 15, 'I');
INSERT INTO municipio VALUES (68, 'CEDEÑO', 'A', 1, 'I');
INSERT INTO municipio VALUES (69, 'EL CALLAO', 'A', 15, 'I');
INSERT INTO municipio VALUES (70, 'GRAN SABANA', 'A', 15, 'I');
INSERT INTO municipio VALUES (71, 'HERES', 'A', 15, 'I');
INSERT INTO municipio VALUES (72, 'PIAR', 'A', 15, 'I');
INSERT INTO municipio VALUES (73, 'RAUL LEONI', 'A', 15, 'I');
INSERT INTO municipio VALUES (74, 'ROSCIO', 'A', 15, 'I');
INSERT INTO municipio VALUES (75, 'SIFONTES', 'A', 15, 'I');
INSERT INTO municipio VALUES (76, 'SUCRE', 'A', 15, 'I');
INSERT INTO municipio VALUES (77, 'PADRE PEDRO CHIEN', 'A', 15, 'I');
INSERT INTO municipio VALUES (78, 'BEJUMA', 'A', 8, 'I');
INSERT INTO municipio VALUES (79, 'BOLIVAR', 'A', 8, 'I');
INSERT INTO municipio VALUES (80, 'DIEGO IBARRA', 'A', 8, 'I');
INSERT INTO municipio VALUES (81, 'GUACARA', 'A', 8, 'I');
INSERT INTO municipio VALUES (82, 'JUAN JOSE MORA', 'A', 8, 'I');
INSERT INTO municipio VALUES (83, 'LIBERTADOR', 'A', 8, 'I');
INSERT INTO municipio VALUES (84, 'LOS GUAYOS', 'A', 8, 'I');
INSERT INTO municipio VALUES (85, 'MIRANDA', 'A', 8, 'I');
INSERT INTO municipio VALUES (86, 'MONTALBAN', 'A', 8, 'I');
INSERT INTO municipio VALUES (87, 'NAGUANAGUA', 'A', 8, 'I');
INSERT INTO municipio VALUES (88, 'PUERTO CABELLO', 'A', 8, 'I');
INSERT INTO municipio VALUES (89, 'SAN DIEGO', 'A', 8, 'I');
INSERT INTO municipio VALUES (90, 'SAN JOAQUIN', 'A', 8, 'I');
INSERT INTO municipio VALUES (91, 'VALENCIA', 'A', 8, 'I');
INSERT INTO municipio VALUES (92, 'ANZOATEGUI', 'A', 9, 'I');
INSERT INTO municipio VALUES (93, 'RAUL LEONI', 'A', 9, 'I');
INSERT INTO municipio VALUES (94, 'GIRARDOT', 'A', 9, 'I');
INSERT INTO municipio VALUES (95, 'LIMA BLANCO', 'A', 9, 'I');
INSERT INTO municipio VALUES (96, 'PAO DE SAN JUAN BAUTISTA', 'A', 9, 'I');
INSERT INTO municipio VALUES (97, 'RICAURTE', 'A', 9, 'I');
INSERT INTO municipio VALUES (98, 'ROMULO GALLEGOS', 'A', 9, 'I');
INSERT INTO municipio VALUES (99, 'SAN CARLOS', 'A', 9, 'I');
INSERT INTO municipio VALUES (100, 'TINACO', 'A', 9, 'I');
INSERT INTO municipio VALUES (101, 'ANTONIO DIAZ', 'A', 10, 'I');
INSERT INTO municipio VALUES (102, 'CASACOIMA', 'A', 10, 'I');
INSERT INTO municipio VALUES (103, 'PEDERNALES', 'A', 10, 'I');
INSERT INTO municipio VALUES (104, 'TUCUPITA', 'A', 10, 'I');
INSERT INTO municipio VALUES (105, 'ACOSTA', 'A', 11, 'I');
INSERT INTO municipio VALUES (106, 'BOLIVAR', 'A', 11, 'I');
INSERT INTO municipio VALUES (107, 'BUCHIVACOA', 'A', 11, 'I');
INSERT INTO municipio VALUES (108, 'CACIQUE MANAURE', 'A', 11, 'I');
INSERT INTO municipio VALUES (109, 'CARIRUBANA', 'A', 11, 'I');
INSERT INTO municipio VALUES (110, 'COLINA', 'A', 11, 'I');
INSERT INTO municipio VALUES (111, 'DABAJURO', 'A', 11, 'I');
INSERT INTO municipio VALUES (112, 'DEMOCRACIA', 'A', 11, 'I');
INSERT INTO municipio VALUES (113, 'FALCON', 'A', 11, 'I');
INSERT INTO municipio VALUES (114, 'FEDERACION', 'A', 11, 'I');
INSERT INTO municipio VALUES (115, 'JACURA', 'A', 11, 'I');
INSERT INTO municipio VALUES (116, 'LOS TAQUES', 'A', 11, 'I');
INSERT INTO municipio VALUES (117, 'MAUROA', 'A', 11, 'I');
INSERT INTO municipio VALUES (118, 'ROMULO GALLEGOS', 'A', 11, 'I');
INSERT INTO municipio VALUES (119, 'MONSEÑA', 'A', 1, 'I');
INSERT INTO municipio VALUES (120, 'PALMASOLA', 'A', 11, 'I');
INSERT INTO municipio VALUES (121, 'PETIT', 'A', 11, 'I');
INSERT INTO municipio VALUES (122, 'PIRITU', 'A', 11, 'I');
INSERT INTO municipio VALUES (123, 'SAN FRANCISCO', 'A', 11, 'I');
INSERT INTO municipio VALUES (124, 'SILVA', 'A', 11, 'I');
INSERT INTO municipio VALUES (125, 'SUCRE', 'A', 11, 'I');
INSERT INTO municipio VALUES (126, 'TOCOPERO', 'A', 11, 'I');
INSERT INTO municipio VALUES (127, 'UNION', 'A', 11, 'I');
INSERT INTO municipio VALUES (128, 'URUMACO', 'A', 11, 'I');
INSERT INTO municipio VALUES (129, 'ZAMORA', 'A', 11, 'I');
INSERT INTO municipio VALUES (130, 'CAMAGUAN', 'A', 12, 'I');
INSERT INTO municipio VALUES (131, 'CHAGUARAMAS', 'A', 12, 'I');
INSERT INTO municipio VALUES (132, 'EL SOCORRO', 'A', 12, 'I');
INSERT INTO municipio VALUES (133, 'SAN GERONIMO DE GUAYABAL', 'A', 12, 'I');
INSERT INTO municipio VALUES (134, 'FEDERACION', 'A', 12, 'I');
INSERT INTO municipio VALUES (135, 'LAS MERCEDES', 'A', 12, 'I');
INSERT INTO municipio VALUES (136, 'JULIAN MELLADO', 'A', 12, 'I');
INSERT INTO municipio VALUES (137, 'FRANCISCO DE MIRANDA', 'A', 12, 'I');
INSERT INTO municipio VALUES (138, 'JOSE TADEO MONAGAS', 'A', 12, 'I');
INSERT INTO municipio VALUES (139, 'ORTIZ', 'A', 12, 'I');
INSERT INTO municipio VALUES (140, 'JOSE FELIX RIBAS', 'A', 12, 'I');
INSERT INTO municipio VALUES (141, 'JUAN GERMAN ROSCIO', 'A', 12, 'I');
INSERT INTO municipio VALUES (142, 'SAN JOSE DE GUARIBE', 'A', 12, 'I');
INSERT INTO municipio VALUES (143, 'SANTA MARIA DE IPIRE', 'A', 12, 'I');
INSERT INTO municipio VALUES (144, 'PEDRO ZARAZA', 'A', 12, 'I');
INSERT INTO municipio VALUES (145, 'ANDRES ELOY BLANCO', 'A', 13, 'I');
INSERT INTO municipio VALUES (146, 'CRESPO', 'A', 13, 'I');
INSERT INTO municipio VALUES (147, 'IRIBARREN', 'A', 13, 'I');
INSERT INTO municipio VALUES (148, 'JIMENEZ', 'A', 13, 'I');
INSERT INTO municipio VALUES (149, 'MORAN', 'A', 13, 'I');
INSERT INTO municipio VALUES (150, 'PALAVECINO', 'A', 13, 'I');
INSERT INTO municipio VALUES (151, 'SIMON PLANAS', 'A', 13, 'I');
INSERT INTO municipio VALUES (152, 'TORRES', 'A', 13, 'I');
INSERT INTO municipio VALUES (153, 'URDANETA', 'A', 13, 'I');
INSERT INTO municipio VALUES (154, 'ALBERTO ADRIANI', 'A', 14, 'I');
INSERT INTO municipio VALUES (155, 'ANDRES BELLO', 'A', 14, 'I');
INSERT INTO municipio VALUES (156, 'ANTONIO PINTO SALINAS', 'A', 14, 'I');
INSERT INTO municipio VALUES (157, 'ARICAGUA', 'A', 14, 'I');
INSERT INTO municipio VALUES (158, 'ARZOBISPO CHACON', 'A', 14, 'I');
INSERT INTO municipio VALUES (159, 'CAMPO ELIAS', 'A', 14, 'I');
INSERT INTO municipio VALUES (160, 'JOSE FELIX RIBAS', 'A', 14, 'I');
INSERT INTO municipio VALUES (161, 'CARDENAL QUINTERO', 'A', 14, 'I');
INSERT INTO municipio VALUES (162, 'GUARAQUE', 'A', 14, 'I');
INSERT INTO municipio VALUES (163, 'JULIO CESAR SALAS', 'A', 14, 'I');
INSERT INTO municipio VALUES (164, 'JUSTO BRICEÑO', 'A', 1, 'I');
INSERT INTO municipio VALUES (165, 'LIBERTADOR', 'A', 14, 'I');
INSERT INTO municipio VALUES (166, 'MIRANDA', 'A', 14, 'I');
INSERT INTO municipio VALUES (167, 'OBISPO RAMOS DE LORA', 'A', 14, 'I');
INSERT INTO municipio VALUES (168, 'PADRE NOGUERA', 'A', 14, 'I');
INSERT INTO municipio VALUES (169, 'PUEBLO LLANO', 'A', 14, 'I');
INSERT INTO municipio VALUES (170, 'RANGEL', 'A', 14, 'I');
INSERT INTO municipio VALUES (171, 'RIVAS DAVILA', 'A', 14, 'I');
INSERT INTO municipio VALUES (172, 'SANTOS MARQUINA', 'A', 14, 'I');
INSERT INTO municipio VALUES (173, 'SUCRE', 'A', 14, 'I');
INSERT INTO municipio VALUES (174, 'TOVAR', 'A', 14, 'I');
INSERT INTO municipio VALUES (175, 'TULIO FEBRES CORDERO', 'A', 14, 'I');
INSERT INTO municipio VALUES (176, 'ZEA', 'A', 14, 'I');
INSERT INTO municipio VALUES (177, 'ACEVEDO', 'A', 7, 'I');
INSERT INTO municipio VALUES (178, 'ANDRES BELLO', 'A', 7, 'I');
INSERT INTO municipio VALUES (179, 'CAMPO ELIAS', 'A', 3, 'I');
INSERT INTO municipio VALUES (180, 'BRION', 'A', 7, 'I');
INSERT INTO municipio VALUES (181, 'BUROZ', 'A', 7, 'I');
INSERT INTO municipio VALUES (182, 'CARRIZAL', 'A', 7, 'I');
INSERT INTO municipio VALUES (183, 'CHACAO', 'A', 7, 'I');
INSERT INTO municipio VALUES (184, 'CRISTOBAL ROJAS', 'A', 7, 'I');
INSERT INTO municipio VALUES (185, 'EL HATILLO', 'A', 7, 'I');
INSERT INTO municipio VALUES (186, 'GUAICAIPURO', 'A', 7, 'I');
INSERT INTO municipio VALUES (187, 'INDEPENDENCIA', 'A', 7, 'I');
INSERT INTO municipio VALUES (188, 'TOMAS LANDER', 'A', 7, 'I');
INSERT INTO municipio VALUES (189, 'LOS SALIAS', 'A', 7, 'I');
INSERT INTO municipio VALUES (190, 'PAEZ', 'A', 7, 'I');
INSERT INTO municipio VALUES (191, 'PAZ CASTILLO', 'A', 7, 'I');
INSERT INTO municipio VALUES (192, 'PEDRO GUAL', 'A', 7, 'I');
INSERT INTO municipio VALUES (193, 'PLAZA', 'A', 7, 'I');
INSERT INTO municipio VALUES (194, 'SIMON BOLIVAR', 'A', 7, 'I');
INSERT INTO municipio VALUES (195, 'SUCRE', 'A', 7, 'I');
INSERT INTO municipio VALUES (196, 'URDANETA', 'A', 7, 'I');
INSERT INTO municipio VALUES (197, 'ZAMORA', 'A', 7, 'I');
INSERT INTO municipio VALUES (198, 'ACOSTA', 'A', 16, 'I');
INSERT INTO municipio VALUES (199, 'AGUASAY', 'A', 16, 'I');
INSERT INTO municipio VALUES (200, 'BRION', 'A', 16, 'I');
INSERT INTO municipio VALUES (201, 'CARIPE', 'A', 16, 'I');
INSERT INTO municipio VALUES (202, 'CEDE', 'A', 1, 'I');
INSERT INTO municipio VALUES (203, 'EZEQUIEL ZAMORA', 'A', 16, 'I');
INSERT INTO municipio VALUES (204, 'LIBERTADOR', 'A', 16, 'I');
INSERT INTO municipio VALUES (205, 'MATURIN', 'A', 16, 'I');
INSERT INTO municipio VALUES (206, 'PIAR', 'A', 16, 'I');
INSERT INTO municipio VALUES (207, 'PUNCERES', 'A', 16, 'I');
INSERT INTO municipio VALUES (208, 'SANTA BARBARA', 'A', 16, 'I');
INSERT INTO municipio VALUES (209, 'SOTILLO', 'A', 16, 'I');
INSERT INTO municipio VALUES (210, 'URACOA', 'A', 16, 'I');
INSERT INTO municipio VALUES (211, 'ANTOLIN DEL CAMPO', 'A', 17, 'I');
INSERT INTO municipio VALUES (212, 'ARISMENDI', 'A', 17, 'I');
INSERT INTO municipio VALUES (213, 'DIAZ', 'A', 17, 'I');
INSERT INTO municipio VALUES (214, 'SIMON BOLIVAR', 'A', 17, 'I');
INSERT INTO municipio VALUES (215, 'GOMEZ', 'A', 17, 'I');
INSERT INTO municipio VALUES (216, 'MANEIRO', 'A', 17, 'I');
INSERT INTO municipio VALUES (217, 'MARCANO', 'A', 17, 'I');
INSERT INTO municipio VALUES (218, 'MARIA', 'A', 1, 'I');
INSERT INTO municipio VALUES (219, 'PENINSULA DE MACANAO', 'A', 17, 'I');
INSERT INTO municipio VALUES (220, 'TUBORES', 'A', 17, 'I');
INSERT INTO municipio VALUES (221, 'VILLALBA', 'A', 17, 'I');
INSERT INTO municipio VALUES (222, 'AGUA BLANCA', 'A', 18, 'I');
INSERT INTO municipio VALUES (223, 'ARAURE', 'A', 18, 'I');
INSERT INTO municipio VALUES (224, 'ESTELLER', 'A', 18, 'I');
INSERT INTO municipio VALUES (225, 'GUANARE', 'A', 18, 'I');
INSERT INTO municipio VALUES (226, 'GUANARITO', 'A', 18, 'I');
INSERT INTO municipio VALUES (227, 'MONSEÑA', 'A', 1, 'I');
INSERT INTO municipio VALUES (228, 'OSPINO', 'A', 18, 'I');
INSERT INTO municipio VALUES (229, 'PAEZ', 'A', 18, 'I');
INSERT INTO municipio VALUES (230, 'PAPELON', 'A', 18, 'I');
INSERT INTO municipio VALUES (231, 'SAN GENARO DE BOCONOITO', 'A', 18, 'I');
INSERT INTO municipio VALUES (232, 'SAN RAFAEL DE ONOTO', 'A', 18, 'I');
INSERT INTO municipio VALUES (233, 'SANTA ROSALIA', 'A', 18, 'I');
INSERT INTO municipio VALUES (234, 'SUCRE', 'A', 18, 'I');
INSERT INTO municipio VALUES (235, 'TUREN', 'A', 18, 'I');
INSERT INTO municipio VALUES (236, 'ANDRES ELOY BLANCO', 'A', 19, 'I');
INSERT INTO municipio VALUES (237, 'ANDRES MATA', 'A', 19, 'I');
INSERT INTO municipio VALUES (238, 'ARISMENDI', 'A', 19, 'I');
INSERT INTO municipio VALUES (239, 'PENINSULA DE MACANAO', 'A', 19, 'I');
INSERT INTO municipio VALUES (240, 'BERMUDEZ', 'A', 19, 'I');
INSERT INTO municipio VALUES (241, 'BOLIVAR', 'A', 19, 'I');
INSERT INTO municipio VALUES (242, 'CAJIGAL', 'A', 19, 'I');
INSERT INTO municipio VALUES (243, 'CRUZ SALMERON ACOSTA', 'A', 19, 'I');
INSERT INTO municipio VALUES (244, 'LIBERTADOR', 'A', 19, 'I');
INSERT INTO municipio VALUES (245, 'MARI', 'A', 1, 'I');
INSERT INTO municipio VALUES (246, 'MEJIA', 'A', 19, 'I');
INSERT INTO municipio VALUES (247, 'MONTES', 'A', 19, 'I');
INSERT INTO municipio VALUES (248, 'RIBERO', 'A', 19, 'I');
INSERT INTO municipio VALUES (249, 'SUCRE', 'A', 19, 'I');
INSERT INTO municipio VALUES (250, 'VALDEZ', 'A', 19, 'I');
INSERT INTO municipio VALUES (251, 'ANDRES BELLO', 'A', 20, 'I');
INSERT INTO municipio VALUES (252, 'ANTONIO ROMULO COSTA', 'A', 20, 'I');
INSERT INTO municipio VALUES (253, 'AYACUCHO', 'A', 20, 'I');
INSERT INTO municipio VALUES (254, 'BOLIVAR', 'A', 20, 'I');
INSERT INTO municipio VALUES (255, 'CARDENAS', 'A', 20, 'I');
INSERT INTO municipio VALUES (256, 'CORDOBA', 'A', 20, 'I');
INSERT INTO municipio VALUES (257, 'FERNANDEZ FEO', 'A', 20, 'I');
INSERT INTO municipio VALUES (258, 'FRANCISCO DE MIRANDA', 'A', 20, 'I');
INSERT INTO municipio VALUES (259, 'GARCIA DE HEVIA', 'A', 20, 'I');
INSERT INTO municipio VALUES (260, 'BERMUDEZ', 'A', 20, 'I');
INSERT INTO municipio VALUES (261, 'INDEPENDENCIA', 'A', 20, 'I');
INSERT INTO municipio VALUES (262, 'JAUREGUI', 'A', 20, 'I');
INSERT INTO municipio VALUES (263, 'JOSE MARIA VARGAS', 'A', 20, 'I');
INSERT INTO municipio VALUES (264, 'JUNIN', 'A', 20, 'I');
INSERT INTO municipio VALUES (265, 'LIBERTAD', 'A', 20, 'I');
INSERT INTO municipio VALUES (266, 'LIBERTADOR', 'A', 20, 'I');
INSERT INTO municipio VALUES (267, 'LOBATERA', 'A', 20, 'I');
INSERT INTO municipio VALUES (268, 'MICHELENA', 'A', 20, 'I');
INSERT INTO municipio VALUES (269, 'PANAMERICANO', 'A', 20, 'I');
INSERT INTO municipio VALUES (270, 'PEDRO MARIA URe', 'A', 1, 'I');
INSERT INTO municipio VALUES (271, 'RAFAEL URDANETA', 'A', 20, 'I');
INSERT INTO municipio VALUES (272, 'SAMUEL DARIO MALDONADO', 'A', 20, 'I');
INSERT INTO municipio VALUES (273, 'SAN CRISTOBAL', 'A', 20, 'I');
INSERT INTO municipio VALUES (274, 'SEBORUCO', 'A', 20, 'I');
INSERT INTO municipio VALUES (275, 'SIMON RODRIGUEZ', 'A', 20, 'I');
INSERT INTO municipio VALUES (276, 'SUCRE', 'A', 20, 'I');
INSERT INTO municipio VALUES (277, 'TORBES', 'A', 20, 'I');
INSERT INTO municipio VALUES (278, 'URIBANTE', 'A', 20, 'I');
INSERT INTO municipio VALUES (279, 'GUASIMO', 'A', 20, 'I');
INSERT INTO municipio VALUES (280, 'ANDRES BELLO', 'A', 21, 'I');
INSERT INTO municipio VALUES (281, 'BOCONO', 'A', 21, 'I');
INSERT INTO municipio VALUES (282, 'BOLIVAR', 'A', 21, 'I');
INSERT INTO municipio VALUES (283, 'CANDELARIA', 'A', 21, 'I');
INSERT INTO municipio VALUES (284, 'CARACHE', 'A', 21, 'I');
INSERT INTO municipio VALUES (285, 'ESCUQUE', 'A', 21, 'I');
INSERT INTO municipio VALUES (286, 'JOSE FELIPE MARQUEZ CAÑA', 'A', 1, 'I');
INSERT INTO municipio VALUES (287, 'JUAN VICENTE CAMPO ELIAS', 'A', 21, 'I');
INSERT INTO municipio VALUES (288, 'LA CEIBA', 'A', 21, 'I');
INSERT INTO municipio VALUES (289, 'MIRANDA', 'A', 21, 'I');
INSERT INTO municipio VALUES (290, 'MONTE CARMELO', 'A', 21, 'I');
INSERT INTO municipio VALUES (291, 'MOTATAN', 'A', 21, 'I');
INSERT INTO municipio VALUES (292, 'PAMPAN', 'A', 21, 'I');
INSERT INTO municipio VALUES (293, 'PAMPANITO', 'A', 21, 'I');
INSERT INTO municipio VALUES (294, 'RAFAEL RANGEL', 'A', 21, 'I');
INSERT INTO municipio VALUES (295, 'SAN RAFAEL DE CARVAJAL', 'A', 21, 'I');
INSERT INTO municipio VALUES (296, 'SUCRE', 'A', 21, 'I');
INSERT INTO municipio VALUES (297, 'TRUJILLO', 'A', 21, 'I');
INSERT INTO municipio VALUES (298, 'URDANETA', 'A', 21, 'I');
INSERT INTO municipio VALUES (299, 'VALERA', 'A', 21, 'I');
INSERT INTO municipio VALUES (300, 'ANDRES BELLO', 'A', 22, 'I');
INSERT INTO municipio VALUES (301, 'BOLIVAR', 'A', 22, 'I');
INSERT INTO municipio VALUES (302, 'BRUZUAL', 'A', 22, 'I');
INSERT INTO municipio VALUES (303, 'COCOROTE', 'A', 22, 'I');
INSERT INTO municipio VALUES (304, 'INDEPENDENCIA', 'A', 22, 'I');
INSERT INTO municipio VALUES (305, 'JOSE ANTONIO PAEZ', 'A', 22, 'I');
INSERT INTO municipio VALUES (306, 'LA TRINidmunicipioAD', 'A', 22, 'I');
INSERT INTO municipio VALUES (307, 'MANUEL MONGE', 'A', 22, 'I');
INSERT INTO municipio VALUES (308, 'NIRGUA', 'A', 22, 'I');
INSERT INTO municipio VALUES (309, 'PE', 'A', 1, 'I');
INSERT INTO municipio VALUES (310, 'SAN FELIPE', 'A', 22, 'I');
INSERT INTO municipio VALUES (311, 'SUCRE', 'A', 22, 'I');
INSERT INTO municipio VALUES (312, 'PAMPAN', 'A', 22, 'I');
INSERT INTO municipio VALUES (313, 'VEROES', 'A', 22, 'I');
INSERT INTO municipio VALUES (314, 'ALMIRANTE PADILLA', 'A', 23, 'I');
INSERT INTO municipio VALUES (315, 'BARALT', 'A', 23, 'I');
INSERT INTO municipio VALUES (316, 'CABIMAS', 'A', 23, 'I');
INSERT INTO municipio VALUES (317, 'CATATUMBO', 'A', 23, 'I');
INSERT INTO municipio VALUES (318, 'COLON', 'A', 23, 'I');
INSERT INTO municipio VALUES (319, 'FRANCISCO JAVIER PULGAR', 'A', 23, 'I');
INSERT INTO municipio VALUES (320, 'JESUS ENRIQUE LOZADA', 'A', 23, 'I');
INSERT INTO municipio VALUES (321, 'JESUS MARIA SEMPRUN', 'A', 23, 'I');
INSERT INTO municipio VALUES (322, 'LA CA', 'A', 1, 'I');
INSERT INTO municipio VALUES (323, 'LAGUNILLAS', 'A', 23, 'I');
INSERT INTO municipio VALUES (324, 'MACHIQUES DE PERIJA', 'A', 23, 'I');
INSERT INTO municipio VALUES (325, 'MARA', 'A', 23, 'I');
INSERT INTO municipio VALUES (326, 'MARACAIBO', 'A', 23, 'I');
INSERT INTO municipio VALUES (327, 'MIRANDA', 'A', 23, 'I');
INSERT INTO municipio VALUES (328, 'PAEZ', 'A', 23, 'I');
INSERT INTO municipio VALUES (329, 'ROSARIO DE PERIJA', 'A', 23, 'I');
INSERT INTO municipio VALUES (330, 'SAN FRANCISCO', 'A', 23, 'I');
INSERT INTO municipio VALUES (331, 'SANTA RITA', 'A', 23, 'I');
INSERT INTO municipio VALUES (332, 'SIMON BOLIVAR', 'A', 23, 'I');
INSERT INTO municipio VALUES (333, 'SUCRE', 'A', 23, 'I');
INSERT INTO municipio VALUES (334, 'VALMORE RODRIGUEZ', 'A', 23, 'I');
INSERT INTO municipio VALUES (335, 'VARGAS', 'A', 24, 'I');
INSERT INTO municipio VALUES (336, 'DEPENDENCIAS FEDERALES', 'A', 25, 'I');
INSERT INTO municipio VALUES (337, 'BARUTA', 'A', 7, 'I');
INSERT INTO municipio VALUES (338, 'CARACILO PARRA Y OLMEDO', 'A', 14, 'I');
INSERT INTO municipio VALUES (339, 'LEONARDO INFANTE', 'A', 12, 'I');
INSERT INTO municipio VALUES (400, 'HOLA', 'A', 2, 'I');
INSERT INTO municipio VALUES (2, 'AUTONOMO ALTO ORINOCO', 'A', 2, 'I');


--
-- Data for Name: objetivo; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: objetivo_codobj_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('objetivo_codobj_seq', 1, false);


--
-- Data for Name: parroquia; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO parroquia VALUES (1, 'PAEZ', 'A', 229, 'I');


--
-- Data for Name: pensum_pre; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO pensum_pre VALUES ('2', '10', '2010', '2013-01-01', 'A', 'I');
INSERT INTO pensum_pre VALUES ('3', '14', '2010', '2013-01-01', 'A', 'I');
INSERT INTO pensum_pre VALUES ('4', '19', '2010', '2013-01-01', 'A', 'I');
INSERT INTO pensum_pre VALUES ('5', '21', '2010', '2013-01-01', 'A', 'I');
INSERT INTO pensum_pre VALUES ('6', '3', '2010', '2013-01-01', 'A', 'I');


--
-- Data for Name: peraca; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO peraca VALUES ('3', '2012-II', '2012-05-06', '2012-09-12', 'I', 'I');
INSERT INTO peraca VALUES ('4', '2015-I', '2015-01-19', '2015-06-06', 'I', 'I');
INSERT INTO peraca VALUES ('2', '2012-I', '2012-01-01', '2012-05-01', 'I', 'I');
INSERT INTO peraca VALUES ('5', '2015-III', '2015-02-26', '2015-06-10', 'I', 'I');
INSERT INTO peraca VALUES ('1', '2015-II', '2015-01-19', '2015-06-06', 'A', 'I');


--
-- Data for Name: permiso; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO permiso VALUES (849, 4, 11);
INSERT INTO permiso VALUES (850, 4, 6);
INSERT INTO permiso VALUES (527, 6, 2);
INSERT INTO permiso VALUES (528, 6, 9);
INSERT INTO permiso VALUES (529, 6, 10);
INSERT INTO permiso VALUES (530, 6, 11);
INSERT INTO permiso VALUES (531, 6, 12);
INSERT INTO permiso VALUES (532, 6, 13);
INSERT INTO permiso VALUES (851, 4, 14);
INSERT INTO permiso VALUES (852, 4, 21);
INSERT INTO permiso VALUES (853, 4, 20);
INSERT INTO permiso VALUES (854, 4, 22);
INSERT INTO permiso VALUES (855, 4, 19);
INSERT INTO permiso VALUES (856, 5, 10);
INSERT INTO permiso VALUES (857, 5, 11);
INSERT INTO permiso VALUES (858, 5, 13);
INSERT INTO permiso VALUES (859, 5, 4);
INSERT INTO permiso VALUES (860, 5, 38);
INSERT INTO permiso VALUES (861, 5, 15);
INSERT INTO permiso VALUES (862, 5, 21);
INSERT INTO permiso VALUES (863, 5, 22);
INSERT INTO permiso VALUES (864, 5, 19);
INSERT INTO permiso VALUES (865, 5, 27);
INSERT INTO permiso VALUES (866, 5, 26);
INSERT INTO permiso VALUES (715, 8, 37);
INSERT INTO permiso VALUES (716, 8, 35);
INSERT INTO permiso VALUES (717, 8, 36);
INSERT INTO permiso VALUES (718, 8, 23);
INSERT INTO permiso VALUES (719, 7, 7);
INSERT INTO permiso VALUES (720, 7, 8);
INSERT INTO permiso VALUES (721, 7, 9);
INSERT INTO permiso VALUES (722, 7, 10);
INSERT INTO permiso VALUES (723, 7, 11);
INSERT INTO permiso VALUES (724, 7, 23);
INSERT INTO permiso VALUES (725, 7, 36);
INSERT INTO permiso VALUES (726, 7, 35);
INSERT INTO permiso VALUES (727, 7, 37);
INSERT INTO permiso VALUES (1942, 1, 12);
INSERT INTO permiso VALUES (1943, 1, 44);
INSERT INTO permiso VALUES (1944, 1, 18);
INSERT INTO permiso VALUES (1945, 1, 45);
INSERT INTO permiso VALUES (1946, 1, 15);
INSERT INTO permiso VALUES (1947, 1, 17);
INSERT INTO permiso VALUES (1948, 1, 51);
INSERT INTO permiso VALUES (1949, 1, 39);
INSERT INTO permiso VALUES (1841, 10, 14);
INSERT INTO permiso VALUES (1842, 10, 13);
INSERT INTO permiso VALUES (1843, 10, 51);
INSERT INTO permiso VALUES (1844, 10, 45);
INSERT INTO permiso VALUES (1845, 10, 26);
INSERT INTO permiso VALUES (1846, 10, 29);
INSERT INTO permiso VALUES (1847, 10, 28);
INSERT INTO permiso VALUES (1848, 10, 27);
INSERT INTO permiso VALUES (1849, 10, 43);
INSERT INTO permiso VALUES (1850, 10, 25);
INSERT INTO permiso VALUES (1851, 10, 47);
INSERT INTO permiso VALUES (1950, 1, 16);
INSERT INTO permiso VALUES (1951, 1, 32);
INSERT INTO permiso VALUES (1952, 1, 38);
INSERT INTO permiso VALUES (1953, 1, 40);
INSERT INTO permiso VALUES (1954, 1, 34);
INSERT INTO permiso VALUES (1852, 10, 48);
INSERT INTO permiso VALUES (1853, 10, 50);
INSERT INTO permiso VALUES (1955, 1, 33);
INSERT INTO permiso VALUES (1956, 1, 14);
INSERT INTO permiso VALUES (1627, 11, 10);
INSERT INTO permiso VALUES (1628, 11, 12);
INSERT INTO permiso VALUES (1629, 11, 3);
INSERT INTO permiso VALUES (1630, 11, 1);
INSERT INTO permiso VALUES (1631, 11, 2);
INSERT INTO permiso VALUES (1632, 11, 16);
INSERT INTO permiso VALUES (1633, 11, 17);
INSERT INTO permiso VALUES (1634, 11, 22);
INSERT INTO permiso VALUES (1896, 3, 48);
INSERT INTO permiso VALUES (1897, 3, 47);
INSERT INTO permiso VALUES (1898, 3, 13);
INSERT INTO permiso VALUES (1899, 3, 14);
INSERT INTO permiso VALUES (1900, 3, 26);
INSERT INTO permiso VALUES (1901, 3, 43);
INSERT INTO permiso VALUES (1902, 3, 28);
INSERT INTO permiso VALUES (1903, 3, 27);
INSERT INTO permiso VALUES (1904, 3, 25);
INSERT INTO permiso VALUES (1905, 3, 29);
INSERT INTO permiso VALUES (1906, 3, 50);
INSERT INTO permiso VALUES (1907, 3, 37);
INSERT INTO permiso VALUES (1908, 3, 36);
INSERT INTO permiso VALUES (1909, 3, 35);
INSERT INTO permiso VALUES (1910, 3, 23);
INSERT INTO permiso VALUES (1912, 3, 21);
INSERT INTO permiso VALUES (1913, 3, 19);
INSERT INTO permiso VALUES (1914, 3, 20);
INSERT INTO permiso VALUES (1915, 3, 22);
INSERT INTO permiso VALUES (1916, 3, 1);
INSERT INTO permiso VALUES (1917, 3, 5);
INSERT INTO permiso VALUES (1918, 3, 49);
INSERT INTO permiso VALUES (1919, 3, 8);
INSERT INTO permiso VALUES (1920, 3, 11);
INSERT INTO permiso VALUES (1921, 3, 4);
INSERT INTO permiso VALUES (1922, 3, 2);
INSERT INTO permiso VALUES (1923, 3, 3);
INSERT INTO permiso VALUES (1924, 3, 7);
INSERT INTO permiso VALUES (1925, 3, 10);
INSERT INTO permiso VALUES (1926, 3, 6);
INSERT INTO permiso VALUES (1927, 3, 9);
INSERT INTO permiso VALUES (1519, 2, 4);
INSERT INTO permiso VALUES (1520, 2, 14);
INSERT INTO permiso VALUES (1521, 2, 2);
INSERT INTO permiso VALUES (1522, 2, 10);
INSERT INTO permiso VALUES (1523, 2, 5);
INSERT INTO permiso VALUES (1524, 2, 13);
INSERT INTO permiso VALUES (1525, 2, 17);
INSERT INTO permiso VALUES (1526, 2, 16);
INSERT INTO permiso VALUES (1527, 2, 18);
INSERT INTO permiso VALUES (1528, 2, 39);
INSERT INTO permiso VALUES (1529, 2, 32);
INSERT INTO permiso VALUES (1530, 2, 38);
INSERT INTO permiso VALUES (1531, 2, 15);
INSERT INTO permiso VALUES (1532, 2, 33);
INSERT INTO permiso VALUES (1533, 2, 40);
INSERT INTO permiso VALUES (1534, 2, 34);
INSERT INTO permiso VALUES (1928, 3, 12);
INSERT INTO permiso VALUES (1929, 3, 15);
INSERT INTO permiso VALUES (1930, 3, 38);
INSERT INTO permiso VALUES (1931, 3, 33);
INSERT INTO permiso VALUES (1932, 3, 32);
INSERT INTO permiso VALUES (1933, 3, 44);
INSERT INTO permiso VALUES (1934, 3, 51);
INSERT INTO permiso VALUES (1935, 3, 17);
INSERT INTO permiso VALUES (1936, 3, 16);
INSERT INTO permiso VALUES (1937, 3, 40);
INSERT INTO permiso VALUES (1938, 3, 18);
INSERT INTO permiso VALUES (1939, 3, 34);
INSERT INTO permiso VALUES (1940, 3, 39);
INSERT INTO permiso VALUES (1941, 3, 45);


--
-- Name: permiso_per_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('permiso_per_codigo_seq', 1956, true);


--
-- Data for Name: permiso_proceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permiso_proceso VALUES (103, 10, 5);
INSERT INTO permiso_proceso VALUES (104, 10, 2);
INSERT INTO permiso_proceso VALUES (105, 10, 1);
INSERT INTO permiso_proceso VALUES (112, 3, 8);
INSERT INTO permiso_proceso VALUES (113, 3, 1);
INSERT INTO permiso_proceso VALUES (114, 3, 6);
INSERT INTO permiso_proceso VALUES (115, 3, 5);
INSERT INTO permiso_proceso VALUES (116, 3, 7);
INSERT INTO permiso_proceso VALUES (117, 3, 2);
INSERT INTO permiso_proceso VALUES (118, 3, 3);
INSERT INTO permiso_proceso VALUES (119, 1, 2);
INSERT INTO permiso_proceso VALUES (120, 1, 6);
INSERT INTO permiso_proceso VALUES (58, 2, 5);


--
-- Name: permiso_proceso_perpro_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permiso_proceso_perpro_codigo_seq', 120, true);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO persona VALUES ('V-20041540', 'YORFREN', 'JAVIER', 'SILVA', 'GARCES', NULL, NULL, 'S', NULL, NULL, NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-18892789', 'JAVIER', 'ALEXANDER', 'ARANGUREN', 'ARANGUREN', 'M', '1988-12-29', 'C', 'ACARIGUA', 'SEVANDERITO@HOTMAIL.COM', 1, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057678', 'ALEX', 'JAVIER', 'BLANCO', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057292', 'ALFONZO', 'DE', 'MORENO', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057291', 'YOFREN', 'DE', 'MORENO', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057284', 'HECTOR', 'JOSE', 'BARLETA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057277', 'ANA', 'MARIA', 'BARLETA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057261', 'JOSE', 'VICENTE', 'KOKLIN', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057260', 'VICTOR', 'ALEJANDRO', 'LEON', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945460', 'EFRAIN', '', 'MENDOZA', '', NULL, NULL, 'S', NULL, 'MENDOZA@GMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21060661', 'ELISA', 'ANDREA', 'VARGAS', 'ALVARADO', NULL, NULL, 'S', NULL, NULL, NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-4925159', 'ANA', 'YSABEL', 'PUENTES', 'HERRERA', 'M', '1959-04-23', 'C', 'BARINAS', 'ANAYSAP@GAMIL.COM', 1, '0000000000', '');
INSERT INTO persona VALUES ('V-1988857', 'RAFAELA', 'MARIA', 'HERRERA', 'PARRA', 'F', '1927-11-01', 'V', 'NUTRIAS', 'RAFAELA@TESTING-CASE.COM.VE', 1, '0000000000', 'ACARIGUA');
INSERT INTO persona VALUES ('V-15341271', 'ANA', 'GABRIELA', 'LEON', 'PUENTES', 'F', '1981-07-07', 'S', 'BARINAS', 'ANYGABY@HOTMAIL.COM', 1, '0000000000', 'AGUA CLARA');
INSERT INTO persona VALUES ('V-20847202', 'JORGE', 'ANTONIO', 'CERPA', 'PLAZA', 'M', '1991-06-07', 'S', 'MERIDA', 'JORENCERCAS@HOTMAIL.COM', 1, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057251', 'VICTOR', 'MANUEL', 'LEON', 'PUENTES', 'M', '1991-06-06', 'S', 'ACARIGUA', 'VRINOX@HOTMAIL.COM', 1, '0000000000', 'ACARIGUA');
INSERT INTO persona VALUES ('V-21057252', 'MARIA', 'DODOBUTO', 'JOSE', 'GONZALEZ', 'F', '1991-01-03', 'S', 'ACARIGUA', 'VRINOX@HOTMAIL.COM', 1, '0000000000', 'EL PILAR');
INSERT INTO persona VALUES ('V-21057253', 'MARIA', 'JOSE', 'COLMENAREZ', 'COLMENAREZ', 'F', '1991-01-01', 'S', 'ACARIGUA', 'VRINOX@HOTMAIL.COM', 1, '0000000000', 'MOLINOS');
INSERT INTO persona VALUES ('V-20041544', 'YORFREN ', 'JAVIER', 'SILVA', 'GARCES', 'M', '1991-01-01', 'S', 'ACARIGUA', 'JAVIER-AF2516@HOTMAIL.COM', 1, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21035025', 'EFRAIN', 'JOSE', 'MENDOZA', 'TOVAR', 'M', '1991-03-03', 'S', 'ACARIGUA', 'VRINOX@HOTMAIL.COM', 1, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057287', 'VICTOR', 'ALFONZO', 'PEREZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057273', 'MANUEL', '', 'PEREZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057288', 'EFRAIN', '', 'PEREZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057289', 'JAVIER', '', 'PEREZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057290', 'YORFREN', '', 'PEREZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-20025035', 'EFRAIN', 'JOSE', 'MENDOZA', 'TOVAR', 'M', '1992-03-20', 'S', 'ACARIGUA', 'EFRAINMENDOZA_557@HOTMAIL.COM', 1, '04125286636', 'DURIGUA');
INSERT INTO persona VALUES ('V-21057254', 'ANABEL', '', 'CONTRERAZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057264', 'ALI', 'CATE', 'REODRIGUEZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945451', 'LUIS', '', 'LINARES', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21058793', 'MOISES', 'ALEJADRO', 'PICHARDO', 'TORREALBA', 'M', '1992-09-01', 'S', 'ACARIGUA', 'MOISES.PICHARDO@HOTMAIL.COM', 1, '0000000000', '');
INSERT INTO persona VALUES ('V-21057255', 'ANA', '', 'LEON', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057257', 'ESTEFANIA', '', 'CONTRERAZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057258', 'JOSE', '', 'BOLIVAR', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057259', 'EFRAIN', '', 'MORENO', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057262', 'JORGE', '', 'RANGEL', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057263', 'ALAM', '', 'BRITO', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057267', 'ELVIS', '', 'TEK', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057268', 'DAENERYS', '', 'TYGERIAN', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057269', 'JHON', '', 'holae', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057270', 'JHOANA', '', 'KOKLIN', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057271', 'FRANK', '', 'HERRERA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057272', 'ALEXANDRA', '', 'KOKLIN', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057274', 'DAVID', '', 'ARANGUREN', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057275', 'JAVIER', '', 'SILVA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057276', 'PETRA', '', 'CASTRO', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057278', 'JOSEFINA', 'DE', 'CASTRO', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057279', 'SIMON', '', 'PAEZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057280', 'PEDRO', '', 'PEREZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057281', 'JUAN', '', 'PEREZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057282', 'PEDRO', '', 'RODRIGUEZ', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057283', 'CAREN', '', 'COLINA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057285', 'JOSE', '', 'MEA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057286', 'JUAN', '', 'MEA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057256', 'MARIA', '', 'LEON', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21059298', 'JORGE', '', 'MIRAS', '', NULL, NULL, 'S', NULL, NULL, NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-3593619', 'VICTOR', 'JOSE', 'RIVERO', 'LEON', NULL, NULL, 'S', NULL, NULL, NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057265', 'ZOILA', 'MARIA', 'BECERRA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-21057266', 'ZOILA', 'RAFAELA', 'ESTRELLA', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945459', 'ELISA', '', 'VARGAS', '', NULL, NULL, 'S', NULL, 'VARGAZ@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945458', 'VICTOR', '', 'VILLALBA', '', NULL, NULL, 'S', NULL, 'MARQUEZ@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945456', 'JAVIER', '', 'SILVA', '', NULL, NULL, 'S', NULL, 'SILVA@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945455', 'JAVIER', '', 'ARANGURE', '', NULL, NULL, 'S', NULL, 'ARANGUREN@GMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945453', 'CARLOS', '', 'LINARES', '', NULL, NULL, 'S', NULL, 'LINARES@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-17945452', 'LUIS', '', 'CATARI', '', NULL, NULL, 'S', NULL, 'VRINOX@HOTMAIL.COM', NULL, '0000000000', NULL);
INSERT INTO persona VALUES ('V-20657234', 'MARIA', 'EUYENNY', 'OCANTO', 'MEJIAS', NULL, NULL, 'S', NULL, 'LACHIQUITA19952@HOTMAIL.COM', NULL, NULL, NULL);
INSERT INTO persona VALUES ('V-21059374', 'VICTOR', 'ALFONSO', 'VILLALBA', 'MARQUEZ', 'M', '1992-07-10', 'S', 'ARAURE', 'VICTORVILLALBA_211@HOTMAIL.ES', 1, '', '');


--
-- Data for Name: plan_fecha_eva; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: plan_fecha_eva_codigo_pfe_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('plan_fecha_eva_codigo_pfe_seq', 1, false);


--
-- Data for Name: planificacion_evaluacion; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: planificacion_evaluacion_idplanificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('planificacion_evaluacion_idplanificacion_seq', 1, false);


--
-- Data for Name: planificacion_materias; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO planificacion_materias VALUES (1, NULL, 'CINU10', 7, 1);
INSERT INTO planificacion_materias VALUES (5, 'V-21058793', 'CYN35223', 7, 137);
INSERT INTO planificacion_materias VALUES (5, 'V-15341271', 'ADG37223', 7, 140);
INSERT INTO planificacion_materias VALUES (5, 'V-18892789', 'DIN31113', 7, 141);
INSERT INTO planificacion_materias VALUES (4, 'V-21057251', 'DIN31113', 7, 143);
INSERT INTO planificacion_materias VALUES (4, 'V-15341271', 'ECN32114', 7, 144);
INSERT INTO planificacion_materias VALUES (4, 'V-18892789', 'CYN35223', 7, 145);
INSERT INTO planificacion_materias VALUES (4, 'V-18892789', 'ECN32124', 7, 146);
INSERT INTO planificacion_materias VALUES (15, 'V-20041540', 'CYN35223', 7, 150);
INSERT INTO planificacion_materias VALUES (15, 'V-15341271', 'MAT31114', 7, 151);
INSERT INTO planificacion_materias VALUES (15, 'V-15341271', 'ECN32124', 7, 152);
INSERT INTO planificacion_materias VALUES (15, 'V-21058793', 'DIN31113', 7, 153);
INSERT INTO planificacion_materias VALUES (7, 'V-21057251', 'MAT31114', 7, 154);
INSERT INTO planificacion_materias VALUES (7, 'V-18892789', 'CYN35223', 7, 155);
INSERT INTO planificacion_materias VALUES (6, 'V-15341271', 'CYN35223', 7, 156);
INSERT INTO planificacion_materias VALUES (6, 'V-21058793', 'MAT31114', 7, 157);
INSERT INTO planificacion_materias VALUES (6, 'V-21057251', 'ADG37223', 7, 158);
INSERT INTO planificacion_materias VALUES (6, 'V-21058793', 'ECN32114', 7, 159);
INSERT INTO planificacion_materias VALUES (16, 'V-20041540', 'CYN35223', 7, 160);
INSERT INTO planificacion_materias VALUES (16, 'V-21057251', 'MAT31114', 7, 161);
INSERT INTO planificacion_materias VALUES (16, 'V-20041540', 'ECN32114', 7, 162);
INSERT INTO planificacion_materias VALUES (16, 'V-15341271', 'ADG37223', 7, 163);
INSERT INTO planificacion_materias VALUES (16, 'V-18892789', 'ECN32124', 7, 164);
INSERT INTO planificacion_materias VALUES (16, 'V-21058793', 'DIN31113', 7, 165);
INSERT INTO planificacion_materias VALUES (18, 'V-20041540', 'ECN32135', 7, 167);
INSERT INTO planificacion_materias VALUES (18, 'V-21057251', 'SOC34114', 7, 168);
INSERT INTO planificacion_materias VALUES (18, 'V-15341271', 'CYN35123', 7, 169);
INSERT INTO planificacion_materias VALUES (18, 'V-18892789', 'DIN31123', 7, 170);
INSERT INTO planificacion_materias VALUES (18, 'V-21058793', 'ECN32154', 7, 171);
INSERT INTO planificacion_materias VALUES (17, 'V-21057251', 'ECN32114', 7, 172);
INSERT INTO planificacion_materias VALUES (19, 'V-21057251', 'ECN32135', 7, 173);
INSERT INTO planificacion_materias VALUES (19, 'V-21058793', 'MAT31125', 7, 174);
INSERT INTO planificacion_materias VALUES (19, 'V-18892789', 'SOC34114', 7, 175);
INSERT INTO planificacion_materias VALUES (19, 'V-20041540', 'DIN31123', 7, 176);
INSERT INTO planificacion_materias VALUES (19, 'V-18892789', 'CYN35123', 7, 177);
INSERT INTO planificacion_materias VALUES (19, 'V-21057251', 'ECN32154', 7, 178);
INSERT INTO planificacion_materias VALUES (20, 'V-20041540', 'MAT31135', 7, 179);
INSERT INTO planificacion_materias VALUES (20, 'V-15341271', 'MAT31215', 7, 180);
INSERT INTO planificacion_materias VALUES (20, 'V-18892789', 'SOC34214', 7, 181);
INSERT INTO planificacion_materias VALUES (20, 'V-20041540', 'CJU36114', 7, 182);
INSERT INTO planificacion_materias VALUES (20, 'V-21058793', 'ECN32164', 7, 183);
INSERT INTO planificacion_materias VALUES (21, 'V-1988857', 'ECN32164', 7, 184);
INSERT INTO planificacion_materias VALUES (21, 'V-21059298', 'MAT31135', 7, 185);
INSERT INTO planificacion_materias VALUES (21, 'V-3593619', 'SOC34214', 7, 186);
INSERT INTO planificacion_materias VALUES (21, 'V-3593619', 'ECN32145', 7, 187);
INSERT INTO planificacion_materias VALUES (21, 'V-21059298', 'CJU36114', 7, 188);
INSERT INTO planificacion_materias VALUES (21, 'V-20041540', 'DIN31133', 7, 189);
INSERT INTO planificacion_materias VALUES (22, 'V-1988857', 'DIN31143', 7, 190);
INSERT INTO planificacion_materias VALUES (22, 'V-3593619', 'CJU36124', 7, 191);
INSERT INTO planificacion_materias VALUES (22, 'V-21059298', 'ECN32174', 7, 192);
INSERT INTO planificacion_materias VALUES (22, 'V-1988857', 'SYC35113', 7, 193);
INSERT INTO planificacion_materias VALUES (22, 'V-1988857', 'MAT31254', 7, 194);
INSERT INTO planificacion_materias VALUES (23, 'V-21059298', 'SYC35113', 7, 195);
INSERT INTO planificacion_materias VALUES (4, 'V-20041540', 'MAT31114', 7, 142);
INSERT INTO planificacion_materias VALUES (5, 'V-20041540', 'MAT31114', 7, 138);
INSERT INTO planificacion_materias VALUES (5, 'V-21057251', 'ECN32124', 7, 139);
INSERT INTO planificacion_materias VALUES (24, 'V-21059298', 'ECN32114', 7, 196);
INSERT INTO planificacion_materias VALUES (24, 'V-1988857', 'MAT31114', 7, 197);
INSERT INTO planificacion_materias VALUES (25, 'V-21059298', 'CYN35223', 7, 199);
INSERT INTO planificacion_materias VALUES (59, 'V-20041540', 'CYN35223', 7, 236);
INSERT INTO planificacion_materias VALUES (58, 'V-20041540', 'ECN32114', 7, 244);
INSERT INTO planificacion_materias VALUES (58, 'V-21058793', 'CYN35223', 7, 245);
INSERT INTO planificacion_materias VALUES (58, 'V-18892789', 'ADG37223', 7, 246);
INSERT INTO planificacion_materias VALUES (60, 'V-20041540', 'CYN35223', 7, 250);
INSERT INTO planificacion_materias VALUES (60, 'V-21058793', 'ECN32114', 7, 251);
INSERT INTO planificacion_materias VALUES (60, 'V-18892789', 'MAT31114', 7, 252);
INSERT INTO planificacion_materias VALUES (60, 'V-21057251', 'ADG37223', 7, 253);


--
-- Name: planificacion_materias_pm_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('planificacion_materias_pm_codigo_seq', 255, true);


--
-- Data for Name: planificacion_sec; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO planificacion_sec VALUES ('1', '10', '2', '0', '2014-03-08', '18:19:41', 1, 1);
INSERT INTO planificacion_sec VALUES ('1', '10', '1', '1', '2014-04-27', '16:35:49', 1, 4);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '1', '2014-04-27', '17:09:36', 1, 5);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '1', '2014-04-28', '14:44:59', 3, 6);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '1', '2014-04-28', '16:38:29', 4, 7);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '1', '2014-10-29', '04:59:27', 2, 15);
INSERT INTO planificacion_sec VALUES ('2', '10', '2', '1', '2014-11-12', '12:41:09', 1, 16);
INSERT INTO planificacion_sec VALUES ('3', '10', '2', '1', '2014-11-12', '13:13:52', 1, 17);
INSERT INTO planificacion_sec VALUES ('3', '10', '2', '2', '2014-11-12', '13:20:53', 1, 18);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '2', '2014-11-12', '15:26:14', 1, 19);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '3', '2014-11-12', '15:31:05', 1, 20);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '3', '2014-11-12', '15:37:24', 2, 21);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '4', '2014-11-12', '15:39:46', 1, 22);
INSERT INTO planificacion_sec VALUES ('1', '10', '2', '4', '2014-11-12', '15:40:23', 2, 23);
INSERT INTO planificacion_sec VALUES ('1', '10', '1', '1', '2015-01-23', '09:01:28', 2, 24);
INSERT INTO planificacion_sec VALUES ('1', '10', '1', '1', '2015-01-23', '09:04:20', 3, 25);
INSERT INTO planificacion_sec VALUES ('5', '10', '2', '1', '2015-04-07', '18:27:08', 2, 58);
INSERT INTO planificacion_sec VALUES ('5', '10', '2', '1', '2015-04-19', '16:03:20', 3, 59);
INSERT INTO planificacion_sec VALUES ('5', '10', '2', '1', '2015-05-02', '19:49:26', 1, 60);


--
-- Name: planificacion_sec_idplanificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('planificacion_sec_idplanificacion_seq', 61, true);


--
-- Data for Name: proceso; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO proceso VALUES (2, '2015-02-02', '2015-05-19', 'A', '4', 3);
INSERT INTO proceso VALUES (4, '2015-02-04', '2015-05-05', 'A', '4', 6);
INSERT INTO proceso VALUES (3, '2015-01-19', '2015-05-21', 'A', '4', 5);
INSERT INTO proceso VALUES (8, '2015-03-20', '2015-05-29', 'A', '5', 6);
INSERT INTO proceso VALUES (10, '2015-05-11', '2015-05-29', 'A', '5', 2);
INSERT INTO proceso VALUES (14, '2015-05-01', '2015-05-29', 'A', '5', 3);
INSERT INTO proceso VALUES (15, '2015-05-29', '2015-09-03', 'A', '1', 5);
INSERT INTO proceso VALUES (18, '2015-05-29', '2015-09-03', 'A', '1', 8);
INSERT INTO proceso VALUES (5, '2015-05-29', '2015-09-03', 'A', '1', 3);
INSERT INTO proceso VALUES (7, '2015-05-29', '2015-09-03', 'A', '1', 6);
INSERT INTO proceso VALUES (19, '2015-05-29', '2015-09-03', 'A', '1', 2);


--
-- Name: proceso_idproceso_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('proceso_idproceso_seq', 19, true);


--
-- Data for Name: regimen; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO regimen VALUES ('1', 'NOCTURNO', 'I', ' DESDE LAS 6:45 HASTA 11:45');
INSERT INTO regimen VALUES ('2', 'DIURNO', 'I', ' ABARCA MAÑANA Y TARDE');


--
-- Data for Name: retiro; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO retiro VALUES (1, 4, 'V-18892789', 1);
INSERT INTO retiro VALUES (2, 1, 'V-18892789', 0);
INSERT INTO retiro VALUES (4, 4, 'V-18892789', 1);
INSERT INTO retiro VALUES (5, 1, 'V-21057263', 0);
INSERT INTO retiro VALUES (7, 1, 'V-21057272', 0);
INSERT INTO retiro VALUES (8, 4, 'V-21057259', 2);
INSERT INTO retiro VALUES (11, 3, 'V-20025035', NULL);
INSERT INTO retiro VALUES (12, 3, 'V-20025035', NULL);
INSERT INTO retiro VALUES (13, 1, 'V-20025035', NULL);


--
-- Name: retiro_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('retiro_codigo_seq', 13, true);


--
-- Data for Name: seccion; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO seccion VALUES (1, 'A', 'I', 'A');
INSERT INTO seccion VALUES (2, 'A', 'I', 'B');
INSERT INTO seccion VALUES (3, 'A', 'I', 'C');
INSERT INTO seccion VALUES (4, 'A', 'I', 'D');
INSERT INTO seccion VALUES (5, 'A', 'I', 'E');


--
-- Name: seccion_idseccion_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('seccion_idseccion_seq', 1, false);


--
-- Data for Name: semestre; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO semestre VALUES ('0', 'CINU', 'I');
INSERT INTO semestre VALUES ('1', 'I', 'I');
INSERT INTO semestre VALUES ('2', 'II', 'I');
INSERT INTO semestre VALUES ('3', 'III', 'I');
INSERT INTO semestre VALUES ('4', 'IV', 'I');
INSERT INTO semestre VALUES ('5', 'V', 'I');
INSERT INTO semestre VALUES ('6', 'VI', 'I');
INSERT INTO semestre VALUES ('7', 'VII', 'I');
INSERT INTO semestre VALUES ('8', 'VIII', 'I');
INSERT INTO semestre VALUES ('9', 'IX', 'I');


--
-- Data for Name: servidor; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO servidor VALUES (1, 3, 400, 30, 3, 2, 4, false);


--
-- Name: servidor_idconfiguracion_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('servidor_idconfiguracion_seq', 1, true);


--
-- Data for Name: solicitud; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO solicitud VALUES (62, 'V-20025035', 1, 'P', '', 'hola', '1', '19', '2015-05-03');
INSERT INTO solicitud VALUES (61, 'V-20025035', 5, 'A', '', 'losi', NULL, NULL, '2015-05-03');
INSERT INTO solicitud VALUES (59, 'V-20025035', 6, 'R', '', 'no me', NULL, NULL, '2015-05-03');
INSERT INTO solicitud VALUES (63, 'V-20025035', 1, 'P', '', 'por motivo de salud', NULL, NULL, '2015-05-29');
INSERT INTO solicitud VALUES (57, 'V-20025035', 1, 'P', '', 'Salud', NULL, '14', '2015-04-06');
INSERT INTO solicitud VALUES (58, 'V-20025035', 3, 'P', '', 'no me gusta la carrera', NULL, '14', '2015-05-03');
INSERT INTO solicitud VALUES (60, 'V-20025035', 7, 'P', '', 'ha', NULL, NULL, '2015-05-03');


--
-- Name: solicitud_idsoli_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('solicitud_idsoli_seq', 63, true);


--
-- Data for Name: submodulo; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO submodulo VALUES (1, 'ESTADO', 1, 'A', 1, 'vis_Estado.php');
INSERT INTO submodulo VALUES (2, 'MUNICIPIO', 1, 'A', 1, 'vis_Municipio.php');
INSERT INTO submodulo VALUES (3, 'PARROQUIA', 1, 'A', 1, 'vis_Parroquia.php');
INSERT INTO submodulo VALUES (4, 'CIUDAD', 1, 'A', 1, 'vis_Ciudad.php');
INSERT INTO submodulo VALUES (6, 'DOCENTE', 1, 'A', 1, 'vis_Docente.php');
INSERT INTO submodulo VALUES (7, 'CARRERA', 1, 'A', 1, 'vis_Carrera.php');
INSERT INTO submodulo VALUES (8, 'PENSUM', 1, 'A', 1, 'vis_Pensum.php');
INSERT INTO submodulo VALUES (25, 'SUBMODULO', 4, 'A', 1, 'vis_Submodulo.php');
INSERT INTO submodulo VALUES (9, 'SEMESTRE', 1, 'A', 1, 'vis_Semestre.php');
INSERT INTO submodulo VALUES (10, 'ASIGNATURA', 1, 'A', 1, 'vis_Materia.php');
INSERT INTO submodulo VALUES (11, 'SECCION', 1, 'A', 1, 'vis_Seccion.php');
INSERT INTO submodulo VALUES (12, 'PERIODO ACADEMICO', 1, 'A', 1, 'vis_Peraca.php');
INSERT INTO submodulo VALUES (15, 'REGIMEN', 2, 'A', 1, 'vis_Regimen.php');
INSERT INTO submodulo VALUES (16, 'TIPO DE RETIRO', 2, 'A', 1, 'vis_Tipo_retiro.php');
INSERT INTO submodulo VALUES (17, 'CONDICION', 2, 'A', 1, 'vis_Condicion.php');
INSERT INTO submodulo VALUES (18, 'ESTUDIANTE', 2, 'A', 1, 'vis_Estudiante.php');
INSERT INTO submodulo VALUES (20, 'TIPO EVALUATIVO', 3, 'A', 1, 'vis_Tipoeva.php');
INSERT INTO submodulo VALUES (21, 'ASPECTOS EVALUATIVOS', 3, 'A', 1, 'vis_Aspectos.php');
INSERT INTO submodulo VALUES (22, 'VALORACION', 3, 'A', 1, 'vis_Valoracion.php');
INSERT INTO submodulo VALUES (26, 'MODULO', 4, 'A', 1, 'vis_Modulo.php');
INSERT INTO submodulo VALUES (27, 'DEPARTAMENTO', 4, 'A', 1, 'vis_Departamento.php');
INSERT INTO submodulo VALUES (28, 'CARGO', 4, 'A', 2, 'vis_Cargo.php');
INSERT INTO submodulo VALUES (29, 'ASIGNAR CARGO', 4, 'A', 2, 'vis_Asigcargo.php');
INSERT INTO submodulo VALUES (19, 'SELECCION DE REPRESENTANTES', 3, 'A', 2, 'visTransAcomp.php?lsnombreva=Acompanamiento');
INSERT INTO submodulo VALUES (32, 'IMPORTACION CINU', 2, 'A', 2, 'vis_Importar.php');
INSERT INTO submodulo VALUES (33, 'CANCELACION DE MATRICULA', 2, 'A', 2, 'vis_Retiros.php');
INSERT INTO submodulo VALUES (34, 'CONFIRMACION CINU', 2, 'A', 2, 'vis_Confirmar_CINU.php');
INSERT INTO submodulo VALUES (35, 'BLOQUE DE HORAS', 5, 'A', 1, 'vis_Bloque.php');
INSERT INTO submodulo VALUES (36, 'AMBIENTE', 5, 'A', 1, 'vis_Ambiente.php');
INSERT INTO submodulo VALUES (40, 'CONSTANCIAS DE ESTUDIO', 2, 'A', 3, 'vis_Buscar_ConstanciadeEst.php');
INSERT INTO submodulo VALUES (30, 'SEMANAS ACADEMICAS', 3, 'I', 3, 'vis_Semaca.php');
INSERT INTO submodulo VALUES (23, 'PROYECCION DE SECCIONES', 5, 'A', 2, 'vis_ProyeccionSec.php');
INSERT INTO submodulo VALUES (39, 'LISTADO DE ESTUDIANTES POR CARRERAS', 2, 'A', 3, 'vis_Listado_Carrera.php');
INSERT INTO submodulo VALUES (38, 'LISTADO DE ESTUDIANTES POR SEXO', 2, 'A', 3, 'vis_Listado_Sexo.php');
INSERT INTO submodulo VALUES (45, 'BANDEJA DE SOLICITUDES', 2, 'A', 2, 'vis_Bandeja.php');
INSERT INTO submodulo VALUES (44, 'ESTUDIANTE INSCRITOS', 2, 'A', 3, 'vis_Rep_Listado_Inc_Car_Sem.php');
INSERT INTO submodulo VALUES (47, 'REPORTE BITACORA', 4, 'A', 3, 'vis_Rep_Bitacora.php');
INSERT INTO submodulo VALUES (48, 'REPORTE BITACORA ACCESO', 4, 'A', 3, 'vis_Rep_Bit_Acceso.php');
INSERT INTO submodulo VALUES (49, 'DEDICACION', 1, 'A', 1, 'vis_Dedicacion.php');
INSERT INTO submodulo VALUES (50, 'REPORTE HORARIO', 5, 'A', 3, 'vis_Rep_Horario.php');
INSERT INTO submodulo VALUES (37, 'TIPO DE AMBIENTE', 5, 'A', 1, 'vis_Tipo_Ambiente.php');
INSERT INTO submodulo VALUES (51, 'RESULTADO INSCRIPCION', 2, 'A', 3, 'vis_Rep_Inscritos.php');
INSERT INTO submodulo VALUES (14, 'PROCESO', 4, 'A', 1, 'vis_Proceso.php');
INSERT INTO submodulo VALUES (13, 'TIPO DE PROCESO', 4, 'A', 1, 'vis_TipoPro.php');
INSERT INTO submodulo VALUES (5, 'ADMINISTRATIVO', 1, 'A', 1, 'vis_Administrativo.php');
INSERT INTO submodulo VALUES (43, 'CONFIGURACION', 4, 'A', 2, 'vis_ServConf.php');


--
-- Name: submodulo_sub_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('submodulo_sub_codigo_seq', 111, true);


--
-- Data for Name: tecnica; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: tecnica_codtec_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('tecnica_codtec_seq', 1, false);


--
-- Data for Name: tipo_ambiente; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO tipo_ambiente VALUES ('LABORATORIO', '', 'A', 1);
INSERT INTO tipo_ambiente VALUES ('AULAS DE CLASE', '', 'A', 2);
INSERT INTO tipo_ambiente VALUES ('CANCHAS', '', 'A', 3);
INSERT INTO tipo_ambiente VALUES ('HOSPITALES', '', 'A', 4);
INSERT INTO tipo_ambiente VALUES ('CAMPOS', '', 'A', 5);
INSERT INTO tipo_ambiente VALUES ('SIN ASIGNAR', 'PARA TODOS LOS AMBIENTES QUE NO ENTRAN EN LAS DEMAS CLASIFICACIONES', 'A', 6);


--
-- Name: tipo_ambiente_tip_cod_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('tipo_ambiente_tip_cod_seq', 1, false);


--
-- Data for Name: tipo_proceso; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO tipo_proceso VALUES (5, 'INSCRIPCION ', 'A', 'I', 3, 2, 0);
INSERT INTO tipo_proceso VALUES (7, 'ADICION Y RETIRO DE MATERIAS ', 'A', 'I', 5, 2, 0);
INSERT INTO tipo_proceso VALUES (6, 'IMPORTACION CINU', 'A', 'I', NULL, 2, 0);
INSERT INTO tipo_proceso VALUES (8, 'CARGA DE NOTAS', 'A', 'I', 5, 5, 0);
INSERT INTO tipo_proceso VALUES (3, 'PROYECCION ', 'A', 'I', NULL, 5, 7);
INSERT INTO tipo_proceso VALUES (2, 'CONFIRMACION CINU ', 'A', 'I', 6, 2, 0);
INSERT INTO tipo_proceso VALUES (1, 'AUTOEVALUACION ', 'A', 'I', NULL, 3, 0);


--
-- Name: tipo_proceso_idtipo_pro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_proceso_idtipo_pro_seq', 1, false);


--
-- Name: tipo_proceso_idtipo_pro_seq1; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('tipo_proceso_idtipo_pro_seq1', 1, false);


--
-- Data for Name: tipo_retiro; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO tipo_retiro VALUES (4, 'RETIRO POR DISCIPLINA', 'I', 'A', NULL);
INSERT INTO tipo_retiro VALUES (3, 'RETIRO POR SALUD', 'I', 'A', 'RPS');
INSERT INTO tipo_retiro VALUES (2, 'RETIRO POR SERVICIO', 'I', 'A', 'RMS');
INSERT INTO tipo_retiro VALUES (1, 'RETIRO POR VOLUNTAD PROPIA', 'I', 'A', 'RPV');


--
-- Name: tipo_retiro_idtipo_ret_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('tipo_retiro_idtipo_ret_seq', 1, false);


--
-- Data for Name: tipo_solicitud; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO tipo_solicitud VALUES (1, 'REINGRESO', 'A');
INSERT INTO tipo_solicitud VALUES (2, 'TRASLADO', 'A');
INSERT INTO tipo_solicitud VALUES (4, 'EQUIVALENCIA', 'A');
INSERT INTO tipo_solicitud VALUES (6, 'RPS', 'A');
INSERT INTO tipo_solicitud VALUES (7, 'RMS', 'A');
INSERT INTO tipo_solicitud VALUES (5, 'RPV', 'A');
INSERT INTO tipo_solicitud VALUES (3, 'CAMBIO', 'A');


--
-- Name: tipo_solicitud_idtipo_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('tipo_solicitud_idtipo_seq', 1, true);


--
-- Data for Name: tipoevaluativo; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO tipoevaluativo VALUES (2, 'EVALUACION POR ESTUDIANTES', ' ', 'I');
INSERT INTO tipoevaluativo VALUES (3, 'EVALUACION COORDINADORES', ' ', 'I');
INSERT INTO tipoevaluativo VALUES (4, 'ACOMPAÑAMIENTO DOCENTE', ' ', 'I');
INSERT INTO tipoevaluativo VALUES (1, 'AUTOEVALUACION', ' LOS DOCENTES SE AUTOEVALUAN', 'I');


--
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: unidad_coduni_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('unidad_coduni_seq', 1, false);


--
-- Data for Name: unidad_pla; Type: TABLE DATA; Schema: public; Owner: uptp
--



--
-- Name: unidad_pla_codigo_up_seq; Type: SEQUENCE SET; Schema: public; Owner: uptp
--

SELECT pg_catalog.setval('unidad_pla_codigo_up_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO usuario VALUES ('E17945451', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945451', '0', 0, 'P');
INSERT INTO usuario VALUES ('D20041540', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2', 'V-20041540', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057255', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057255', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057254', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057254', '0', 0, 'A');
INSERT INTO usuario VALUES ('E17945460', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945460', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057678', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057678', '0', 1, 'P');
INSERT INTO usuario VALUES ('E17945459', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945459', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057265', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057265', '0', 0, 'A');
INSERT INTO usuario VALUES ('E17945456', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945456', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057292', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057292', '0', 0, 'P');
INSERT INTO usuario VALUES ('D18892789', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2', 'V-18892789', '0', 0, 'P');
INSERT INTO usuario VALUES ('E21057252', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057252', '0', 0, 'P');
INSERT INTO usuario VALUES ('D21059298', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2', 'V-21059298', '0', 0, 'P');
INSERT INTO usuario VALUES ('E17945455', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945455', '0', 0, 'A');
INSERT INTO usuario VALUES ('A21059374', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '1', 'V-21059374', '0', 0, 'A');
INSERT INTO usuario VALUES ('A21060661', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '1', 'V-21060661', '0', 0, 'P');
INSERT INTO usuario VALUES ('E20041544', '8c9ec9f0ac6ad6fea526dad1171e7507262d0ea9541a2e6ddcc5767a239d1da9edea948dbde5494bb7fb27df24d6ac5dfc3ad47cc52af76a7e9146c5125c6cf5', '3', 'V-20041544', '0', 0, 'P');
INSERT INTO usuario VALUES ('E17945453', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945453', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057284', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057284', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057283', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057283', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057282', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057282', '0', 0, 'A');
INSERT INTO usuario VALUES ('E17945458', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945458', '0', 0, 'A');
INSERT INTO usuario VALUES ('E20025035', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-20025035', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057285', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057285', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057275', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057275', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057274', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057274', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057273', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057273', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057272', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057272', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057271', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057271', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057270', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057270', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057269', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057269', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057268', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057268', '0', 0, 'A');
INSERT INTO usuario VALUES ('D20657234', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2', 'V-20657234', '0', 0, 'P');
INSERT INTO usuario VALUES ('E21057264', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057264', '0', 0, 'P');
INSERT INTO usuario VALUES ('E21057276', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057276', '0', 0, 'A');
INSERT INTO usuario VALUES ('D3593619', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2', 'V-3593619', '0', 0, 'P');
INSERT INTO usuario VALUES ('A4925159', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '1', 'V-4925159', '0', 1, 'A');
INSERT INTO usuario VALUES ('D15341271', 'fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2', '2', 'V-15341271', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057263', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057263', '0', 0, 'P');
INSERT INTO usuario VALUES ('E21057262', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057262', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057253', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057253', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057281', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057281', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057280', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057280', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057279', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057279', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057278', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057278', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057277', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057277', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057291', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057291', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057290', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057290', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057289', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057289', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057288', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057288', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057287', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057287', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057261', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057261', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057260', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057260', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057286', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057286', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057259', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057259', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057258', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057258', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057257', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057257', '0', 0, 'A');
INSERT INTO usuario VALUES ('E21057256', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057256', '0', 0, 'A');
INSERT INTO usuario VALUES ('D1988857', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '2', 'V-1988857', '0', 0, 'A');
INSERT INTO usuario VALUES ('E17945452', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-17945452', '0', 0, 'A');
INSERT INTO usuario VALUES ('D20847202', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-20847202', '0', 0, 'P');
INSERT INTO usuario VALUES ('E21057267', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057267', '0', 0, 'P');
INSERT INTO usuario VALUES ('E21057266', '2f9959b230a44678dd2dc29f037ba1159f233aa9ab183ce3a0678eaae002e5aa6f27f47144a1a4365116d3db1b58ec47896623b92d85cb2f191705daf11858b8', '3', 'V-21057266', '0', 0, 'P');
INSERT INTO usuario VALUES ('D21058793', 'cce08bba3f2e3c029cd257104b06d4b075772d5f514cf1b7789506f9a69d53c51464881d2c18445ab290553b302f67a24b1c69e3e737a46215deaf43517e4960', '2', 'V-21058793', '0', 0, 'A');
INSERT INTO usuario VALUES ('D21057251', '939b3c5d9e2aeb037cad38b300be67830861186da01a24b7e446a6a7378341e3d5fe0bb983f75d20f84a180fca25958650325126a042cdbc1343f56a81edc176', '2', 'V-21057251', '0', 0, 'A');


--
-- Data for Name: usuario_pregunta; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO usuario_pregunta VALUES ('D1988857', '', '');
INSERT INTO usuario_pregunta VALUES ('D1988857', '¿NOMBRE DE TU MASCOTA?', 'MURRUNGO');
INSERT INTO usuario_pregunta VALUES ('D15341271', '¿NOMBRE DE MI HIJA?', 'VERONICA');
INSERT INTO usuario_pregunta VALUES ('D15341271', '¿SEGUNDO NOMBRE DE MI HIJA?', 'ANDREYNA');
INSERT INTO usuario_pregunta VALUES ('E20025035', '¿NOMBRE DE MI PERRO?', 'MIA');
INSERT INTO usuario_pregunta VALUES ('E20025035', '¿NOMBRE DE MADRE?', 'ESTANISLAA');
INSERT INTO usuario_pregunta VALUES ('A4925159', '¿NOMBRE COMPLETO?', 'ANA YSABEL');
INSERT INTO usuario_pregunta VALUES ('A4925159', '¿NOMBRE IMCOMPLETO?', 'YSA');
INSERT INTO usuario_pregunta VALUES ('D21057251', '¿NOMBRE DE TU MADRE?', 'ANA YSABEL');
INSERT INTO usuario_pregunta VALUES ('D21057251', '¿NOMBRE DE TU PERRO?', 'HUNTER');
INSERT INTO usuario_pregunta VALUES ('E21057252', 'YO NOSE ¿TU SABES?', 'NO');
INSERT INTO usuario_pregunta VALUES ('E21057252', 'PUES NI IDEA ¿Y TU?', 'IGUAL');
INSERT INTO usuario_pregunta VALUES ('E21057253', '¿NOMBRE DE TU PRIMO?', 'JHON');
INSERT INTO usuario_pregunta VALUES ('E21057253', '¿NOMBRE DE TU TIA?', 'ALBA');
INSERT INTO usuario_pregunta VALUES ('E21057253', '¿TU PRIMER NOMBRE?', 'EFRAIN');
INSERT INTO usuario_pregunta VALUES ('A21059374', '¿NOMBRE DE MASCOTA?', 'LUCY');
INSERT INTO usuario_pregunta VALUES ('A21059374', '¿PRIMER NOMBRE?', 'VICTOR');
INSERT INTO usuario_pregunta VALUES ('A21059374', '¿SEGUNDO APELLIDO?', 'MARQUEZ');
INSERT INTO usuario_pregunta VALUES ('D21058793', '¿NOMBRE DE MASCOTA?', 'LOGAN');
INSERT INTO usuario_pregunta VALUES ('D21058793', '¿PRIMER NOMBRE?', 'MOISES');
INSERT INTO usuario_pregunta VALUES ('D21058793', '¿SEGUNDO APELLIDO?', 'TORREALBA');


--
-- Data for Name: valoracion; Type: TABLE DATA; Schema: public; Owner: uptp
--

INSERT INTO valoracion VALUES (1, 'Siempre', 5, 1, 'I');
INSERT INTO valoracion VALUES (2, 'Casi Siempre', 4, 1, 'I');
INSERT INTO valoracion VALUES (3, 'Algunas veces', 3, 1, 'I');
INSERT INTO valoracion VALUES (4, 'Casi Nunca', 2, 1, 'I');
INSERT INTO valoracion VALUES (5, 'Nunca', 1, 1, 'I');
INSERT INTO valoracion VALUES (6, 'Siempre', 10, 3, 'I');
INSERT INTO valoracion VALUES (7, 'Casi Siempre', 8, 3, 'I');
INSERT INTO valoracion VALUES (8, 'Pocas Veces', 4, 3, 'I');
INSERT INTO valoracion VALUES (9, 'Nunca', 0, 3, 'I');
INSERT INTO valoracion VALUES (10, 'Siempre', 5, 2, 'I');
INSERT INTO valoracion VALUES (11, 'Casi Siempre', 4, 2, 'I');
INSERT INTO valoracion VALUES (12, 'Algunas Veces ', 3, 2, 'I');
INSERT INTO valoracion VALUES (13, 'Pocas Veces', 2, 2, 'I');
INSERT INTO valoracion VALUES (14, 'Nunca', 1, 2, 'I');
INSERT INTO valoracion VALUES (42, 'Si', 5, 4, 'I');
INSERT INTO valoracion VALUES (43, 'No', 0, 4, 'I');
INSERT INTO valoracion VALUES (44, 'no se observa', 0, 4, 'I');
INSERT INTO valoracion VALUES (45, 'Regular', 2, 4, 'I');


--
-- Name: FK_regimen; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY regimen
    ADD CONSTRAINT "FK_regimen" PRIMARY KEY (idregimen);


--
-- Name: PK_administrativo; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY administrativo
    ADD CONSTRAINT "PK_administrativo" PRIMARY KEY (cedula_admin);


--
-- Name: PK_alumno; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT "PK_alumno" PRIMARY KEY (cedula_est_pre);


--
-- Name: PK_aspecto; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY aspectosevaluativos
    ADD CONSTRAINT "PK_aspecto" PRIMARY KEY (idaspectos);


--
-- Name: PK_bitacora; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT "PK_bitacora" PRIMARY KEY (idcambio);


--
-- Name: PK_carrera; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT "PK_carrera" PRIMARY KEY (codesp);


--
-- Name: PK_ciudad; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT "PK_ciudad" PRIMARY KEY (idciudad);


--
-- Name: PK_condicion; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY condicion
    ADD CONSTRAINT "PK_condicion" PRIMARY KEY (idcondicion);


--
-- Name: PK_detalle_cargo_usuario; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY detalle_cargo_usuario
    ADD CONSTRAINT "PK_detalle_cargo_usuario" PRIMARY KEY (det_codigo);


--
-- Name: PK_docente; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT "PK_docente" PRIMARY KEY (cedula_doc);


--
-- Name: PK_estado; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT "PK_estado" PRIMARY KEY (idestado);


--
-- Name: PK_materia; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT "PK_materia" PRIMARY KEY (codmat);


--
-- Name: PK_municipio; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT "PK_municipio" PRIMARY KEY (idmunicipio);


--
-- Name: PK_parroquia; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY parroquia
    ADD CONSTRAINT "PK_parroquia" PRIMARY KEY (idparroquia);


--
-- Name: PK_pensum; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY pensum_pre
    ADD CONSTRAINT "PK_pensum" PRIMARY KEY (idpensum);


--
-- Name: PK_peraca; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY peraca
    ADD CONSTRAINT "PK_peraca" PRIMARY KEY (peraca);


--
-- Name: PK_permiso; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT "PK_permiso" PRIMARY KEY (per_codigo);


--
-- Name: PK_persona; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT "PK_persona" PRIMARY KEY (cedula);


--
-- Name: PK_proceso; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY proceso
    ADD CONSTRAINT "PK_proceso" PRIMARY KEY (idproceso);


--
-- Name: PK_seccion; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY seccion
    ADD CONSTRAINT "PK_seccion" PRIMARY KEY (idseccion);


--
-- Name: PK_semestre; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY semestre
    ADD CONSTRAINT "PK_semestre" PRIMARY KEY (idsemestre);


--
-- Name: PK_tipo_eva; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY tipoevaluativo
    ADD CONSTRAINT "PK_tipo_eva" PRIMARY KEY (idtipo);


--
-- Name: PK_tipo_ret; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY tipo_retiro
    ADD CONSTRAINT "PK_tipo_ret" PRIMARY KEY (idtipo_ret);


--
-- Name: PK_usuario; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT "PK_usuario" PRIMARY KEY (nombre);


--
-- Name: PK_valoracion; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY valoracion
    ADD CONSTRAINT "PK_valoracion" PRIMARY KEY (idvaloracion);


--
-- Name: codcon_contenido; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY contenido
    ADD CONSTRAINT codcon_contenido PRIMARY KEY (codcon);


--
-- Name: coduni; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY unidad
    ADD CONSTRAINT coduni PRIMARY KEY (coduni);


--
-- Name: idacceso; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY bitacora_acceso
    ADD CONSTRAINT idacceso PRIMARY KEY (idacceso);


--
-- Name: pk; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY ambiente
    ADD CONSTRAINT pk PRIMARY KEY (codigo);


--
-- Name: pk_Cargo; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT "pk_Cargo" PRIMARY KEY (car_codigo);


--
-- Name: pk_Dedicacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dedicacion
    ADD CONSTRAINT "pk_Dedicacion" PRIMARY KEY (codigo);


--
-- Name: pk_Modulo; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT "pk_Modulo" PRIMARY KEY (mod_codigo);


--
-- Name: pk_Submodulo; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY submodulo
    ADD CONSTRAINT "pk_Submodulo" PRIMARY KEY (sub_codigo);


--
-- Name: pk_bloque; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY bloque
    ADD CONSTRAINT pk_bloque PRIMARY KEY (blo_codigo);


--
-- Name: pk_cinu; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY "CINU"
    ADD CONSTRAINT pk_cinu PRIMARY KEY (cedula);


--
-- Name: pk_departamento; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT pk_departamento PRIMARY KEY (dep_codigo);


--
-- Name: pk_evaluacion; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY evaluacion
    ADD CONSTRAINT pk_evaluacion PRIMARY KEY (numero);


--
-- Name: pk_evaluadores; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY evaluadores
    ADD CONSTRAINT pk_evaluadores PRIMARY KEY (idevaluadores);


--
-- Name: pk_inscripcion; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY inscripcion_pre
    ADD CONSTRAINT pk_inscripcion PRIMARY KEY (num_inscripcion);


--
-- Name: pk_perpro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permiso_proceso
    ADD CONSTRAINT pk_perpro PRIMARY KEY (perpro_codigo);


--
-- Name: pk_plani; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY planificacion_sec
    ADD CONSTRAINT pk_plani PRIMARY KEY (idplanificacion);


--
-- Name: pk_planificacion_materias; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY planificacion_materias
    ADD CONSTRAINT pk_planificacion_materias PRIMARY KEY (pm_codigo);


--
-- Name: pk_retiro; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY retiro
    ADD CONSTRAINT pk_retiro PRIMARY KEY (codigo);


--
-- Name: pk_servidor; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY servidor
    ADD CONSTRAINT pk_servidor PRIMARY KEY (idconfiguracion);


--
-- Name: pk_tipo_ambientes; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY tipo_ambiente
    ADD CONSTRAINT pk_tipo_ambientes PRIMARY KEY (tip_cod);


--
-- Name: pk_tipo_proceso; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY tipo_proceso
    ADD CONSTRAINT pk_tipo_proceso PRIMARY KEY (idtipo_pro);


--
-- Name: pk_tipo_solicitud; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY tipo_solicitud
    ADD CONSTRAINT pk_tipo_solicitud PRIMARY KEY (idtipo);


--
-- Name: primary_estrategia; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY estrategia
    ADD CONSTRAINT primary_estrategia PRIMARY KEY (codest);


--
-- Name: primary_evaluacion_pla; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY evaluacion_pla
    ADD CONSTRAINT primary_evaluacion_pla PRIMARY KEY (codigo_ep);


--
-- Name: primary_objetivo; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY objetivo
    ADD CONSTRAINT primary_objetivo PRIMARY KEY (codobj);


--
-- Name: primary_pfe; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY plan_fecha_eva
    ADD CONSTRAINT primary_pfe PRIMARY KEY (codigo_pfe);


--
-- Name: primary_plaeva; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY planificacion_evaluacion
    ADD CONSTRAINT primary_plaeva PRIMARY KEY (idplanificacion);


--
-- Name: primary_solicitud; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT primary_solicitud PRIMARY KEY (idsoli);


--
-- Name: primary_tecnica; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY tecnica
    ADD CONSTRAINT primary_tecnica PRIMARY KEY (codtec);


--
-- Name: primary_unidad_pla; Type: CONSTRAINT; Schema: public; Owner: uptp; Tablespace: 
--

ALTER TABLE ONLY unidad_pla
    ADD CONSTRAINT primary_unidad_pla PRIMARY KEY (codigo_up);


--
-- Name: FKI_asptipo_eva; Type: INDEX; Schema: public; Owner: uptp; Tablespace: 
--

CREATE INDEX "FKI_asptipo_eva" ON aspectosevaluativos USING btree (idtipo);


--
-- Name: FKI_matprela1; Type: INDEX; Schema: public; Owner: uptp; Tablespace: 
--

CREATE INDEX "FKI_matprela1" ON materia USING btree (prela1);


--
-- Name: FKI_matprela2; Type: INDEX; Schema: public; Owner: uptp; Tablespace: 
--

CREATE INDEX "FKI_matprela2" ON materia USING btree (prela2);


--
-- Name: FKI_matprela3; Type: INDEX; Schema: public; Owner: uptp; Tablespace: 
--

CREATE INDEX "FKI_matprela3" ON materia USING btree (prela3);


--
-- Name: FK_admper; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY administrativo
    ADD CONSTRAINT "FK_admper" FOREIGN KEY (cedula_admin) REFERENCES persona(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_asptipo_eva; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY aspectosevaluativos
    ADD CONSTRAINT "FK_asptipo_eva" FOREIGN KEY (idtipo) REFERENCES tipoevaluativo(idtipo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_caralu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT "FK_caralu" FOREIGN KEY (codesp) REFERENCES carrera(codesp) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_ciupar; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT "FK_ciupar" FOREIGN KEY (idparroquia) REFERENCES parroquia(idparroquia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_conalu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT "FK_conalu" FOREIGN KEY (condicion) REFERENCES condicion(idcondicion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_decper; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT "FK_decper" FOREIGN KEY (cedula_doc) REFERENCES persona(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_matpen; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT "FK_matpen" FOREIGN KEY (idpensum) REFERENCES pensum_pre(idpensum) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_matsem; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT "FK_matsem" FOREIGN KEY (semestre) REFERENCES semestre(idsemestre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_parmun; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY parroquia
    ADD CONSTRAINT "FK_parmun" FOREIGN KEY (idmunicipio) REFERENCES municipio(idmunicipio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_penalu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT "FK_penalu" FOREIGN KEY (idpensum) REFERENCES pensum_pre(idpensum) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_pencar; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY pensum_pre
    ADD CONSTRAINT "FK_pencar" FOREIGN KEY (codesp) REFERENCES carrera(codesp) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_peralu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT "FK_peralu" FOREIGN KEY (cedula_est_pre) REFERENCES persona(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_perapro; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY proceso
    ADD CONSTRAINT "FK_perapro" FOREIGN KEY (peraca) REFERENCES peraca(peraca) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_perciu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT "FK_perciu" FOREIGN KEY (idciudad) REFERENCES ciudad(idciudad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_semalu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT "FK_semalu" FOREIGN KEY (semestre) REFERENCES semestre(idsemestre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_tipalu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT "FK_tipalu" FOREIGN KEY (tipo_retiro) REFERENCES tipo_retiro(idtipo_ret) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_usuper; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT "FK_usuper" FOREIGN KEY (cedula) REFERENCES persona(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_valtipo_eva; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY valoracion
    ADD CONSTRAINT "FK_valtipo_eva" FOREIGN KEY (idtipo_eva) REFERENCES tipoevaluativo(idtipo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contenido_unidad; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_unidad
    ADD CONSTRAINT contenido_unidad FOREIGN KEY (codcon) REFERENCES contenido(codcon) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: docente_que_coordina; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_evaluacion
    ADD CONSTRAINT docente_que_coordina FOREIGN KEY (docente_c) REFERENCES docente(cedula_doc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: estrategia_planificada; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_est_unipla
    ADD CONSTRAINT estrategia_planificada FOREIGN KEY (codest) REFERENCES estrategia(codest) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_acesso_usuario; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY bitacora_acceso
    ADD CONSTRAINT fk_acesso_usuario FOREIGN KEY (usuario) REFERENCES usuario(nombre);


--
-- Name: fk_ambiente_pm; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_pm
    ADD CONSTRAINT fk_ambiente_pm FOREIGN KEY (amb_codigo) REFERENCES ambiente(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_bloque_Regimen; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY bloque
    ADD CONSTRAINT "fk_bloque_Regimen" FOREIGN KEY (idregimen) REFERENCES regimen(idregimen) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_bloque_pm; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_pm
    ADD CONSTRAINT fk_bloque_pm FOREIGN KEY (blo_codigo) REFERENCES bloque(blo_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_car_dep; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT fk_car_dep FOREIGN KEY (fk_dep_codigo) REFERENCES departamento(dep_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_carrera_eva; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion
    ADD CONSTRAINT fk_carrera_eva FOREIGN KEY (carrera) REFERENCES carrera(codesp) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_corequisito; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT fk_corequisito FOREIGN KEY (corequisito) REFERENCES materia(codmat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_eva_asp; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalleevaluacion
    ADD CONSTRAINT fk_det_eva_asp FOREIGN KEY (idaspecto) REFERENCES aspectosevaluativos(idaspectos) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_eva_persona; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalleevaluacion
    ADD CONSTRAINT fk_det_eva_persona FOREIGN KEY (cedula) REFERENCES persona(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_eva_val; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalleevaluacion
    ADD CONSTRAINT fk_det_eva_val FOREIGN KEY (idvaloracion) REFERENCES valoracion(idvaloracion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_evaluadores_car; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_evaluadores
    ADD CONSTRAINT fk_det_evaluadores_car FOREIGN KEY (codesp) REFERENCES carrera(codesp) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_evaluadores_docente; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_evaluadores
    ADD CONSTRAINT fk_det_evaluadores_docente FOREIGN KEY (cedula) REFERENCES docente(cedula_doc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_evaluadores_seccion; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_evaluadores
    ADD CONSTRAINT fk_det_evaluadores_seccion FOREIGN KEY (seccion) REFERENCES seccion(idseccion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_evaluadores_semestre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_evaluadores
    ADD CONSTRAINT fk_det_evaluadores_semestre FOREIGN KEY (semestre) REFERENCES semestre(idsemestre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_nota_per; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_nota
    ADD CONSTRAINT fk_det_nota_per FOREIGN KEY (cedula) REFERENCES docente(cedula_doc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_plani_docente; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_materias
    ADD CONSTRAINT fk_det_plani_docente FOREIGN KEY (cedula_docente) REFERENCES docente(cedula_doc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_det_plani_materia; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_materias
    ADD CONSTRAINT fk_det_plani_materia FOREIGN KEY (codmat) REFERENCES materia(codmat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_deta_cargo; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_cargo_usuario
    ADD CONSTRAINT fk_deta_cargo FOREIGN KEY (fk_car_codigo) REFERENCES cargo(car_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_deta_usu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_cargo_usuario
    ADD CONSTRAINT fk_deta_usu FOREIGN KEY (fk_usu_nombre) REFERENCES usuario(nombre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_docente_dedicacion; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT fk_docente_dedicacion FOREIGN KEY (dedicacion) REFERENCES dedicacion(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_est_retiro; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY retiro
    ADD CONSTRAINT fk_est_retiro FOREIGN KEY (cedula_est_pre) REFERENCES alumno(cedula_est_pre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_estudiante_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT fk_estudiante_solicitud FOREIGN KEY (solicitante) REFERENCES alumno(cedula_est_pre);


--
-- Name: fk_eva_peraca; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion
    ADD CONSTRAINT fk_eva_peraca FOREIGN KEY (peraca) REFERENCES peraca(peraca) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_eva_persona; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion
    ADD CONSTRAINT fk_eva_persona FOREIGN KEY (cedula) REFERENCES persona(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_eva_tipoeva; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion
    ADD CONSTRAINT fk_eva_tipoeva FOREIGN KEY (idtipo) REFERENCES tipoevaluativo(idtipo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_evaluadores_per; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluadores
    ADD CONSTRAINT fk_evaluadores_per FOREIGN KEY (cedula) REFERENCES persona(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_evaluadores_peraca; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluadores
    ADD CONSTRAINT fk_evaluadores_peraca FOREIGN KEY (peraca) REFERENCES peraca(peraca) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_evaluadores_tipo; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluadores
    ADD CONSTRAINT fk_evaluadores_tipo FOREIGN KEY (idtipo) REFERENCES tipoevaluativo(idtipo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_ins_estu; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY inscripcion_pre
    ADD CONSTRAINT fk_ins_estu FOREIGN KEY (cedula_est_pre) REFERENCES alumno(cedula_est_pre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_insnot_con; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY insnot
    ADD CONSTRAINT fk_insnot_con FOREIGN KEY (condicion) REFERENCES condicion(idcondicion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_insnot_est; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY insnot
    ADD CONSTRAINT fk_insnot_est FOREIGN KEY (cedula_est_pre) REFERENCES alumno(cedula_est_pre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_insnot_insc; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY insnot
    ADD CONSTRAINT fk_insnot_insc FOREIGN KEY (idinscripcion) REFERENCES inscripcion_pre(num_inscripcion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_modulo_tipo_pro; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY tipo_proceso
    ADD CONSTRAINT fk_modulo_tipo_pro FOREIGN KEY (modulo) REFERENCES modulo(mod_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_munests; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT fk_munests FOREIGN KEY (idestado) REFERENCES estado(idestado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_padre_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalleevaluacion
    ADD CONSTRAINT fk_padre_evaluacion FOREIGN KEY (numero) REFERENCES evaluacion(numero) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_padre_evaluadores; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_evaluadores
    ADD CONSTRAINT fk_padre_evaluadores FOREIGN KEY (idevaluadores) REFERENCES evaluadores(idevaluadores) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_padre_nota; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_nota
    ADD CONSTRAINT fk_padre_nota FOREIGN KEY (numero) REFERENCES evaluacion(numero) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_padre_plani; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_materias
    ADD CONSTRAINT fk_padre_plani FOREIGN KEY (idplanificacion) REFERENCES planificacion_sec(idplanificacion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_padre_pm; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_pm
    ADD CONSTRAINT fk_padre_pm FOREIGN KEY (pm_codigo) REFERENCES planificacion_materias(pm_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_peraca_inscpre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY inscripcion_pre
    ADD CONSTRAINT fk_peraca_inscpre FOREIGN KEY (peraca) REFERENCES peraca(peraca) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_percar; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_percar FOREIGN KEY (fk_car_codigo) REFERENCES cargo(car_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_perpro_car; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_proceso
    ADD CONSTRAINT fk_perpro_car FOREIGN KEY (fk_car_codigo) REFERENCES cargo(car_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_persub; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_persub FOREIGN KEY (fk_sub_codigo) REFERENCES submodulo(sub_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_pla_carrera; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_sec
    ADD CONSTRAINT fk_pla_carrera FOREIGN KEY (codesp) REFERENCES carrera(codesp) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_pla_per; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_sec
    ADD CONSTRAINT fk_pla_per FOREIGN KEY (peraca) REFERENCES peraca(peraca) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_pla_regimen; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_sec
    ADD CONSTRAINT fk_pla_regimen FOREIGN KEY (regimen) REFERENCES regimen(idregimen) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_pla_sec; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_sec
    ADD CONSTRAINT fk_pla_sec FOREIGN KEY (seccion) REFERENCES seccion(idseccion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_pla_sem; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_sec
    ADD CONSTRAINT fk_pla_sem FOREIGN KEY (semestre) REFERENCES semestre(idsemestre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_planifica_materias_inscp; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY inscripcion_pre
    ADD CONSTRAINT fk_planifica_materias_inscp FOREIGN KEY (pm_codigo) REFERENCES planificacion_materias(pm_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_retiro_tipo; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY retiro
    ADD CONSTRAINT fk_retiro_tipo FOREIGN KEY (tipo) REFERENCES tipo_retiro(idtipo_ret) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_soli_carre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT fk_soli_carre FOREIGN KEY (codesp) REFERENCES carrera(codesp) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_soli_regi; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT fk_soli_regi FOREIGN KEY (regimen) REFERENCES regimen(idregimen) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_submod; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY submodulo
    ADD CONSTRAINT fk_submod FOREIGN KEY (fk_mod_codigo) REFERENCES modulo(mod_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_tipo_ambiente; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY ambiente
    ADD CONSTRAINT fk_tipo_ambiente FOREIGN KEY (tip_cod) REFERENCES tipo_ambiente(tip_cod) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_tipo_proceso; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY proceso
    ADD CONSTRAINT fk_tipo_proceso FOREIGN KEY (idtipo) REFERENCES tipo_proceso(idtipo_pro) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_tipo_proceso_padre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY tipo_proceso
    ADD CONSTRAINT fk_tipo_proceso_padre FOREIGN KEY (padre) REFERENCES tipo_proceso(idtipo_pro) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_tipo_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT fk_tipo_solicitud FOREIGN KEY (idtipo) REFERENCES tipo_solicitud(idtipo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_tp_perpro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_proceso
    ADD CONSTRAINT fk_tp_perpro FOREIGN KEY (fk_tippro_codigo) REFERENCES tipo_proceso(idtipo_pro) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_usuario_clave; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY historial_clave
    ADD CONSTRAINT fk_usuario_clave FOREIGN KEY (usuario) REFERENCES usuario(nombre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_usuario_preguntas; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY usuario_pregunta
    ADD CONSTRAINT fk_usuario_preguntas FOREIGN KEY (usuario) REFERENCES usuario(nombre) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: materia_padre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY unidad
    ADD CONSTRAINT materia_padre FOREIGN KEY (codmat) REFERENCES materia(codmat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: materia_planificada; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_evaluacion
    ADD CONSTRAINT materia_planificada FOREIGN KEY (codmat) REFERENCES materia(codmat) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: materia_planificada_actual; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY plan_fecha_eva
    ADD CONSTRAINT materia_planificada_actual FOREIGN KEY (pm_codigo) REFERENCES planificacion_materias(pm_codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: objetivo_unidad; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_unidad
    ADD CONSTRAINT objetivo_unidad FOREIGN KEY (codobj) REFERENCES objetivo(codobj) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plaeva_peraca; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY planificacion_evaluacion
    ADD CONSTRAINT plaeva_peraca FOREIGN KEY (peraca) REFERENCES peraca(peraca) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plani_padre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY unidad_pla
    ADD CONSTRAINT plani_padre FOREIGN KEY (idplanificacion) REFERENCES planificacion_evaluacion(idplanificacion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: planificacion_padre_pfe; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY plan_fecha_eva
    ADD CONSTRAINT planificacion_padre_pfe FOREIGN KEY (codigo_ep) REFERENCES evaluacion_pla(codigo_ep) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tecnica_planificada; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion_pla
    ADD CONSTRAINT tecnica_planificada FOREIGN KEY (codtec) REFERENCES tecnica(codtec) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: unidad_a_planificar; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY unidad_pla
    ADD CONSTRAINT unidad_a_planificar FOREIGN KEY (coduni) REFERENCES unidad(coduni) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: unidad_padre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_unidad
    ADD CONSTRAINT unidad_padre FOREIGN KEY (coduni) REFERENCES unidad(coduni) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: unidad_pla_padre; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY evaluacion_pla
    ADD CONSTRAINT unidad_pla_padre FOREIGN KEY (codigo_up) REFERENCES unidad_pla(codigo_up) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: unidad_pla_padre_est; Type: FK CONSTRAINT; Schema: public; Owner: uptp
--

ALTER TABLE ONLY detalle_est_unipla
    ADD CONSTRAINT unidad_pla_padre_est FOREIGN KEY (codigo_up) REFERENCES unidad_pla(codigo_up) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: CINU; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE "CINU" FROM PUBLIC;
REVOKE ALL ON TABLE "CINU" FROM uptp;
GRANT ALL ON TABLE "CINU" TO uptp;


--
-- Name: administrativo; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE administrativo FROM PUBLIC;
REVOKE ALL ON TABLE administrativo FROM uptp;
GRANT ALL ON TABLE administrativo TO uptp;


--
-- Name: alumno; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE alumno FROM PUBLIC;
REVOKE ALL ON TABLE alumno FROM uptp;
GRANT ALL ON TABLE alumno TO uptp;


--
-- Name: ambiente; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE ambiente FROM PUBLIC;
REVOKE ALL ON TABLE ambiente FROM uptp;
GRANT ALL ON TABLE ambiente TO uptp;


--
-- Name: aspectosevaluativos; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE aspectosevaluativos FROM PUBLIC;
REVOKE ALL ON TABLE aspectosevaluativos FROM uptp;
GRANT ALL ON TABLE aspectosevaluativos TO uptp;


--
-- Name: bitacora; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE bitacora FROM PUBLIC;
REVOKE ALL ON TABLE bitacora FROM uptp;
GRANT ALL ON TABLE bitacora TO uptp;


--
-- Name: bitacora_acceso; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE bitacora_acceso FROM PUBLIC;
REVOKE ALL ON TABLE bitacora_acceso FROM uptp;
GRANT ALL ON TABLE bitacora_acceso TO uptp;


--
-- Name: bloque; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE bloque FROM PUBLIC;
REVOKE ALL ON TABLE bloque FROM uptp;
GRANT ALL ON TABLE bloque TO uptp;


--
-- Name: cargo; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE cargo FROM PUBLIC;
REVOKE ALL ON TABLE cargo FROM uptp;
GRANT ALL ON TABLE cargo TO uptp;


--
-- Name: carrera; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE carrera FROM PUBLIC;
REVOKE ALL ON TABLE carrera FROM uptp;
GRANT ALL ON TABLE carrera TO uptp;


--
-- Name: ciudad; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE ciudad FROM PUBLIC;
REVOKE ALL ON TABLE ciudad FROM uptp;
GRANT ALL ON TABLE ciudad TO uptp;


--
-- Name: condicion; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE condicion FROM PUBLIC;
REVOKE ALL ON TABLE condicion FROM uptp;
GRANT ALL ON TABLE condicion TO uptp;


--
-- Name: contenido; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE contenido FROM PUBLIC;
REVOKE ALL ON TABLE contenido FROM uptp;
GRANT ALL ON TABLE contenido TO uptp;


--
-- Name: departamento; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE departamento FROM PUBLIC;
REVOKE ALL ON TABLE departamento FROM uptp;
GRANT ALL ON TABLE departamento TO uptp;


--
-- Name: detalle_cargo_usuario; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE detalle_cargo_usuario FROM PUBLIC;
REVOKE ALL ON TABLE detalle_cargo_usuario FROM uptp;
GRANT ALL ON TABLE detalle_cargo_usuario TO uptp;


--
-- Name: detalle_est_unipla; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE detalle_est_unipla FROM PUBLIC;
REVOKE ALL ON TABLE detalle_est_unipla FROM uptp;
GRANT ALL ON TABLE detalle_est_unipla TO uptp;


--
-- Name: detalle_evaluadores; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE detalle_evaluadores FROM PUBLIC;
REVOKE ALL ON TABLE detalle_evaluadores FROM uptp;
GRANT ALL ON TABLE detalle_evaluadores TO uptp;


--
-- Name: detalle_nota; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE detalle_nota FROM PUBLIC;
REVOKE ALL ON TABLE detalle_nota FROM uptp;
GRANT ALL ON TABLE detalle_nota TO uptp;


--
-- Name: detalle_pm; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE detalle_pm FROM PUBLIC;
REVOKE ALL ON TABLE detalle_pm FROM uptp;
GRANT ALL ON TABLE detalle_pm TO uptp;


--
-- Name: detalle_unidad; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE detalle_unidad FROM PUBLIC;
REVOKE ALL ON TABLE detalle_unidad FROM uptp;
GRANT ALL ON TABLE detalle_unidad TO uptp;


--
-- Name: detalleevaluacion; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE detalleevaluacion FROM PUBLIC;
REVOKE ALL ON TABLE detalleevaluacion FROM uptp;
GRANT ALL ON TABLE detalleevaluacion TO uptp;


--
-- Name: docente; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE docente FROM PUBLIC;
REVOKE ALL ON TABLE docente FROM uptp;
GRANT ALL ON TABLE docente TO uptp;


--
-- Name: estado; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE estado FROM PUBLIC;
REVOKE ALL ON TABLE estado FROM uptp;
GRANT ALL ON TABLE estado TO uptp;


--
-- Name: estrategia; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE estrategia FROM PUBLIC;
REVOKE ALL ON TABLE estrategia FROM uptp;
GRANT ALL ON TABLE estrategia TO uptp;


--
-- Name: evaluacion; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE evaluacion FROM PUBLIC;
REVOKE ALL ON TABLE evaluacion FROM uptp;
GRANT ALL ON TABLE evaluacion TO uptp;


--
-- Name: evaluacion_pla; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE evaluacion_pla FROM PUBLIC;
REVOKE ALL ON TABLE evaluacion_pla FROM uptp;
GRANT ALL ON TABLE evaluacion_pla TO uptp;


--
-- Name: evaluadores; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE evaluadores FROM PUBLIC;
REVOKE ALL ON TABLE evaluadores FROM uptp;
GRANT ALL ON TABLE evaluadores TO uptp;


--
-- Name: historial_clave; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE historial_clave FROM PUBLIC;
REVOKE ALL ON TABLE historial_clave FROM uptp;
GRANT ALL ON TABLE historial_clave TO uptp;


--
-- Name: inscripcion_pre; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE inscripcion_pre FROM PUBLIC;
REVOKE ALL ON TABLE inscripcion_pre FROM uptp;
GRANT ALL ON TABLE inscripcion_pre TO uptp;


--
-- Name: insnot; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE insnot FROM PUBLIC;
REVOKE ALL ON TABLE insnot FROM uptp;
GRANT ALL ON TABLE insnot TO uptp;


--
-- Name: materia; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE materia FROM PUBLIC;
REVOKE ALL ON TABLE materia FROM uptp;
GRANT ALL ON TABLE materia TO uptp;


--
-- Name: modulo; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE modulo FROM PUBLIC;
REVOKE ALL ON TABLE modulo FROM uptp;
GRANT ALL ON TABLE modulo TO uptp;


--
-- Name: municipio; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE municipio FROM PUBLIC;
REVOKE ALL ON TABLE municipio FROM uptp;
GRANT ALL ON TABLE municipio TO uptp;


--
-- Name: objetivo; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE objetivo FROM PUBLIC;
REVOKE ALL ON TABLE objetivo FROM uptp;
GRANT ALL ON TABLE objetivo TO uptp;


--
-- Name: parroquia; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE parroquia FROM PUBLIC;
REVOKE ALL ON TABLE parroquia FROM uptp;
GRANT ALL ON TABLE parroquia TO uptp;


--
-- Name: pensum_pre; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE pensum_pre FROM PUBLIC;
REVOKE ALL ON TABLE pensum_pre FROM uptp;
GRANT ALL ON TABLE pensum_pre TO uptp;


--
-- Name: peraca; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE peraca FROM PUBLIC;
REVOKE ALL ON TABLE peraca FROM uptp;
GRANT ALL ON TABLE peraca TO uptp;


--
-- Name: permiso; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE permiso FROM PUBLIC;
REVOKE ALL ON TABLE permiso FROM uptp;
GRANT ALL ON TABLE permiso TO uptp;


--
-- Name: persona; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE persona FROM PUBLIC;
REVOKE ALL ON TABLE persona FROM uptp;
GRANT ALL ON TABLE persona TO uptp;


--
-- Name: plan_fecha_eva; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE plan_fecha_eva FROM PUBLIC;
REVOKE ALL ON TABLE plan_fecha_eva FROM uptp;
GRANT ALL ON TABLE plan_fecha_eva TO uptp;


--
-- Name: planificacion_evaluacion; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE planificacion_evaluacion FROM PUBLIC;
REVOKE ALL ON TABLE planificacion_evaluacion FROM uptp;
GRANT ALL ON TABLE planificacion_evaluacion TO uptp;


--
-- Name: planificacion_materias; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE planificacion_materias FROM PUBLIC;
REVOKE ALL ON TABLE planificacion_materias FROM uptp;
GRANT ALL ON TABLE planificacion_materias TO uptp;


--
-- Name: planificacion_sec; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE planificacion_sec FROM PUBLIC;
REVOKE ALL ON TABLE planificacion_sec FROM uptp;
GRANT ALL ON TABLE planificacion_sec TO uptp;


--
-- Name: proceso; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE proceso FROM PUBLIC;
REVOKE ALL ON TABLE proceso FROM uptp;
GRANT ALL ON TABLE proceso TO uptp;


--
-- Name: regimen; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE regimen FROM PUBLIC;
REVOKE ALL ON TABLE regimen FROM uptp;
GRANT ALL ON TABLE regimen TO uptp;


--
-- Name: retiro; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE retiro FROM PUBLIC;
REVOKE ALL ON TABLE retiro FROM uptp;
GRANT ALL ON TABLE retiro TO uptp;


--
-- Name: seccion; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE seccion FROM PUBLIC;
REVOKE ALL ON TABLE seccion FROM uptp;
GRANT ALL ON TABLE seccion TO uptp;


--
-- Name: semestre; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE semestre FROM PUBLIC;
REVOKE ALL ON TABLE semestre FROM uptp;
GRANT ALL ON TABLE semestre TO uptp;


--
-- Name: servidor; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE servidor FROM PUBLIC;
REVOKE ALL ON TABLE servidor FROM uptp;
GRANT ALL ON TABLE servidor TO uptp;


--
-- Name: solicitud; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE solicitud FROM PUBLIC;
REVOKE ALL ON TABLE solicitud FROM uptp;
GRANT ALL ON TABLE solicitud TO uptp;


--
-- Name: submodulo; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE submodulo FROM PUBLIC;
REVOKE ALL ON TABLE submodulo FROM uptp;
GRANT ALL ON TABLE submodulo TO uptp;


--
-- Name: tecnica; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE tecnica FROM PUBLIC;
REVOKE ALL ON TABLE tecnica FROM uptp;
GRANT ALL ON TABLE tecnica TO uptp;


--
-- Name: tipo_ambiente; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE tipo_ambiente FROM PUBLIC;
REVOKE ALL ON TABLE tipo_ambiente FROM uptp;
GRANT ALL ON TABLE tipo_ambiente TO uptp;


--
-- Name: tipo_proceso; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE tipo_proceso FROM PUBLIC;
REVOKE ALL ON TABLE tipo_proceso FROM uptp;
GRANT ALL ON TABLE tipo_proceso TO uptp;


--
-- Name: tipo_retiro; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE tipo_retiro FROM PUBLIC;
REVOKE ALL ON TABLE tipo_retiro FROM uptp;
GRANT ALL ON TABLE tipo_retiro TO uptp;


--
-- Name: tipo_solicitud; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE tipo_solicitud FROM PUBLIC;
REVOKE ALL ON TABLE tipo_solicitud FROM uptp;
GRANT ALL ON TABLE tipo_solicitud TO uptp;


--
-- Name: tipoevaluativo; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE tipoevaluativo FROM PUBLIC;
REVOKE ALL ON TABLE tipoevaluativo FROM uptp;
GRANT ALL ON TABLE tipoevaluativo TO uptp;


--
-- Name: unidad; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE unidad FROM PUBLIC;
REVOKE ALL ON TABLE unidad FROM uptp;
GRANT ALL ON TABLE unidad TO uptp;


--
-- Name: unidad_pla; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE unidad_pla FROM PUBLIC;
REVOKE ALL ON TABLE unidad_pla FROM uptp;
GRANT ALL ON TABLE unidad_pla TO uptp;


--
-- Name: usuario; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE usuario FROM PUBLIC;
REVOKE ALL ON TABLE usuario FROM uptp;
GRANT ALL ON TABLE usuario TO uptp;


--
-- Name: usuario_pregunta; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE usuario_pregunta FROM PUBLIC;
REVOKE ALL ON TABLE usuario_pregunta FROM uptp;
GRANT ALL ON TABLE usuario_pregunta TO uptp;


--
-- Name: valoracion; Type: ACL; Schema: public; Owner: uptp
--

REVOKE ALL ON TABLE valoracion FROM PUBLIC;
REVOKE ALL ON TABLE valoracion FROM uptp;
GRANT ALL ON TABLE valoracion TO uptp;


--
-- PostgreSQL database dump complete
--

