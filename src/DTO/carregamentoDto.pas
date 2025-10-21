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
end;

implementation

end.
