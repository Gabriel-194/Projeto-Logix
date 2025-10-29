unit uUsuario;

interface
uses
  System.SysUtils;
type
 Tusuario = class
   protected
    id :Integer;
    nome : String;
    cpf : String;
    telefone: String;
    cargo_descricao : String;
    email : String;
    senha_hash : String;
    idTransportadora :Integer;
    SchemaName:String;
    id_grupo:Integer;
   public

   procedure setId(aId : Integer);
   function getId : Integer;

    procedure setNome(aNome : String);
    function getNome : String;

    procedure setCpf(aCpf: String);
    function getCpf: String;

    procedure setTelefone(aTelefone:String);
    function getTelefone:String;

    procedure setCargo_descricao(aCargo_descricao: String);
    function getCargo_descricao: String;

    procedure setEmail(aEmail: String);
    function getEmail: String;

    procedure setSenha_hash(aSenha_hash: String);
    function getSenha_hash: String;

    procedure SetIdTransportadora(aIdTransportadora :Integer);
    function getIdTransportadora : Integer;

    procedure setSchemaName(aSchemaName:String);
    function getSchemaName:String;

    procedure setIdGrupo(aIdGrupo:integer);
    function getIdGrupo:integer;


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

procedure Tusuario.setId(aId: Integer);
begin
  self.id := aId;
end;

procedure Tusuario.SetIdTransportadora(aIdTransportadora: Integer);
begin
  Self.IdTransportadora := aIdTransportadora;
end;

function TUsuario.getEmail: String;
begin
  Result := Self.email;
end;

function Tusuario.getId: Integer;
begin
  Result := Self.id;
end;

function Tusuario.getIdTransportadora: Integer;
begin
result := Self.idTransportadora;
end;

procedure Tusuario.setSchemaName(aSchemaName: String);
begin
    Self.schemaName := aSchemaName;
end;

procedure TUsuario.setSenha_hash(aSenha_hash: String);
begin
  Self.senha_hash := aSenha_hash;
end;

procedure Tusuario.setTelefone(aTelefone: String);
begin
   Self.telefone := aTelefone;
end;

function Tusuario.getSchemaName: String;
begin
result := self.SchemaName;
end;

function TUsuario.getSenha_hash: String;
begin
  Result := Self.senha_hash;
end;


function Tusuario.getTelefone: String;
begin
result := Self.telefone;
end;

function Tusuario.getIdGrupo: integer;
begin
result := self.id_grupo;
end;

procedure Tusuario.setIdGrupo(aIdGrupo: integer);
begin
  self.id_grupo := aIdGrupo;
end;

end.
