--
-- PostgreSQL database dump
--

\restrict n0qduYbLEa4yyiRpeSSG3TF2XqsmTLTsHMTgGv6nu2KqxcFqCwvNNcwnDYalQVy

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-10-31 17:41:07

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
-- TOC entry 5403 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 5 (class 2615 OID 26515)
-- Name: transp_feia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_feia;


ALTER SCHEMA transp_feia OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 26516)
-- Name: transp_inteligente; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_inteligente;


ALTER SCHEMA transp_inteligente OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 26517)
-- Name: transp_legal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_legal;


ALTER SCHEMA transp_legal OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 26518)
-- Name: transp_paia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transp_paia;


ALTER SCHEMA transp_paia OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 26519)
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
-- TOC entry 224 (class 1259 OID 26532)
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
-- TOC entry 5405 (class 0 OID 0)
-- Dependencies: 224
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- TOC entry 225 (class 1259 OID 26533)
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo (
    id_grupo integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 26538)
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
-- TOC entry 5406 (class 0 OID 0)
-- Dependencies: 226
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_id_grupo_seq OWNED BY public.grupo.id_grupo;


--
-- TOC entry 227 (class 1259 OID 26539)
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
-- TOC entry 228 (class 1259 OID 26549)
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
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 228
-- Name: motorista_id_motorista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.motorista_id_motorista_seq OWNED BY public.motorista.id_motorista;


--
-- TOC entry 229 (class 1259 OID 26550)
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
-- TOC entry 230 (class 1259 OID 26560)
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
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 230
-- Name: transportadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transportadora_id_seq OWNED BY public.transportadora.id;


--
-- TOC entry 231 (class 1259 OID 26561)
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
-- TOC entry 232 (class 1259 OID 26574)
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
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 232
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 233 (class 1259 OID 26575)
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
-- TOC entry 234 (class 1259 OID 26585)
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
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 234
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.carregamento_id_carregamento_seq OWNED BY transp_feia.carregamento.id_carregamento;


--
-- TOC entry 276 (class 1259 OID 27140)
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
-- TOC entry 275 (class 1259 OID 27139)
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
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 275
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.mensagemcliente_id_mensagem_seq OWNED BY transp_feia.mensagemcliente.id_mensagem;


--
-- TOC entry 235 (class 1259 OID 26586)
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
-- TOC entry 236 (class 1259 OID 26598)
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
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 236
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.pedido_id_pedido_seq OWNED BY transp_feia.pedido.id_pedido;


--
-- TOC entry 237 (class 1259 OID 26599)
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
-- TOC entry 238 (class 1259 OID 26604)
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
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.tipo_carga_id_carga_seq OWNED BY transp_feia.tipo_carga.id_carga;


--
-- TOC entry 239 (class 1259 OID 26605)
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
-- TOC entry 240 (class 1259 OID 26613)
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
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 240
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.veiculo_id_veiculo_seq OWNED BY transp_feia.veiculo.id_veiculo;


--
-- TOC entry 241 (class 1259 OID 26614)
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
-- TOC entry 242 (class 1259 OID 26624)
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
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 242
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_feia; Owner: postgres
--

ALTER SEQUENCE transp_feia.viagem_id_viagem_seq OWNED BY transp_feia.viagem.id_viagem;


--
-- TOC entry 243 (class 1259 OID 26625)
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
-- TOC entry 244 (class 1259 OID 26635)
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
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 244
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.carregamento_id_carregamento_seq OWNED BY transp_inteligente.carregamento.id_carregamento;


--
-- TOC entry 278 (class 1259 OID 27167)
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
-- TOC entry 277 (class 1259 OID 27166)
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
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 277
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.mensagemcliente_id_mensagem_seq OWNED BY transp_inteligente.mensagemcliente.id_mensagem;


--
-- TOC entry 245 (class 1259 OID 26636)
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
-- TOC entry 246 (class 1259 OID 26648)
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
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 246
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.pedido_id_pedido_seq OWNED BY transp_inteligente.pedido.id_pedido;


--
-- TOC entry 247 (class 1259 OID 26649)
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
-- TOC entry 248 (class 1259 OID 26654)
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
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 248
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.tipo_carga_id_carga_seq OWNED BY transp_inteligente.tipo_carga.id_carga;


