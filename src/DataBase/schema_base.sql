-- Criação do schema da transportadora
CREATE SCHEMA IF NOT EXISTS {schema};

-- Veículo
CREATE TABLE IF NOT EXISTS {schema}.veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    ano INTEGER,
    tipo_carga VARCHAR(50),
    capacidade INTEGER,
    unidade_medida VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMPTZ DEFAULT NOW(),
    data_atualizacao TIMESTAMPTZ DEFAULT NOW(),
    id_motorista INTEGER,
    CONSTRAINT fk_veiculo_motorista
        FOREIGN KEY (id_motorista)
        REFERENCES public.motorista (id_usuario)
   status varchar(50)
);

-- Tipo de carga
CREATE TABLE IF NOT EXISTS {schema}.tipo_carga (
  id_carga SERIAL PRIMARY KEY,
  tipo VARCHAR (50) UNIQUE,
  preco_base_km DECIMAL(10,2),
id_transportadora INTEGER NOT NULL,
FOREIGN KEY (id_transportadora) REFERENCES public.transportadora(id)
);

-- Pedido (cliente vem do PUBLIC)
CREATE TABLE IF NOT EXISTS {schema}.pedido (
  id_pedido SERIAL PRIMARY KEY,
  id_cliente INT NOT NULL REFERENCES public.cliente(id_cliente),
  
  -- Origem
  cep_origem VARCHAR(15),
  estado_origem VARCHAR(2),
  municipio_origem VARCHAR(50),
  endereco_origem VARCHAR(100),
  numero_origem VARCHAR(10),
  
  -- Destino
  cep_destino VARCHAR(15),
  estado_destino VARCHAR(2),
  municipio_destino VARCHAR(50),
  endereco_destino VARCHAR(100),
  numero_destino VARCHAR(10),
	
  distancia_km float,
  data_pedido TIMESTAMP DEFAULT now(),
  peso FLOAT,
  tipo_carga varchar(50) NOT NULL REFERENCES {schema}.tipo_carga(tipo),
  preco DECIMAL(10,2),
  id_transportadora INT NOT NULL REFERENCES public.transportadora(id),
  status VARCHAR(20) DEFAULT 'confirmado',
  ativo boolean default true
);

-- Viagem (ligando motorista, veículo e pedido)
CREATE TABLE IF NOT EXISTS {schema}.viagem (
  id_viagem SERIAL PRIMARY KEY,
  id_veiculo INT NOT NULL REFERENCES {schema}.veiculo(id_veiculo),
  id_motorista INT NOT NULL REFERENCES public.motorista(id_motorista),
  data_saida_cd TIMESTAMP,
  data_chegada_cd TIMESTAMP,
  status VARCHAR(30),
  id_pedido INT NOT NULL REFERENCES {schema}.pedido(id_pedido),
  preco_frete DECIMAL(10,2),
  data_cadastro TIMESTAMP DEFAULT now(),
  data_atualizacao TIMESTAMP DEFAULT now()
);

-- Carregamento
CREATE TABLE IF NOT EXISTS {schema}.carregamento (
  id_carregamento SERIAL PRIMARY KEY,
  id_viagem INT NOT NULL REFERENCES {schema}.viagem(id_viagem),
  id_carregador INT, -- pode futuramente ser um usuário com cargo "carregador"
  data_hora_inicio TIMESTAMP,
  data_hora_fim TIMESTAMP,
  status VARCHAR(30),
  data_cadastro TIMESTAMP DEFAULT now(),
  data_atualizacao TIMESTAMP DEFAULT now()
);

-- Carregamento_produto
CREATE TABLE IF NOT EXISTS {schema}.carregamento_produto (
  id_carregamento INT REFERENCES {schema}.carregamento(id_carregamento),
  id_pedido INT REFERENCES {schema}.pedido(id_pedido),
  PRIMARY KEY (id_carregamento, id_pedido)
);
