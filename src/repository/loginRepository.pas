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
  out ACargo: string): Boolean;
    function BuscaNomePorId(const aUserId: Integer): string;
    function findByEmailCliente(AEmail: string; out AClienteId: Integer;out ASenhaHash: string):boolean;
  end;

implementation

{ TLoginRepository }




function TLoginRepository.FindByEmail(AEmail: string; out AUserId: Integer;
  out ASenhaHash: string;  out ATransportadoraId: Integer;
  out ACargo: string): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  AUserId := 0;
  ASenhaHash := '';
  ATransportadoraId := 0;
  ACargo := '';

  FDQuery := TFDQuery.Create(nil);

  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT id_usuario, senha_hash, cargo_descricao, id_transportadora FROM public.usuarios WHERE email = :email';
    FDQuery.ParamByName('email').AsString := AEmail;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      AUserId    := FDQuery.FieldByName('id_usuario').AsInteger;
      ASenhaHash := FDQuery.FieldByName('senha_hash').AsString;
      ACargo := FDQuery.FieldByName('cargo_descricao').AsString;
      ATransportadoraId := FDQuery.FieldByName('id_transportadora').AsInteger;

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

  FDQuery.SQL.Text := 'SELECT id_cliente, senha_hash FROM public.cliente WHERE email = :email';
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

function TLoginRepository.BuscaNomePorId(const aUserId: Integer): string;
var
  FDQuery: TFDQuery;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text :=
      'SELECT nome FROM usuarios WHERE id_usuario = :id_usuario';
    FDQuery.ParamByName('id_usuario').AsInteger := aUserId;
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

