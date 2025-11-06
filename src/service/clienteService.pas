unit clienteService;

interface
uses
system.Generics.Collections, BCrypt, System.SysUtils,uCliente, clienteRepository,uLog,usuarioLogado;

type TclienteService = class
  procedure cadastrarCliente(aCliente:Tcliente);
  function ListarCliente(idTransportadora: Integer): TObjectList<Tcliente>;
end;

implementation
var
systemLog:Tlogger;

{ TclienteService }

procedure TclienteService.cadastrarCliente(aCliente: Tcliente);
var
clienteRepo: TclienteRepository;
HashedSenha : String;
begin

  if Trim(aCliente.getNome) = '' then
  begin
    raise Exception.Create('O nome do usuário é obrigatório.');
  end;

  if Trim(aCliente.getEmail) = '' then
  begin
    raise Exception.Create('O e-mail do usuário é obrigatório.');
  end;

  if Trim(aCliente.getSenha_hash) = '' then
  begin
    raise Exception.Create('A senha é obrigatória.');
  end;

  if Trim(aCliente.getcpf) = '' then
  begin
    raise Exception.Create('O CPF é obrigatório.');
  end;

  if Trim(aCliente.gettelefone) = '' then
  begin
    raise Exception.Create('O telefone é obrigatório.');
  end;

  if trim(acliente.getEndereco.cep) = '' then
  begin
    raise Exception.Create('O CEP é obrigatório.');
  end;

  HashedSenha := TBCrypt.HashPassword(aCliente.getSenha_hash);
  aCliente.setSenha_hash(HashedSenha);

  ClienteRepo := TClienteRepository.Create;
  try
    clienteRepo.cadastrarCliente(aCliente);
    SystemLog.Log('',
    Format('[CREATE] Um cliente se cadastrou no dia %s e no horário %s',
    [FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    clienteRepo.Free;
    systemLog.free;
  end;
end;

function TclienteService.ListarCliente(idTransportadora: Integer): TObjectList<Tcliente>;
var
repo:tClienteRepository;
begin
repo:=tClienteRepository.create;
  try
    result := repo.ListarCliente(idTransportadora);
  finally
    repo.free;
  end;
end;

end.
