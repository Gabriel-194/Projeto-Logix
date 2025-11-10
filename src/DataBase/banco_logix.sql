--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-10 11:29:57

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
-- TOC entry 5 (class 2615 OID 42492)
-- Name: expresso_vanguarda; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA expresso_vanguarda;


ALTER SCHEMA expresso_vanguarda OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 42493)
-- Name: max_transportes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA max_transportes;


ALTER SCHEMA max_transportes OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 7 (class 2615 OID 42494)
-- Name: rota_certa_logistica; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rota_certa_logistica;


ALTER SCHEMA rota_certa_logistica OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 42495)
-- Name: transportadora_xpto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA transportadora_xpto;


ALTER SCHEMA transportadora_xpto OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 42496)
-- Name: carregamento; Type: TABLE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE TABLE expresso_vanguarda.carregamento (
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


ALTER TABLE expresso_vanguarda.carregamento OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 42502)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE SEQUENCE expresso_vanguarda.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE expresso_vanguarda.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 222
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: expresso_vanguarda; Owner: postgres
--

ALTER SEQUENCE expresso_vanguarda.carregamento_id_carregamento_seq OWNED BY expresso_vanguarda.carregamento.id_carregamento;


--
-- TOC entry 223 (class 1259 OID 42503)
-- Name: mensagemcliente; Type: TABLE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE TABLE expresso_vanguarda.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE expresso_vanguarda.mensagemcliente OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 42506)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE SEQUENCE expresso_vanguarda.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE expresso_vanguarda.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 224
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: expresso_vanguarda; Owner: postgres
--

ALTER SEQUENCE expresso_vanguarda.mensagemcliente_id_mensagem_seq OWNED BY expresso_vanguarda.mensagemcliente.id_mensagem;


--
-- TOC entry 225 (class 1259 OID 42507)
-- Name: pedido; Type: TABLE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE TABLE expresso_vanguarda.pedido (
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
    data_atualizacao timestamp without time zone
);


ALTER TABLE expresso_vanguarda.pedido OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 42513)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE SEQUENCE expresso_vanguarda.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE expresso_vanguarda.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: expresso_vanguarda; Owner: postgres
--

ALTER SEQUENCE expresso_vanguarda.pedido_id_pedido_seq OWNED BY expresso_vanguarda.pedido.id_pedido;


--
-- TOC entry 227 (class 1259 OID 42514)
-- Name: tipo_carga; Type: TABLE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE TABLE expresso_vanguarda.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE expresso_vanguarda.tipo_carga OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 42517)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE SEQUENCE expresso_vanguarda.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE expresso_vanguarda.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 228
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: expresso_vanguarda; Owner: postgres
--

ALTER SEQUENCE expresso_vanguarda.tipo_carga_id_carga_seq OWNED BY expresso_vanguarda.tipo_carga.id_carga;


--
-- TOC entry 229 (class 1259 OID 42518)
-- Name: veiculo; Type: TABLE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE TABLE expresso_vanguarda.veiculo (
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


ALTER TABLE expresso_vanguarda.veiculo OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 42524)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE SEQUENCE expresso_vanguarda.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE expresso_vanguarda.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 230
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: expresso_vanguarda; Owner: postgres
--

ALTER SEQUENCE expresso_vanguarda.veiculo_id_veiculo_seq OWNED BY expresso_vanguarda.veiculo.id_veiculo;


--
-- TOC entry 231 (class 1259 OID 42525)
-- Name: viagem; Type: TABLE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE TABLE expresso_vanguarda.viagem (
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


ALTER TABLE expresso_vanguarda.viagem OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 42531)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: expresso_vanguarda; Owner: postgres
--

CREATE SEQUENCE expresso_vanguarda.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE expresso_vanguarda.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 232
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: expresso_vanguarda; Owner: postgres
--

ALTER SEQUENCE expresso_vanguarda.viagem_id_viagem_seq OWNED BY expresso_vanguarda.viagem.id_viagem;


--
-- TOC entry 233 (class 1259 OID 42532)
-- Name: carregamento; Type: TABLE; Schema: max_transportes; Owner: postgres
--

CREATE TABLE max_transportes.carregamento (
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


ALTER TABLE max_transportes.carregamento OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 42538)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: max_transportes; Owner: postgres
--

CREATE SEQUENCE max_transportes.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE max_transportes.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 234
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: max_transportes; Owner: postgres
--

ALTER SEQUENCE max_transportes.carregamento_id_carregamento_seq OWNED BY max_transportes.carregamento.id_carregamento;


--
-- TOC entry 235 (class 1259 OID 42539)
-- Name: mensagemcliente; Type: TABLE; Schema: max_transportes; Owner: postgres
--

CREATE TABLE max_transportes.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE max_transportes.mensagemcliente OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 42542)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: max_transportes; Owner: postgres
--

CREATE SEQUENCE max_transportes.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE max_transportes.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 236
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: max_transportes; Owner: postgres
--

ALTER SEQUENCE max_transportes.mensagemcliente_id_mensagem_seq OWNED BY max_transportes.mensagemcliente.id_mensagem;


--
-- TOC entry 237 (class 1259 OID 42543)
-- Name: pedido; Type: TABLE; Schema: max_transportes; Owner: postgres
--

CREATE TABLE max_transportes.pedido (
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
    data_atualizacao timestamp without time zone
);


ALTER TABLE max_transportes.pedido OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 42549)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: max_transportes; Owner: postgres
--

CREATE SEQUENCE max_transportes.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE max_transportes.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 238
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: max_transportes; Owner: postgres
--

ALTER SEQUENCE max_transportes.pedido_id_pedido_seq OWNED BY max_transportes.pedido.id_pedido;


--
-- TOC entry 239 (class 1259 OID 42550)
-- Name: tipo_carga; Type: TABLE; Schema: max_transportes; Owner: postgres
--

CREATE TABLE max_transportes.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE max_transportes.tipo_carga OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 42553)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: max_transportes; Owner: postgres
--

CREATE SEQUENCE max_transportes.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE max_transportes.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 240
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: max_transportes; Owner: postgres
--

ALTER SEQUENCE max_transportes.tipo_carga_id_carga_seq OWNED BY max_transportes.tipo_carga.id_carga;


--
-- TOC entry 241 (class 1259 OID 42554)
-- Name: veiculo; Type: TABLE; Schema: max_transportes; Owner: postgres
--

CREATE TABLE max_transportes.veiculo (
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


ALTER TABLE max_transportes.veiculo OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 42560)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: max_transportes; Owner: postgres
--

CREATE SEQUENCE max_transportes.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE max_transportes.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 242
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: max_transportes; Owner: postgres
--

ALTER SEQUENCE max_transportes.veiculo_id_veiculo_seq OWNED BY max_transportes.veiculo.id_veiculo;


--
-- TOC entry 243 (class 1259 OID 42561)
-- Name: viagem; Type: TABLE; Schema: max_transportes; Owner: postgres
--

CREATE TABLE max_transportes.viagem (
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


ALTER TABLE max_transportes.viagem OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 42567)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: max_transportes; Owner: postgres
--

CREATE SEQUENCE max_transportes.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE max_transportes.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 244
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: max_transportes; Owner: postgres
--

ALTER SEQUENCE max_transportes.viagem_id_viagem_seq OWNED BY max_transportes.viagem.id_viagem;


--
-- TOC entry 245 (class 1259 OID 42568)
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
-- TOC entry 246 (class 1259 OID 42576)
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
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 246
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- TOC entry 247 (class 1259 OID 42577)
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo (
    id_grupo integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 42580)
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
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 248
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_id_grupo_seq OWNED BY public.grupo.id_grupo;


--
-- TOC entry 249 (class 1259 OID 42581)
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
-- TOC entry 250 (class 1259 OID 42586)
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
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 250
-- Name: motorista_id_motorista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.motorista_id_motorista_seq OWNED BY public.motorista.id_motorista;


--
-- TOC entry 251 (class 1259 OID 42587)
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
-- TOC entry 252 (class 1259 OID 42593)
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
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 252
-- Name: transportadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transportadora_id_seq OWNED BY public.transportadora.id;


