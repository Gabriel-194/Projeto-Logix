unit viagemDto;

interface
type
  TViagemDto = record
    idViagem: Integer;
    idCarregamento: Integer;
    idMotorista: Integer;
    motorista:String;
    idVeiculo: Integer;
    modelo:String;
    dataSaida: TDateTime;
    dataChegada: TDateTime;
    status: String;
    dataCadastro: TDateTime;
    veiculo:string;
    distancia_km:double;
  end;

implementation

end.
