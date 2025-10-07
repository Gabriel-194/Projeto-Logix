unit enderecoRepository;

interface
uses
  EnderecoDto,System.Threading;
type TEnderecoRepository = class
   function GetByCEP(const ACep: string): TEndereco;
   function GetCoordenadasPorCEP(const ACep: string): TEndereco;
end;

implementation
uses
  System.Net.HttpClient,
  System.JSON,
  System.SysUtils;
{ TEnderecoRepository }


{ TEnderecoRepository }

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

function TEnderecoRepository.GetCoordenadasPorCEP(const ACep: string): TEndereco;
var
  LHttpClient: THTTPClient;
  LResponse: IHTTPResponse;
  LJsonArray: TJSONArray;
  LJsonObject: TJSONObject;
  LUrl, LCepLimpo: string;
begin

  Result := Default(TEndereco);
  LCepLimpo := StringReplace(ACep, '-', '', [rfReplaceAll]);

  if Length(LCepLimpo) <> 8 then
    Exit;

  LUrl := Format('https://nominatim.openstreetmap.org/search?q=%s, Brazil&format=json&limit=1', [LCepLimpo]);

  LHttpClient := THTTPClient.Create;
  try
    LHttpClient.UserAgent := 'LogixApp/1.0 (gabrielKuchma.gk@gmail.com)';
    LResponse := LHttpClient.Get(LUrl);

    if LResponse.StatusCode = 200 then
    begin
      LJsonArray := TJSONObject.ParseJSONValue(LResponse.ContentAsString) as TJSONArray;
      if (LJsonArray <> nil) and (LJsonArray.Count > 0) then
      try
        LJsonObject := LJsonArray.Items[0] as TJSONObject;

        Result.Latitude := StrToFloatDef(LJsonObject.GetValue<string>('lat'), 0);
        Result.Longitude := StrToFloatDef(LJsonObject.GetValue<string>('lon'), 0);
      finally
        LJsonArray.Free;
      end;
    end;
  finally
    LHttpClient.Free;
  end;
end;

end.
