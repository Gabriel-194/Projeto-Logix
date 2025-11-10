unit OrdemRepository;

interface
uses
  carregamentoDto,System.SysUtils, FireDAC.Comp.Client,unit2,System.Generics.Collections,viagemDto;
type TordemRepository = class
  procedure criarOrdemCarregamento(aCarregamento:TcarregamentoDto; aIdTransportadora:integer);
  function buscarOrdensCarregPorTransp(aIdTransportadora: Integer): Tlist<TcarregamentoDto>;
  procedure criarOrdemViagem(aviagem:TviagemDto; aIdTransportadora:Integer);
  function mostrarOrdensCarregParaCarreg(aIdTransportadora: Integer;aIdCarregador:Integer): Tlist<TcarregamentoDto>;
  procedure iniciarCarregamento(aIdTransportadora, aIdCarregamento, aidPedido:Integer);
  function buscarOrdensPorStatus(aIdTransportadora,aIdUsuario:Integer;aStatus,aTabela:string):Integer;
  procedure finalizarCarregamento(aIdTransportadora, aIdCarregamento, aidPedido:Integer);
  function buscarMinhasOrdensViagens(aIdTransportadora: Integer;aIdmotorista:Integer): Tlist<TviagemDto>;
  procedure iniciarViagem(aIdTransportadora, aIdCarregamento, aIdViagem:Integer);
  procedure FinalizarViagem(aIdTransportadora,aIdViagem,aIdCarregamento: Integer);
  function buscarOrdensViagensPorTransp(aIdTransportadora: Integer): Tlist<TviagemDto>;
end;

implementation

{ TordemRepository }



{ TordemRepository }

function TordemRepository.buscarMinhasOrdensViagens(aIdTransportadora,
  aIdmotorista: Integer): Tlist<TviagemDto>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  lista:Tlist<TviagemDto>;
  viagem:TviagemDto;
begin
  lista:=Tlist<TviagemDto>.create;
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
    'SELECT viagem.id_viagem,carregamento.id_carregamento,veiculo.id_veiculo,veiculo.modelo,viagem.id_motorista,usuarios.nome, ' +
    'viagem.status, viagem.data_cadastro,viagem.data_saida_cd, viagem.data_chegada, viagem.distancia_km ' +
    'FROM viagem ' +
    'INNER JOIN public.usuarios ON usuarios.id_usuario = viagem.id_motorista ' +
    'INNER JOIN veiculo ON veiculo.id_veiculo = viagem.id_veiculo ' +
    'INNER JOIN carregamento ON carregamento.id_carregamento = viagem.id_carregamento ' +
    'INNER JOIN pedido ON carregamento.id_pedido = pedido.id_pedido ' +
    'WHERE public.usuarios.id_usuario = :id_motorista ' +
    'ORDER BY viagem.id_viagem DESC';

    FDQuery.ParamByName('id_motorista').AsInteger := aIdMotorista;

    FDQuery.Open;
    while not FDQuery.Eof do
    begin
      FillChar(viagem, SizeOf(viagem), 0);
      viagem.idviagem       := FDQuery.FieldByName('id_viagem').AsInteger;
      viagem.idCarregamento := FDQuery.FieldByName('id_carregamento').AsInteger;
      viagem.idVeiculo      := FDQuery.FieldByName('id_veiculo').AsInteger;
      viagem.Veiculo       := FDQuery.FieldByName('modelo').AsString;
      viagem.idmotorista   := FDQuery.FieldByName('id_motorista').AsInteger;
      viagem.motorista := FDQuery.FieldByName('nome').AsString;
      viagem.status         := FDQuery.FieldByName('status').AsString;
      viagem.dataCadastro   := FDQuery.FieldByName('data_cadastro').AsDateTime;
      viagem.distancia_Km    := FDQuery.FieldByName('distancia_km').AsFloat;
      viagem. dataSaida:= FDQuery.FieldByName('data_saida_cd').AsDateTime;
      viagem.dataChegada:= FDQuery.FieldByName('data_chegada').AsDateTime;
      lista.Add(viagem);
      FDQuery.Next;
    end;
    FDQuery.Close;
    Result := lista;
  finally
    FDQuery.Free;
  end;
end;

