unit homeRepository;

interface
uses
data.DB,System.SysUtils, FireDAC.Comp.Client, unit2,System.Generics.Collections,System.Classes,pedidoDto,tipoCargaDto;
type ThomeRepository = class
  function mostrarPermissoes : TDataSet;
  function ContarUsuariosPorCargo(const aCargo: string): Integer;
  function ContarRegistrosAtivos(  const ATabela: string;AIdTransportadora: Integer = 0;const AColunaFiltroAdicional: string = '';const AValorFiltroAdicional: string = ''
):Integer;
    function ObterTiposCargasMaisPedidas(aIdTransportadora:integer): Tlist<TtipoCargaDto>;
    function ObterPedidosPorMes(aIdTransportadora:integer): Tlist<TpedidoDto>;
    function graficoReceitaPorMes(aIdTransportadora: Integer): TDictionary<String, Double>;
    function graficoStatusPedidos(aIdTransportadora: Integer): TDictionary<String, Integer>;
    function graficoDistanciaPorMes(aIdTransportadora: Integer): TDictionary<String, Double>;
    function graficoVeiculosMaisUsados(aIdTransportadora: Integer): TDictionary<String, Integer>;
end;

implementation

{ ThomeRepository }

function ThomeRepository.ContarUsuariosPorCargo(const aCargo: string): Integer;
var
  FDQuery: TFDQuery;
begin
  Result := 0;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT COUNT(id_usuario) FROM public.usuarios ' +
                        'WHERE ativo = TRUE AND cargo_descricao = :cargo';

    FDQuery.ParamByName('cargo').AsString := aCargo;

    FDQuery.Open;

    if not FDQuery.IsEmpty then
      Result := FDQuery.Fields[0].AsInteger;

  finally
    FDQuery.Free;
  end;
end;

function ThomeRepository.graficoDistanciaPorMes(
  aIdTransportadora: Integer): TDictionary<String, Double>;
var
  FDQuery: TFDQuery;
  SchemaName: String;
begin
  Result := TDictionary<String, Double>.Create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    FDQuery.ParamByName('id').AsInteger := aIdTransportadora;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.SQL.Text :=
        'SELECT ' +
        '  TO_CHAR(data_pedido, ''Mon'') as mes, ' +
        '  SUM(distancia_km) as km_total ' +
        'FROM ' + SchemaName + '.pedido ' +
        'WHERE id_transportadora = :id_transportadora ' +
        '  AND data_pedido >= CURRENT_DATE - INTERVAL ''12 months'' ' +
        'GROUP BY TO_CHAR(data_pedido, ''Mon''), EXTRACT(MONTH FROM data_pedido) ' +
        'ORDER BY EXTRACT(MONTH FROM data_pedido)';

      FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
      FDQuery.Open;

      while not FDQuery.Eof do
      begin
        Result.Add(
          FDQuery.FieldByName('mes').AsString,
          FDQuery.FieldByName('km_total').AsFloat
        );
        FDQuery.Next;
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

function ThomeRepository.graficoReceitaPorMes(
  aIdTransportadora: Integer): TDictionary<String, Double>;
var
  FDQuery: TFDQuery;
  SchemaName: String;
begin
  Result := TDictionary<String, Double>.Create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    FDQuery.ParamByName('id').AsInteger := aIdTransportadora;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.SQL.Text :=
        'SELECT ' +
        '  TO_CHAR(data_pedido, ''Mon'') as mes, ' +
        '  SUM(preco) as receita_total ' +
        'FROM ' + SchemaName + '.pedido ' +
        'WHERE id_transportadora = :id_transportadora ' +
        '  AND EXTRACT(YEAR FROM data_pedido) = EXTRACT(YEAR FROM CURRENT_DATE) ' +
        'GROUP BY TO_CHAR(data_pedido, ''Mon''), EXTRACT(MONTH FROM data_pedido) ' +
        'ORDER BY EXTRACT(MONTH FROM data_pedido)';

      FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
      FDQuery.Open;

      while not FDQuery.Eof do
      begin
        Result.Add(
          FDQuery.FieldByName('mes').AsString,
          FDQuery.FieldByName('receita_total').AsFloat
        );
        FDQuery.Next;
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

function ThomeRepository.graficoStatusPedidos(
  aIdTransportadora: Integer): TDictionary<String, Integer>;
var
  FDQuery: TFDQuery;
  SchemaName: String;
begin
  Result := TDictionary<String, Integer>.Create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    FDQuery.ParamByName('id').AsInteger := aIdTransportadora;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.SQL.Text :=
        'SELECT status, COUNT(*) as total ' +
        'FROM ' + SchemaName + '.pedido ' +
        'WHERE id_transportadora = :id_transportadora ' +
        'GROUP BY status ' +
        'ORDER BY total DESC';

      FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
      FDQuery.Open;

      while not FDQuery.Eof do
      begin
        Result.Add(
          FDQuery.FieldByName('status').AsString,
          FDQuery.FieldByName('total').AsInteger
        );
        FDQuery.Next;
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

function ThomeRepository.graficoVeiculosMaisUsados(
  aIdTransportadora: Integer): TDictionary<String, Integer>;
var
  FDQuery: TFDQuery;
  SchemaName: String;
