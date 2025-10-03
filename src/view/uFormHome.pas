unit uFormHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, usuarioLogado,uUsuario,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Datasnap.DBClient, homeController,system.Generics.Collections,motoristaDto;

type
  TFormHome = class(TForm)
    PanelHeader: TPanel;
    lblLogix: TLabel;
    Image1: TImage;
    PanelPermissoes: TPanel;
    Shape1: TShape;
    lblPermissoesbtn: TLabel;
    PanelClientes: TPanel;
    Shape5: TShape;
    lblClientesBtn: TLabel;
    pnlCadastros: TPanel;
    Shape6: TShape;
    lblCadastrosBtn: TLabel;
    pnlDashboard: TPanel;
    veiculosCadastrados: TPanel;
    Shape7: TShape;
    lblDashBoards: TLabel;
    Image2: TImage;
    Label4: TLabel;
    contadorVeiculos: TLabel;
    pedidosFeitos: TPanel;
    Shape8: TShape;
    Image3: TImage;
    Label5: TLabel;
    lblCountPedidos: TLabel;
    clientesCadastrados: TPanel;
    Shape9: TShape;
    Image4: TImage;
    Label7: TLabel;
    lblCountCliente: TLabel;
    gerentesCadastrados: TPanel;
    Shape10: TShape;
    Image5: TImage;
    Label9: TLabel;
    lblCountGerente: TLabel;
    carregadoresCadastrados: TPanel;
    Shape11: TShape;
    Image6: TImage;
    Label11: TLabel;
    lblCountCarregador: TLabel;
    motoristasCadastrados: TPanel;
    Shape12: TShape;
    Image7: TImage;
    Label13: TLabel;
    lblCountMotorista: TLabel;
    Image8: TImage;
    PageControlCadastrar: TPageControl;
    TabSheetGerente: TTabSheet;
    PanelButtonGerentes: TPanel;
    imgFecharPageControl: TImage;
    pnlBtnEditarGerente: TPanel;
    Shape18: TShape;
    lblBtnEditarGerente: TLabel;
    pnlBtnCadastrarGerente: TPanel;
    Shape19: TShape;
    lblBtnCadastrarGerente: TLabel;
    lswGerente: TListView;
    pnlBtnExcluirGerente: TPanel;
    Shape20: TShape;
    lblBtnExcluirGerente: TLabel;
    pnlBtnRecuperarGerente: TPanel;
    Shape21: TShape;
    lblBtnRecuperarGerente: TLabel;
    pnlBtnRecuperarGerenteConfirm: TPanel;
    Shape22: TShape;
    lblBtnRecuperaGerenteConfirm: TLabel;
    pnlBtnExcluirGerenteConfirm: TPanel;
    Shape23: TShape;
    lblBtnExcluirGerenteConfirm: TLabel;
    panelOptionsGerente: TPanel;
    lblPanelOptionGerente: TLabel;
    Panel17: TPanel;
    pnlEditNomeGerente: TPanel;
    Shape24: TShape;
    EditNomeGerente: TEdit;
    pnlEditCpfGerente: TPanel;
    Shape25: TShape;
    MaskEditCpfGerente: TMaskEdit;
    Panel20: TPanel;
    Label1: TLabel;
    Panel21: TPanel;
    pnlEditSenhaGerente: TPanel;
    Shape26: TShape;
    EditSenhaGerente: TEdit;
    Panel23: TPanel;
    Label2: TLabel;
    Label15: TLabel;
    Panel24: TPanel;
    pnlEditTelefoneGerente: TPanel;
    Shape27: TShape;
    MaskEditTelefoneGerente: TMaskEdit;
    pnlEditEmailGerente: TPanel;
    Shape28: TShape;
    editEmailGerente: TEdit;
    Panel27: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Panel29: TPanel;
    pnlCadastrarGerente: TPanel;
    Shape30: TShape;
    lblBtnCadastrarGerenteConf: TLabel;
    pnlEditarGerente: TPanel;
    Shape31: TShape;
    lblBtnEditarGerenteConf: TLabel;
    panelFechaOptionsGerente: TPanel;
    Shape43: TShape;
    imgBtnFechaOptionsGerente: TImage;
    TabSheetMotoristas: TTabSheet;
    PanelButtonMotoristas: TPanel;
    Image9: TImage;
    PnlBtnEditarMotorista: TPanel;
    Shape3: TShape;
    lblBtnEditarMotorista: TLabel;
    PnlBtnCadastrarMotoristas: TPanel;
    Shape4: TShape;
    LblBtnCadastrarMotorista: TLabel;
    pnlBtnExcluirMotorista: TPanel;
    Shape13: TShape;
    lblBtnExcluirMotorista: TLabel;
    pnlBtnRecuperarMotorista: TPanel;
    Shape14: TShape;
    lblBtnRecuperarMotorista: TLabel;
    pnlBtnRecuperarMototistaConf: TPanel;
    Shape15: TShape;
    lblBtnRecuperarMotoristaConf: TLabel;
    pnlBtnExcluirMotoristaConf: TPanel;
    Shape16: TShape;
    lblBtnExcluirMotoristaConf: TLabel;
    PanelOptionsMotoristas: TPanel;
    Panel15: TPanel;
    pnlEdtNomeMotorista: TPanel;
    Shape32: TShape;
    edtNomeMotorista: TEdit;
    pnlEdtCpfMotorista: TPanel;
    Shape33: TShape;
    MaskEditCpfMotorista: TMaskEdit;
    Panel22: TPanel;
    pnlEdtSenhaMotorista: TPanel;
    Shape34: TShape;
    EdtSenhaMotorista: TEdit;
    pnlEdtCategoriaCnh: TPanel;
    Shape42: TShape;
    edtCategoriaCnh: TEdit;
    Panel26: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Panel30: TPanel;
    pnlEdtTelefoneMotorista: TPanel;
    Shape35: TShape;
    MaskEditTelefoneMotorista: TMaskEdit;
    pnlBtnEmailMotorista: TPanel;
    Shape36: TShape;
    EdtEmailMotorista: TEdit;
    Panel33: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    pnlFechaOptionsMotorista: TPanel;
    Shape37: TShape;
    ImgFechaOptionsMotorista: TImage;
    Panel35: TPanel;
    pnlBtnCadastrarMotoristaConf: TPanel;
    Shape38: TShape;
    lblBtnCadastrarMotoristaConf: TLabel;
    pnlBtnEditarMotoristaConf: TPanel;
    Shape39: TShape;
    lblBtnEditarMotoristaConf: TLabel;
    Panel1: TPanel;
    lblNumeroCnh: TLabel;
    lblValidadeCnh: TLabel;
    Panel2: TPanel;
    pblEdtNumCnh: TPanel;
    Shape40: TShape;
    edtNumCnh: TEdit;
    pnlEdtValidadeCnh: TPanel;
    Shape41: TShape;
    MaskEditValidadeCnh: TMaskEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label18: TLabel;
    TabSheetCarregador: TTabSheet;
    PanelButtonsCarregador: TPanel;
    ImgFechaPageCoontrolCadastrar: TImage;
    pnlBtnEditarCarregador: TPanel;
    Shape44: TShape;
    lblBtnEditarCarregador: TLabel;
    PnlBtnCadastrarCarregador: TPanel;
    Shape45: TShape;
    lblBtnCadastrarCarregador: TLabel;
    lswCarregador: TListView;
    pnlBtnExcluirCarregador: TPanel;
    Shape46: TShape;
    lblBtnExcluirCarregador: TLabel;
    pnlBtnRecuparCarregador: TPanel;
    Shape47: TShape;
    lblBtnRecuperarCarregador: TLabel;
    pnlBtnRecuperarCarregadorConf: TPanel;
    Shape48: TShape;
    lblBtnRecuperarCarregadorConf: TLabel;
    pnlBtnExcluirCarregadorConf: TPanel;
    Shape49: TShape;
    lblBtnExcluirCarregadorConf: TLabel;
    panelOptionsCarregador: TPanel;
    lblOptionsCarregadores: TLabel;
    Panel11: TPanel;
    pnlEdtNomeCarregador: TPanel;
    Shape51: TShape;
    edtNomeCarregador: TEdit;
    pnlEdtCpfCarregador: TPanel;
    Shape52: TShape;
    MaskEditCpfCarregador: TMaskEdit;
    Panel14: TPanel;
    Label20: TLabel;
    Panel16: TPanel;
    PnlEdtSenhaCarregador: TPanel;
    Shape53: TShape;
    EdtSenhaCarregador: TEdit;
    Panel19: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Panel25: TPanel;
    pnlEdtTelefoneCarregador: TPanel;
    Shape54: TShape;
    MaskEditTelefoneCarregador: TMaskEdit;
    PnlEdtEmailCarregador: TPanel;
    Shape55: TShape;
    edtEmailCarregador: TEdit;
    Panel34: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Panel37: TPanel;
    pnlBtnCadastrarCarregadorConf: TPanel;
    Shape57: TShape;
    lblBtnCadastrarCarregadorConf: TLabel;
    pnlBtnEditarCarregadorConf: TPanel;
    Shape58: TShape;
    lblBtnEditarCarregadorConf: TLabel;
    pnlImgFecharOptionsCarregador: TPanel;
    Shape59: TShape;
    imgFecharOptionCarregador: TImage;
    TabSheetVeiculos: TTabSheet;
    panelButtonVeiculos: TPanel;
    imgFechaPageControl: TImage;
    pnlbtnEditarVeiculo: TPanel;
    Shape56: TShape;
    lblBtnEditarVeiculo: TLabel;
    pnlBtnCadastrarVeiculo: TPanel;
    Shape60: TShape;
    lblBtnCadastrarVeiculo: TLabel;
    lswVeiculos: TListView;
    pnlBtnExcluirVeiculo: TPanel;
    Shape61: TShape;
    lblBtnExcluirVeiculo: TLabel;
    pnlBtnRecuperarVeiculo: TPanel;
    Shape62: TShape;
    lblBtnRecuperarVeiculo: TLabel;
    pnlBtnRecuperarVeiculoConf: TPanel;
    Shape63: TShape;
    lblBtnRecuperarVeiculoConf: TLabel;
    pnlBtnExcluirVeiculoConf: TPanel;
    Shape64: TShape;
    lblBtnExcluirVeiculoConf: TLabel;
    pnlOptionsVeiculo: TPanel;
    lblOptionsVeiculo: TLabel;
    Panel12: TPanel;
    pnlEdtModeloVeiculo: TPanel;
    Shape65: TShape;
    edtModeloVeiculo: TEdit;
    pnlEdtPlacaVeiculo: TPanel;
    Shape66: TShape;
    MaskEditPlacaVeiculo: TMaskEdit;
    Panel31: TPanel;
    Label25: TLabel;
    Panel32: TPanel;
    pnlEdtCapacidadeVeiculo: TPanel;
    Shape67: TShape;
    EdtCapacidadeVeiculo: TEdit;
    ComboBoxUnidadeMed: TComboBox;
    Panel38: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Panel39: TPanel;
    pnlEdtAnoVeiculo: TPanel;
    Shape68: TShape;
    MaskEditAnoVeiculo: TMaskEdit;
    pnlEdtTipoCargaVeiculo: TPanel;
    Shape69: TShape;
    EditTipoCargaVeiculo: TEdit;
    Panel42: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    Panel43: TPanel;
    pnlBtnCadastrarVeiculoConf: TPanel;
    Shape70: TShape;
    lblBtnCadastrarVeiculoConf: TLabel;
    pnlBtnEditarVeiculoConf: TPanel;
    Shape71: TShape;
    lblBtnEditarVeiculoConf: TLabel;
    PanelFechaOptionsVeiculo: TPanel;
    Shape72: TShape;
    imgFechaOptionsVeiculo: TImage;
    LswMotorista: TListView;
    procedure lblCadastrosBtnClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure lblBtnCadastrarGerenteClick(Sender: TObject);
    procedure lblBtnEditarGerenteClick(Sender: TObject);
    procedure imgFecharPageControlClick(Sender: TObject);
    procedure LblBtnCadastrarMotoristaClick(Sender: TObject);
    procedure lblBtnEditarMotoristaClick(Sender: TObject);
    procedure ImgFechaOptionsMotoristaClick(Sender: TObject);
    procedure imgBtnFechaOptionsGerenteClick(Sender: TObject);
    procedure lblBtnRecuperarMotoristaClick(Sender: TObject);
    procedure lblBtnExcluirMotoristaConfClick(Sender: TObject);
    procedure lblBtnRecuperarGerenteClick(Sender: TObject);
    procedure lblBtnExcluirGerenteClick(Sender: TObject);
    procedure pnlBtnRecuperarCarregadorConfClick(Sender: TObject);
    procedure lblBtnCadastrarCarregadorClick(Sender: TObject);
    procedure lblBtnEditarCarregadorClick(Sender: TObject);
    procedure imgFecharOptionCarregadorClick(Sender: TObject);
    procedure lblBtnRecuperarCarregadorClick(Sender: TObject);
    procedure lblBtnExcluirCarregadorClick(Sender: TObject);
    procedure lblBtnCadastrarVeiculoClick(Sender: TObject);
    procedure lblBtnEditarVeiculoClick(Sender: TObject);
    procedure imgFechaOptionsVeiculoClick(Sender: TObject);
    procedure lblBtnRecuperarVeiculoClick(Sender: TObject);
    procedure lblBtnExcluirVeiculoClick(Sender: TObject);
    procedure lblBtnCadastrarGerenteConfClick(Sender: TObject);
    procedure mostrarUser(const aCargo: string; aListView: TListView);
    procedure MostrarUserInativo(const aCargo: string; aListView: TListView);
    procedure lblBtnEditarGerenteConfClick(Sender: TObject);
    procedure lblBtnExcluirGerenteConfirmClick(Sender: TObject);
    procedure lblBtnRecuperaGerenteConfirmClick(Sender: TObject);
    procedure PageControlCadastrarChange(Sender: TObject);
    procedure AtualizarDashboards;
    procedure FormShow(Sender: TObject);
    procedure lblBtnCadastrarCarregadorConfClick(Sender: TObject);
    procedure lblBtnEditarCarregadorConfClick(Sender: TObject);
    procedure lblBtnExcluirCarregadorConfClick(Sender: TObject);
    procedure lblBtnRecuperarCarregadorConfClick(Sender: TObject);
    procedure lblBtnCadastrarMotoristaConfClick(Sender: TObject);
    procedure MostrarMotorista;
    procedure lblBtnExcluirMotoristaClick(Sender: TObject);
    procedure lblBtnRecuperarMotoristaConfClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

