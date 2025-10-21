unit veiculoService;

interface
uses
veiculoRepository,uVeiculo,System.Generics.Collections,System.SysUtils, DateUtils,tipoCargaDto;

type TveiculoService = class
  procedure cadastrarVeiculo(veiculo:Tveiculo);
  function mostrarVeiuclo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
  function mostrarVeiculoInativo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
  procedure excluirVeiculo(veiculo:Tveiculo);
  procedure recuperarVeiculo(veiculo:Tveiculo);
  procedure editarVeiculo(veiculo:Tveiculo);
  function cargasDisponiveis(aIdTransportadora:Integer):tlist<TtipoCargaDto>;
  function buscarVeiculosDisponiveis(aIdTransportadora:integer; apeso:double;atipoCarga:string):TobjectList<Tveiculo>;
end;

implementation

{ TveiculoService }

function TveiculoService.buscarVeiculosDisponiveis(aIdTransportadora: integer;
  apeso: double; atipoCarga: string): TobjectList<Tveiculo>;
var
repo:TveiculoRepository;
begin
repo:=TveiculoRepository.create;

  try
    result := repo.buscarVeiculosDisponiveis(aIdTransportadora, aPeso,aTipoCarga);
  finally
    repo.free;
  end;
end;

procedure TveiculoService.cadastrarVeiculo(veiculo:Tveiculo);
var
  veiculoRepo: TveiculoRepository;
  anoAtual: Integer;
begin

  anoAtual := YearOf(Now);

  if Trim(veiculo.getPlaca) = '' then
    raise Exception.Create('A placa do ve�culo n�o pode estar vazia.');

  if (veiculo.getAno < 1900) and (veiculo.getAno > 2025) then
    raise Exception.Create('Ano do ve�culo inv�lido.');

  if veiculo.getAno > anoAtual then
    raise Exception.Create('Ano do ve�culo maior que o atual.');

  if Trim(veiculo.getModelo) = '' then
    raise Exception.Create('O modelo do ve�culo n�o pode estar vazio.');

  if Trim(veiculo.getTipo_carga) = '' then
    raise Exception.Create('O tipo de carga do ve�culo n�o pode estar vazio.');

  if veiculo.getCapacidade <= 0 then
    raise Exception.Create('A capacidade do ve�culo deve ser maior que zero.');

  if Trim(veiculo.getUnidade_medida) = '' then
    raise Exception.Create('A unidade de medida do ve�culo n�o pode estar vazia.');

  if veiculo.getId_motorista <= 0 then
    raise Exception.Create('O motorista do ve�culo n�o foi selecionado.');

  if veiculo.getIdTransportadora <= 0 then
    raise Exception.Create('Transportadora n�o informada.');


  veiculoRepo := TveiculoRepository.create;
  try
    veiculoRepo.CadastrarVeiculo(veiculo);
  finally
    veiculoRepo.free;
  end;
end;

function TveiculoService.cargasDisponiveis(
  aIdTransportadora: Integer): tlist<TtipoCargaDto>;
var
repo:TveiculoRepository;
begin
repo:=TveiculoRepository.create;
  try
    result := repo.cargasDisponiveis(aidTransportadora);
  finally
    repo.free;
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

function TveiculoService.mostrarVeiuclo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
var
veiculoRepo:TveiculoRepository;
begin
  veiculoRepo:=TveiculoRepository.create;
  try
    result := veiculoRepo.mostrarVeiuclo(aIdtransportadora);
  finally
    veiculoRepo.free;
  end;
end;

function TveiculoService.mostrarVeiculoInativo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
var
veiculoRepo:TveiculoRepository;
begin
  veiculoRepo:=TveiculoRepository.create;
  try
    result := veiculoRepo.mostrarVeiculoInativo(aIdtransportadora);
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
