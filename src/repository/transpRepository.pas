unit transpRepository;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client;

type
  TTranspRepository = class
  private
    FConn: TFDConnection;
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
  SchemaName: string;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FConn;

    // Gera schema_name a partir do nome
    FDQuery.SQL.Text := 'SELECT gerar_schema_name(:nome) AS schema_name';
    FDQuery.ParamByName('nome').AsString := Nome;
    FDQuery.Open;
    SchemaName := FDQuery.FieldByName('schema_name').AsString;

    // Insere transportadora no schema public
    FDQuery.SQL.Text :=
      'INSERT INTO public.transportadora (nome, cnpj, telefone, email, cep, senha, ativo, schema_name) ' +
      'VALUES (:nome, :cnpj, :telefone, :email, :cep, :senha, TRUE, :schema_name)';
    FDQuery.ParamByName('nome').AsString := Nome;
    FDQuery.ParamByName('cnpj').AsString := CNPJ;
    FDQuery.ParamByName('telefone').AsString := Telefone;
    FDQuery.ParamByName('email').AsString := Email;
    FDQuery.ParamByName('cep').AsString := CEP;
    FDQuery.ParamByName('schema_name').AsString := SchemaName;
    FDQuery.ExecSQL;

    // Cria schema exclusivo
    FConn.ExecSQL('CREATE SCHEMA ' + SchemaName);

    // Cria tabelas dentro do schema
    SQL := TStringList.Create;
    try
      SQL.Add('CREATE TABLE ' + SchemaName + '.cliente (' +
              'id_cliente SERIAL PRIMARY KEY,' +
              'nome VARCHAR(80),' +
              'cpf VARCHAR(20),' +
              'endereco VARCHAR(100),' +
              'telefone VARCHAR(20),' +
              'status BOOLEAN DEFAULT TRUE,' +
              'data_cadastro TIMESTAMP DEFAULT now()' +
              ');');

      SQL.Add('CREATE TABLE ' + SchemaName + '.veiculo (' +
              'id_veiculo SERIAL PRIMARY KEY,' +
              'placa VARCHAR(80),' +
              'modelo VARCHAR(25),' +
              'ano INT,' +
              'capacidade VARCHAR(30),' +
              'status BOOLEAN,' +
              'data_cadastro TIMESTAMP DEFAULT now()' +
              ');');

      FConn.ExecSQL(SQL.Text);
    finally
      SQL.Free;
    end;
  finally
    FDQuery.Free;
  end;
end;

end.

