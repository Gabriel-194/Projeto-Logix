unit enderecoService;

interface
uses
  enderecoRepository,enderecoDto,System.SysUtils,math;

type  TEnderecoService = class
  function BuscarPorCEP(const ACep: string): TEndereco;
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
  RaioTerra, DLat, DLon, A, C,distancia: Double;
  enderecoRepo: TEnderecoRepository;
  CepOrigemLimpo, CepDestinoLimpo: string;
begin

  CepOrigemLimpo  := StringReplace(ACepOrigem, '.', '', [rfReplaceAll]);
  CepOrigemLimpo  := StringReplace(CepOrigemLimpo, '-', '', [rfReplaceAll]);

  CepDestinoLimpo := StringReplace(ACepDestino, '.', '', [rfReplaceAll]);
  CepDestinoLimpo := StringReplace(CepDestinoLimpo, '-', '', [rfReplaceAll]);


  enderecoRepo := TEnderecoRepository.Create;
  try
    Origem  := enderecoRepo.GetCoordenadasPorCEP(CepOrigemLimpo);
    Destino := enderecoRepo.GetCoordenadasPorCEP(CepDestinoLimpo);
  finally
    enderecoRepo.Free;
  end;


  if (Origem.Latitude = 0) or (Origem.Longitude = 0) then begin
        raise Exception.Create('Não foi possível obter as coordenadas para o CEP de origem: ' + ACepOrigem);
  end;


  if (Destino.Latitude = 0) or (Destino.Longitude = 0) then begin
    raise Exception.Create('Não foi possível obter as coordenadas para o CEP de destino: ' + ACepDestino);
  end;


RaioTerra := 6371; // km
  DLat := DegToRad(Destino.Latitude - Origem.Latitude);
  DLon := DegToRad(Destino.Longitude - Origem.Longitude);

  A := Power(Sin(DLat / 2), 2) +
       Cos(DegToRad(Origem.Latitude)) * Cos(DegToRad(Destino.Latitude)) *
       Power(Sin(DLon / 2), 2);

  C := 2 * ArcTan2(Sqrt(A), Sqrt(1 - A));
  Distancia := RaioTerra * C;


  if Distancia < 10 then
    Result := Distancia + 1.50
  else if Distancia < 50 then
    Result := Distancia * 1.10 // 10-50 km: +25%
  else if Distancia < 200 then
    Result := Distancia * 1.15 // 50-200 km: +15%
  else
    Result := Distancia * 1.10; // >=200 km: +10%

  if Result < 0 then
    Result := 0;
end;



end.
