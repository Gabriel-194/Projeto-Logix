unit uFormLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, transpController, uTransportadora, uUsuario,loginController;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    PanelImage: TPanel;
    PanelLogin: TPanel;
    Image2: TImage;
    Image1: TImage;
    pnlEditSenha: TPanel;
    Shape3: TShape;
    edtSenhaLogin: TEdit;
    loginLabel: TLabel;
    Email: TLabel;
    Senha: TLabel;
    pnlEditEmail: TPanel;
    Shape2: TShape;
    edtEmailLogin: TEdit;
    pnlBtnEntrar: TPanel;
    Shape4: TShape;
    btnEntrar: TLabel;
    PanelAdmin: TPanel;
    Image4: TImage;
    lblWelcome: TLabel;
    PanelOptionsTransp: TPanel;
    lblPanelOption: TLabel;
    Panel6: TPanel;
    PnlEditNome: TPanel;
    Shape6: TShape;
    edtNome: TEdit;
    pnlEditCnpj: TPanel;
    Shape7: TShape;
    MaskEditCNPJ: TMaskEdit;
    Panel9: TPanel;
    Label8: TLabel;
    panel10: TPanel;
    pnlEditCep: TPanel;
    Shape1: TShape;
    MaskEditCEP: TMaskEdit;
    Panel7: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Panel8: TPanel;
    pnlEditTelefone: TPanel;
    Shape8: TShape;
    MaskEditTelefone: TMaskEdit;
    pnlEditEmailCadastro: TPanel;
    Shape9: TShape;
    edtEmail: TEdit;
    Panel5: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    pnlVoltarLogin: TPanel;
    Shape11: TShape;
    voltarImage: TImage;
    PanelButtons: TPanel;
    pnlBtnChangeCadastrar: TPanel;
    Shape5: TShape;
    btnchangeCadastrar: TLabel;
    pnlBtnExcluirTransp: TPanel;
    Shape12: TShape;
    btrnExcluirTransp: TLabel;
    PnlBtnEditarTransp: TPanel;
    Shape13: TShape;
    btnEditarTransp: TLabel;
    ListBox1: TListBox;
    Panel2: TPanel;
    pnlBtnCadastar: TPanel;
    Shape10: TShape;
    lblButtonCadastrar: TLabel;
    pnlBtnEditar: TPanel;
    Shape14: TShape;
    lblButtonEditar: TLabel;
    procedure lblButtonCadastrarClick(Sender: TObject);
    procedure btnchangeCadastrarClick(Sender: TObject);
    procedure voltarImageClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnEditarTranspClick(Sender: TObject);
    procedure btrnExcluirTranspClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin : TFormLogin;

implementation
uses login.types;

{$R *.dfm}

procedure TFormLogin.btnEditarTranspClick(Sender: TObject);
begin
  PanelOptionsTransp.Visible:=true;
  lblPanelOption.Caption := 'Editar Transportadora';
  pnlBtnCadastar.Visible := false;
  pnlBtnEditar.Visible := true;

end;

procedure TFormLogin.btnEntrarClick(Sender: TObject);
var
controlLogin : TloginController;
user : Tusuario;
resultado : TLoginResult;
begin
  user := Tusuario.Create;

  try
    user.setEmail(edtEmailLogin.text);
    user.setSenha_hash(edtSenhaLogin.text);

    controlLogin := TloginController.Create;
    try
      resultado := controlLogin.verificaLogin(user);
      case resultado of
        lrFalhou:
          ShowMessage('Usuário ou senha inválidos.');

        lrSucessoUsuario:
          begin
            ShowMessage('Login realizado com sucesso! Bem-vindo ' + user.getEmail);
            // Aqui você fecharia este form e abriria o form principal do usuário
            Close;
          end;

        lrSucessoAdmin:
          begin
            ShowMessage('Bem-vindo ADMINISTRADOR!');
              Panel1.Visible := False;
              PanelAdmin.Visible := True;
          end;
      end;
    finally
      controlLogin.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
    user.free;
end;

procedure TFormLogin.btrnExcluirTranspClick(Sender: TObject);
begin
    PanelOptionsTransp.Visible:=true;
  lblPanelOption.Caption := 'Excluit Transportadora';
end;

procedure TFormLogin.lblButtonCadastrarClick(Sender: TObject);
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



procedure TFormLogin.voltarImageClick(Sender: TObject);
begin
  PanelOptionsTransp.Visible:=false;
end;

procedure TFormLogin.btnchangeCadastrarClick(Sender: TObject);
begin
  PanelOptionsTransp.Visible:=true;
  lblPanelOption.Caption := 'Cadastrar Transportadora';
  pnlBtnCadastar.Visible := true;
  pnlBtnEditar.Visible := false;
end;



end.
