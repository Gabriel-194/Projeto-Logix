unit homeRepository;

interface
uses
data.DB,System.SysUtils, FireDAC.Comp.Client, unit2,System.Generics.Collections,System.Classes;
type ThomeRepository = class
  function mostrarPermissoes : TDataSet;
  function ContarUsuariosPorCargo(const aCargo: string): Integer;
  function ContarRegistrosAtivos(  const ATabela: string;AIdTransportadora: Integer = 0;const AColunaFiltroAdicional: string = '';const AValorFiltroAdicional: string = ''
):Integer;
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
