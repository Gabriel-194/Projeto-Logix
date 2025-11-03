--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-03 11:16:22

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
-- TOC entry 9 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 5 (class 2615 OID 35931)
-- Name: transp_feia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_feia;


ALTER SCHEMA transp_feia OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 35932)
-- Name: transp_inteligente; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_inteligente;


ALTER SCHEMA transp_inteligente OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 35933)
-- Name: transp_legal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_legal;


ALTER SCHEMA transp_legal OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 35934)
-- Name: transp_paia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_paia;


ALTER SCHEMA transp_paia OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 35935)
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
-- TOC entry 222 (class 1259 OID 35943)
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
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 222
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- TOC entry 223 (class 1259 OID 35944)
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo (
    id_grupo integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 35947)
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
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 224
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_id_grupo_seq OWNED BY public.grupo.id_grupo;


--
-- TOC entry 225 (class 1259 OID 35948)
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
-- TOC entry 226 (class 1259 OID 35953)
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
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 226
-- Name: motorista_id_motorista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.motorista_id_motorista_seq OWNED BY public.motorista.id_motorista;


--
-- TOC entry 227 (class 1259 OID 35954)
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
-- TOC entry 228 (class 1259 OID 35960)
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
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 228
-- Name: transportadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transportadora_id_seq OWNED BY public.transportadora.id;


--
-- TOC entry 229 (class 1259 OID 35961)
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
-- TOC entry 230 (class 1259 OID 35969)
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
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 230
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 231 (class 1259 OID 35970)
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
-- TOC entry 232 (class 1259 OID 35976)
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
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 232
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.carregamento_id_carregamento_seq OWNED BY transp_feia.carregamento.id_carregamento;


--
-- TOC entry 233 (class 1259 OID 35977)
-- Name: mensagemcliente; Type: TABLE; Schema: transp_feia; Owner: postgres
--

CREATE TABLE transp_feia.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE transp_feia.mensagemcliente OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 35980)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: transp_feia; Owner: postgres
--

CREATE SEQUENCE transp_feia.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_feia.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 234
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.mensagemcliente_id_mensagem_seq OWNED BY transp_feia.mensagemcliente.id_mensagem;


--
-- TOC entry 235 (class 1259 OID 35981)
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
-- TOC entry 236 (class 1259 OID 35989)
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
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 236
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.pedido_id_pedido_seq OWNED BY transp_feia.pedido.id_pedido;


--
-- TOC entry 237 (class 1259 OID 35990)
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
-- TOC entry 238 (class 1259 OID 35993)
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
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.tipo_carga_id_carga_seq OWNED BY transp_feia.tipo_carga.id_carga;


--
-- TOC entry 239 (class 1259 OID 35994)
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
-- TOC entry 240 (class 1259 OID 36000)
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
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 240
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.veiculo_id_veiculo_seq OWNED BY transp_feia.veiculo.id_veiculo;


--
-- TOC entry 241 (class 1259 OID 36001)
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
-- TOC entry 242 (class 1259 OID 36007)
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
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 242
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.viagem_id_viagem_seq OWNED BY transp_feia.viagem.id_viagem;


--
-- TOC entry 243 (class 1259 OID 36008)
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
-- TOC entry 244 (class 1259 OID 36014)
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
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 244
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.carregamento_id_carregamento_seq OWNED BY transp_inteligente.carregamento.id_carregamento;


--
-- TOC entry 245 (class 1259 OID 36015)
-- Name: mensagemcliente; Type: TABLE; Schema: transp_inteligente; Owner: postgres
--

CREATE TABLE transp_inteligente.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE transp_inteligente.mensagemcliente OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 36018)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: transp_inteligente; Owner: postgres
--

CREATE SEQUENCE transp_inteligente.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_inteligente.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 246
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.mensagemcliente_id_mensagem_seq OWNED BY transp_inteligente.mensagemcliente.id_mensagem;


