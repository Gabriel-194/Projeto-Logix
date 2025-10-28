unit loginRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,LoginDto;

type
  TLoginRepository = class
  public
    function VerificaLogin(AUsuario: TUsuario): Boolean;
//    function VerificaAdmin(AUsuario: TUsuario): Boolean;
    function FindByEmail(AEmail: string; out AUserId: Integer;out ASenhaHash: string;  out ATransportadoraId: Integer;
  out ACargo: string;out ASchemaName: string): Boolean;
    function BuscaNomePorId(aUserId: Integer; clienteId: Integer): string;
    function findByEmailCliente(AEmail: string; out AClienteId: Integer;out ASenhaHash: string):boolean;
  end;

implementation

{ TLoginRepository }




function TLoginRepository.FindByEmail(AEmail: string;out AUserId: Integer;out ASenhaHash: string;out ATransportadoraId: Integer;out ACargo: string;
  out ASchemaName: string
): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  AUserId := 0;
  ASenhaHash := '';
  ATransportadoraId := 0;
  ACargo := '';
  ASchemaName := '';

  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text :=
      'SELECT u.id_usuario, u.senha_hash, u.cargo_descricao, u.id_transportadora, t.schema_name ' +
      'FROM public.usuarios u ' +
      'JOIN public.transportadora t ON t.id = u.id_transportadora ' +
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

function TLoginRepository.VerificaLogin(AUsuario: TUsuario): Boolean;
begin

end;

end.

