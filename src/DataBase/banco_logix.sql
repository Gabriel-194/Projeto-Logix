--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-10-31 11:58:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 35189)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 5 (class 2615 OID 35412)
-- Name: transp_feia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_feia;


ALTER SCHEMA transp_feia OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 35413)
-- Name: transp_inteligente; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_inteligente;


ALTER SCHEMA transp_inteligente OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 35414)
-- Name: transp_legal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_legal;


ALTER SCHEMA transp_legal OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 35415)
-- Name: transp_paia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_paia;


ALTER SCHEMA transp_paia OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 35260)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome character varying(90) NOT NULL,
    cpf character varying(20) NOT NULL,
    telefone character varying(20),
    email character varying(90) NOT NULL,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now(),
    ativo boolean DEFAULT true,
    cep character varying(20),
    estado character varying(50),
    municipio character varying(50),
    endereco character varying(100),
    numero integer,
    senha_hash character varying(100) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 35259)
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 229
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- TOC entry 224 (class 1259 OID 35207)
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo (
    id_grupo integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 35206)
-- Name: grupo_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_id_grupo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grupo_id_grupo_seq OWNER TO postgres;

--
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 223
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_id_grupo_seq OWNED BY public.grupo.id_grupo;


--
-- TOC entry 228 (class 1259 OID 35242)
-- Name: motorista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.motorista (
    id_motorista integer NOT NULL,
    id_usuario integer NOT NULL,
    numero_cnh character varying(20) NOT NULL,
    categoria_cnh character varying(5) NOT NULL,
    validade_cnh date NOT NULL,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now()
);


ALTER TABLE public.motorista OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 35241)
-- Name: motorista_id_motorista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.motorista_id_motorista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.motorista_id_motorista_seq OWNER TO postgres;

--
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 227
-- Name: motorista_id_motorista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.motorista_id_motorista_seq OWNED BY public.motorista.id_motorista;


--
-- TOC entry 222 (class 1259 OID 35191)
-- Name: transportadora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transportadora (
    id integer NOT NULL,
    nome character varying(90) NOT NULL,
    cnpj character varying(20) NOT NULL,
    telefone character varying(20),
    email character varying(90),
    cep character varying(20),
    ativo boolean DEFAULT true,
    schema_name character varying(50) NOT NULL,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now()
);


ALTER TABLE public.transportadora OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 35190)
-- Name: transportadora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transportadora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transportadora_id_seq OWNER TO postgres;

--
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 221
-- Name: transportadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transportadora_id_seq OWNED BY public.transportadora.id;


--
-- TOC entry 226 (class 1259 OID 35216)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome character varying(90) NOT NULL,
    senha_hash character varying(255) NOT NULL,
    cpf character varying(20) NOT NULL,
    telefone character varying(20),
    email character varying(90) NOT NULL,
    cargo_descricao character varying(50),
    id_grupo integer,
    ativo boolean DEFAULT true,
    id_transportadora integer,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now()
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 35215)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 231 (class 1259 OID 35416)
-- Name: carregamento; Type: TABLE; Schema: transp_feia; Owner: postgres
--

CREATE TABLE transp_feia.carregamento (
    id_carregamento integer NOT NULL,
    id_pedido integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_carregador integer NOT NULL,
    data_hora_inicio timestamp without time zone,
    data_hora_fim timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now()
);


ALTER TABLE transp_feia.carregamento OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 35422)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: transp_feia; Owner: postgres
--

CREATE SEQUENCE transp_feia.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_feia.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 232
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.carregamento_id_carregamento_seq OWNED BY transp_feia.carregamento.id_carregamento;


--
-- TOC entry 233 (class 1259 OID 35423)
-- Name: pedido; Type: TABLE; Schema: transp_feia; Owner: postgres
--