// procedure de atualizar tabelas
procedure TFormHome.mostrarUser(const aCargo: string; aListView: TListView);
var
  controller: ThomeController;
  ListaUser: TObjectList<Tusuario>;
  user: Tusuario;
  Item: TListItem;
begin
  if not Assigned(aListView) then
    Exit;

  controller := ThomeController.Create;
  try

    ListaUser := controller.MostrarUser(aCargo);
    try
      aListView.Items.Clear;

      for user in ListaUser do
      begin
        Item := aListView.Items.Add;
        Item.Caption := user.getId.ToString;
        Item.SubItems.Add(user.getNome);
        Item.SubItems.Add(user.getCpf);
        Item.SubItems.Add(user.getIdTransportadora.ToString);
        Item.SubItems.Add(user.getTelefone);
        Item.SubItems.Add(user.getEmail);
        Item.SubItems.Add(user.getCargo_descricao);
      end;

    finally
      listaUser.Free;
    end;
  finally
    controller.Free;
  end;
end;
procedure TFormHome.PageControlCadastrarChange(Sender: TObject);
begin
  if PageControlCadastrar.ActivePage = TabSheetGerente then
  begin
    mostrarUser('gerente', lswGerente);
  end
  else if PageControlCadastrar.ActivePage = TabSheetCarregador then
  begin
    mostrarUser('Carregador', lswCarregador);
  end
  else if PageControlCadastrar.ActivePage = TabSheetMotoristas then
  begin
    MostrarMotorista;
  end;

