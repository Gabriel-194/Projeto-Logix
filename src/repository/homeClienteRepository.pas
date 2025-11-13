unit homeClienteRepository;

interface
uses
data.DB,System.SysUtils, FireDAC.Comp.Client, unit2,System.Generics.Collections,System.Classes,uTransportadora;

type ThomeClienteRepository = class

    function ContarPedidos(aIdCliente: Integer; const aStatus: String ): Integer;
    function BuscarTransportadorasMaisUsadas(aIdCliente: Integer): TObjectList<TTransportadora>;

end;

implementation

{ ThomeClienteRepository }

function ThomeClienteRepository.BuscarTransportadorasMaisUsadas(aIdCliente: Integer): TObjectList<TTransportadora>;
var
  QrySchemas, QryTransp: TFDQuery;
  Schema: string;
  Lista: TObjectList<TTransportadora>;
  Transportadora: TTransportadora;
begin
  Lista := TObjectList<TTransportadora>.Create(True);
  QrySchemas := TFDQuery.Create(nil);
  QryTransp := TFDQuery.Create(nil);
  try
    QrySchemas.Connection := DataModule2.FDConnection1;
    QryTransp.Connection  := DataModule2.FDConnection1;

    QrySchemas.SQL.Text :=
      'SELECT nspname FROM pg_namespace ' +
      'WHERE nspname NOT IN (''public'',''pg_catalog'',''information_schema'',''pg_toast'') ' +
      'ORDER BY nspname';
    QrySchemas.Open;

    while not QrySchemas.Eof do
    begin
      Schema := QrySchemas.FieldByName('nspname').AsString;

      QryTransp.SQL.Text :=
        'SELECT t.id, t.nome, COUNT(p.id_pedido) AS total_pedidos ' +
        'FROM ' + Schema + '.pedido p ' +
        'JOIN public.transportadora t ON t.id = p.id_transportadora ' +
        'WHERE p.id_cliente = :id_cliente ' +
        'GROUP BY t.id, t.nome ' +
        'ORDER BY total_pedidos DESC';

      QryTransp.ParamByName('id_cliente').AsInteger := aIdCliente;
      QryTransp.Open;

      while not QryTransp.Eof do
      begin
        Transportadora := TTransportadora.Create;
        Transportadora.setId(QryTransp.FieldByName('id').AsInteger);
        Transportadora.setNome(QryTransp.FieldByName('nome').AsString);
        Transportadora.setTotalPedidos(QryTransp.FieldByName('total_pedidos').AsInteger);

        Lista.Add(Transportadora);
        QryTransp.Next;
      end;

      QryTransp.Close;
      QrySchemas.Next;
    end;

    Result := Lista;
  finally
    QryTransp.Free;
    QrySchemas.Free;
  end;
end;

function ThomeClienteRepository.ContarPedidos(aIdCliente: Integer; const aStatus: String): Integer;
var
  QrySchemas, QryPedidos: TFDQuery;
  Schema: string;
  SQL: string;
  Total: Integer;
begin
  Total := 0;
  QrySchemas := TFDQuery.Create(nil);
  QryPedidos := TFDQuery.Create(nil);
  try
    QrySchemas.Connection := DataModule2.FDConnection1;
    QryPedidos.Connection := DataModule2.FDConnection1;
    QrySchemas.SQL.Text :=
      'SELECT nspname ' +
      'FROM pg_namespace ' +
      'WHERE nspname NOT IN (''public'',''pg_catalog'',''information_schema'',''pg_toast'') ' +
      'ORDER BY nspname';
    QrySchemas.Open;
    while not QrySchemas.Eof do
    begin
      Schema := QrySchemas.FieldByName('nspname').AsString;
      SQL := Format(
        'SELECT COUNT(*) AS qtd FROM %s.pedido WHERE id_cliente = :id_cliente',
        [Schema]
      );
      if aStatus <> '' then
        SQL := SQL + ' AND status = :status';

      QryPedidos.SQL.Text := SQL;
      QryPedidos.ParamByName('id_cliente').AsInteger := aIdCliente;
      if aStatus <> '' then
        QryPedidos.ParamByName('status').AsString := aStatus;
      QryPedidos.Open;
      if not QryPedidos.Eof then
        Total := Total + QryPedidos.FieldByName('qtd').AsInteger;
      QryPedidos.Close;
      QrySchemas.Next;
    end;
    Result := Total;
  finally
    QryPedidos.Free;
    QrySchemas.Free;
  end;
end;

end.