CREATE TABLE transp_feia.pedido (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    cep_origem character varying(15),
    estado_origem character varying(2),
    municipio_origem character varying(50),
    endereco_origem character varying(100),
    numero_origem character varying(10),
    cep_destino character varying(15),
    estado_destino character varying(2),
    municipio_destino character varying(50),
    endereco_destino character varying(100),
    numero_destino character varying(10),
    distancia_km double precision,
    data_pedido timestamp without time zone DEFAULT now(),
    peso double precision,
    tipo_carga character varying(50) NOT NULL,
    preco numeric(10,2),
    id_transportadora integer NOT NULL,
    status character varying(20) DEFAULT 'confirmado'::character varying,
    ativo boolean DEFAULT true,
    motiv_cancelamento character varying(150),
    data_atualizacao timestamp without time zone
);


ALTER TABLE transp_feia.pedido OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 35429)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: transp_feia; Owner: postgres
--

CREATE SEQUENCE transp_feia.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_feia.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 234
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.pedido_id_pedido_seq OWNED BY transp_feia.pedido.id_pedido;


--
-- TOC entry 235 (class 1259 OID 35430)
-- Name: tipo_carga; Type: TABLE; Schema: transp_feia; Owner: postgres
--

CREATE TABLE transp_feia.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE transp_feia.tipo_carga OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 35433)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: transp_feia; Owner: postgres
--

CREATE SEQUENCE transp_feia.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_feia.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 236
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.tipo_carga_id_carga_seq OWNED BY transp_feia.tipo_carga.id_carga;


--
-- TOC entry 237 (class 1259 OID 35434)
-- Name: veiculo; Type: TABLE; Schema: transp_feia; Owner: postgres
--

CREATE TABLE transp_feia.veiculo (
    id_veiculo integer NOT NULL,
    placa character varying(10) NOT NULL,
    modelo character varying(50),
    ano integer,
    tipo_carga character varying(50),
    capacidade integer,
    unidade_medida character varying(20),
    ativo boolean DEFAULT true,
    data_cadastro timestamp with time zone DEFAULT now(),
    data_atualizacao timestamp with time zone DEFAULT now(),
    id_motorista integer,
    status character varying(50)
);


ALTER TABLE transp_feia.veiculo OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 35440)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: transp_feia; Owner: postgres
--

CREATE SEQUENCE transp_feia.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_feia.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 238
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.veiculo_id_veiculo_seq OWNED BY transp_feia.veiculo.id_veiculo;


--
-- TOC entry 239 (class 1259 OID 35441)
-- Name: viagem; Type: TABLE; Schema: transp_feia; Owner: postgres
--

CREATE TABLE transp_feia.viagem (
    id_viagem integer NOT NULL,
    id_carregamento integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_motorista integer NOT NULL,
    data_saida_cd timestamp without time zone,
    data_chegada timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now(),
    distancia_km double precision
);


ALTER TABLE transp_feia.viagem OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 35447)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: transp_feia; Owner: postgres
--

CREATE SEQUENCE transp_feia.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_feia.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 240
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.viagem_id_viagem_seq OWNED BY transp_feia.viagem.id_viagem;


--
-- TOC entry 241 (class 1259 OID 35448)
-- Name: carregamento; Type: TABLE; Schema: transp_inteligente; Owner: postgres
--

CREATE TABLE transp_inteligente.carregamento (
    id_carregamento integer NOT NULL,
    id_pedido integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_carregador integer NOT NULL,
    data_hora_inicio timestamp without time zone,
    data_hora_fim timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now()
);


ALTER TABLE transp_inteligente.carregamento OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 35454)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: transp_inteligente; Owner: postgres
--

CREATE SEQUENCE transp_inteligente.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_inteligente.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 242
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.carregamento_id_carregamento_seq OWNED BY transp_inteligente.carregamento.id_carregamento;


--
-- TOC entry 243 (class 1259 OID 35455)
-- Name: pedido; Type: TABLE; Schema: transp_inteligente; Owner: postgres
--

CREATE TABLE transp_inteligente.pedido (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    cep_origem character varying(15),
    estado_origem character varying(2),
    municipio_origem character varying(50),
    endereco_origem character varying(100),
    numero_origem character varying(10),
    cep_destino character varying(15),
    estado_destino character varying(2),
    municipio_destino character varying(50),
    endereco_destino character varying(100),
    numero_destino character varying(10),
    distancia_km double precision,
    data_pedido timestamp without time zone DEFAULT now(),
    peso double precision,
    tipo_carga character varying(50) NOT NULL,
    preco numeric(10,2),
    id_transportadora integer NOT NULL,
    status character varying(20) DEFAULT 'confirmado'::character varying,
    ativo boolean DEFAULT true,
    motiv_cancelamento character varying(150),
    data_atualizacao timestamp without time zone
);


