unit uCliente;

interface
type Tcliente = class
protected
  id :integer;
  nome: String;
  cpf: String;
  email:String;
  Telefone : String;
  senha_hash : String;
  cep: String;
  estado :string;
  municipio:string;
  endereco:string;
  numero :integer;
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

  procedure setCep(aCep: String);
  function getCep: String;

  procedure setEstado(aEstado: String);
  function getEstado: String;

  procedure setmunicipio(aMunicipio: String);
  function getmunicipio: String;

  procedure setEndereco(aEndereco: String);
  function getEndereco: String;

  procedure setNumero(aNumero: integer);
  function getNumero: integer;

end;

implementation

{ Tcliente }

function Tcliente.getCep: String;
begin
Result := Self.cep;
end;

function Tcliente.getCpf: String;
begin
Result := Self.cpf;
end;

function Tcliente.getEmail: String;
begin
Result := Self.email;
end;

function Tcliente.getEndereco: String;
begin
Result := Self.endereco;
end;

function Tcliente.getEstado: String;
begin
Result := Self.estado;
end;

function Tcliente.getId: Integer;
begin
  Result := Self.id;
end;

function Tcliente.getmunicipio: String;
begin
  Result := Self.municipio;
end;

function Tcliente.getNome: String;
begin
  Result := Self.nome;
end;

function Tcliente.getNumero: integer;
begin
Result := Self.numero;
end;

function Tcliente.getSenha_hash: String;
begin
Result := Self.senha_hash;
end;

function Tcliente.getTelefone: String;
begin
Result := Self.telefone;
end;

procedure Tcliente.setCep(aCep: String);
begin
Self.cep := acep;
end;

procedure Tcliente.setCpf(aCpf: String);
begin
Self.cpf:= aCpf;
end;

procedure Tcliente.setEmail(aEmail: String);
begin
Self.email := aEmail;
end;

procedure Tcliente.setEndereco(aEndereco: String);
begin
Self.endereco := aEndereco;
end;

procedure Tcliente.setEstado(aEstado: String);
begin
Self.estado:= aEstado;
end;

procedure Tcliente.setId(aId: Integer);
begin
Self.id := aId;
end;

procedure Tcliente.setmunicipio(aMunicipio: String);
begin
Self.municipio := aMunicipio;
end;

procedure Tcliente.setNome(aNome: String);
begin
Self.nome := aNome;
end;

procedure Tcliente.setNumero(aNumero: integer);
begin
Self.numero := aNumero;
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
