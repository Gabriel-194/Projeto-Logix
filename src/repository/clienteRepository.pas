unit clienteRepository;

interface
uses
uCliente,System.SysUtils, FireDAC.Comp.Client,unit2,System.Generics.Collections,enderecoDto;
type TclienteRepository = class
  procedure cadastrarCliente(aCliente:Tcliente);
end;

implementation

{ TclienteRepository }

procedure TclienteRepository.cadastrarCliente(aCliente: Tcliente);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text :=
      'INSERT INTO cliente (nome, cpf, telefone, email,cep,estado,municipio,endereco,numero, senha_hash, ativo, data_cadastro, data_atualizacao) ' +
      'VALUES (:nome, :cpf, :telefone, :email, :cep, :estado, :municipio, :endereco, :numero, :senha_hash, TRUE, NOW(), NOW())';

    FDQuery.ParamByName('NOME').AsString := acliente.getNome;
    FDQuery.ParamByName('CPF').AsString := acliente.getcpf;
    FDQuery.ParamByName('TELEFONE').AsString := acliente.getTelefone;
    FDQuery.ParamByName('EMAIL').AsString := acliente.getemail;
    FDQuery.ParamByName('senha_hash').AsString := acliente.getSenha_hash;
    FDQuery.ParamByName('CEP').AsString := acliente.getEndereco.cep;
    FDQuery.ParamByName('estado').AsString := acliente.getEndereco.estado;
    FDQuery.ParamByName('municipio').AsString := acliente.getEndereco.municipio;
    FDQuery.ParamByName('endereco').AsString := acliente.getEndereco.endereco;
    FDQuery.ParamByName('numero').AsInteger := (acliente.getEndereco.numero);

    FDQuery.ExecSQL;

  finally
    FDQuery.free;
  end;
end;


end.