ALTER TABLE transp_inteligente.pedido OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 35461)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: transp_inteligente; Owner: postgres
--

CREATE SEQUENCE transp_inteligente.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_inteligente.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 244
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.pedido_id_pedido_seq OWNED BY transp_inteligente.pedido.id_pedido;


--
-- TOC entry 245 (class 1259 OID 35462)
-- Name: tipo_carga; Type: TABLE; Schema: transp_inteligente; Owner: postgres
--

CREATE TABLE transp_inteligente.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE transp_inteligente.tipo_carga OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 35465)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: transp_inteligente; Owner: postgres
--

CREATE SEQUENCE transp_inteligente.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_inteligente.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.tipo_carga_id_carga_seq OWNED BY transp_inteligente.tipo_carga.id_carga;


--
-- TOC entry 247 (class 1259 OID 35466)
-- Name: veiculo; Type: TABLE; Schema: transp_inteligente; Owner: postgres
--

CREATE TABLE transp_inteligente.veiculo (
    id_veiculo integer NOT NULL,
    placa character varying(10) NOT NULL,
    modelo character varying(50),
    ano integer,
    tipo_carga character varying(50),
    capacidade integer,
    unidade_medida character varying(20),
    ativo boolean DEFAULT true,
    data_cadastro timestamp with time zone DEFAULT now(),
    data_atualizacao timestamp with time zone DEFAULT now(),
    id_motorista integer,
    status character varying(50)
);


ALTER TABLE transp_inteligente.veiculo OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 35472)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: transp_inteligente; Owner: postgres
--

CREATE SEQUENCE transp_inteligente.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_inteligente.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 248
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.veiculo_id_veiculo_seq OWNED BY transp_inteligente.veiculo.id_veiculo;


--
-- TOC entry 249 (class 1259 OID 35473)
-- Name: viagem; Type: TABLE; Schema: transp_inteligente; Owner: postgres
--

CREATE TABLE transp_inteligente.viagem (
    id_viagem integer NOT NULL,
    id_carregamento integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_motorista integer NOT NULL,
    data_saida_cd timestamp without time zone,
    data_chegada timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now(),
    distancia_km double precision
);


ALTER TABLE transp_inteligente.viagem OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 35479)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: transp_inteligente; Owner: postgres
--

CREATE SEQUENCE transp_inteligente.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_inteligente.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 250
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.viagem_id_viagem_seq OWNED BY transp_inteligente.viagem.id_viagem;


--
-- TOC entry 251 (class 1259 OID 35480)
-- Name: carregamento; Type: TABLE; Schema: transp_legal; Owner: postgres
--

CREATE TABLE transp_legal.carregamento (
    id_carregamento integer NOT NULL,
    id_pedido integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_carregador integer NOT NULL,
    data_hora_inicio timestamp without time zone,
    data_hora_fim timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now()
);


ALTER TABLE transp_legal.carregamento OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 35486)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: transp_legal; Owner: postgres
--

CREATE SEQUENCE transp_legal.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_legal.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 252
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.carregamento_id_carregamento_seq OWNED BY transp_legal.carregamento.id_carregamento;


--
-- TOC entry 253 (class 1259 OID 35487)
-- Name: pedido; Type: TABLE; Schema: transp_legal; Owner: postgres
--

CREATE TABLE transp_legal.pedido (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    cep_origem character varying(15),
    estado_origem character varying(2),
    municipio_origem character varying(50),
    endereco_origem character varying(100),
    numero_origem character varying(10),
    cep_destino character varying(15),
    estado_destino character varying(2),
    municipio_destino character varying(50),
    endereco_destino character varying(100),
    numero_destino character varying(10),
    distancia_km double precision,
    data_pedido timestamp without time zone DEFAULT now(),
    peso double precision,
    tipo_carga character varying(50) NOT NULL,
    preco numeric(10,2),
    id_transportadora integer NOT NULL,
    status character varying(20) DEFAULT 'confirmado'::character varying,
    ativo boolean DEFAULT true,
    motiv_cancelamento character varying(150),
    data_atualizacao timestamp without time zone
);


