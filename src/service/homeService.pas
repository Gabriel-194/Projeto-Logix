unit homeService;

interface
uses
data.DB,homeRepository,tipoCargaDto,pedidoDto,system.Generics.Collections;
type ThomeService = class
function ContarUsuariosPorCargo(const aCargo: string): Integer;
function ContarRegistrosAtivos(  const ATabela: string;AIdTransportadora: Integer = 0;const AColunaFiltroAdicional: string = '';const AValorFiltroAdicional: string = ''
):Integer;
function ObterTiposCargasMaisPedidas(aIdTransportadora:integer): Tlist<TtipoCargaDto>;
function ObterPedidosPorMes(aIdTransportadora:integer): Tlist<TpedidoDto>;
function graficoReceitaPorMes(aIdTransportadora: Integer): TDictionary<String, Double>;
function graficoStatusPedidos(aIdTransportadora: Integer): TDictionary<String, Integer>;
function graficoDistanciaPorMes(aIdTransportadora: Integer): TDictionary<String, Double>;
function graficoVeiculosMaisUsados(aIdTransportadora: Integer): TDictionary<String, Integer>;
end;


implementation

{ ThomeService }

{ ThomeService }


function ThomeService.ContarRegistrosAtivos(const ATabela: string;
  AIdTransportadora: Integer; const AColunaFiltroAdicional,
  AValorFiltroAdicional: string): Integer;
var
homeRepo:ThomeRepository;
begin
    homeRepo := ThomeRepository.create;
  try
      Result := HomeRepo.ContarRegistrosAtivos(
    ATabela,
    AIdTransportadora,
    AColunaFiltroAdicional,
    AValorFiltroAdicional
  );
  finally
    homeRepo.free;
  end;

end;

function ThomeService.ContarUsuariosPorCargo(const aCargo: string): Integer;
var
homeRepo:ThomeRepository;
begin
  homeRepo := ThomeRepository.create;
  try
    result := homeRepo.ContarUsuariosPorCargo(aCargo);
  finally
    homeRepo.free;
  end;
end;

function ThomeService.graficoDistanciaPorMes(
  aIdTransportadora: Integer): TDictionary<String, Double>;
var
repo:ThomeRepository;
begin
  repo:=ThomeRepository.create;
  try
    result:= repo.graficoDistanciaPorMes(aIdTransportadora);
  finally
    repo.free;
  end;
end;

function ThomeService.graficoReceitaPorMes(
  aIdTransportadora: Integer): TDictionary<String, Double>;
var
repo:ThomeRepository;
begin
  repo:=ThomeRepository.create;
  try
    result:= repo.graficoReceitaPorMes(aIdTransportadora);
  finally
    repo.free;
  end;
end;

function ThomeService.graficoStatusPedidos(
  aIdTransportadora: Integer): TDictionary<String, Integer>;
var
repo:ThomeRepository;
begin
  repo:=ThomeRepository.create;
  try
    result:= repo.graficoStatusPedidos(aIdTransportadora);
  finally
    repo.free;
  end;
end;

function ThomeService.graficoVeiculosMaisUsados(
  aIdTransportadora: Integer): TDictionary<String, Integer>;
var
repo:ThomeRepository;
begin
  repo:=ThomeRepository.create;
  try
    result:= repo.graficoVeiculosMaisUsados(aIdTransportadora);
  finally
    repo.free;
  end;
end;

function ThomeService.ObterPedidosPorMes(
  aIdTransportadora: integer): Tlist<TpedidoDto>;
var
homeRepo:ThomeRepository;
begin
  homeRepo := ThomeRepository.create;
  try
    result := homeRepo.ObterPedidosPorMes(aIdTransportadora);
  finally
    homeRepo.free;
  end;
end;

function ThomeService.ObterTiposCargasMaisPedidas(
  aIdTransportadora: integer): Tlist<TtipoCargaDto>;
var
homeRepo:ThomeRepository;
begin
  homeRepo := ThomeRepository.create;
  try
    result := homeRepo.ObterTiposCargasMaisPedidas(aIdTransportadora);
  finally
    homeRepo.free;
  end;
end;

end.
