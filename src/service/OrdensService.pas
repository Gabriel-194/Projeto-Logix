unit OrdensService;

interface
uses
  carregamentoDto,OrdemRepository,System.SysUtils;

type TordemService = class
  procedure criarOrdemCarregamento(aCarregamento:TcarregamentoDto;aIdTransportadora:Integer);
end;

implementation

{ TordemService }

procedure TordemService.criarOrdemCarregamento(aCarregamento: TcarregamentoDto; aIdTransportadora: Integer);
var
  repo: TOrdemRepository;
  idxSeparador: Integer;
begin
  repo := TOrdemRepository.Create;

  // Extrai o ID do carregador (se for passado como texto, tipo '4 - alec')
  idxSeparador := Pos(' - ', aCarregamento.sCarregador);
  if idxSeparador > 0 then
    aCarregamento.idCarregador := StrToInt(Trim(Copy(aCarregamento.sCarregador, 1, idxSeparador - 1)))
  else
    aCarregamento.idCarregador := StrToInt(Trim(aCarregamento.sCarregador));

  idxSeparador := Pos(' - ', aCarregamento.sVeiculo);
  if idxSeparador > 0 then
    aCarregamento.idVeiculo := StrToInt(Trim(Copy(aCarregamento.sVeiculo, 1, idxSeparador - 1)))
  else
    aCarregamento.idVeiculo := StrToInt(Trim(aCarregamento.sVeiculo));

  if (aCarregamento.idCarregador <= 0) then
    raise Exception.Create('Selecione um carregador.');
  if (aCarregamento.idVeiculo <= 0) then
    raise Exception.Create('Selecione um veículo.');
  if (aCarregamento.idPedido <= 0) then
    raise Exception.Create('Selecione um pedido.');

  try
    repo.criarOrdemCarregamento(aCarregamento, aIdTransportadora);
  finally
    repo.Free;
  end;
end;
end.
