unit homeService;

interface
uses
data.DB,homeRepository;
type ThomeService = class
function ContarUsuariosPorCargo(const aCargo: string): Integer;

end;

implementation

{ ThomeService }

{ ThomeService }

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
