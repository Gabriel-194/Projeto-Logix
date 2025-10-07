unit homeService;

interface
uses
data.DB,homeRepository;
type ThomeService = class
function ContarUsuariosPorCargo(const aCargo: string): Integer;
function ContarRegistrosAtivos(  const ATabela: string;AIdTransportadora: Integer = 0;const AColunaFiltroAdicional: string = '';const AValorFiltroAdicional: string = ''
):Integer;
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

end.
