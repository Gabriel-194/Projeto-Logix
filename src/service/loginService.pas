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
  transportadoraId: Integer;
  cargo: string;
begin
  if aLoginDto.email.Trim = '' then
    raise Exception.Create('E-mail é obrigatório.');
  if aLoginDto.Senha.Trim = '' then
    raise Exception.Create('Senha é obrigatória.');

  if loginRepo.FindByEmail(aLoginDto.email, userId, senhaHashDoBanco, transportadoraId, cargo) then
  begin
    if TBCrypt.CheckPassword(aLoginDto.Senha, senhaHashDoBanco, rehashNecessario) then
    begin
      user := TUsuario.Create;
      user.setId(userId);
      user.setEmail(aLoginDto.email);
      user.setNome(loginRepo.BuscaNomePorId(userId));
      user.setIdTransportadora(transportadoraId);
      user.setCargo_descricao(cargo);

      if SameText(cargo, 'adminLogix') then
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