begin
  Result := TDictionary<String, Integer>.Create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    FDQuery.ParamByName('id').AsInteger := aIdTransportadora;
    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.SQL.Text :=
        'SELECT v.placa || '' ('' || v.modelo || '')'' as veiculo, ' +
        '       COUNT(vg.id_viagem) as total_viagens ' +
        'FROM ' + SchemaName + '.veiculo v ' +
        'LEFT JOIN ' + SchemaName + '.viagem vg ON v.id_veiculo = vg.id_veiculo ' +
        'GROUP BY v.placa, v.modelo ' +
        'ORDER BY total_viagens DESC ' +
        'LIMIT 5';

      FDQuery.Open;

      while not FDQuery.Eof do
      begin
        Result.Add(
          FDQuery.FieldByName('veiculo').AsString,
          FDQuery.FieldByName('total_viagens').AsInteger
        );
        FDQuery.Next;
      end;
    end;
  finally
    FDQuery.Free;
  end;
end;

function ThomeRepository.mostrarPermissoes: TDataSet;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT id_permissao, nome, descricao, selecionado FROM public.permissao ORDER BY id_permissao';
    FDQuery.Open;
  finally

  Result := FDQuery;
  end;
end;

function ThomeRepository.ObterPedidosPorMes(aIdTransportadora: Integer): TList<TpedidoDto>;
var
  FDQuery: TFDQuery;
  schemaName: String;
  Pedido: TpedidoDto;
begin
  Result := TList<TpedidoDto>.Create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    FDQuery.ParamByName('id').AsInteger := aIdTransportadora;
    FDQuery.Open;
    schemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.ExecSQL('SET search_path TO ' + QuotedStr(schemaName) + ', public');

    FDQuery.SQL.Text :='SELECT EXTRACT(YEAR FROM data_pedido) AS ano, EXTRACT(MONTH FROM data_pedido) AS mes,  COUNT(*) AS total ' +
      'FROM pedido GROUP BY ano, mes ORDER BY ano, mes;';
    FDQuery.Open;

    while not FDQuery.Eof do
    begin
      Pedido := Default(TpedidoDto);
      Pedido.Ano       := FDQuery.FieldByName('ano').AsInteger;
      Pedido.Mes       := FDQuery.FieldByName('mes').AsInteger;
      Pedido.Total     := FDQuery.FieldByName('total').AsInteger;
      Result.Add(Pedido);

      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
end;

function ThomeRepository.ObterTiposCargasMaisPedidas(aIdTransportadora: Integer): TList<TtipoCargaDto>;
var
  FDQuery: TFDQuery;
  SchemaName: String;
  Carga: TtipoCargaDto;
begin
  Result := TList<TtipoCargaDto>.Create;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
    FDQuery.ParamByName('id').AsInteger := AIdTransportadora;
    FDQuery.Open;
    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.ExecSQL('SET search_path TO ' + QuotedStr(SchemaName) + ', public');

     FDQuery.SQL.Text :='SELECT t.tipo AS TipoCarga, COUNT(p.id_pedido) AS TotalPedidos FROM '+schemaName+'.tipo_carga t ' +
      'LEFT JOIN '+schemaName+'.pedido p ON t.tipo = p.tipo_carga GROUP BY t.tipo';
    FDQuery.Open;

    while not FDQuery.Eof do
    begin
      Carga.TipoCarga := FDQuery.FieldByName('TipoCarga').AsString;
      Carga.Total := FDQuery.FieldByName('TotalPedidos').AsInteger;
      Result.Add(Carga);
      FDQuery.Next;
    end;
  finally
    FDQuery.Free;
  end;
end;

function ThomeRepository.ContarRegistrosAtivos(
  const ATabela: string;
  AIdTransportadora: Integer = 0;
  const AColunaFiltroAdicional: string = '';
  const AValorFiltroAdicional: string = ''
): Integer;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  SQL: TStringList;
begin
  Result := 0;
  FDQuery := TFDQuery.Create(nil);
  SQL := TStringList.Create;
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    if (AIdTransportadora > 0) and (Pos('.', ATabela) = 0) then
    begin
      FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
      FDQuery.ParamByName('id').AsInteger := AIdTransportadora;
      FDQuery.Open;
      if FDQuery.IsEmpty then begin
              Exit;
      end;

      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;
      FDQuery.ExecSQL('SET search_path TO ' + QuotedStr(SchemaName) + ', public');
    end;


    SQL.Text := Format('SELECT COUNT(*) FROM %s WHERE ativo = TRUE', [ATabela]);


    if (AIdTransportadora > 0) and (ATabela = 'public.usuarios') then
    begin
      SQL.Add('AND id_transportadora = :id_transportadora');
    end;

    if (AColunaFiltroAdicional <> '') and (AValorFiltroAdicional <> '') then
    begin
      SQL.Add(Format('AND %s = :filtro_adicional', [AColunaFiltroAdicional]));
    end;

    FDQuery.SQL.Text := SQL.Text;


    if (AIdTransportadora > 0) and (ATabela = 'public.usuarios') then
    begin
      FDQuery.ParamByName('id_transportadora').AsInteger := AIdTransportadora;
    end;

    if (AColunaFiltroAdicional <> '') and (AValorFiltroAdicional <> '') then
    begin
      FDQuery.ParamByName('filtro_adicional').AsString := AValorFiltroAdicional;
    end;

    FDQuery.Open;

    if not FDQuery.IsEmpty then
    begin
      Result := FDQuery.Fields[0].AsInteger;
    end;
  finally
    FDQuery.Free;
    SQL.Free;
  end;
end;

end.
