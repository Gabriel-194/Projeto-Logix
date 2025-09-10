unit loginController;

interface
uses
  System.SysUtils, uUsuario, loginService, login.types;
    type
    TloginController = class
    public
      function verificaLogin(Ausuario: Tusuario):TLoginResult;
    end;

implementation


{ TadminController }

function TloginController.verificaLogin(Ausuario: Tusuario):TLoginResult;
var
 service : TloginService;
begin
  service := TloginService.Create;
  try
    Result := service.verificaLogin(Ausuario);
  finally
    service.Free;
  end;
end;
end.
