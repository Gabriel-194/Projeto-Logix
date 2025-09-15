unit loginService;

interface
uses
   System.SysUtils,uUsuario,loginRepository,login.types, LoginDto;
   type
   TloginService = class

    private
     loginRepo : TloginRepository;
    public
     function verificaLogin(aLoginDto: TLoginDto): TLoginResult;
  end;

implementation
{ TadminService }

function TloginService.verificaLogin(aLoginDto: TLoginDto): TLoginResult;
var usuario:TUsuario;
begin
  if aLoginDto.email.Trim = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if aLoginDto.Senha.Trim = '' then begin
    raise Exception.Create('senha é obrigatório.');
  end;

  usuario:=TUsuario.Create;
  usuario.setEmail(aLoginDto.email);
  usuario.setSenha_hash(aLoginDto.senha);

  if not loginRepo.VerificaLogin(usuario) then begin
    Result := lrFalhou;
    Exit;
  end;

  if loginRepo.VerificaAdmin(usuario) then
  begin
    Result := lrSucessoAdmin;
  end else begin
    Result := lrSucessoUsuario;
  end;
  usuario.Free;
end;

end.
