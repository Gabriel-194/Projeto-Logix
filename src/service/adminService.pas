unit adminService;

interface
uses
  System.SysUtils, adminRepository, AdminDto, uUsuario,system.Generics.Collections;
  type TadminService = class
    procedure cadastrarAdmin(AadminDto:TadminDto);
    function MostrarAdmin:Tlist<TadminDto>;
  end;

implementation

{ TadminService }

procedure TadminService.cadastrarAdmin(AadminDto: TadminDto);
var
  adminRepo: TadminRepository;
begin
  if Trim(AadminDto.nome) = '' then begin
    raise Exception.Create('Nome é obrigatório.');
  end;

  if Trim(AadminDto.email) = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if Trim(AadminDto.senha) = '' then begin
    raise Exception.Create('Senha é obrigatória.');
  end;

  if Trim(AadminDto.cpf) = '' then begin
    raise Exception.Create('CPF é obrigatório.');
  end;

  if Trim(AadminDto.telefone) = '' then begin
    raise Exception.Create('Telefone é obrigatório.');
  end;

  if AadminDto.idTransportadora = 0 then begin
    raise Exception.Create('Selecione uma transportadora válida.');
  end;

  AadminDto.senha := IntToStr(AadminDto.senha.GetHashCode);

  adminRepo := TadminRepository.Create;
  try
    adminRepo.cadastrarAdmin(AadminDto);
  finally
    adminRepo.Free;
  end;
end;

function TadminService.MostrarAdmin: Tlist<TadminDto>;
var
  adminRepo : TAdminRepository;
begin
  adminRepo := TadminRepository.create;
  try
    result := AdminRepo.mostrarAdmins;
  finally
    AdminRepo.free;
  end;
end;


end.
