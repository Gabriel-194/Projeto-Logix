unit veiculoRepository;

interface
uses
System.SysUtils, FireDAC.Comp.Client,uVeiculo ,unit2,System.Generics.Collections,usuarioLogado;

type TveiculoRepository = class
  procedure CadastrarVeiculo(veiculo:Tveiculo);
  function mostrarVeiuclo:TobjectList<Tveiculo>;
  function mostrarVeiculoInativo:TobjectList<Tveiculo>;
  procedure excluirVeiculo(veiculo:Tveiculo);
  procedure RecuperarVeiculo(veiculo:Tveiculo);
  procedure editarVeiculo(veiculo:Tveiculo);
end;

implementation

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
        '(placa, modelo, ano, tipo_carga, capacidade, unidade_medida, id_motorista, ativo, data_cadastro, data_atualizacao) ' +
        'VALUES ' +
        '(:placa, :modelo, :ano, :tipo_carga, :capacidade, :unidade_medida, :id_motorista, TRUE, NOW(), NOW())';

      FDQuery.ParamByName('placa').AsString := veiculo.getPlaca;
      FDQuery.ParamByName('modelo').AsString := veiculo.getModelo;
      FDQuery.ParamByName('ano').AsInteger := veiculo.getAno;
      FDQuery.ParamByName('tipo_carga').AsString := veiculo.getTipo_carga;
      FDQuery.ParamByName('capacidade').AsInteger := Trunc(veiculo.getCapacidade);
      FDQuery.ParamByName('unidade_medida').AsString := veiculo.getUnidade_medida;
      FDQuery.ParamByName('id_motorista').AsInteger := veiculo.getId_motorista;

      FDQuery.ExecSQL;

  finally
    FDQuery.Free;
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
      'id_motorista = :id_motorista,data_atualizacao = NOW() WHERE id_veiculo = :id_veiculo';

      FDQuery.ParamByName('id_veiculo').AsInteger := veiculo.getId_veiculo;
      FDQuery.ParamByName('placa').AsString := veiculo.getPlaca;
      FDQuery.ParamByName('modelo').AsString := veiculo.getModelo;
      FDQuery.ParamByName('ano').AsInteger := veiculo.getAno;
      FDQuery.ParamByName('tipo_carga').AsString := veiculo.getTipo_carga;
      FDQuery.ParamByName('capacidade').AsInteger := Trunc(veiculo.getCapacidade);
      FDQuery.ParamByName('unidade_medida').AsString := veiculo.getUnidade_medida;
      FDQuery.ParamByName('id_motorista').AsInteger := veiculo.getId_motorista;

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

function TveiculoRepository.mostrarVeiuclo: TobjectList<Tveiculo>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  veiculo: Tveiculo;
  IdTransportadoraLogada: Integer;
begin
  IdTransportadoraLogada := UsuarioLogado.UserLogado.getIdTransportadora;
//jeito para teste
// IdTransportadoraLogada := 1;
  veiculo := Tveiculo.create;
  Result := TObjectList<Tveiculo>.Create(True);
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
     FDQuery.ParamByName('id_transportadora').AsInteger := IdTransportadoraLogada;
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
      veiculo.setId_motorista(FDQuery.FieldByName('id_motorista').AsInteger);

      Result.Add(veiculo);

      FDQuery.Next;
    end;

  finally
    FDQuery.Free;
  end;
end;

function TveiculoRepository.mostrarveiculoInativo: TobjectList<Tveiculo>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  veiculo: Tveiculo;
  IdTransportadoraLogada: Integer;
begin
 IdTransportadoraLogada := UsuarioLogado.UserLogado.getIdTransportadora;
//jeito para teste
//  IdTransportadoraLogada := 1;
  veiculo := Tveiculo.create;
  Result := TObjectList<Tveiculo>.Create(True);
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
     FDQuery.ParamByName('id_transportadora').AsInteger := IdTransportadoraLogada;
    FDQuery.Open;


    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.ExecSQL('SET search_path TO ' + (SchemaName) + ', public');

    FDQuery.SQL.Text := 'SELECT * FROM '+(SchemaName) +'.veiculo WHERE ativo = false ORDER BY id_veiculo';
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
      veiculo.setId_motorista(FDQuery.FieldByName('id_motorista').AsInteger);

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
