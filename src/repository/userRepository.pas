unit userRepository;

interface
uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,System.Generics.Collections;
type
  TUserRepository = class
  public
    procedure cadastrarUsuario(aUsuario: TUsuario);
    function mostrarUser(const aCargo: string): TObjectList<Tusuario>;
    procedure editarUser(aUsuario: TUsuario);
    procedure excluirUser(aUsuario:Tusuario);
    function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
    procedure recuperarUser(aUsuario:Tusuario);
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
    'INSERT INTO USUARIOS (nome, cpf, telefone, email, senha_hash, cargo_descricao, ativo, status, data_cadastro, data_atualizacao, id_transportadora) ' +
    'VALUES (:nome, :cpf, :telefone, :email, :senha_hash, :cargo_descricao, TRUE, TRUE, NOW(), NOW(), :id_transportadora)';

  FDQuery.ParamByName('NOME').AsString := aUsuario.getNome;
  FDQuery.ParamByName('EMAIL').AsString := aUsuario.getemail;
  FDQuery.ParamByName('senha_hash').AsString := aUsuario.getSenha_hash;
  FDQuery.ParamByName('CPF').AsString := aUsuario.getcpf;
  FDQuery.ParamByName('TELEFONE').AsString := aUsuario.getTelefone;
  FDQuery.ParamByName('cargo_descricao').AsString := aUsuario.getCargo_descricao;
  FDQuery.ParamByName('id_transportadora').AsInteger := aUsuario.getidTransportadora;

  FDQuery.ExecSQL;
  finally
  FDQuery.free;
  end;

end;

procedure TUserRepository.editarUser(aUsuario: TUsuario);
var
  FDquery: TFDQuery;
begin
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

    FDQuery.SQL.Text := 'UPDATE public.usuarios SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, senha_hash = :senha_hash ' +
                    'WHERE id_usuario = :id_usuario';
  FDQuery.ParamByName('id_usuario').AsInteger := aUsuario.getId;
  FDQuery.ParamByName('NOME').AsString := aUsuario.getNome;
  FDQuery.ParamByName('EMAIL').AsString := aUsuario.getemail;
  FDQuery.ParamByName('senha_hash').AsString := aUsuario.getSenha_hash;
  FDQuery.ParamByName('CPF').AsString := aUsuario.getcpf;
  FDQuery.ParamByName('TELEFONE').AsString := aUsuario.getTelefone;

    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;

end;

procedure TUserRepository.excluirUser(aUsuario: Tusuario);
var
   FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.usuarios SET ativo = FALSE WHERE id_usuario = :id_usuario';
     FDQuery.ParamByName('id_usuario').AsInteger := aUsuario.getId;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;

function TUserRepository.mostrarUser(const aCargo: string): TObjectList<Tusuario>;
var
  user: Tusuario;
  FDQuery : TFDQuery;
begin
  Result := TObjectList<Tusuario>.Create;
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT id_usuario, nome, cpf, id_transportadora, telefone, email, cargo_descricao ' +
                        'FROM public.usuarios ' +
                        'WHERE ativo = TRUE AND cargo_descricao = :cargo ' +
                        'ORDER BY id_usuario';
    FDQuery.ParamByName('cargo').AsString := aCargo;

    FDQuery.Open;

    user := Default(Tusuario);
    while not FDQuery.Eof do
    begin
      user := TUsuario.Create;
      user.setId(FDQuery.FieldByName('id_usuario').AsInteger);
      user.setNome(FDQuery.FieldByName('nome').AsString);
      user.setCpf(FDQuery.FieldByName('cpf').AsString);
      user.SetIdTransportadora(FDQuery.FieldByName('id_transportadora').AsInteger);
      user.setTelefone(FDQuery.FieldByName('telefone').AsString);
      user.setEmail(FDQuery.FieldByName('email').AsString);
      user.setCargo_descricao(FDQuery.FieldByName('cargo_descricao').AsString);

      Result.Add(user);
      FDQuery.Next;
    end;
  finally
    FDQuery.free;
  end;
end;

function TUserRepository.MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
var
  user: Tusuario;
  FDQuery : TFDQuery;
begin
  Result := TObjectList<Tusuario>.Create;
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT id_usuario, nome, cpf, id_transportadora, telefone, email, cargo_descricao ' +
                        'FROM public.usuarios ' +
                        'WHERE ativo = false AND cargo_descricao = :cargo ' +
                        'ORDER BY id_usuario';
    FDQuery.ParamByName('cargo').AsString := aCargo;

    FDQuery.Open;

    user := Default(Tusuario);
    while not FDQuery.Eof do
    begin
      user := TUsuario.Create;
      user.setId(FDQuery.FieldByName('id_usuario').AsInteger);
      user.setNome(FDQuery.FieldByName('nome').AsString);
      user.setCpf(FDQuery.FieldByName('cpf').AsString);
      user.SetIdTransportadora(FDQuery.FieldByName('id_transportadora').AsInteger);
      user.setTelefone(FDQuery.FieldByName('telefone').AsString);
      user.setEmail(FDQuery.FieldByName('email').AsString);
      user.setCargo_descricao(FDQuery.FieldByName('cargo_descricao').AsString);

      Result.Add(user);
      FDQuery.Next;
    end;
  finally
    FDQuery.free;
  end;
end;

procedure TUserRepository.recuperarUser(aUsuario: Tusuario);
var
   FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.usuarios SET ativo = true WHERE id_usuario = :id_usuario';
     FDQuery.ParamByName('id_usuario').AsInteger := aUsuario.getId;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;

end.
