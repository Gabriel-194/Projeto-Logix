unit OrdensService;

interface
uses
  system.Generics.Collections, carregamentoDto,OrdemRepository,System.SysUtils;

type TordemService = class
  procedure criarOrdemCarregamento(aCarregamento:TcarregamentoDto;aIdTransportadora:Integer);
  function buscarOrdensCarregPorTransp(aIdTransportadora: Integer): Tlist<TcarregamentoDto>;
end;

implementation

{ TordemService }

function TOrdemService.buscarOrdensCarregPorTransp(aIdTransportadora: Integer): TList<TCarregamentoDto>;
var
  repos: TOrdemRepository;
  listaOrigem, listaDestino: TList<TCarregamentoDto>;
  i: Integer;
  dto: TCarregamentoDto;
begin
  repos := TOrdemRepository.Create;
  listaOrigem := nil;
  listaDestino := TList<TCarregamentoDto>.Create;
  try
    listaOrigem := repos.buscarOrdensCarregPorTransp(aIdTransportadora);
    for i := 0 to listaOrigem.Count - 1 do
    begin
      dto := listaOrigem[i];
      dto.sVeiculo    := IntToStr(dto.idVeiculo)      + ' - ' + dto.sVeiculo;
      dto.sCarregador := IntToStr(dto.idCarregador)   + ' - ' + dto.sCarregador;
      listaDestino.Add(dto);
    end;
    Result := listaDestino;

    listaOrigem.Free;
  finally
    repos.Free;
  end;
end;

procedure TordemService.criarOrdemCarregamento(aCarregamento: TcarregamentoDto; aIdTransportadora: Integer);
var
  repo: TOrdemRepository;
  idxSeparador: Integer;
begin
  repo := TOrdemRepository.Create;

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
