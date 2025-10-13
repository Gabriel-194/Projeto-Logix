unit pedidoRepository;

interface
uses
System.SysUtils, FireDAC.Comp.Client,unit2,System.Generics.Collections,pedidoDto;

type TpedidoRepository = class
function GetPrecoBasePorKm(const schemaName, tipo: string): Double;
procedure confirmarPedido(Apedido: TPedidoDto; const schemaName: string);

end;
implementation

procedure TpedidoRepository.confirmarPedido(Apedido: TPedidoDto; const schemaName: string);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text :=
    'INSERT INTO ' + schemaName + '.pedido (' +
    'id_cliente, cep_origem, estado_origem, municipio_origem, endereco_origem, numero_origem, ' +
    'cep_destino, estado_destino, municipio_destino, endereco_destino, numero_destino, ' +
    'data_pedido, peso, distancia_km, tipo_carga, id_transportadora, preco, status' +
    ') VALUES (' +
    ':id_cliente, :cep_origem, :estado_origem, :municipio_origem, :endereco_origem, :numero_origem, ' +
    ':cep_destino, :estado_destino, :municipio_destino, :endereco_destino, :numero_destino, ' +
    'NOW(), :peso, :distancia_km, :tipo_carga, :id_transportadora, :preco, :status' +
    ')';

    FDQuery.ParamByName('id_cliente').AsInteger         := Apedido.IdCliente;
    FDQuery.ParamByName('cep_origem').AsString          := Apedido.CepOrigem;
    FDQuery.ParamByName('estado_origem').AsString       := Apedido.EstadoOrigem;
    FDQuery.ParamByName('municipio_origem').AsString    := Apedido.MunicipioOrigem;
    FDQuery.ParamByName('endereco_origem').AsString     := Apedido.EnderecoOrigem;
    FDQuery.ParamByName('numero_origem').AsString       := Apedido.NumeroOrigem;

    FDQuery.ParamByName('cep_destino').AsString         := Apedido.CepDestino;
    FDQuery.ParamByName('estado_destino').AsString      := Apedido.EstadoDestino;
    FDQuery.ParamByName('municipio_destino').AsString   := Apedido.MunicipioDestino;
    FDQuery.ParamByName('endereco_destino').AsString    := Apedido.EnderecoDestino;
    FDQuery.ParamByName('numero_destino').AsString      := Apedido.NumeroDestino;

    FDQuery.ParamByName('peso').AsFloat                 := Apedido.Peso;
    FDQuery.ParamByName('distancia_km').AsFloat         := Apedido.DistanciaKm;
    FDQuery.ParamByName('tipo_carga').AsString          := Apedido.TipoCarga;
    FDQuery.ParamByName('id_transportadora').AsInteger  := Apedido.IdTransportadora;
    FDQuery.ParamByName('preco').AsFloat                := Apedido.Preco;
    FDQuery.ParamByName('status').AsString              := Apedido.Status;

    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

function TpedidoRepository.GetPrecoBasePorKm(const schemaName, tipo: string): Double;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := Format('SELECT preco_base_km FROM %s.tipo_carga WHERE tipo = :tipo', [schemaName]);
    FDQuery.ParamByName('tipo').AsString := tipo;

    FDQuery.Open;
    Result := FDQuery.FieldByName('preco_base_km').AsFloat;
  finally
    FDQuery.Free;
  end;
end;

end.