--
-- TOC entry 247 (class 1259 OID 36019)
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
-- TOC entry 248 (class 1259 OID 36027)
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
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 248
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.pedido_id_pedido_seq OWNED BY transp_inteligente.pedido.id_pedido;


--
-- TOC entry 249 (class 1259 OID 36028)
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
-- TOC entry 250 (class 1259 OID 36031)
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
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 250
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.tipo_carga_id_carga_seq OWNED BY transp_inteligente.tipo_carga.id_carga;


--
-- TOC entry 251 (class 1259 OID 36032)
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
-- TOC entry 252 (class 1259 OID 36038)
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
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 252
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.veiculo_id_veiculo_seq OWNED BY transp_inteligente.veiculo.id_veiculo;


--
-- TOC entry 253 (class 1259 OID 36039)
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
-- TOC entry 254 (class 1259 OID 36045)
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
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 254
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.viagem_id_viagem_seq OWNED BY transp_inteligente.viagem.id_viagem;


--
-- TOC entry 255 (class 1259 OID 36046)
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
-- TOC entry 256 (class 1259 OID 36052)
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
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 256
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.carregamento_id_carregamento_seq OWNED BY transp_legal.carregamento.id_carregamento;


--
-- TOC entry 257 (class 1259 OID 36053)
-- Name: mensagemcliente; Type: TABLE; Schema: transp_legal; Owner: postgres
--

CREATE TABLE transp_legal.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE transp_legal.mensagemcliente OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 36056)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: transp_legal; Owner: postgres
--

CREATE SEQUENCE transp_legal.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_legal.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 258
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.mensagemcliente_id_mensagem_seq OWNED BY transp_legal.mensagemcliente.id_mensagem;


--
-- TOC entry 259 (class 1259 OID 36057)
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
-- TOC entry 260 (class 1259 OID 36065)
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
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 260
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.pedido_id_pedido_seq OWNED BY transp_legal.pedido.id_pedido;


--
-- TOC entry 261 (class 1259 OID 36066)
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
-- TOC entry 262 (class 1259 OID 36069)
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
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.tipo_carga_id_carga_seq OWNED BY transp_legal.tipo_carga.id_carga;


--
-- TOC entry 263 (class 1259 OID 36070)
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
-- TOC entry 264 (class 1259 OID 36076)
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
-- TOC entry 5356 (class 0 OID 0)
-- Dependencies: 264
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.veiculo_id_veiculo_seq OWNED BY transp_legal.veiculo.id_veiculo;


--
-- TOC entry 265 (class 1259 OID 36077)
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
-- TOC entry 266 (class 1259 OID 36083)
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
-- TOC entry 5357 (class 0 OID 0)
-- Dependencies: 266
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.viagem_id_viagem_seq OWNED BY transp_legal.viagem.id_viagem;


--
-- TOC entry 267 (class 1259 OID 36084)
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
-- TOC entry 268 (class 1259 OID 36090)
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
-- TOC entry 5358 (class 0 OID 0)
-- Dependencies: 268
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.carregamento_id_carregamento_seq OWNED BY transp_paia.carregamento.id_carregamento;


--
-- TOC entry 269 (class 1259 OID 36091)
-- Name: mensagemcliente; Type: TABLE; Schema: transp_paia; Owner: postgres
--

CREATE TABLE transp_paia.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE transp_paia.mensagemcliente OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 36094)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: transp_paia; Owner: postgres
--

CREATE SEQUENCE transp_paia.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transp_paia.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5359 (class 0 OID 0)
-- Dependencies: 270
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.mensagemcliente_id_mensagem_seq OWNED BY transp_paia.mensagemcliente.id_mensagem;


--
-- TOC entry 271 (class 1259 OID 36095)
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
-- TOC entry 272 (class 1259 OID 36103)
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
-- TOC entry 5360 (class 0 OID 0)
-- Dependencies: 272
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.pedido_id_pedido_seq OWNED BY transp_paia.pedido.id_pedido;


