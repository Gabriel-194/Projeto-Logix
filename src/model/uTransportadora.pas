unit uTransportadora;

interface
  type
    TTransportadora = class
  protected
    id :Integer;
    Nome: string;
    CNPJ: string;
    Telefone: string;
    Email: string;
    cep: string;
  public
    function getId: Integer;
    procedure setId(aId: Integer);

    function getNome: string;
    procedure setNome(aNome: string);

    function getCNPJ: string;
    procedure setCNPJ(aCNPJ: string);

    function getTelefone: string;
    procedure setTelefone(aTelefone: string);

    function getEmail: string;
    procedure setEmail(aEmail: string);

    function getCep: string;
    procedure setCep(aCep: string);
  end;

implementation
{ TTransportadora }

function TTransportadora.getNome: string;
begin
  Result := Self.Nome;
end;

procedure TTransportadora.setNome(aNome: string);
begin
  Self.Nome := aNome;
end;

function TTransportadora.getCNPJ: string;
begin
  Result := Self.CNPJ;
end;

procedure TTransportadora.setCNPJ(aCNPJ: string);
begin
  Self.CNPJ := aCNPJ;
end;

function TTransportadora.getTelefone: string;
begin
  Result := Self.Telefone;
end;

procedure TTransportadora.setTelefone(aTelefone: string);
begin
  Self.Telefone := aTelefone;
end;

function TTransportadora.getEmail: string;
begin
  Result := Self.Email;
end;

function TTransportadora.getId: Integer;
begin
 result := self.id;
end;

procedure TTransportadora.setEmail(aEmail: string);
begin
  Self.Email := aEmail;
end;

procedure TTransportadora.setId(aId: Integer);
begin
  self.id := aId;
end;

function TTransportadora.getCep: string;
begin
  Result := Self.cep;
end;

procedure TTransportadora.setCep(aCep: string);
begin
  Self.cep := aCep;
end;

end.
