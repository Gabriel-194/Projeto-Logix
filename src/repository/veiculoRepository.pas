unit veiculoRepository;

interface
uses
System.SysUtils, FireDAC.Comp.Client,uVeiculo ,unit2,System.Generics.Collections,usuarioLogado,tipoCargaDto;

type TveiculoRepository = class
  procedure CadastrarVeiculo(veiculo:Tveiculo);
  function mostrarVeiuclo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
  function mostrarVeiculoInativo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
  procedure excluirVeiculo(veiculo:Tveiculo);
  procedure RecuperarVeiculo(veiculo:Tveiculo);
  procedure editarVeiculo(veiculo:Tveiculo);
  function cargasDisponiveis(aIdTransportadora:Integer):Tlist<TtipocargaDto>;
  function buscarVeiculosDisponiveis(aIdTransportadora:integer; apeso:double;atipoCarga:string):TobjectList<Tveiculo>;
end;

implementation

function TveiculoRepository.buscarVeiculosDisponiveis(
  aIdTransportadora: integer; apeso: double;
  atipoCarga: string): TobjectList<Tveiculo>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  veiculo: TVeiculo;
  lista: TObjectList<TVeiculo>;
begin
  lista:=TObjectList<TVeiculo>.create;
  FDQuery := TFDQuery.Create(nil);
 try
    FDQuery.Connection := DataModule2.FDConnection1;

      FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
      FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
      FDQuery.Open;

      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.ExecSQL('SET search_path TO ' + (SchemaName) + ', public');


    FDQuery.SQL.Text := 'SELECT id_veiculo, modelo ' +'FROM veiculo WHERE ativo = TRUE ' +
      '  AND capacidade >= :capacidade ' +
      '  AND tipo_carga = :tipo_carga ' +
      '  AND status = ''disponivel'' ' +
      'ORDER BY id_veiculo';

    FDQuery.ParamByName('capacidade').AsFloat := aPeso;
    FDQuery.ParamByName('tipo_carga').AsString := aTipoCarga;
    FDQuery.Open;

    while not FDQuery.Eof do
    begin
      veiculo := TVeiculo.Create;
      veiculo.setId_veiculo(FDQuery.FieldByName('id_veiculo').AsInteger);
      veiculo.setModelo(FDQuery.FieldByName('modelo').AsString);
      lista.Add(veiculo);
      FDQuery.Next;
    end;

    Result := lista;
  finally
    FDQuery.Free;
  end;
end;

{ ThomeRepository }

procedure TveiculoRepository.CadastrarVeiculo(veiculo: Tveiculo);
var
  FDQuery: TFDQuery;
  SchemaName: string;
begin
  FDQuery := TFDQuery.Create(nil);
 try
    FDQuery.Connection := DataModule2.FDConnection1;

      FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
      FDQuery.ParamByName('id_transportadora').AsInteger := veiculo.getIdTransportadora;
      FDQuery.Open;

      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.ExecSQL('SET search_path TO ' + (SchemaName) + ', public');

      FDQuery.SQL.Text :=
        'INSERT INTO veiculo ' +
        '(placa, modelo, ano, tipo_carga, capacidade, unidade_medida, ativo, data_cadastro, data_atualizacao,status) ' +
        'VALUES ' +
        '(:placa, :modelo, :ano, :tipo_carga, :capacidade, :unidade_medida, TRUE, NOW(), NOW(), ''disponivel'')';

      FDQuery.ParamByName('placa').AsString := veiculo.getPlaca;
      FDQuery.ParamByName('modelo').AsString := veiculo.getModelo;
      FDQuery.ParamByName('ano').AsInteger := veiculo.getAno;
      FDQuery.ParamByName('tipo_carga').AsString := veiculo.getTipo_carga;
      FDQuery.ParamByName('capacidade').AsInteger := Trunc(veiculo.getCapacidade);
      FDQuery.ParamByName('unidade_medida').AsString := veiculo.getUnidade_medida;

      FDQuery.ExecSQL;

  finally
    FDQuery.Free;
  end;
end;

function TveiculoRepository.cargasDisponiveis(
  aIdTransportadora: Integer): Tlist<TtipocargaDto>;
var
  carga: TtipoCargaDto;
  FDQuery : TFDQuery;
  Lista: TList<TtipoCargaDto>;
  SchemaName: string;
begin
  FDQuery := TFDQuery.Create(nil);
  Lista := TList<TtipoCargaDto>.Create;
 try
    FDQuery.Connection := DataModule2.FDConnection1;

      FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
      FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
      FDQuery.Open;

      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.ExecSQL('SET search_path TO ' + (SchemaName) + ', public');

    FDQuery.SQL.Text :=
    'SELECT tipo FROM tipo_carga where id_transportadora = :id_transportadora ORDER BY id_carga';

    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;

    FDQuery.Open;

    carga := Default(TtipoCargaDto);

    while not FDQuery.Eof do
    begin
      carga.TipoCarga := FDQuery.FieldByName('tipo').AsString;

      lista.Add(carga);
      FDQuery.Next;
    end;
    Result := Lista;
  finally
    FDQuery.free;
  end;
end;

procedure TveiculoRepository.editarVeiculo(veiculo: Tveiculo);
var
  FDQuery: TFDQuery;
  SchemaName: string;
