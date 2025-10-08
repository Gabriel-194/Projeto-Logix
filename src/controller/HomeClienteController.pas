unit HomeClienteController;

interface
uses
enderecoDto,enderecoService;

type ThomeClientecontroller = class
  function getByCep(const ACep: string): TEndereco;
  function CalcularDistanciaEntreCEPs(const ACepOrigem, ACepDestino: string): Double;
end;

implementation

{ ThomeClientecontroller }

function THomeClienteController.CalcularDistanciaEntreCEPs(
  const ACepOrigem, ACepDestino: string): Double;
var
  Service: TEnderecoService;
begin
  Service := TEnderecoService.Create;
  try
    Result := Service.CalcularDistanciaEntreCEPs(ACepOrigem, ACepDestino);
  finally
    Service.Free;
  end;
end;


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
