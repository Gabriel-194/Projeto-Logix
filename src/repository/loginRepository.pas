unit loginRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,LoginDto;

type
  TLoginRepository = class
  public
    function VerificaLogin(AUsuario: TUsuario): Boolean;
    function VerificaAdmin(AUsuario: TUsuario): Boolean;
    function FindByEmail(AEmail: string; out AUserId: Integer; out ASenhaHash: string): Boolean;
  end;

implementation

{ TLoginRepository }




function TLoginRepository.FindByEmail(AEmail: string; out AUserId: Integer;
  out ASenhaHash: string): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  AUserId := 0;
  ASenhaHash := '';

  FDQuery := TFDQuery.Create(nil);

  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT id_usuario, senha_hash, cargo_descricao FROM public.usuarios WHERE email = :email';
    FDQuery.ParamByName('email').AsString := AEmail;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      AUserId    := FDQuery.FieldByName('id_usuario').AsInteger;
      ASenhaHash := FDQuery.FieldByName('senha_hash').AsString;

      Result := True;
    end;
  finally
    FDQuery.Free;
  end;
end;


function TLoginRepository.VerificaLogin(AUsuario: TUsuario): Boolean;
begin

end;

end.

