unit uFormLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, transpController, uTransportadora, uUsuario,loginController,
  Vcl.ComCtrls,System.Generics.Collections;

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
    Panel2: TPanel;
    pnlBtnCadastar: TPanel;
    Shape10: TShape;
    lblButtonCadastrar: TLabel;
    pnlBtnEditar: TPanel;
    Shape14: TShape;
    lblButtonEditar: TLabel;
    lswTransp: TListView;
    procedure lblButtonCadastrarClick(Sender: TObject);
    procedure btnchangeCadastrarClick(Sender: TObject);
    procedure voltarImageClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnEditarTranspClick(Sender: TObject);
    procedure btrnExcluirTranspClick(Sender: TObject);
    procedure lblButtonEditarClick(Sender: TObject);

  private
    { Private declarations }
    procedure atualizarTabela;
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

  if lswTransp.selected = nil then begin
    showMessage('selecione uma transportadora na lista para editar.');
    exit;
  end else begin
    edtNome.text := lswTransp.selected.subItems[0];
    maskEditCnpj.text := lswTransp.selected.SubItems[1];
    maskEditTelefone.Text := lswTransp.selected.subItems[2];
    edtEmail.Text := lswTransp.selected.subItems[3];
    maskEditCep.text := lswTransp.selected.SubItems[4];
  end;

end;

procedure TFormLogin.btnEntrarClick(Sender: TObject);
var
ATransp : TTransportadora;
controlTransp : TTranspController;
controlLogin : TloginController;
user : Tusuario;
resultado : TLoginResult;
ListaTransp: TObjectList<TTransportadora>;
Item: TListItem;
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
            // Aqui vai abrir a home de usuario
            Close;
          end;

        lrSucessoAdmin:
          begin
            ShowMessage('Bem-vindo ADMINISTRADOR!');
              Panel1.Visible := False;
              PanelAdmin.Visible := True;
              atualizarTabela;
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
var
controller: TTranspController;
Transp: TTransportadora;
codParaExcluir : integer;
begin
  transp := TTransportadora.create;
  codParaExcluir := StrToInt(lswTransp.Selected.Caption);
  transp.setId(codParaExcluir);

  controller := TTranspController.Create;
  try
    controller.ExcluirTransportadora(Transp);
    ShowMessage('Transportadora excluida!!');
    atualizarTabela;
  finally
    controller.free
  end;
  transp.free;

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
      PanelOptionsTransp.Visible:=false;
      atualizarTabela;
    finally
      Controller.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
    Transp.Free;
end;



procedure TFormLogin.lblButtonEditarClick(Sender: TObject);
var
controller : TtranspController;
transp : TTransportadora;
codParaEditar : integer;
begin
  codParaEditar := StrToInt(lswTransp.Selected.Caption);
  transp := TTransportadora.create;
  try
    Transp.setId(codParaEditar);
    Transp.setNome(edtNome.Text);
    Transp.setCNPJ(MaskEditCNPJ.Text);
    Transp.setTelefone(MaskEditTelefone.Text);
    Transp.setEmail(edtEmail.Text);
    Transp.setCep(MaskEditCEP.Text);

    controller := TTranspController.create;
    try
      controller.EditarTranportadora(Transp);
      showMessage('Transportadora editada com sucesso!!');
    finally
      controller.free;
    end;
  finally
    transp.free;
    PanelOptionsTransp.Visible:=false;
  end;
end;

procedure TFormLogin.voltarImageClick(Sender: TObject);
begin
  PanelOptionsTransp.Visible:=false;
end;

procedure TFormLogin.atualizarTabela;
var
  controlTransp: TTranspController;
  ListaTransp: TObjectList<TTransportadora>;
  Transp: TTransportadora;
  Item: TListItem;
begin
  controlTransp := TTranspController.Create;
  try
    ListaTransp := controlTransp.atualizarTabela;
    try
      lswTransp.Items.Clear;

      for Transp in ListaTransp do
      begin
        Item := lswTransp.Items.Add;
        Item.Caption := Transp.getId.ToString;
        Item.SubItems.Add(Transp.getNome);
        Item.SubItems.Add(Transp.getCNPJ);
        Item.SubItems.Add(Transp.getTelefone);
        Item.SubItems.Add(Transp.getEmail);
        Item.SubItems.Add(Transp.getCep);
      end;

    finally
      ListaTransp.Free;
    end;
  finally
    controlTransp.Free;
  end;
end;

procedure TFormLogin.btnchangeCadastrarClick(Sender: TObject);
begin
  PanelOptionsTransp.Visible:=true;
  lblPanelOption.Caption := 'Cadastrar Transportadora';
  pnlBtnCadastar.Visible := true;
  pnlBtnEditar.Visible := false;
end;



end.
