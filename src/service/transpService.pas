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
  // Validações
  if Nome.Trim = '' then
    raise Exception.Create('Nome da transportadora é obrigatório.');

  if CNPJ.Trim = '' then
    raise Exception.Create('CNPJ é obrigatório.');

  if Length(CNPJ) < 14 then
    raise Exception.Create('CNPJ inválido.');

  if Telefone.Trim = '' then
    raise Exception.Create('Telefone é obrigatório.');

  if Email.Trim = '' then
    raise Exception.Create('E-mail é obrigatório.');


  // Chama o Repository
  FRepo.CadastrarTransportadora(Nome, CNPJ, Telefone, Email, CEP);
end;

end.