ALTER TABLE transp_legal.pedido OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 35493)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: transp_legal; Owner: postgres
--

CREATE SEQUENCE transp_legal.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_legal.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 254
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.pedido_id_pedido_seq OWNED BY transp_legal.pedido.id_pedido;


--
-- TOC entry 255 (class 1259 OID 35494)
-- Name: tipo_carga; Type: TABLE; Schema: transp_legal; Owner: postgres
--

CREATE TABLE transp_legal.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE transp_legal.tipo_carga OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 35497)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: transp_legal; Owner: postgres
--

CREATE SEQUENCE transp_legal.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_legal.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 256
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.tipo_carga_id_carga_seq OWNED BY transp_legal.tipo_carga.id_carga;


--
-- TOC entry 257 (class 1259 OID 35498)
-- Name: veiculo; Type: TABLE; Schema: transp_legal; Owner: postgres
--

CREATE TABLE transp_legal.veiculo (
    id_veiculo integer NOT NULL,
    placa character varying(10) NOT NULL,
    modelo character varying(50),
    ano integer,
    tipo_carga character varying(50),
    capacidade integer,
    unidade_medida character varying(20),
    ativo boolean DEFAULT true,
    data_cadastro timestamp with time zone DEFAULT now(),
    data_atualizacao timestamp with time zone DEFAULT now(),
    status character varying(50)
);


ALTER TABLE transp_legal.veiculo OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 35504)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: transp_legal; Owner: postgres
--

CREATE SEQUENCE transp_legal.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_legal.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 258
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.veiculo_id_veiculo_seq OWNED BY transp_legal.veiculo.id_veiculo;


--
-- TOC entry 259 (class 1259 OID 35505)
-- Name: viagem; Type: TABLE; Schema: transp_legal; Owner: postgres
--

CREATE TABLE transp_legal.viagem (
    id_viagem integer NOT NULL,
    id_carregamento integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_motorista integer NOT NULL,
    data_saida_cd timestamp without time zone,
    data_chegada timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now(),
    distancia_km double precision
);


ALTER TABLE transp_legal.viagem OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 35511)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: transp_legal; Owner: postgres
--

CREATE SEQUENCE transp_legal.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_legal.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 260
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.viagem_id_viagem_seq OWNED BY transp_legal.viagem.id_viagem;


--
-- TOC entry 261 (class 1259 OID 35512)
-- Name: carregamento; Type: TABLE; Schema: transp_paia; Owner: postgres
--

CREATE TABLE transp_paia.carregamento (
    id_carregamento integer NOT NULL,
    id_pedido integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_carregador integer NOT NULL,
    data_hora_inicio timestamp without time zone,
    data_hora_fim timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now()
);


ALTER TABLE transp_paia.carregamento OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 35518)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: transp_paia; Owner: postgres
--

CREATE SEQUENCE transp_paia.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_paia.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 262
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.carregamento_id_carregamento_seq OWNED BY transp_paia.carregamento.id_carregamento;


--
-- TOC entry 263 (class 1259 OID 35519)
-- Name: pedido; Type: TABLE; Schema: transp_paia; Owner: postgres
--

CREATE TABLE transp_paia.pedido (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    cep_origem character varying(15),
    estado_origem character varying(2),
    municipio_origem character varying(50),
    endereco_origem character varying(100),
    numero_origem character varying(10),
    cep_destino character varying(15),
    estado_destino character varying(2),
    municipio_destino character varying(50),
    endereco_destino character varying(100),
    numero_destino character varying(10),
    distancia_km double precision,
    data_pedido timestamp without time zone DEFAULT now(),
    peso double precision,
    tipo_carga character varying(50) NOT NULL,
    preco numeric(10,2),
    id_transportadora integer NOT NULL,
    status character varying(20) DEFAULT 'confirmado'::character varying,
    ativo boolean DEFAULT true,
    motiv_cancelamento character varying(150),
    data_atualizacao timestamp without time zone
);


