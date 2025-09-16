unit uUsuario;

interface
uses
  System.SysUtils;
type
 Tusuario = class
   protected
    nome : String;
    cpf : String;
    telefone: String;
    cargo_descricao : String;
    email : String;
    senha_hash : String;
   public
    procedure setNome(aNome : String);
    function getNome : String;

    procedure setCpf(aCpf: String);
    function getCpf: String;

    procedure setCargo_descricao(aCargo_descricao: String);
    function getCargo_descricao: String;

    procedure setEmail(aEmail: String);
    function getEmail: String;

    procedure setSenha_hash(aSenha_hash: String);
    function getSenha_hash: String;
 end;

implementation

{ Tusuario }

procedure TUsuario.setNome(aNome: String);
begin
  Self.nome := aNome;
end;

function TUsuario.getNome: String;
begin
  Result := Self.nome;
end;

procedure TUsuario.setCpf(aCpf: String);
begin
  Self.cpf := aCpf;
end;

function TUsuario.getCpf: String;
begin
  Result := Self.cpf;
end;



procedure TUsuario.setCargo_descricao(aCargo_descricao: String);
begin
  Self.cargo_descricao := aCargo_descricao;
end;

function TUsuario.getCargo_descricao: String;
begin
  Result := Self.cargo_descricao;
end;

procedure TUsuario.setEmail(aEmail: String);
begin
  Self.email := aEmail;
end;

function TUsuario.getEmail: String;
begin
  Result := Self.email;
end;

procedure TUsuario.setSenha_hash(aSenha_hash: String);
begin
  Self.senha_hash := aSenha_hash;
end;

function TUsuario.getSenha_hash: String;
begin
  Result := Self.senha_hash;
end;


end.
