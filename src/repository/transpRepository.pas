unit transpRepository;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client;

type
  TTranspRepository = class
  private
    FConn: TFDConnection;
    const
      SchemaScript =
        'CREATE TABLE IF NOT EXISTS {schema}.cliente (' +
        '  id_cliente SERIAL PRIMARY KEY,' +
        '  nome VARCHAR(80),' +
        '  cpf VARCHAR(20),' +
        '  endereco VARCHAR(100),' +
        '  telefone VARCHAR(20),' +
        '  status BOOLEAN DEFAULT TRUE,' +
        '  data_cadastro TIMESTAMP DEFAULT now(),' +
        '  data_atualizacao TIMESTAMP DEFAULT now(),' +
        '  ativo BOOLEAN DEFAULT TRUE' +
        ');' +

        'CREATE TABLE IF NOT EXISTS {schema}.veiculo (' +
        '  id_veiculo SERIAL PRIMARY KEY,' +
        '  placa VARCHAR(80),' +
        '  modelo VARCHAR(25),' +
        '  ano INT,' +
        '  capacidade VARCHAR(30),' +
        '  status BOOLEAN,' +
        '  data_cadastro TIMESTAMP DEFAULT now(),' +
        '  data_atualizacao TIMESTAMP DEFAULT now(),' +
        '  ativo BOOLEAN DEFAULT TRUE' +
        ');' +

        'CREATE TABLE IF NOT EXISTS {schema}.tipo_carga (' +
        '  id_carga SERIAL PRIMARY KEY,' +
        '  tipo VARCHAR(50),' +
        '  descricao VARCHAR(255),' +
        '  preco_base_km DECIMAL(10,2)' +
        ');' +

        'CREATE TABLE IF NOT EXISTS {schema}.pedido (' +
        '  id_pedido SERIAL PRIMARY KEY,' +
        '  id_cliente INT REFERENCES {schema}.cliente(id_cliente),' +
        '  endereco_origem VARCHAR(100),' +
        '  endereco_destino VARCHAR(100),' +
        '  data_pedido TIMESTAMP DEFAULT now(),' +
        '  peso FLOAT,' +
        '  id_carga INT REFERENCES {schema}.tipo_carga(id_carga),' +
        '  preco DECIMAL(10,2)' +
        ');' +

        'CREATE TABLE IF NOT EXISTS {schema}.viagem (' +
        '  id_viagem SERIAL PRIMARY KEY,' +
        '  id_veiculo INT REFERENCES {schema}.veiculo(id_veiculo),' +
        '  id_motorista INT,' +
        '  data_saida_cd TIMESTAMP,' +
        '  data_chegada_cd TIMESTAMP,' +
        '  status VARCHAR(30),' +
        '  id_pedido INT REFERENCES {schema}.pedido(id_pedido),' +
        '  preco_frete DECIMAL(10,2),' +
        '  data_cadastro TIMESTAMP DEFAULT now(),' +
        '  data_atualizacao TIMESTAMP DEFAULT now()' +
        ');' +

        'CREATE TABLE IF NOT EXISTS {schema}.carregamento (' +
        '  id_carregamento SERIAL PRIMARY KEY,' +
        '  id_viagem INT REFERENCES {schema}.viagem(id_viagem),' +
        '  id_carregador INT,' +
        '  data_hora_inicio TIMESTAMP,' +
        '  data_hora_fim TIMESTAMP,' +
        '  status VARCHAR(30),' +
        '  data_cadastro TIMESTAMP DEFAULT now(),' +
        '  data_atualizacao TIMESTAMP DEFAULT now()' +
        ');' +

        'CREATE TABLE IF NOT EXISTS {schema}.carregamento_produto (' +
        '  id_carregamento INT REFERENCES {schema}.carregamento(id_carregamento),' +
        '  id_pedido INT REFERENCES {schema}.pedido(id_pedido),' +
        '  PRIMARY KEY (id_carregamento, id_pedido)' +
        ');';
  public
    constructor Create(AConn: TFDConnection);
    procedure CadastrarTransportadora(Nome, CNPJ, Telefone, Email, CEP: string);
  end;

implementation

{ TTranspRepository }

constructor TTranspRepository.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

procedure TTranspRepository.CadastrarTransportadora(Nome, CNPJ, Telefone, Email, CEP: string);
var
  FDQuery: TFDQuery;
  SQL: TStringList;
  SchemaName, Script: string;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FConn;

    SchemaName := StringReplace(LowerCase(Nome), ' ', '_', [rfReplaceAll]);

    FDQuery.SQL.Text :=
      'INSERT INTO public.transportadora (nome, cnpj, telefone, email, cep, ativo, schema_name) ' +
      'VALUES (:nome, :cnpj, :telefone, :email, :cep, TRUE, :schema_name)';
    FDQuery.ParamByName('nome').AsString := Nome;
    FDQuery.ParamByName('cnpj').AsString := CNPJ;
    FDQuery.ParamByName('telefone').AsString := Telefone;
    FDQuery.ParamByName('email').AsString := Email;
    FDQuery.ParamByName('cep').AsString := CEP;
    FDQuery.ParamByName('schema_name').AsString := SchemaName;
    FDQuery.ExecSQL;

    // Cria schema exclusivo
    FConn.ExecSQL('CREATE SCHEMA IF NOT EXISTS ' + SchemaName);
    Script := StringReplace(SchemaScript, '{schema}', SchemaName, [rfReplaceAll]);

    FConn.ExecSQL(Script);

  finally
    FDQuery.Free;
  end;
end;


end.

