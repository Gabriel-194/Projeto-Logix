unit userController;

interface
uses
uUsuario, userService;
  type TuserController = class
  public
  procedure cadastrarUsuario(aUsuario:TUsuario);

  end;

implementation

{ TuserController }

procedure TuserController.CadastrarUsuario(aUsuario: TUsuario);
var
  service: TuserSerive;
begin
  service := TuserSerive.Create;
  try
    service.CadastrarUsuario(aUsuario);
  finally
    service.Free;
  end;
end;

end.
