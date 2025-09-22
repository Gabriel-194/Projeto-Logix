unit AdminController;

interface
uses
  AdminDto,uUsuario,adminService,system.Generics.Collections;

type TadminController = class
  procedure cadastrarAdmin(AadminDto: TAdminDto);
  function MostrarAdmin:Tlist<TadminDto>;
  procedure ExcluirADmin (AadminDto: TAdminDto);
end;

implementation

{ TadminController }

procedure TadminController.cadastrarAdmin(AadminDto: TAdminDto);
var
service: TadminService;
begin
  service := TadminService.create;
  try
    service.cadastrarAdmin(AadminDto)
  finally
    service.free;
  end;
end;

procedure TadminController.ExcluirADmin(AadminDto: TAdminDto);
var
  service :TadminService;
begin
  service := TadminService.create;
  try
   Service.ExcluirAdmin(AadminDto);
  finally
    service.free;
  end;
end;

function TadminController.MostrarAdmin: Tlist<TadminDto>;
var
  service :TadminService;
begin
  service := TadminService.create;
  try
    result := Service.MostrarAdmin;
  finally
    service.free;
  end;
end;

end.
