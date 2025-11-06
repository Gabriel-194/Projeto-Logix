unit relatorioService;

interface
uses
  System.SysUtils, transpRepository,uTransportadora,System.Generics.Collections,TipoCargaDto,uLog,usuarioLogado,relatorioRepository;
type TrelatorioService = class
  procedure relatorioUsuarios;
end;
implementation

{ TrelatorioService }

procedure TrelatorioService.relatorioUsuarios;
var
  repo:TrelatorioRepository;
begin
repo:=TrelatorioRepository.create;
  try
    repo.relatorioFaturamento(userLogado.getIdTransportadora);;
  finally
    repo.free;
  end;
end;

end.
