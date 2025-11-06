unit relatorioService;

interface
uses
  System.SysUtils, transpRepository,uTransportadora,System.Generics.Collections,TipoCargaDto,uLog,usuarioLogado,relatorioRepository;
type TrelatorioService = class
  procedure relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData:TdateTime= 0);
end;
implementation

{ TrelatorioService }

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

end.
