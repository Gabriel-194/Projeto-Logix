unit veiculoService;

interface
uses
veiculoRepository,uVeiculo;

type TveiculoService = class
  procedure cadastrarVeiculo(veiculo:Tveiculo);
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

end.
