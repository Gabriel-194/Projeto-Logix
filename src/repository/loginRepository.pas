unit loginRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2;

type
  TLoginRepository = class
  public
    function VerificaLogin(AUsuario: TUsuario): Boolean;
    function VerificaAdmin(AUsuario: TUsuario): Boolean;
  end;

implementation

{ TLoginRepository }

function TLoginRepository.VerificaLogin(Ausuario: TUsuario): Boolean;
var
  FDQuery: TFDQuery;
begin
  Result := False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text :=
      'SELECT id_usuario FROM public.usuarios ' +
      'WHERE email = :email AND senha_hash = :senha';
    FDQuery.ParamByName('email').AsString := Ausuario.getEmail;
    FDQuery.ParamByName('senha').AsString := Ausuario.getSenha_hash;
    FDQuery.Open;

    Result := not FDQuery.IsEmpty;
  finally
    FDQuery.Free;
  end;
end;

function TLoginRepository.VerificaAdmin(Ausuario: TUsuario): Boolean;
begin
  Result :=
    (Ausuario.getEmail = 'LogixAdmin@gmail.com')
end;



end.

