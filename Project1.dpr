program Project1;

uses
  Vcl.Forms,
  uTransportadora in 'src\model\uTransportadora.pas',
  Unit2 in 'src\repository\Unit2.pas' {DataModule1: TDataModule},
  transpRepository in 'src\repository\transpRepository.pas',
  transpService in 'src\service\transpService.pas',
  transpController in 'src\controller\transpController.pas',
  loginController in 'src\controller\loginController.pas',
  loginService in 'src\service\loginService.pas',
  loginRepository in 'src\repository\loginRepository.pas',
  uUsuario in 'src\model\uUsuario.pas',
  LoginDto in 'src\DTO\LoginDto.pas',
  AdminDto in 'src\DTO\AdminDto.pas',
  AdminController in 'src\controller\AdminController.pas',
  adminService in 'src\service\adminService.pas',
  adminRepository in 'src\repository\adminRepository.pas',
  uFormHome in 'src\view\uFormHome.pas' {FormHome},
  loginTypes in 'src\model\loginTypes.pas',
  uFormLogin in 'src\view\uFormLogin.pas' {FormLogin},
  usuarioLogado in 'src\session\usuarioLogado.pas',
  userService in 'src\service\userService.pas',
  userRepository in 'src\repository\userRepository.pas',
  homeRepository in 'src\repository\homeRepository.pas',
  homeService in 'src\service\homeService.pas',
  homeController in 'src\controller\homeController.pas',
  uCliente in 'src\model\uCliente.pas',
  EnderecoDto in 'src\DTO\EnderecoDto.pas',
  enderecoRepository in 'src\repository\enderecoRepository.pas',
  enderecoService in 'src\service\enderecoService.pas',
  clienteRepository in 'src\repository\clienteRepository.pas',
  clienteService in 'src\service\clienteService.pas',
  uFormHomeCliente in 'src\view\uFormHomeCliente.pas' {FormHomeCliente},
  motoristaDto in 'src\DTO\motoristaDto.pas',
  uVeiculo in 'src\model\uVeiculo.pas',
  veiculoService in 'src\service\veiculoService.pas',
  veiculoRepository in 'src\repository\veiculoRepository.pas',
  tipoCargaDto in 'src\DTO\tipoCargaDto.pas',
  HomeClienteController in 'src\controller\HomeClienteController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHomeCliente, FormHomeCliente);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
