unit userService;

interface
uses
uUsuario, system.Generics.Collections,uLog, BCrypt, System.SysUtils,userRepository,motoristaDto,usuarioLogado;
  type TuserService = class
    procedure cadastrarUsuario(aUsuario:TUsuario);
    function mostrarUser(const aCargo: string;aIdTransportadora:Integer): TObjectList<Tusuario>;
    procedure editarUser (aUsuario:TUsuario);
    procedure excluirUser(aUsuario: TUsuario); overload;
    procedure excluirUser(aMotorista: TmotoristaDto); overload;
    function MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
    procedure recuperarUser(aUsuario:Tusuario);overload;
    procedure recuperarUser(aMotorista: TmotoristaDto); overload;
// =============MOTORISTA======================================================
    procedure cadastrarMotorista(motorista:TmotoristaDto);
    function mostrarMotorista(aIdTransportadora:Integer): Tlist<TmotoristaDto>;
    function mostrarMotoristaInativo(aIdTransportadora:Integer): Tlist<TmotoristaDto>;
    procedure editarMotorista(motorista:TmotoristaDto);



end;

implementation
var
SystemLog: Tlogger;

procedure TuserService.cadastrarMotorista(motorista: TmotoristaDto);
var
  userRepo: TuserRepository;
  HashedSenha : String;
  validadeLimpa : integer;
begin
  if Trim(motorista.nome) = '' then begin
    raise Exception.Create('Nome é obrigatório.');
  end;

  if Trim(motorista.email) = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if Trim(motorista.senha) = '' then begin
    raise Exception.Create('Senha é obrigatória.');
  end;

  if Trim(motorista.cpf) = '' then begin
    raise Exception.Create('CPF é obrigatório.');
  end;

  if Trim(motorista.telefone) = '' then begin
    raise Exception.Create('Telefone é obrigatório.');
  end;

  if Trim(motorista.NumeroCNH) = '' then begin
    raise Exception.Create('O numero da CNH é obrigatório.');
  end;

  if Trim(motorista.CategoriaCNH) = '' then begin
    raise Exception.Create('A categoria da CNH é obrigatória.');
  end;


  if motorista.ValidadeCNH = 0 then begin
    raise Exception.Create('A validade da CNH é obrigatória.');
  end;

  HashedSenha := TBCrypt.HashPassword(motorista.senha);
  motorista.senha := HashedSenha;

  userRepo := TuserRepository.Create;
  SystemLog:=Tlogger.create;
  try
    userRepo.cadastrarMotorista(motorista);
      SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d cadastrou um motorista no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    userRepo.Free;
    systemLog.free
  end;

end;

{ TuserSerive }

