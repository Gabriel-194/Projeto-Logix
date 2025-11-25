unit loginService;

interface
uses
   System.SysUtils,uUsuario,loginRepository, loginTypes, LoginDto, BCrypt,uCliente,uEmailHelper;
   type
   TloginService = class

    private
     loginRepo : TloginRepository;
    public
    function verificaLogin(aLoginDto: TLoginDto; var user: TUsuario; var cliente:Tcliente): TLoginResult;
    procedure SolicitarRecuperacaoSenha(AEmail: string);
     function ValidarTokenRecuperacao(AEmail, AToken: string): Boolean;
     procedure RedefinirSenha(AEmail, AToken, ANovaSenha: string);

  end;

implementation


procedure TloginService.SolicitarRecuperacaoSenha(AEmail: string);
var
  Token: string;
  uid, tid, gid: Integer;
  sh, cg, sn: string;
  cid: Integer;
  EmailExiste: Boolean;
  repo:TloginRepository;
begin
  repo:=TloginRepository.create;
  try
    EmailExiste := Repo.FindByEmail(AEmail, uid, sh, tid, cg, sn, gid);
    if not EmailExiste then
     EmailExiste := Repo.findByEmailCliente(AEmail, cid, sh);

    if not EmailExiste then
    raise Exception.Create('E-mail não encontrado na base de dados.');

    Randomize;
    Token := FormatFloat('000000', Random(999999));

    Repo.GravarToken(AEmail, Token);

    TEmailHelper.EnviarEmailRecuperacao(AEmail, Token);
  finally
    repo.free;
  end;

end;

function TloginService.ValidarTokenRecuperacao(AEmail, AToken: string): Boolean;
var
 repo:TloginRepository;
begin
  repo:=TloginRepository.create;
  try
    Result := Repo.ValidarToken(AEmail, AToken);
  finally
    repo.free;
  end;
end;

procedure TloginService.RedefinirSenha(AEmail, AToken, ANovaSenha: string);
var
  NovaSenhaHash: string;
 repo:TloginRepository;
begin
  repo:=TloginRepository.create;
  try
  if not loginRepo.ValidarToken(AEmail, AToken) then
    raise Exception.Create('Token inválido ou expirado.');

    NovaSenhaHash := TBCrypt.HashPassword(ANovaSenha, 10);

    loginRepo.AtualizarSenhaPorToken(AEmail, AToken, NovaSenhaHash);
  finally
    repo.free;
  end;

end;

{ TadminService }

function TloginService.verificaLogin(aLoginDto: TLoginDto; var user: TUsuario; var cliente:Tcliente): TLoginResult;
var
  userId: Integer;
  senhaHashDoBanco: string;
  rehashNecessario: Boolean;
  transportadoraId: Integer;
  aClienteId: Integer;
  cargo: string;
  nomeCliente: string;
  schemaName:string;
  idGrupo:Integer;
begin
  if aLoginDto.email.Trim = '' then
    raise Exception.Create('E-mail é obrigatório.');
  if aLoginDto.Senha.Trim = '' then
    raise Exception.Create('Senha é obrigatória.');

  if loginRepo.FindByEmail(aLoginDto.email, userId, senhaHashDoBanco, transportadoraId, cargo, schemaName,idGrupo) then
  begin
    if TBCrypt.CheckPassword(aLoginDto.Senha, senhaHashDoBanco, rehashNecessario) then
    begin
      user := TUsuario.Create;
      user.setId(userId);
      user.setEmail(aLoginDto.email);
      user.setNome(loginRepo.BuscaNomePorId(userId,0));
      user.setIdTransportadora(transportadoraId);
      user.setCargo_descricao(cargo);
      user.setSchemaName(SchemaName);
      user.setIdGrupo(idGrupo);

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
      cliente.setNome(loginRepo.BuscaNomePorId(0,aClienteid));

      Exit(lrSucessoCliente);
    end
    else
      Exit(lrFalhou);
  end;

  Result := lrFalhou;
end;

end.