--
-- TOC entry 253 (class 1259 OID 42594)
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
-- TOC entry 254 (class 1259 OID 42602)
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
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 254
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 255 (class 1259 OID 42603)
-- Name: carregamento; Type: TABLE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE TABLE rota_certa_logistica.carregamento (
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


ALTER TABLE rota_certa_logistica.carregamento OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 42609)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE SEQUENCE rota_certa_logistica.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rota_certa_logistica.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 256
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: rota_certa_logistica; Owner: postgres
--

ALTER SEQUENCE rota_certa_logistica.carregamento_id_carregamento_seq OWNED BY rota_certa_logistica.carregamento.id_carregamento;


--
-- TOC entry 257 (class 1259 OID 42610)
-- Name: mensagemcliente; Type: TABLE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE TABLE rota_certa_logistica.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE rota_certa_logistica.mensagemcliente OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 42613)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE SEQUENCE rota_certa_logistica.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rota_certa_logistica.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 258
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: rota_certa_logistica; Owner: postgres
--

ALTER SEQUENCE rota_certa_logistica.mensagemcliente_id_mensagem_seq OWNED BY rota_certa_logistica.mensagemcliente.id_mensagem;


--
-- TOC entry 259 (class 1259 OID 42614)
-- Name: pedido; Type: TABLE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE TABLE rota_certa_logistica.pedido (
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
    data_atualizacao timestamp without time zone
);


ALTER TABLE rota_certa_logistica.pedido OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 42620)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE SEQUENCE rota_certa_logistica.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rota_certa_logistica.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 260
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: rota_certa_logistica; Owner: postgres
--

ALTER SEQUENCE rota_certa_logistica.pedido_id_pedido_seq OWNED BY rota_certa_logistica.pedido.id_pedido;


--
-- TOC entry 261 (class 1259 OID 42621)
-- Name: tipo_carga; Type: TABLE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE TABLE rota_certa_logistica.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE rota_certa_logistica.tipo_carga OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 42624)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE SEQUENCE rota_certa_logistica.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rota_certa_logistica.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: rota_certa_logistica; Owner: postgres
--

ALTER SEQUENCE rota_certa_logistica.tipo_carga_id_carga_seq OWNED BY rota_certa_logistica.tipo_carga.id_carga;


--
-- TOC entry 263 (class 1259 OID 42625)
-- Name: veiculo; Type: TABLE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE TABLE rota_certa_logistica.veiculo (
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


ALTER TABLE rota_certa_logistica.veiculo OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 42631)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE SEQUENCE rota_certa_logistica.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rota_certa_logistica.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 264
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: rota_certa_logistica; Owner: postgres
--

ALTER SEQUENCE rota_certa_logistica.veiculo_id_veiculo_seq OWNED BY rota_certa_logistica.veiculo.id_veiculo;


--
-- TOC entry 265 (class 1259 OID 42632)
-- Name: viagem; Type: TABLE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE TABLE rota_certa_logistica.viagem (
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


ALTER TABLE rota_certa_logistica.viagem OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 42638)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: rota_certa_logistica; Owner: postgres
--

CREATE SEQUENCE rota_certa_logistica.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rota_certa_logistica.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 266
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: rota_certa_logistica; Owner: postgres
--

ALTER SEQUENCE rota_certa_logistica.viagem_id_viagem_seq OWNED BY rota_certa_logistica.viagem.id_viagem;


--
-- TOC entry 267 (class 1259 OID 42639)
-- Name: carregamento; Type: TABLE; Schema: transportadora_xpto; Owner: postgres
--

CREATE TABLE transportadora_xpto.carregamento (
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


ALTER TABLE transportadora_xpto.carregamento OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 42645)
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE; Schema: transportadora_xpto; Owner: postgres
--

CREATE SEQUENCE transportadora_xpto.carregamento_id_carregamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transportadora_xpto.carregamento_id_carregamento_seq OWNER TO postgres;

--
-- TOC entry 5356 (class 0 OID 0)
-- Dependencies: 268
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE OWNED BY; Schema: transportadora_xpto; Owner: postgres
--

ALTER SEQUENCE transportadora_xpto.carregamento_id_carregamento_seq OWNED BY transportadora_xpto.carregamento.id_carregamento;


--
-- TOC entry 269 (class 1259 OID 42646)
-- Name: mensagemcliente; Type: TABLE; Schema: transportadora_xpto; Owner: postgres
--

CREATE TABLE transportadora_xpto.mensagemcliente (
    id_mensagem integer NOT NULL,
    id_pedido integer NOT NULL,
    id_transportadora integer NOT NULL,
    id_cliente integer NOT NULL,
    data_mensagem timestamp without time zone NOT NULL,
    texto character varying(255)
);


ALTER TABLE transportadora_xpto.mensagemcliente OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 42649)
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE; Schema: transportadora_xpto; Owner: postgres
--

CREATE SEQUENCE transportadora_xpto.mensagemcliente_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transportadora_xpto.mensagemcliente_id_mensagem_seq OWNER TO postgres;

--
-- TOC entry 5357 (class 0 OID 0)
-- Dependencies: 270
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: transportadora_xpto; Owner: postgres
--

ALTER SEQUENCE transportadora_xpto.mensagemcliente_id_mensagem_seq OWNED BY transportadora_xpto.mensagemcliente.id_mensagem;


--
-- TOC entry 271 (class 1259 OID 42650)
-- Name: pedido; Type: TABLE; Schema: transportadora_xpto; Owner: postgres
--

CREATE TABLE transportadora_xpto.pedido (
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
    data_atualizacao timestamp without time zone
);


ALTER TABLE transportadora_xpto.pedido OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 42656)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: transportadora_xpto; Owner: postgres
--

CREATE SEQUENCE transportadora_xpto.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transportadora_xpto.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5358 (class 0 OID 0)
-- Dependencies: 272
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: transportadora_xpto; Owner: postgres
--

ALTER SEQUENCE transportadora_xpto.pedido_id_pedido_seq OWNED BY transportadora_xpto.pedido.id_pedido;


--
-- TOC entry 273 (class 1259 OID 42657)
-- Name: tipo_carga; Type: TABLE; Schema: transportadora_xpto; Owner: postgres
--

CREATE TABLE transportadora_xpto.tipo_carga (
    id_carga integer NOT NULL,
    tipo character varying(50),
    preco_base_km numeric(10,2),
    id_transportadora integer NOT NULL
);


ALTER TABLE transportadora_xpto.tipo_carga OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 42660)
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE; Schema: transportadora_xpto; Owner: postgres
--

CREATE SEQUENCE transportadora_xpto.tipo_carga_id_carga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transportadora_xpto.tipo_carga_id_carga_seq OWNER TO postgres;

--
-- TOC entry 5359 (class 0 OID 0)
-- Dependencies: 274
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE OWNED BY; Schema: transportadora_xpto; Owner: postgres
--

ALTER SEQUENCE transportadora_xpto.tipo_carga_id_carga_seq OWNED BY transportadora_xpto.tipo_carga.id_carga;


--
-- TOC entry 275 (class 1259 OID 42661)
-- Name: veiculo; Type: TABLE; Schema: transportadora_xpto; Owner: postgres
--

CREATE TABLE transportadora_xpto.veiculo (
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


ALTER TABLE transportadora_xpto.veiculo OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 42667)
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE; Schema: transportadora_xpto; Owner: postgres
--

CREATE SEQUENCE transportadora_xpto.veiculo_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transportadora_xpto.veiculo_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 5360 (class 0 OID 0)
-- Dependencies: 276
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: transportadora_xpto; Owner: postgres
--

ALTER SEQUENCE transportadora_xpto.veiculo_id_veiculo_seq OWNED BY transportadora_xpto.veiculo.id_veiculo;


--
-- TOC entry 277 (class 1259 OID 42668)
-- Name: viagem; Type: TABLE; Schema: transportadora_xpto; Owner: postgres
--

CREATE TABLE transportadora_xpto.viagem (
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


ALTER TABLE transportadora_xpto.viagem OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 42674)
-- Name: viagem_id_viagem_seq; Type: SEQUENCE; Schema: transportadora_xpto; Owner: postgres
--

CREATE SEQUENCE transportadora_xpto.viagem_id_viagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE transportadora_xpto.viagem_id_viagem_seq OWNER TO postgres;

