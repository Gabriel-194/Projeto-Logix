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
