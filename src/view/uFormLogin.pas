unit uFormLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, transpController, uTransportadora, uUsuario,loginController,
  Vcl.ComCtrls,System.Generics.Collections, LoginDto, System.ImageList,
  Vcl.ImgList, adminController, adminDto;

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
    imgVoltarAdm: TImage;
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
    imgTransp: TImage;
    Label1: TLabel;
    pnlVoltarMenuAdmin: TPanel;
    Shape34: TShape;
    imgVoltarMenuAdmin: TImage;
    pnlVoltarMenuAdminTr: TPanel;
    Shape35: TShape;
    ImgVoltarMenuAdminTr: TImage;
    pnlButtonChoseAdmin: TPanel;
    Shape33: TShape;
    ImgAdmin: TImage;
    Label2: TLabel;
    procedure lick(Sender: TObject);
    procedure btnchangeCadastrarClick(Sender: TObject);
    procedure voltarImageClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnEditarTranspClick(Sender: TObject);
    procedure btrnExcluirTranspClick(Sender: TObject);
    procedure lblButtonEditarClick(Sender: TObject);
    procedure ick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ImgAdminClick(Sender: TObject);
    procedure imgTranspClick(Sender: TObject);
    procedure imgVoltarMenuAdminClick(Sender: TObject);
    procedure ImgVoltarMenuAdminTrClick(Sender: TObject);
    procedure lblBtnCadastrarAdminClick(Sender: TObject);
    procedure lblBtnCadastrarAdmClick(Sender: TObject);
    procedure imgVoltarAdmClick(Sender: TObject);
    procedure lblBtnExcluirAdminClick(Sender: TObject);
    procedure lblBtnExcluirAdmConfirmClick(Sender: TObject);
    procedure lblBtnRecuperarAdminClick(Sender: TObject);
    procedure lblBtnRecuperarAdmConfirmClick(Sender: TObject);
    procedure lblBtnEditarAdminClick(Sender: TObject);
    procedure lblBtnEditarAdmClick(Sender: TObject);

  private
    { Private declarations }
    procedure mostrarAdmins;
    procedure atualizarTabela;
    procedure tabelaInativo;
    procedure AdminsInativo;
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
controlLogin : TloginController;
user : Tusuario;
resultado : TLoginResult;

LoginDto:TLoginDto;
begin
  controlLogin := nil;
  user := nil;
  try
    LoginDto.email:=edtEmailLogin.text;
    LoginDto.Senha:=edtSenhaLogin.text;

    controlLogin := TloginController.Create;
    try
      resultado := controlLogin.verificaLogin(LoginDto,user);
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
              mostrarAdmins;
          end;
      end;
    finally
      controlLogin.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;
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

procedure TFormLogin.ick(Sender: TObject);
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

procedure TFormLogin.imgVoltarMenuAdminClick(Sender: TObject);
begin
  panelForAdmins.Visible:= false;
  pnlButtonChoseAdmin.Visible:= true;
  pnlButtonChoseTransp.Visible:= true;
end;

procedure TFormLogin.ImgVoltarMenuAdminTrClick(Sender: TObject);
begin
  panelForTransp.Visible:= false;
  pnlButtonChoseAdmin.Visible:= true;
  pnlButtonChoseTransp.Visible:= true;
end;

procedure TFormLogin.imgVoltarAdmClick(Sender: TObject);
begin
 panelOptionsAdmins.Visible := false;
end;

procedure TFormLogin.ImgAdminClick(Sender: TObject);
begin
  panelForAdmins.Visible:= true;
  pnlButtonChoseAdmin.Visible:= false;
  pnlButtonChoseTransp.Visible:= false;
end;

procedure TFormLogin.imgTranspClick(Sender: TObject);
begin
  panelForTransp.Visible:= true;
  pnlButtonChoseAdmin.Visible:= false;
  pnlButtonChoseTransp.Visible:= false;
end;

