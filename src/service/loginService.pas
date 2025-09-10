unit loginService;

interface
uses
   System.SysUtils,uUsuario,loginRepository,login.types;
   type
   TloginService = class

    private
     loginRepo : TloginRepository;
    public
     function verificaLogin(Ausuario : Tusuario): TLoginResult;
  end;

implementation
{ TadminService }

function TloginService.verificaLogin(Ausuario: Tusuario): TLoginResult;
begin
  if Ausuario.getEmail.Trim = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if Ausuario.getSenha_hash.Trim = '' then begin
    raise Exception.Create('senha é obrigatório.');
  end;

  if not loginRepo.VerificaLogin(AUsuario) then begin
    Result := lrFalhou;
    Exit;
  end;

  if loginRepo.VerificaAdmin(AUsuario) then
  begin
    Result := lrSucessoAdmin;
  end else begin
    Result := lrSucessoUsuario;
  end;
end;

end.
