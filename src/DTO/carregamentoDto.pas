unit carregamentoDto;

interface
type TcarregamentoDto = record
  idCarregamento:integer;
  idCarregador:integer;
  idPedido:integer;
  idVeiculo:integer;
  sCarregador: string;
  sVeiculo: string;
  status:String;
  dataCadastro: TDateTime;
  dataInicio:TdateTime;
  dataFim:TdateTime;
  distanciaKm:double;
  carga: String;
end;

implementation

end.