procedure TFormLogin.lblBtnCadastrarAdmClick(Sender: TObject);
var
idTransp:String;
controller : TadminController;
adminDto : TadminDto;
begin
  adminDto.nome := EditNomeAdm.Text;
  adminDto.cpf := maskEditCpfAdm.text;
  adminDto.telefone := maskEditTelefoneAdm.text;
  adminDto.email := editEmailAdm.Text;
  adminDto.senha := editSenhaAdm.text;

  idTransp := cbTransp4admin.Text;
  idTransp := idTRansp.Remove(idTransp.IndexOf('-')-1);

  AdminDto.idTransportadora := StrToIntDef(idTransp, 0);

  controller := TadminController.Create;
  try
    controller.cadastrarAdmin(adminDto);
    ShowMessage('Admnistrador criado com sucesso!');
    paneloptionsAdmins.visible := false;
    mostrarAdmins;
  finally
    controller.Free;
  end;

  EditNomeAdm.Clear;
  maskEditCpfAdm.Clear;
  maskEditTelefoneAdm.clear;
  editEmailAdm.clear;
  editSenhaAdm.clear;
end;

procedure TFormLogin.lblBtnCadastrarAdminClick(Sender: TObject);
var
  Controller: TTranspController;
  Lista: TObjectList<TTransportadora>;
  Transp: TTransportadora;
begin
  paneloptionsAdmins.Visible := True;

  Controller := TTranspController.Create;
  try
    Lista := Controller.atualizarTabela;
    try
      cbTransp4Admin.Items.Clear;

      for Transp in Lista do
        cbTransp4Admin.Items.Add(
          Transp.getId.ToString + ' - ' + Transp.getNome
        );
    finally
      Lista.Free;
    end;
  finally
    Controller.Free;
  end;
end;

procedure TFormLogin.lblBtnEditarAdmClick(Sender: TObject);
var
controller : TadminController;
adminDto : TadminDto;
codParaEditar : integer;
idTransp:String;
begin
  codParaEditar := StrToInt(lswAdmins.Selected.Caption);
  try
    adminDto.idAdmin := codParaEditar;
    adminDto.nome := EditNomeAdm.Text;
    adminDto.cpf := maskEditCpfAdm.text;
    adminDto.telefone := maskEditTelefoneAdm.text;
    adminDto.email := editEmailAdm.Text;
    adminDto.senha := editSenhaAdm.text;

    idTransp := cbTransp4admin.Text;
    idTransp := idTRansp.Remove(idTransp.IndexOf('-')-1);

    AdminDto.idTransportadora := StrToIntDef(idTransp, 0);

    controller := TadminController.create;
    try
      controller.EditarAdmin(adminDto);
      showMessage('administrador editado com sucesso!!');
      mostrarAdmins;
    finally
      controller.free;
    end;
  finally
    PanelOptionsTransp.Visible:=false;
    edtNome.clear;
    maskEditCnpj.clear;
    maskEditTelefone.clear;
    edtEmail.clear;
    maskEditCep.clear;
  end;
end;

procedure TFormLogin.lblBtnEditarAdminClick(Sender: TObject);
var
  Controller: TTranspController;
  Lista: TObjectList<TTransportadora>;
  Transp: TTransportadora;
begin
  panelOptionsAdmins.Visible:=true;
  lblPanelOptionAdm.Caption := 'Editar administrador de transportadoras';
  pnlBtnCadastrarAdm.visible:= false;
  pnlEditarAdm.Visible := true;
  pnlBtnRecuperarAdmConfirm.Visible := False;
  pnlBtnExcluirAdminConfirm.Visible := false;

    if lswAdmins.selected = nil then begin
    showMessage('selecione um administrador na lista para editar.');
    mostrarAdmins;
    exit;
    end;

  Controller := TTranspController.Create;
  try
    Lista := Controller.atualizarTabela;
    try
      cbTransp4Admin.Items.Clear;

      for Transp in Lista do
        cbTransp4Admin.Items.Add(
          Transp.getId.ToString + ' - ' + Transp.getNome
        );
    finally
      Lista.Free;
    end;
  finally
    Controller.Free;
  end;

    EditNomeAdm.text := lswAdmins.selected.subItems[0];
    MaskEditCpfAdm.text := lswAdmins.selected.SubItems[1];
    MaskEditTelefoneAdm.Text := lswAdmins.selected.subItems[3];
    editEmailAdm.Text := lswAdmins.selected.subItems[4];
  end;