--
-- TOC entry 249 (class 1259 OID 26655)
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
-- TOC entry 250 (class 1259 OID 26663)
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
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 250
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.veiculo_id_veiculo_seq OWNED BY transp_inteligente.veiculo.id_veiculo;


--
-- TOC entry 251 (class 1259 OID 26664)
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
-- TOC entry 252 (class 1259 OID 26674)
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
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 252
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_inteligente; Owner: postgres
--

ALTER SEQUENCE transp_inteligente.viagem_id_viagem_seq OWNED BY transp_inteligente.viagem.id_viagem;


--
-- TOC entry 253 (class 1259 OID 26675)
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
-- TOC entry 254 (class 1259 OID 26685)
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
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 254
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.carregamento_id_carregamento_seq OWNED BY transp_legal.carregamento.id_carregamento;


--
-- TOC entry 274 (class 1259 OID 27113)
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
-- TOC entry 273 (class 1259 OID 27112)
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
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 273
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.mensagemcliente_id_mensagem_seq OWNED BY transp_legal.mensagemcliente.id_mensagem;


--
-- TOC entry 255 (class 1259 OID 26686)
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
-- TOC entry 256 (class 1259 OID 26698)
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
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 256
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.pedido_id_pedido_seq OWNED BY transp_legal.pedido.id_pedido;


--
-- TOC entry 257 (class 1259 OID 26699)
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
-- TOC entry 258 (class 1259 OID 26704)
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
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 258
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.tipo_carga_id_carga_seq OWNED BY transp_legal.tipo_carga.id_carga;


--
-- TOC entry 259 (class 1259 OID 26705)
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
-- TOC entry 260 (class 1259 OID 26713)
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
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 260
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.veiculo_id_veiculo_seq OWNED BY transp_legal.veiculo.id_veiculo;


--
-- TOC entry 261 (class 1259 OID 26714)
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
-- TOC entry 262 (class 1259 OID 26724)
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
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 262
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_legal; Owner: postgres
--

ALTER SEQUENCE transp_legal.viagem_id_viagem_seq OWNED BY transp_legal.viagem.id_viagem;


--
-- TOC entry 263 (class 1259 OID 26725)
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
-- TOC entry 264 (class 1259 OID 26735)
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
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 264
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.carregamento_id_carregamento_seq OWNED BY transp_paia.carregamento.id_carregamento;


--
-- TOC entry 280 (class 1259 OID 27194)
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
-- TOC entry 279 (class 1259 OID 27193)
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
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 279
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.mensagemcliente_id_mensagem_seq OWNED BY transp_paia.mensagemcliente.id_mensagem;


--
-- TOC entry 265 (class 1259 OID 26736)
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
-- TOC entry 266 (class 1259 OID 26748)
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
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 266
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.pedido_id_pedido_seq OWNED BY transp_paia.pedido.id_pedido;


--
-- TOC entry 267 (class 1259 OID 26749)
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
-- TOC entry 268 (class 1259 OID 26754)
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
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 268
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.tipo_carga_id_carga_seq OWNED BY transp_paia.tipo_carga.id_carga;


--
-- TOC entry 269 (class 1259 OID 26755)
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
-- TOC entry 270 (class 1259 OID 26763)
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
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 270
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.veiculo_id_veiculo_seq OWNED BY transp_paia.veiculo.id_veiculo;


--
-- TOC entry 271 (class 1259 OID 26764)
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
-- TOC entry 272 (class 1259 OID 26774)
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
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 272
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transp_paia; Owner: postgres
--

ALTER SEQUENCE transp_paia.viagem_id_viagem_seq OWNED BY transp_paia.viagem.id_viagem;


