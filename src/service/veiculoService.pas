unit veiculoService;

interface
uses
veiculoRepository,uVeiculo,System.Generics.Collections;

type TveiculoService = class
  procedure cadastrarVeiculo(veiculo:Tveiculo);
  function mostrarVeiuclo:TobjectList<Tveiculo>;
  function mostrarVeiucloInativo: TobjectList<Tveiculo>;
end;

implementation

{ TveiculoService }

procedure TveiculoService.cadastrarVeiculo(veiculo:Tveiculo);
var
veiculoRepo:TveiculoRepository;
begin
veiculoRepo:=TveiculoRepository.create;

  try
    veiculoRepo.CadastrarVeiculo(veiculo);
  finally
    veiculoRepo.free;
  end;
end;

function TveiculoService.mostrarVeiuclo: TobjectList<Tveiculo>;
var
veiculoRepo:TveiculoRepository;
begin
  veiculoRepo:=TveiculoRepository.create;
  try
    result := veiculoRepo.mostrarVeiuclo;
  finally
    veiculoRepo.free;
  end;
end;

function TveiculoService.mostrarVeiucloInativo: TobjectList<Tveiculo>;
var
veiculoRepo:TveiculoRepository;
begin
  veiculoRepo:=TveiculoRepository.create;
  try
    result := veiculoRepo.mostrarVeiucloInativo;
  finally
    veiculoRepo.free;
  end;
end;

end.
