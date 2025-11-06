unit relatorioRepository;

interface
uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, System.Generics.Collections, unit2;
type TrelatorioRepository = class
  procedure relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData: TDateTime = 0);
end;


implementation

{ TrelatorioRepository }

procedure TrelatorioRepository.relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData: TDateTime = 0);
var
  SchemaName: string;
  QryAux: TFDQuery;
  SQLWhere, Filtros: string;
begin
  QryAux := TFDQuery.Create(nil);
  try
    QryAux.Connection := dataModule2.FDConnection1;
    QryAux.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    QryAux.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    QryAux.Open;
    SchemaName := QryAux.FieldByName('schema_name').AsString;
    QryAux.Close;

    Filtros := '';

    if aIdCliente > 0 then
      Filtros := Filtros + ' AND c.id_cliente = :id_cliente ';
    if aData <> 0 then
      Filtros := Filtros + ' AND CAST(p.data_pedido AS DATE) = :data_pedido ';


    if Filtros <> '' then
      SQLWhere := ' WHERE ' + Copy(Filtros, 6, Length(Filtros))
    else
      SQLWhere := '';

    dataModule2.FDQueryFaturamento.Close;
    dataModule2.FDQueryFaturamento.SQL.Text :=
      'SELECT c.id_cliente, c.nome, c.cpf, c.email, p.id_pedido, p.preco AS valor_pedido, NULL AS total_geral ' +
      'FROM public.cliente c ' +
      'JOIN ' + SchemaName + '.pedido p ON p.id_cliente = c.id_cliente ' +
      SQLWhere +
      ' UNION ALL ' +
      'SELECT NULL, NULL, NULL, NULL, NULL, NULL, SUM(p.preco) AS total_geral ' +
      'FROM public.cliente c ' +
      'JOIN ' + SchemaName + '.pedido p ON p.id_cliente = c.id_cliente ' +
      SQLWhere +
      ' ORDER BY id_pedido;';


    if aIdCliente > 0 then
      dataModule2.FDQueryFaturamento.ParamByName('id_cliente').AsInteger := aIdCliente;
    if aData <> 0 then
      dataModule2.FDQueryFaturamento.ParamByName('data_pedido').AsDate := aData;

    dataModule2.FDQueryFaturamento.Open;
    dataModule2.frxReportFaturamento.ShowReport();
  finally
    QryAux.Free;
  end;
end;

end.