--
-- TOC entry 5361 (class 0 OID 0)
-- Dependencies: 278
-- Name: viagem_id_viagem_seq; Type: SEQUENCE OWNED BY; Schema: transportadora_xpto; Owner: postgres
--

ALTER SEQUENCE transportadora_xpto.viagem_id_viagem_seq OWNED BY transportadora_xpto.viagem.id_viagem;


--
-- TOC entry 4886 (class 2604 OID 42675)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('expresso_vanguarda.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4890 (class 2604 OID 42676)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('expresso_vanguarda.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4891 (class 2604 OID 42677)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('expresso_vanguarda.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4895 (class 2604 OID 42678)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('expresso_vanguarda.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 42679)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('expresso_vanguarda.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 42680)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('expresso_vanguarda.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 42681)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('max_transportes.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 42682)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('max_transportes.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 42683)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('max_transportes.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 42684)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('max_transportes.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 42685)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('max_transportes.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 42686)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('max_transportes.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 42687)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 42688)
-- Name: grupo id_grupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id_grupo SET DEFAULT nextval('public.grupo_id_grupo_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 42689)
-- Name: motorista id_motorista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista ALTER COLUMN id_motorista SET DEFAULT nextval('public.motorista_id_motorista_seq'::regclass);


--
-- TOC entry 4930 (class 2604 OID 42690)
-- Name: transportadora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora ALTER COLUMN id SET DEFAULT nextval('public.transportadora_id_seq'::regclass);


--
-- TOC entry 4934 (class 2604 OID 42691)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 42692)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('rota_certa_logistica.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 42693)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('rota_certa_logistica.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 42694)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('rota_certa_logistica.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 42695)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('rota_certa_logistica.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 42696)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('rota_certa_logistica.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 42697)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('rota_certa_logistica.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 42698)
-- Name: carregamento id_carregamento; Type: DEFAULT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.carregamento ALTER COLUMN id_carregamento SET DEFAULT nextval('transportadora_xpto.carregamento_id_carregamento_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 42699)
-- Name: mensagemcliente id_mensagem; Type: DEFAULT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.mensagemcliente ALTER COLUMN id_mensagem SET DEFAULT nextval('transportadora_xpto.mensagemcliente_id_mensagem_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 42700)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('transportadora_xpto.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 42701)
-- Name: tipo_carga id_carga; Type: DEFAULT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.tipo_carga ALTER COLUMN id_carga SET DEFAULT nextval('transportadora_xpto.tipo_carga_id_carga_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 42702)
-- Name: veiculo id_veiculo; Type: DEFAULT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.veiculo ALTER COLUMN id_veiculo SET DEFAULT nextval('transportadora_xpto.veiculo_id_veiculo_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 42703)
-- Name: viagem id_viagem; Type: DEFAULT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.viagem ALTER COLUMN id_viagem SET DEFAULT nextval('transportadora_xpto.viagem_id_viagem_seq'::regclass);


--
-- TOC entry 5268 (class 0 OID 42496)
-- Dependencies: 221
-- Data for Name: carregamento; Type: TABLE DATA; Schema: expresso_vanguarda; Owner: postgres
--

COPY expresso_vanguarda.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5270 (class 0 OID 42503)
-- Dependencies: 223
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: expresso_vanguarda; Owner: postgres
--

COPY expresso_vanguarda.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5272 (class 0 OID 42507)
-- Dependencies: 225
-- Data for Name: pedido; Type: TABLE DATA; Schema: expresso_vanguarda; Owner: postgres
--

COPY expresso_vanguarda.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, data_atualizacao) FROM stdin;
1	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	512	409	2025-01-15 10:23:50	5000	Líquida	3125.24	2	Confirmado	t	\N
2	1	89.070-730	SC	Joinville	Rua XV de Novembro	102	20.001-005	RJ	Rio de Janeiro	Avenida Brasil	781	800	2025-02-03 14:12:09	5000	Gás	3125.24	2	Confirmado	t	\N
3	1	29.015-270	ES	Vitória	Avenida Beira Mar	10	40.001-305	BA	Salvador	Praça Castro Alves	69	1300	2025-03-21 08:30:00	5000	Gás	3125.24	2	Confirmado	t	\N
4	1	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	70.001-001	DF	Brasília	Esplanada dos Ministérios	45	215	2025-04-16 17:00:00	5000	Gás	3125.24	2	Confirmado	t	\N
5	1	60.802-260	CE	Fortaleza	Av. Abolição	500	58.001-021	PB	João Pessoa	Rua das Trincheiras	20	670	2025-05-05 13:51:10	5000	Gás	3125.24	2	Confirmado	t	\N
6	1	40.050-430	BA	Salvador	Rua Chile	144	69.015-250	AM	Manaus	Avenida Eduardo Ribeiro	111	2853	2025-06-14 09:23:40	5000	Gás	3125.24	2	Confirmado	t	\N
7	1	30.047-560	MG	Belo Horizonte	Avenida Afonso Pena	800	29.060-220	ES	Cariacica	Rua Leopoldina	77	540	2025-07-20 15:10:05	5000	Líquida	3125.24	2	Confirmado	t	\N
8	1	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	29.015-270	ES	Vitória	Avenida Beira Mar	10	798	2025-08-29 11:07:33	5000	Líquida	3125.24	2	Confirmado	t	\N
9	1	80.010-110	PR	Curitiba	Rua Barão do Rio Branco	251	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	820	2025-09-15 16:30:22	5000	Líquida	3125.24	2	Confirmado	t	\N
10	1	29.060-220	ES	Cariacica	Rua Leopoldina	77	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	1630	2025-10-11 18:47:59	5000	Líquida	3125.24	2	Confirmado	t	\N
\.


--
-- TOC entry 5274 (class 0 OID 42514)
-- Dependencies: 227
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: expresso_vanguarda; Owner: postgres
--

COPY expresso_vanguarda.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Líquida	8.00	2
2	Gás	9.00	2
\.


--
-- TOC entry 5276 (class 0 OID 42518)
-- Dependencies: 229
-- Data for Name: veiculo; Type: TABLE DATA; Schema: expresso_vanguarda; Owner: postgres
--

COPY expresso_vanguarda.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
1	ASD2F12	iveco daily	2015	Líquida	5000	Litros (L)	t	2025-11-04 16:07:09.08745-03	2025-11-04 16:07:09.08745-03	disponivel
2	LIJ1D12	Mercedes Atego	2017	Gás	5000	Metros Cubicos (m³)	t	2025-11-04 16:07:54.400255-03	2025-11-04 16:07:54.400255-03	disponivel
\.


--
-- TOC entry 5278 (class 0 OID 42525)
-- Dependencies: 231
-- Data for Name: viagem; Type: TABLE DATA; Schema: expresso_vanguarda; Owner: postgres
--

COPY expresso_vanguarda.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5280 (class 0 OID 42532)
-- Dependencies: 233
-- Data for Name: carregamento; Type: TABLE DATA; Schema: max_transportes; Owner: postgres
--

COPY max_transportes.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5282 (class 0 OID 42539)
-- Dependencies: 235
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: max_transportes; Owner: postgres
--

COPY max_transportes.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5284 (class 0 OID 42543)
-- Dependencies: 237
-- Data for Name: pedido; Type: TABLE DATA; Schema: max_transportes; Owner: postgres
--

COPY max_transportes.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, data_atualizacao) FROM stdin;
1	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	512	409	2025-01-15 10:23:50	5000	Seca	3125.24	4	Confirmado	t	\N
2	1	89.070-730	SC	Joinville	Rua XV de Novembro	102	20.001-005	RJ	Rio de Janeiro	Avenida Brasil	781	800	2025-02-03 14:12:09	5000	Gás	3125.24	4	Confirmado	t	\N
3	1	29.015-270	ES	Vitória	Avenida Beira Mar	10	40.001-305	BA	Salvador	Praça Castro Alves	69	1300	2025-03-21 08:30:00	5000	Gás	3125.24	4	Confirmado	t	\N
5	1	60.802-260	CE	Fortaleza	Av. Abolição	500	58.001-021	PB	João Pessoa	Rua das Trincheiras	20	670	2025-05-05 13:51:10	5000	Gás	3125.24	4	Confirmado	t	\N
6	1	40.050-430	BA	Salvador	Rua Chile	144	69.015-250	AM	Manaus	Avenida Eduardo Ribeiro	111	2853	2025-06-14 09:23:40	5000	Gás	3125.24	4	Confirmado	t	\N
7	1	30.047-560	MG	Belo Horizonte	Avenida Afonso Pena	800	29.060-220	ES	Cariacica	Rua Leopoldina	77	540	2025-07-20 15:10:05	5000	Seca	3125.24	4	Confirmado	t	\N
8	1	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	29.015-270	ES	Vitória	Avenida Beira Mar	10	798	2025-08-29 11:07:33	5000	Seca	3125.24	4	Confirmado	t	\N
9	1	80.010-110	PR	Curitiba	Rua Barão do Rio Branco	251	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	820	2025-09-15 16:30:22	5000	Seca	3125.24	4	Confirmado	t	\N
10	1	29.060-220	ES	Cariacica	Rua Leopoldina	77	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	1630	2025-10-11 18:47:59	5000	Seca	3125.24	4	Confirmado	t	\N
4	1	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	70.001-001	DF	Brasília	Esplanada dos Ministérios	45	215	2025-06-14 00:00:00	5000	Gás	3125.24	4	Confirmado	t	\N
\.


--
-- TOC entry 5286 (class 0 OID 42550)
-- Dependencies: 239
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: max_transportes; Owner: postgres
--

COPY max_transportes.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	6.00	4
2	Gás	10.00	4
\.


--
-- TOC entry 5288 (class 0 OID 42554)
-- Dependencies: 241
-- Data for Name: veiculo; Type: TABLE DATA; Schema: max_transportes; Owner: postgres
--

COPY max_transportes.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
1	BOO4N41	Mercedes-Benz Axor	2018	Seca	9000	Quilograma (KG)	t	2025-11-04 16:18:37.95817-03	2025-11-04 16:18:37.95817-03	disponivel
2	LOV3S22	Mercedes-Benz Axor	2020	Gás	5000	Metros Cubicos (m³)	t	2025-11-04 16:19:42.13392-03	2025-11-04 16:19:42.13392-03	disponivel
\.


--
-- TOC entry 5290 (class 0 OID 42561)
-- Dependencies: 243
-- Data for Name: viagem; Type: TABLE DATA; Schema: max_transportes; Owner: postgres
--

COPY max_transportes.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5292 (class 0 OID 42568)
-- Dependencies: 245
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nome, cpf, telefone, email, data_cadastro, data_atualizacao, ativo, cep, estado, municipio, endereco, numero, senha_hash) FROM stdin;
1	guilherme	412.423.513-51	 (41) 24135-1341	gui@gmail.com	2025-11-04 16:53:37.982958	2025-11-04 16:53:37.982958	t	81.560-280	PR	Curitiba	Rua Agostinho Ângelo Trevisan	56	$2a$11$AxkkQ3nDj2HlGUyceDMJeeK4d8c.mlfqulDX.9d.sUnKiD9jysuzS
2	adriana	869.520.090-06	 (41) 23123-1253	adriana@gmail.com	2025-11-04 16:54:33.475266	2025-11-04 16:54:33.475266	t	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	$2a$11$dYgNLbanyQuiJUlfUK.96uiOHzMucmblqG0yCGdSlsYETxdUVk2.6
\.


