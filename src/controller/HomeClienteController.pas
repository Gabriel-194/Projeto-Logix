unit HomeClienteController;

interface
uses
enderecoDto,enderecoService,transpService,uTransportadora,System.Generics.Collections,messageDto,pedidoService,pedidoDto,homeCLienteService,data.db;

type ThomeClientecontroller = class
  function atualizarTabela: TObjectList<TTransportadora>;
  function getByCep(const ACep: string): TEndereco;
  function BuscarTransportadorasPorTipoCarga(const TipoCarga: string): TList<TTransportadora>;
  function CalcularDistanciaEntreCEPs(const ACepOrigem, ACepDestino: string): Double;
  function CalcularFrete(const schemaName: string; tipo: String; distancia: Double; peso:double): Double;
  procedure confirmarPedido(Apedido: TPedidoDto; const schemaName: string);
  function BuscarPedidos(aIdCliente:Integer): TList<TPedidoDto>;
  function ContarPedidos(aIdCliente: Integer; const aStatus: String): Integer;
  procedure verificaStatusPedido(aStatusPedido:String);
  procedure cancelaPedido(aIdTransportadora,aIdPedido:Integer;aMotivoCancela:String);
  function buscarMessagensCLiente(aIdCliente:Integer):Tlist<TmessageDto>;
  function BuscarTransportadorasMaisUsadas(aIdCliente: Integer): TObjectList<TTransportadora>;

end;

implementation

{ ThomeClientecontroller }


function ThomeClienteController.CalcularFrete(const schemaName: string; tipo: String; distancia: Double; peso:double): Double;
var
  service: TpedidoService;
begin
  service := TpedidoService.Create;
  try
    Result := service.CalcularFrete(schemaName, tipo, distancia,peso);
  finally
    service.Free;
  end;
end;

procedure ThomeClientecontroller.cancelaPedido(aIdTransportadora,
  aIdPedido: Integer; aMotivoCancela: String);
var
  Service: TpedidoService;
begin
  Service := TpedidoService.Create;
  try
    service.cancelaPedido(aIdtransportadora,aidPedido,aMotivoCancela);
  finally
    Service.Free;
  end;
end;

procedure ThomeClientecontroller.confirmarPedido(Apedido: TPedidoDto; const schemaName: string);
var
  Service: TpedidoService;
begin
  Service := TpedidoService.Create;
  try
    service.confirmarPedido(aPedido,schemaName);
  finally
    Service.Free;
  end;
end;

function ThomeClientecontroller.ContarPedidos(aIdCliente: Integer; const aStatus: String): Integer;
var
service: ThomeClienteService;
begin
Service:= ThomeClienteService.create;
  try
    Result := Service.ContarPedidos(aIdCliente,aStatus);
  finally
    service.free;
  end;

end;


function ThomeClientecontroller.buscarMessagensCLiente(
  aIdCliente: Integer): Tlist<TmessageDto>;
var service: TPedidoService;
begin
  service := TPedidoService.Create;
  try
    Result := service.BuscarMensagensCliente(aIdCLiente);
  finally
    service.Free;
  end;
end;

function ThomeCLienteController.BuscarPedidos(aIdCliente:Integer): TList<TPedidoDto>;
var service: TPedidoService;
begin
  service := TPedidoService.Create;
  try
    Result := service.BuscarPedidos(aIdCLiente);
  finally
    service.Free;
  end;
end;

function ThomeClientecontroller.BuscarTransportadorasMaisUsadas(
  aIdCliente: Integer): TObjectList<TTransportadora>;
var
  service:ThomeClienteService;
begin
  service:=ThomeClienteService.create;
  try
    result:= service.BuscarTransportadorasMaisUsadas(aIdCliente);
  finally
    service.free;
  end;
end;

function THomeClienteController.BuscarTransportadorasPorTipoCarga(const TipoCarga: string): TList<TTransportadora>;
var
  Service: TTranspService;
begin
  Service := TTranspService.Create;
  try
    Result := Service.BuscarTransportadorasPorTipoCarga(TipoCarga);
  finally
    Service.Free;
  end;
end;


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

procedure ThomeClientecontroller.verificaStatusPedido(aStatusPedido: String);
var service: TPedidoService;
begin
  service := TPedidoService.Create;
  try
    service.verificaStatusPedido(aStatusPedido);
  finally
    service.Free;
  end;
end;

end.
