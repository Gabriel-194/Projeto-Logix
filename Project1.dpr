program Project1;

uses
  Vcl.Forms,
  uTransportadora in 'src\model\uTransportadora.pas',
  Unit2 in 'src\repository\Unit2.pas' {DataModule1: TDataModule},
  transpRepository in 'src\repository\transpRepository.pas',
  transpService in 'src\service\transpService.pas',
  transpController in 'src\controller\transpController.pas',
  uFormLogin in 'src\view\uFormLogin.pas',
  loginController in 'src\controller\loginController.pas',
  loginService in 'src\service\loginService.pas',
  uUsuario in 'uUsuario.pas',
  loginRepository in 'src\repository\loginRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
