unit homeController;

interface
uses
data.DB,homeService, uUsuario, userService, System.SysUtils, system.Generics.Collections;

type THomeController = class
  procedure cadastrarUsuario(aUsuario:TUsuario);
  function MostrarGerente: TobjectList<Tusuario>;
  procedure EditarUser(aUsuario:TUsuario);
  procedure excluirUser(aUsuario:TUsuario);
  function MostrarGerenteInativo: TobjectList<Tusuario>;
  procedure recuperarUser(aUsuario:Tusuario);
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

function THomeController.MostrarGerente: TobjectList<Tusuario>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarGerente;
 finally
  service.free;
 end;
end;

function THomeController.MostrarGerenteInativo: TobjectList<Tusuario>;
var
service : TuserService;
begin
 service := TuserService.create;
 try
   result := service.mostrarGerenteInativo;
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