--
-- TOC entry 5294 (class 0 OID 42577)
-- Dependencies: 247
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupo (id_grupo, nome) FROM stdin;
1	Admin
2	Gerente
3	Carregador
4	Motorista
\.


--
-- TOC entry 5296 (class 0 OID 42581)
-- Dependencies: 249
-- Data for Name: motorista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.motorista (id_motorista, id_usuario, numero_cnh, categoria_cnh, validade_cnh, data_cadastro, data_atualizacao) FROM stdin;
1	8	123456789	D	2030-08-02	2025-11-04 15:58:19.244875	2025-11-04 15:58:19.244875
2	9	987654321	E	2028-11-30	2025-11-04 15:58:59.814768	2025-11-04 15:58:59.814768
3	14	147258369	D	2027-05-20	2025-11-04 16:04:44.798196	2025-11-04 16:04:44.798196
4	15	1230098567	D	2029-06-06	2025-11-04 16:05:27.84749	2025-11-04 16:05:27.84749
5	19	321159357	E	2026-01-30	2025-11-04 16:10:30.423131	2025-11-04 16:10:30.423131
6	20	332211115	D	2029-09-08	2025-11-04 16:11:25.94208	2025-11-04 16:11:25.94208
7	26	321159478	E	2029-12-20	2025-11-04 16:21:57.022242	2025-11-04 16:21:57.022242
8	27	654456564	D	2027-12-20	2025-11-04 16:22:49.338089	2025-11-04 16:22:49.338089
\.


--
-- TOC entry 5298 (class 0 OID 42587)
-- Dependencies: 251
-- Data for Name: transportadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportadora (id, nome, cnpj, telefone, email, cep, ativo, schema_name, data_cadastro, data_atualizacao) FROM stdin;
1	Rota Certa Logistica	31.231.351/3416-42	 (41) 23123-1352	rotaCerta@gmail.com	41.212-346	t	rota_certa_logistica	2025-11-04 15:42:10.145254	2025-11-04 15:42:10.145254
2	Expresso Vanguarda	41.234.154/3645-84	 (41) 23136-5538	ExpressoVanguarda@gmail.com	98.401-323	t	expresso_vanguarda	2025-11-04 15:43:13.024883	2025-11-04 15:43:13.024883
3	Transportadora XPTO	31.242.363/4645-73	 (41) 24313-5436	transpXPTO@gmail.com	41.235-537	t	transportadora_xpto	2025-11-04 15:44:17.160478	2025-11-04 15:44:17.160478
4	Max Transportes	14.135.263/6345-34	 (12) 44624-5853	maxTransportes@gmail.com	81.653-623	t	max_transportes	2025-11-04 15:45:01.288369	2025-11-04 15:45:01.288369
\.


