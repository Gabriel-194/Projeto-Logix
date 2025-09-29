unit userService;

interface
uses
uUsuario, system.Generics.Collections, BCrypt, System.SysUtils,userRepository;
  type TuserService = class
    procedure cadastrarUsuario(aUsuario:TUsuario);
    function mostrarGerente: TobjectList<Tusuario>;
    procedure editarUser (aUsuario:TUsuario);
    procedure excluirUser(aUsuario:TUsuario);
    function mostrarGerenteInativo: TobjectList<Tusuario>;
    procedure recuperarUser(aUsuario:Tusuario);
  end;

implementation

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
    userRepo.editarUser(aUsuario);
  finally
    userRepo.Free;
  end;
end;
procedure TuserService.excluirUser(aUsuario: TUsuario);
var
userRepo:TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    userRepo.excluirUser(aUsuario);
  finally
    userRepo.free;
  end;
end;

function TuserService.mostrarGerente: TobjectList<Tusuario>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.mostrarGerente;
  finally
    userRepo.free;
  end;
end;

function TuserService.mostrarGerenteInativo: TobjectList<Tusuario>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.MostrarGerenteInativo;
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
    userRepo.recuperarUser(aUsuario);
  finally
    userRepo.free;
  end;
end;

end.