function TordemRepository.buscarOrdensCarregPorTransp(
aIdTransportadora: Integer): Tlist<TcarregamentoDto>;
var
FDQuery: TFDQuery;
SchemaName: string;
lista:Tlist<TcarregamentoDto>;
carregamento:TcarregamentoDto;
begin
  lista:=Tlist<TcarregamentoDto>.create;
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
    'SELECT carregamento.id_carregamento, carregamento.id_pedido, veiculo.id_veiculo, veiculo.modelo, carregamento.id_carregador, usuarios.nome, ' +
    'carregamento.status, carregamento.data_cadastro, pedido.distancia_km ' +
    'FROM carregamento ' +
    'INNER JOIN public.usuarios ON usuarios.id_usuario = carregamento.id_carregador ' +
    'INNER JOIN veiculo ON veiculo.id_veiculo = carregamento.id_veiculo ' +
    'INNER JOIN pedido ON pedido.id_pedido = carregamento.id_pedido ' +
    'ORDER BY carregamento.id_carregamento DESC';
    FDQuery.Open;
    while not FDQuery.Eof do
    begin
      FillChar(carregamento, SizeOf(carregamento), 0);
      carregamento.idCarregamento := FDQuery.FieldByName('id_carregamento').AsInteger;
      carregamento.idPedido := FDQuery.FieldByName('id_pedido').AsInteger;
      carregamento.idVeiculo := FDQuery.FieldByName('id_veiculo').AsInteger;
      carregamento.sVeiculo := FDQuery.FieldByName('modelo').AsString;
      carregamento.idCarregador := FDQuery.FieldByName('id_carregador').AsInteger;
      carregamento.sCarregador := FDQuery.FieldByName('nome').AsString;
      carregamento.status := FDQuery.FieldByName('status').AsString;
      carregamento.dataCadastro := FDQuery.FieldByName('data_cadastro').AsDateTime;
      carregamento.distanciaKm := FDQuery.FieldByName('distancia_km').AsFloat;
      lista.Add(carregamento);
      FDQuery.Next;
    end;
    FDQuery.Close;
    Result := lista;
  finally
  FDQuery.Free;
  end;
end;

function TordemRepository.buscarOrdensPorStatus(
  aIdTransportadora, aIdUsuario: Integer;
  aStatus, aTabela: string
): Integer;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  Total: Integer;
  id:String;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;


    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id_transportadora';
    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.Open;
    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;


    FDQuery.SQL.Text := 'SET search_path TO ' + SchemaName + ', public';
    FDQuery.ExecSQL;

    if aTabela = 'carregamento' then begin
      id := 'id_carregador';
    end else if aTabela = 'viagem' then begin
      id := 'id_motorista';
    end;

    FDQuery.SQL.Text := 'SELECT COUNT(*) AS qtd FROM '+ aTabela + ' WHERE '+ id +' = :id_usuario AND status = :status';

    FDQuery.ParamByName('id_usuario').AsInteger := aIdusuario;
    FDQuery.ParamByName('status').AsString := aStatus;
    FDQuery.Open;

    Total := FDQuery.FieldByName('qtd').AsInteger;
    Result := Total;
  finally
    FDQuery.Free;
  end;
end;

function TOrdemRepository.buscarOrdensViagensPorTransp(
  aIdTransportadora: Integer): TList<TViagemDto>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  lista: TList<TViagemDto>;
  viagem: TViagemDto;
begin
  lista := TList<TViagemDto>.Create;
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
      'SELECT v.id_viagem, v.id_carregamento, v.id_veiculo, v.id_motorista, ' +
      'm.nome AS motorista, v.status, ' +
      'v.data_cadastro, v.distancia_km, ve.modelo ' +
      'FROM viagem v ' +
      'INNER JOIN veiculo ve ON ve.id_veiculo = v.id_veiculo ' +
      'INNER JOIN public.usuarios m ON m.id_usuario = v.id_motorista ' +
      'ORDER BY v.id_viagem DESC';
    FDQuery.Open;
    while not FDQuery.Eof do
    begin
      viagem.idViagem        := FDQuery.FieldByName('id_viagem').AsInteger;
      viagem.idCarregamento  := FDQuery.FieldByName('id_carregamento').AsInteger;
      viagem.idVeiculo       := FDQuery.FieldByName('id_veiculo').AsInteger;
      viagem.idMotorista     := FDQuery.FieldByName('id_motorista').AsInteger;
      viagem.motorista       := FDQuery.FieldByName('motorista').AsString;
      viagem.modelo          := FDQuery.FieldByName('modelo').AsString;
      viagem.status          := FDQuery.FieldByName('status').AsString;
      viagem.dataCadastro    := FDQuery.FieldByName('data_cadastro').AsDateTime;
      viagem.distancia_km    := FDQuery.FieldByName('distancia_km').AsFloat;
      lista.Add(viagem);
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


