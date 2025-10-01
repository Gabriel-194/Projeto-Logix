unit clienteService;

interface
uses
system.Generics.Collections, BCrypt, System.SysUtils,uCliente, clienteRepository;

type TclienteService = class
  procedure cadastrarCliente(aCliente:Tcliente);
end;

implementation

{ TclienteService }

procedure TclienteService.cadastrarCliente(aCliente: Tcliente);
var
clienteRepo: TclienteRepository;
HashedSenha : String;
begin

  if Trim(aCliente.getNome) = '' then
  begin
    raise Exception.Create('O nome do usu�rio � obrigat�rio.');
  end;

  if Trim(aCliente.getEmail) = '' then
  begin
    raise Exception.Create('O e-mail do usu�rio � obrigat�rio.');
  end;

  if Trim(aCliente.getSenha_hash) = '' then
  begin
    raise Exception.Create('A senha � obrigat�ria.');
  end;

  if Trim(aCliente.getcpf) = '' then
  begin
    raise Exception.Create('O CPF � obrigat�rio.');
  end;

  if Trim(aCliente.gettelefone) = '' then
  begin
    raise Exception.Create('O telefone � obrigat�rio.');
  end;

  if trim(acliente.getEndereco.cep) = '' then
  begin
    raise Exception.Create('O CEP � obrigat�rio.');
  end;



  HashedSenha := TBCrypt.HashPassword(aCliente.getSenha_hash);
  aCliente.setSenha_hash(HashedSenha);

  ClienteRepo := TClienteRepository.Create;
  try
    clienteRepo.cadastrarCliente(aCliente);
  finally
    clienteRepo.Free;
  end;
end;

end.
