unit loginController;

interface
uses
  System.SysUtils, uUsuario, loginService, loginTypes, LoginDto,enderecoDto,enderecoService,uCLiente,ClienteService;
    type
    TloginController = class
    public
      function verificaLogin(ALoginDto: TLoginDto; out aUser: TUsuario; out cliente:Tcliente): TloginResult;
      function getByCep(const ACep: string): TEndereco;
      procedure cadastrarCliente(aCliente:Tcliente);
      procedure SolicitarRecuperacao(AEmail: string);
      function ValidarToken(AEmail, AToken: string): Boolean;
      procedure RedefinirSenha(AEmail, AToken, ANovaSenha: string);
    end;

implementation


procedure TloginController.cadastrarCliente(aCliente: Tcliente);
var
service: TClienteService;
begin
service:= TClienteService.create;
  try
    service.cadastrarCliente(aCliente);
  finally
    service.free;
  end;
end;

function TloginController.getByCep(const ACep: string): TEndereco;
var
  service: TEnderecoService;
begin
  service := TEnderecoService.Create;
  try
    Result := service.BuscarPorCEP(ACep);
  finally
    service.Free;
  end;
end;

procedure TloginController.SolicitarRecuperacao(AEmail: string);
var
  service: TloginService;
begin
  service := TloginService.Create;
  try
    service.SolicitarRecuperacaoSenha(AEmail);
  finally
    service.Free;
  end;
end;

function TloginController.ValidarToken(AEmail, AToken: string): Boolean;
var
  service: TloginService;
begin
  service := TloginService.Create;
  try
    Result := service.ValidarTokenRecuperacao(AEmail, AToken);
  finally
    service.Free;
  end;
end;

procedure TloginController.RedefinirSenha(AEmail, AToken, ANovaSenha: string);
var
  service: TloginService;
begin
  service := TloginService.Create;
  try
    service.RedefinirSenha(AEmail, AToken, ANovaSenha);
  finally
    service.Free;
  end;
end;

function TloginController.verificaLogin(ALoginDto: TLoginDto; out aUser: TUsuario; out cliente:Tcliente): TloginResult;
var
 service : TloginService;
begin
  service := TloginService.Create;
  try
    Result := service.verificaLogin(ALoginDto, aUser,cliente);
  finally
    service.Free;
  end;
end;
end.