--
-- TOC entry 273 (class 1259 OID 36104)
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
-- TOC entry 274 (class 1259 OID 36107)
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
-- TOC entry 5361 (class 0 OID 0)
-- Dependencies: 274
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.tipo_carga_id_carga_seq OWNED BY transp_paia.tipo_carga.id_carga;


--
-- TOC entry 275 (class 1259 OID 36108)
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
-- TOC entry 276 (class 1259 OID 36114)
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
-- TOC entry 5362 (class 0 OID 0)
-- Dependencies: 276
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.veiculo_id_veiculo_seq OWNED BY transp_paia.veiculo.id_veiculo;


--
-- TOC entry 277 (class 1259 OID 36115)
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
-- TOC entry 278 (class 1259 OID 36121)
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
-- TOC entry 5363 (class 0 OID 0)
-- Dependencies: 278
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.viagem_id_viagem_seq OWNED BY transp_paia.viagem.id_viagem;


--
-- TOC entry 4886 (class 2604 OID 36122)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4890 (class 2604 OID 36123)
-- Name: grupo id_grupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id_grupo SET DEFAULT nextval('public.grupo_id_grupo_seq'::regclass);


--
-- TOC entry 4891 (class 2604 OID 36124)
-- Name: motorista id_motorista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista ALTER COLUMN id_motorista SET DEFAULT nextval('public.motorista_id_motorista_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 36125)
-- Name: transportadora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora ALTER COLUMN id SET DEFAULT nextval('public.transportadora_id_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 36126)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 36127)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_feia.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 36128)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_feia.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 36129)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_feia.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 36130)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_feia.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 36131)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_feia.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 36132)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_feia.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 36133)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_inteligente.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 36134)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_inteligente.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 36135)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_inteligente.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 36136)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_inteligente.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4930 (class 2604 OID 36137)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_inteligente.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4934 (class 2604 OID 36138)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_inteligente.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 36139)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_legal.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 36140)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_legal.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 36141)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_legal.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 36142)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_legal.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 36143)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_legal.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 36144)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_legal.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 36145)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_paia.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 36146)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_paia.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 36147)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_paia.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 36148)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_paia.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 36149)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_paia.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 36150)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_paia.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 5270 (class 0 OID 35935)
-- Dependencies: 221
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nome, cpf, telefone, email, data_cadastro, data_atualizacao, ativo, cep, estado, municipio, endereco, numero, senha_hash) FROM stdin;
1	gui	123.125.123-12	 (41) 23123-1251	gui@gmail.com	2025-10-29 17:00:57.239227	2025-10-29 17:00:57.239227	t	81.560-280	PR	Curitiba	Rua Agostinho Ângelo Trevisan	321	$2a$11$8n6bWanJqLSRgQiLqn4G1O8N27mABnrCNFdx0LnBaQmTsnxAdt71q
\.


--
-- TOC entry 5272 (class 0 OID 35944)
-- Dependencies: 223
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupo (id_grupo, nome) FROM stdin;
1	Admin
2	Gerente
3	Carregador
4	Motorista
\.


--
-- TOC entry 5274 (class 0 OID 35948)
-- Dependencies: 225
-- Data for Name: motorista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.motorista (id_motorista, id_usuario, numero_cnh, categoria_cnh, validade_cnh, data_cadastro, data_atualizacao) FROM stdin;
2	10	12315413412	D	2029-12-25	2025-10-31 15:57:55.286349	2025-10-31 15:57:55.286349
\.


--
-- TOC entry 5276 (class 0 OID 35954)
-- Dependencies: 227
-- Data for Name: transportadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportadora (id, nome, cnpj, telefone, email, cep, ativo, schema_name, data_cadastro, data_atualizacao) FROM stdin;
1	transp Legal	98.798.465/4321-02	 (31) 24124-1243	trasnpLegal@gmail.com	32.165-546	t	transp_legal	2025-10-29 13:53:46.593846	2025-10-29 13:53:46.593846
3	transp paia	31.231.241/2423-51	 (41) 23123-1351	transpPaia@gmail.com	32.164-654	t	transp_paia	2025-10-29 13:56:29.265154	2025-10-29 13:56:29.265154
4	transp inteligente	31.231.342/3526-12	 (41) 23125-2346	transpInteligente@gmail.com	81.965-132	t	transp_inteligente	2025-10-29 14:00:36.614053	2025-10-29 14:00:36.614053
5	transp feia	32.165.846/4797-98	 (41) 23123-1423	transpFeia@gmail.com	41.231-231	t	transp_feia	2025-10-29 14:03:53.839762	2025-10-29 14:03:53.839762
\.


--
-- TOC entry 5278 (class 0 OID 35961)
-- Dependencies: 229
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nome, senha_hash, cpf, telefone, email, cargo_descricao, id_grupo, ativo, id_transportadora, data_cadastro, data_atualizacao) FROM stdin;
1	administrador logix	$2a$11$LDeqorZd6gz4j1Hif0aRjO2.lkdIKEvEW4sy9tkdUdIhrxJE8Qcb.	000.000.000-00	\N	LogixAdmin@gmail.com	adminLogix	\N	t	\N	2025-10-31 09:47:55.468362	2025-10-31 09:47:55.468362
7	jota@gmail.com	$2a$12$XMtpzpe4rUIqTscPHoPhsOcx5m.t3o7MbGSzDhugC181fD1ofgunq	123.124.123-12	 (41) 23152-3423	jota@gmail.com	ADMIN	1	t	1	2025-10-31 15:55:48.539888	2025-10-31 15:55:48.539888
8	kuchma	$2a$12$2w0QsoDRN1lCRfycQOYNp.uKkABCERjWn23ThEXUxfOVyRatHx3n.	312.313.521-54	 (51) 24114-2312	kuchma@gmail.com	ADMIN	1	t	4	2025-10-31 15:56:16.910181	2025-10-31 15:56:16.910181
9	kauan@gmail.com	$2a$12$CcUEEnUU6V4UFtqMx65pVeifW4/Wy1FLrY42ojATL9VXidERh8wGa	412.312.421-35	 (41) 23123-1352	kauan@gmail.com	gerente	2	t	1	2025-10-31 15:56:55.361474	2025-10-31 15:56:55.361474
10	sergio1	$2a$12$joSn6qG6xGAAl6zCu3CUGeDQQ80iGf8bc2Lv7kFBzlPiuRWQb75Cu	312.413.413-51	 (12) 31251-3556	sergio@gmail.com	motorista	4	t	1	2025-10-31 15:57:55.286349	2025-10-31 15:57:55.286349
11	lucas	$2a$12$4of8GXrRwVvplB6CQbx71.yWl9H8Eg/wTeFrHczdOIL9jnCII8Hba	312.135.421-53	 (12) 41241-2354	lucas@gmail.com	Carregador	3	t	1	2025-10-31 15:58:14.1281	2025-10-31 15:58:14.1281
\.


