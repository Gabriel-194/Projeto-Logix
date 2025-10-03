unit userService;

interface
uses
uUsuario, system.Generics.Collections, BCrypt, System.SysUtils,userRepository,motoristaDto;
  type TuserService = class
    procedure cadastrarUsuario(aUsuario:TUsuario);
    function mostrarUser(const aCargo: string): TObjectList<Tusuario>;
    procedure editarUser (aUsuario:TUsuario);
    procedure excluirUser(aUsuario: TUsuario); overload;
    procedure excluirUser(aMotorista: TmotoristaDto); overload;
    function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
    procedure recuperarUser(aUsuario:Tusuario);overload;
    procedure recuperarUser(aMotorista: TmotoristaDto); overload;
// =============MOTORISTA======================================================
    procedure cadastrarMotorista(motorista:TmotoristaDto);
    function mostrarMotorista:Tlist<TmotoristaDto>;

  end;

implementation

procedure TuserService.cadastrarMotorista(motorista: TmotoristaDto);
var
  userRepo: TuserRepository;
  HashedSenha : String;
  validadeLimpa : integer;
begin
  if Trim(motorista.nome) = '' then begin
    raise Exception.Create('Nome é obrigatório.');
  end;

  if Trim(motorista.email) = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if Trim(motorista.senha) = '' then begin
    raise Exception.Create('Senha é obrigatória.');
  end;

  if Trim(motorista.cpf) = '' then begin
    raise Exception.Create('CPF é obrigatório.');
  end;

  if Trim(motorista.telefone) = '' then begin
    raise Exception.Create('Telefone é obrigatório.');
  end;

  if Trim(motorista.NumeroCNH) = '' then begin
    raise Exception.Create('O numero da CNH é obrigatório.');
  end;

  if Trim(motorista.CategoriaCNH) = '' then begin
    raise Exception.Create('A categoria da CNH é obrigatória.');
  end;


 if motorista.ValidadeCNH = 0 then begin
    raise Exception.Create('A validade da CNH é obrigatória.');
  end;

  HashedSenha := TBCrypt.HashPassword(motorista.senha);
  motorista.senha := HashedSenha;

  userRepo := TuserRepository.Create;
  try
    userRepo.cadastrarMotorista(motorista);
  finally
    userRepo.Free;
  end;
end;

{ TuserSerive }

procedure TuserService.cadastrarUsuario(aUsuario: TUsuario);
var
userRepo: TuserRepository;
HashedSenha : String;
begin

  if Trim(aUsuario.getNome) = '' then
  begin
    raise Exception.Create('O nome do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getEmail) = '' then
  begin
    raise Exception.Create('O e-mail do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getSenha_hash) = '' then
  begin
    raise Exception.Create('A senha é obrigatória.');
  end;

  if Trim(aUsuario.getcpf) = '' then
  begin
    raise Exception.Create('O CPF é obrigatório.');
  end;

  if Trim(aUsuario.gettelefone) = '' then
  begin
    raise Exception.Create('O telefone é obrigatório.');
  end;


  HashedSenha := TBCrypt.HashPassword(aUsuario.getSenha_hash);
  aUsuario.setSenha_hash(HashedSenha);

  userRepo := TuserRepository.Create;
  try
    userRepo.CadastrarUsuario(aUsuario);
  finally
    userRepo.Free;
  end;
end;

procedure TuserService.editarUser(aUsuario: TUsuario);
var
  userRepo: TuserRepository;
  HashedSenha : String;
begin

  if Trim(aUsuario.getNome) = '' then
  begin
    raise Exception.Create('O nome do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getEmail) = '' then
  begin
    raise Exception.Create('O e-mail do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getcpf) = '' then
  begin
    raise Exception.Create('O CPF é obrigatório.');
  end;

  if Trim(aUsuario.gettelefone) = '' then
  begin
    raise Exception.Create('O telefone é obrigatório.');
  end;

  if Trim(aUsuario.getSenha_hash) = '' then
  begin
   userRepo.editarUserNotSenha(aUsuario);
   raise Exception.Create('usuario editado, mantendo a mesma senha');
  end else begin
    HashedSenha := TBCrypt.HashPassword(aUsuario.getSenha_hash);
    aUsuario.setSenha_hash(HashedSenha);

    userRepo := TuserRepository.Create;
  try
    userRepo.editarUser(aUsuario);
  finally
    userRepo.Free;
  end;
  end;

end;


procedure TuserService.excluirUser(aMotorista: TmotoristaDto);
var
  userRepo: TUserRepository;
begin

  userRepo := TUserRepository.create;
  try
    userRepo.excluirUser(aMotorista.IdUsuario);
  finally
    userRepo.free;
  end;
end;

procedure TuserService.excluirUser(aUsuario: TUsuario);
var
  userRepo: TUserRepository;
begin
  userRepo := TUserRepository.create;
  try
    userRepo.excluirUser(aUsuario.GetID);
  finally
    userRepo.free;
  end;
end;

function TuserService.mostrarMotorista: Tlist<TmotoristaDto>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.mostrarMotorista;
  finally
    userRepo.free;
  end;
end;

function TuserService.mostrarUser(const aCargo: string): TObjectList<Tusuario>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.mostrarUser(aCargo);
  finally
    userRepo.free;
  end;
end;

function TuserService.MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.MostrarUserInativo(aCargo);
  finally
    userRepo.free;
  end;
end;

procedure TuserService.recuperarUser(aMotorista: TmotoristaDto);
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    userRepo.recuperarUser(aMotorista.IdUsuario);
  finally
    userRepo.free;
  end;
end;

procedure TuserService.recuperarUser(aUsuario: Tusuario);
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    userRepo.recuperarUser(aUsuario.GetID);
  finally
    userRepo.free;
  end;
end;
end.
