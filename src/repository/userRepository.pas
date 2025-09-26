unit userRepository;

interface
uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,System.Generics.Collections;
type
  TUserRepository = class
  public
    procedure cadastrarUsuario(aUsuario: TUsuario);
  end;


implementation

{ TuserRepository }

procedure TUserRepository.cadastrarUsuario(aUsuario: TUsuario);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text :=
    'INSERT INTO USUARIOS (nome, email, senha_hash, cpf, telefone, cargo_descricao, id_transportadora) ' +
    'VALUES (:nome, :email, :senha_hash, :cpf, :telefone, :cargo_descricao, :id_transportadora)';

  FDQuery.ParamByName('NOME').AsString := aUsuario.getNome;
  FDQuery.ParamByName('EMAIL').AsString := aUsuario.getemail;
  FDQuery.ParamByName('senha_hash').AsString := aUsuario.getSenha_hash;
  FDQuery.ParamByName('CPF').AsString := aUsuario.getcpf;
  FDQuery.ParamByName('TELEFONE').AsString := aUsuario.getTelefone;
  FDQuery.ParamByName('cargo_descricao').AsString := aUsuario.getCargo_descricao;
  FDQuery.ParamByName('ID_TRANSPORTADORA').AsInteger := aUsuario.getidTransportadora;

  FDQuery.ExecSQL;
  finally
  FDQuery.free;
  end;

end;

end.
