unit uTransportadora;

interface
  type
    TTransportadora = class
  private
    Id: Integer;
    Nome: string;
    CNPJ: string;
    Telefone: string;
    Ativo: Boolean;
    Email: string;
    Endereco: string;

    property Id: Integer read Id write Id;
    property Nome: string read Nome write Nome;
    property CNPJ: string read CNPJ write CNPJ;
    property Telefone: string read Telefone write Telefone;
    property Status: Boolean read Ativo write Ativo;
    property Email: string read Email write Email;
    property Endereco: string read Endereco write Endereco;

  end;
implementation



end.
