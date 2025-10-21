unit OrdemRepository;

interface
uses
  carregamentoDto,System.SysUtils, FireDAC.Comp.Client,unit2,System.Generics.Collections;
type TordemRepository = class
  procedure criarOrdemCarregamento(aCarregamento:TcarregamentoDto; aIdTransportadora:integer);
  function buscarOrdensCarregPorTransp(aIdTransportadora: Integer): Tlist<TcarregamentoDto>;
end;

implementation

{ TordemRepository }



{ TordemRepository }

function TordemRepository.buscarOrdensCarregPorTransp(
  aIdTransportadora: Integer): Tlist<TcarregamentoDto>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  lista:Tlist<TcarregamentoDto>;
  carregamento:TcarregamentoDto;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.Open;
    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.ExecSQL('SET search_path TO ' + SchemaName + ', public');
    FDQuery.SQL.Text := 'SELECT carregamento.id_carregamento,carregamento.id_pedido, veiculo.id_veiculo, veiculo.modelo, carregamento.id_carregador, ' +
    'usuarios.nome, carregamento.status, carregamento.data_cadastro ' +
    'FROM carregamento ' +
    'INNER JOIN public.usuarios ON usuarios.id_usuario = carregamento.id_carregador ' +
    'INNER JOIN veiculo ON veiculo.id_veiculo = carregamento.id_veiculo ' +
    'ORDER BY carregamento.id_carregamento DESC';

    FDQuery.Open;
    while not FDQuery.Eof do
    begin
      FillChar(carregamento, SizeOf(carregamento), 0);
      carregamento.idCarregamento := FDQuery.FieldByName('id_carregamento').AsInteger;
      carregamento.idPedido       := FDQuery.FieldByName('id_pedido').AsInteger;
      carregamento.idVeiculo      := FDQuery.FieldByName('id_veiculo').AsInteger;
      carregamento.sVeiculo       := FDQuery.FieldByName('modelo').AsString;
      carregamento.idCarregador   := FDQuery.FieldByName('id_carregador').AsInteger;
      carregamento.sCarregador    := FDQuery.FieldByName('nome').AsString;
      carregamento.status         := FDQuery.FieldByName('status').AsString;
      carregamento.dataCadastro   := FDQuery.FieldByName('data_cadastro').AsDateTime;
      lista.Add(carregamento);
      FDQuery.Next;
    end;
    FDQuery.Close;
    Result := lista;
  finally
    FDQuery.Free;
  end;
end;

procedure TordemRepository.criarOrdemCarregamento(
  aCarregamento: TcarregamentoDto; aIdTransportadora: integer);
var
  FDQuery: TFDQuery;
  SchemaName: string;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.Open;
    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.ExecSQL('SET search_path TO ' + SchemaName + ', public');

    FDQuery.SQL.Text :=
      'INSERT INTO carregamento ' +
      ' (id_carregador, id_pedido, id_veiculo, status, data_cadastro) ' +
      'VALUES (:id_carregador, :id_pedido, :id_veiculo, :status, :data_cadastro)';

    FDQuery.ParamByName('id_carregador').AsInteger  := aCarregamento.idCarregador;
    FDQuery.ParamByName('id_pedido').AsInteger      := aCarregamento.idPedido;
    FDQuery.ParamByName('id_veiculo').AsInteger     := aCarregamento.idVeiculo;
    FDQuery.ParamByName('status').AsString          := 'Aguardando';
    FDQuery.ParamByName('data_cadastro').AsDateTime := Now;

    FDQuery.ExecSQL;

  finally
    FDQuery.Free;
  end;
end;


end.