--
-- TOC entry 5280 (class 0 OID 35970)
-- Dependencies: 231
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5282 (class 0 OID 35977)
-- Dependencies: 233
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5284 (class 0 OID 35981)
-- Dependencies: 235
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5286 (class 0 OID 35990)
-- Dependencies: 237
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Refrigerada	5.00	5
2	Líquida	8.00	5
\.


--
-- TOC entry 5288 (class 0 OID 35994)
-- Dependencies: 239
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, id_motorista, status) FROM stdin;
\.


--
-- TOC entry 5290 (class 0 OID 36001)
-- Dependencies: 241
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5292 (class 0 OID 36008)
-- Dependencies: 243
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5294 (class 0 OID 36015)
-- Dependencies: 245
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5296 (class 0 OID 36019)
-- Dependencies: 247
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5298 (class 0 OID 36028)
-- Dependencies: 249
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	5.00	4
2	Refrigerada	6.50	4
3	Líquida	7.50	4
4	Gás	8.50	4
\.


--
-- TOC entry 5300 (class 0 OID 36032)
-- Dependencies: 251
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, id_motorista, status) FROM stdin;
\.


--
-- TOC entry 5302 (class 0 OID 36039)
-- Dependencies: 253
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5304 (class 0 OID 36046)
-- Dependencies: 255
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
1	1	1	11	2025-10-31 16:04:26.197329	2025-10-31 16:05:43.676953	Pronto	2025-10-31 16:02:20.677	2025-10-31 16:02:20.678225
\.


