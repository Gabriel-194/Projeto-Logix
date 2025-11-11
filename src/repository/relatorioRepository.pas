unit relatorioRepository;

interface
uses
  System.SysUtils, System.Classes,data.db, FireDAC.Comp.Client, System.Generics.Collections, unit2,Vcl.Dialogs;
type TrelatorioRepository = class
  procedure relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData:TdateTime= 0);
  procedure relatorioTempoCarregamento(aIdTransportadora,aIdCarregador:Integer);
  procedure relatorioTempoViagem(aIdTransportadora, aIdMotorista: Integer);
end;


implementation

{ TrelatorioRepository }

procedure TrelatorioRepository.relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData:TdateTime= 0);
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
      dataModule2.FDQueryFaturamento.ParamByName('data_pedido').Asdate := aData;

    dataModule2.FDQueryFaturamento.Open;
    dataModule2.frxReportFaturamento.ShowReport();
  finally
    QryAux.Free;
  end;
end;

procedure TrelatorioRepository.relatorioTempoCarregamento(aIdTransportadora, aIdCarregador: Integer);
var
  SchemaName: string;
  QryAux: TFDQuery;
  SQLWhere, SQLMedia: string;
begin
  QryAux := TFDQuery.Create(nil);
  try
    QryAux.Connection := dataModule2.FDConnection1;
    QryAux.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    QryAux.ParamByName('id').AsInteger := aIdTransportadora;
    QryAux.Open;
    SchemaName := '';
    if QryAux.RecordCount > 0 then
      SchemaName := QryAux.FieldByName('schema_name').AsString;
    QryAux.Close;


    dataModule2.FDQueryTimeCarreg.Close;
    dataModule2.FDQueryTimeCarreg.Params.Clear;

    if aIdCarregador > 0 then
    begin
      with dataModule2.FDQueryTimeCarreg.Params.Add do
      begin
        Name := 'id_carregador';
        ParamType := ptInput;
        DataType := ftInteger;
        Value := aIdCarregador;
      end;
    end;

    SQLWhere := 'WHERE c.data_hora_inicio IS NOT NULL AND c.data_hora_fim IS NOT NULL';
    if aIdCarregador > 0 then
      SQLWhere := SQLWhere + ' AND u.id_usuario = :id_carregador';


    SQLMedia :=
      ' UNION ALL ' +
      'SELECT u.id_usuario AS id_carregador, u.nome AS nome_carregador,NULL::integer AS id_carregamento, NULL::timestamp AS data_hora_inicio, NULL::timestamp AS data_hora_fim, ' +
      'NULL::text   AS tempo_hh_mm, ' +
      '(LPAD(FLOOR(AVG(EXTRACT(EPOCH FROM (c.data_hora_fim - c.data_hora_inicio))) / 3600)::text, 2, ''0'') || '':'' || ' +
      'LPAD(FLOOR((AVG(EXTRACT(EPOCH FROM (c.data_hora_fim - c.data_hora_inicio))) % 3600) / 60)::text, 2, ''0''))::text AS media_geral_hh_mm ' +
      'FROM ' + SchemaName + '.carregamento c ' +
      'JOIN public.usuarios u ON u.id_usuario = c.id_carregador ' +
      SQLWhere +
      ' GROUP BY u.id_usuario, u.nome ';

    if aIdCarregador = 0 then
      SQLMedia := SQLMedia +
        ' UNION ALL ' +
        'SELECT NULL::integer AS id_carregador,''MÉDIA GERAL'' AS nome_carregador, NULL::integer AS id_carregamento, NULL::timestamp AS data_hora_inicio, ' +
        'NULL::timestamp AS data_hora_fim, NULL::text AS tempo_hh_mm, ' +
        '(LPAD(FLOOR(AVG(EXTRACT(EPOCH FROM (c.data_hora_fim - c.data_hora_inicio))) / 3600)::text, 2, ''0'') || '':'' || ' +
        'LPAD(FLOOR((AVG(EXTRACT(EPOCH FROM (c.data_hora_fim - c.data_hora_inicio))) % 3600) / 60)::text, 2, ''0''))::text AS media_geral_hh_mm ' +
        'FROM ' + SchemaName + '.carregamento c ' +
        'WHERE c.data_hora_inicio IS NOT NULL AND c.data_hora_fim IS NOT NULL ';


    dataModule2.FDQueryTimeCarreg.SQL.Text :=
      'SELECT u.id_usuario AS id_carregador, u.nome AS nome_carregador, c.id_carregamento, c.data_hora_inicio, c.data_hora_fim, ' +
      '(LPAD(FLOOR(EXTRACT(EPOCH FROM (c.data_hora_fim - c.data_hora_inicio)) / 3600)::text, 2, ''0'') || '':'' || ' +
      'LPAD(FLOOR((EXTRACT(EPOCH FROM (c.data_hora_fim - c.data_hora_inicio)) % 3600) / 60)::text, 2, ''0''))::text AS tempo_hh_mm, ' +
      ' NULL::text AS media_geral_hh_mm ' +
      'FROM ' + SchemaName + '.carregamento c ' +
      'JOIN public.usuarios u ON u.id_usuario = c.id_carregador ' +
      SQLWhere +
      SQLMedia +
      ' ORDER BY nome_carregador NULLS LAST, data_hora_inicio NULLS LAST;';

    dataModule2.FDQueryTimeCarreg.Open;
    dataModule2.frxReportTimeCarreg.ShowReport;

  finally
    QryAux.Free;
  end;
