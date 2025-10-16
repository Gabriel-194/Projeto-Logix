unit homeClienteRepository;

interface
uses
data.DB,System.SysUtils, FireDAC.Comp.Client, unit2,System.Generics.Collections,System.Classes;

type ThomeClienteRepository = class

    function ContarPedidos(aIdCliente: Integer; const aStatus: String ): Integer;

end;

implementation

{ ThomeClienteRepository }

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
      // Monta SQL para contar pedidos do cliente (e status, se informado) no schema
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
