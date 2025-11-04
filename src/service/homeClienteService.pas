unit homeClienteService;

interface
uses
uCliente,homeClienteRepository,uTransportadora,System.Generics.Collections;

type ThomeCLienteService = class

  function ContarPedidos(aIdCliente: Integer; const aStatus: String ): Integer;
  function BuscarTransportadorasMaisUsadas(aIdCliente: Integer): TObjectList<TTransportadora>;
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

end.
