unit OrdemRepository;

interface
uses
  carregamentoDto,System.SysUtils, FireDAC.Comp.Client,unit2,System.Generics.Collections;
type TordemRepository = class
  procedure criarOrdemCarregamento(aCarregamento:TcarregamentoDto; aIdTransportadora:integer);
end;

implementation

{ TordemRepository }



{ TordemRepository }

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
