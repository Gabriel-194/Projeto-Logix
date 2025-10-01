unit loginService;

interface
uses
   System.SysUtils,uUsuario,loginRepository, loginTypes, LoginDto, BCrypt,uCliente;
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
  aClienteId: Integer;
  cargo: string;
  cliente: TCliente;
  nomeCliente: string;
begin
  if aLoginDto.email.Trim = '' then
    raise Exception.Create('E-mail � obrigat�rio.');
  if aLoginDto.Senha.Trim = '' then
    raise Exception.Create('Senha � obrigat�ria.');

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
        Exit(lrSucessoAdmin)
      else
        Exit(lrSucessoUsuario);
    end
    else
      Exit(lrFalhou);
  end;

  if loginRepo.findByEmailCliente(aLoginDto.email, aClienteId, senhaHashDoBanco) then
  begin
    if TBCrypt.CheckPassword(aLoginDto.Senha, senhaHashDoBanco, rehashNecessario) then
    begin
      cliente := TCliente.Create;
      cliente.setId(aClienteId);
      cliente.setEmail(aLoginDto.email);
      cliente.setNome(nomeCliente);

      Exit(lrSucessoCliente);
    end
    else
      Exit(lrFalhou);
  end;

  Result := lrFalhou;
end;

end.
