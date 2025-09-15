unit transpService;

interface

uses
  System.SysUtils, transpRepository,uTransportadora,System.Generics.Collections;

type
  TTranspService = class
  private
    TransRepo: TTranspRepository;
    function ExtrairApenasNumeros (const AValor: string) : String;
  public
    procedure CadastrarTransportadora(ATransp: TTransportadora);
    function atualizarTabela: TObjectList<TTransportadora>;
    procedure EditarTransportadora (ATransp: TTransportadora);
    procedure ExcluirTransportadora (ATransp: TTransportadora);
  end;

implementation

{ TTranspService }



procedure TTranspService.EditarTransportadora(ATransp: TTransportadora);
var
  OnlyDigitsCNPJ, OnlyDigitsFone, OnlyDigitsCEP: string;
begin
  if ATransp.getNome.Trim = '' then begin
    raise Exception.Create('Nome da transportadora é obrigatório.');
  end;

  if ATransp.getCnpj.Trim = '' then begin
    raise Exception.Create('Cnpj da transportadora é obrigatório.');
  end;

  OnlyDigitsCNPJ := ExtrairApenasNumeros(ATransp.getCnpj.Trim);

  if Length(OnlyDigitsCNPJ) <> 14 then begin
    raise Exception.Create('CNPJ invalido, deve conter 14 dígitos.');
  end;

  if ATransp.getTelefone.Trim = '' then begin
    raise Exception.Create('O campo Telefone é obrigatório.');
  end;

  OnlyDigitsFone := ExtrairApenasNumeros(Atransp.getTelefone.Trim);

  if Length(OnlyDigitsFone) <> 11 then begin
    raise Exception.Create('Telefone Invalido');
  end;

  if ATransp.getEmail.Trim = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if Atransp.getCep.trim = '' then begin
    raise exception.Create('CEP é obrigatorio');
  end;

  OnlyDigitsCEP := ExtrairApenasNumeros(ATransp.getCep.Trim);

  if length(OnlyDigitsCEP) <> 8  then begin
    raise exception.Create('CnpjInvalido');
  end;

  TransRepo.editarTransportadora(Atransp);
end;

procedure TTranspService.ExcluirTransportadora(ATransp: TTransportadora);
begin
transRepo := TTranspRepository.Create;
  try
    if Atransp.getId.ToString = '' then begin
      raise exception.Create('Selecione uma transportadora para excluir');
      exit;
    end;

    transRepo.ExcluirTransportadora(Atransp);
  finally
    transRepo.Free;
  end;
end;

function TTranspService.ExtrairApenasNumeros(const AValor: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(AValor) do
  begin

    if AValor[i] in ['0'..'9'] then
      Result := Result + AValor[i];
  end;
end;




function TTranspService.atualizarTabela: TObjectList<TTransportadora>;
begin
  Result := TransRepo.atualizarTabela;
end;

procedure TTranspService.CadastrarTransportadora(ATransp: TTransportadora);
var
  OnlyDigitsCNPJ, OnlyDigitsFone, OnlyDigitsCEP: string;
begin
  if ATransp.getNome.Trim = '' then begin
    raise Exception.Create('Nome da transportadora é obrigatório.');
  end;

  if ATransp.getCnpj.Trim = '' then begin
    raise Exception.Create('Cnpj da transportadora é obrigatório.');
  end;

  OnlyDigitsCNPJ := ExtrairApenasNumeros(ATransp.getCnpj.Trim);

  if Length(OnlyDigitsCNPJ) <> 14 then begin
    raise Exception.Create('CNPJ invalido, deve conter 14 dígitos.');
  end;

  if ATransp.getTelefone.Trim = '' then begin
    raise Exception.Create('O campo Telefone é obrigatório.');
  end;

  OnlyDigitsFone := ExtrairApenasNumeros(Atransp.getTelefone.Trim);

  if Length(OnlyDigitsFone) <> 11 then begin
    raise Exception.Create('Telefone Invalido');
  end;

  if ATransp.getEmail.Trim = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if Atransp.getCep.trim = '' then begin
    raise exception.Create('CEP é obrigatorio');
  end;

  OnlyDigitsCEP := ExtrairApenasNumeros(ATransp.getCep.Trim);

  if length(OnlyDigitsCEP) <> 8  then begin
    raise exception.Create('CnpjInvalido');
  end;

  TransRepo.CadastrarTransportadora(ATransp);
end;

end.