begin
  FDQuery := TFDQuery.Create(nil);
 try
    FDQuery.Connection := DataModule2.FDConnection1;

      FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
      FDQuery.ParamByName('id_transportadora').AsInteger := veiculo.getIdTransportadora;
      FDQuery.Open;

      SchemaName := FDQuery.FieldByName('schema_name').AsString;
      FDQuery.Close;

      FDQuery.ExecSQL('SET search_path TO ' + (SchemaName) + ', public');

      FDQuery.SQL.Text :='UPDATE veiculo SET placa = :placa, modelo = :modelo,ano = :ano, tipo_carga = :tipo_carga,capacidade = :capacidade, unidade_medida = :unidade_medida, ' +
      'data_atualizacao = NOW() WHERE id_veiculo = :id_veiculo';

      FDQuery.ParamByName('id_veiculo').AsInteger := veiculo.getId_veiculo;
      FDQuery.ParamByName('placa').AsString := veiculo.getPlaca;
      FDQuery.ParamByName('modelo').AsString := veiculo.getModelo;
      FDQuery.ParamByName('ano').AsInteger := veiculo.getAno;
      FDQuery.ParamByName('tipo_carga').AsString := veiculo.getTipo_carga;
      FDQuery.ParamByName('capacidade').AsInteger := Trunc(veiculo.getCapacidade);
      FDQuery.ParamByName('unidade_medida').AsString := veiculo.getUnidade_medida;
      FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

procedure TveiculoRepository.excluirVeiculo(veiculo:Tveiculo);
var
  SchemaName: string;
  FDQuery: TFDQuery;
begin

  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    FDQuery.ParamByName('id_transportadora').AsInteger := veiculo.getIdTransportadora;
    FDQuery.Open;

    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.SQL.Text := 'SET search_path TO ' + SchemaName + ', public';

     FDQuery.SQL.Text := 'UPDATE veiculo SET ativo = FALSE ,data_atualizacao = NOW() WHERE id_veiculo = :id_veiculo';
     FDQuery.ParamByName('id_veiculo').AsInteger := veiculo.getId_veiculo;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;

function TveiculoRepository.mostrarVeiuclo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  veiculo: Tveiculo;
begin
  veiculo := Tveiculo.create;
  Result := TObjectList<Tveiculo>.Create(True);
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
     FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.Open;


    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.ExecSQL('SET search_path TO ' + (SchemaName) + ', public');

    FDQuery.SQL.Text := 'SELECT * FROM '+(SchemaName) +'.veiculo WHERE ativo = TRUE ORDER BY id_veiculo';
    FDQuery.Open;

    FDQuery.First;
    while not FDQuery.Eof do
    begin
      veiculo := Tveiculo.Create; // Cria um novo objeto para cada linha
      veiculo.setId_veiculo(FDQuery.FieldByName('id_veiculo').AsInteger);
      veiculo.setPlaca(FDQuery.FieldByName('placa').AsString);
      veiculo.setModelo(FDQuery.FieldByName('modelo').AsString);
      veiculo.setAno(FDQuery.FieldByName('ano').AsInteger);
      veiculo.setTipo_carga(FDQuery.FieldByName('tipo_carga').AsString);
      veiculo.setCapacidade(FDQuery.FieldByName('capacidade').AsInteger);
      veiculo.setUnidade_medida(FDQuery.FieldByName('unidade_medida').AsString);

      Result.Add(veiculo);

      FDQuery.Next;
    end;

  finally
    FDQuery.Free;
  end;
end;

function TveiculoRepository.mostrarveiculoInativo(aIdTransportadora:Integer):TobjectList<Tveiculo>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  veiculo: Tveiculo;
  IdTransportadoraLogada: Integer;
begin
  veiculo := Tveiculo.create;
  Result := TObjectList<Tveiculo>.Create(True);
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
     FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.Open;


    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.ExecSQL('SET search_path TO ' + (SchemaName) + ', public');

    FDQuery.SQL.Text := 'SELECT * FROM veiculo WHERE ativo = false ORDER BY id_veiculo';
    FDQuery.Open;

    FDQuery.First;
    while not FDQuery.Eof do
    begin
      veiculo := Tveiculo.Create;
      veiculo.setId_veiculo(FDQuery.FieldByName('id_veiculo').AsInteger);
      veiculo.setPlaca(FDQuery.FieldByName('placa').AsString);
      veiculo.setModelo(FDQuery.FieldByName('modelo').AsString);
      veiculo.setAno(FDQuery.FieldByName('ano').AsInteger);
      veiculo.setTipo_carga(FDQuery.FieldByName('tipo_carga').AsString);
      veiculo.setCapacidade(FDQuery.FieldByName('capacidade').AsInteger);
      veiculo.setUnidade_medida(FDQuery.FieldByName('unidade_medida').AsString);

      Result.Add(veiculo);

      FDQuery.Next;
    end;

  finally
    FDQuery.Free;
  end;
end;

procedure TveiculoRepository.RecuperarVeiculo(veiculo: Tveiculo);
var
  SchemaName: string;
  FDQuery: TFDQuery;
begin

  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    FDQuery.ParamByName('id_transportadora').AsInteger := veiculo.getIdTransportadora;
    FDQuery.Open;

    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.SQL.Text := 'SET search_path TO ' + SchemaName + ', public';

     FDQuery.SQL.Text := 'UPDATE veiculo SET ativo = true ,data_atualizacao = NOW() WHERE id_veiculo = :id_veiculo';
     FDQuery.ParamByName('id_veiculo').AsInteger := veiculo.getId_veiculo;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;

end.