--
-- TOC entry 5306 (class 0 OID 36053)
-- Dependencies: 257
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
1	1	1	1	2025-10-31 16:04:26.199607	O carregamento foi iniciado para o pedido 1
2	1	1	1	2025-10-31 16:05:43.678133	O carregamento foi finalizado para o pedido 1
3	1	1	1	2025-11-03 10:50:45.810134	A viagem foi iniciado para o pedido #1
4	1	1	1	2025-11-03 10:51:30.45513	A viagem foi iniciado para o pedido #1
\.


--
-- TOC entry 5308 (class 0 OID 36057)
-- Dependencies: 259
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
2	1	01.001-000	SP	São Paulo	Praça da Sé	13	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	408	2025-10-31 10:17:48.935231	5000	Seca	2883.28	1	Cancelado	f	motivo não informado	2025-10-31 11:28:05.802006
1	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	123	409	2025-10-31 09:52:57.373734	5000	Seca	2890.07	1	Finalizado	t	\N	2025-11-03 10:51:30.45373
\.


--
-- TOC entry 5310 (class 0 OID 36066)
-- Dependencies: 261
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	5.00	1
2	Refrigerada	6.00	1
\.


--
-- TOC entry 5312 (class 0 OID 36070)
-- Dependencies: 263
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
1	ASD1S41	HR	2025	Seca	5000	Quilograma (KG)	t	2025-10-29 16:24:09.623977-03	2025-10-29 16:24:09.623977-03	disponivel
2	DAS1R23	HR	2025	Refrigerada	5000	Quilograma (KG)	t	2025-10-31 15:58:33.999475-03	2025-10-31 15:59:33.10402-03	disponivel
\.


--
-- TOC entry 5314 (class 0 OID 36077)
-- Dependencies: 265
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
1	1	1	10	2025-11-03 10:50:45.801239	2025-11-03 10:51:30.449366	Finalizada	2025-11-03 09:46:24.344	2025-11-03 09:46:24.345462	409
\.


--
-- TOC entry 5316 (class 0 OID 36084)
-- Dependencies: 267
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5318 (class 0 OID 36091)
-- Dependencies: 269
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5320 (class 0 OID 36095)
-- Dependencies: 271
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5322 (class 0 OID 36104)
-- Dependencies: 273
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Líquida	7.00	3
2	Gás	6.00	3
\.


--
-- TOC entry 5324 (class 0 OID 36108)
-- Dependencies: 275
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
\.


--
-- TOC entry 5326 (class 0 OID 36115)
-- Dependencies: 277
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5364 (class 0 OID 0)
-- Dependencies: 222
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, true);


--
-- TOC entry 5365 (class 0 OID 0)
-- Dependencies: 224
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_id_grupo_seq', 4, true);


--
-- TOC entry 5366 (class 0 OID 0)
-- Dependencies: 226
-- Name: motorista_id_motorista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.motorista_id_motorista_seq', 2, true);


--
-- TOC entry 5367 (class 0 OID 0)
-- Dependencies: 228
-- Name: transportadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transportadora_id_seq', 5, true);


--
-- TOC entry 5368 (class 0 OID 0)
-- Dependencies: 230
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 11, true);


--
-- TOC entry 5369 (class 0 OID 0)
-- Dependencies: 232
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 234
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 236
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 240
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 242
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 244
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 246
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 248
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 250
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.tipo_carga_id_carga_seq', 4, true);


