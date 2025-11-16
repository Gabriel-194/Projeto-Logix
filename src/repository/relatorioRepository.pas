unit relatorioRepository;

interface
uses
  System.SysUtils, System.Classes,data.db, FireDAC.Comp.Client, Vcl.Forms, System.Generics.Collections, unit2,Vcl.Dialogs, Winapi.ShellAPI, Winapi.Windows;
type TrelatorioRepository = class
  procedure relatorioFaturamento(aIdTransportadora: Integer;aIdCliente: Integer = 0;aData:TdateTime= 0);
  procedure relatorioTempoCarregamento(aIdTransportadora,aIdCarregador:Integer);
  procedure relatorioTempoViagem(aIdTransportadora, aIdMotorista: Integer);
  procedure relatorioTransportadorasMaisUsadas(aIdCliente: Integer);
  procedure exportarRelPdfCliente;
  procedure exportarRelFaturamento;
  procedure exportarRelCarreg;
  procedure exportarRelViagem;
end;


implementation

{ TrelatorioRepository }

procedure TrelatorioRepository.exportarRelCarreg;
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Title := 'Salvar Relatório de Tempo Médio de Carregamento';
    SaveDialog.Filter := 'PDF Files (*.pdf)|*.pdf';
    SaveDialog.DefaultExt := 'pdf';
    SaveDialog.FileName := 'Tempo_Carregamento_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.pdf';
    SaveDialog.InitialDir := ExtractFilePath(ParamStr(0));

    if SaveDialog.Execute then
    begin
      DataModule2.frxPDFExportTimeCarreg.FileName := SaveDialog.FileName;
      DataModule2.frxPDFExportTimeCarreg.ShowDialog := False;
      DataModule2.frxPDFExportTimeCarreg.ShowProgress := True;
      DataModule2.frxPDFExportTimeCarreg.OverwritePrompt := False;
      DataModule2.frxPDFExportTimeCarreg.OpenAfterExport := True;

      DataModule2.frxReportTimecarreg.Export(DataModule2.frxPDFExportTimeCarreg);
    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure TrelatorioRepository.exportarRelFaturamento;
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Title := 'Salvar Relatório de Faturamento';
    SaveDialog.Filter := 'PDF Files (*.pdf)|*.pdf';
    SaveDialog.DefaultExt := 'pdf';
    SaveDialog.FileName := 'Faturamento_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.pdf';
    SaveDialog.InitialDir := ExtractFilePath(ParamStr(0));

    if SaveDialog.Execute then
    begin
      DataModule2.frxPDFExportFaturamento.FileName := SaveDialog.FileName;
      DataModule2.frxPDFExportFaturamento.ShowDialog := False;
      DataModule2.frxPDFExportFaturamento.ShowProgress := True;
      DataModule2.frxPDFExportFaturamento.OverwritePrompt := False;
      DataModule2.frxPDFExportFaturamento.OpenAfterExport := True;

      DataModule2.frxReportFaturamento.Export(DataModule2.frxPDFExportFaturamento);

    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure TrelatorioRepository.exportarRelPdfCliente;
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Title := 'Salvar Relatório de Pedidos do Cliente';
    SaveDialog.Filter := 'PDF Files (*.pdf)|*.pdf';
    SaveDialog.DefaultExt := 'pdf';
    SaveDialog.FileName := 'Pedidos_Cliente_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.pdf';
    SaveDialog.InitialDir := ExtractFilePath(ParamStr(0));

    if SaveDialog.Execute then
    begin
      DataModule2.frxPDFExportRelCliente.FileName := SaveDialog.FileName;
      DataModule2.frxPDFExportRelCliente.ShowDialog := False;
      DataModule2.frxPDFExportRelCliente.ShowProgress := True;
      DataModule2.frxPDFExportRelCliente.OverwritePrompt := False;
      DataModule2.frxPDFExportRelCliente.OpenAfterExport := True;

      DataModule2.frxReportRelCliente.Export(DataModule2.frxPDFExportRelCliente);
    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure TrelatorioRepository.exportarRelViagem;
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Title := 'Salvar Relatório de Viagens';
    SaveDialog.Filter := 'PDF Files (*.pdf)|*.pdf';
    SaveDialog.DefaultExt := 'pdf';
    SaveDialog.FileName := 'Relatorio_Viagens_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.pdf';
    SaveDialog.InitialDir := ExtractFilePath(ParamStr(0));

    if SaveDialog.Execute then
    begin
      DataModule2.frxPDFExportTimeViagem.FileName := SaveDialog.FileName;
      DataModule2.frxPDFExportTimeViagem.ShowDialog := False;
      DataModule2.frxPDFExportTimeViagem.ShowProgress := True;
      DataModule2.frxPDFExportTimeViagem.OverwritePrompt := False;
      DataModule2.frxPDFExportTimeViagem.OpenAfterExport := True;

      DataModule2.frxReportTimeViagem.Export(DataModule2.frxPDFExportTimeViagem);
    end;
  finally
    SaveDialog.Free;
  end;
