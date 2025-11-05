unit relatorioRepository;

interface
uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, System.Generics.Collections, unit2;
type TrelatorioRepository = class
  procedure relatorioUsuarios(aIdTransportadora: Integer);
end;


implementation

{ TrelatorioRepository }

procedure TrelatorioRepository.relatorioUsuarios(aIdTransportadora: Integer);
var
  SchemaName: string;
  QryAux: TFDQuery;
begin
  QryAux := TFDQuery.Create(nil);
  try
    QryAux.Connection := dataModule2.FDConnection1;
    QryAux.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    QryAux.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    QryAux.Open;
    SchemaName := QryAux.FieldByName('schema_name').AsString;
    QryAux.Close;

    dataModule2.FDQueryFaturamento.Close;
    dataModule2.FDQueryFaturamento.SQL.Text :=
      'SELECT c.id_cliente, c.nome, c.cpf, c.email, SUM(p.preco) AS total_faturado ' +
      'FROM public.cliente c ' +
      'JOIN ' + SchemaName + '.pedido p ON p.id_cliente = c.id_cliente ' +
      'GROUP BY c.id_cliente, c.nome, c.cpf, c.email ' +
      'UNION ALL ' +
      'SELECT NULL, ''TOTAL'', NULL, NULL, SUM(p.preco) ' +
      'FROM public.cliente c ' +
      'JOIN ' + SchemaName + '.pedido p ON p.id_cliente = c.id_cliente ' +
      'ORDER BY total_faturado DESC';
    dataModule2.FDQueryFaturamento.Open;

    dataModule2.frxReportFaturamento.ShowReport();
  finally
    QryAux.Free;
  end;
end;

end.
