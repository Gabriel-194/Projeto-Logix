unit loginService;

interface
uses
   System.SysUtils,ulogin,loginRepository;

implementation
type
  TloginService = class
    private
     loginRepo : TloginRepository;
    public
     procedure verificaLogin(ALogin : TLogin);
  end;

{ TadminService }

procedure TloginService.verificaLogin(Alogin: TLogin);
begin
  if ALogin.getEmail.Trim = '' then begin
    raise Exception.Create('E-mail � obrigat�rio.');
  end;

  if Alogin.getSenha.Trim = '' then begin
    raise Exception.Create('senha � obrigat�rio.');
  end;
end;

end.
