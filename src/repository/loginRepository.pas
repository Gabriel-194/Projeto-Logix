unit loginRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,LoginDto;

type
  TLoginRepository = class
  public

    function FindByEmail(AEmail: string; out AUserId: Integer;out ASenhaHash: string;  out ATransportadoraId: Integer;
  out ACargo: string;out ASchemaName: string; out aidGrupo:integer): Boolean;
    function BuscaNomePorId(aUserId: Integer; clienteId: Integer): string;
    function findByEmailCliente(AEmail: string; out AClienteId: Integer;out ASenhaHash: string):boolean;
    procedure GravarToken(AEmail, AToken: string);
    function ValidarToken(AEmail, AToken: string): Boolean;
    procedure AtualizarSenhaPorToken(AEmail, AToken, ANovaSenhaHash: string);
  end;

implementation

{ TLoginRepository }




function TLoginRepository.FindByEmail(AEmail: string;out AUserId: Integer;out ASenhaHash: string;out ATransportadoraId: Integer;out ACargo: string;
  out ASchemaName: string; out aidGrupo:integer): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  AUserId := 0;
  ASenhaHash := '';
  ATransportadoraId := 0;
  ACargo := '';
  ASchemaName := '';
  aidGrupo:=0;

  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text :=
    'SELECT u.id_usuario, u.senha_hash, u.cargo_descricao,u.id_grupo, u.id_transportadora, t.schema_name ' +
    'FROM public.usuarios u ' +
    'LEFT JOIN public.transportadora t ON t.id = u.id_transportadora ' +
    'WHERE u.email = :email';
    FDQuery.ParamByName('email').AsString := AEmail;
    FDQuery.Open;
    if not FDQuery.IsEmpty then
    begin
      AUserId           := FDQuery.FieldByName('id_usuario').AsInteger;
      ASenhaHash        := FDQuery.FieldByName('senha_hash').AsString;
      ACargo            := FDQuery.FieldByName('cargo_descricao').AsString;
      ATransportadoraId := FDQuery.FieldByName('id_transportadora').AsInteger;
      ASchemaName       := FDQuery.FieldByName('schema_name').AsString;
      aidGrupo          := FDQuery.FieldByName('id_grupo').AsInteger;
      Result := True;
    end;
  finally
    FDQuery.Free;
  end;
end;


function TLoginRepository.findByEmailCliente( AEmail: string;
  out AClienteId: Integer; out ASenhaHash: string): boolean;
var
 FDQuery: TFDQuery;
 begin
 result:= false;
 aClienteId:= 0;
 aSenhaHash := '';

 FDQuery:= TFDQuery.create(nil);

 try
  FDQuery.Connection := DataModule2.FDConnection1;

  FDQuery.SQL.Text := 'SELECT id_cliente, senha_hash, nome FROM public.cliente WHERE email = :email';
    FDQuery.ParamByName('email').AsString := AEmail;
    FDQuery.Open;

  if not FDQuery.IsEmpty  then
  begin
    aClienteId := FDQuery.FieldByName('id_cliente').AsInteger;
    aSenhaHash := FDQuery.FieldByName('senha_hash').asString;

    result := true;
  end;
 finally
  FDQuery.Free;
 end;

end;

procedure TLoginRepository.AtualizarSenhaPorToken(AEmail, AToken,
  ANovaSenhaHash: string);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'UPDATE public.usuarios SET senha_hash = :senha, token = NULL WHERE email = :email AND token = :token';
    FDQuery.ParamByName('senha').AsString := ANovaSenhaHash;
    FDQuery.ParamByName('email').AsString := AEmail;
    FDQuery.ParamByName('token').AsString := AToken;
    FDQuery.ExecSQL;

    if FDQuery.RowsAffected = 0 then
    begin
      FDQuery.SQL.Text := 'UPDATE public.cliente SET senha_hash = :senha, token = NULL WHERE email = :email AND token = :token';
      FDQuery.ParamByName('senha').AsString := ANovaSenhaHash;
      FDQuery.ParamByName('email').AsString := AEmail;
      FDQuery.ParamByName('token').AsString := AToken;
      FDQuery.ExecSQL;
    end;
  finally
    FDQuery.Free;
  end;
end;

procedure TLoginRepository.GravarToken(AEmail, AToken: string);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'UPDATE public.usuarios SET token = :token WHERE email = :email';
    FDQuery.ParamByName('token').AsString := AToken;
    FDQuery.ParamByName('email').AsString := AEmail;
    FDQuery.ExecSQL;

    if FDQuery.RowsAffected = 0 then
    begin
       FDQuery.SQL.Text := 'UPDATE public.cliente SET token = :token WHERE email = :email';
       FDQuery.ParamByName('token').AsString := AToken;
       FDQuery.ParamByName('email').AsString := AEmail;
       FDQuery.ExecSQL;
    end;
  finally
    FDQuery.Free;
  end;
end;

function TLoginRepository.ValidarToken(AEmail, AToken: string): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text :=
      'SELECT 1 FROM public.usuarios WHERE email = :email AND token = :token ' +
      'UNION ' +
      'SELECT 1 FROM public.cliente WHERE email = :email AND token = :token';

    FDQuery.ParamByName('email').AsString := AEmail;
    FDQuery.ParamByName('token').AsString := AToken;
    FDQuery.Open;

    Result := not FDQuery.IsEmpty;
  finally
    FDQuery.Free;
  end;
end;

function TLoginRepository.BuscaNomePorId(aUserId: Integer; clienteId: Integer): string;
var
  FDQuery: TFDQuery;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    if (aUserId > 0) then
    begin
      FDQuery.SQL.Text :=
        'SELECT nome FROM usuarios WHERE id_usuario = :id_usuario';
      FDQuery.ParamByName('id_usuario').AsInteger := aUserId;
    end
    else if (clienteId > 0) then
    begin
      FDQuery.SQL.Text :=
        'SELECT nome FROM cliente WHERE id_cliente = :id_cliente';
      FDQuery.ParamByName('id_cliente').AsInteger := clienteId;
    end
    else
      Exit;

    FDQuery.Open;
    if not FDQuery.IsEmpty then
      Result := FDQuery.FieldByName('nome').AsString;
  finally
    FDQuery.Free;
  end;
end;


end.

