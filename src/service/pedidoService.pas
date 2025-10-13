unit pedidoService;

interface
uses
pedidoRepository,pedidoDto,system.Generics.Collections,System.SysUtils;

type TPedidoService = class
  function CalcularFrete(const schemaName: string; tipo:string; distancia: Double;peso:double): Double;
  procedure confirmarPedido(pedidoDto: TPedidoDto; const schemaName: string);
end;

implementation


function TpedidoService.CalcularFrete(const schemaName: string; tipo:string; distancia: Double;peso:double): Double;
var
  preco_base_km: Double;
  repo: TpedidoRepository;
begin
  repo := TpedidoRepository.Create;
  try
    preco_base_km := repo.GetPrecoBasePorKm(schemaName, tipo);
  finally
    repo.Free;
  end;
  Result := distancia * preco_base_km;

   if peso >= 10000 then begin
    Result := Result * 1.50
   end  else if peso >= 6000 then begin
    Result := Result * 1.30
   end  else if peso >= 3000 then begin
    Result := Result * 1.20
   end;

end;

procedure TPedidoService.confirmarPedido(pedidoDto: TPedidoDto; const schemaName: string);
var
  Repo: TpedidoRepository;
begin
  // Validação dos obrigatórios
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
