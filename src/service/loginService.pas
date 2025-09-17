unit loginService;

interface
uses
   System.SysUtils,uUsuario,loginRepository,login.types, LoginDto, BCrypt;
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
var
  userId: Integer;
  senhaHashDoBanco: string;
  rehashNecessario: Boolean;
begin
  if aLoginDto.email.Trim = '' then
    raise Exception.Create('E-mail é obrigatório.');
  if aLoginDto.Senha.Trim = '' then
    raise Exception.Create('Senha é obrigatória.');

  if loginRepo.FindByEmail(aLoginDto.email, userId, senhaHashDoBanco) then
  begin

    if TBCrypt.CheckPassword(aLoginDto.Senha, senhaHashDoBanco, rehashNecessario) then
    begin

      if (aLoginDto.email = 'LogixAdmin@gmail.com') then
      begin
        Result := lrSucessoAdmin;
      end
      else
      begin
        Result := lrSucessoUsuario;
      end;
    end
    else

      Result := lrFalhou;
  end
  else
    Result := lrFalhou;
end;

end.