--
-- TOC entry 5300 (class 0 OID 42594)
-- Dependencies: 253
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nome, senha_hash, cpf, telefone, email, cargo_descricao, id_grupo, ativo, id_transportadora, data_cadastro, data_atualizacao) FROM stdin;
1	administrador logix	$2a$11$LDeqorZd6gz4j1Hif0aRjO2.lkdIKEvEW4sy9tkdUdIhrxJE8Qcb.	000.000.000-00	\N	LogixAdmin@gmail.com	adminLogix	\N	t	\N	2025-11-04 15:41:00.52695	2025-11-04 15:41:00.52695
2	kuchma	$2a$11$5W9T9sYM8YHupDkVWF7PSuvJWG.opExEzV/e1vPzplRoaKQsSvZbO	698.432.164-13	 (41) 23153-2462	kuchma@gmail.com	ADMIN	1	t	1	2025-11-04 15:46:01.213027	2025-11-04 15:46:01.213027
3	lucas	$2a$11$Dcuk6FEPwZ84FC3m6.5TsOUMP98sZlkr/vYzT2Bg7aU42SM0s1I5q	512.313.534-63	 (51) 24236-4237	lucas@gmail.com	ADMIN	1	t	2	2025-11-04 15:46:27.471937	2025-11-04 15:46:27.471937
4	nicolas	$2a$11$p3AQBPkFpAM5S/f7kukm/.UKrXjc.c0dWQe/igh9oZFut6gIpP.1O	412.413.524-75	 (41) 20974-0184	nicolas@gmail.com	ADMIN	1	t	3	2025-11-04 15:46:56.545132	2025-11-04 15:46:56.545132
5	alisson	$2a$11$SsjqTtG4aGJoPBQLKg82k.u94TVdYrIf5rqDIHlz3ZRPtLdIfRQEa	123.135.123-52	 (31) 24135-1675	alisson@gmail.com	ADMIN	1	t	4	2025-11-04 15:47:20.748558	2025-11-04 15:47:20.748558
6	rayyane	$2a$11$47AGL7mYPtQO80otlv8CReiud0/AnIo1tRBWrCSrLubGLbH.ZCLxe	123.135.246-24	 (41) 23135-1242	rayy@gmail.com	gerente	2	t	1	2025-11-04 15:57:10.463946	2025-11-04 15:57:10.463946
7	livia	$2a$11$hlIqOkQ1N413iCTZkI.BGuhhOCvk/wctt6LBwVJYoGkDrMxtFiIN2	141.242.352-62	 (41) 23420-5973	livia@gmail.com	gerente	2	t	1	2025-11-04 15:57:33.544786	2025-11-04 15:57:33.544786
8	sergio	$2a$11$D97QzJo6DHojUtdwicZf1uNjTslZ7abIGoQdppkDKgrBpgWPq9Ccu	412.412.423-62	 (41) 23235-2362	sergio@gmail.com	motorista	4	t	1	2025-11-04 15:58:19.244875	2025-11-04 15:58:19.244875
9	eduardo	$2a$11$0ZxxvLpvwNZ7dsXBLSBzl.mGAumte0lTQOu0konjfmZqxD1hkbuuy	984.321.132-13	 (41) 23415-3213	eduardo@gmail.com	motorista	4	t	1	2025-11-04 15:58:59.814768	2025-11-04 15:58:59.814768
10	luis gustavo	$2a$11$ZTBrfFre/9SNZkKA0sJfbeiTrI.GykmWn0V.Rjq3//5VRkPM42OXK	424.635.735-62	 (41) 24356-2436	luisGustavo@gmail.com	Carregador	3	t	1	2025-11-04 15:59:33.582848	2025-11-04 15:59:33.582848
11	julio	$2a$11$YPm8V8ggD/HuUG8Ss0EEu.XqaT94s1r7nnmg0aTfyxzomm.9i4wDq	415.246.352-34	 (31) 24141-2457	julio@gmail.com	Carregador	3	t	1	2025-11-04 15:59:56.928325	2025-11-04 15:59:56.928325
12	elton	$2a$11$QMYo/GASBGjw/2uV70UNA.dqihzwnQUas/P5eT.76ySlJDaAskyIm	412.315.467-35	 (41) 23135-1341	elton@gmail.com	gerente	2	t	2	2025-11-04 16:03:36.064736	2025-11-04 16:03:36.064736
13	graciely	$2a$11$ER/0PlQa7tRvVSNMyIBcwOkRlx4jDQiJkQM62YF9FdlfQnwRKUT4u	124.123.415-26	 (31) 24125-2341	graci@gmail.com	gerente	2	t	2	2025-11-04 16:03:59.215964	2025-11-04 16:03:59.215964
14	jhonny	$2a$12$Ke485kRx0pQGnATyNguFjuGX58noVuKgTedAtGifYDYq1C28YINdy	412.426.357-35	 (14) 23635-7468	jhonny@gmail.com	motorista	4	t	2	2025-11-04 16:04:44.798196	2025-11-04 16:04:44.798196
15	wagner	$2a$11$6H4.zLzOQMX/SMKdddc3BOjuiHctxUWvc9o.jf640EFBzf2EE7/YS	154.254.624-62	 (41) 24154-2634	wagner@gmail.com	motorista	4	t	2	2025-11-04 16:05:27.84749	2025-11-04 16:05:27.84749
16	rafael	$2a$11$wG7fwrIg3o.AJ2NHHpEOoOoaTYi56rcw08C2iulVqbG6Ce5evMId2	687.313.165-13	 (12) 31241-3515	rafael@gmail.com	Carregador	3	t	2	2025-11-04 16:06:01.219707	2025-11-04 16:06:01.219707
17	helen	$2a$11$tav/qcZbnZ2npATtCOaiO.NuZxhH7RR7HuhBFPSdt8UMrqXON/ITq	687.313.213-13	 (41) 24124-1243	helen@gmail.com	Carregador	3	t	2	2025-11-04 16:06:29.631264	2025-11-04 16:06:29.631264
18	rodrigo	$2a$11$BIiOauRg715hfx3GQ5fOquta0c0LOuMN/hO6UftGLcbO2p5IgkVWu	984.631.323-26	 (31) 35246-5163	rodrigo@gmail.com	gerente	2	t	3	2025-11-04 16:09:18.792144	2025-11-04 16:09:18.792144
19	 alcir junior	$2a$11$KgrvmXUafPs2SOqdA/e7yOBXePtylwbYlacAE587w5tV4FmAbn.bm	987.321.346-51	 (13) 51323-2313	junior@gmail.com	motorista	4	t	3	2025-11-04 16:10:30.423131	2025-11-04 16:10:30.423131
20	mariana	$2a$11$VydknBdx9LiizRjxeoLqfenKpCev8qtAOGUYBuBy2rXyGmC7xJO2S	897.132.323-23	 (41) 23352-5234	marian@gmail.com	motorista	4	t	3	2025-11-04 16:11:25.94208	2025-11-04 16:11:25.94208
21	paulo	$2a$11$8gaQ0oIaiglZ123Pkpe6/OH9qw0BSfcxzjIBbYSDJOeYNeSP0MpSC	983.131.623-26	 (41) 23135-2462	paulo@gmail.com	Carregador	3	t	3	2025-11-04 16:12:01.830094	2025-11-04 16:12:01.830094
22	alcir	$2a$11$NkZ4b1GrB0Sj3sKrzXyOwueWaylpiuClTfyiEzpZkKIKPvvfEXpxG	312.454.365-53	 (41) 24546-3563	alcir@gmail.com	Carregador	3	t	3	2025-11-04 16:12:26.751997	2025-11-04 16:12:26.751997
23	felipe	$2a$11$UsQJxmGYcWtCOxwnk0enpu3/0NEOROOPIxnx6Sao6g9CGZE9SVnXq	312.524.637-35	 (24) 12154-6346	felipe@gmail.com	gerente	2	t	3	2025-11-04 16:16:51.186704	2025-11-04 16:16:51.186704
24	vitor	$2a$12$h5gSuOYtNQHveYvtyypjsODxu5e6b2c1GCE4EWxw6g.K8zOGxWjsK	312.423.532-52	 (41) 24245-3634	vitor@gmail.com	Carregador	3	t	4	2025-11-04 16:20:17.678573	2025-11-04 16:20:17.678573
25	roger	$2a$11$gZs3VIPdEfpp2eo1ymdT0OBLKDM8ETmiA.RKponXuUAGnJV4o4bXm	312.434.635-42	 (51) 34124-2515	roger@gmail.com	Carregador	3	t	4	2025-11-04 16:20:42.977965	2025-11-04 16:20:42.977965
26	luciano	$2a$11$MZI.oN2L46kxwYKZeoqU4.9erpuZbUNaK2lpa2ZYl8h3b94gKu/ee	983.212.121-34	 (41) 24236-4525	luciano@gmail.com	motorista	4	t	4	2025-11-04 16:21:57.022242	2025-11-04 16:21:57.022242
27	edgar	$2a$11$h8tqlnjZ1v2lA8bS1DGaXO8eDV9Wyhtb8ltjtatL2G4N2KI0DrtMG	321.654.887-97	 (41) 24235-4262	edgar@gmail.com	motorista	4	t	4	2025-11-04 16:22:49.338089	2025-11-04 16:22:49.338089
28	marcos	$2a$11$fzmTl67W8O2rAZwwS2YfS.6oCGqRpfzgH0gWe9VQ9hdMDHPTIsRnu	412.452.513-43	 (41) 24124-4634	marcos@gmail.com	gerente	2	t	4	2025-11-04 16:23:17.69836	2025-11-04 16:23:17.69836
29	michael	$2a$12$W5yZnF/gOJ8.SViT2MeOBuSTfx79yi2kUn7/HLgvEiqhUEmELZWYm	983.136.132-63	 (41) 41231-3546	michael@gmail.com	gerente	2	t	4	2025-11-04 16:23:47.277931	2025-11-04 16:23:47.277931
\.


--
-- TOC entry 5302 (class 0 OID 42603)
-- Dependencies: 255
-- Data for Name: carregamento; Type: TABLE DATA; Schema: rota_certa_logistica; Owner: postgres
--

COPY rota_certa_logistica.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
2	3	1	10	\N	\N	Aguardando	2025-11-10 09:58:47.471	2025-11-10 09:58:47.471669
1	2	2	11	2025-11-10 10:05:53.829239	2025-11-10 11:15:53.829239	Pronto	2025-11-10 09:58:26.333	2025-11-10 09:58:26.337405
3	6	2	11	2025-11-10 10:16:26.780585	2025-11-10 11:41:26.780585	Pronto	2025-11-10 10:15:31.425	2025-11-10 10:15:31.426893
\.


