unit formMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, transpController, transpService, uTransportadora;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    PanelImage: TPanel;
    PanelLogin: TPanel;
    Image2: TImage;
    Image1: TImage;
    PanelCadastroTransp: TPanel;
    lblCadastro: TLabel;
    lblButtonCadastrar: TLabel;
    Panel6: TPanel;
    edtNome: TEdit;
    Panel9: TPanel;
    Label8: TLabel;
    panel10: TPanel;
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
    pnlEditSenha: TPanel;
    Shape3: TShape;
    edtSenhaLogin: TEdit;
    loginLabel: TLabel;
    Email: TLabel;
    Senha: TLabel;
    pnlEditEmail: TPanel;
    Shape2: TShape;
    edtEmailLogin: TEdit;
    pnlBtnChangeCadastrar: TPanel;
    Shape5: TShape;
    btnchangeCadastrar: TLabel;
    pnlBtnEntrar: TPanel;
    Shape4: TShape;
    btnEntrar: TLabel;
    Image3: TImage;
    PnlEditNome: TPanel;
    Shape6: TShape;
    pnlEditCnpj: TPanel;
    Shape7: TShape;
    pnlEditTelefone: TPanel;
    Shape8: TShape;
    pnlEditEmailCadastro: TPanel;
    Shape9: TShape;
    pnlEditCep: TPanel;
    Shape1: TShape;
    pnlBtnCadastar: TPanel;
    Shape10: TShape;
    pnlVoltarLogin: TPanel;
    Shape11: TShape;
    voltarImage: TImage;
    procedure lblButtonCadastrarClick(Sender: TObject);
    procedure btnchangeCadastrarClick(Sender: TObject);
    procedure voltarImageClick(Sender: TObject);

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
  Transp: TTransportadora;
begin

  Transp := TTransportadora.create;
  try
    Transp.setNome(edtNome.Text);
    Transp.setCNPJ(MaskEditCNPJ.Text);
    Transp.setTelefone(MaskEditTelefone.Text);
    Transp.setEmail(edtEmail.Text);
    Transp.setCep(MaskEditCEP.Text);

    Controller := TTranspController.Create;
    try
      Controller.CadastrarTransportadora(Transp);
      ShowMessage('Transportadora cadastrada com sucesso!');
    finally
      Controller.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
    Transp.Free;
end;



procedure TForm1.voltarImageClick(Sender: TObject);
begin
  panelLogin.Visible:=true;
  panelCadastroTransp.Visible:=false;
end;

procedure TForm1.btnchangeCadastrarClick(Sender: TObject);
begin
  panelLogin.Visible:=false;
  panelCadastroTransp.Visible:=true;
end;



end.
