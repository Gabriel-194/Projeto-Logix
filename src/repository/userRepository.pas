unit userRepository;

interface
uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,System.Generics.Collections,motoristaDto;
type
  TUserRepository = class
  public
    procedure cadastrarUsuario(aUsuario: TUsuario);
    function mostrarUser(const aCargo: string): TObjectList<Tusuario>;
    procedure editarUser(aUsuario: TUsuario);
    procedure excluirUser(aID: Integer);
    function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
    procedure recuperarUser(aID: Integer);
    procedure editarUserNotSenha(aUsuario: TUsuario);
//====================MOTORISTA=================================================
  procedure cadastrarMotorista(motorista: TmotoristaDto);
  function mostrarMotorista:Tlist<TmotoristaDto>;
  function mostrarMotoristaInativo:Tlist<TmotoristaDto>;
  procedure editarMotorista(motorista: TmotoristaDto);
  procedure editarMotoristaNotSenha(motorista: TmotoristaDto);
  end;


implementation

{ TuserRepository }

procedure TUserRepository.cadastrarMotorista(motorista: TmotoristaDto);
var
  FDQuery: TFDQuery;
  idNovoUsuario: Integer;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.Connection.StartTransaction;

    try
      FDQuery.SQL.Text :=
        'INSERT INTO public.usuarios ' +
        '(nome, cpf, telefone, email, senha_hash, cargo_descricao, ativo, data_cadastro, data_atualizacao, id_transportadora) ' +
        'VALUES (:nome, :cpf, :telefone, :email, :senha_hash, :cargo_descricao, TRUE, NOW(), NOW(), :id_transportadora) ' +
        'RETURNING id_usuario';

      FDQuery.ParamByName('nome').AsString := motorista.nome;
      FDQuery.ParamByName('cpf').AsString := motorista.cpf;
      FDQuery.ParamByName('telefone').AsString := motorista.telefone;
      FDQuery.ParamByName('email').AsString := motorista.email;
      FDQuery.ParamByName('senha_hash').AsString := motorista.senha;
      FDQuery.ParamByName('cargo_descricao').AsString := 'motorista';
      FDQuery.ParamByName('id_transportadora').AsInteger := motorista.idTransportadora;

      FDQuery.Open;

      if not FDQuery.IsEmpty then
      begin
        idNovoUsuario := FDQuery.FieldByName('id_usuario').AsInteger;
      end
      else
      begin
        raise Exception.Create('Falha ao obter o ID do novo usuário após a inserção.');
      end;

      FDQuery.Close;

      FDQuery.SQL.Text :=
        'INSERT INTO public.motorista ' +
        '(id_usuario, numero_cnh, categoria_cnh, validade_cnh, data_cadastro, data_atualizacao) ' +
        'VALUES (:id_usuario, :numero_cnh, :categoria_cnh, :validade_cnh, NOW(), NOW())';

      FDQuery.ParamByName('id_usuario').AsInteger := idNovoUsuario;
      FDQuery.ParamByName('numero_cnh').AsString := motorista.NumeroCNH;
      FDQuery.ParamByName('categoria_cnh').AsString := motorista.CategoriaCNH;
      FDQuery.ParamByName('validade_cnh').AsDate := motorista.ValidadeCNH;

      FDQuery.ExecSQL;

      FDQuery.Connection.Commit;

    except
      on E: Exception do
      begin
        FDQuery.Connection.Rollback;
        raise Exception.Create('Erro ao cadastrar motorista: ' + E.Message);
      end;
    end;

  finally
    FDQuery.Free;
  end;
end;

procedure TUserRepository.cadastrarUsuario(aUsuario: TUsuario);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text :=
    'INSERT INTO USUARIOS (nome, cpf, telefone, email, senha_hash, cargo_descricao, ativo, data_cadastro, data_atualizacao, id_transportadora) ' +
    'VALUES (:nome, :cpf, :telefone, :email, :senha_hash, :cargo_descricao, TRUE, NOW(), NOW(), :id_transportadora)';

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