procedure TFormLogin.lblBtnExcluirAdmConfirmClick(Sender: TObject);
var
controller: TadminController;
admin: TadminDto;
codParaExcluir : integer;
begin

  if lswAdmins.selected = nil then begin
    showMessage('selecione um Administrador na lista para Excluir.');
    MostrarAdmins;
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o administrador selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

    codParaExcluir := StrToInt(lswAdmins.Selected.Caption);
    admin.idAdmin := codParaExcluir;

    controller := TadminController.Create;
    try
      controller.ExcluirAdmin(admin);
      ShowMessage('Administrador excluido!!');
      MostrarAdmins;
    finally
      controller.free
    end;
end;

procedure TFormLogin.lblBtnExcluirAdminClick(Sender: TObject);
begin
  pnlBtnExcluirAdminConfirm.Visible := true;
  pnlBtnRecuperarAdmConfirm.visible := false;
  mostrarAdmins;
end;

procedure TFormLogin.lblBtnRecuperarAdmConfirmClick(Sender: TObject);
var
controller: TadminController;
admin: TadminDto;
codParaRecuperar : integer;
begin
    if lswAdmins.selected = nil then begin
    showMessage('selecione um administrador na lista para Recuperar.');
    exit;
  end else begin

    codParaRecuperar := StrToInt(lswAdmins.Selected.Caption);
    admin.idAdmin := codParaRecuperar;

    controller := TadminController.create;
    try
      controller.recuperarAdmin(admin);
      ShowMessage('administrador recuperado!!');
      adminsInativo;
    finally
      controller.free;
      pnlBtnRecuperarConfirm.Visible := False;
    end;
  end;
end;

procedure TFormLogin.lblBtnRecuperarAdminClick(Sender: TObject);
var
controller : TadminController;
begin
  pnlBtnExcluirAdminConfirm.Visible := False;
  pnlBtnRecuperarAdmConfirm.visible := true;
  lswAdmins.Items.Clear;

  controller := TadminController.Create;
  try
    ShowMessage('Agora a tabela mostra os administradores excluidos, Selecione o administrador e clique em recuperar para reativa-lo');
    AdminsInativo;
  finally
    controller.free;
  end;
end;

procedure TFormLogin.lick(Sender: TObject);
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



procedure TFormLogin.mostrarAdmins;
var
  controlAdmin: TadminController;
  ListaAdmin: TList<TadminDto>;
  AdminDto: TadminDto;
  Item: TListItem;
begin
  controlAdmin := TadminController.Create;
  try
    ListaAdmin := controlAdmin.MostrarAdmin;
    try
      lswAdmins.Items.Clear;

      for AdminDto in ListaAdmin do
      begin
        Item := lswAdmins.Items.Add;
        Item.Caption := AdminDto.idAdmin.ToString;
        Item.SubItems.Add(adminDto.nome);
        Item.SubItems.Add(adminDto.cpf);
        Item.SubItems.Add(adminDto.idTransportadora.ToString);
        Item.SubItems.Add(AdminDto.telefone);
        Item.SubItems.Add(adminDto.email);
      end;

    finally
      listaAdmin.Free
    end;
  finally
    controlAdmin.Free;
  end;
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

procedure TFormLogin.AdminsInativo;
var
  controladmin: TadminController;
  ListaAdmin: Tlist<TadminDto>;
  adminDto: TadminDto;
  Item: TListItem;
begin
  controlAdmin := TadminController.Create;
  try
    ListaAdmin := controlAdmin.AdminInativo;
    try
      lswAdmins.Items.Clear;

      for adminDto in ListaAdmin do
      begin
        Item := lswAdmins.Items.Add;
        Item.Caption := AdminDto.idAdmin.ToString;
        Item.SubItems.Add(adminDto.nome);
        Item.SubItems.Add(adminDto.cpf);
        Item.SubItems.Add(adminDto.idTransportadora.ToString);
        Item.SubItems.Add(AdminDto.telefone);
        Item.SubItems.Add(adminDto.email);
      end;

    finally
      ListaAdmin.Free;
    end;
  finally
    controlAdmin.Free;
  end;
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