--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 252
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 254
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 256
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.carregamento_id_carregamento_seq', 1, true);


--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 258
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.mensagemcliente_id_mensagem_seq', 4, true);


--
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 260
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.pedido_id_pedido_seq', 2, true);


--
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 264
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.veiculo_id_veiculo_seq', 2, true);


--
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 266
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.viagem_id_viagem_seq', 1, true);


--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 268
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 270
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 272
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 274
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 276
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 278
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 4975 (class 2606 OID 36152)
-- Name: cliente cliente_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cpf_key UNIQUE (cpf);


--
-- TOC entry 4977 (class 2606 OID 36154)
-- Name: cliente cliente_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);


--
-- TOC entry 4979 (class 2606 OID 36156)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4981 (class 2606 OID 36158)
-- Name: grupo grupo_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_nome_key UNIQUE (nome);


--
-- TOC entry 4983 (class 2606 OID 36160)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 4985 (class 2606 OID 36162)
-- Name: motorista motorista_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_key UNIQUE (id_usuario);


--
-- TOC entry 4987 (class 2606 OID 36164)
-- Name: motorista motorista_numero_cnh_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_numero_cnh_key UNIQUE (numero_cnh);


--
-- TOC entry 4989 (class 2606 OID 36166)
-- Name: motorista motorista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_pkey PRIMARY KEY (id_motorista);


--
-- TOC entry 4991 (class 2606 OID 36168)
-- Name: transportadora transportadora_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 4993 (class 2606 OID 36170)
-- Name: transportadora transportadora_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_email_key UNIQUE (email);


--
-- TOC entry 4995 (class 2606 OID 36172)
-- Name: transportadora transportadora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_pkey PRIMARY KEY (id);


--
-- TOC entry 4997 (class 2606 OID 36174)
-- Name: transportadora transportadora_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_schema_name_key UNIQUE (schema_name);


--
-- TOC entry 4999 (class 2606 OID 36176)
-- Name: usuarios usuarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cpf_key UNIQUE (cpf);


--
-- TOC entry 5001 (class 2606 OID 36178)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 5003 (class 2606 OID 36180)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 5005 (class 2606 OID 36182)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5007 (class 2606 OID 36184)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5009 (class 2606 OID 36186)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5011 (class 2606 OID 36188)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5013 (class 2606 OID 36190)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5015 (class 2606 OID 36192)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5017 (class 2606 OID 36194)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5019 (class 2606 OID 36196)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5021 (class 2606 OID 36198)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5023 (class 2606 OID 36200)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5025 (class 2606 OID 36202)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5027 (class 2606 OID 36204)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5029 (class 2606 OID 36206)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5031 (class 2606 OID 36208)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5033 (class 2606 OID 36210)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5035 (class 2606 OID 36212)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5037 (class 2606 OID 36214)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5039 (class 2606 OID 36216)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5041 (class 2606 OID 36218)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5043 (class 2606 OID 36220)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5045 (class 2606 OID 36222)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5047 (class 2606 OID 36224)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5049 (class 2606 OID 36226)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5051 (class 2606 OID 36228)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5053 (class 2606 OID 36230)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5055 (class 2606 OID 36232)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5057 (class 2606 OID 36234)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5059 (class 2606 OID 36236)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5061 (class 2606 OID 36238)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5063 (class 2606 OID 36240)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5065 (class 2606 OID 36242)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5067 (class 2606 OID 36244)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5068 (class 2606 OID 36245)
-- Name: motorista motorista_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5069 (class 2606 OID 36250)
-- Name: usuarios usuarios_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 5070 (class 2606 OID 36255)
-- Name: usuarios usuarios_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5071 (class 2606 OID 36260)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5072 (class 2606 OID 36265)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_feia.pedido(id_pedido);


--
-- TOC entry 5073 (class 2606 OID 36270)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_feia.veiculo(id_veiculo);


