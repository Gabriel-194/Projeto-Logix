unit uFormLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, transpController, uTransportadora, uUsuario,loginController,
  Vcl.ComCtrls,System.Generics.Collections, LoginDto, System.ImageList,
  Vcl.ImgList;

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
    panelForTransp: TPanel;
    PanelButtons: TPanel;
    PnlBtnEditarTransp: TPanel;
    Shape13: TShape;
    btnEditarTransp: TLabel;
    pnlBtnChangeCadastrar: TPanel;
    Shape5: TShape;
    btnchangeCadastrar: TLabel;
    lswTransp: TListView;
    pnlBtnExcluirTransp: TPanel;
    Shape12: TShape;
    btrnExcluirTransp: TLabel;
    pnlBtnrecuperar: TPanel;
    Shape15: TShape;
    btnRecuperarTransp: TLabel;
    pnlBtnRecuperarConfirm: TPanel;
    Shape16: TShape;
    btnRecuperar: TLabel;
    pnlBtnExcluirConfirm: TPanel;
    Shape17: TShape;
    btnExcluir: TLabel;
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
    Panel2: TPanel;
    pnlBtnCadastar: TPanel;
    Shape10: TShape;
    lblButtonCadastrar: TLabel;
    pnlBtnEditar: TPanel;
    Shape14: TShape;
    lblButtonEditar: TLabel;
    PanelForADMINS: TPanel;
    PanelButtonAdms: TPanel;
    pnlBtnEditarAdmin: TPanel;
    Shape18: TShape;
    lblBtnEditarAdmin: TLabel;
    pnlBtnCadastrarAdmin: TPanel;
    Shape19: TShape;
    lblBtnCadastrarAdmin: TLabel;
    lswAdmins: TListView;
    pnlBtnExcluirAdmin: TPanel;
    Shape20: TShape;
    lblBtnExcluirAdmin: TLabel;
    pnlBtnRecuperarAdmin: TPanel;
    Shape21: TShape;
    lblBtnRecuperarAdmin: TLabel;
    pnlBtnRecuperarAdmConfirm: TPanel;
    Shape22: TShape;
    lblBtnRecuperarAdmConfirm: TLabel;
    pnlBtnExcluirAdminConfirm: TPanel;
    Shape23: TShape;
    lblBtnExcluirAdmConfirm: TLabel;
    panelOptionsAdmins: TPanel;
    lblPanelOptionAdm: TLabel;
    Panel17: TPanel;
    pnlEditNomeAdm: TPanel;
    Shape24: TShape;
    EditNomeAdm: TEdit;
    pnlEditCpfAdm: TPanel;
    Shape25: TShape;
    MaskEditCpfAdm: TMaskEdit;
    Panel20: TPanel;
    Label13: TLabel;
    Panel21: TPanel;
    Panel23: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Panel24: TPanel;
    pnlEditTelefoneAdm: TPanel;
    Shape27: TShape;
    MaskEditTelefoneAdm: TMaskEdit;
    pnlEditEmailAdm: TPanel;
    Shape28: TShape;
    editEmailAdm: TEdit;
    Panel27: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Panel28: TPanel;
    Shape29: TShape;
    Image3: TImage;
    Panel29: TPanel;
    pnlBtnCadastrarAdm: TPanel;
    Shape30: TShape;
    lblBtnCadastrarAdm: TLabel;
    pnlEditarAdm: TPanel;
    Shape31: TShape;
    lblBtnEditarAdm: TLabel;
    cbTransp4Admin: TComboBox;
    pnlEditSenhaAdm: TPanel;
    Shape26: TShape;
    EditSenhaAdm: TEdit;
    pnlButtonChoseTransp: TPanel;
    Shape32: TShape;
    Image5: TImage;
    Label1: TLabel;
    pnlButtonChoseAdmin: TPanel;
    Shape33: TShape;
    Image6: TImage;
    Label2: TLabel;
    procedure lblButtonCadastrarClick(Sender: TObject);
    procedure btnchangeCadastrarClick(Sender: TObject);
    procedure voltarImageClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnEditarTranspClick(Sender: TObject);
    procedure btrnExcluirTranspClick(Sender: TObject);
    procedure lblButtonEditarClick(Sender: TObject);
    procedure btnRecuperarTranspClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure pnlButtonChoseAdminClick(Sender: TObject);
    procedure pnlButtonChoseTranspClick(Sender: TObject);

  private
    { Private declarations }
    procedure atualizarTabela;
    procedure tabelaInativo;
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
  pnlBtnRecuperarConfirm.Visible := False;
  pnlBtnExcluirConfirm.Visible := false;

    if lswTransp.selected = nil then begin
    showMessage('selecione uma transportadora na lista para editar.');
    atualizarTabela;
    exit;
    end;

      edtNome.text := lswTransp.selected.subItems[0];
      maskEditCnpj.text := lswTransp.selected.SubItems[1];
      maskEditTelefone.Text := lswTransp.selected.subItems[2];
      edtEmail.Text := lswTransp.selected.subItems[3];
      maskEditCep.text := lswTransp.selected.SubItems[4];


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
LoginDto:TLoginDto;
begin
  try
    LoginDto.email:=edtEmailLogin.text;
    LoginDto.Senha:=edtSenhaLogin.text;

    controlLogin := TloginController.Create;
    try
      resultado := controlLogin.verificaLogin(LoginDto);
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

