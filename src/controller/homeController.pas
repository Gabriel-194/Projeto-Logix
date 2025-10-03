unit homeController;

interface
uses
data.DB,homeService, uUsuario, userService, System.SysUtils, system.Generics.Collections,MotoristaDto;

type THomeController = class
  procedure cadastrarUsuario(aUsuario:TUsuario);
  function MostrarUser(const aCargo: string): TObjectList<Tusuario>;
  procedure EditarUser(aUsuario:TUsuario);
  procedure excluirUser(aUsuario: TUsuario); overload;
  procedure excluirUser(aMotorista: TmotoristaDto); overload;
  function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
  procedure recuperarUser(aUsuario:Tusuario)overload;
  procedure recuperaUser(aMotorista: TmotoristaDto); overload;
  function ContarUsuariosPorCargo(const aCargo: string): Integer;
//=============== motorista ==============
 procedure cadastrarMotorista(motorista:TmotoristaDto);
 function mostrarMotorista:Tlist<TmotoristaDto>;

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

procedure THomeController.recuperaUser(aMotorista: TmotoristaDto);
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
