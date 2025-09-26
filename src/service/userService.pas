unit userService;

interface
uses
uUsuario, system.Generics.Collections, BCrypt, System.SysUtils,userRepository;
  type TuserSerive = class
    procedure cadastrarUsuario(aUsuario:TUsuario);
  end;

implementation

{ TuserSerive }

procedure TuserSerive.cadastrarUsuario(aUsuario: TUsuario);
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

end.
