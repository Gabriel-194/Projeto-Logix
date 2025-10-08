unit enderecoService;

interface
uses
  enderecoRepository,enderecoDto,System.SysUtils;

type  TEnderecoService = class
  function BuscarPorCEP(const ACep: string): TEndereco;
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

end.