ALTER TABLE transp_paia.pedido OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 35525)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: transp_paia; Owner: postgres
--

CREATE SEQUENCE transp_paia.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_paia.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 264
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.pedido_id_pedido_seq OWNED BY transp_paia.pedido.id_pedido;


--
-- TOC entry 265 (class 1259 OID 35526)
-- Name: tipo_carga; Type: TABLE; Schema: transp_paia; Owner: postgres
--

CREATE TABLE transp_paia.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE transp_paia.tipo_carga OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 35529)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: transp_paia; Owner: postgres
--

CREATE SEQUENCE transp_paia.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_paia.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 266
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.tipo_carga_id_carga_seq OWNED BY transp_paia.tipo_carga.id_carga;


--
-- TOC entry 267 (class 1259 OID 35530)
-- Name: veiculo; Type: TABLE; Schema: transp_paia; Owner: postgres
--

CREATE TABLE transp_paia.veiculo (
    id_veiculo integer NOT NULL,
    placa character varying(10) NOT NULL,
    modelo character varying(50),
    ano integer,
    tipo_carga character varying(50),
    capacidade integer,
    unidade_medida character varying(20),
    ativo boolean DEFAULT true,
    data_cadastro timestamp with time zone DEFAULT now(),
    data_atualizacao timestamp with time zone DEFAULT now(),
    status character varying(50)
);


ALTER TABLE transp_paia.veiculo OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 35536)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: transp_paia; Owner: postgres
--

CREATE SEQUENCE transp_paia.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_paia.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 268
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.veiculo_id_veiculo_seq OWNED BY transp_paia.veiculo.id_veiculo;


--
-- TOC entry 269 (class 1259 OID 35537)
-- Name: viagem; Type: TABLE; Schema: transp_paia; Owner: postgres
--

CREATE TABLE transp_paia.viagem (
    id_viagem integer NOT NULL,
    id_carregamento integer NOT NULL,
    id_veiculo integer NOT NULL,
    id_motorista integer NOT NULL,
    data_saida_cd timestamp without time zone,
    data_chegada timestamp without time zone,
    status character varying(30) DEFAULT 'Aguardando'::character varying,
    data_cadastro timestamp without time zone DEFAULT now(),
    data_atualizacao timestamp without time zone DEFAULT now(),
    distancia_km double precision
);


ALTER TABLE transp_paia.viagem OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 35543)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: transp_paia; Owner: postgres
--

CREATE SEQUENCE transp_paia.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_paia.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 270
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.viagem_id_viagem_seq OWNED BY transp_paia.viagem.id_viagem;


--
-- TOC entry 4878 (class 2604 OID 35544)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4870 (class 2604 OID 35545)
-- Name: grupo id_grupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id_grupo SET DEFAULT nextval('public.grupo_id_grupo_seq'::regclass);


