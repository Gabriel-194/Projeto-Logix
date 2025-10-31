unit pedidoDto;

interface
type TpedidoDto = record
   IdPedido: Integer;
    IdCliente: Integer;

    CepOrigem: string;
    EstadoOrigem: string;
    MunicipioOrigem: string;
    EnderecoOrigem: string;
    NumeroOrigem: string;

    CepDestino: string;
    EstadoDestino: string;
    MunicipioDestino: string;
    EnderecoDestino: string;
    NumeroDestino: string;

    DataPedido: TDateTime;
    Peso: Double;
    DistanciaKm: Double;
    IdCarga: Integer;
    TipoCarga: string;
    IdTransportadora: Integer;
    NomeTransportadora: string;
    Preco: Double;
    Status: string;

    motiv_cancelamento:String;
    data_atualizacao:TdateTime;
  end;


implementation

end.
