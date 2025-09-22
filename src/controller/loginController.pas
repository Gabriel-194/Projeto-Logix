unit loginController;

interface
uses
  System.SysUtils, uUsuario, loginService, loginTypes, LoginDto;
    type
    TloginController = class
    public
      function verificaLogin(ALoginDto: TLoginDto; out aUser: TUsuario): TloginResult;
    end;

implementation


{ TadminController }

function TloginController.verificaLogin(ALoginDto: TLoginDto; out aUser: TUsuario): TloginResult;
var
 service : TloginService;
begin
  service := TloginService.Create;
  try
    Result := service.verificaLogin(ALoginDto, aUser);
  finally
    service.Free;
  end;
end;
end.
