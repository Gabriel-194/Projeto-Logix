unit enderecoService;

interface
uses
  enderecoRepository,enderecoDto,System.SysUtils;

type  TEnderecoService = class
  function BuscarPorCEP(const ACep: string): TEndereco;
  function CalcularDistanciaEntreCEPs(const ACepOrigem, ACepDestino: string): Double;
end;

implementation

{ TEnderecoService }

function TEnderecoService.CalcularDistanciaEntreCEPs(const ACepOrigem, ACepDestino: string): Double;
var
  Origem, Destino: TEndereco;
  enderecoRepository: TEnderecoRepository;
  CepOrigemLimpo, CepDestinoLimpo: string;
begin
  enderecoRepository := TEnderecoRepository.Create;
  try
    Result := 0;

    CepOrigemLimpo := StringReplace(ACepOrigem, '-', '', [rfReplaceAll]);
    CepOrigemLimpo := StringReplace(CepOrigemLimpo, '.', '', [rfReplaceAll]);

    CepDestinoLimpo := StringReplace(ACepDestino, '-', '', [rfReplaceAll]);
    CepDestinoLimpo := StringReplace(CepDestinoLimpo, '.', '', [rfReplaceAll]);

    if (Length(CepOrigemLimpo) < 8) or (Length(CepDestinoLimpo) < 8) then
      raise Exception.Create('CEP inválido.');

    Origem := enderecoRepository.GetCoordenadasPorCEP(CepOrigemLimpo);
    Destino := enderecoRepository.GetCoordenadasPorCEP(CepDestinoLimpo);

    if (Origem.Latitude = 0) or (Destino.Latitude = 0) then
    raise Exception.Create('Não foi possível localizar as coordenadas de um dos CEPs.');

    Result := enderecoRepository.CalcularDistancia(
      Origem.Latitude, Origem.Longitude,
      Destino.Latitude, Destino.Longitude
    );
  finally
    enderecoRepository.Free;
  end;
end;



function TEnderecoService.BuscarPorCEP(const ACep: string): TEndereco; var enderecoRepository: TenderecoRepository; cepLimpo:string;
begin
enderecoRepository:= TenderecoRepository.create;
   try CepLimpo := StringReplace(ACep, '-', '', [rfReplaceAll]); CepLimpo := StringReplace(CepLimpo, '.', '', [rfReplaceAll]);
    if (CepLimpo = '') or (Length(CepLimpo) < 8) then begin
      raise Exception.Create('CEP inválido.');
    end;

      Result := EnderecoRepository.GetByCEP(Ceplimpo);

    if Result.endereco = '' then
      raise Exception.Create('Endereço não encontrado para o CEP informado.');
   finally
    enderecoRepository.free;
   end;
end;
end.
