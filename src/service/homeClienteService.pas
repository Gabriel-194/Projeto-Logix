unit homeClienteService;

interface
uses
uCliente,homeClienteRepository;

type ThomeCLienteService = class

  function ContarPedidos(aIdCliente: Integer; const aStatus: String ): Integer;
end;

implementation

{ ThomeCLienteService }

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
