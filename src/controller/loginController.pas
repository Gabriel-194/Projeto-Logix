unit loginController;

interface
uses
  System.SysUtils, uUsuario, loginService;
    type
    TloginController = class
    public
      procedure verificaLogin(Ausuario: TUsuario);
    end;

implementation


{ TadminController }

procedure TloginController.verificaLogin(Ausuario: Tusuario);
var
 service : TloginService;
begin
  service := TloginService.Create;
  try
    service.verificaLogin(Ausuario);
  finally
    service.Free;
  end;
end;
end.
