unit pedidoRepository;

interface
uses
System.SysUtils, FireDAC.Comp.Client,unit2,System.Generics.Collections,pedidoDto;

type TpedidoRepository = class
function GetPrecoBasePorKm(const schemaName, tipo: string): Double;
procedure confirmarPedido(Apedido: TPedidoDto; const schemaName: string);
function BuscarPedidos(aIdCliente:Integer): TList<TPedidoDto>;

end;
implementation

function TPedidoRepository.BuscarPedidos(aIdCliente: Integer): TList<TPedidoDto>;
var
  QrySchemas, QryPedidos: TFDQuery;
  Lista: TList<TPedidoDto>;
  Schema: string;
  Pedido: TPedidoDto;
begin
  Lista := TList<TPedidoDto>.Create;
  QrySchemas := TFDQuery.Create(nil);
  QryPedidos := TFDQuery.Create(nil);
  try
    QrySchemas.Connection := DataModule2.FDConnection1;
    QryPedidos.Connection := DataModule2.FDConnection1;

    // aqui Busca todos schemas tirando os padrão
    QrySchemas.SQL.Text :=
      'SELECT nspname ' +
      'FROM pg_namespace ' +
      'WHERE nspname NOT IN (''public'',''pg_catalog'',''information_schema'',''pg_toast'') ' +
      'ORDER BY nspname';
    QrySchemas.Open;

    while not QrySchemas.Eof do
    begin
      Schema := QrySchemas.FieldByName('nspname').AsString;

      // Montagem do o SQL para buscar os pedidos do cliente nesse schema
      QryPedidos.SQL.Text :=
      'SELECT id_pedido, cep_origem, estado_origem, cep_destino, estado_destino, ' +
      'id_transportadora, tipo_carga, data_pedido, distancia_km, preco, status ' +
      'FROM ' + Schema + '.pedido ' +
      'WHERE id_cliente = :id_cliente';
      QryPedidos.ParamByName('id_cliente').AsInteger := aIdCliente;

      QryPedidos.Open;
      while not QryPedidos.Eof do
      begin
        FillChar(Pedido, SizeOf(Pedido), 0);
        Pedido.IdPedido           := QryPedidos.FieldByName('id_pedido').AsInteger;
        Pedido.CepOrigem          := QryPedidos.FieldByName('cep_origem').AsString;
        Pedido.EstadoOrigem       := QryPedidos.FieldByName('estado_origem').AsString;
        Pedido.CepDestino         := QryPedidos.FieldByName('cep_destino').AsString;
        Pedido.EstadoDestino      := QryPedidos.FieldByName('estado_destino').AsString;
        Pedido.IdTransportadora   := QryPedidos.FieldByName('id_transportadora').AsInteger;
        Pedido.TipoCarga          := QryPedidos.FieldByName('tipo_carga').AsString;
        Pedido.DataPedido         := QryPedidos.FieldByName('data_pedido').AsDateTime;
        Pedido.DistanciaKm        := QryPedidos.FieldByName('distancia_km').AsFloat;
        Pedido.Preco              := QryPedidos.FieldByName('preco').AsFloat;
        Pedido.Status             := QryPedidos.FieldByName('status').AsString;
        Lista.Add(Pedido);

        QryPedidos.Next;
      end;
      QryPedidos.Close;
      QrySchemas.Next;
    end;
    Result := Lista;
  finally
    QryPedidos.Free;
    QrySchemas.Free;
  end;
end;


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
