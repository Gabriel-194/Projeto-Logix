unit relatorioService;

interface
uses
  System.SysUtils, transpRepository,uTransportadora,System.Generics.Collections,TipoCargaDto,uLog,usuarioLogado,relatorioRepository;
type TrelatorioService = class
  procedure relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData:TdateTime= 0);
    procedure relatorioTempoCarregamento(aIdTransportadora,aIdCarregador:Integer);
    procedure relatorioTempoViagem(aIdTransportadora, aIdMotorista: Integer);
    procedure exportarRelFaturamento;
      procedure exportarRelCarreg;
end;
implementation

{ TrelatorioService }

procedure TrelatorioService.exportarRelCarreg;
var
  repo:TrelatorioRepository;
begin
  repo:=TrelatorioRepository.create;
  try
    repo.exportarRelCarreg;
  finally
    repo.free;
  end;
end;

procedure TrelatorioService.exportarRelFaturamento;
var
  repo:TrelatorioRepository;
begin
  repo:=TrelatorioRepository.create;
  try
    repo.exportarRelFaturamento;
  finally
    repo.free;
  end;
end;

procedure TrelatorioService.relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData:TdateTime= 0);
var
  repo:TrelatorioRepository;
begin
repo:=TrelatorioRepository.create;
  try
    repo.relatorioFaturamento(aIdTransportadora,aIdCliente,aData);
  finally
    repo.free;
  end;
end;

procedure TrelatorioService.relatorioTempoCarregamento(aIdTransportadora,
  aIdCarregador: Integer);
var
  repo:TrelatorioRepository;
begin
repo:=TrelatorioRepository.create;
  try
    repo.relatorioTempoCarregamento(aIdTransportadora,aIdCarregador);
  finally
    repo.free;
  end;
end;

procedure TrelatorioService.relatorioTempoViagem(aIdTransportadora,
  aIdMotorista: Integer);
var
  repo:TrelatorioRepository;
begin
repo:=TrelatorioRepository.create;
  try
    repo.relatorioTempoViagem(aIdTransportadora,aIdmotorista);
  finally
    repo.free;
  end;
end;

end.
