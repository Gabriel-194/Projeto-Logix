unit loginController;

interface
uses
  System.SysUtils, uLogin, loginService;

implementation
  type
    TloginController = class
    public
      procedure verificaLogin(ALogin: TLogin);
    end;

{ TadminController }

procedure TloginController.verificaLogin(Alogin: TLogin);
var
 service : TloginService;
begin

end;

end.