end;

procedure TrelatorioRepository.relatorioTempoViagem(aIdTransportadora, aIdMotorista: Integer);
var
  SchemaName: string;
  QryAux: TFDQuery;
  SQLWhere, SQLMedia: string;
begin
  QryAux := TFDQuery.Create(nil);
  try
    QryAux.Connection := dataModule2.FDConnection1;
    QryAux.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    QryAux.ParamByName('id').AsInteger := aIdTransportadora;
    QryAux.Open;

    SchemaName := '';
    if QryAux.RecordCount > 0 then
      SchemaName := QryAux.FieldByName('schema_name').AsString;
    QryAux.Close;

    dataModule2.FDQueryTimeViagem.Close;
    dataModule2.FDQueryTimeViagem.Params.Clear;

    if aIdMotorista > 0 then
    begin
      with dataModule2.FDQueryTimeViagem.Params.Add do
      begin
        Name := 'id_motorista';
        ParamType := ptInput;
        DataType := ftInteger;
        Value := aIdMotorista;
      end;
    end;

    SQLWhere := 'WHERE v.data_saida_cd IS NOT NULL AND v.data_chegada IS NOT NULL';
    if aIdMotorista > 0 then
      SQLWhere := SQLWhere + ' AND u.id_usuario = :id_motorista';

    SQLMedia :=
      ' UNION ALL ' +
      'SELECT u.id_usuario AS id_motorista, u.nome AS nome_motorista, NULL::integer AS id_viagem, ' +
      'NULL::timestamp AS data_saida_cd, NULL::timestamp AS data_chegada, ' +
      'NULL::text AS tempo_hh_mm, ' +

      '(LPAD(FLOOR(AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_cd))) / 3600)::text, 2, ''0'') || '':'' || ' +
      'LPAD(FLOOR((AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_cd))) % 3600) / 60)::text, 2, ''0''))::text AS media_geral_hh_mm ' +
      'FROM ' + SchemaName + '.viagem v ' +
      'JOIN public.usuarios u ON u.id_usuario = v.id_motorista ' +
      SQLWhere +
      ' GROUP BY u.id_usuario, u.nome ';

    if aIdMotorista = 0 then
      SQLMedia := SQLMedia +
        ' UNION ALL ' +
        'SELECT NULL::integer AS id_motorista, ''MÉDIA GERAL'' AS nome_motorista, NULL::integer AS id_viagem, ' +
        'NULL::timestamp AS data_saida_cd, NULL::timestamp AS data_chegada, NULL::text AS tempo_hh_mm, ' +
        '(LPAD(FLOOR(AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_cd))) / 3600)::text, 2, ''0'') || '':'' || ' +
        'LPAD(FLOOR((AVG(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_cd))) % 3600) / 60)::text, 2, ''0''))::text AS media_geral_hh_mm ' +
        'FROM ' + SchemaName + '.viagem v ' +
        'WHERE v.data_saida_cd IS NOT NULL AND v.data_chegada IS NOT NULL ';


    dataModule2.FDQueryTimeViagem.SQL.Text :=
      'SELECT u.id_usuario AS id_motorista, u.nome AS nome_motorista, v.id_viagem, v.data_saida_cd, v.data_chegada, ' +
      '(LPAD(FLOOR(EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_cd)) / 3600)::text, 2, ''0'') || '':'' || ' +
      'LPAD(FLOOR((EXTRACT(EPOCH FROM (v.data_chegada - v.data_saida_cd)) % 3600) / 60)::text, 2, ''0''))::text AS tempo_hh_mm, ' +
      'NULL::text AS media_geral_hh_mm ' +
      'FROM ' + SchemaName + '.viagem v ' +
      'JOIN public.usuarios u ON u.id_usuario = v.id_motorista ' +
      SQLWhere +
      SQLMedia +
      ' ORDER BY nome_motorista NULLS LAST, data_saida_cd NULLS LAST;';

    dataModule2.FDQueryTimeViagem.Open;
    dataModule2.frxReportTimeViagem.ShowReport;

  finally
    QryAux.Free;
  end;
end;



end.