end;

procedure TFormHome.mostrarUserInativo;
var
  controller: ThomeController;
  ListaUser: TObjectList<Tusuario>;
  user: Tusuario;
  Item: TListItem;
begin
  if not Assigned(aListView) then
    Exit;

  controller := ThomeController.Create;
  try

    ListaUser := controller.MostrarUserInativo(aCargo);
    try
      aListView.Items.Clear;

      for user in ListaUser do
      begin
        Item := aListView.Items.Add;
        Item.Caption := user.getId.ToString;
        Item.SubItems.Add(user.getNome);
        Item.SubItems.Add(user.getCpf);
        Item.SubItems.Add(user.getIdTransportadora.ToString);
        Item.SubItems.Add(user.getTelefone);
        Item.SubItems.Add(user.getEmail);
        Item.SubItems.Add(user.getCargo_descricao);
      end;

    finally
      listaUser.Free;
    end;
  finally
    controller.Free;
  end;
end;

procedure TFormHome.MostrarMotorista;
var
  controller: ThomeController;
  ListaMotorista: TList<TmotoristaDto>;
  motorista: TmotoristaDto;
  Item: TListItem;
begin
  controller := ThomeController.Create;
  try
    ListaMotorista := controller.mostrarMotorista;

    lswMotorista.Items.Clear;

    for motorista in ListaMotorista do
    begin
      Item := lswMotorista.Items.Add;
      Item.Caption := IntToStr(motorista.IdUsuario);
      Item.SubItems.Add(motorista.nome);
      Item.SubItems.Add(motorista.cpf);
      Item.SubItems.Add(IntToStr(motorista.idTransportadora));
      Item.SubItems.Add(motorista.telefone);
      Item.SubItems.Add(motorista.email);
      Item.SubItems.Add(motorista.cargo);
      Item.SubItems.Add(motorista.CategoriaCNH);
      Item.SubItems.Add(motorista.NumeroCNH);
      Item.SubItems.Add(DateToStr(motorista.ValidadeCNH));
    end;

  finally
    controller.Free;
  end;
