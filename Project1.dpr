program Project1;

uses
  Vcl.Forms,
  formLoginTransportadora in 'src\view\formLoginTransportadora.pas' {Form1},
  uTransportadora in 'src\model\uTransportadora.pas',
  Unit2 in 'src\repository\Unit2.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
