unit uFormHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask;

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
    Panel4: TPanel;
    Shape8: TShape;
    Image3: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Panel5: TPanel;
    Shape9: TShape;
    Image4: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Panel6: TPanel;
    Shape10: TShape;
    Image5: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Panel7: TPanel;
    Shape11: TShape;
    Image6: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Panel8: TPanel;
    Shape12: TShape;
    Image7: TImage;
    Label13: TLabel;
    Label14: TLabel;
    PageControlCadastrar: TPageControl;
    TabSheetGerente: TTabSheet;
    TabSheetMotoristas: TTabSheet;
    TabSheetCarregador: TTabSheet;
    TabSheetVeiculos: TTabSheet;
    Image8: TImage;
    PanelButtonGerentes: TPanel;
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
    EditNomeAdm: TEdit;
    pnlEditCpfGerente: TPanel;
    Shape25: TShape;
    MaskEditCpfAdm: TMaskEdit;
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
    Panel28: TPanel;
    Shape29: TShape;
    imgVoltarGerente: TImage;
    Panel29: TPanel;
    pnlCadastrarGerente: TPanel;
    Shape30: TShape;
    lblBtnCadastrarGerenteConf: TLabel;
    pnlEditarGerente: TPanel;
    Shape31: TShape;
    lblBtnEditarGerenteConf: TLabel;
    PnlBtnDefPermissoesGerente: TPanel;
    Shape2: TShape;
    lblBtnDefPermissoesGerente: TLabel;
    imgFecharPageControl: TImage;
    PanelButtonMotoristas: TPanel;
    Image9: TImage;
    PnlBtnEditarMotorista: TPanel;
    Shape3: TShape;
    lblBtnEditarMotorista: TLabel;
    PnlBtnCadastrarMotoristas: TPanel;
    Shape4: TShape;
    LblBtnCadastrarMotorista: TLabel;
    LswMotorista: TListView;
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
    pblBtnDefPermissoesMotorista: TPanel;
    Shape17: TShape;
    lblBtnDefPermissoesMotorista: TLabel;
    PanelOptionsMotoristas: TPanel;
    lblOptionsMotorista: TLabel;
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
    Panel9: TPanel;
    panelFechaOptionsGerente: TPanel;
    Shape43: TShape;
    imgBtnFechaOptionsGerente: TImage;
    Label18: TLabel;
    pnlEdtCategoriaCnh: TPanel;
    Shape42: TShape;
    edtCategoriaCnh: TEdit;
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
    pnlBtnDefPermissoesCarregador: TPanel;
    Shape50: TShape;
    lblBtnDefPermissoesCarregador: TLabel;
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
    Panel38: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Panel39: TPanel;
    pnlEdtAnoVeiculo: TPanel;
    Shape68: TShape;
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
    MaskEditAnoVeiculo: TMaskEdit;
    ComboBoxUnidadeMed: TComboBox;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

//============HEADER =====================================================
procedure TFormHome.lblCadastrosBtnClick(Sender: TObject);
begin
pagecontrolCadastrar.visible := true;
end;

procedure TFormHome.pnlBtnRecuperarCarregadorConfClick(Sender: TObject);
begin

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
begin
panelOptionsGerente.Visible := true;
lblPanelOptionGerente.caption := 'Cadastrar Gerente';
pnlEditarGerente.visible := false;
pnlCadastrarGerente.visible := true;
pnlBtnRecuperarGerenteConfirm.visible := false;
pnlBtnExcluirGerenteConfirm.visible := false;
end;

procedure TFormHome.lblBtnEditarGerenteClick(Sender: TObject);
begin
panelOptionsGerente.Visible := true;
pnlEditarGerente.visible := true;
pnlCadastrarGerente.visible := false;
lblPanelOptionGerente.caption := 'Editar Gerente';
pnlBtnRecuperarGerenteConfirm.visible := false;
pnlBtnExcluirGerenteConfirm.visible := false;
end;


procedure TFormHome.ImgBtnFechaOptionsGerenteClick(Sender: TObject);
begin
panelOptionsGerente.Visible := false;
end;

procedure TFormHome.lblBtnRecuperarGerenteClick(Sender: TObject);
begin
pnlBtnRecuperarGerenteConfirm.visible := true;
pnlBtnExcluirGerenteConfirm.visible := false;
end;

procedure TFormHome.lblBtnExcluirGerenteClick(Sender: TObject);
begin
pnlBtnRecuperarGerenteConfirm.visible := false;
pnlBtnExcluirGerenteConfirm.visible := true;
end;

//======================= MOTORISTA ========================================
  procedure TFormHome.LblBtnCadastrarMotoristaClick(Sender: TObject);
begin
panelOptionsMotoristas.Visible := true;
lblOptionsMotorista.caption := 'Cadastrar Gerente';
pnlBtnCadastrarMotoristaConf.visible := true;
pnlBtnEditarMotoristaConf.Visible := false;
pnlBtnCadastrarMotoristaConf.visible := false;
pnlBtnEditarMotoristaConf.Visible := false;
end;

procedure TFormHome.lblBtnEditarMotoristaClick(Sender: TObject);
begin
lblOptionsMotorista.caption := 'Editar motorista';
panelOptionsMotoristas.Visible := true;
pnlBtnCadastrarMotoristaConf.visible := false;
pnlBtnEditarMotoristaConf.Visible := true;
pnlBtnCadastrarMotoristaConf.visible := false;
pnlBtnEditarMotoristaConf.Visible := false;
end;

procedure TFormHome.lblBtnExcluirMotoristaConfClick(Sender: TObject);
begin
  pnlBtnRecuperarMototistaConf.Visible:=false;
  pnlBtnExcluirMotoristaConf.visible := true;
end;

procedure TFormHome.lblBtnRecuperarMotoristaClick(Sender: TObject);
begin
  pnlBtnRecuperarMototistaConf.Visible:=true;
  pnlBtnExcluirMotoristaConf.visible := false;
end;

procedure TFormHome.ImgFechaOptionsMotoristaClick(Sender: TObject);
begin
  panelOptionsMotoristas.Visible := false;
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


procedure TFormHome.lblBtnEditarCarregadorClick(Sender: TObject);
begin
panelOptionsCarregador.Visible := true;
lblOptionsCarregadores.caption := 'Editar Carregadores';
pnlBtnEditarCarregadorConf.visible := true;
pnlBtnCadastrarCarregadorConf.visible := false;
pnlBtnRecuperarCarregadorConf.visible := false;
pnlBtnExcluirCarregadorConf.visible := false;
end;

procedure TFormHome.imgFecharOptionCarregadorClick(Sender: TObject);
begin
panelOptionsCarregador.Visible := false;
end;

procedure TFormHome.lblBtnRecuperarCarregadorClick(Sender: TObject);
begin
pnlBtnRecuperarCarregadorConf.visible := true;
pnlBtnExcluirCarregadorConf.visible := false;
end;

procedure TFormHome.lblBtnExcluirCarregadorClick(Sender: TObject);
begin
pnlBtnRecuperarCarregadorConf.visible := false;
pnlBtnExcluirCarregadorConf.visible := true;
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