--
-- TOC entry 4954 (class 2604 OID 26775)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4958 (class 2604 OID 26776)
-- Name: grupo id_grupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id_grupo SET DEFAULT nextval('public.grupo_id_grupo_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 26777)
-- Name: motorista id_motorista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista ALTER COLUMN id_motorista SET DEFAULT nextval('public.motorista_id_motorista_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 26778)
-- Name: transportadora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora ALTER COLUMN id SET DEFAULT nextval('public.transportadora_id_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 26779)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 26780)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_feia.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 5039 (class 2604 OID 27143)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_feia.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 26781)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_feia.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4978 (class 2604 OID 26782)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_feia.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4979 (class 2604 OID 26783)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_feia.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4983 (class 2604 OID 26784)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_feia.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 26785)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_inteligente.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 5040 (class 2604 OID 27170)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_inteligente.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4991 (class 2604 OID 26786)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_inteligente.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4995 (class 2604 OID 26787)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_inteligente.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4996 (class 2604 OID 26788)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_inteligente.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 5000 (class 2604 OID 26789)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_inteligente.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 5004 (class 2604 OID 26790)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_legal.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 5038 (class 2604 OID 27116)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_legal.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 26791)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_legal.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 26792)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_legal.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 5013 (class 2604 OID 26793)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_legal.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 5017 (class 2604 OID 26794)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_legal.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 5021 (class 2604 OID 26795)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transp_paia.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 5041 (class 2604 OID 27197)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transp_paia.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 5025 (class 2604 OID 26796)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transp_paia.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 5029 (class 2604 OID 26797)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transp_paia.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 5030 (class 2604 OID 26798)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transp_paia.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 5034 (class 2604 OID 26799)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transp_paia.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 5340 (class 0 OID 26519)
-- Dependencies: 223
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nome, cpf, telefone, email, data_cadastro, data_atualizacao, ativo, cep, estado, municipio, endereco, numero, senha_hash) FROM stdin;
1	gui	123.125.123-12	 (41) 23123-1251	gui@gmail.com	2025-10-29 17:00:57.239227	2025-10-29 17:00:57.239227	t	81.560-280	PR	Curitiba	Rua Agostinho Ângelo Trevisan	321	$2a$11$8n6bWanJqLSRgQiLqn4G1O8N27mABnrCNFdx0LnBaQmTsnxAdt71q
\.


--
-- TOC entry 5342 (class 0 OID 26533)
-- Dependencies: 225
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupo (id_grupo, nome) FROM stdin;
1	Admin
2	Gerente
3	Carregador
4	Motorista
\.


--
-- TOC entry 5344 (class 0 OID 26539)
-- Dependencies: 227
-- Data for Name: motorista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.motorista (id_motorista, id_usuario, numero_cnh, categoria_cnh, validade_cnh, data_cadastro, data_atualizacao) FROM stdin;
2	10	12315413412	D	2029-12-25	2025-10-31 15:57:55.286349	2025-10-31 15:57:55.286349
\.


--
-- TOC entry 5346 (class 0 OID 26550)
-- Dependencies: 229
-- Data for Name: transportadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportadora (id, nome, cnpj, telefone, email, cep, ativo, schema_name, data_cadastro, data_atualizacao) FROM stdin;
1	transp Legal	98.798.465/4321-02	 (31) 24124-1243	trasnpLegal@gmail.com	32.165-546	t	transp_legal	2025-10-29 13:53:46.593846	2025-10-29 13:53:46.593846
3	transp paia	31.231.241/2423-51	 (41) 23123-1351	transpPaia@gmail.com	32.164-654	t	transp_paia	2025-10-29 13:56:29.265154	2025-10-29 13:56:29.265154
4	transp inteligente	31.231.342/3526-12	 (41) 23125-2346	transpInteligente@gmail.com	81.965-132	t	transp_inteligente	2025-10-29 14:00:36.614053	2025-10-29 14:00:36.614053
5	transp feia	32.165.846/4797-98	 (41) 23123-1423	transpFeia@gmail.com	41.231-231	t	transp_feia	2025-10-29 14:03:53.839762	2025-10-29 14:03:53.839762
\.


--
-- TOC entry 5348 (class 0 OID 26561)
-- Dependencies: 231
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
-- TOC entry 5350 (class 0 OID 26575)
-- Dependencies: 233
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5393 (class 0 OID 27140)
-- Dependencies: 276
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5352 (class 0 OID 26586)
-- Dependencies: 235
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5354 (class 0 OID 26599)
-- Dependencies: 237
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Refrigerada	5.00	5
2	Líquida	8.00	5
\.


--
-- TOC entry 5356 (class 0 OID 26605)
-- Dependencies: 239
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, id_motorista, status) FROM stdin;
\.


--
-- TOC entry 5358 (class 0 OID 26614)
-- Dependencies: 241
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_feia; Owner: postgres
--

COPY transp_feia.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5360 (class 0 OID 26625)
-- Dependencies: 243
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5395 (class 0 OID 27167)
-- Dependencies: 278
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5362 (class 0 OID 26636)
-- Dependencies: 245
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5364 (class 0 OID 26649)
-- Dependencies: 247
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	5.00	4
2	Refrigerada	6.50	4
3	Líquida	7.50	4
4	Gás	8.50	4
\.


--
-- TOC entry 5366 (class 0 OID 26655)
-- Dependencies: 249
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, id_motorista, status) FROM stdin;
\.


