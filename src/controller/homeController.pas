unit homeController;

interface
uses
data.DB,homeService, uUsuario, userService, System.SysUtils, system.Generics.Collections,MotoristaDto,uVeiculo,veiculoService;

type THomeController = class
  procedure cadastrarUsuario(aUsuario:TUsuario);
  function MostrarUser(const aCargo: string): TObjectList<Tusuario>;
  procedure EditarUser(aUsuario:TUsuario);overload;
  procedure excluirUser(aUsuario: TUsuario); overload;
  procedure excluirUser(aMotorista: TmotoristaDto); overload;
  function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
  procedure recuperarUser(aUsuario:Tusuario)overload;
  procedure recuperarUser(aMotorista:TmotoristaDto)overload;
  function ContarUsuariosPorCargo(const aCargo: string): Integer;
//=============== motorista ==============
 procedure cadastrarMotorista(motorista:TmotoristaDto);
 function mostrarMotorista:Tlist<TmotoristaDto>;
 function mostrarMotoristaInativo:Tlist<TmotoristaDto>;
 procedure editarMotorista(motorista:TmotoristaDto);
//================veiculo===============================
procedure cadastrarVeiculo(veiculo:Tveiculo);
function mostrarVeiculo: TobjectList<Tveiculo>;
function mostrarVeiculoInativo: TobjectList<Tveiculo>;
  end;

implementation

{ THomeController }



{ THomeController }

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

function THomeController.mostrarMotorista: Tlist<TmotoristaDto>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarMotorista;
 finally
  service.free;
 end;
end;

function THomeController.mostrarMotoristaInativo: Tlist<TmotoristaDto>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarMotoristaInativo;
 finally
  service.free;
 end;
end;
function THomeController.mostrarUser(const aCargo: string): TObjectList<Tusuario>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarUser(aCargo);
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
    result := service.mostrarVeiuclo;
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



end.
