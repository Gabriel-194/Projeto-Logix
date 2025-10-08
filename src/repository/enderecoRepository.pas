unit enderecoRepository;

interface
uses
  EnderecoDto,System.Threading,Math, IdURI;
type TEnderecoRepository = class
   function GetByCEP(const ACep: string): TEndereco;

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


end.