--
-- TOC entry 4875 (class 2604 OID 35546)
-- Name: motorista id_motorista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista ALTER COLUMN id_motorista SET DEFAULT nextval('public.motorista_id_motorista_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 35547)
-- Name: transportadora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora ALTER COLUMN id SET DEFAULT nextval('public.transportadora_id_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 35548)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 35549)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_feia.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4886 (class 2604 OID 35550)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_feia.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4890 (class 2604 OID 35551)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_feia.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4891 (class 2604 OID 35552)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_feia.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4895 (class 2604 OID 35553)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_feia.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 35554)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_inteligente.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 35555)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_inteligente.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 35556)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_inteligente.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 35557)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_inteligente.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 35558)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_inteligente.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 35559)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_legal.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 35560)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_legal.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 35561)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_legal.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 35562)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_legal.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 35563)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_legal.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4933 (class 2604 OID 35564)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_paia.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4937 (class 2604 OID 35565)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_paia.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 35566)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_paia.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 35567)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_paia.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 35568)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_paia.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 5235 (class 0 OID 35260)
-- Dependencies: 230
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nome, cpf, telefone, email, data_cadastro, data_atualizacao, ativo, cep, estado, municipio, endereco, numero, senha_hash) FROM stdin;
1	gui	123.125.123-12	 (41) 23123-1251	gui@gmail.com	2025-10-29 17:00:57.239227	2025-10-29 17:00:57.239227	t	81.560-280	PR	Curitiba	Rua Agostinho Ângelo Trevisan	321	$2a$11$8n6bWanJqLSRgQiLqn4G1O8N27mABnrCNFdx0LnBaQmTsnxAdt71q
\.


--
-- TOC entry 5229 (class 0 OID 35207)
-- Dependencies: 224
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupo (id_grupo, nome) FROM stdin;
1	Admin
2	Gerente
3	Carregador
4	Motorista
\.


--
-- TOC entry 5233 (class 0 OID 35242)
-- Dependencies: 228
-- Data for Name: motorista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.motorista (id_motorista, id_usuario, numero_cnh, categoria_cnh, validade_cnh, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5227 (class 0 OID 35191)
-- Dependencies: 222
-- Data for Name: transportadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportadora (id, nome, cnpj, telefone, email, cep, ativo, schema_name, data_cadastro, data_atualizacao) FROM stdin;
1	transp Legal	98.798.465/4321-02	 (31) 24124-1243	trasnpLegal@gmail.com	32.165-546	t	transp_legal	2025-10-29 13:53:46.593846	2025-10-29 13:53:46.593846
3	transp paia	31.231.241/2423-51	 (41) 23123-1351	transpPaia@gmail.com	32.164-654	t	transp_paia	2025-10-29 13:56:29.265154	2025-10-29 13:56:29.265154
4	transp inteligente	31.231.342/3526-12	 (41) 23125-2346	transpInteligente@gmail.com	81.965-132	t	transp_inteligente	2025-10-29 14:00:36.614053	2025-10-29 14:00:36.614053
5	transp feia	32.165.846/4797-98	 (41) 23123-1423	transpFeia@gmail.com	41.231-231	t	transp_feia	2025-10-29 14:03:53.839762	2025-10-29 14:03:53.839762
\.


--
-- TOC entry 5231 (class 0 OID 35216)
-- Dependencies: 226
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nome, senha_hash, cpf, telefone, email, cargo_descricao, id_grupo, ativo, id_transportadora, data_cadastro, data_atualizacao) FROM stdin;
1	administrador logix	$2a$11$LDeqorZd6gz4j1Hif0aRjO2.lkdIKEvEW4sy9tkdUdIhrxJE8Qcb.	000.000.000-00	\N	LogixAdmin@gmail.com	adminLogix	\N	t	\N	2025-10-31 09:47:55.468362	2025-10-31 09:47:55.468362
\.


--
-- TOC entry 5236 (class 0 OID 35416)
-- Dependencies: 231
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5238 (class 0 OID 35423)
-- Dependencies: 233
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5240 (class 0 OID 35430)
-- Dependencies: 235
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Refrigerada	5.00	5
2	Líquida	8.00	5
\.


--
-- TOC entry 5242 (class 0 OID 35434)
-- Dependencies: 237
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, id_motorista, status) FROM stdin;
\.


--
-- TOC entry 5244 (class 0 OID 35441)
-- Dependencies: 239
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5246 (class 0 OID 35448)
-- Dependencies: 241
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5248 (class 0 OID 35455)
-- Dependencies: 243
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5250 (class 0 OID 35462)
-- Dependencies: 245
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	5.00	4
2	Refrigerada	6.50	4
3	Líquida	7.50	4
4	Gás	8.50	4
\.


--
-- TOC entry 5252 (class 0 OID 35466)
-- Dependencies: 247
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, id_motorista, status) FROM stdin;
\.


--
-- TOC entry 5254 (class 0 OID 35473)
-- Dependencies: 249
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5256 (class 0 OID 35480)
-- Dependencies: 251
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5258 (class 0 OID 35487)
-- Dependencies: 253
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
1	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	123	409	2025-10-31 09:52:57.373734	5000	Seca	2890.07	1	Aguardando	t	\N	\N
2	1	01.001-000	SP	São Paulo	Praça da Sé	13	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	408	2025-10-31 10:17:48.935231	5000	Seca	2883.28	1	Cancelado	f	motivo não informado	2025-10-31 11:28:05.802006
\.