--
-- TOC entry 5304 (class 0 OID 42610)
-- Dependencies: 257
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: rota_certa_logistica; Owner: postgres
--

COPY rota_certa_logistica.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
1	2	1	1	2025-11-10 10:05:53.836439	O carregamento foi iniciado para o pedido #2
2	6	1	1	2025-11-10 10:16:26.786032	O carregamento foi iniciado para o pedido #6
3	6	1	1	2025-11-10 10:24:24.283828	O carregamento foi finalizado para o pedido #6
\.


--
-- TOC entry 5306 (class 0 OID 42614)
-- Dependencies: 259
-- Data for Name: pedido; Type: TABLE DATA; Schema: rota_certa_logistica; Owner: postgres
--

COPY rota_certa_logistica.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, data_atualizacao) FROM stdin;
3	1	89.070-730	SC	Joinville	Rua XV de Novembro	102	20.001-005	RJ	Rio de Janeiro	Avenida Brasil	781	800	2025-02-03 14:12:09	5000	Refrigerada	3125.24	1	Confirmado	t	\N
4	1	29.015-270	ES	Vitória	Avenida Beira Mar	10	40.001-305	BA	Salvador	Praça Castro Alves	69	1300	2025-03-21 08:30:00	5000	Seca	3125.24	1	Confirmado	t	\N
7	1	40.050-430	BA	Salvador	Rua Chile	144	69.015-250	AM	Manaus	Avenida Eduardo Ribeiro	111	2853	2025-06-14 09:23:40	5000	Refrigerada	3125.24	1	Confirmado	t	\N
8	1	30.047-560	MG	Belo Horizonte	Avenida Afonso Pena	800	29.060-220	ES	Cariacica	Rua Leopoldina	77	540	2025-07-20 15:10:05	5000	Refrigerada	3125.24	1	Confirmado	t	\N
9	1	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	29.015-270	ES	Vitória	Avenida Beira Mar	10	798	2025-08-29 11:07:33	5000	Refrigerada	3125.24	1	Confirmado	t	\N
10	1	80.010-110	PR	Curitiba	Rua Barão do Rio Branco	251	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	820	2025-09-15 16:30:22	5000	Seca	3125.24	1	Confirmado	t	\N
11	1	29.060-220	ES	Cariacica	Rua Leopoldina	77	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	1630	2025-10-11 18:47:59	5000	Seca	3125.24	1	Confirmado	t	\N
1	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	512	409	2025-04-11 00:00:00	5000	Seca	3125.24	1	Confirmado	t	\N
5	1	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	70.001-001	DF	Brasília	Esplanada dos Ministérios	45	215	2025-04-11 00:00:00	5000	Refrigerada	3125.24	1	Confirmado	t	\N
12	2	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	23	409	2025-11-07 09:23:43.678824	6000	Refrigerada	4163.88	1	Confirmado	t	\N
2	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	512	409	2025-01-15 10:23:50	5000	Seca	3125.24	1	Em preparo	t	2025-11-10 10:05:53.833447
6	1	60.802-260	CE	Fortaleza	Av. Abolição	500	58.001-021	PB	João Pessoa	Rua das Trincheiras	20	670	2025-05-05 13:51:10	5000	Seca	3125.24	1	Em preparo	t	2025-11-10 10:24:24.281672
\.


--
-- TOC entry 5308 (class 0 OID 42621)
-- Dependencies: 261
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: rota_certa_logistica; Owner: postgres
--

COPY rota_certa_logistica.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Seca	5.50	1
2	Refrigerada	7.00	1
\.


--
-- TOC entry 5310 (class 0 OID 42625)
-- Dependencies: 263
-- Data for Name: veiculo; Type: TABLE DATA; Schema: rota_certa_logistica; Owner: postgres
--

COPY rota_certa_logistica.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
1	EAV1R45	HR	2011	Refrigerada	5000	Quilograma (KG)	t	2025-11-04 16:00:21.585167-03	2025-11-04 16:00:21.585167-03	disponivel
2	PYJ1F34	Volvo FH	2025	Seca	7000	Quilograma (KG)	t	2025-11-04 16:01:20.209468-03	2025-11-04 16:01:20.209468-03	disponivel
\.


--
-- TOC entry 5312 (class 0 OID 42632)
-- Dependencies: 265
-- Data for Name: viagem; Type: TABLE DATA; Schema: rota_certa_logistica; Owner: postgres
--

COPY rota_certa_logistica.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
1	1	2	8	\N	\N	Aguardando	2025-11-10 10:15:48.615	2025-11-10 10:15:48.617354	409
\.


--
-- TOC entry 5314 (class 0 OID 42639)
-- Dependencies: 267
-- Data for Name: carregamento; Type: TABLE DATA; Schema: transportadora_xpto; Owner: postgres
--