procedure TuserService.cadastrarUsuario(aUsuario: TUsuario);
var
userRepo: TuserRepository;
HashedSenha : String;
begin

  if Trim(aUsuario.getNome) = '' then
  begin
    raise Exception.Create('O nome do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getEmail) = '' then
  begin
    raise Exception.Create('O e-mail do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getSenha_hash) = '' then
  begin
    raise Exception.Create('A senha é obrigatória.');
  end;

  if Trim(aUsuario.getcpf) = '' then
  begin
    raise Exception.Create('O CPF é obrigatório.');
  end;

  if Trim(aUsuario.gettelefone) = '' then
  begin
    raise Exception.Create('O telefone é obrigatório.');
  end;


  HashedSenha := TBCrypt.HashPassword(aUsuario.getSenha_hash);
  aUsuario.setSenha_hash(HashedSenha);

  userRepo := TuserRepository.Create;
  SystemLog:=Tlogger.create;
  try
    userRepo.CadastrarUsuario(aUsuario);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d cadastrou um %s no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId,aUsuario.getCargo_descricao, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    userRepo.Free;
    systemLog.free;
  end;
end;

procedure TuserService.editarMotorista(motorista: TmotoristaDto);
var
  userRepo: TuserRepository;
  HashedSenha : String;
  validadeLimpa : integer;
begin
  if Trim(motorista.nome) = '' then begin
    raise Exception.Create('Nome é obrigatório.');
  end;

  if Trim(motorista.email) = '' then begin
    raise Exception.Create('E-mail é obrigatório.');
  end;

  if Trim(motorista.cpf) = '' then begin
    raise Exception.Create('CPF é obrigatório.');
  end;

  if Trim(motorista.telefone) = '' then begin
    raise Exception.Create('Telefone é obrigatório.');
  end;

  if Trim(motorista.NumeroCNH) = '' then begin
    raise Exception.Create('O numero da CNH é obrigatório.');
  end;

  if Trim(motorista.CategoriaCNH) = '' then begin
    raise Exception.Create('A categoria da CNH é obrigatória.');
  end;


  if motorista.ValidadeCNH = 0 then begin
    raise Exception.Create('A validade da CNH é obrigatória.');
  end;

  if Trim(motorista.senha) = '' then begin
    userRepo:= TuserRepository.create;
    systemLog:=Tlogger.create;
    try
      userRepo.editarMotoristaNotSenha(motorista);
       SystemLog.Log(UserLogado.getSchemaName,
      Format('Usuário %s do ID %d editou um motorista no dia %s e no horário %s',
      [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
      raise Exception.Create('motorista editado, mas segue com sua senha original.');

    finally
      userRepo.free;
    end;
  end else begin
    HashedSenha := TBCrypt.HashPassword(motorista.senha);
    motorista.senha := HashedSenha;

    userRepo := TuserRepository.Create;
    try
      userRepo.editarMotorista(motorista);
      SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d editou um motorista no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
    finally
      userRepo.Free;
      systemLog.free;
    end;
  end;


end;

procedure TuserService.editarUser(aUsuario: TUsuario);
var
  userRepo: TuserRepository;
  HashedSenha : String;
begin

  if Trim(aUsuario.getNome) = '' then
  begin
    raise Exception.Create('O nome do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getEmail) = '' then
  begin
    raise Exception.Create('O e-mail do usuário é obrigatório.');
  end;

  if Trim(aUsuario.getcpf) = '' then
  begin
    raise Exception.Create('O CPF é obrigatório.');
  end;

  if Trim(aUsuario.gettelefone) = '' then
  begin
    raise Exception.Create('O telefone é obrigatório.');
  end;

  userRepo := TuserRepository.Create;
  systemLog:=Tlogger.create;
  if Trim(aUsuario.getSenha_hash) = '' then
  begin
    userRepo.editarUserNotSenha(aUsuario);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d editou um %s no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId,aUsuario.getCargo_descricao, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
   raise Exception.Create('usuario editado, mantendo a mesma senha');
   userRepo.free;
   systemLog.free;
  end else begin
    HashedSenha := TBCrypt.HashPassword(aUsuario.getSenha_hash);
    aUsuario.setSenha_hash(HashedSenha);
    try
    userRepo.editarUser(aUsuario);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d editou um %s no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId,aUsuario.getCargo_descricao, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
    finally
    userRepo.Free;
    systemLog.free;
    end;
  end;

end;


procedure TuserService.excluirUser(aMotorista: TmotoristaDto);
var
  userRepo: TUserRepository;
begin

  userRepo := TUserRepository.create;
  systemLog:=Tlogger.create;
  try
    userRepo.excluirUser(aMotorista.IdUsuario);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d excluiu um motorista no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    userRepo.free;
    systemLog.free;
  end;
end;

procedure TuserService.excluirUser(aUsuario: TUsuario);
var
  userRepo: TUserRepository;
begin
  userRepo := TUserRepository.create;
  systemLog:=Tlogger.create;
  try
    userRepo.excluirUser(aUsuario.GetID);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d excluiu um %s no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId,aUsuario.getCargo_descricao, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    userRepo.free;
    systemLog.free;
  end;
end;

function TuserService.mostrarMotorista(aIdTransportadora:Integer): Tlist<TmotoristaDto>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.mostrarMotorista(aIdTransportadora);
  finally
    userRepo.free;
  end;
end;

function TuserService.mostrarMotoristaInativo(aIdTransportadora:Integer): Tlist<TmotoristaDto>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.mostrarMotoristaInativo(aIdTransportadora);
  finally
    userRepo.free;
  end;
end;

function TuserService.mostrarUser(const aCargo: string;aIdTransportadora:Integer): TObjectList<Tusuario>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.mostrarUser(aCargo,aIdTransportadora);
  finally
    userRepo.free;
  end;
end;

function TuserService.MostrarUserInativo(const aCargo: string): TObjectList<Tusuario>;
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
  try
    result := userRepo.MostrarUserInativo(aCargo);
  finally
    userRepo.free;
  end;
end;

procedure TuserService.recuperarUser(aMotorista: TmotoristaDto);
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
systemLog:=Tlogger.create;
  try
    userRepo.recuperarUser(aMotorista.IdUsuario);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d recuperou um motorista no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    userRepo.free;
    systemLog.free;
  end;
end;

procedure TuserService.recuperarUser(aUsuario: Tusuario);
var
userRepo : TuserRepository;
begin
userRepo := TuserRepository.create;
systemLog:=Tlogger.create;
  try
    userRepo.recuperarUser(aUsuario.GetID);
    SystemLog.Log(UserLogado.getSchemaName,
    Format('Usuário %s do ID %d recuperou um %s no dia %s e no horário %s',
    [UserLogado.getNome, UserLogado.getId,aUsuario.getCargo_descricao, FormatDateTime('dd/MM/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]));
  finally
    userRepo.free;
    systemLog.free;
  end;
end;
end.
