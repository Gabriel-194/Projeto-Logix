unit clienteRepository;

interface
uses
uCliente,System.SysUtils, FireDAC.Comp.Client,unit2,System.Generics.Collections,enderecoDto;
type TclienteRepository = class
  function CadastrarCliente(aCliente: Tcliente): Tcliente;
  function ListarCliente(idTransportadora: Integer): TObjectList<Tcliente>;
end;

implementation

{ TclienteRepository }

function TClienteRepository.CadastrarCliente(aCliente: Tcliente): Tcliente;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT id_cliente FROM public.cliente WHERE cpf = :cpf';
    FDQuery.ParamByName('cpf').AsString := acliente.getcpf;;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      FDQuery.Close;
      raise Exception.Create('Já existe um cliente cadastrado com este CPF.');
    end;

    FDQuery.SQL.Text :=
      'INSERT INTO cliente (nome, cpf, telefone, email, cep, estado, municipio, endereco, numero, senha_hash, ativo, data_cadastro, data_atualizacao) ' +
      'VALUES (:nome, :cpf, :telefone, :email, :cep, :estado, :municipio, :endereco, :numero, :senha_hash, TRUE, NOW(), NOW()) ';

    FDQuery.ParamByName('NOME').AsString := acliente.getNome;
    FDQuery.ParamByName('CPF').AsString := acliente.getcpf;
    FDQuery.ParamByName('TELEFONE').AsString := acliente.getTelefone;
    FDQuery.ParamByName('EMAIL').AsString := acliente.getemail;
    FDQuery.ParamByName('senha_hash').AsString := acliente.getSenha_hash;
    FDQuery.ParamByName('CEP').AsString := acliente.getEndereco.cep;
    FDQuery.ParamByName('estado').AsString := acliente.getEndereco.estado;
    FDQuery.ParamByName('municipio').AsString := acliente.getEndereco.municipio;
    FDQuery.ParamByName('endereco').AsString := acliente.getEndereco.endereco;
    FDQuery.ParamByName('numero').AsInteger := acliente.getEndereco.numero;

    FDQuery.ExecSQL;

  finally
    FDQuery.Free;
  end;
end;


function TclienteRepository.ListarCliente(idTransportadora: Integer): TObjectList<Tcliente>;
var
  FDQuery: TFDQuery;
  cliente: Tcliente;
  lista: TObjectList<Tcliente>;
  schemaName:string;
begin
  lista := TObjectList<Tcliente>.Create(True);
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    FDQuery.ParamByName('id_transportadora').AsInteger := IdTransportadora;
    FDQuery.Open;

    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.SQL.Text:= 'SELECT DISTINCT c.id_cliente, c.nome ' +
      'FROM public.cliente c ' +
      'JOIN '+schemaName+'.pedido p ON p.id_cliente = c.id_cliente ' +
      'WHERE p.id_transportadora = :idtransp';
    FDQuery.ParamByName('idtransp').AsInteger := idTransportadora;
    FDQuery.Open;
    while not FDQuery.Eof do
    begin
      cliente := Tcliente.Create;
      cliente.setId(FDQuery.FieldByName('id_cliente').AsInteger);
      cliente.setNome(FDQuery.FieldByName('nome').AsString);
      lista.Add(cliente);
      FDQuery.Next;
    end;
    Result := lista;
  finally
    FDQuery.Free;
  end;
end;

end.