end;

// ====================== on show form home ============================
procedure TFormHome.AtualizarDashboards;
var
  controller: THomeController;
begin
  controller := THomeController.Create;
  try
    // --- Contadores baseados em Cargos de Usuários ---
    lblCountGerente.Caption := controller.ContarUsuariosPorCargo('gerente').ToString;
    lblCountCarregador.Caption := controller.ContarUsuariosPorCargo('Carregador').ToString;
    lblCountMotorista.Caption := controller.ContarUsuariosPorCargo('motorista').ToString;

  finally
    controller.Free;
  end;
end;


procedure TFormHome.FormShow(Sender: TObject);
begin
  AtualizarDashboards;
end;



//============HEADER =====================================================
procedure TFormHome.lblCadastrosBtnClick(Sender: TObject);
begin
pagecontrolCadastrar.visible := true;
end;


//=================== GERENTE ============================================


procedure TFormHome.Image8Click(Sender: TObject);
begin
  close;
end;

procedure TFormHome.imgFecharPageControlClick(Sender: TObject);
begin
pagecontrolCadastrar.visible := False;
end;

procedure TFormHome.lblBtnCadastrarGerenteClick(Sender: TObject);
var
controller :ThomeController;
begin
panelOptionsGerente.Visible := true;
lblPanelOptionGerente.caption := 'Cadastrar Gerente';
pnlEditarGerente.visible := false;
pnlCadastrarGerente.visible := true;
pnlBtnRecuperarGerenteConfirm.visible := false;
pnlBtnExcluirGerenteConfirm.visible := false;
end;

