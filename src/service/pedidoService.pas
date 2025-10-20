unit pedidoService;

interface
uses
pedidoRepository,pedidoDto,system.Generics.Collections,System.SysUtils;

type TPedidoService = class
  function CalcularFrete(const schemaName: string; tipo:string; distancia: Double;peso:double): Double;
  procedure confirmarPedido(pedidoDto: TPedidoDto; const schemaName: string);
  function BuscarPedidos(aIdCliente:Integer): TList<TPedidoDto>;
  function BuscarPedidosPorTransp(aIdTransportadora:Integer):Tlist<TpedidoDto>;
end;

implementation


function TPedidoService.BuscarPedidos(aIdCliente:Integer): TList<TPedidoDto>;
var repo: TPedidoRepository;
begin
  repo := TPedidoRepository.Create;
  try
    Result := repo.BuscarPedidos(aIdCliente);
  finally
    repo.Free;
  end;
end;

function TPedidoService.BuscarPedidosPorTransp(
  aIdTransportadora: Integer): Tlist<TpedidoDto>;
var repo: TPedidoRepository;
begin
  repo := TPedidoRepository.Create;
  try
    Result := repo.BuscarPedidosPorTransp(aIdTransportadora);
  finally
    repo.Free;
  end;
end;

function TpedidoService.CalcularFrete(const schemaName: string; tipo: string; distancia: Double; peso: double): Double;
var
  preco_base_km, custoPorKm: Double;
  repo: TpedidoRepository;
begin
  repo := TpedidoRepository.Create;
  try
    preco_base_km := repo.GetPrecoBasePorKm(schemaName, tipo);
  finally
    repo.Free;
  end;


  if distancia <= 100 then
    custoPorKm := 0.50
  else if distancia <= 300 then
    custoPorKm := 0.70
  else if distancia <= 600 then
    custoPorKm := 0.90
  else
    custoPorKm := 1.20;


  preco_base_km := preco_base_km + custoPorKm;


  Result := (Distancia * Preco_Base_KM) + 100;

  if Peso >= 10000 then
    Result := Result * 1.40
  else if Peso >= 6000 then
    Result := Result * 1.25
  else if Peso >= 3000 then
    Result := Result * 1.15;
end;

procedure TPedidoService.confirmarPedido(pedidoDto: TPedidoDto; const schemaName: string);
var
  Repo: TpedidoRepository;
begin
  if pedidoDto.CepOrigem = '' then
    raise Exception.Create('Preencha o CEP de origem.');
  if Trim(pedidoDto.EstadoOrigem) = '' then
    raise Exception.Create('Preencha o Estado de origem.');
  if Trim(pedidoDto.MunicipioOrigem) = '' then
    raise Exception.Create('Preencha o Município de origem.');
  if Trim(pedidoDto.EnderecoOrigem) = '' then
    raise Exception.Create('Preencha o Endereço de origem.');
  if Trim(pedidoDto.NumeroOrigem) = '' then
    raise Exception.Create('Preencha o Número de origem.');

  if Trim(pedidoDto.CepDestino) = '' then
    raise Exception.Create('Preencha o CEP de destino.');
  if Trim(pedidoDto.EstadoDestino) = '' then
    raise Exception.Create('Preencha o Estado de destino.');
  if Trim(pedidoDto.MunicipioDestino) = '' then
    raise Exception.Create('Preencha o Município de destino.');
  if Trim(pedidoDto.EnderecoDestino) = '' then
    raise Exception.Create('Preencha o Endereço de destino.');
  if Trim(pedidoDto.NumeroDestino) = '' then
    raise Exception.Create('Preencha o Número de destino.');

  if pedidoDto.Peso <= 0 then
    raise Exception.Create('Preencha o peso.');
  if pedidoDto.DistanciaKm <= 0 then
    raise Exception.Create('Preencha a distância.');
  if Trim(pedidoDto.TipoCarga) = '' then
    raise Exception.Create('Selecione o tipo de carga.');
  if pedidoDto.IdTransportadora = 0 then
    raise Exception.Create('Selecione a transportadora.');
  if pedidoDto.Preco <= 0 then
    raise Exception.Create('Calcule o preço final antes de confirmar o pedido.');


  Repo := TPedidoRepository.Create;
  try
    Repo.confirmarPedido(pedidoDto,schemaName);
  finally
    Repo.Free;
  end;
end;

end.
