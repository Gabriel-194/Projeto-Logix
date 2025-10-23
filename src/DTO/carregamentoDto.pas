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
  data_hora_inicio:TdateTime;
  data_hora_fim:TdateTime;
  distanciaKm:double;
  carga: String;
end;

implementation

end.
