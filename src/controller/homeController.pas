unit homeController;

interface
uses
data.DB,homeService, uUsuario, userService, System.SysUtils, system.Generics.Collections;

type THomeController = class
  procedure cadastrarUsuario(aUsuario:TUsuario);
  function MostrarUser(const aCargo: string): TObjectList<Tusuario>;
  procedure EditarUser(aUsuario:TUsuario);
  procedure excluirUser(aUsuario:TUsuario);
  function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
  procedure recuperarUser(aUsuario:Tusuario);
  function ContarUsuariosPorCargo(const aCargo: string): Integer;

  end;

implementation

{ THomeController }



{ THomeController }

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

end.