--
-- TOC entry 5368 (class 0 OID 26664)
-- Dependencies: 251
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_inteligente; Owner: postgres
--

COPY transp_inteligente.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5370 (class 0 OID 26675)
-- Dependencies: 253
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
1	1	1	11	2025-10-31 16:04:26.197329	2025-10-31 16:05:43.676953	Pronto	2025-10-31 16:02:20.677	2025-10-31 16:02:20.678225
\.


--
-- TOC entry 5391 (class 0 OID 27113)
-- Dependencies: 274
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
1	1	1	1	2025-10-31 16:04:26.199607	O carregamento foi iniciado para o pedido 1
2	1	1	1	2025-10-31 16:05:43.678133	O carregamento foi finalizado para o pedido 1
\.


--
-- TOC entry 5372 (class 0 OID 26686)
-- Dependencies: 255
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
2	1	01.001-000	SP	São Paulo	Praça da Sé	13	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	408	2025-10-31 10:17:48.935231	5000	Seca	2883.28	1	Cancelado	f	motivo não informado	2025-10-31 11:28:05.802006
1	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	123	409	2025-10-31 09:52:57.373734	5000	Seca	2890.07	1	Em preparo	t	\N	\N
\.


--
-- TOC entry 5374 (class 0 OID 26699)
-- Dependencies: 257
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	5.00	1
2	Refrigerada	6.00	1
\.


--
-- TOC entry 5376 (class 0 OID 26705)
-- Dependencies: 259
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
1	ASD1S41	HR	2025	Seca	5000	Quilograma (KG)	t	2025-10-29 16:24:09.623977-03	2025-10-29 16:24:09.623977-03	disponivel
2	DAS1R23	HR	2025	Refrigerada	5000	Quilograma (KG)	t	2025-10-31 15:58:33.999475-03	2025-10-31 15:59:33.10402-03	disponivel
\.


--
-- TOC entry 5378 (class 0 OID 26714)
-- Dependencies: 261
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_legal; Owner: postgres
--

COPY transp_legal.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5380 (class 0 OID 26725)
-- Dependencies: 263
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5397 (class 0 OID 27194)
-- Dependencies: 280
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5382 (class 0 OID 26736)
-- Dependencies: 265
-- Data for Name: pedido; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, motiv_cancelamento, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5384 (class 0 OID 26749)
-- Dependencies: 267
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Líquida	7.00	3
2	Gás	6.00	3
\.


--
-- TOC entry 5386 (class 0 OID 26755)
-- Dependencies: 269
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
\.


--
-- TOC entry 5388 (class 0 OID 26764)
-- Dependencies: 271
-- Data for Name: viagem; Type: TABLE DATA; Schema: transp_paia; Owner: postgres
--

COPY transp_paia.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 224
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, true);


--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 226
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_id_grupo_seq', 4, true);


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 228
-- Name: motorista_id_motorista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.motorista_id_motorista_seq', 2, true);


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 230
-- Name: transportadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transportadora_id_seq', 5, true);


--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 232
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 11, true);


--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 234
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 275
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 236
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 240
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 242
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_feia; Owner: postgres
--