procedure TUserRepository.editarMotorista(motorista: TmotoristaDto);
var
  FDQuery: TFDQuery;
  idNovoUsuario: Integer;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.Connection.StartTransaction;

    try
      FDQuery.SQL.Text :=
      'UPDATE public.usuarios SET ' +
      'nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, senha_hash = :senha_hash, ' +
      'data_atualizacao = NOW()' +
      'WHERE id_usuario = :id_usuario ' +
      'RETURNING id_usuario';

      FDQuery.ParamByName('id_usuario').AsInteger := motorista.IdUsuario;
      FDQuery.ParamByName('nome').AsString := motorista.nome;
      FDQuery.ParamByName('cpf').AsString := motorista.cpf;
      FDQuery.ParamByName('telefone').AsString := motorista.telefone;
      FDQuery.ParamByName('email').AsString := motorista.email;
      FDQuery.ParamByName('senha_hash').AsString := motorista.senha;

      FDQuery.Open;

      if not FDQuery.IsEmpty then
      begin
        idNovoUsuario := FDQuery.FieldByName('id_usuario').AsInteger;
      end
      else
      begin
        raise Exception.Create('Falha ao obter o ID do novo usuário após a inserção.');
      end;

      FDQuery.Close;

      FDQuery.SQL.Text :=
      'UPDATE public.motorista SET ' +
      'numero_cnh = :numero_cnh, categoria_cnh = :categoria_cnh, ' +
      'validade_cnh = :validade_cnh, data_atualizacao = NOW() ' +
      'WHERE id_usuario = :id_usuario';

      FDQuery.ParamByName('id_usuario').AsInteger := idNovoUsuario;
      FDQuery.ParamByName('numero_cnh').AsString := motorista.NumeroCNH;
      FDQuery.ParamByName('categoria_cnh').AsString := motorista.CategoriaCNH;
      FDQuery.ParamByName('validade_cnh').AsDate := motorista.ValidadeCNH;

      FDQuery.ExecSQL;

      FDQuery.Connection.Commit;

    except
      on E: Exception do
      begin
        FDQuery.Connection.Rollback;
        raise Exception.Create('Erro ao editar motorista: ' + E.Message);
      end;
    end;

  finally
    FDQuery.Free;
  end;
end;

procedure TUserRepository.editarMotoristaNotSenha(motorista: TmotoristaDto);
var
  FDQuery: TFDQuery;
  idNovoUsuario: Integer;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.Connection.StartTransaction;

    try
      FDQuery.SQL.Text :=
      'UPDATE public.usuarios SET ' +
      'nome = :nome, cpf = :cpf, telefone = :telefone, email = :email,' +
      'data_atualizacao = NOW()' +
      'WHERE id_usuario = :id_usuario ' +
      'RETURNING id_usuario';

      FDQuery.ParamByName('id_usuario').AsInteger:= motorista.idUsuario;
      FDQuery.ParamByName('nome').AsString := motorista.nome;
      FDQuery.ParamByName('cpf').AsString := motorista.cpf;
      FDQuery.ParamByName('telefone').AsString := motorista.telefone;
      FDQuery.ParamByName('email').AsString := motorista.email;

      FDQuery.Open;

      if not FDQuery.IsEmpty then
      begin
        idNovoUsuario := FDQuery.FieldByName('id_usuario').AsInteger;
      end
      else
      begin
        raise Exception.Create('Falha ao obter o ID do novo usuário após a inserção.');
      end;

      FDQuery.Close;

      FDQuery.SQL.Text :=
      'UPDATE public.motorista SET ' +
      'numero_cnh = :numero_cnh, categoria_cnh = :categoria_cnh, ' +
      'validade_cnh = :validade_cnh, data_atualizacao = NOW() ' +
      'WHERE id_usuario = :id_usuario';

      FDQuery.ParamByName('id_usuario').AsInteger := idNovoUsuario;
      FDQuery.ParamByName('numero_cnh').AsString := motorista.NumeroCNH;
      FDQuery.ParamByName('categoria_cnh').AsString := motorista.CategoriaCNH;
      FDQuery.ParamByName('validade_cnh').AsDate := motorista.ValidadeCNH;

      FDQuery.ExecSQL;

      FDQuery.Connection.Commit;

    except
      on E: Exception do
      begin
        FDQuery.Connection.Rollback;
        raise Exception.Create('Erro ao editar motorista: ' + E.Message);
      end;
    end;

  finally
    FDQuery.Free;
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

procedure TUserRepository.editarUserNotSenha(aUsuario: TUsuario);
var
  FDquery: TFDQuery;
begin
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

    FDQuery.SQL.Text := 'UPDATE public.usuarios SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email '+'WHERE id_usuario = :id_usuario';
    FDQuery.ParamByName('id_usuario').AsInteger := aUsuario.getId;
    FDQuery.ParamByName('nome').AsString := aUsuario.getNome;
    FDQuery.ParamByName('email').AsString := aUsuario.getemail;
    FDQuery.ParamByName('cpf').AsString := aUsuario.getcpf;
    FDQuery.ParamByName('telefone').AsString := aUsuario.getTelefone;

    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