end;
procedure TrelatorioRepository.relatorioFaturamento(aIdTransportadora: Integer;
  aIdCliente: Integer = 0; aData: TDateTime = 0);
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
      Filtros := Filtros + ' AND c.id_cliente = ' + IntToStr(aIdCliente);
    if aData <> 0 then
      Filtros := Filtros + ' AND CAST(p.data_pedido AS DATE) = ''' + FormatDateTime('yyyy-mm-dd', aData) + '''';

    if Filtros <> '' then
      SQLWhere := ' WHERE ' + Copy(Filtros, 6, Length(Filtros))
    else
      SQLWhere := '';

    dataModule2.FDQueryFaturamento.Close;
    dataModule2.FDQueryFaturamento.SQL.Clear;
    dataModule2.FDQueryFaturamento.SQL.Text :=
      'WITH dados_filtrados AS ( ' +
      '  SELECT c.id_cliente, c.nome, c.cpf, c.email, p.id_pedido, p.preco AS valor_pedido ' +
      '  FROM public.cliente c ' +
      '  JOIN ' + SchemaName + '.pedido p ON p.id_cliente = c.id_cliente ' +
      SQLWhere +
      ') ' +
      'SELECT id_cliente, nome, cpf, email, id_pedido, valor_pedido, CAST(NULL AS NUMERIC) AS total_geral ' +
      'FROM dados_filtrados ' +
      'UNION ALL ' +
      'SELECT NULL, NULL, NULL, NULL, NULL, NULL, SUM(valor_pedido) AS total_geral ' +
      'FROM dados_filtrados ' +
      'ORDER BY id_pedido NULLS LAST;';

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


procedure TrelatorioRepository.relatorioTransportadorasMaisUsadas(aIdCliente: Integer);
var
  QrySchemas: TFDQuery;
  Schema: string;
  SQLUnion, FinalSQL: TStringList;
  i: Integer;
begin
  QrySchemas := TFDQuery.Create(nil);
  SQLUnion := TStringList.Create;
  FinalSQL := TStringList.Create;
  try
    QrySchemas.Connection := DataModule2.FDConnection1;
    QrySchemas.SQL.Text :=
      'SELECT nspname FROM pg_namespace ' +
      'WHERE nspname NOT IN (''public'', ''pg_catalog'', ''information_schema'', ''pg_toast'') ' +
      'ORDER BY nspname';
    QrySchemas.Open;

    while not QrySchemas.Eof do
    begin
      Schema := QrySchemas.FieldByName('nspname').AsString;
      SQLUnion.Add(
        'SELECT t.id AS transportadora_id, ' +
        '       t.nome AS transportadora_nome, ' +
        '       p.id_pedido, ' +
        '       p.status, ' +
        '       p.data_pedido, ' +
        '       c.nome AS cliente_nome, ' +
        '       c.id_cliente AS id ' +
        'FROM ' + Schema + '.pedido p ' +
        'JOIN public.transportadora t ON t.id = p.id_transportadora ' +
        'JOIN public.cliente c ON c.id_cliente = p.id_cliente ' +
        'WHERE p.id_cliente = :id_cliente'
      );
      QrySchemas.Next;
    end;
    QrySchemas.Close;

    if SQLUnion.Count = 0 then
      Exit;

    FinalSQL.Add('SELECT *, ');
    FinalSQL.Add('       COUNT(*) OVER (PARTITION BY transportadora_id) AS total_pedidos ');
    FinalSQL.Add('FROM (');

    for i := 0 to SQLUnion.Count - 1 do
    begin
      FinalSQL.Add(SQLUnion[i]);
      if i < SQLUnion.Count - 1 then
        FinalSQL.Add('UNION ALL');
    end;

    FinalSQL.Add(') AS todos_pedidos ');
    FinalSQL.Add('ORDER BY total_pedidos DESC, transportadora_nome, data_pedido DESC');

    with DataModule2.FDQueryRelCliente do
    begin
      Close;
      SQL.Clear;
      Params.Clear;
      Fields.Clear;
      SQL.Text := FinalSQL.Text;
      ParamByName('id_cliente').AsInteger := aIdCliente;
      Open;
    end;

    DataModule2.frxReportRelCliente.ShowReport();
  finally
    SQLUnion.Free;
    FinalSQL.Free;
    QrySchemas.Free;
  end;
end;

end.