SELECT pg_catalog.setval('transp_feia.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 244
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 277
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 246
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 248
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.tipo_carga_id_carga_seq', 4, true);


--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 250
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 252
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_inteligente; Owner: postgres
--

SELECT pg_catalog.setval('transp_inteligente.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 254
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.carregamento_id_carregamento_seq', 1, true);


--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 273
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.mensagemcliente_id_mensagem_seq', 2, true);


--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 256
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.pedido_id_pedido_seq', 2, true);


--
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 258
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 260
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.veiculo_id_veiculo_seq', 2, true);


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 262
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_legal; Owner: postgres
--

SELECT pg_catalog.setval('transp_legal.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 264
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 279
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 266
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.pedido_id_pedido_seq', 1, false);


--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 268
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 270
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.veiculo_id_veiculo_seq', 1, false);


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 272
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transp_paia; Owner: postgres
--

SELECT pg_catalog.setval('transp_paia.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5043 (class 2606 OID 26801)
-- Name: cliente cliente_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cpf_key UNIQUE (cpf);


--
-- TOC entry 5045 (class 2606 OID 26803)
-- Name: cliente cliente_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);


--
-- TOC entry 5047 (class 2606 OID 26805)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 5049 (class 2606 OID 26807)
-- Name: grupo grupo_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_nome_key UNIQUE (nome);


--
-- TOC entry 5051 (class 2606 OID 26809)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 5053 (class 2606 OID 26811)
-- Name: motorista motorista_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_key UNIQUE (id_usuario);


--
-- TOC entry 5055 (class 2606 OID 26813)
-- Name: motorista motorista_numero_cnh_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_numero_cnh_key UNIQUE (numero_cnh);


--
-- TOC entry 5057 (class 2606 OID 26815)
-- Name: motorista motorista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_pkey PRIMARY KEY (id_motorista);


--
-- TOC entry 5059 (class 2606 OID 26817)
-- Name: transportadora transportadora_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 5061 (class 2606 OID 26819)
-- Name: transportadora transportadora_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_email_key UNIQUE (email);


--
-- TOC entry 5063 (class 2606 OID 26821)
-- Name: transportadora transportadora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_pkey PRIMARY KEY (id);


--
-- TOC entry 5065 (class 2606 OID 26823)
-- Name: transportadora transportadora_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_schema_name_key UNIQUE (schema_name);


--
-- TOC entry 5067 (class 2606 OID 26825)
-- Name: usuarios usuarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cpf_key UNIQUE (cpf);


--
-- TOC entry 5069 (class 2606 OID 26827)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 5071 (class 2606 OID 26829)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 5073 (class 2606 OID 26831)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5131 (class 2606 OID 27150)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5075 (class 2606 OID 26833)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5077 (class 2606 OID 26835)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5079 (class 2606 OID 26837)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5081 (class 2606 OID 26839)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5083 (class 2606 OID 26841)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5085 (class 2606 OID 26843)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5087 (class 2606 OID 26845)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5133 (class 2606 OID 27177)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5089 (class 2606 OID 26847)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5091 (class 2606 OID 26849)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5093 (class 2606 OID 26851)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5095 (class 2606 OID 26853)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5097 (class 2606 OID 26855)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5099 (class 2606 OID 26857)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5101 (class 2606 OID 26859)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5129 (class 2606 OID 27123)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5103 (class 2606 OID 26861)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5105 (class 2606 OID 26863)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5107 (class 2606 OID 26865)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5109 (class 2606 OID 26867)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5111 (class 2606 OID 26869)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5113 (class 2606 OID 26871)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5115 (class 2606 OID 26873)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5135 (class 2606 OID 27204)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5117 (class 2606 OID 26875)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5119 (class 2606 OID 26877)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5121 (class 2606 OID 26879)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5123 (class 2606 OID 26881)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5125 (class 2606 OID 26883)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5127 (class 2606 OID 26885)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5136 (class 2606 OID 26886)
-- Name: motorista motorista_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5137 (class 2606 OID 26891)
-- Name: usuarios usuarios_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 5138 (class 2606 OID 26896)
-- Name: usuarios usuarios_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5139 (class 2606 OID 26901)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5140 (class 2606 OID 26906)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_feia.pedido(id_pedido);


--
-- TOC entry 5141 (class 2606 OID 26911)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_feia.veiculo(id_veiculo);


--
-- TOC entry 5184 (class 2606 OID 27161)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5185 (class 2606 OID 27151)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_feia.pedido(id_pedido);


--
-- TOC entry 5186 (class 2606 OID 27156)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5146 (class 2606 OID 26916)
-- Name: veiculo fk_veiculo_motorista; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.veiculo
    ADD CONSTRAINT fk_veiculo_motorista FOREIGN KEY (id_motorista) REFERENCES public.motorista(id_usuario);


--
-- TOC entry 5142 (class 2606 OID 26921)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5143 (class 2606 OID 26926)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5144 (class 2606 OID 26931)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_feia.tipo_carga(tipo);


--
-- TOC entry 5145 (class 2606 OID 26936)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5147 (class 2606 OID 26941)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_feia.carregamento(id_carregamento);


--
-- TOC entry 5148 (class 2606 OID 26946)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5149 (class 2606 OID 26951)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_feia; Owner: postgres
--

ALTER TABLE ONLY transp_feia.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_feia.veiculo(id_veiculo);


--
-- TOC entry 5150 (class 2606 OID 26956)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5151 (class 2606 OID 26961)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_inteligente.pedido(id_pedido);


--
-- TOC entry 5152 (class 2606 OID 26966)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_inteligente.veiculo(id_veiculo);


--
-- TOC entry 5187 (class 2606 OID 27188)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5188 (class 2606 OID 27178)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_inteligente.pedido(id_pedido);


--
-- TOC entry 5189 (class 2606 OID 27183)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5157 (class 2606 OID 26971)
-- Name: veiculo fk_veiculo_motorista; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.veiculo
    ADD CONSTRAINT fk_veiculo_motorista FOREIGN KEY (id_motorista) REFERENCES public.motorista(id_usuario);


--
-- TOC entry 5153 (class 2606 OID 26976)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5154 (class 2606 OID 26981)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5155 (class 2606 OID 26986)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_inteligente.tipo_carga(tipo);


--
-- TOC entry 5156 (class 2606 OID 26991)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5158 (class 2606 OID 26996)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_inteligente.carregamento(id_carregamento);


--
-- TOC entry 5159 (class 2606 OID 27001)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5160 (class 2606 OID 27006)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_inteligente; Owner: postgres
--

ALTER TABLE ONLY transp_inteligente.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_inteligente.veiculo(id_veiculo);


--
-- TOC entry 5161 (class 2606 OID 27011)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5162 (class 2606 OID 27016)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_legal.pedido(id_pedido);


--
-- TOC entry 5163 (class 2606 OID 27021)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_legal.veiculo(id_veiculo);


--
-- TOC entry 5181 (class 2606 OID 27134)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5182 (class 2606 OID 27124)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_legal.pedido(id_pedido);


--
-- TOC entry 5183 (class 2606 OID 27129)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5164 (class 2606 OID 27026)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5165 (class 2606 OID 27031)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5166 (class 2606 OID 27036)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_legal.tipo_carga(tipo);


--
-- TOC entry 5167 (class 2606 OID 27041)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5168 (class 2606 OID 27046)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_legal.carregamento(id_carregamento);


--
-- TOC entry 5169 (class 2606 OID 27051)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5170 (class 2606 OID 27056)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_legal; Owner: postgres
--

ALTER TABLE ONLY transp_legal.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_legal.veiculo(id_veiculo);


--
-- TOC entry 5171 (class 2606 OID 27061)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5172 (class 2606 OID 27066)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transp_paia.pedido(id_pedido);


--
-- TOC entry 5173 (class 2606 OID 27071)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_paia.veiculo(id_veiculo);


--
-- TOC entry 5190 (class 2606 OID 27215)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5191 (class 2606 OID 27205)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transp_paia.pedido(id_pedido);


--
-- TOC entry 5192 (class 2606 OID 27210)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5174 (class 2606 OID 27076)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5175 (class 2606 OID 27081)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5176 (class 2606 OID 27086)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transp_paia.tipo_carga(tipo);


--
-- TOC entry 5177 (class 2606 OID 27091)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5178 (class 2606 OID 27096)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transp_paia.carregamento(id_carregamento);


--
-- TOC entry 5179 (class 2606 OID 27101)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5180 (class 2606 OID 27106)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transp_paia; Owner: postgres
--

ALTER TABLE ONLY transp_paia.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transp_paia.veiculo(id_veiculo);


--
-- TOC entry 5404 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-10-31 17:41:08

--
-- PostgreSQL database dump complete
--

\unrestrict n0qduYbLEa4yyiRpeSSG3TF2XqsmTLTsHMTgGv6nu2KqxcFqCwvNNcwnDYalQVy