procedure TUserRepository.excluirUser(aID: Integer);
var
  aUsuario :Tusuario;
   FDQuery: TFDQuery;
   motorista : TmotoristaDto;
begin
  aUsuario :=Tusuario.create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.usuarios SET ativo = FALSE WHERE id_usuario = :id_usuario';
     FDQuery.ParamByName('id_usuario').AsInteger := aID;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
    aUsuario.free;
  end;
end;

function TUserRepository.mostrarMotorista: Tlist<TmotoristaDto>;
var
  motorista: TmotoristaDto;
  FDQuery : TFDQuery;
  Lista: TList<TmotoristaDto>;
begin
  lista := Tlist<TmotoristaDto>.Create;
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

  FDQuery.SQL.Text :=
  'SELECT u.id_usuario, u.nome, u.cpf, u.telefone, u.email, u.cargo_descricao, ' +
  'u.id_transportadora, m.categoria_cnh, m.numero_cnh, m.validade_cnh ' +
  'FROM usuarios u JOIN motorista m ON u.id_usuario = m.id_usuario where ativo = true ORDER BY id_usuario';


    FDQuery.Open;

    motorista := Default(TmotoristaDto);

    while not FDQuery.Eof do
    begin

      motorista.IdUsuario:= FDQuery.FieldByName('id_usuario').AsInteger;
      motorista.Nome:= FDQuery.FieldByName('nome').AsString;
      motorista.CPF := FDQuery.FieldByName('cpf').AsString;
      motorista.idTransportadora := FDQuery.FieldByName('id_transportadora').AsInteger;
      motorista.Telefone := FDQuery.FieldByName('telefone').AsString;
      motorista.Email := FDQuery.FieldByName('email').AsString;
      motorista.cargo := FDQuery.FieldByName('cargo_descricao').AsString;
      motorista.CategoriaCNH := FDQuery.FieldByName('categoria_cnh').AsString;
      motorista.NumeroCNH := FDQuery.FieldByName('numero_cnh').AsString;
      motorista.validadeCnh := FDQuery.FieldByName('validade_cnh').AsDateTime;

      lista.Add(motorista);
      FDQuery.Next;
    end;
    Result := Lista;
  finally
    FDQuery.free;
  end;
end;

function TUserRepository.mostrarMotoristaInativo: Tlist<TmotoristaDto>;
var
  motorista: TmotoristaDto;
  FDQuery : TFDQuery;
  Lista: TList<TmotoristaDto>;
begin
  lista := Tlist<TmotoristaDto>.Create;
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

  FDQuery.SQL.Text :=
  'SELECT u.id_usuario, u.nome, u.cpf, u.telefone, u.email, u.cargo_descricao, ' +
  'u.id_transportadora, m.categoria_cnh, m.numero_cnh, m.validade_cnh ' +
  'FROM usuarios u JOIN motorista m ON u.id_usuario = m.id_usuario where ativo = false ORDER BY id_usuario';


    FDQuery.Open;

    motorista := Default(TmotoristaDto);

    while not FDQuery.Eof do
    begin

      motorista.IdUsuario:= FDQuery.FieldByName('id_usuario').AsInteger;
      motorista.Nome:= FDQuery.FieldByName('nome').AsString;
      motorista.CPF := FDQuery.FieldByName('cpf').AsString;
      motorista.idTransportadora := FDQuery.FieldByName('id_transportadora').AsInteger;
      motorista.Telefone := FDQuery.FieldByName('telefone').AsString;
      motorista.Email := FDQuery.FieldByName('email').AsString;
      motorista.cargo := FDQuery.FieldByName('cargo_descricao').AsString;
      motorista.CategoriaCNH := FDQuery.FieldByName('categoria_cnh').AsString;
      motorista.NumeroCNH := FDQuery.FieldByName('numero_cnh').AsString;
      motorista.validadeCnh := FDQuery.FieldByName('validade_cnh').AsDateTime;

      lista.Add(motorista);
      FDQuery.Next;
    end;
    Result := Lista;
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

procedure TUserRepository.recuperarUser(aID: Integer);
var
  motorista:TmotoristaDto;
   FDQuery: TFDQuery;
   usuario:Tusuario;
begin
  usuario:=Tusuario.create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.usuarios SET ativo = true WHERE id_usuario = :id_usuario';
     FDQuery.ParamByName('id_usuario').AsInteger := aID;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
    usuario.free;
  end;
end;

end.
