unit formMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, transpController,Unit2;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    PanelImage: TPanel;
    PanelLogin: TPanel;
    Image2: TImage;
    Image1: TImage;
    PanelCadastroTransp: TPanel;
    lblCadastro: TLabel;
    Shape1: TShape;
    lblButtonCadastrar: TLabel;
    Panel6: TPanel;
    edtNome: TEdit;
    Panel9: TPanel;
    Label8: TLabel;
    Panel10: TPanel;
    Panel7: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Panel8: TPanel;
    edtEmail: TEdit;
    Panel5: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    MaskEditCNPJ: TMaskEdit;
    MaskEditTelefone: TMaskEdit;
    MaskEditCEP: TMaskEdit;
    panelEditSenha: TPanel;
    Shape4: TShape;
    Edit1: TEdit;
    Panel2: TPanel;
    panelEditEmail: TPanel;
    Shape3: TShape;
    edtEmailLogin: TEdit;
    procedure lblButtonCadastrarMouseEnter(Sender: TObject);
    procedure lblButtonCadastrarMouseLeave(Sender: TObject);
//    procedure lblButtonCadastroEmpMouseEnter(Sender: TObject);
//    procedure lblButtonCadastroEmpMouseLeave(Sender: TObject);
    procedure lblButtonCadastroEmpClick(Sender: TObject);
    procedure lblButtonCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.lblButtonCadastrarClick(Sender: TObject);
var
  Controller: TTranspController;
begin

  Controller := TTranspController.Create(dataModule2.FDConnection1);
  try
    Controller.CadastrarTransportadora(
      edtNome.Text,
      MaskEditCnpj.Text,
      MaskEditTelefone.Text,
      edtEmail.Text,
      MaskEditCep.Text
    );
    ShowMessage('Transportadora cadastrada com sucesso!');
  finally
    Controller.Free;
  end;
end;

procedure TForm1.lblButtonCadastrarMouseEnter(Sender: TObject);
begin
   shape1.Visible:=true;
   Shape1.Left := lblButtonCadastrar.Left -10;
   Shape1.Top :=  lblButtonCadastrar.Top -5;
   shape1.Margins.Right := lblButtonCadastrar.Margins.right + 10;
   Shape1.Height := lblButtonCadastrar.Height + 10;


end;

procedure TForm1.lblButtonCadastrarMouseLeave(Sender: TObject);
begin
   shape1.Visible:=false;
end;

procedure TForm1.lblButtonCadastroEmpClick(Sender: TObject);
begin
  panelLogin.Visible:=false;
  panelCadastroTransp.Visible:=true;
end;

//procedure TForm1.lblButtonCadastroEmpMouseEnter(Sender: TObject);
//begin
//  shape2.Visible:=true;
//   shape2.Visible:=true;
//   Shape2.Left := lblButtonCadastroEmp.Left -10;
//   Shape2.Top :=  lblButtonCadastroEmp.Top -5;
//   shape2.Margins.Right := lblButtonCadastroEmp.Margins.right + 10;
//   Shape2.Height := lblButtonCadastroEmp.Height + 10;
//end;
//
//procedure TForm1.lblButtonCadastroEmpMouseLeave(Sender: TObject);
//begin
//  shape2.Visible:=false;
//end;

end.
