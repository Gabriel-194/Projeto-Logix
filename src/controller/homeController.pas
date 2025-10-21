unit homeController;

interface
uses
data.DB,homeService,pedidoDto,pedidoService, uUsuario,carregamentoDto,OrdensService, userService, System.SysUtils, system.Generics.Collections,MotoristaDto,uVeiculo,veiculoService,tipocargaDto;

type THomeController = class
  procedure cadastrarUsuario(aUsuario:TUsuario);
  function mostrarUser(const aCargo: string;aIdTransportadora:Integer): TObjectList<Tusuario>;
  procedure EditarUser(aUsuario:TUsuario);overload;
  procedure excluirUser(aUsuario: TUsuario); overload;
  procedure excluirUser(aMotorista: TmotoristaDto); overload;
  function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
  procedure recuperarUser(aUsuario:Tusuario)overload;
  procedure recuperarUser(aMotorista:TmotoristaDto)overload;
  function ContarUsuariosPorCargo(const aCargo: string): Integer;
  function ContarRegistrosAtivos(const ATabela: string;
  AIdTransportadora: Integer; const AColunaFiltroAdicional,
  AValorFiltroAdicional: string): Integer;

//=============== motorista ==============
 procedure cadastrarMotorista(motorista:TmotoristaDto);
 function mostrarMotorista(aIdTransportadora:Integer): Tlist<TmotoristaDto>;
 function mostrarMotoristaInativo(aIdTransportadora:Integer):Tlist<TmotoristaDto>;
 procedure editarMotorista(motorista:TmotoristaDto);
//================veiculo===============================
procedure cadastrarVeiculo(veiculo:Tveiculo);
function mostrarVeiculo: TobjectList<Tveiculo>;
function mostrarVeiculoInativo: TobjectList<Tveiculo>;
procedure excluirVeiculo(veiculo:Tveiculo);
procedure recuperarVeiculo(veiculo:Tveiculo);
procedure editarVeiculo(veiculo:Tveiculo);
function cargasDisponiveis(aIdTransportadora:Integer):tlist<TtipoCargaDto>;
//=================== pedidos ==========================
function BuscarPedidosPorTransp(aIdTransportadora:Integer):Tlist<TpedidoDto>;
function buscarPedidosPorStatus(aIdTransportadora:Integer; aStatus:String):Integer;
function BuscarPedidosOrdens(aIdTransportadora:Integer):Tlist<TpedidoDto>;
//==================== ORDENS ====================
procedure criarOrdemCarregamento(acarregamento:TcarregamentoDto; aIdTransportadora:Integer);

  end;

implementation

{ THomeController }



{ THomeController }

function THomeController.BuscarPedidosOrdens(
  aIdTransportadora: Integer): Tlist<TpedidoDto>;
var
  service:TpedidoService;
begin
service:=TpedidoService.create;

  try
    result := service.BuscarPedidosOrdens(aIdTransportadora);
  finally
    service.free;
  end;

end;

function THomeController.buscarPedidosPorStatus(aIdTransportadora: Integer;
  aStatus: String): Integer;
var
  service:TpedidoService;
begin
service:=TpedidoService.create;

  try
    result := service.BuscarPedidosPorStatus(aIdTransportadora,aStatus);
  finally
    service.free;
  end;

end;

function THomeController.BuscarPedidosPorTransp(aIdTransportadora:Integer):Tlist<TpedidoDto>;
var
  service:TpedidoService;
begin
service:=TpedidoService.create;

  try
    result := service.BuscarPedidosPorTransp(aIdTransportadora);
  finally
    service.free;
  end;

end;

procedure THomeController.cadastrarMotorista(motorista: TmotoristaDto);
var
service: TuserService;
begin
service:= TuserService.create;
  try
    service.cadastrarMotorista(motorista);
  finally
    service.free;
  end;
end;

procedure THomeController.CadastrarUsuario(aUsuario: TUsuario);
var
  service: TuserService;
begin
  service := TuserService.Create;
  try
    service.CadastrarUsuario(aUsuario);
  finally
    service.Free;
  end;
end;

procedure THomeController.cadastrarVeiculo(veiculo: Tveiculo);
var
Service: TveiculoService;
begin
Service:= TveiculoService.create;
  try
    service.cadastrarVeiculo(veiculo);
  finally
    service.free;
  end;
end;

function THomeController.cargasDisponiveis(
  aIdTransportadora: Integer): tlist<TtipoCargaDto>;
var
  service:TveiculoService;
