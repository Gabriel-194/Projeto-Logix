unit uCliente;

interface
uses
  EnderecoDto;
type Tcliente = class
protected
  id :integer;
  nome: String;
  cpf: String;
  email:String;
  Telefone : String;
  senha_hash : String;
  Endereco: TEndereco;

public

  procedure setId(aId : Integer);
  function getId : Integer;

  procedure setNome(aNome : String);
  function getNome : String;

  procedure setCpf(aCpf: String);
  function getCpf: String;

  procedure setEmail(aEmail: String);
  function getEmail: String;

  procedure setTelefone(aTelefone:String);
  function getTelefone:String;

  procedure setSenha_hash(aSenha_hash: String);
  function getSenha_hash: String;

  procedure setEndereco(aEndereco: TEndereco); // 2. O novo "setter"
  function getEndereco: TEndereco;

end;

implementation

{ Tcliente }

procedure TCliente.setEndereco(aEndereco: TEndereco);
begin
  Self.Endereco := aEndereco;
end;

function TCliente.getEndereco: TEndereco;
begin
  Result := Self.Endereco;
end;

function Tcliente.getCpf: String;
begin
Result := Self.cpf;
end;

function Tcliente.getEmail: String;
begin
Result := Self.email;
end;

function Tcliente.getId: Integer;
begin
  Result := Self.id;
end;

function Tcliente.getNome: String;
begin
  Result := Self.nome;
end;


function Tcliente.getSenha_hash: String;
begin
Result := Self.senha_hash;
end;

function Tcliente.getTelefone: String;
begin
Result := Self.telefone;
end;


procedure Tcliente.setCpf(aCpf: String);
begin
Self.cpf:= aCpf;
end;

procedure Tcliente.setEmail(aEmail: String);
begin
Self.email := aEmail;
end;

procedure Tcliente.setId(aId: Integer);
begin
Self.id := aId;
end;

procedure Tcliente.setNome(aNome: String);
begin
Self.nome := aNome;
end;

procedure Tcliente.setSenha_hash(aSenha_hash: String);
begin
Self.senha_hash:=aSenha_hash;
end;

procedure Tcliente.setTelefone(aTelefone: String);
begin
Self.Telefone := aTelefone;
end;

end.
