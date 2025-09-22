unit loginService;

interface
uses
   System.SysUtils,uUsuario,loginRepository, loginTypes, LoginDto, BCrypt;
   type
   TloginService = class

    private
     loginRepo : TloginRepository;
    public
    function verificaLogin(aLoginDto: TLoginDto; var user: TUsuario): TLoginResult;

  end;

implementation


{ TadminService }

function TloginService.verificaLogin(aLoginDto: TLoginDto; var user: TUsuario): TLoginResult;
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
      // instancia o user
      user := TUsuario.Create;
      user.setId(userId);
      user.setEmail(aLoginDto.email);
      user.setNome(loginRepo.BuscaNomePorId(userId)); // exemplo, se você tiver no banco

      if SameText(aLoginDto.email, 'LogixAdmin@gmail.com') then
        Result := lrSucessoAdmin
      else
        Result := lrSucessoUsuario;
    end
    else
      Result := lrFalhou;
  end
  else
    Result := lrFalhou;
end;

end.