--
-- TOC entry 5260 (class 0 OID 35494)
-- Dependencies: 255
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	5.00	1
2	Refrigerada	6.00	1
\.


--
-- TOC entry 5262 (class 0 OID 35498)
-- Dependencies: 257
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
1	ASD1S41	HR	2025	Seca	5000	Quilograma (KG)	t	2025-10-29 16:24:09.623977-03	2025-10-29 16:24:09.623977-03	disponivel
\.


--
-- TOC entry 5264 (class 0 OID 35505)
-- Dependencies: 259
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5266 (class 0 OID 35512)
-- Dependencies: 261
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5268 (class 0 OID 35519)
-- Dependencies: 263
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5270 (class 0 OID 35526)
-- Dependencies: 265
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Líquida	7.00	3
2	Gás	6.00	3
\.


--
-- TOC entry 5272 (class 0 OID 35530)
-- Dependencies: 267
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
\.


--
-- TOC entry 5274 (class 0 OID 35537)
-- Dependencies: 269
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 229
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, true);


--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 223
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_id_grupo_seq', 4, true);


--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 227
-- Name: motorista_id_motorista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.motorista_id_motorista_seq', 1, true);


--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 221
-- Name: transportadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transportadora_id_seq', 5, true);


--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 6, true);


--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 232
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 234
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 236
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 238
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 240
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 242
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 244
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.tipo_carga_id_carga_seq', 4, true);


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 248
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 250
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 252
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 254
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.pedido_id_pedido_seq', 2, true);


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 256
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 258
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.veiculo_id_veiculo_seq', 1, true);


--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 260
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 262
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 264
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 266
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 268
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 270
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 4975 (class 2606 OID 35272)
-- Name: cliente cliente_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cpf_key UNIQUE (cpf);


--
-- TOC entry 4977 (class 2606 OID 35274)
-- Name: cliente cliente_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);


--
-- TOC entry 4979 (class 2606 OID 35270)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4959 (class 2606 OID 35214)
-- Name: grupo grupo_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_nome_key UNIQUE (nome);


--
-- TOC entry 4961 (class 2606 OID 35212)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 4969 (class 2606 OID 35251)
-- Name: motorista motorista_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_key UNIQUE (id_usuario);


--
-- TOC entry 4971 (class 2606 OID 35253)
-- Name: motorista motorista_numero_cnh_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_numero_cnh_key UNIQUE (numero_cnh);


--
-- TOC entry 4973 (class 2606 OID 35249)
-- Name: motorista motorista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_pkey PRIMARY KEY (id_motorista);


--
-- TOC entry 4951 (class 2606 OID 35201)
-- Name: transportadora transportadora_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 4953 (class 2606 OID 35203)
-- Name: transportadora transportadora_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_email_key UNIQUE (email);


--
-- TOC entry 4955 (class 2606 OID 35199)
-- Name: transportadora transportadora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_pkey PRIMARY KEY (id);


--
-- TOC entry 4957 (class 2606 OID 35205)
-- Name: transportadora transportadora_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_schema_name_key UNIQUE (schema_name);


--
-- TOC entry 4963 (class 2606 OID 35228)
-- Name: usuarios usuarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cpf_key UNIQUE (cpf);


--
-- TOC entry 4965 (class 2606 OID 35230)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 4967 (class 2606 OID 35226)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4981 (class 2606 OID 35570)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 4983 (class 2606 OID 35572)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4985 (class 2606 OID 35574)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 4987 (class 2606 OID 35576)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 4989 (class 2606 OID 35578)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 4991 (class 2606 OID 35580)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 4993 (class 2606 OID 35582)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 4995 (class 2606 OID 35584)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 4997 (class 2606 OID 35586)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4999 (class 2606 OID 35588)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5001 (class 2606 OID 35590)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5003 (class 2606 OID 35592)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5005 (class 2606 OID 35594)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5007 (class 2606 OID 35596)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5009 (class 2606 OID 35598)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5011 (class 2606 OID 35600)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5013 (class 2606 OID 35602)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5015 (class 2606 OID 35604)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5017 (class 2606 OID 35606)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5019 (class 2606 OID 35608)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5021 (class 2606 OID 35610)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5023 (class 2606 OID 35612)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5025 (class 2606 OID 35614)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5027 (class 2606 OID 35616)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5029 (class 2606 OID 35618)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5031 (class 2606 OID 35620)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5033 (class 2606 OID 35622)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5035 (class 2606 OID 35624)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5038 (class 2606 OID 35254)
-- Name: motorista motorista_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5036 (class 2606 OID 35231)
-- Name: usuarios usuarios_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 5037 (class 2606 OID 35236)
-- Name: usuarios usuarios_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5039 (class 2606 OID 35625)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5040 (class 2606 OID 35630)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_feia.pedido(id_pedido);


