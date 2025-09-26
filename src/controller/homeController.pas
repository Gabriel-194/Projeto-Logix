unit homeController;

interface
uses
data.DB,homeService;

type THomeController = class
  function mostrarPemissao : TDataSet;
end;

implementation

{ THomeController }

function THomeController.mostrarPemissao: TDataSet;
var
service : ThomeService;
begin
  service := ThomeService.create;

  result := service.mostrarPermissoes;
end;

end.