begin
service:=TveiculoService.create;

  try
    result := service.cargasDisponiveis(aIdTransportadora);
  finally
    service.free;
  end;

end;

function THomeController.ContarRegistrosAtivos(const ATabela: string;
  AIdTransportadora: Integer; const AColunaFiltroAdicional,
  AValorFiltroAdicional: string): Integer;
var
Service: ThomeService;
begin
Service:= ThomeService.create;

  Result := Service.ContarRegistrosAtivos(
    ATabela,
    AIdTransportadora,
    AColunaFiltroAdicional,
    AValorFiltroAdicional
  );
end;


function THomeController.ContarUsuariosPorCargo(const aCargo: string): Integer;
var
homeService:Thomeservice;
begin
  homeService:=Thomeservice.create;
  try
    result := homeService.ContarUsuariosPorCargo(aCargo);
  finally
    homeService.free;
  end;
end;

procedure THomeController.criarOrdemCarregamento(acarregamento:TcarregamentoDto; aIdTransportadora:Integer);
var
service : TOrdemService;
begin
  service := TOrdemService.create;
  try
    service.criarOrdemCarregamento(aCarregamento,aIdTransportadora);
  finally
    service.free;
  end;
end;

procedure THomeController.editarMotorista(motorista: TmotoristaDto);
var
service :TuserService;
begin
service := TuserService.create;
  try
    service.editarMotorista(motorista);
  finally
    service.free;
  end;
end;

procedure THomeController.EditarUser(aUsuario: TUsuario);
var
service :TuserService;
begin
service := TuserService.create;
  try
    service.editarUser(aUsuario);
  finally
    service.free;
  end;
end;

procedure THomeController.editarVeiculo(veiculo: Tveiculo);
var
Service: TveiculoService;
begin
Service:= TveiculoService.create;
  try
    service.editarVeiculo(veiculo);
  finally
    service.free;
  end;
end;

procedure THomeController.excluirUser(aMotorista: TmotoristaDto);
var
  service: TuserService;
begin
  service := TuserService.create;
  try
    service.excluirUser(aMotorista);
  finally
    service.free;
  end;
end;

procedure THomeController.excluirVeiculo(veiculo: Tveiculo);
var
service : TveiculoService;
begin
service := TveiculoService.create;
  try
    service.excluirVeiculo(veiculo);
  finally
    service.free;
  end;
end;

procedure THomeController.excluirUser(aUsuario: TUsuario);
var
service : TuserService;
begin
service := TuserService.create;
  try
    service.excluirUser(aUsuario);
  finally
    service.free;
  end;
end;

function THomeController.mostrarMotorista(aIdTransportadora:Integer): Tlist<TmotoristaDto>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarMotorista(aIdTransportadora);
 finally
  service.free;
 end;
end;

function THomeController.mostrarMotoristaInativo(aIdTransportadora:Integer): Tlist<TmotoristaDto>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarMotoristaInativo(aIdTransportadora);
 finally
  service.free;
 end;
end;
function THomeController.mostrarUser(const aCargo: string;aIdTransportadora:Integer): TObjectList<Tusuario>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarUser(aCargo,aIdtransportadora);
 finally
  service.free;
 end;
end;

function THomeController.MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.MostrarUserInativo(aCargo);
 finally
  service.free;
 end;
end;

function THomeController.mostrarVeiculo: TobjectList<Tveiculo>;
var
service : TveiculoService;
begin
service := TveiculoService.create;
  try
    result := service.mostrarVeiuclo;
  finally
    service.free;
  end;
end;

function THomeController.mostrarVeiculoInativo: TobjectList<Tveiculo>;
var
service : TveiculoService;
begin
service := TveiculoService.create;
  try
    result := service.mostrarVeiculoInativo;
  finally
    service.free;
  end;
end;

procedure THomeController.recuperarUser(aUsuario: Tusuario);
var
service : TuserService;
begin
service := TuserService.create;
  try
    service.recuperarUser(aUsuario);
  finally
    service.free;
  end;
end;

procedure THomeController.recuperarUser(aMotorista: TmotoristaDto);
var
service : TuserService;
begin
service := TuserService.create;
  try
    service.recuperarUser(aMotorista);
  finally
    service.free;
  end;
end;



procedure THomeController.recuperarVeiculo(veiculo: Tveiculo);
var
service : TveiculoService;
begin
service := TveiculoService.create;
  try
    service.recuperarVeiculo(veiculo);
  finally
    service.free;
  end;
end;

end.
