unit OrdensService;

interface
uses
  system.Generics.Collections,viagemDto, carregamentoDto,OrdemRepository,System.SysUtils,dateUtils,uLog,usuarioLogado;

type TordemService = class
  procedure criarOrdemCarregamento(aCarregamento:TcarregamentoDto;aIdTransportadora:Integer);
  function buscarOrdensCarregPorTransp(aIdTransportadora: Integer): Tlist<TcarregamentoDto>;
  procedure criarOrdemViagem(aviagem:TviagemDto; aIdTransportadora:Integer);
  function mostrarOrdensCarregParaCarreg(aIdTransportadora: Integer;aIdCarregador:Integer): Tlist<TcarregamentoDto>;
procedure iniciarCarregamento(aIdTransportadora,aIdCarregamento,aIdPedido: Integer; aStatus:String);
function buscarOrdensPorStatus(aIdTransportadora,aIdCarregador:Integer;aStatus,aTabela:string):Integer;
procedure finalizarCarregamento(aIdTransportadora,aIdCarregamento, aIdPedido: Integer; aStatus:String);
function buscarMinhasOrdensViagens(aIdTransportadora: Integer;aIdmotorista:Integer): Tlist<TviagemDto>;
procedure iniciarViagem(aIdTransportadora,aIdCarregamento,aIdviagem: Integer; aStatus:String);
procedure FinalizarViagem(aIdTransportadora,aIdViagem,aIdCarregamento: Integer; aStatus:String);
function buscarOrdensViagensPorTransp(aIdTransportadora: Integer): Tlist<TviagemDto>;

end;

implementation
var
systemLog:Tlogger;

{ TordemService }

function TordemService.buscarMinhasOrdensViagens(aIdTransportadora,
  aIdmotorista: Integer): Tlist<TviagemDto>;
var
  repos: TOrdemRepository;
  listaOrigem, listaDestino: TList<TviagemDto>;
  i: Integer;
  dto: TviagemDto;
begin
  repos := TOrdemRepository.Create;
  listaOrigem := nil;
  listaDestino := TList<TviagemDto>.Create;
  try
    listaOrigem := repos.buscarMinhasOrdensViagens(aIdTransportadora, aIdmotorista);
    for i := 0 to listaOrigem.Count - 1 do
    begin
      dto := listaOrigem[i];
      dto.Veiculo    := IntToStr(dto.idVeiculo)      + ' - ' + dto.veiculo;
      dto.motorista := IntToStr(dto.idMotorista)   + ' - ' + dto.motorista;

      listaDestino.Add(dto);
    end;
    Result := listaDestino;
    listaOrigem.Free;
  finally
    repos.Free;
  end;
end;

function TOrdemService.buscarOrdensCarregPorTransp(aIdTransportadora: Integer): TList<TCarregamentoDto>;
var
  repos: TOrdemRepository;
  listaOrigem, listaDestino: TList<TCarregamentoDto>;
  i: Integer;
  dto: TCarregamentoDto;
begin
  repos := TOrdemRepository.Create;
  listaOrigem := nil;
  listaDestino := TList<TCarregamentoDto>.Create;
  try
    listaOrigem := repos.buscarOrdensCarregPorTransp(aIdTransportadora);
    for i := 0 to listaOrigem.Count - 1 do
    begin
      dto := listaOrigem[i];
      dto.sVeiculo    := IntToStr(dto.idVeiculo)      + ' - ' + dto.sVeiculo;
      dto.sCarregador := IntToStr(dto.idCarregador)   + ' - ' + dto.sCarregador;
      listaDestino.Add(dto);
    end;
    Result := listaDestino;

    listaOrigem.Free;
  finally
    repos.Free;
  end;
end;

function TordemService.buscarOrdensPorStatus(aIdTransportadora,aIdCarregador:Integer;aStatus,aTabela:string):Integer;
var
repo:TordemRepository;
begin
  repo:= TordemRepository.create;
  try
    result:= repo.buscarOrdensPorStatus(aIdTransportadora,aIdCarregador,aStatus,aTabela);
  finally
    repo.free;
  end;