procedure TFormLogin.btnExcluirClick(Sender: TObject);
var
controller: TTranspController;
Transp: TTransportadora;
codParaExcluir : integer;
begin

  if lswTransp.selected = nil then begin
    showMessage('selecione uma transportadora na lista para Excluir.');
    atualizarTabela;
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir a transportadora selecionada?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

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

procedure TFormLogin.btnRecuperarClick(Sender: TObject);
var
controller: TTranspController;
Transp: TTransportadora;
codParaRecuperar : integer;
begin
    if lswTransp.selected = nil then begin
    showMessage('selecione uma transportadora na lista para Recuperar.');
    exit;
  end else begin

    transp := TTransportadora.Create;
    codParaRecuperar := StrToInt(lswTransp.Selected.Caption);
    transp.setId(codParaRecuperar);

    controller := TTranspController.create;
    try
      controller.recuperarTransportadora(Transp);
      ShowMessage('Transportadora recuperada!!');
      tabelaInativo;
    finally
      controller.free;
      pnlBtnRecuperarConfirm.Visible := False;
    end;
  end;
end;

procedure TFormLogin.btnRecuperarTranspClick(Sender: TObject);
var
controller: TTranspController;
codParaRecuperar:Integer;
begin
  lswTransp.Items.Clear;
  pnlBtnRecuperarConfirm.Visible := True;
  pnlBtnExcluirConfirm.Visible := false;
  controller := TTranspController.Create;
  try
    ShowMessage('Agora a tabela mostra as transportadoras excluidas, Selecione a transportadora desejada e clique em recuperar para reativa-la');
    tabelaInativo;
  finally
    controller.free;
  end;
end;

procedure TFormLogin.btrnExcluirTranspClick(Sender: TObject);
begin
  pnlBtnRecuperarConfirm.Visible := False;
  pnlBtnExcluirConfirm.Visible := true;
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
      edtNome.clear;
      maskEditCnpj.clear;
      maskEditTelefone.clear;
      edtEmail.clear;
      maskEditCep.clear;
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
    edtNome.clear;
    maskEditCnpj.clear;
    maskEditTelefone.clear;
    edtEmail.clear;
    maskEditCep.clear;
  end;
end;

procedure TFormLogin.pnlButtonChoseAdminClick(Sender: TObject);
begin
  panelForAdmins.Visible:= true;
  pnlButtonChoseAdmin.Visible:= false;
  pnlButtonChoseTransp.Visible:= false;
end;

procedure TFormLogin.pnlButtonChoseTranspClick(Sender: TObject);
begin
  panelForTransp.Visible:= true;
  pnlButtonChoseAdmin.Visible:= false;
  pnlButtonChoseTransp.Visible:= false;
end;

procedure TFormLogin.tabelaInativo;
var
  controlTransp: TTranspController;
  ListaTransp: TObjectList<TTransportadora>;
  Transp: TTransportadora;
  Item: TListItem;
begin
  controlTransp := TTranspController.Create;
  try
    ListaTransp := controlTransp.tabelaInativo;
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
  atualizarTabela;
  pnlBtnRecuperarConfirm.Visible := False;
  pnlBtnExcluirConfirm.Visible := false;
end;



end.