procedure TFormHome.lblBtnCadastrarGerenteConfClick(Sender: TObject);
var
controller:THomeController;
usuario :Tusuario;
begin
usuario := TUsuario.Create;
  usuario.setNome(EditNomeGerente.Text);
  usuario.setEmail (editEmailGerente.text);
  usuario.setsenha_hash (EditSenhaGerente.text);
  usuario.Setcpf(MaskEditCpfGerente.Text);
  usuario.setTelefone (MaskEditTelefoneGerente.text);
  usuario.setCargo_descricao('gerente');
//  usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);
// jeito para teste ->
 usuario.SetIdTransportadora(1);



  controller := THomeController.Create;
  try
      controller.CadastrarUsuario(usuario);
      ShowMessage('Gerente cadastrado com sucesso!');
      mostrarUser('gerente',lswGerente);
      AtualizarDashboards;
    finally
      controller.Free;
  end;
    usuario.Free;
end;

procedure TFormHome.lblBtnEditarGerenteClick(Sender: TObject);
var
  Controller: ThomeController;
  Lista: TObjectList<Tusuario>;
begin
panelOptionsGerente.Visible := true;
pnlEditarGerente.visible := true;
pnlCadastrarGerente.visible := false;
lblPanelOptionGerente.caption := 'Editar Gerente';
pnlBtnRecuperarGerenteConfirm.visible := false;
pnlBtnExcluirGerenteConfirm.visible := false;

    if lswgerente.selected = nil then begin
    showMessage('selecione um gerente na lista para editar.');
    mostrarUser('gerente',lswGerente);
    exit;
    end;

    EditNomeGerente.text := lswGerente.selected.subItems[0];
    MaskEditCpfGerente.text := lswGerente.selected.SubItems[1];
    MaskEditTelefoneGerente.Text := lswGerente.selected.subItems[3];
    editEmailGerente.Text := lswGerente.selected.subItems[4];

end;


procedure TFormHome.lblBtnEditarGerenteConfClick(Sender: TObject);
var
controller : THomeController;
usuario : Tusuario;
codParaEditar : integer;
idTransp:String;
begin
  codParaEditar := StrToInt(lswGerente.Selected.Caption);
  try
    usuario := TUsuario.Create;
    usuario.setId(codParaEditar);
    usuario.setNome(EditNomeGerente.Text);
    usuario.setEmail (editEmailGerente.text);
    usuario.setsenha_hash (EditSenhaGerente.text);
    usuario.Setcpf(MaskEditCpfGerente.Text);
    usuario.setTelefone (MaskEditTelefoneGerente.text);
    usuario.setCargo_descricao('gerente');
    //  usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);
    // jeito para teste ->

    controller := ThomeController.create;
    try
      controller.EditarUser(usuario);
      showMessage('Gerente editado com sucesso!!');
      mostrarUser('gerente',lswGerente);
    finally
      controller.free;
    end;
  finally
    EditNomeGerente.clear;
    MaskEditCpfGerente.clear;
    editEmailGerente.clear;
    EditSenhaGerente.clear;
    MaskEditTelefoneGerente.clear;
  end;
