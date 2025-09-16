unit adminService;

interface
uses
  System.SysUtils, adminRepository, AdminDto, uUsuario;
  type TadminService = class
    procedure cadastrarAdmin(AadminDto:TadminDto);
  end;

implementation

{ TadminService }

procedure TadminService.cadastrarAdmin(AadminDto: TadminDto);
var
  adminRepo: TadminRepository;
begin
  if Trim(AadminDto.nome) = '' then begin
    raise Exception.Create('Nome � obrigat�rio.');
  end;

  if Trim(AadminDto.email) = '' then begin
    raise Exception.Create('E-mail � obrigat�rio.');
  end;

  if Trim(AadminDto.senha) = '' then begin
    raise Exception.Create('Senha � obrigat�ria.');
  end;

  if Trim(AadminDto.cpf) = '' then begin
    raise Exception.Create('CPF � obrigat�rio.');
  end;

  if Trim(AadminDto.telefone) = '' then begin
    raise Exception.Create('Telefone � obrigat�rio.');
  end;

  AadminDto.senha := IntToStr(AadminDto.senha.GetHashCode);

  adminRepo := TadminRepository.Create;
  try
    adminRepo.cadastrarAdmin(AadminDto);
  finally
    adminRepo.Free;
  end;
end;

end.
