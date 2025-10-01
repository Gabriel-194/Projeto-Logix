unit enderecoService;

interface
uses
  enderecoRepository,enderecoDto,System.SysUtils;

type  TEnderecoService = class
  function BuscarPorCEP(const ACep: string): TEndereco;
end;

implementation

{ TEnderecoService }

function TEnderecoService.BuscarPorCEP(const ACep: string): TEndereco;
var
enderecoRepository: TenderecoRepository;
cepLimpo:string;
begin
  enderecoRepository:= TenderecoRepository.create;
  try
   CepLimpo := StringReplace(ACep, '-', '', [rfReplaceAll]);
   CepLimpo := StringReplace(CepLimpo, '.', '', [rfReplaceAll]);

  if (CepLimpo = '') or (Length(CepLimpo) < 8) then
    raise Exception.Create('CEP inválido.');

  Result := EnderecoRepository.GetByCEP(Ceplimpo);

  if Result.endereco = '' then
    raise Exception.Create('Endereço não encontrado para o CEP informado.');
  finally
    enderecoRepository.free;
  end;

end;
end.
