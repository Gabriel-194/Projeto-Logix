unit adminService;

interface
uses
  System.SysUtils, adminRepository, AdminDto, uUsuario,system.Generics.Collections, BCrypt;
  type TadminService = class
    procedure cadastrarAdmin(AadminDto:TadminDto);
    function MostrarAdmin:Tlist<TadminDto>;
    procedure ExcluirADmin (AadminDto:TadminDto);
    function AdminInativo:Tlist<TadminDto>;
    procedure RecuperarAdmin (AadminDto:TadminDto);
    procedure EditarAdmin (AadminDto:TadminDto);
  end;

implementation

{ TadminService }

procedure TadminService.cadastrarAdmin(AadminDto: TadminDto);
var
  adminRepo: TadminRepository;
  HashedSenha : String;
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

  HashedSenha := TBCrypt.HashPassword(AAdminDto.senha);
  AAdminDto.senha := HashedSenha;

  adminRepo := TadminRepository.Create;
  try
    adminRepo.cadastrarAdmin(AadminDto);
  finally
    adminRepo.Free;
  end;
end;

procedure TadminService.EditarAdmin(AadminDto: TadminDto);
var
  adminRepo: TadminRepository;
  HashedSenha : String;
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

  HashedSenha := TBCrypt.HashPassword(AAdminDto.senha);
  AAdminDto.senha := HashedSenha;
  adminRepo := TadminRepository.create;
  try
    adminRepo.EditarAdmin(AadminDto);
  finally
    adminRepo.free;
  end;
end;


procedure TadminService.ExcluirADmin(AadminDto: TadminDto);
var
adminRepo : TadminRepository;
begin
adminRepo := TadminRepository.create;
  try
    adminRepo.ExcluirAdmin(AadminDto);
  finally
    adminRepo.free;
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


procedure TadminService.RecuperarAdmin(AadminDto: TadminDto);
var
adminRepo : TadminRepository;
begin
adminRepo := TadminRepository.create;
  try
    adminRepo.recuperarAdmin(AadminDto);
  finally
    adminRepo.free;
  end;
end;

function TadminService.AdminInativo: Tlist<TadminDto>;
var
  adminRepo : TAdminRepository;
begin
  adminRepo := TadminRepository.create;
  try
    result := AdminRepo.AdminInativo;
  finally
    AdminRepo.free;
  end;
end;

end.