procedure TordemRepository.criarOrdemViagem(aViagem: TViagemDto; aIdTransportadora: Integer);
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
      'INSERT INTO viagem ' +
      ' (id_motorista, id_carregamento, id_veiculo, status, data_cadastro, distancia_km) ' +
      'VALUES (:id_motorista, :id_carregamento, :id_veiculo, :status, :data_cadastro, :distancia_km)';

    FDQuery.ParamByName('id_motorista').AsInteger    := aViagem.idMotorista;
    FDQuery.ParamByName('id_carregamento').AsInteger := aViagem.idCarregamento;
    FDQuery.ParamByName('id_veiculo').AsInteger      := aViagem.idVeiculo;
    FDQuery.ParamByName('status').AsString           := 'Aguardando';
    FDQuery.ParamByName('data_cadastro').AsDateTime  := Now;
    FDQuery.ParamByName('distancia_km').AsFloat      := aViagem.distancia_km;

    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;


procedure TordemRepository.finalizarCarregamento(aIdTransportadora,
  aIdCarregamento, aidPedido: Integer);
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

    FDQuery.SQL.Text := 'UPDATE carregamento SET status = ''Pronto'', data_hora_fim = Now() WHERE id_carregamento = :id_carregamento';
    FDQuery.ParamByName('id_carregamento').AsInteger := aIdCarregamento;
    FDQuery.ExecSQL;

    FDQuery.SQL.Text :='UPDATE pedido SET status = ''Em preparo'', data_atualizacao = Now() WHERE id_pedido = :id_pedido';
    FDQuery.ParamByName('id_pedido').AsInteger := aIdpedido;
    FDQuery.ExecSQL;

    FDQuery.SQL.Text :=
      'INSERT INTO mensagemCliente (id_pedido, id_transportadora, id_cliente, data_mensagem, texto) ' +
      'SELECT :id_pedido, :id_transportadora, id_cliente, NOW(), :texto ' +
      'FROM ' + SchemaName + '.pedido WHERE id_pedido = :id_pedido';

    FDQuery.ParamByName('id_pedido').AsInteger := aIdPedido;
    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.ParamByName('texto').AsString := 'O carregamento foi finalizado para o pedido #' + IntToStr(aIdPedido);
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

procedure TordemRepository.FinalizarViagem(aIdTransportadora, aIdViagem,
  aIdCarregamento: Integer);
var
  FDQuery: TFDQuery;
  SchemaName: string;
  idPedido:integer;
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

    FDQuery.SQL.Text := 'UPDATE viagem SET status = ''Finalizada'', data_chegada = Now() WHERE id_viagem = :id_viagem';
    FDQuery.ParamByName('id_viagem').AsInteger := aIdviagem;
    FDQuery.ExecSQL;

     FDQuery.SQL.Text := 'SELECT id_pedido FROM carregamento WHERE id_carregamento = :id_carregamento';
    FDQuery.ParamByName('id_carregamento').AsInteger := aIdCarregamento;
    FDQuery.Open;
    IdPedido := FDQuery.FieldByName('id_pedido').AsInteger;
    FDQuery.Close;

    FDQuery.SQL.Text :='UPDATE pedido SET status = ''Finalizado'', data_atualizacao = Now() WHERE id_pedido = :id_pedido';
    FDQuery.ParamByName('id_pedido').AsInteger := idPedido;
    FDQuery.ExecSQL;

     FDQuery.SQL.Text :=
      'INSERT INTO mensagemCliente (id_pedido, id_transportadora, id_cliente, data_mensagem, texto) ' +
      'SELECT :id_pedido, :id_transportadora, id_cliente, NOW(), :texto ' +
      'FROM pedido WHERE id_pedido = :id_pedido';

    FDQuery.ParamByName('id_pedido').AsInteger := idPedido;
    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.ParamByName('texto').AsString := 'A viagem foi finalizada para o pedido #' + IntToStr(idPedido);
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