COPY transportadora_xpto.carregamento (id_carregamento, id_pedido, id_veiculo, id_carregador, data_hora_inicio, data_hora_fim, status, data_cadastro, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 5316 (class 0 OID 42646)
-- Dependencies: 269
-- Data for Name: mensagemcliente; Type: TABLE DATA; Schema: transportadora_xpto; Owner: postgres
--

COPY transportadora_xpto.mensagemcliente (id_mensagem, id_pedido, id_transportadora, id_cliente, data_mensagem, texto) FROM stdin;
\.


--
-- TOC entry 5318 (class 0 OID 42650)
-- Dependencies: 271
-- Data for Name: pedido; Type: TABLE DATA; Schema: transportadora_xpto; Owner: postgres
--

COPY transportadora_xpto.pedido (id_pedido, id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, distancia_km, data_pedido, peso, tipo_carga, preco, id_transportadora, status, ativo, data_atualizacao) FROM stdin;
1	1	81.925-380	PR	Curitiba	Rua Maria Nicolas	65	01.001-000	SP	São Paulo	Praça da Sé	512	409	2025-01-15 10:23:50	5000	Líquida	3125.24	3	Confirmado	t	\N
2	1	89.070-730	SC	Joinville	Rua XV de Novembro	102	20.001-005	RJ	Rio de Janeiro	Avenida Brasil	781	800	2025-02-03 14:12:09	5000	Refrigerada	3125.24	3	Confirmado	t	\N
3	1	29.015-270	ES	Vitória	Avenida Beira Mar	10	40.001-305	BA	Salvador	Praça Castro Alves	69	1300	2025-03-21 08:30:00	5000	Refrigerada	3125.24	3	Confirmado	t	\N
4	1	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	70.001-001	DF	Brasília	Esplanada dos Ministérios	45	215	2025-04-16 17:00:00	5000	Refrigerada	3125.24	3	Confirmado	t	\N
5	1	60.802-260	CE	Fortaleza	Av. Abolição	500	58.001-021	PB	João Pessoa	Rua das Trincheiras	20	670	2025-05-05 13:51:10	5000	Refrigerada	3125.24	3	Confirmado	t	\N
6	1	40.050-430	BA	Salvador	Rua Chile	144	69.015-250	AM	Manaus	Avenida Eduardo Ribeiro	111	2853	2025-06-14 09:23:40	5000	Refrigerada	3125.24	3	Confirmado	t	\N
7	1	30.047-560	MG	Belo Horizonte	Avenida Afonso Pena	800	29.060-220	ES	Cariacica	Rua Leopoldina	77	540	2025-07-20 15:10:05	5000	Líquida	3125.24	3	Confirmado	t	\N
8	1	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	29.015-270	ES	Vitória	Avenida Beira Mar	10	798	2025-08-29 11:07:33	5000	Líquida	3125.24	3	Confirmado	t	\N
9	1	80.010-110	PR	Curitiba	Rua Barão do Rio Branco	251	74.085-040	GO	Goiânia	Rua 24 de Outubro	99	820	2025-09-15 16:30:22	5000	Líquida	3125.24	3	Confirmado	t	\N
10	1	29.060-220	ES	Cariacica	Rua Leopoldina	77	91.500-020	RS	Porto Alegre	Rua dos Andradas	999	1630	2025-10-11 18:47:59	5000	Líquida	3125.24	3	Confirmado	t	\N
\.


--
-- TOC entry 5320 (class 0 OID 42657)
-- Dependencies: 273
-- Data for Name: tipo_carga; Type: TABLE DATA; Schema: transportadora_xpto; Owner: postgres
--

COPY transportadora_xpto.tipo_carga (id_carga, tipo, preco_base_km, id_transportadora) FROM stdin;
1	Refrigerada	9.50	3
2	Líquida	8.50	3
\.


--
-- TOC entry 5322 (class 0 OID 42661)
-- Dependencies: 275
-- Data for Name: veiculo; Type: TABLE DATA; Schema: transportadora_xpto; Owner: postgres
--

COPY transportadora_xpto.veiculo (id_veiculo, placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao, status) FROM stdin;
1	LOD1C12	Scania R440	2011	Refrigerada	4000	Quilograma (KG)	t	2025-11-04 16:15:25.486868-03	2025-11-04 16:15:25.486868-03	disponivel
2	KLJ3D31	Scania G420	2025	Líquida	6000	Litros (L)	t	2025-11-04 16:16:17.686621-03	2025-11-04 16:16:17.686621-03	disponivel
\.


--
-- TOC entry 5324 (class 0 OID 42668)
-- Dependencies: 277
-- Data for Name: viagem; Type: TABLE DATA; Schema: transportadora_xpto; Owner: postgres
--

COPY transportadora_xpto.viagem (id_viagem, id_carregamento, id_veiculo, id_motorista, data_saida_cd, data_chegada, status, data_cadastro, data_atualizacao, distancia_km) FROM stdin;
\.


--
-- TOC entry 5362 (class 0 OID 0)
-- Dependencies: 222
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: expresso_vanguarda; Owner: postgres
--

SELECT pg_catalog.setval('expresso_vanguarda.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5363 (class 0 OID 0)
-- Dependencies: 224
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: expresso_vanguarda; Owner: postgres
--

SELECT pg_catalog.setval('expresso_vanguarda.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5364 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: expresso_vanguarda; Owner: postgres
--

SELECT pg_catalog.setval('expresso_vanguarda.pedido_id_pedido_seq', 10, true);


--
-- TOC entry 5365 (class 0 OID 0)
-- Dependencies: 228
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: expresso_vanguarda; Owner: postgres
--

SELECT pg_catalog.setval('expresso_vanguarda.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5366 (class 0 OID 0)
-- Dependencies: 230
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: expresso_vanguarda; Owner: postgres
--

SELECT pg_catalog.setval('expresso_vanguarda.veiculo_id_veiculo_seq', 2, true);


--
-- TOC entry 5367 (class 0 OID 0)
-- Dependencies: 232
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: expresso_vanguarda; Owner: postgres
--

SELECT pg_catalog.setval('expresso_vanguarda.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5368 (class 0 OID 0)
-- Dependencies: 234
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: max_transportes; Owner: postgres
--

SELECT pg_catalog.setval('max_transportes.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5369 (class 0 OID 0)
-- Dependencies: 236
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: max_transportes; Owner: postgres
--

SELECT pg_catalog.setval('max_transportes.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 238
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: max_transportes; Owner: postgres
--

SELECT pg_catalog.setval('max_transportes.pedido_id_pedido_seq', 10, true);


--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 240
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: max_transportes; Owner: postgres
--

SELECT pg_catalog.setval('max_transportes.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 242
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: max_transportes; Owner: postgres
--

SELECT pg_catalog.setval('max_transportes.veiculo_id_veiculo_seq', 2, true);


--
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 244
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: max_transportes; Owner: postgres
--

SELECT pg_catalog.setval('max_transportes.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 246
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 2, true);


--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 248
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_id_grupo_seq', 4, true);


--
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 250
-- Name: motorista_id_motorista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.motorista_id_motorista_seq', 8, true);


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 252
-- Name: transportadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transportadora_id_seq', 4, true);


--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 254
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 29, true);


--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 256
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: rota_certa_logistica; Owner: postgres
--

SELECT pg_catalog.setval('rota_certa_logistica.carregamento_id_carregamento_seq', 3, true);


--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 258
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: rota_certa_logistica; Owner: postgres
--

SELECT pg_catalog.setval('rota_certa_logistica.mensagemcliente_id_mensagem_seq', 3, true);


--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 260
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: rota_certa_logistica; Owner: postgres
--

SELECT pg_catalog.setval('rota_certa_logistica.pedido_id_pedido_seq', 12, true);


--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: rota_certa_logistica; Owner: postgres
--

SELECT pg_catalog.setval('rota_certa_logistica.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 264
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: rota_certa_logistica; Owner: postgres
--

SELECT pg_catalog.setval('rota_certa_logistica.veiculo_id_veiculo_seq', 2, true);


--
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 266
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: rota_certa_logistica; Owner: postgres
--

SELECT pg_catalog.setval('rota_certa_logistica.viagem_id_viagem_seq', 1, true);


--
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 268
-- Name: carregamento_id_carregamento_seq; Type: SEQUENCE SET; Schema: transportadora_xpto; Owner: postgres
--

SELECT pg_catalog.setval('transportadora_xpto.carregamento_id_carregamento_seq', 1, false);


--
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 270
-- Name: mensagemcliente_id_mensagem_seq; Type: SEQUENCE SET; Schema: transportadora_xpto; Owner: postgres
--

SELECT pg_catalog.setval('transportadora_xpto.mensagemcliente_id_mensagem_seq', 1, false);


--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 272
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: transportadora_xpto; Owner: postgres
--

SELECT pg_catalog.setval('transportadora_xpto.pedido_id_pedido_seq', 10, true);


--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 274
-- Name: tipo_carga_id_carga_seq; Type: SEQUENCE SET; Schema: transportadora_xpto; Owner: postgres
--

SELECT pg_catalog.setval('transportadora_xpto.tipo_carga_id_carga_seq', 2, true);


--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 276
-- Name: veiculo_id_veiculo_seq; Type: SEQUENCE SET; Schema: transportadora_xpto; Owner: postgres
--

SELECT pg_catalog.setval('transportadora_xpto.veiculo_id_veiculo_seq', 2, true);


--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 278
-- Name: viagem_id_viagem_seq; Type: SEQUENCE SET; Schema: transportadora_xpto; Owner: postgres
--

SELECT pg_catalog.setval('transportadora_xpto.viagem_id_viagem_seq', 1, false);


--
-- TOC entry 4975 (class 2606 OID 42705)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 4977 (class 2606 OID 42707)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 4979 (class 2606 OID 42709)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4981 (class 2606 OID 42711)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 4983 (class 2606 OID 42713)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 4985 (class 2606 OID 42715)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 4987 (class 2606 OID 42717)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 4989 (class 2606 OID 42719)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 4991 (class 2606 OID 42721)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 4993 (class 2606 OID 42723)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 4995 (class 2606 OID 42725)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4997 (class 2606 OID 42727)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 4999 (class 2606 OID 42729)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5001 (class 2606 OID 42731)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5003 (class 2606 OID 42733)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5005 (class 2606 OID 42735)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5007 (class 2606 OID 42737)
-- Name: cliente cliente_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cpf_key UNIQUE (cpf);


--
-- TOC entry 5009 (class 2606 OID 42739)
-- Name: cliente cliente_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);


--
-- TOC entry 5011 (class 2606 OID 42741)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 5013 (class 2606 OID 42743)
-- Name: grupo grupo_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_nome_key UNIQUE (nome);


--
-- TOC entry 5015 (class 2606 OID 42745)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 5017 (class 2606 OID 42747)
-- Name: motorista motorista_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_key UNIQUE (id_usuario);


--
-- TOC entry 5019 (class 2606 OID 42749)
-- Name: motorista motorista_numero_cnh_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_numero_cnh_key UNIQUE (numero_cnh);


--
-- TOC entry 5021 (class 2606 OID 42751)
-- Name: motorista motorista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_pkey PRIMARY KEY (id_motorista);


--
-- TOC entry 5023 (class 2606 OID 42753)
-- Name: transportadora transportadora_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 5025 (class 2606 OID 42755)
-- Name: transportadora transportadora_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_email_key UNIQUE (email);


--
-- TOC entry 5027 (class 2606 OID 42757)
-- Name: transportadora transportadora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_pkey PRIMARY KEY (id);


--
-- TOC entry 5029 (class 2606 OID 42759)
-- Name: transportadora transportadora_schema_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT transportadora_schema_name_key UNIQUE (schema_name);


--
-- TOC entry 5031 (class 2606 OID 42761)
-- Name: usuarios usuarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cpf_key UNIQUE (cpf);


--
-- TOC entry 5033 (class 2606 OID 42763)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 5035 (class 2606 OID 42765)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 5037 (class 2606 OID 42767)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5039 (class 2606 OID 42769)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5041 (class 2606 OID 42771)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5043 (class 2606 OID 42773)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5045 (class 2606 OID 42775)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5047 (class 2606 OID 42777)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5049 (class 2606 OID 42779)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5051 (class 2606 OID 42781)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5053 (class 2606 OID 42783)
-- Name: carregamento carregamento_pkey; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.carregamento
    ADD CONSTRAINT carregamento_pkey PRIMARY KEY (id_carregamento);


--
-- TOC entry 5055 (class 2606 OID 42785)
-- Name: mensagemcliente mensagemcliente_pkey; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.mensagemcliente
    ADD CONSTRAINT mensagemcliente_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 5057 (class 2606 OID 42787)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 5059 (class 2606 OID 42789)
-- Name: tipo_carga tipo_carga_pkey; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.tipo_carga
    ADD CONSTRAINT tipo_carga_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 5061 (class 2606 OID 42791)
-- Name: tipo_carga tipo_carga_tipo_key; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.tipo_carga
    ADD CONSTRAINT tipo_carga_tipo_key UNIQUE (tipo);


--
-- TOC entry 5063 (class 2606 OID 42793)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 5065 (class 2606 OID 42795)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 5067 (class 2606 OID 42797)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 5068 (class 2606 OID 42798)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5069 (class 2606 OID 42803)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES expresso_vanguarda.pedido(id_pedido);


--
-- TOC entry 5070 (class 2606 OID 42808)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES expresso_vanguarda.veiculo(id_veiculo);


--
-- TOC entry 5071 (class 2606 OID 42813)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5072 (class 2606 OID 42818)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES expresso_vanguarda.pedido(id_pedido);


--
-- TOC entry 5073 (class 2606 OID 42823)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5074 (class 2606 OID 42828)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5075 (class 2606 OID 42833)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5076 (class 2606 OID 42838)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES expresso_vanguarda.tipo_carga(tipo);


--
-- TOC entry 5077 (class 2606 OID 42843)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5078 (class 2606 OID 42848)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES expresso_vanguarda.carregamento(id_carregamento);


--
-- TOC entry 5079 (class 2606 OID 42853)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5080 (class 2606 OID 42858)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: expresso_vanguarda; Owner: postgres
--

ALTER TABLE ONLY expresso_vanguarda.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES expresso_vanguarda.veiculo(id_veiculo);


--
-- TOC entry 5081 (class 2606 OID 42863)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5082 (class 2606 OID 42868)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES max_transportes.pedido(id_pedido);


--
-- TOC entry 5083 (class 2606 OID 42873)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES max_transportes.veiculo(id_veiculo);


--
-- TOC entry 5084 (class 2606 OID 42878)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5085 (class 2606 OID 42883)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES max_transportes.pedido(id_pedido);


--
-- TOC entry 5086 (class 2606 OID 42888)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5087 (class 2606 OID 42893)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5088 (class 2606 OID 42898)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5089 (class 2606 OID 42903)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES max_transportes.tipo_carga(tipo);


--
-- TOC entry 5090 (class 2606 OID 42908)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5091 (class 2606 OID 42913)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES max_transportes.carregamento(id_carregamento);


--
-- TOC entry 5092 (class 2606 OID 42918)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5093 (class 2606 OID 42923)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: max_transportes; Owner: postgres
--

ALTER TABLE ONLY max_transportes.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES max_transportes.veiculo(id_veiculo);


--
-- TOC entry 5094 (class 2606 OID 42928)
-- Name: motorista motorista_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motorista
    ADD CONSTRAINT motorista_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5095 (class 2606 OID 42933)
-- Name: usuarios usuarios_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 5096 (class 2606 OID 42938)
-- Name: usuarios usuarios_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5097 (class 2606 OID 42943)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5098 (class 2606 OID 42948)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES rota_certa_logistica.pedido(id_pedido);


--
-- TOC entry 5099 (class 2606 OID 42953)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES rota_certa_logistica.veiculo(id_veiculo);


--
-- TOC entry 5100 (class 2606 OID 42958)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5101 (class 2606 OID 42963)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES rota_certa_logistica.pedido(id_pedido);


--
-- TOC entry 5102 (class 2606 OID 42968)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5103 (class 2606 OID 42973)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5104 (class 2606 OID 42978)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5105 (class 2606 OID 42983)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES rota_certa_logistica.tipo_carga(tipo);


--
-- TOC entry 5106 (class 2606 OID 42988)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5107 (class 2606 OID 42993)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES rota_certa_logistica.carregamento(id_carregamento);


--
-- TOC entry 5108 (class 2606 OID 42998)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5109 (class 2606 OID 43003)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: rota_certa_logistica; Owner: postgres
--

ALTER TABLE ONLY rota_certa_logistica.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES rota_certa_logistica.veiculo(id_veiculo);


--
-- TOC entry 5110 (class 2606 OID 43008)
-- Name: carregamento carregamento_id_carregador_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.carregamento
    ADD CONSTRAINT carregamento_id_carregador_fkey FOREIGN KEY (id_carregador) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5111 (class 2606 OID 43013)
-- Name: carregamento carregamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.carregamento
    ADD CONSTRAINT carregamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES transportadora_xpto.pedido(id_pedido);


--
-- TOC entry 5112 (class 2606 OID 43018)
-- Name: carregamento carregamento_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.carregamento
    ADD CONSTRAINT carregamento_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transportadora_xpto.veiculo(id_veiculo);


--
-- TOC entry 5113 (class 2606 OID 43023)
-- Name: mensagemcliente fk_mensagem_cliente; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.mensagemcliente
    ADD CONSTRAINT fk_mensagem_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5114 (class 2606 OID 43028)
-- Name: mensagemcliente fk_mensagem_pedido; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.mensagemcliente
    ADD CONSTRAINT fk_mensagem_pedido FOREIGN KEY (id_pedido) REFERENCES transportadora_xpto.pedido(id_pedido);


--
-- TOC entry 5115 (class 2606 OID 43033)
-- Name: mensagemcliente fk_mensagem_transportadora; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.mensagemcliente
    ADD CONSTRAINT fk_mensagem_transportadora FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5116 (class 2606 OID 43038)
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 5117 (class 2606 OID 43043)
-- Name: pedido pedido_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.pedido
    ADD CONSTRAINT pedido_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5118 (class 2606 OID 43048)
-- Name: pedido pedido_tipo_carga_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.pedido
    ADD CONSTRAINT pedido_tipo_carga_fkey FOREIGN KEY (tipo_carga) REFERENCES transportadora_xpto.tipo_carga(tipo);


--
-- TOC entry 5119 (class 2606 OID 43053)
-- Name: tipo_carga tipo_carga_id_transportadora_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.tipo_carga
    ADD CONSTRAINT tipo_carga_id_transportadora_fkey FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id);


--
-- TOC entry 5120 (class 2606 OID 43058)
-- Name: viagem viagem_id_carregamento_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.viagem
    ADD CONSTRAINT viagem_id_carregamento_fkey FOREIGN KEY (id_carregamento) REFERENCES transportadora_xpto.carregamento(id_carregamento);


--
-- TOC entry 5121 (class 2606 OID 43063)
-- Name: viagem viagem_id_motorista_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.viagem
    ADD CONSTRAINT viagem_id_motorista_fkey FOREIGN KEY (id_motorista) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 5122 (class 2606 OID 43068)
-- Name: viagem viagem_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: transportadora_xpto; Owner: postgres
--

ALTER TABLE ONLY transportadora_xpto.viagem
    ADD CONSTRAINT viagem_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES transportadora_xpto.veiculo(id_veiculo);


--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-11-10 11:29:58

--
-- PostgreSQL database dump complete
--

