unit HomeClienteController;

interface
uses
enderecoDto,enderecoService,transpService,uTransportadora,System.Generics.Collections;

type ThomeClientecontroller = class
  function atualizarTabela: TObjectList<TTransportadora>;
  function getByCep(const ACep: string): TEndereco;
  function BuscarTransportadorasPorTipoCarga(const TipoCarga: string): TList<TTransportadora>;
end;

implementation

{ ThomeClientecontroller }



function THomeClienteController.BuscarTransportadorasPorTipoCarga(const TipoCarga: string): TList<TTransportadora>;
var
  Service: TTranspService;
begin
  Service := TTranspService.Create;
  try
    Result := Service.BuscarTransportadorasPorTipoCarga(TipoCarga); // retorna lista, owner será view
  finally
    Service.Free;
  end;
end;

function ThomeClientecontroller.atualizarTabela: TObjectList<TTransportadora>;
var
  service :TTranspService;
begin
  service := TTranspService.create;
  try
    result :=service.atualizarTabela;
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
