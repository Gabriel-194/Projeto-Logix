unit userController;

interface
uses
uUsuario, userService, System.SysUtils, system.Generics.Collections;
  type TuserController = class
  public
  procedure cadastrarUsuario(aUsuario:TUsuario);
  function MostrarGerente: TobjectList<Tusuario> ;

  end;

implementation

{ TuserController }

procedure TuserController.CadastrarUsuario(aUsuario: TUsuario);
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

function TuserController.MostrarGerente: TobjectList<Tusuario>;
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

end.
