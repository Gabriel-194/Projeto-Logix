unit messageDto;

interface
type TmessageDto = record
  id_message:Integer;
  id_pedido:Integer;
  id_transportadora:integer;
  id_cliente:integer;
  data_menssagem:TdateTime;
  texto:String;
end;

implementation

end.
