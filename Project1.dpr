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
  uFormLogin in 'src\view\uFormLogin.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
