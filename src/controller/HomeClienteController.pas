unit HomeClienteController;

interface
uses
enderecoDto,enderecoService;

type ThomeClientecontroller = class
  function getByCep(const ACep: string): TEndereco;
end;

implementation

{ ThomeClientecontroller }

function ThomeClientecontroller.getByCep(const ACep: string): TEndereco;
var
  service: TEnderecoService;
begin
  service := TEnderecoService.Create;
  try
    Result := service.BuscarPorCEP(ACep);
  finally
    service.Free;
  end;
end;

end.
