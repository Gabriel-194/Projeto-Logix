unit adminRepository;

interface
uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,adminDto, System.Generics.Collections;
type TadminRepository = class
  procedure cadastrarAdmin(AadminDto :TadminDto);
  function mostrarAdmins: TList<TadminDto>;
  procedure excluirAdmin (AadminDto :TadminDto);
  function AdminInativo: TList<TadminDto>;
  procedure recuperarAdmin (AadminDto :TadminDto);
  procedure EditarAdmin(Aadmindto:TadminDto);


end;

implementation

{ TadminRepository }

procedure TadminRepository.cadastrarAdmin(AadminDto: TadminDto);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text :=
      'INSERT INTO public.usuarios ' +
      '(nome, cpf, telefone, email, senha_hash, cargo_descricao, ativo, status, data_cadastro, data_atualizacao, id_transportadora) ' +
      'VALUES (:nome, :cpf, :telefone, :email, :senha_hash, :cargo_descricao, TRUE, TRUE, NOW(), NOW(), :id_transportadora)';

    FDQuery.ParamByName('nome').AsString := AadminDto.nome;
    FDQuery.ParamByName('cpf').AsString := AadminDto.cpf;
    FDQuery.ParamByName('telefone').AsString := AadminDto.telefone;
    FDQuery.ParamByName('email').AsString := AadminDto.email;
    FDQuery.ParamByName('senha_hash').AsString := AadminDto.senha;
    FDQuery.ParamByName('cargo_descricao').AsString := 'ADMIN';
    FDQuery.ParamByName('id_transportadora').AsInteger := AadminDto.idTransportadora;

    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;


procedure TadminRepository.EditarAdmin(Aadmindto: TadminDto);
var
  FDquery: TFDQuery;
begin
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

    FDQuery.SQL.Text := 'UPDATE public.usuarios SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, senha_hash = :senha_hash, id_transportadora = :id_transportadora ' +
                    'WHERE id_usuario = :id_usuario';
    FDQuery.ParamByName('id_usuario').AsInteger := AadminDto.idAdmin;
    FDQuery.ParamByName('nome').AsString := AadminDto.nome;
    FDQuery.ParamByName('cpf').AsString := AadminDto.cpf;
    FDQuery.ParamByName('telefone').AsString := AadminDto.telefone;
    FDQuery.ParamByName('email').AsString := AadminDto.email;
    FDQuery.ParamByName('senha_hash').AsString := AadminDto.senha;
    FDQuery.ParamByName('id_transportadora').AsInteger := AadminDto.idTransportadora;

    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;

end;

procedure TadminRepository.excluirAdmin(AadminDto: TadminDto);
var
   FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.usuarios SET ativo = FALSE WHERE id_usuario = :id_usuario AND cargo_descricao = ''ADMIN''';
     FDQuery.ParamByName('id_usuario').AsInteger := AadminDto.idAdmin;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;


function TadminRepository.mostrarAdmins: TList<TAdminDto>;
var
  Lista: TList<TadminDto>;
  adminDto: TadminDto;
  FDquery: TFDQuery;
begin
  Lista := TList<TAdminDto>.Create;
  FDQuery := TFDquery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT id_usuario, nome, cpf, id_transportadora, telefone, email ' +
                    'FROM public.usuarios ' +
                    'WHERE ativo = TRUE AND cargo_descricao = ''ADMIN'' ' +
                    'ORDER BY id_usuario';

    FDQuery.Open;

    adminDto := Default(TadminDto);
    while not FDQuery.Eof do
    begin

      adminDto.idAdmin := FDQuery.FieldByName('id_usuario').AsInteger;
      adminDto.Nome:= FDQuery.FieldByName('nome').AsString;
      adminDto.cpf := FDQuery.FieldByName('cpf').AsString;
      adminDto.idTransportadora := FDQuery.FieldByName('id_transportadora').AsInteger;
      adminDto.Telefone := FDQuery.FieldByName('telefone').AsString;
      adminDto.Email := FDQuery.FieldByName('email').AsString;

      Lista.Add(adminDto);
      FDQuery.Next;
    end;
    Result := Lista;
  finally
    FDQuery.free;
  end;
end;

procedure TadminRepository.recuperarAdmin(AadminDto: TadminDto);
var
  FDquery: TFDQuery;
  adminDto: TadminDto;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.usuarios SET ativo = True WHERE id_usuario = :id_usuario and cargo_descricao = ''ADMIN'' ' ;
     FDQuery.ParamByName('id_usuario').AsInteger := AadminDto.idAdmin;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;

function TadminRepository.AdminInativo: TList<TadminDto>;
var
  Lista: TList<TadminDto>;
  adminDto: TadminDto;
  FDquery: TFDQuery;
begin
  Lista := TList<TAdminDto>.Create;
  FDQuery := TFDquery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT id_usuario, nome, cpf, id_transportadora, telefone, email ' +
                    'FROM public.usuarios ' +
                    'WHERE ativo = false AND cargo_descricao = ''ADMIN'' ' +
                    'ORDER BY id_usuario';

    FDQuery.Open;

    adminDto := Default(TadminDto);
    while not FDQuery.Eof do
    begin

      adminDto.idAdmin := FDQuery.FieldByName('id_usuario').AsInteger;
      adminDto.Nome:= FDQuery.FieldByName('nome').AsString;
      adminDto.cpf := FDQuery.FieldByName('cpf').AsString;
      adminDto.idTransportadora := FDQuery.FieldByName('id_transportadora').AsInteger;
      adminDto.Telefone := FDQuery.FieldByName('telefone').AsString;
      adminDto.Email := FDQuery.FieldByName('email').AsString;

      Lista.Add(adminDto);
      FDQuery.Next;
    end;
    Result := Lista;
  finally
    FDQuery.free;
  end;
end;

end.
