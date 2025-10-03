unit veiculoRepository;

interface
uses
System.SysUtils, FireDAC.Comp.Client,uVeiculo ,unit2,System.Generics.Collections;

type TveiculoRepository = class
  procedure CadastrarVeiculo(veiculo:Tveiculo);
end;

implementation

{ ThomeRepository }

procedure TveiculoRepository.CadastrarVeiculo(veiculo:Tveiculo);
var
FDQuery : TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
     FDQuery.Connection := DataModule2.FDConnection1;

     FDQuery.SQL.Text :=
      'INSERT INTO public.veiculo ' +
      '(placa, modelo, ano, tipo_carga, capacidade, unidade_medida, id_motorista, id_transportadora, ativo, data_cadastro, data_atualizacao) ' +
      'VALUES ' +
      '(:placa, :modelo, :ano, :tipo_carga, :capacidade, :unidade_medida, :id_motorista, :id_transportadora, TRUE, NOW(), NOW())';

    FDQuery.ParamByName('placa').AsString := Veiculo.getPlaca;
    FDQuery.ParamByName('modelo').AsString := Veiculo.getModelo;
    FDQuery.ParamByName('ano').AsInteger := Veiculo.getAno;
    FDQuery.ParamByName('tipo_carga').AsString := Veiculo.getTipo_carga;
    FDQuery.ParamByName('capacidade').AsInteger := Trunc(Veiculo.getCapacidade); // Trunc para garantir que seja inteiro
    FDQuery.ParamByName('unidade_medida').AsString := Veiculo.getUnidade_medida;
    FDQuery.ParamByName('id_motorista').AsInteger := Veiculo.getId_motorista;
  finally

  end;

end;

end.