--
-- TOC entry 5074 (class 2606 OID 36275)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5075 (class 2606 OID 36280)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_feia.pedido(id_pedido);


--
-- TOC entry 5076 (class 2606 OID 36285)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5081 (class 2606 OID 36290)
-- Name: veiculo fk_veiculo_motorista; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT fk_veiculo_motorista FOREIGN KEY (id_motorista) REFERENCES public.motorista(id_usuario);


--
-- TOC entry 5077 (class 2606 OID 36295)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5078 (class 2606 OID 36300)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5079 (class 2606 OID 36305)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_feia.tipo_carga(tipo);


--
-- TOC entry 5080 (class 2606 OID 36310)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5082 (class 2606 OID 36315)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_feia.carregamento(id_carregamento);


--
-- TOC entry 5083 (class 2606 OID 36320)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5084 (class 2606 OID 36325)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_feia.veiculo(id_veiculo);


--
-- TOC entry 5085 (class 2606 OID 36330)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5086 (class 2606 OID 36335)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_inteligente.pedido(id_pedido);


--
-- TOC entry 5087 (class 2606 OID 36340)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_inteligente.veiculo(id_veiculo);


--
-- TOC entry 5088 (class 2606 OID 36345)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5089 (class 2606 OID 36350)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_inteligente.pedido(id_pedido);


--
-- TOC entry 5090 (class 2606 OID 36355)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5095 (class 2606 OID 36360)
-- Name: veiculo fk_veiculo_motorista; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT fk_veiculo_motorista FOREIGN KEY (id_motorista) REFERENCES public.motorista(id_usuario);


--
-- TOC entry 5091 (class 2606 OID 36365)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5092 (class 2606 OID 36370)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5093 (class 2606 OID 36375)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_inteligente.tipo_carga(tipo);


--
-- TOC entry 5094 (class 2606 OID 36380)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5096 (class 2606 OID 36385)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_inteligente.carregamento(id_carregamento);


--
-- TOC entry 5097 (class 2606 OID 36390)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5098 (class 2606 OID 36395)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_inteligente.veiculo(id_veiculo);


--
-- TOC entry 5099 (class 2606 OID 36400)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5100 (class 2606 OID 36405)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_legal.pedido(id_pedido);


--
-- TOC entry 5101 (class 2606 OID 36410)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_legal.veiculo(id_veiculo);


--
-- TOC entry 5102 (class 2606 OID 36415)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5103 (class 2606 OID 36420)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_legal.pedido(id_pedido);


--
-- TOC entry 5104 (class 2606 OID 36425)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5105 (class 2606 OID 36430)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5106 (class 2606 OID 36435)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5107 (class 2606 OID 36440)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_legal.tipo_carga(tipo);


--
-- TOC entry 5108 (class 2606 OID 36445)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5109 (class 2606 OID 36450)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_legal.carregamento(id_carregamento);


--
-- TOC entry 5110 (class 2606 OID 36455)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5111 (class 2606 OID 36460)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_legal.veiculo(id_veiculo);


--
-- TOC entry 5112 (class 2606 OID 36465)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5113 (class 2606 OID 36470)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_paia.pedido(id_pedido);


--
-- TOC entry 5114 (class 2606 OID 36475)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_paia.veiculo(id_veiculo);


--
-- TOC entry 5115 (class 2606 OID 36480)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5116 (class 2606 OID 36485)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_paia.pedido(id_pedido);


--
-- TOC entry 5117 (class 2606 OID 36490)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5118 (class 2606 OID 36495)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5119 (class 2606 OID 36500)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5120 (class 2606 OID 36505)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_paia.tipo_carga(tipo);


--
-- TOC entry 5121 (class 2606 OID 36510)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5122 (class 2606 OID 36515)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_paia.carregamento(id_carregamento);


--
-- TOC entry 5123 (class 2606 OID 36520)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5124 (class 2606 OID 36525)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_paia.veiculo(id_veiculo);


--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-11-03 11:16:22

--
-- PostgreSQL database dump complete
--

