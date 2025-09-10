unit loginService;

interface
uses
   System.SysUtils,uUsuario,loginRepository;
   type
      TLoginResult = (lrFalhou, lrSucessoUsuario, lrSucessoAdmin);
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
    Result := lrFalhou; // Retorna o status de falha
    Exit;
  end;

  if loginRepo.VerificaAdmin(AUsuario) then
  begin
    Result := lrSucessoAdmin; // Retorna o status de Admin
  end else begin
    Result := lrSucessoUsuario; // Retorna o status de Usuário Comum
  end;
end;

end.
