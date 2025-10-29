unit transpService;

interface

uses
  System.SysUtils, transpRepository,uTransportadora,System.Generics.Collections,TipoCargaDto,uLog,usuarioLogado;

type
  TTranspService = class
  private
    TransRepo: TTranspRepository;
    function ExtrairApenasNumeros (const AValor: string) : String;
  public
    procedure CadastrarTransportadora(aTransportadora: TTransportadora; aTiposCarga: TList<TTipoCargaDto>);
    function atualizarTabela: TObjectList<TTransportadora>;
    procedure EditarTransportadora(ATransp: TTransportadora;aTiposCarga: TList<TTipoCargaDto>);
    procedure ExcluirTransportadora (ATransp: TTransportadora);
    function tabelaInativo: TObjectList<TTransportadora>;
    procedure RecuperarTransportadora(ATransp: TTransportadora);
    function BuscarTransportadorasPorTipoCarga(const TipoCarga: string): TList<TTransportadora>;
  end;

implementation
var
systemLog:Tlogger;
{ TTranspService }

 function TTranspService.BuscarTransportadorasPorTipoCarga(const TipoCarga: string): TList<TTransportadora>;
var
  Repository: TTranspRepository;
begin
  Repository := TTranspRepository.Create;
  try
    Result := Repository.BuscarPorTipoCargaTodosSchemas(TipoCarga);
  finally
    Repository.Free;
  end;
end;

procedure TTranspService.EditarTransportadora(ATransp: TTransportadora;aTiposCarga: TList<TTipoCargaDto>);
var
  OnlyDigitsCNPJ, OnlyDigitsFone, OnlyDigitsCEP: string;
  dto: TTipoCargaDto;
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
    raise exception.Create('Cep Invalido');
  end;

  TransRepo.editarTransportadora(Atransp,aTiposCarga);
  systemLog:=Tlogger.create;
    SystemLog.Log('',
    Format('[EDIT] Usuário %s do ID %d editou uma transportadora no dia %s e no horário %s',
    [userLogado.getNome, userLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));

  systemLog.free;
  TransRepo.free;
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
    systemLog:=Tlogger.create;
    SystemLog.Log('',
    Format('[DELETE] Usuário %s do ID %d excluiu uma transportadora no dia %s e no horário %s',
    [userLogado.getNome, userLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    transRepo.Free;
    systemLog.free;
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

procedure TTranspService.RecuperarTransportadora(ATransp: TTransportadora);
begin
transRepo := TTranspRepository.Create;
  try
    if Atransp.getId.ToString = '' then begin
      raise exception.Create('Selecione uma transportadora para recuperar');
      exit;
    end;

    transRepo.RecuperarTransportadora(Atransp);

    systemlog:=Tlogger.create;
    SystemLog.Log('',
    Format('[RECOVER] Usuário %s do ID %d recuperou uma transportadora no dia %s e no horário %s',
    [userLogado.getNome, userLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    transRepo.Free;
    systemLog.free;
  end;
end;

function TTranspService.tabelaInativo: TObjectList<TTransportadora>;
begin
result := TransRepo.tabelaInativo;
end;

function TTranspService.atualizarTabela: TObjectList<TTransportadora>;
begin
  Result := TransRepo.atualizarTabela;
end;

procedure TTranspService.CadastrarTransportadora(aTransportadora: TTransportadora; aTiposCarga: TList<TTipoCargaDto>);
var
  OnlyDigitsCNPJ, OnlyDigitsFone, OnlyDigitsCEP: string;
  dto: TTipoCargaDto;
begin
  // ======== VALIDAÇÕES ========
  if aTransportadora.getNome.Trim = '' then
    raise Exception.Create('Nome da transportadora é obrigatório.');

  if aTransportadora.getCnpj.Trim = '' then
    raise Exception.Create('CNPJ da transportadora é obrigatório.');

  OnlyDigitsCNPJ := ExtrairApenasNumeros(aTransportadora.getCnpj.Trim);
  if Length(OnlyDigitsCNPJ) <> 14 then
    raise Exception.Create('CNPJ inválido, deve conter 14 dígitos.');

  if aTransportadora.getTelefone.Trim = '' then
    raise Exception.Create('O campo Telefone é obrigatório.');

  OnlyDigitsFone := ExtrairApenasNumeros(aTransportadora.getTelefone.Trim);
  if Length(OnlyDigitsFone) <> 11 then
    raise Exception.Create('Telefone inválido.');

  if aTransportadora.getEmail.Trim = '' then
    raise Exception.Create('E-mail é obrigatório.');

  if aTransportadora.getCep.Trim = '' then
    raise Exception.Create('CEP é obrigatório.');

  OnlyDigitsCEP := ExtrairApenasNumeros(aTransportadora.getCep.Trim);
  if Length(OnlyDigitsCEP) <> 8 then
    raise Exception.Create('CEP inválido.');

  TransRepo.CadastrarTransportadora(aTransportadora,aTiposCarga);
  systemLog:=Tlogger.create;

    SystemLog.Log('',
    Format('[CREATE] Usuário %s do ID %d cadastrou uma transportadora no dia %s e no horário %s',
    [userLogado.getNome, userLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));

  TransRepo.free;
  systemLog.free;

end;


end.