end;

function TOrdemService.buscarOrdensViagensPorTransp(
  aIdTransportadora: Integer): TList<TViagemDto>;
var
  repo: TOrdemRepository;
  listaOrigem, listaDestino: TList<TViagemDto>;
  i: Integer;
  dto: TViagemDto;
begin
  repo := TOrdemRepository.Create;
  listaOrigem := nil;
  listaDestino := TList<TViagemDto>.Create;
  try
    listaOrigem := repo.buscarOrdensViagensPorTransp(aIdTransportadora);
    for i := 0 to listaOrigem.Count - 1 do
    begin
      dto := listaOrigem[i];
      dto.veiculo := IntToStr(dto.idVeiculo) + ' - ' + dto.modelo;
      dto.motorista := IntToStr(dto.idMotorista) + ' - ' + dto.motorista;
      listaDestino.Add(dto);
    end;
    Result := listaDestino;
    listaOrigem.Free;
  finally
    repo.Free;
  end;
end;

procedure TordemService.criarOrdemCarregamento(aCarregamento: TcarregamentoDto; aIdTransportadora: Integer);
var
  repo: TOrdemRepository;
  idxSeparador: Integer;
begin
  repo := TOrdemRepository.Create;

  idxSeparador := Pos(' - ', aCarregamento.sCarregador);
  if idxSeparador > 0 then
    aCarregamento.idCarregador := StrToInt(Trim(Copy(aCarregamento.sCarregador, 1, idxSeparador - 1)))
  else
    aCarregamento.idCarregador := StrToInt(Trim(aCarregamento.sCarregador));

  idxSeparador := Pos(' - ', aCarregamento.sVeiculo);
  if idxSeparador > 0 then
    aCarregamento.idVeiculo := StrToInt(Trim(Copy(aCarregamento.sVeiculo, 1, idxSeparador - 1)))
  else
    aCarregamento.idVeiculo := StrToInt(Trim(aCarregamento.sVeiculo));

  if (aCarregamento.idCarregador <= 0) then
    raise Exception.Create('Selecione um carregador.');
  if (aCarregamento.idVeiculo <= 0) then
    raise Exception.Create('Selecione um veículo.');
  if (aCarregamento.idPedido <= 0) then
    raise Exception.Create('Selecione um pedido.');

  systemLog:=Tlogger.create;
  try
    repo.criarOrdemCarregamento(aCarregamento, aIdTransportadora);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('[CREATE] Usuário %s do ID %d criou uma ordem de carregamento no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    repo.Free;
    systemLog.free;
  end;
end;

procedure TordemService.criarOrdemViagem(aViagem: TviagemDto; aIdTransportadora: Integer);
var
  repo: TOrdemRepository;
  idxSeparador: Integer;
begin
  repo := TOrdemRepository.Create;

  idxSeparador := Pos(' - ', aViagem.Motorista);
  if idxSeparador > 0 then
    aViagem.idMotorista := StrToInt(Trim(Copy(aViagem.Motorista, 1, idxSeparador - 1)))
  else
    aViagem.idMotorista := StrToInt(Trim(aViagem.Motorista));

  idxSeparador := Pos(' - ', aViagem.Veiculo);
  if idxSeparador > 0 then
    aViagem.idVeiculo := StrToInt(Trim(Copy(aViagem.Veiculo, 1, idxSeparador - 1)))
  else
    aViagem.idVeiculo := StrToInt(Trim(aViagem.Veiculo));


  if (aViagem.idCarregamento <= 0) then
    raise Exception.Create('Selecione o carregamento.');
  if (aViagem.idMotorista <= 0) then
    raise Exception.Create('Selecione o motorista.');
  if (aViagem.idVeiculo <= 0) then
    raise Exception.Create('Selecione o veículo.');

  systemLog:=Tlogger.create;
  try
    repo.criarOrdemViagem(aViagem, aIdTransportadora);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('[CREATE] Usuário %s do ID %d criou uma ordem de viagem no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    repo.Free;
    systemLog.free;
  end;
end;

procedure TordemService.finalizarCarregamento(aIdTransportadora,
  aIdCarregamento, aIdPedido: Integer; aStatus:String);
var
  repos: TOrdemRepository;
begin
  repos := TOrdemRepository.Create;

  if aStatus <> 'Em preparo' then begin
    raise Exception.Create('Essa ordem não foi iniciada ou ja está pronta!');
  end;

  systemLog:=Tlogger.create;
  try
    repos.finalizarCarregamento(aidTransportadora,aIdCarregamento,aIdPedido);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('[CHECK] Usuário %s do ID %d finalizou uma ordem de carregamento no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    repos.Free;
    systemLog.free;
  end;
end;

procedure TordemService.FinalizarViagem(aIdTransportadora, aIdViagem,
  aIdCarregamento: Integer; aStatus: String);
var
  repos: TOrdemRepository;
begin
  repos := TOrdemRepository.Create;

  if aStatus <> 'Em rota' then begin
    raise Exception.Create('Essa ordem não foi iniciada ou ja está pronta!');
  end;

  systemLog:=Tlogger.create;
  try
    repos.finalizarViagem(aidTransportadora,aIdCarregamento,aIdViagem);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('[CHECK] Usuário %s do ID %d finalizou uma ordem de viagem no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    repos.Free;
    systemLog.free;
  end;
end;
procedure TordemService.iniciarCarregamento(aIdTransportadora,aIdCarregamento,aIdPedido: Integer; aStatus:String);
var
  repos: TOrdemRepository;
begin
  repos := TOrdemRepository.Create;

  if aStatus <> 'Aguardando' then begin
    raise Exception.Create('Essa ordem já está em execução ou está pronta!');
  end;

  systemLog:=Tlogger.create;
  try
    repos.iniciarCarregamento(aidTransportadora,aIdCarregamento,aIdPedido);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('[CHECK] Usuário %s do ID %d iniciou uma ordem de carregamento no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    repos.Free;
    systemLog.free;
  end;
end;

procedure TordemService.iniciarViagem(aIdTransportadora, aIdCarregamento,
  aIdviagem: Integer; aStatus: String);
var
  repos: TOrdemRepository;
begin
  repos := TOrdemRepository.Create;

  if aStatus <> 'Aguardando' then begin
    raise Exception.Create('Essa ordem já está em execução ou está pronta!');
  end;

  systemLog:=Tlogger.create;
  try
    repos.iniciarViagem(aidTransportadora,aIdCarregamento,aIdViagem);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('[CHECK] Usuário %s do ID %d iniciou uma ordem de viagem no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    repos.Free;
    systemLog.free;
  end;
end;

function TordemService.mostrarOrdensCarregParaCarreg(aIdTransportadora,
  aIdCarregador: Integer): Tlist<TcarregamentoDto>;
var
  repos: TOrdemRepository;
  listaOrigem, listaDestino: TList<TCarregamentoDto>;
  i: Integer;
  dto: TCarregamentoDto;
begin
  repos := TOrdemRepository.Create;
  listaOrigem := nil;
  listaDestino := TList<TCarregamentoDto>.Create;
  try
    listaOrigem := repos.mostrarOrdensCarregParaCarreg(aIdTransportadora, aIdCarregador);
    for i := 0 to listaOrigem.Count - 1 do
    begin
      dto := listaOrigem[i];
      dto.sVeiculo    := IntToStr(dto.idVeiculo)      + ' - ' + dto.sVeiculo;
      dto.sCarregador := IntToStr(dto.idCarregador)   + ' - ' + dto.sCarregador;

      listaDestino.Add(dto);
    end;
    Result := listaDestino;
    listaOrigem.Free;
  finally
    repos.Free;
  end;
end;

end.
