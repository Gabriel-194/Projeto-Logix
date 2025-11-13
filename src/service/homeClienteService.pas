unit homeClienteService;

interface
uses
uCliente,homeClienteRepository,uTransportadora,System.Generics.Collections,RelatorioRepository;

type ThomeCLienteService = class

  function ContarPedidos(aIdCliente: Integer; const aStatus: String ): Integer;
  function BuscarTransportadorasMaisUsadas(aIdCliente: Integer): TObjectList<TTransportadora>;
  procedure relatorioTransportadorasMaisUsadas(aIdCliente: Integer);
  procedure exportarRelPdfCliente;
end;

implementation

{ ThomeCLienteService }

function ThomeCLienteService.BuscarTransportadorasMaisUsadas(
  aIdCliente: Integer): TObjectList<TTransportadora>;
var
  repo:tHomeClienteRepository;
begin
 repo:=tHomeClienteRepository.create;
  try
    result:=repo.BuscarTransportadorasMaisUsadas(aidCliente);
  finally
    repo.free;
  end;
end;

function ThomeCLienteService.ContarPedidos(aIdCliente: Integer; const aStatus: String ): Integer;
var
homeRepo:ThomeCLienteRepository;
begin
    homeRepo := ThomeClienteRepository.create;
  try
      Result := HomeRepo.ContarPedidos(aIdCliente,aStatus);
  finally
    homeRepo.free;
  end;

end;

procedure ThomeCLienteService.exportarRelPdfCliente;
var
  repo:TrelatorioRepository;
begin
  repo:=TrelatorioRepository.create;
  try
    repo.exportarRelPdfCliente;
  finally
    repo.free;
  end;
end;

procedure ThomeCLienteService.relatorioTransportadorasMaisUsadas(
  aIdCliente: Integer);
var
  repo:TrelatorioRepository;
begin
repo:=TrelatorioRepository.create;
  try
    repo.relatorioTransportadorasMaisUsadas(aIdCliente);
  finally
    repo.free;
  end;
end;

end.
