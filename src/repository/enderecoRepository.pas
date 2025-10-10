unit enderecoRepository;

interface
uses
  EnderecoDto,System.Threading,Math, IdURI, Vcl.Dialogs;
type TEnderecoRepository = class
   function GetByCEP(const ACep: string): TEndereco;
   function CalcularDistancia(const Lat1, Lon1, Lat2, Lon2: Double): Double;
   function GetCoordenadasPorCEP(const ACep: string): TEndereco;

end;

implementation
uses
  System.Net.HttpClient,
  System.JSON,
  system.NetEncoding,
  System.SysUtils;
{ TEnderecoRepository }


{ TEnderecoRepository }

function TEnderecoRepository.GetCoordenadasPorCEP(const ACep: string): TEndereco;
var
  LHttp: THTTPClient;
  LResp: IHTTPResponse;
  LJsonViaCep, LJsonObject: TJSONObject;
  LJsonNominatim: TJSONValue;
  LJsonArray: TJSONArray;
  LUrlViaCep, LUrlNominatim, Logradouro, Cidade, Estado,EnderecoCompleto,lat,long: string;
begin

  Result := Default(TEndereco);
  LHttp := THTTPClient.Create;

  LUrlViaCep := 'https://viacep.com.br/ws/' + ACep + '/json/';

  try
    LResp := LHttp.Get(LUrlViaCep);

    if LResp.StatusCode = 200 then
    begin
      LJsonViaCep := TJSONObject.ParseJSONValue(LResp.ContentAsString) as TJSONObject;
      try
        if Assigned(LJsonViaCep) then
        begin
          Logradouro := LJsonViaCep.GetValue<string>('logradouro', '');
          Cidade     := LJsonViaCep.GetValue<string>('localidade', '');
          Estado     := LJsonViaCep.GetValue<string>('uf', '');

          Result.endereco  := Logradouro;
          Result.municipio := Cidade;
          Result.estado    := Estado;
          Result.cep       := ACep;
        end;
      finally
        LJsonViaCep.Free;
      end;
    end;
  finally
    LHttp.Free;
  end;

  if (Cidade <> '') and (Estado <> '') then
  begin
    LHttp := THTTPClient.Create;

    EnderecoCompleto := Format('%s, %s, %s, Brazil', [Result.endereco, Result.municipio, Result.estado]);
    LUrlNominatim := Format(
        'https://nominatim.openstreetmap.org/search?q=%s&format=json&limit=1',
        [TNetEncoding.URL.Encode(EnderecoCompleto)]
      );

    try
      LHttp.UserAgent := 'LogixApp/1.0 (gabrielKuchma.gk@gmail.com)';
      LResp := LHttp.Get(LUrlNominatim);


      if LResp.StatusCode = 200 then
      begin
        LJsonNominatim := TJSONObject.ParseJSONValue(LResp.ContentAsString);
        try
         if (LJsonNominatim is TJSONArray) and ((LJsonNominatim as TJSONArray).Count > 0) then
          begin
            LJsonObject := (LJsonNominatim as TJSONArray).Items[0] as TJSONObject;

            result.Latitude := StrToFloatDef(LJsonObject.GetValue<string>('lat'), 0, TFormatSettings.Invariant);
            result.longitude := StrToFloatDef(LJsonObject.GetValue<string>('lon'), 0, TFormatSettings.Invariant);
          end;
        finally
          LJsonNominatim.Free;
        end;
      end;
    finally
      LHttp.Free;
    end;
  end;
end;



function TEnderecoRepository.CalcularDistancia(
  const Lat1, Lon1, Lat2, Lon2: Double): Double;
const
  RaioTerra = 6371;
var
  dLat, dLon, a, c: Double;
begin
  dLat := DegToRad(Lat2 - Lat1);
  dLon := DegToRad(Lon2 - Lon1);
  a := Sin(dLat / 2) * Sin(dLat / 2) +
       Cos(DegToRad(Lat1)) * Cos(DegToRad(Lat2)) *
       Sin(dLon / 2) * Sin(dLon / 2);
  c := 2 * ArcTan2(Sqrt(a), Sqrt(1 - a));
  Result := RaioTerra * c;
end;


function TEnderecoRepository.GetByCEP(const ACep: string): TEndereco;
var
  LHttp: THTTPClient;
  LResp: IHTTPResponse;
  LJson: TJSONObject;
begin
  Result.cep := '';
  Result.estado := '';
  Result.municipio := '';
  Result.endereco := '';
  Result.numero := 0;

  LHttp := THTTPClient.Create;
  try
    LResp := LHttp.Get('https://viacep.com.br/ws/' + ACep + '/json/');

    if LResp.StatusCode = 200 then
    begin
      LJson := TJSONObject.ParseJSONValue(LResp.ContentAsString) as TJSONObject;
      try
        if Assigned(LJson) then
        begin
          Result.cep       := LJson.GetValue<string>('cep', '');
          Result.estado    := LJson.GetValue<string>('uf', '');
          Result.municipio := LJson.GetValue<string>('localidade', '');
          Result.endereco  := LJson.GetValue<string>('logradouro', '');
          Result.numero    := 0;
        end;
      finally
        LJson.Free;
      end;
    end;
  finally
    LHttp.Free;
  end;
end;


end.
