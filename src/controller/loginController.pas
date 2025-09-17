unit loginController;

interface
uses
  System.SysUtils, uUsuario, loginService, login.types, LoginDto;
    type
    TloginController = class
    public
      function verificaLogin(ALoginDto: TLoginDto;out aUser: TUsuario):TLoginResult;
    end;

implementation


{ TadminController }

function TloginController.verificaLogin(ALoginDto: TLoginDto;out aUser: TUsuario):TLoginResult;
var
 service : TloginService;
begin
  service := TloginService.Create;
  try
    Result := service.verificaLogin(ALoginDto);
  finally
    service.Free;
  end;
end;
end.
