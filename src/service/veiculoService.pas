unit veiculoService;

interface
uses
veiculoRepository,uVeiculo,System.Generics.Collections;

type TveiculoService = class
  procedure cadastrarVeiculo(veiculo:Tveiculo);
  function mostrarVeiuclo:TobjectList<Tveiculo>;
  function mostrarVeiculoInativo: TobjectList<Tveiculo>;
  procedure excluirVeiculo(veiculo:Tveiculo);
  procedure recuperarVeiculo(veiculo:Tveiculo);
  procedure editarVeiculo(veiculo:Tveiculo);
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

procedure TveiculoService.editarVeiculo(veiculo: Tveiculo);
var
veiculoRepo:TveiculoRepository;
begin
veiculoRepo:=TveiculoRepository.create;

  try
    veiculoRepo.editarVeiculo(veiculo);
  finally
    veiculoRepo.free;
  end;
end;

procedure TveiculoService.excluirVeiculo(veiculo: Tveiculo);
var
veiculoRepo:TveiculoRepository;
begin
veiculoRepo:=TveiculoRepository.create;

  try
    veiculoRepo.excluirVeiculo(veiculo);
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

function TveiculoService.mostrarVeiculoInativo: TobjectList<Tveiculo>;
var
veiculoRepo:TveiculoRepository;
begin
  veiculoRepo:=TveiculoRepository.create;
  try
    result := veiculoRepo.mostrarVeiculoInativo;
  finally
    veiculoRepo.free;
  end;
end;

procedure TveiculoService.recuperarVeiculo(veiculo: Tveiculo);
var
veiculoRepo:TveiculoRepository;
begin
veiculoRepo:=TveiculoRepository.create;

  try
    veiculoRepo.recuperarVeiculo(veiculo);
  finally
    veiculoRepo.free;
  end;
end;

end.
