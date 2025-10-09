unit enderecoService;

interface
uses
  enderecoRepository,enderecoDto,System.SysUtils,math;

type  TEnderecoService = class
  function BuscarPorCEP(const ACep: string): TEndereco;
//  function GetCoordenadasPorCEP(const ACep: string): TEndereco;
  function CalcularDistanciaEntreCEPs(const ACepOrigem, ACepDestino: string): Double;
end;

implementation

{ TEnderecoService }

function TEnderecoService.BuscarPorCEP(const ACep: string): TEndereco; var enderecoRepository: TenderecoRepository; cepLimpo:string;
begin
enderecoRepository:= TenderecoRepository.create;
   try CepLimpo := StringReplace(ACep, '-', '', [rfReplaceAll]); CepLimpo := StringReplace(CepLimpo, '.', '', [rfReplaceAll]);
    if (CepLimpo = '') or (Length(CepLimpo) < 8) then begin
      raise Exception.Create('CEP inválido.');
    end;

      Result := EnderecoRepository.GetByCEP(Ceplimpo);

    if (Result.endereco = '') and (result.estado = '') and (result.municipio = '')   then
      raise Exception.Create('Dados não encontrado para o CEP informado.');
   finally
    enderecoRepository.free;
   end;
end;

function TEnderecoService.CalcularDistanciaEntreCEPs(const ACepOrigem,
  ACepDestino: string): Double;
var
  Origem, Destino: TEndereco;
  RaioTerra, DLat, DLon, A, C: Double;
  enderecoRepo: TEnderecoRepository;
  CepOrigemLimpo, CepDestinoLimpo: string; // Suas variáveis
begin
  // 1. Limpa os CEPs usando StringReplace, como você sugeriu
  CepOrigemLimpo  := StringReplace(ACepOrigem, '.', '', [rfReplaceAll]);
  CepOrigemLimpo  := StringReplace(CepOrigemLimpo, '-', '', [rfReplaceAll]);

  CepDestinoLimpo := StringReplace(ACepDestino, '.', '', [rfReplaceAll]);
  CepDestinoLimpo := StringReplace(CepDestinoLimpo, '-', '', [rfReplaceAll]);

  // 2. Continua o fluxo com os CEPs limpos
  enderecoRepo := TEnderecoRepository.Create;
  try
    Origem  := enderecoRepo.GetCoordenadasPorCEP(CepOrigemLimpo);
    Destino := enderecoRepo.GetCoordenadasPorCEP(CepDestinoLimpo);
  finally
    enderecoRepo.Free;
  end;

  // Verificação explícita se as coordenadas foram encontradas
  if (Origem.Latitude = 0) or (Origem.Longitude = 0) then
    raise Exception.Create('Não foi possível obter as coordenadas para o CEP de origem: ' + ACepOrigem);

  if (Destino.Latitude = 0) or (Destino.Longitude = 0) then
    raise Exception.Create('Não foi possível obter as coordenadas para o CEP de destino: ' + ACepDestino);

  // Fórmula de Haversine (continua igual)
  RaioTerra := 6371; // km
  DLat := DegToRad(Destino.Latitude - Origem.Latitude);
  DLon := DegToRad(Destino.Longitude - Origem.Longitude);

  A := Power(Sin(DLat / 2), 2) +
       Cos(DegToRad(Origem.Latitude)) * Cos(DegToRad(Destino.Latitude)) *
       Power(Sin(DLon / 2), 2);
  C := 2 * ArcTan2(Sqrt(A), Sqrt(1 - A));

  Result := RaioTerra * C;
end;

//function TEnderecoService.GetCoordenadasPorCEP(const ACep: string): TEndereco;
//var
//  EnderecoRepository: TEnderecoRepository;
//  CepLimpo: string;
//begin
//  EnderecoRepository := TEnderecoRepository.Create;
//  try
//
//    CepLimpo := StringReplace(ACep, '-', '', [rfReplaceAll]);
//    CepLimpo := StringReplace(CepLimpo, '.', '', [rfReplaceAll]);
//
//    if (CepLimpo = '') or (Length(CepLimpo) < 8) then
//      raise Exception.Create('CEP inválido.');
//
//
//    Result := EnderecoRepository.GetCoordenadasPorCEP(CepLimpo);
//
//
//    if (Result.Latitude = 0) or (Result.Longitude = 0) then
//      raise Exception.Create('Não foi possível localizar as coordenadas para o CEP informado.');
//
//  finally
//    EnderecoRepository.Free;
//  end;
//end;


end.