end;

procedure TFormHome.ImgBtnFechaOptionsGerenteClick(Sender: TObject);
begin
panelOptionsGerente.Visible := false;
end;

procedure TFormHome.lblBtnRecuperarGerenteClick(Sender: TObject);
begin
pnlBtnRecuperarGerenteConfirm.visible := true;
pnlBtnExcluirGerenteConfirm.visible := false;

  showMessage('Agora a tabela ira mostrar os gerentes excluidos');
  MostrarUserInativo('gerente', lswGerente);
end;

procedure TFormHome.lblBtnExcluirGerenteClick(Sender: TObject);
begin
pnlBtnRecuperarGerenteConfirm.visible := false;
pnlBtnExcluirGerenteConfirm.visible := true;
mostrarUser('gerente',lswGerente);
end;

procedure TFormHome.lblBtnExcluirGerenteConfirmClick(Sender: TObject);
var
controller : THomeController;
user : Tusuario;
codParaExcluir: Integer;
begin
  if lswGerente.selected = nil then begin
    showMessage('selecione um gerente na lista para Excluir.');
    mostrarUser('gerente',lswGerente);
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o gerente selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaExcluir := StrToInt(lswGerente.Selected.Caption);
  user := Tusuario.create;
  user.setId(codParaExcluir);

  controller := THomeController.Create;
  try
    controller.excluirUser(user);
    showMessage('gerente excluido com sucesso.');
    mostrarUser('gerente',lswGerente);
    AtualizarDashboards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.lblBtnRecuperaGerenteConfirmClick(Sender: TObject);