--
-- TOC entry 5041 (class 2606 OID 35635)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_feia.veiculo(id_veiculo);


--
-- TOC entry 5046 (class 2606 OID 35640)
-- Name: veiculo fk_veiculo_motorista; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT fk_veiculo_motorista FOREIGN KEY (id_motorista) REFERENCES public.motorista(id_usuario);


--
-- TOC entry 5042 (class 2606 OID 35645)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5043 (class 2606 OID 35650)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5044 (class 2606 OID 35655)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_feia.tipo_carga(tipo);


--
-- TOC entry 5045 (class 2606 OID 35660)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5047 (class 2606 OID 35665)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_feia.carregamento(id_carregamento);


--
-- TOC entry 5048 (class 2606 OID 35670)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5049 (class 2606 OID 35675)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_feia.veiculo(id_veiculo);


--
-- TOC entry 5050 (class 2606 OID 35680)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5051 (class 2606 OID 35685)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_inteligente.pedido(id_pedido);


--
-- TOC entry 5052 (class 2606 OID 35690)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_inteligente.veiculo(id_veiculo);


--
-- TOC entry 5057 (class 2606 OID 35695)
-- Name: veiculo fk_veiculo_motorista; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT fk_veiculo_motorista FOREIGN KEY (id_motorista) REFERENCES public.motorista(id_usuario);


--
-- TOC entry 5053 (class 2606 OID 35700)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5054 (class 2606 OID 35705)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5055 (class 2606 OID 35710)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_inteligente.tipo_carga(tipo);


--
-- TOC entry 5056 (class 2606 OID 35715)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5058 (class 2606 OID 35720)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_inteligente.carregamento(id_carregamento);


--
-- TOC entry 5059 (class 2606 OID 35725)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5060 (class 2606 OID 35730)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_inteligente.veiculo(id_veiculo);


--
-- TOC entry 5061 (class 2606 OID 35735)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5062 (class 2606 OID 35740)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_legal.pedido(id_pedido);


--
-- TOC entry 5063 (class 2606 OID 35745)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_legal.veiculo(id_veiculo);


--
-- TOC entry 5064 (class 2606 OID 35750)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5065 (class 2606 OID 35755)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5066 (class 2606 OID 35760)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_legal.tipo_carga(tipo);


--
-- TOC entry 5067 (class 2606 OID 35765)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5068 (class 2606 OID 35770)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_legal.carregamento(id_carregamento);


--
-- TOC entry 5069 (class 2606 OID 35775)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5070 (class 2606 OID 35780)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_legal.veiculo(id_veiculo);


--
-- TOC entry 5071 (class 2606 OID 35785)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5072 (class 2606 OID 35790)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_paia.pedido(id_pedido);


--
-- TOC entry 5073 (class 2606 OID 35795)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_paia.veiculo(id_veiculo);


--
-- TOC entry 5074 (class 2606 OID 35800)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5075 (class 2606 OID 35805)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5076 (class 2606 OID 35810)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_paia.tipo_carga(tipo);


--
-- TOC entry 5077 (class 2606 OID 35815)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5078 (class 2606 OID 35820)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_paia.carregamento(id_carregamento);


--
-- TOC entry 5079 (class 2606 OID 35825)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5080 (class 2606 OID 35830)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_paia.veiculo(id_veiculo);


--
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-10-31 11:58:06

--
-- PostgreSQL database dump complete
--