procedure TordemRepository.iniciarCarregamento(aIdTransportadora, aIdCarregamento, aidPedido:Integer);
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

    FDQuery.SQL.Text := 'UPDATE carregamento SET status = ''Em preparo'', data_hora_inicio = Now() WHERE id_carregamento = :id_carregamento';
    FDQuery.ParamByName('id_carregamento').AsInteger := aIdCarregamento;
    FDQuery.ExecSQL;

    FDQuery.SQL.Text :='UPDATE pedido SET status = ''Em preparo'', data_atualizacao = Now() WHERE id_pedido = :id_pedido';
    FDQuery.ParamByName('id_pedido').AsInteger := aIdpedido;
    FDQuery.ExecSQL;

    FDQuery.SQL.Text :=
      'INSERT INTO mensagemCliente (id_pedido, id_transportadora, id_cliente, data_mensagem, texto) ' +
      'SELECT :id_pedido, :id_transportadora, id_cliente, NOW(), :texto ' +
      'FROM pedido WHERE id_pedido = :id_pedido';

    FDQuery.ParamByName('id_pedido').AsInteger := aIdPedido;
    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.ParamByName('texto').AsString := 'O carregamento foi iniciado para o pedido #' + IntToStr(aIdPedido);
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

procedure TordemRepository.iniciarViagem(aIdTransportadora, aIdCarregamento,
  aIdViagem: Integer);
var
  FDQuery: TFDQuery;
  SchemaName: string;
  IdPedido:Integer;
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

    FDQuery.SQL.Text := 'UPDATE viagem SET status = ''Em rota'', data_saida_cd = Now() WHERE id_viagem = :id_viagem';
    FDQuery.ParamByName('id_viagem').AsInteger := aIdviagem;
    FDQuery.ExecSQL;

    FDQuery.SQL.Text := 'SELECT id_pedido FROM carregamento WHERE id_carregamento = :id_carregamento';
    FDQuery.ParamByName('id_carregamento').AsInteger := aIdCarregamento;
    FDQuery.Open;
    IdPedido := FDQuery.FieldByName('id_pedido').AsInteger;
    FDQuery.Close;

    FDQuery.SQL.Text :='UPDATE pedido SET status = ''Em rota'', data_atualizacao = Now() WHERE id_pedido = :id_pedido';
    FDQuery.ParamByName('id_pedido').AsInteger := idPedido;
    FDQuery.ExecSQL;

     FDQuery.SQL.Text :=
      'INSERT INTO mensagemCliente (id_pedido, id_transportadora, id_cliente, data_mensagem, texto) ' +
      'SELECT :id_pedido, :id_transportadora, id_cliente, NOW(), :texto ' +
      'FROM pedido WHERE id_pedido = :id_pedido';

    FDQuery.ParamByName('id_pedido').AsInteger := idPedido;
    FDQuery.ParamByName('id_transportadora').AsInteger := aIdTransportadora;
    FDQuery.ParamByName('texto').AsString := 'A viagem foi iniciado para o pedido #' + IntToStr(idPedido);
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;

function TordemRepository.mostrarOrdensCarregParaCarreg(aIdTransportadora,
  aIdCarregador: Integer): Tlist<TcarregamentoDto>;
var
  FDQuery: TFDQuery;
  SchemaName: string;
  lista:Tlist<TcarregamentoDto>;
  carregamento:TcarregamentoDto;
begin
  lista:=Tlist<TcarregamentoDto>.create;
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
    'SELECT carregamento.id_carregamento, ' +
    'carregamento.id_pedido, ' +
    'veiculo.id_veiculo, ' +
    'veiculo.modelo, ' +
    'carregamento.id_carregador, ' +
    'usuarios.nome, ' +
    'carregamento.status, ' +
    'carregamento.data_cadastro, ' +
    'carregamento.data_hora_inicio, ' +
    'carregamento.data_hora_fim, ' +
    'pedido.distancia_km, ' +
    'pedido.tipo_carga ' +
    'FROM carregamento ' +
    'INNER JOIN public.usuarios ON usuarios.id_usuario = carregamento.id_carregador ' +
    'INNER JOIN veiculo ON veiculo.id_veiculo = carregamento.id_veiculo ' +
    'INNER JOIN pedido ON pedido.id_pedido = carregamento.id_pedido ' +
    'WHERE public.usuarios.id_usuario = :id_carregador ' +
    'ORDER BY carregamento.id_carregamento DESC';

    FDQuery.ParamByName('id_carregador').AsInteger := aIdCarregador;

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
      carregamento.distanciaKm    := FDQuery.FieldByName('distancia_km').AsFloat;
      carregamento.carga          := FDQuery.FieldByName('tipo_carga').AsString;
      carregamento.data_hora_inicio:= FDQuery.FieldByName('data_hora_inicio').AsDateTime;
      carregamento.data_hora_fim:= FDQuery.FieldByName('data_hora_fim').AsDateTime;
      lista.Add(carregamento);
      FDQuery.Next;
    end;
    FDQuery.Close;
    Result := lista;
  finally
    FDQuery.Free;
  end;
end;

end.
