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
    cbTransp4Admin: TComboBox;
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
    Panel19: TPanel;
    Label25: TLabel;
    Panel22: TPanel;
    ComboBox1: TComboBox;
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
    pnlEdtCategoriaCnh: TPanel;
    Shape42: TShape;
    edtCategoriaCnh: TEdit;
    procedure lblCadastrosBtnClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure lblBtnCadastrarGerenteClick(Sender: TObject);
    procedure lblBtnEditarGerenteClick(Sender: TObject);
    procedure imgFecharPageControlClick(Sender: TObject);
    procedure LblBtnCadastrarMotoristaClick(Sender: TObject);
    procedure lblBtnEditarMotoristaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}
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
lblBtnCadastrarGerenteConf.visible := true;
lblBtnEditarGerenteConf.visible := false;
end;

procedure TFormHome.lblBtnEditarGerenteClick(Sender: TObject);
begin
panelOptionsGerente.Visible := true;
lblBtnCadastrarGerenteConf.visible := false;
lblBtnEditarGerenteConf.visible := true;
lblPanelOptionGerente.caption := 'Editar Gerente';
end;

procedure TFormHome.lblCadastrosBtnClick(Sender: TObject);
begin
pagecontrolCadastrar.visible := true;
end;

//======================= MOTORISTA ========================================
  procedure TFormHome.LblBtnCadastrarMotoristaClick(Sender: TObject);
begin
panelOptionsMotoristas.Visible := true;
pnlBtnCadastrarMotoristaConf.visible := true;
pnlBtnEditarMotoristaConf.Visible := false;
end;

procedure TFormHome.lblBtnEditarMotoristaClick(Sender: TObject);
begin
panelOptionsMotoristas.Visible := true;
pnlBtnCadastrarMotoristaConf.visible := false;
pnlBtnEditarMotoristaConf.Visible := true;
end;



end.
