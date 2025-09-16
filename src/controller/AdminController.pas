unit AdminController;

interface
uses
  AdminDto,uUsuario,adminService;

type TadminController = class
  procedure cadastrarAdmin(AadminDto: TAdminDto);
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

end.
