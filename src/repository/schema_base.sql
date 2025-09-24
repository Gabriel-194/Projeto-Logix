-- Criação do schema da transportadora
CREATE SCHEMA IF NOT EXISTS {schema};

-- Tabela cliente
CREATE TABLE IF NOT EXISTS {schema}.cliente (
  id_cliente SERIAL PRIMARY KEY,
  nome VARCHAR(80),
  cpf VARCHAR(20),
  endereco VARCHAR(100),
  telefone VARCHAR(20),
  status BOOLEAN DEFAULT TRUE,
  data_cadastro TIMESTAMP DEFAULT now(),
  data_atualizacao TIMESTAMP DEFAULT now(),
  ativo BOOLEAN DEFAULT TRUE
);

-- Tabela veiculo
CREATE TABLE IF NOT EXISTS {schema}.veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(10) NOT NULL unique,
    modelo VARCHAR(50),
    ano INTEGER,
    tipo_carga VARCHAR(50),
    capacidade INTEGER NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT now(),
    data_atualizacao TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Tabela tipo_carga
CREATE TABLE IF NOT EXISTS {schema}.tipo_carga (
  id_carga SERIAL PRIMARY KEY,
  tipo VARCHAR(50),
  descricao VARCHAR(255),
  preco_base_km DECIMAL(10,2)
);

-- Tabela pedido
CREATE TABLE IF NOT EXISTS {schema}.pedido (
  id_pedido SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES {schema}.cliente(id_cliente),
  endereco_origem VARCHAR(100),
  endereco_destino VARCHAR(100),
  data_pedido TIMESTAMP DEFAULT now(),
  peso FLOAT,
  id_carga INT REFERENCES {schema}.tipo_carga(id_carga),
  preco DECIMAL(10,2)
);

-- Tabela viagem
CREATE TABLE IF NOT EXISTS {schema}.viagem (
  id_viagem SERIAL PRIMARY KEY,
  id_veiculo INT REFERENCES {schema}.veiculo(id_veiculo),
  id_motorista INT,
  data_saida_cd TIMESTAMP,
  data_chegada_cd TIMESTAMP,
  status VARCHAR(30),
  id_pedido INT REFERENCES {schema}.pedido(id_pedido),
  preco_frete DECIMAL(10,2),
  data_cadastro TIMESTAMP DEFAULT now(),
  data_atualizacao TIMESTAMP DEFAULT now()
);

-- Tabela carregamento
CREATE TABLE IF NOT EXISTS {schema}.carregamento (
  id_carregamento SERIAL PRIMARY KEY,
  id_viagem INT REFERENCES {schema}.viagem(id_viagem),
  id_carregador INT,
  data_hora_inicio TIMESTAMP,
  data_hora_fim TIMESTAMP,
  status VARCHAR(30),
  data_cadastro TIMESTAMP DEFAULT now(),
  data_atualizacao TIMESTAMP DEFAULT now()
);

-- Tabela carregamento_produto
CREATE TABLE IF NOT EXISTS {schema}.carregamento_produto (
  id_carregamento INT REFERENCES {schema}.carregamento(id_carregamento),
  id_pedido INT REFERENCES {schema}.pedido(id_pedido),
  PRIMARY KEY (id_carregamento, id_pedido)
);
