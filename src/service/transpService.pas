unit transpService;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, transpRepository, System.Hash;

type
  TTranspService = class
  private
    FRepo: TTranspRepository;
  public
    constructor Create(AConn: TFDConnection);
    destructor Destroy; override;

    procedure CadastrarTransportadora(Nome, CNPJ, Telefone, Email, CEP: string);
  end;

implementation

{ TTranspService }

constructor TTranspService.Create(AConn: TFDConnection);
begin
  FRepo := TTranspRepository.Create(AConn);
end;

destructor TTranspService.Destroy;
begin
  FRepo.Free;
  inherited;
end;

procedure TTranspService.CadastrarTransportadora(Nome, CNPJ, Telefone, Email, CEP: string);
begin
  // Valida��es
  if Nome.Trim = '' then
    raise Exception.Create('Nome da transportadora � obrigat�rio.');

  if CNPJ.Trim = '' then
    raise Exception.Create('CNPJ � obrigat�rio.');

  if Length(CNPJ) < 14 then
    raise Exception.Create('CNPJ inv�lido.');

  if Telefone.Trim = '' then
    raise Exception.Create('Telefone � obrigat�rio.');

  if Email.Trim = '' then
    raise Exception.Create('E-mail � obrigat�rio.');


  // Chama o Repository
  FRepo.CadastrarTransportadora(Nome, CNPJ, Telefone, Email, CEP);
end;

end.

