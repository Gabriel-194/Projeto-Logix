unit homeService;

interface
uses
data.DB,homeRepository;
type ThomeService = class
  function mostrarPermissoes : TDataSet;
end;

implementation

{ ThomeService }

function ThomeService.mostrarPermissoes: TDataSet;
var
homeRepo : ThomeRepository;
begin
homeRepo := ThomeRepository.create;

result := homeRepo.mostrarPermissoes;
end;

end.