var
controller : THomeController;
user : Tusuario;
codParaRecuperar: Integer;
begin
  if lswGerente.selected = nil then begin
    showMessage('selecione um gerente na lista para recuperar.');
    MostrarUserInativo('gerente', lswGerente);
    exit;
  end;

  if MessageDlg('Tem certeza que deseja recuperar o gerente selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaRecuperar := StrToInt(lswGerente.Selected.Caption);
  user := Tusuario.create;
  user.setId(codParaRecuperar);

  controller := THomeController.Create;
  try
    controller.recuperarUser(user);
    showMessage('gerente recuperado com sucesso.');
    MostrarUserInativo('gerente', lswGerente);
    AtualizarDashboards;
  finally
    controller.free;
  end;
end;

//======================= MOTORISTA ========================================
  procedure TFormHome.LblBtnCadastrarMotoristaClick(Sender: TObject);
begin
panelOptionsMotoristas.Visible := true;
pnlBtnCadastrarMotoristaConf.visible := true;
pnlBtnEditarMotoristaConf.Visible := false;
pnlBtnEditarMotoristaConf.Visible := false;
end;

procedure TFormHome.lblBtnEditarMotoristaClick(Sender: TObject);
begin
panelOptionsMotoristas.Visible := true;
pnlBtnCadastrarMotoristaConf.visible := false;
pnlBtnEditarMotoristaConf.Visible := true;
pnlBtnCadastrarMotoristaConf.visible := false;
pnlBtnEditarMotoristaConf.Visible := false;

MostrarMotorista;
end;

procedure TFormHome.lblBtnExcluirMotoristaClick(Sender: TObject);
begin
pnlBtnExcluirMotoristaConf.Visible := true;
end;

procedure TFormHome.lblBtnExcluirMotoristaConfClick(Sender: TObject);
var
controller : THomeController;
motorista : TmotoristaDto;
codParaExcluir: Integer;
begin
  if lswMotorista.selected = nil then begin
    showMessage('selecione um gerente na lista para Excluir.');
    mostrarMotorista;
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o gerente selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaExcluir := StrToInt(lswMotorista.Selected.Caption);
  motorista.IdUsuario := codParaExcluir;

  controller := THomeController.Create;
  try
    controller.excluirUser(motorista);
    showMessage('motorista excluido com sucesso.');
    mostrarMotorista;
    AtualizarDashboards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.lblBtnRecuperarMotoristaClick(Sender: TObject);
begin
  pnlBtnRecuperarMototistaConf.Visible:=true;
  pnlBtnExcluirMotoristaConf.visible := false;
end;

procedure TFormHome.lblBtnRecuperarMotoristaConfClick(Sender: TObject);
var
controller: ThomeController;
codParaEditar :Integer;
motorista:TmotoristaDto;
begin
if lswMotorista.selected = nil then begin
  showMessage('selecione um motorista na lista para recuperar');
end;
end;

procedure TFormHome.ImgFechaOptionsMotoristaClick(Sender: TObject);
begin
  panelOptionsMotoristas.Visible := false;
end;

procedure TFormHome.lblBtnCadastrarMotoristaConfClick(Sender: TObject);
var
controller:ThomeController;
motorista:TmotoristaDto;
begin
  motorista.Nome := edtNomeMotorista.text;
  motorista.cpf := MaskEditCpfMotorista.text;
  motorista.telefone := MaskEditTelefoneMotorista.text;
  motorista.Email := EdtEmailMotorista.text;
  motorista.senha := EdtSenhaMotorista.text;
  motorista.NumeroCNH := EdtNumCnh.text;
  motorista.CategoriaCNH := edtCategoriaCnh.text;
  motorista.ValidadeCNH := StrToDate(MaskEditValidadeCnh.text);
  motorista.cargo := 'motorista';
//  motorista.idTransportadora := UsuarioLogado.UserLogado.getIdTransportadora;
  // jeito para teste ->
 motorista.idTransportadora:= 1;

 controller := ThomeController.Create;

  try
      controller.CadastrarMotorista(motorista);
      ShowMessage('Motorista cadastrado com sucesso!');
      mostrarUser('motorista',lswMotorista);
      mostrarMotorista;
      AtualizarDashboards;
    finally
      controller.Free;
  end;

end;

//========================== CARREGADOR ========================================
procedure TFormHome.lblBtnCadastrarCarregadorClick(Sender: TObject);
begin
panelOptionsCarregador.Visible := true;
lblOptionsCarregadores.caption := 'Cadastrar Carregadores';
pnlBtnEditarCarregadorConf.visible := false;
pnlBtnCadastrarCarregadorConf.visible := true;
pnlBtnRecuperarCarregadorConf.visible := false;
pnlBtnExcluirCarregadorConf.visible := false;
end;


procedure TFormHome.lblBtnCadastrarCarregadorConfClick(Sender: TObject);
var
controller:THomeController;
usuario :Tusuario;
begin
usuario := TUsuario.Create;
  usuario.setNome(edtNomeCarregador.Text);
  usuario.setEmail (edtEmailCarregador.Text);
  usuario.setsenha_hash (EdtSenhaCarregador.text);
  usuario.Setcpf(MaskEditCpfCarregador.Text);
  usuario.setTelefone (MaskEditTelefoneCarregador.text);
  usuario.setCargo_descricao('Carregador');
//  usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);
// jeito para teste ->
 usuario.SetIdTransportadora(1);



  controller := THomeController.Create;
  try
      controller.CadastrarUsuario(usuario);
      ShowMessage('Carregador cadastrado com sucesso!');
      mostrarUser('Carregador',lswCarregador);
      AtualizarDashboards;
    finally
      controller.Free;
  end;
    usuario.Free;
end;

procedure TFormHome.lblBtnEditarCarregadorClick(Sender: TObject);
begin
panelOptionsCarregador.Visible := true;
lblOptionsCarregadores.caption := 'Editar Carregadores';
pnlBtnEditarCarregadorConf.visible := true;
pnlBtnCadastrarCarregadorConf.visible := false;
pnlBtnRecuperarCarregadorConf.visible := false;
pnlBtnExcluirCarregadorConf.visible := false;

     if lswCarregador.selected = nil then begin
    showMessage('selecione um carregador na lista para editar.');
    mostrarUser('Carregador',lswcarregador);
    exit;
    end;

    edtNomeCarregador.text := lswCarregador.selected.subItems[0];
    MaskEditCpfCarregador.text := lswCarregador.selected.SubItems[1];
    MaskEditTelefoneCarregador.Text := lswCarregador.selected.subItems[3];
    edtEmailCarregador.Text := lswCarregador.selected.subItems[4];
end;

procedure TFormHome.lblBtnEditarCarregadorConfClick(Sender: TObject);
var
controller : THomeController;
usuario : Tusuario;
codParaEditar : integer;
idTransp:String;
begin
  codParaEditar := StrToInt(lswCarregador.Selected.Caption);
  try
    usuario := TUsuario.Create;
    usuario.setId(codParaEditar);
    usuario.setNome(edtNomeCarregador.Text);
    usuario.setEmail (edtEmailCarregador.text);
    usuario.setsenha_hash (EdtSenhaCarregador.text);
    usuario.Setcpf(MaskEditCpfCarregador.Text);
    usuario.setTelefone (MaskEditTelefoneCarregador.text);
    usuario.setCargo_descricao('Carregador');
    //  usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);
    // jeito para teste ->

    controller := ThomeController.create;
    try
      controller.EditarUser(usuario);
      showMessage('Carregador editado com sucesso!!');
      mostrarUser('Carregador',lswcarregador);
    finally
      controller.free;
    end;
  finally
    edtNomeCarregador.clear;
    MaskEditCpfCarregador.clear;
    edtEmailCarregador.clear;
    EdtSenhaCarregador.clear;
    MaskEditTelefoneCarregador.clear;
  end;
end;

procedure TFormHome.imgFecharOptionCarregadorClick(Sender: TObject);
begin
panelOptionsCarregador.Visible := false;
end;


procedure TFormHome.lblBtnRecuperarCarregadorClick(Sender: TObject);
begin
pnlBtnRecuperarCarregadorConf.visible := true;
pnlBtnExcluirCarregadorConf.visible := false;

  showMessage('Agora a tabela ira mostrar os carregadores excluidos');
  MostrarUserInativo('Carregador', lswCarregador);

end;

procedure TFormHome.lblBtnRecuperarCarregadorConfClick(Sender: TObject);
var
controller : THomeController;
user : Tusuario;
codParaExcluir: Integer;
begin
  if lswCarregador.selected = nil then begin
    showMessage('selecione um carregador na lista para recuperar.');
    MostrarUserInativo('gerente', lswGerente);
    exit;
  end;

  if MessageDlg('Tem certeza que deseja recuperar o carregador selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaExcluir := StrToInt(lswCarregador.Selected.Caption);
  user := Tusuario.create;
  user.setId(codParaExcluir);

  controller := THomeController.Create;
  try
    controller.recuperarUser(user);
    showMessage('Carregador recuperado com sucesso.');
    MostrarUserInativo('Carregador', lswCarregador);
    AtualizarDashboards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.lblBtnExcluirCarregadorClick(Sender: TObject);
begin
pnlBtnRecuperarCarregadorConf.visible := false;
pnlBtnExcluirCarregadorConf.visible := true;
end;
procedure TFormHome.lblBtnExcluirCarregadorConfClick(Sender: TObject);
var
controller : THomeController;
user : Tusuario;
codParaExcluir: Integer;
begin
  if lswCarregador.selected = nil then begin
    showMessage('selecione um carregador na lista para Excluir.');
    mostrarUser('Carregador',lswCarregador);
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o carregador selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaExcluir := StrToInt(lswCarregador.Selected.Caption);
  user := Tusuario.create;
  user.setId(codParaExcluir);

  controller := THomeController.Create;
  try
    controller.excluirUser(user);
    showMessage('Carregador excluido com sucesso.');
    mostrarUser('Carregador',lswCarregador);
    AtualizarDashboards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.pnlBtnRecuperarCarregadorConfClick(Sender: TObject);
begin

end;

//================= VEICULOS ===================================================


procedure TFormHome.lblBtnCadastrarVeiculoClick(Sender: TObject);
begin
pnlOptionsVeiculo.visible := true;
lblOptionsVeiculo.caption := 'cadastrar veiculo';
pnlBtnCadastrarVeiculoConf.visible := true;
pnlBtnEditarVeiculoConf.visible := false;
pnlBtnRecuperarVeiculoConf.visible := false;
pnlBtnExcluirVeiculoConf.visible := false;
end;

procedure TFormHome.lblBtnEditarVeiculoClick(Sender: TObject);
begin
pnlOptionsVeiculo.visible := true;
lblOptionsVeiculo.caption := 'Editar veiculo';
pnlBtnCadastrarVeiculoConf.visible := false;
pnlBtnEditarVeiculoConf.visible := true;
pnlBtnRecuperarVeiculoConf.visible := false;
pnlBtnExcluirVeiculoConf.visible := false;
end;

procedure TFormHome.imgFechaOptionsVeiculoClick(Sender: TObject);
begin
pnlOptionsVeiculo.visible := false;
end;

procedure TFormHome.lblBtnRecuperarVeiculoClick(Sender: TObject);
begin
pnlBtnRecuperarVeiculoConf.visible := true;
pnlBtnExcluirVeiculoConf.visible := false;
end;

procedure TFormHome.lblBtnExcluirVeiculoClick(Sender: TObject);
begin
pnlBtnRecuperarVeiculoConf.visible := false;
pnlBtnExcluirVeiculoConf.visible := true;
end;




end.
