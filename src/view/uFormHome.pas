unit uFormHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,dateUtils,uCliente,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,viagemDto, usuarioLogado,uUsuario,carregamentoDto,uCleanFIelds,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Datasnap.DBClient, homeController,system.Generics.Collections,motoristaDto, uVeiculo,tipoCargaDto,pedidoDto,
  VclTee.TeeGDIPlus, VCLTee.Series, VCLTee.TeEngine, VCLTee.TeeProcs,
  VCLTee.Chart, frxSmartMemo, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,
  frCoreClasses;

type
  TFormHome = class(TForm)
    PanelHeader: TPanel;
    lblLogix: TLabel;
    Image1: TImage;
    PanelPermissoes: TPanel;
    Shape1: TShape;
    lblRelatoriosbtn: TLabel;
    PanelOrdens: TPanel;
    Shape5: TShape;
    lblOrdensBtn: TLabel;
    pnlCadastros: TPanel;
    Shape6: TShape;
    lblCadastrosBtn: TLabel;
    pnlDashboardCadastros: TPanel;
    veiculosCadastrados: TPanel;
    Shape7: TShape;
    lblDashBoards: TLabel;
    Image2: TImage;
    Label4: TLabel;
    lblCountVeiculos: TLabel;
    pedidosFeitos: TPanel;
    Shape8: TShape;
    Image3: TImage;
    Label5: TLabel;
    lblCountPedidos: TLabel;
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
    PanelCadastrar: TPanel;
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
    LswMotorista: TListView;
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
    cbUnidadeMedida: TComboBox;
    Panel38: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Panel39: TPanel;
    pnlEdtAnoVeiculo: TPanel;
    Shape68: TShape;
    MaskEditAnoVeiculo: TMaskEdit;
    cbTipoCarga4veiculo: TComboBox;
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
    PanelPedidos: TPanel;
    Shape2: TShape;
    lblpedidosBtn: TLabel;
    pnlPedidos: TPanel;
    DBGridMeusPedidos: TDBGrid;
    Image4: TImage;
    pnlDashboardPedidos: TPanel;
    Label7: TLabel;
    pedidoEntregados: TPanel;
    Shape9: TShape;
    Image10: TImage;
    Label8: TLabel;
    lblCountPedidoFinalizados: TLabel;
    Panel6: TPanel;
    Shape17: TShape;
    Image11: TImage;
    Label10: TLabel;
    lblCountTotalPedidos: TLabel;
    pedidoEmRota: TPanel;
    Shape29: TShape;
    Image12: TImage;
    Label14: TLabel;
    lblCountPedidoEmRota: TLabel;
    pedidoEmPreparo: TPanel;
    Shape50: TShape;
    Image13: TImage;
    Label19: TLabel;
    lblCountPedidoPreparando: TLabel;
    DataSourcePedidos: TDataSource;
    pnlOrdens: TPanel;
    DataSourcePedidosOrdens: TDataSource;
    pageControlOrdens: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridPedidosOrdens: TDBGrid;
    Image14: TImage;
    pnlConfOrdemCarreg: TPanel;
    Shape69: TShape;
    lblBtnConfCarregamento: TLabel;
    cbCarregador4Ordens: TComboBox;
    cbVeiculo4Ordens: TComboBox;
    Label12: TLabel;
    DataSourceOrdensCarregCriadas: TDataSource;
    DBGridOrdensCarreg: TDBGrid;
    Label34: TLabel;
    DBGridOrdensCarreg4viagens: TDBGrid;
    Image15: TImage;
    Label35: TLabel;
    DataSourceOrdensCarreg4viagens: TDataSource;
    DBGridOrdensViagens: TDBGrid;
    Label36: TLabel;
    cbMotorista4viagem: TComboBox;
    Panel7: TPanel;
    Shape73: TShape;
    lblCriarOrdemViagem: TLabel;
    DataSourceOrdensViagens: TDataSource;
    pnlMinhasOrdens: TPanel;
    Shape74: TShape;
    lblBtnMinhasOrdens: TLabel;
    PanelMinhasOrdens: TPanel;
    PageControlMinhasOrdens: TPageControl;
    TabSheetOrdensCarregamento: TTabSheet;
    TabSheetOrdensViagens: TTabSheet;
    Image16: TImage;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    imgFimCarregamento: TImage;
    imgIniciarCarregamento: TImage;
    Panel8: TPanel;
    Shape75: TShape;
    DbGridOrdensCarreg4Carreg: TDBGrid;
    DTordensCarreg4Carreg: TDataSource;
    Panel10: TPanel;
    Shape77: TShape;
    Image18: TImage;
    Label42: TLabel;
    lblCountOrdensCarregProcesso: TLabel;
    Panel9: TPanel;
    Shape76: TShape;
    Image17: TImage;
    Label40: TLabel;
    lblCountOrdensCarregPendentes: TLabel;
    Panel13: TPanel;
    Shape78: TShape;
    Image19: TImage;
    Label41: TLabel;
    lblCountOrdensCarregFeitas: TLabel;
    Image20: TImage;
    Label43: TLabel;
    DBGridMinhasOrdensViagens: TDBGrid;
    Panel18: TPanel;
    Shape79: TShape;
    imgFinalizarOrdemViagem: TImage;
    imgIniciarOrdemViagem: TImage;
    Label44: TLabel;
    Label45: TLabel;
    pnlOrdensViagensProcesso: TPanel;
    Shape80: TShape;
    Image23: TImage;
    Label46: TLabel;
    lblCountViagensEmRota: TLabel;
    pnlOrdensViagensPendentes: TPanel;
    Shape81: TShape;
    Image24: TImage;
    Label48: TLabel;
    lblCountOrdensViagensPendentes: TLabel;
    pnlOrdensViagensFinalizadas: TPanel;
    Shape82: TShape;
    Image25: TImage;
    Label50: TLabel;
    lblOrdensViagensFinalizadas: TLabel;
    DTOrdensMinhasOrdensViagens: TDataSource;
    pnlGraficosHome: TPanel;
    graficoCargasMaisUsadas: TChart;
    Series1: TPieSeries;
    graficoVendasNosUltimosDias: TChart;
    Series2: TBarSeries;
    pnlRelatorios: TPanel;
    Label6: TLabel;
    Shape84: TShape;
    PanelRelatorioFaturamento: TPanel;
    Image21: TImage;
    lblBtnRelFaturamento: TLabel;
    pnlFiltroFaturamento: TPanel;
    Label49: TLabel;
    Label51: TLabel;
    DateTimePickerFiltro: TDateTimePicker;
    Label52: TLabel;
    ComboBoxClienteFiltro: TComboBox;
    pnlConfRelFaturamento: TPanel;
    Shape83: TShape;
    lblBtnEmitirRelFaturamento: TLabel;
    Label54: TLabel;
    Shape85: TShape;
    Image22: TImage;
    imgFechaFIltroRelFat: TImage;
    Chart1: TChart;
    Chart2: TChart;
    Chart3: TChart;
    Chart4: TChart;
    Series4: TLineSeries;
    Series3: TPieSeries;
    Series5: TBarSeries;
    Series6: THorizBarSeries;
    Panel4: TPanel;
    Image26: TImage;
    Label47: TLabel;
    Panel5: TPanel;
    Image27: TImage;
    Label53: TLabel;
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
    procedure mostrarUser(const aCargo: string; aListView: TListView;aIdTransportadora:integer);
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
    procedure mostrarMotoristaInativo;
    procedure lblBtnExcluirMotoristaClick(Sender: TObject);
    procedure lblBtnRecuperarMotoristaConfClick(Sender: TObject);
    procedure lblBtnEditarMotoristaConfClick(Sender: TObject);
    procedure lblBtnCadastrarVeiculoConfClick(Sender: TObject);
    procedure mostrarVeiculo;
    procedure mostrarVeiculoInativo;
    procedure lblBtnExcluirVeiculoConfClick(Sender: TObject);
    procedure lblBtnRecuperarVeiculoConfClick(Sender: TObject);
    procedure lblBtnEditarVeiculoConfClick(Sender: TObject);
    procedure lblOrdensBtnClick(Sender: TObject);
    procedure mostrarPedidosPorTransp;
    procedure lblpedidosBtnClick(Sender: TObject);
    procedure DBGridMeusPedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Image4Click(Sender: TObject);
    procedure mostrarPedidosOrdens;
    procedure Image14Click(Sender: TObject);
    procedure lblBtnConfCarregamentoClick(Sender: TObject);
    procedure mostrarOrdensCarreg;
    procedure DBGridPedidosOrdensCellClick(Column: TColumn);
    procedure lblCriarOrdemViagemClick(Sender: TObject);
    procedure ordensCarregamento4Carregadores;
    procedure lblBtnMinhasOrdensClick(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure imgIniciarCarregamentoClick(Sender: TObject);
    procedure imgFimCarregamentoClick(Sender: TObject);
    procedure ordensViagens4Motoristas;
    procedure imgIniciarOrdemViagemClick(Sender: TObject);
    procedure imgFinalizarOrdemViagemClick(Sender: TObject);
    procedure verificarPermissoes;
    procedure mostrarordensViagens;
    procedure PreencherGraficoCargasMaisUsadas;
    procedure AtualizaGraficoPedidosPorMes;
    procedure lblRelatoriosbtnClick(Sender: TObject);
    procedure lblBtnEmitirRelFaturamentoClick(Sender: TObject);
    procedure lblBtnRelFaturamentoClick(Sender: TObject);
    procedure imgFechaFIltroRelFatClick(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Shape84ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
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
procedure TFormHome.mostrarUser(const aCargo: string; aListView: TListView;aIdTransportadora:integer);
var
  controller: ThomeController;
  ListaUser: TObjectList<Tusuario>;
  user: Tusuario;
  Item: TListItem;
  idTransportadoraUsuario:Integer;
begin
  if not Assigned(aListView) then
    Exit;

  controller := ThomeController.Create;
  try
    idTransportadoraUsuario := usuarioLogado.UserLogado.getIdTransportadora;
    ListaUser := controller.MostrarUser(aCargo, idTransportadoraUsuario);
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
    mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
  end
  else if PageControlCadastrar.ActivePage = TabSheetCarregador then
  begin
    mostrarUser('Carregador', lswCarregador,usuarioLogado.userLogado.getIdTransportadora);
  end
  else if PageControlCadastrar.ActivePage = TabSheetMotoristas then
  begin
    MostrarMotorista;
  end
  else if PageControlCadastrar.ActivePage = TabSheetVeiculos then
  begin
    MostrarVeiculo;
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

procedure TFormHome.mostrarVeiculo;
var
controller:ThomeController;
listaVeiculo: TobjectList<Tveiculo>;
veiculo : Tveiculo;
item: TlistItem;
begin
  controller := ThomeController.create;
  listaVeiculo:= TobjectList<Tveiculo>.create;
  try
    listaVeiculo := controller.mostrarVeiculo(usuarioLogado.UserLogado.getIdTransportadora);

    lswVeiculos.items.clear;

    for veiculo in listaVeiculo do
    begin
      item := lswVeiculos.items.add;
      Item.Caption := veiculo.getId_veiculo.ToString;
      Item.subitems.Add(veiculo.getPlaca);
      Item.SubItems.Add(veiculo.getModelo);
      Item.SubItems.Add(veiculo.getAno.ToString);
      Item.SubItems.Add(veiculo.getTipo_carga);
      Item.SubItems.Add(veiculo.getCapacidade.ToString);
      Item.SubItems.Add(veiculo.getUnidade_medida);

    end;
  finally
    listaVeiculo.Free;
  end;
  controller.free;
end;

procedure TFormHome.mostrarVeiculoInativo;
var
  controller: THomeController;
  listaVeiculo: TObjectList<TVeiculo>;
  veiculo: TVeiculo;
  item: TListItem;
begin
  controller := THomeController.Create;
  try
    listaVeiculo := controller.mostrarVeiculoInativo(usuarioLogado.userLogado.getIdTransportadora);
    try
      lswVeiculos.Items.Clear;

      for veiculo in listaVeiculo do
      begin
        item := lswVeiculos.Items.Add;
        item.Caption := veiculo.getId_veiculo.ToString;
        item.SubItems.Add(veiculo.getPlaca);
        item.SubItems.Add(veiculo.getModelo);
        item.SubItems.Add(veiculo.getAno.ToString);
        item.SubItems.Add(veiculo.getTipo_carga);
        item.SubItems.Add(veiculo.getCapacidade.ToString);
        item.SubItems.Add(veiculo.getUnidade_medida);
      end;
    finally
      listaVeiculo.Free;
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
  idTransportadoraUsuario:Integer;
begin
  controller := ThomeController.Create;
  try
    idTransportadoraUsuario := usuarioLogado.UserLogado.getIdTransportadora;
    ListaMotorista := controller.mostrarMotorista(idTransportadoraUsuario);

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

procedure TFormHome.mostrarMotoristaInativo;
var
  controller: ThomeController;
  ListaMotorista: TList<TmotoristaDto>;
  motorista: TmotoristaDto;
  Item: TListItem;
  idTransportadoraUsuario:integer;
begin
  controller := ThomeController.Create;
  try
    idTransportadoraUsuario := usuarioLogado.UserLogado.getIdTransportadora;
    ListaMotorista := controller.mostrarMotoristaInativo(idTransportadoraUsuario);

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

procedure TFormHome.mostrarOrdensCarreg;
var
  controller :ThomeController;
  ordensCarregamentos: Tlist<TcarregamentoDto>;
  i: integer;
  carregamentoDataSet, dsProntos: TClientDataSet;
begin
  controller := ThomeController.create;
  try
    ordensCarregamentos := controller.buscarOrdensCarregPorTransp(usuarioLogado.UserLogado.getIdTransportadora);

    carregamentoDataSet := TClientDataSet.create(nil);
    dsProntos := TClientDataSet.create(nil);
    try
      carregamentoDataSet.FieldDefs.Add('id', ftInteger);
      carregamentoDataSet.FieldDefs.Add('idPedido', ftInteger);
      carregamentoDataSet.FieldDefs.Add('veiculo', ftString, 30);
      carregamentoDataSet.FieldDefs.Add('carregador', ftString, 90);
      carregamentoDataSet.FieldDefs.Add('status', ftString, 30);
      carregamentoDataSet.FieldDefs.Add('dataCadastro', ftDateTime);
      carregamentoDataSet.FieldDefs.Add('distanciaKm', ftFloat);
      carregamentoDataSet.CreateDataSet;

      dsProntos.FieldDefs.Assign(carregamentoDataSet.FieldDefs);
      dsProntos.CreateDataSet;

      for i := 0 to ordensCarregamentos.Count - 1 do
      begin
        carregamentoDataSet.Append;
        carregamentoDataSet.FieldByName('id').AsInteger      := ordensCarregamentos[i].idCarregamento;
        carregamentoDataSet.FieldByName('idPedido').AsInteger := ordensCarregamentos[i].idPedido;
        carregamentoDataSet.FieldByName('veiculo').AsString  := ordensCarregamentos[i].sVeiculo;
        carregamentoDataSet.FieldByName('carregador').AsString := ordensCarregamentos[i].sCarregador;
        carregamentoDataSet.FieldByName('status').AsString   := ordensCarregamentos[i].status;
        carregamentoDataSet.FieldByName('dataCadastro').AsDateTime := ordensCarregamentos[i].dataCadastro;
        carregamentoDataSet.Post;

        if SameText(ordensCarregamentos[i].status, 'pronto') then
        begin
          dsProntos.Append;
          dsProntos.FieldByName('id').AsInteger      := ordensCarregamentos[i].idCarregamento;
          dsProntos.FieldByName('idPedido').AsInteger := ordensCarregamentos[i].idPedido;
          dsProntos.FieldByName('veiculo').AsString  := ordensCarregamentos[i].sVeiculo;
          dsProntos.FieldByName('carregador').AsString := ordensCarregamentos[i].sCarregador;
          dsProntos.FieldByName('status').AsString   := ordensCarregamentos[i].status;
          dsProntos.FieldByName('dataCadastro').AsDateTime := ordensCarregamentos[i].dataCadastro;
          dsProntos.FieldByName('distanciakm').AsFloat := ordensCarregamentos[i].distanciaKm;
          dsProntos.Post;
        end;
      end;

      DataSourceOrdensCarregCriadas.DataSet := carregamentoDataSet;
      DBGridOrdensCarreg.DataSource := DataSourceOrdensCarregCriadas;

      DataSourceOrdensCarreg4viagens.DataSet := dsProntos;
      DBGridOrdensCarreg4viagens.DataSource := DataSourceOrdensCarreg4viagens;

    finally
      ordensCarregamentos.Free;
    end;
  finally
    controller.Free;
  end;
end;

procedure TFormHome.mostrarordensViagens;
var
  controller :ThomeController;
  ordensviagens: Tlist<TviagemDto>;
  i: integer;
  viagemDataSet: TClientDataSet;
begin
  controller := ThomeController.create;
  try
    ordensviagens := controller.buscarOrdensViagensPorTransp(usuarioLogado.UserLogado.getIdTransportadora);

    viagemDataSet := TClientDataSet.create(nil);
    try
      viagemDataSet.FieldDefs.Add('id', ftInteger);
      viagemDataSet.FieldDefs.Add('idCarregamento', ftInteger);
      viagemDataSet.FieldDefs.Add('veiculo', ftString, 30);
      viagemDataSet.FieldDefs.Add('motorista', ftString, 90);
      viagemDataSet.FieldDefs.Add('status', ftString, 30);
      viagemDataSet.FieldDefs.Add('dataCadastro', ftDateTime);
      viagemDataSet.FieldDefs.Add('distanciaKm', ftFloat);
      viagemDataSet.CreateDataSet;

      for i := 0 to ordensViagens.Count - 1 do
      begin
        viagemDataSet.Append;
        viagemDataSet.FieldByName('id').AsInteger := ordensViagens[i].idviagem;
        viagemDataSet.FieldByName('idCarregamento').AsInteger := ordensViagens[i].idCarregamento;
        viagemDataSet.FieldByName('veiculo').AsString  := ordensViagens[i].Veiculo;
        viagemDataSet.FieldByName('motorista').AsString := ordensViagens[i].motorista;
        viagemDataSet.FieldByName('status').AsString   := ordensViagens[i].status;
        viagemDataSet.FieldByName('distanciaKm').AsFloat := ordensViagens[i].distancia_km;
        viagemDataSet.FieldByName('dataCadastro').AsDateTime := ordensViagens[i].dataCadastro;
        viagemDataSet.Post;
      end;

      DataSourceOrdensViagens.DataSet := viagemDataSet;
      DBGridOrdensViagens.DataSource := DataSourceOrdensViagens;
    finally
      ordensViagens.Free;
    end;
  finally
    controller.Free;
  end;
end;

procedure TFormHome.ordensCarregamento4Carregadores;
var
  controller :ThomeController;
  ordensCarregamentos: Tlist<TcarregamentoDto>;
  i: integer;
  carregamentoDataSet: TClientDataSet;
begin
  controller := ThomeController.create;

  ordensCarregamentos:= controller.OrdensCarreg4Carreg(usuarioLogado.userLogado.getIdTransportadora,usuarioLogado.userLogado.getId);

  carregamentoDataSet:=TclientDataSet.create(nil);
  try
    carregamentoDataSet.FieldDefs.Add('id', ftInteger);
    carregamentoDataSet.FieldDefs.Add('idPedido', ftInteger);
    carregamentoDataSet.FieldDefs.Add('veiculo', ftString, 30);
    carregamentoDataSet.FieldDefs.Add('carregador', ftString, 90);
    carregamentoDataSet.FieldDefs.Add('status', ftString, 30);
    carregamentoDataSet.FieldDefs.Add('dataCadastro', ftDateTime);
    carregamentoDataSet.FieldDefs.Add('distanciaKm', ftFloat);
    carregamentoDataSet.FieldDefs.Add('data_hora_inicio', ftDateTime);
    carregamentoDataSet.FieldDefs.Add('data_hora_fim', ftDateTime);
    carregamentoDataSet.FieldDefs.Add('carga', ftString, 90);
    carregamentoDataSet.CreateDataSet;

    for i := 0 to ordensCarregamentos.Count - 1 do
    begin
        carregamentoDataSet.Append;
        carregamentoDataSet.FieldByName('id').AsInteger      := ordensCarregamentos[i].idCarregamento;
        carregamentoDataSet.FieldByName('idPedido').AsInteger := ordensCarregamentos[i].idPedido;
        carregamentoDataSet.FieldByName('veiculo').AsString  := ordensCarregamentos[i].sVeiculo;
        carregamentoDataSet.FieldByName('carregador').AsString := ordensCarregamentos[i].sCarregador;
        carregamentoDataSet.FieldByName('status').AsString   := ordensCarregamentos[i].status;
        carregamentoDataSet.FieldByName('dataCadastro').AsDateTime := ordensCarregamentos[i].dataCadastro;

        if ordensCarregamentos[i].data_hora_inicio <= 0 then
          carregamentoDataSet.FieldByName('data_hora_inicio').Clear
        else
          carregamentoDataSet.FieldByName('data_hora_inicio').AsDateTime := ordensCarregamentos[i].data_hora_inicio;

        if ordensCarregamentos[i].data_hora_fim <= 0 then
          carregamentoDataSet.FieldByName('data_hora_fim').Clear
        else
          carregamentoDataSet.FieldByName('data_hora_fim').AsDateTime := ordensCarregamentos[i].data_hora_fim;

        carregamentoDataSet.FieldByName('carga').AsString := ordensCarregamentos[i].carga;
        carregamentoDataSet.Post;
        carregamentoDataSet.First;
    end;

    DTordensCarreg4Carreg.DataSet := carregamentoDataSet;
    DbGridOrdensCarreg4Carreg.DataSource := DTordensCarreg4Carreg;
  finally
  end;
end;

procedure TFormHome.ordensViagens4Motoristas;
var
   controller :ThomeController;
   ordensViagens: Tlist<TviagemDto>;
   viagemDataSet: TClientDataSet;
   i:integer;
begin
    controller := THomeController.Create;
    try
      ordensViagens:= controller.buscarMinhasOrdensViagens(usuarioLogado.userLogado.getIdTransportadora,usuarioLogado.userLogado.getId);
      viagemDataSet:= TClientDataSet.create(nil);

      viagemDataSet.FieldDefs.Add('id', ftInteger);
      viagemDataSet.FieldDefs.Add('idCarregamento', ftInteger);
      viagemDataSet.FieldDefs.Add('motorista',ftString, 90);
      viagemDataSet.FieldDefs.Add('veiculo',ftString, 90);
      viagemDataSet.FieldDefs.Add('status',ftString, 30);
      viagemDataSet.FieldDefs.Add('distancia_km',ftFloat);
      viagemDataSet.FieldDefs.Add('dataCadastro', ftDateTime);
      viagemDataSet.FieldDefs.Add('data_saida', ftDateTime);
      viagemDataSet.FieldDefs.Add('data_chegada', ftDateTime);
      viagemDataSet.CreateDataSet;

      for i := 0 to ordensViagens.count -1 do begin
        viagemDataSet.Append;
        viagemDataSet.FieldByName('id').AsInteger := ordensViagens[i].idViagem;
        viagemDataSet.FieldByName('idCarregamento').AsInteger := ordensViagens[i].idCarregamento;
        viagemDataSet.FieldByName('motorista').AsString := ordensViagens[i].motorista;
        viagemDataSet.FieldByName('veiculo').AsString := ordensViagens[i].veiculo;
        viagemDataSet.FieldByName('status').AsString := ordensViagens[i].status;
        viagemDataSet.FieldByName('distancia_km').Asfloat := ordensViagens[i].distancia_km;
        viagemDataSet.FieldByName('dataCadastro').AsDateTime := ordensViagens[i].dataCadastro;

        if ordensViagens[i].dataSaida <= 0 then
          viagemDataSet.FieldByName('data_saida').Clear
        else
          viagemDataSet.FieldByName('data_saida').AsDateTime := ordensViagens[i].dataSaida;

        if ordensViagens[i].dataChegada <= 0 then
          viagemDataSet.FieldByName('data_chegada').Clear
        else
          viagemDataSet.FieldByName('data_chegada').AsDateTime := ordensViagens[i].dataChegada;

        viagemDataSet.post;
        viagemDataSet.First;
      end;

      DTOrdensMinhasOrdensViagens.dataSet := viagemDataSet;
      DBGridMinhasOrdensViagens.DataSource := DTOrdensMinhasOrdensViagens;
    finally
    end;
end;

procedure TFormHome.mostrarPedidosOrdens;
var
  controller: THomeController;
  pedidos: TList<TPedidoDto>;
  i: Integer;
  clientDataSet: TClientDataSet;
begin
  controller := THomeController.Create;
  try
    pedidos := controller.BuscarPedidosOrdens(usuarioLogado.userLogado.getIdTransportadora);

    clientDataSet := TClientDataSet.Create(nil);
    try
      clientDataSet.FieldDefs.Add('idPedido', ftInteger);
      clientDataSet.FieldDefs.Add('idCliente', ftInteger);
      clientDataSet.FieldDefs.Add('cepOrigem', ftString, 12);
      clientDataSet.FieldDefs.Add('peso', ftFloat);
      clientDataSet.FieldDefs.Add('cepDestino', ftString, 12);
      clientDataSet.FieldDefs.Add('tipoDeCarga', ftString, 30);
      clientDataSet.FieldDefs.Add('dataPedido', ftDateTime);
      clientDataSet.FieldDefs.Add('distanciaKm', ftFloat);
      clientDataSet.FieldDefs.Add('status', ftString, 20);
      clientDataSet.CreateDataSet;

      for i := 0 to pedidos.Count - 1 do
      begin
        clientDataSet.Append;
        clientDataSet.FieldByName('idPedido').AsInteger      := pedidos[i].IdPedido;
        clientDataSet.FieldByName('idCliente').AsInteger      := pedidos[i].IdCliente;
        clientDataSet.FieldByName('cepOrigem').AsString      := pedidos[i].CepOrigem;
        clientDataSet.FieldByName('peso').AsFloat := pedidos[i].Peso;
        clientDataSet.FieldByName('cepDestino').AsString     := pedidos[i].CepDestino;
        clientDataSet.FieldByName('tipoDeCarga').AsString    := pedidos[i].TipoCarga;
        clientDataSet.FieldByName('dataPedido').AsDateTime   := pedidos[i].DataPedido;
        clientDataSet.FieldByName('distanciaKm').AsFloat     := pedidos[i].DistanciaKm;
        clientDataSet.FieldByName('status').AsString         := pedidos[i].Status;
        clientDataSet.Post;
      end;

      DataSourcePedidosOrdens.DataSet := clientDataSet;
      DBGridPedidosOrdens.DataSource := DataSourcePedidosOrdens;
    finally
      pedidos.Free;
    end;
  finally
    controller.Free;
  end;
end;

procedure TFormHome.mostrarPedidosPorTransp;
var
  controller: THomeController;
  pedidos: TList<TPedidoDto>;
  i: Integer;
  cds: TClientDataSet;
begin
  controller := THomeController.Create;
  try
    pedidos := controller.BuscarPedidosPorTransp(usuarioLogado.userLogado.getIdTransportadora);

    cds := TClientDataSet.Create(nil);
    try
      cds.FieldDefs.Add('idPedido', ftInteger);
      cds.FieldDefs.Add('idCliente', ftInteger);
      cds.FieldDefs.Add('cepOrigem', ftString, 12);
      cds.FieldDefs.Add('estadoOrigem', ftString, 20);
      cds.FieldDefs.Add('cepDestino', ftString, 12);
      cds.FieldDefs.Add('estadoDestino', ftString, 20);
      cds.FieldDefs.Add('tipoDeCarga', ftString, 30);
      cds.FieldDefs.Add('dataPedido', ftDateTime);
      cds.FieldDefs.Add('distanciaKm', ftFloat);
      cds.FieldDefs.Add('preco', ftFloat);
      cds.FieldDefs.Add('status', ftString, 20);
      cds.CreateDataSet;

      for i := 0 to pedidos.Count - 1 do
      begin
        cds.Append;
        cds.FieldByName('idPedido').AsInteger      := pedidos[i].IdPedido;
        cds.FieldByName('idCliente').AsInteger      := pedidos[i].IdCliente;
        cds.FieldByName('cepOrigem').AsString      := pedidos[i].CepOrigem;
        cds.FieldByName('estadoOrigem').AsString   := pedidos[i].EstadoOrigem;
        cds.FieldByName('cepDestino').AsString     := pedidos[i].CepDestino;
        cds.FieldByName('estadoDestino').AsString  := pedidos[i].EstadoDestino;
        cds.FieldByName('tipoDeCarga').AsString    := pedidos[i].TipoCarga;
        cds.FieldByName('dataPedido').AsDateTime   := pedidos[i].DataPedido;
        cds.FieldByName('distanciaKm').AsFloat     := pedidos[i].DistanciaKm;
        cds.FieldByName('preco').AsFloat           := pedidos[i].Preco;
        cds.FieldByName('status').AsString         := pedidos[i].Status;
        cds.Post;
      end;

      DataSourcePedidos.DataSet := cds;
      DBGridMeusPedidos.DataSource := DataSourcePedidos;
    finally
      pedidos.Free;
    end;
  finally
    controller.Free;
  end;
end;

procedure TFormHome.DBGridMeusPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  value: string;
  x, y: Integer;
  txtWidth, txtHeight: Integer;
begin
  value := '';

  if Column.FieldName = 'dataPedido' then
    value := FormatDateTime('dd/mm/yyyy', Column.Field.AsDateTime)
  else if Column.FieldName = 'distanciaKm' then
    value := FormatFloat('0.', Column.Field.AsFloat) + ' km'
  else
    value := Column.Field.AsString;

  DBGridMeusPedidos.Canvas.FillRect(Rect);
  txtWidth := DBGridMeusPedidos.Canvas.TextWidth(value);
  txtHeight := DBGridMeusPedidos.Canvas.TextHeight(value);
  x := Rect.Left + (Rect.Right - Rect.Left - txtWidth) div 2;
  y := Rect.Top + (Rect.Bottom - Rect.Top - txtHeight) div 2;

  DBGridMeusPedidos.Canvas.TextRect(Rect, x, y, value);
end;

// ====================== on show form home ============================
procedure TFormHome.AtualizarDashboards;
var
  controller: THomeController;
  IdTransportadoraLogada: Integer;
begin
  controller := THomeController.Create;
  try

    IdTransportadoraLogada := UsuarioLogado.UserLogado.getIdTransportadora;

    lblCountGerente.Caption := controller.ContarRegistrosAtivos(
      'public.usuarios', IdTransportadoraLogada, 'cargo_descricao', 'gerente'
    ).ToString;

    lblCountCarregador.Caption := controller.ContarRegistrosAtivos(
      'public.usuarios', IdTransportadoraLogada, 'cargo_descricao', 'Carregador'
    ).ToString;

    lblCountMotorista.Caption := controller.ContarRegistrosAtivos(
      'public.usuarios', IdTransportadoraLogada, 'cargo_descricao', 'motorista'
    ).ToString;

    lblCountVeiculos.Caption := controller.ContarRegistrosAtivos(
      'veiculo', IdTransportadoraLogada, '', ''
    ).ToString;

    lblCountPedidos.Caption := controller.ContarRegistrosAtivos(
      'pedido', IdTransportadoraLogada, '', ''
    ).ToString;

    lblCountTotalPedidos.caption := controller.ContarRegistrosAtivos(
      'pedido', IdTransportadoraLogada, '', ''
    ).ToString;

    lblCountPedidoPreparando.caption := IntToStr(controller.buscarPedidosporStatus(IdTransportadoraLogada, 'Em preparo'));
    lblCountPedidoEmRota.caption := IntToStr(controller.buscarPedidosporStatus(IdTransportadoraLogada, 'Em rota'));
    lblCountPedidoFinalizados.caption := IntToStr(controller.buscarPedidosporStatus(IdTransportadoraLogada, 'Finalizado'));

    lblCountOrdensCarregPendentes.Caption:= IntToStr(controller.buscarOrdensporStatus(IdTransportadoraLogada,usuarioLogado.UserLogado.getId, 'Aguardando','carregamento'));
    lblCountOrdensCarregProcesso.Caption:= IntToStr(controller.buscarOrdensporStatus(IdTransportadoraLogada,usuarioLogado.UserLogado.getId,'Em preparo','carregamento'));
    lblCountOrdensCarregFeitas.Caption:= IntToStr(controller.buscarOrdensporStatus(IdTransportadoraLogada,usuarioLogado.UserLogado.getId,'Pronto','carregamento'));

    lblCountOrdensViagensPendentes.Caption := intToStr(controller.buscarOrdensporStatus(IdTransportadoraLogada,usuarioLogado.UserLogado.getId,'Aguardando','viagem'));
    lblCountViagensEmRota.Caption := intToStr(controller.buscarOrdensporStatus(IdTransportadoraLogada,usuarioLogado.UserLogado.getId,'Em rota','viagem'));
    lblOrdensViagensFinalizadas.caption := intToStr(controller.buscarOrdensporStatus(IdTransportadoraLogada,usuarioLogado.UserLogado.getId,'Finalizada','viagem'));

    verificarPermissoes;
  finally
    controller.Free;
  end;
end;

procedure TFormHome.Image14Click(Sender: TObject);
begin
pnlOrdens.visible := false;
end;

procedure TFormHome.Image16Click(Sender: TObject);
begin
panelMinhasOrdens.Visible:=false;
end;

procedure TFormHome.Image22Click(Sender: TObject);
begin
pnlRelatorios.visible:=false;
end;

procedure TFormHome.Image4Click(Sender: TObject);
begin
pnlPedidos.visible := false;
end;


procedure TFormHome.FormShow(Sender: TObject);
begin
    AtualizarDashboards;
    PreencherGraficoCargasMaisUsadas;
    AtualizaGraficoPedidosPorMes;
end;

procedure TFormHome.verificarPermissoes;
begin
  if userLogado.getIdGrupo = 2 then begin
    TabSheetGerente.PageControl := nil;
    TabSheetVeiculos.PageControl := nil;
    pnlMinhasOrdens.visible:=false;

  end else if userLogado.getIdGrupo = 3 then begin
    pnlCadastros.Visible:=false;
    PanelOrdens.visible:=false;
    TabSheetOrdensViagens.PageControl := nil;

  end else if userLogado.getIdGrupo = 4 then begin
    pnlCadastros.Visible:=false;
    PanelOrdens.visible:=false;
    TabSheetOrdensCarregamento.PageControl := nil;

  end;
end;

procedure TFormHome.AtualizaGraficoPedidosPorMes;
const
  NomesMes: array[1..12] of string =
    ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
     'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
  tonsAzuis: array[1..12] of Tcolor = ($00A1470D ,$00A1470D,$00A1470D,$00A1470D,$00D27619,$00D27619,$00D27619,
                                        $00D27619, $00FBDEBB, $00FBDEBB, $00FBDEBB, $00FBDEBB);
var
  ListaMeses: TList<TpedidoDto>;
  Totais: array[1..12] of Integer;
  PedidoMes: TpedidoDto;
  i, anoDesejado: Integer;
  controller:ThomeController;
begin
  controller:=ThomeCOntroller.create;
  anoDesejado := 2025;
  for i := 1 to 12 do
    Totais[i] := 0;

  ListaMeses := controller.ObterPedidosPorMes(userLogado.getIdTransportadora);
  try
    for PedidoMes in ListaMeses do
    begin
      if (PedidoMes.Mes >= 1) and (PedidoMes.Mes <= 12) and (PedidoMes.Ano = anoDesejado) then
        Totais[PedidoMes.Mes] := PedidoMes.Total;
    end;

    graficoVendasNosUltimosDias.Series[0].Clear;
    for i := 1 to 12 do
    graficoVendasNosUltimosDias.Series[0].Add(Totais[i],NomesMes[i],TonsAzuis[i]);
  finally
    ListaMeses.Free;
  end;
end;

procedure TFormHome.PreencherGraficoCargasMaisUsadas;
var
  controller:ThomeController;
  ListaCargas: TList<TtipoCargaDto>;
  Carga: TtipoCargaDto;
begin
  controller:=ThomeCOntroller.create;
  ListaCargas := controller.ObterTiposCargasMaisPedidas(userLogado.getIdTransportadora);
  try
    graficoCargasMaisUsadas.Series[0].Clear;
    for Carga in ListaCargas do
    begin
      graficoCargasMaisUsadas.Series[0].Add(Carga.Total, Carga.TipoCarga);
    end;
  finally
    ListaCargas.Free;
  end;
end;
procedure TFormHome.Shape84ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

//============HEADER =====================================================
procedure TFormHome.lblCadastrosBtnClick(Sender: TObject);
begin
panelCadastrar.Visible := true;
pagecontrolCadastrar.visible := true;
end;

procedure TFormHome.lblOrdensBtnClick(Sender: TObject);
var
  controller: ThomeController;
  idTransportadoraUsuario: Integer;
  listaCarregador: TObjectList<Tusuario>;
  carregador: Tusuario;
  veiculo: Tveiculo;
  listaVeiculo: TObjectList<Tveiculo>;
  listaMotorista: Tlist<TmotoristaDto>;
  motorista:TmotoristaDto;
begin
  listaCarregador:= tobjectList<Tusuario>.create;
  listaCarregador:= TObjectList<Tusuario>.create;
  pnlOrdens.Visible := true;
  mostrarPedidosOrdens;
  mostrarOrdensCarreg;
  mostrarordensViagens;

  Controller := ThomeController.Create;
  try
    idTransportadoraUsuario := usuarioLogado.UserLogado.getIdTransportadora;

    listaCarregador := Controller.mostrarUser('Carregador', idTransportadoraUsuario);
    listaVeiculo := Controller.mostrarVeiculo(usuarioLogado.UserLogado.getIdTransportadora);
    listaMotorista := controller.mostrarMotorista(idTransportadoraUsuario);

    try
      cbCarregador4Ordens.Items.Clear;
      for carregador in listaCarregador do
        cbCarregador4Ordens.Items.Add(carregador.getId.ToString + ' - ' + carregador.getNome);
    finally
      listaCarregador.Free;
    end;

    try
      cbVeiculo4Ordens.Items.Clear;
      for veiculo in listaVeiculo do
        cbVeiculo4Ordens.Items.Add(veiculo.getId_veiculo.ToString + ' - ' + veiculo.getModelo);
    finally
      listaVeiculo.Free;
    end;

    try
      cbMotorista4viagem.items.clear;
      for motorista in listaMotorista do
        cbMotorista4viagem.items.add(motorista.IdUsuario.ToString + ' - ' + motorista.Nome);
    finally
      listaMotorista.free;
    end;
  finally
    Controller.Free;
  end;
end;

procedure TFormHome.lblpedidosBtnClick(Sender: TObject);
begin
pnlPedidos.visible := true;
mostrarPedidosPorTransp;
atualizarDashboards;
end;

procedure TFormHome.lblRelatoriosbtnClick(Sender: TObject);
begin
pnlRelatorios.Visible := true;
end;

//=================== GERENTE ============================================

procedure TFormHome.Image8Click(Sender: TObject);
begin
  close;
end;

procedure TFormHome.imgFecharPageControlClick(Sender: TObject);
begin
panelCadastrar.visible := False;
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
  usuario.setIdGrupo(2);
  usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);

  controller := THomeController.Create;
  try
      controller.CadastrarUsuario(usuario);
      ShowMessage('Gerente cadastrado com sucesso!');
      mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
      AtualizarDashboards;
      CleanFields(Self);
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
    mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
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
    usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);

    controller := ThomeController.create;
    try
      controller.EditarUser(usuario);
      showMessage('Gerente editado com sucesso!!');
      mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
      CleanFields(Self);
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
mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
end;

procedure TFormHome.lblBtnExcluirGerenteConfirmClick(Sender: TObject);
var
controller : THomeController;
user : Tusuario;
codParaExcluir: Integer;
begin
  if lswGerente.selected = nil then begin
    showMessage('selecione um gerente na lista para Excluir.');
    mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o gerente selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaExcluir := StrToInt(lswGerente.Selected.Caption);
  user := Tusuario.create;
  user.setId(codParaExcluir);
  user.setCargo_descricao('Gerente');

  controller := THomeController.Create;
  try
    controller.excluirUser(user);
    showMessage('gerente excluido com sucesso.');
    mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
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
  user.setCargo_descricao('Gerente');

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
pnlBtnEditarMotoristaConf.Visible := true;

  if lswMotorista.Selected = nil then begin
  showMessage('selecione um motorista da lista para editar');
  MostrarMotorista;
  exit;
  end;

  edtNomeMotorista.text := lswMotorista.selected.subItems[0];
  MaskEditCpfMotorista.text := lswMotorista.selected.SubItems[1];
  MaskEditTelefoneMotorista.Text := lswMotorista.selected.subItems[3];
  EdtEmailMotorista.Text := lswMotorista.selected.subItems[4];
  edtCategoriaCnh.text := lswMotorista.selected.subItems[6];
  edtNumCnh.text := lswMotorista.selected.subItems[7];
  MaskEditValidadeCnh.text := lswMotorista.selected.subItems[8];

end;

procedure TFormHome.lblBtnEditarMotoristaConfClick(Sender: TObject);
var
controller : ThomeController;
motorista: TMotoristaDto;
codParaEditar: Integer;
begin
  codParaEditar := StrToInt(lswMotorista.selected.caption);
  motorista.IdUsuario := codParaEditar;

  motorista.Nome := edtNomeMotorista.text;
  motorista.cpf := MaskEditCpfMotorista.text;
  motorista.telefone := MaskEditTelefoneMotorista.text;
  motorista.Email := EdtEmailMotorista.text;
  motorista.senha := EdtSenhaMotorista.text;
  motorista.NumeroCNH := EdtNumCnh.text;
  motorista.CategoriaCNH := edtCategoriaCnh.text;
  motorista.ValidadeCNH := StrToDate(MaskEditValidadeCnh.text);
  motorista.cargo := 'motorista';
   motorista.idTransportadora := UsuarioLogado.UserLogado.getIdTransportadora;


 controller := ThomeController.create;
 try
  controller.EditarMotorista(motorista);
  showMessage('Motorista editado com sucesso!!');
  mostrarMotorista;
  CleanFields(Self);
 finally
  controller.free;
 end;
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
    showMessage('selecione um motorista na lista para Excluir.');
    mostrarMotorista;
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o motorista selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
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

  showMessage('Agora a tabela ira mostrar os motoristas excluidos');
  mostrarMotoristaInativo;
end;

procedure TFormHome.lblBtnRecuperarMotoristaConfClick(Sender: TObject);
var
controller: ThomeController;
codParaEditar :Integer;
motorista:TmotoristaDto;
begin
  if lswMotorista.selected = nil then begin
    showMessage('selecione um motorista na lista para recuperar');
    mostrarMotoristaInativo;
  end;

  if MessageDlg('Tem certeza que deseja recuperar o gerente selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    exit;
  end;

  codParaEditar := StrToInt(lswMotorista.Selected.Caption);
  motorista.IdUsuario := codParaEditar;

  controller := ThomeController.create;
  try
    controller.recuperarUser(motorista);
    showMessage('Motorista recuperado com sucesso!');
    mostrarMotoristaInativo;
    AtualizarDashboards;
  finally
    controller.free;
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
  motorista.idTransportadora := UsuarioLogado.UserLogado.getIdTransportadora;

 controller := ThomeController.Create;

  try
      controller.CadastrarMotorista(motorista);
      ShowMessage('Motorista cadastrado com sucesso!');
      mostrarUser('gerente', lswGerente,usuarioLogado.userLogado.getIdTransportadora);
      mostrarMotorista;
      AtualizarDashboards;
      CleanFields(Self);
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
  usuario.setIdGrupo(3);
  usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);

  controller := THomeController.Create;
  try
      controller.CadastrarUsuario(usuario);
      ShowMessage('Carregador cadastrado com sucesso!');
      mostrarUser('Carregador', lswCarregador,usuarioLogado.userLogado.getIdTransportadora);
      AtualizarDashboards;
      CleanFields(Self);
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
    mostrarUser('Carregador', lswCarregador,usuarioLogado.userLogado.getIdTransportadora);
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
      usuario.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);

    controller := ThomeController.create;
    try
      controller.EditarUser(usuario);
      showMessage('Carregador editado com sucesso!!');
      mostrarUser('Carregador', lswCarregador,usuarioLogado.userLogado.getIdTransportadora);
      CleanFields(Self);
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
  user.setCargo_descricao('Carregador');

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
    mostrarUser('Carregador', lswCarregador,usuarioLogado.userLogado.getIdTransportadora);
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o carregador selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaExcluir := StrToInt(lswCarregador.Selected.Caption);
  user := Tusuario.create;
  user.setId(codParaExcluir);
  user.setCargo_descricao('Carregador');

  controller := THomeController.Create;
  try
    controller.excluirUser(user);
    showMessage('Carregador excluido com sucesso.');
   mostrarUser('Carregador', lswCarregador,usuarioLogado.userLogado.getIdTransportadora);
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
var
  Controller: ThomeController;
  Carga: TtipoCargaDto;
  listaTipoCarga : TList<TtipoCargaDto>;
begin
  pnlOptionsVeiculo.visible := true;
  lblOptionsVeiculo.caption := 'cadastrar veiculo';
  pnlBtnCadastrarVeiculoConf.visible := true;
  pnlBtnEditarVeiculoConf.visible := false;
  pnlBtnRecuperarVeiculoConf.visible := false;
  pnlBtnExcluirVeiculoConf.visible := false;

  Controller := ThomeController.Create;
  listaTipoCarga := controller.cargasDisponiveis(userLogado.getIdTransportadora);
  try
    cbTipoCarga4veiculo.items.clear;
    for carga in listaTipoCarga do
    cbTipoCarga4veiculo.items.add(carga.TipoCarga);
  finally
    listaTipoCarga.free;
  end;
  Controller.Free;
end;



procedure TFormHome.lblBtnCadastrarVeiculoConfClick(Sender: TObject);
var
controller:THomeController;
veiculo :Tveiculo;
begin
veiculo := Tveiculo.Create;
  veiculo.setPlaca(MaskEditPlacaVeiculo.Text);
  veiculo.setAno(StrToInt(MaskEditAnoVeiculo.text));
  veiculo.setmodelo (edtModeloVeiculo.text);
  veiculo.setTipo_carga(cbTipoCarga4Veiculo.text);
  veiculo.setCapacidade(StrToInt(EdtCapacidadeVeiculo.text));
  veiculo.setUnidade_medida(cbUnidadeMedida.text);
  veiculo.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);



  controller := THomeController.Create;
  try
      controller.CadastrarVeiculo(veiculo);
      ShowMessage('veiculo cadastrado com sucesso!');
      mostrarVeiculo;
      AtualizarDashboards;
      CleanFields(Self);
    finally
      controller.Free;
  end;
    veiculo.Free;
end;


procedure TFormHome.lblBtnEditarVeiculoClick(Sender: TObject);
var
  Controller: ThomeController;
  listamotorista: TList<TmotoristaDto>;
  motorista: TmotoristaDto;
  idTransportadoraUsuario:Integer;
begin
pnlOptionsVeiculo.visible := true;
lblOptionsVeiculo.caption := 'Editar veiculo';
pnlBtnCadastrarVeiculoConf.visible := false;
pnlBtnEditarVeiculoConf.visible := true;
pnlBtnRecuperarVeiculoConf.visible := false;
pnlBtnExcluirVeiculoConf.visible := false;

  if lswVeiculos.selected = nil then begin
    showMessage('Selecione um veiculo na lista para editar');
    mostrarVeiculo;
    exit;
  end;

  MaskEditPlacaVeiculo.Text := lswVeiculos.selected.subItems[0];
  edtModeloVeiculo.Text := lswVeiculos.selected.subItems[1];
  MaskEditAnoVeiculo.Text := lswVeiculos.selected.subItems[2];
  cbTipoCarga4Veiculo.text := lswVeiculos.selected.subItems[4];
  EdtCapacidadeVeiculo.Text := lswVeiculos.selected.subItems[5];
  cbUnidadeMedida.Text := lswVeiculos.selected.subItems[6];
end;

procedure TFormHome.lblBtnEditarVeiculoConfClick(Sender: TObject);
var
controller:THomeController;
veiculo :Tveiculo;
idMotorista:String;
codParaEditar:Integer;
begin
veiculo := Tveiculo.Create;
  veiculo.setPlaca(MaskEditPlacaVeiculo.Text);
  veiculo.setAno(StrToInt(MaskEditAnoVeiculo.text));
  veiculo.setmodelo (edtModeloVeiculo.text);
  veiculo.setTipo_carga(cbTipoCarga4Veiculo.text);
  veiculo.setCapacidade(StrToInt(EdtCapacidadeVeiculo.text));
  veiculo.setUnidade_medida(cbUnidadeMedida.text);
 veiculo.SetIdTransportadora(UsuarioLogado.UserLogado.getIdTransportadora);

  codParaEditar := (StrToInt(lswVeiculos.Selected.Caption));
  veiculo.setId_veiculo(codParaEditar);

  controller := THomeController.Create;
  try
      controller.editarVeiculo(veiculo);
      ShowMessage('veiculo editado com sucesso!');
      mostrarVeiculo;
      AtualizarDashboards;
      CleanFields(Self);
    finally
      controller.Free;
  end;
    veiculo.Free;
end;

procedure TFormHome.imgFechaOptionsVeiculoClick(Sender: TObject);
begin
pnlOptionsVeiculo.visible := false;
end;

procedure TFormHome.lblBtnRecuperarVeiculoClick(Sender: TObject);
begin
pnlBtnRecuperarVeiculoConf.visible := true;
pnlBtnExcluirVeiculoConf.visible := false;

showMessage('agora a tabela vai mostrar os veiculos inativos para recuperar');
mostrarVeiculoInativo;
end;

procedure TFormHome.lblBtnRecuperarVeiculoConfClick(Sender: TObject);
var
controller : THomeController;
veiculo:Tveiculo;
codPararecuperar: Integer;
begin
  if lswVeiculos.selected = nil then begin
    showMessage('selecione um veiculo na lista para recuperar.');
    mostrarVeiculoInativo;
    exit;
  end;

  if MessageDlg('Tem certeza que deseja recuperar o veiculo selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codPararecuperar := StrToInt(lswVeiculos.Selected.Caption);
  veiculo:=Tveiculo.create;
  veiculo.setId_veiculo(codPararecuperar);

  controller := THomeController.Create;
  try
    controller.recuperarVeiculo(veiculo);
    showMessage('veiculo recuperado com sucesso!!');
    mostrarVeiculoInativo;
    AtualizarDashboards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.lblBtnExcluirVeiculoClick(Sender: TObject);
begin
pnlBtnRecuperarVeiculoConf.visible := false;
pnlBtnExcluirVeiculoConf.visible := true;
end;

procedure TFormHome.lblBtnExcluirVeiculoConfClick(Sender: TObject);
var
controller : THomeController;
veiculo:Tveiculo;
codParaExcluir: Integer;
begin
  if lswVeiculos.selected = nil then begin
    showMessage('selecione um veiculo na lista para Excluir.');
    mostrarVeiculo;
    exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o veiculo selecionado?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;

  codParaExcluir := StrToInt(lswVeiculos.Selected.Caption);
  veiculo:=Tveiculo.create;
  veiculo.setId_veiculo(codParaExcluir);

  controller := THomeController.Create;
  try
    controller.excluirVeiculo(veiculo);
    showMessage('veiculo excluido com sucesso.');
    mostrarVeiculo;
    AtualizarDashboards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.lblBtnMinhasOrdensClick(Sender: TObject);
begin
panelMinhasOrdens.Visible:=true;
ordensCarregamento4Carregadores;
ordensViagens4Motoristas;
end;

//================== criar ordens================================
procedure TFormHome.lblBtnConfCarregamentoClick(Sender: TObject);
var
carregamento:TcarregamentoDto;
controller:ThomeController;
begin
  controller:=ThomeController.create;

  carregamento.sCarregador := cbCarregador4Ordens.Text;
  carregamento.sVeiculo    := cbVeiculo4Ordens.Text;
  Carregamento.idPedido     := DataSourcePedidosOrdens.DataSet.FieldByName('idPedido').AsInteger;

  try
    controller.criarOrdemCarregamento(carregamento,usuarioLogado.UserLogado.getIdTransportadora);
    showMessage('Ordem criada com sucesso!');
    CleanFields(Self);
    mostrarOrdensCarreg;
  finally
    controller.free;
  end;
end;

procedure TFormHome.lblCriarOrdemViagemClick(Sender: TObject);
var
  controller:ThomeController;
  viagem:TviagemDto;
  idPedido: Integer;
  distancia: Double;
begin
  controller:= tHomeController.create;

  viagem.idCarregamento := DataSourceOrdensCarreg4viagens.DataSet.FieldByName('id').AsInteger;
  viagem.veiculo := DataSourceOrdensCarreg4viagens.DataSet.FieldByName('veiculo').AsString;
  viagem.motorista := cbMotorista4viagem.text;
  viagem.distancia_km :=  DataSourceOrdensCarreg4viagens.DataSet.FieldByName('distanciaKm').AsFloat;;

  try
    controller.criarOrdemViagem(viagem,usuarioLogado.UserLogado.getIdTransportadora);
    showMessage('Ordem criada com sucesso!');
    CleanFields(Self);
    mostrarOrdensViagens;
  finally
    controller.free;
  end;
end;

procedure TFormHome.DBGridPedidosOrdensCellClick(Column: TColumn);
var
  pesoPedido: Double;
  tipoCargaPedido: string;
  veiculo: TVeiculo;
  listaVeiculos:TobjectList<Tveiculo>;
  i: Integer;
  controller:ThomeController;
begin
  controller:=ThomeController.create;

  pesoPedido := DataSourcePedidosOrdens.DataSet.FieldByName('peso').AsFloat;
  tipoCargaPedido := DataSourcePedidosOrdens.DataSet.FieldByName('tipoDeCarga').AsString;

  cbVeiculo4Ordens.Clear;

  listaVeiculos := controller.buscarVeiculosDisponiveis(usuarioLogado.UserLogado.getIdTransportadora,pesoPedido, tipoCargaPedido);

  try
    for i := 0 to listaVeiculos.Count - 1 do
    begin
      veiculo := listaVeiculos[i];
      cbVeiculo4Ordens.Items.Add(
        IntToStr(veiculo.getId_veiculo) + ' - ' + veiculo.getModelo
      );
    end;
    if cbVeiculo4Ordens.Items.Count = 0 then
      ShowMessage('Nenhum veículo disponível para este tipo de carga e peso.');
  finally
    listaVeiculos.Free;
  end;
  controller.free;
end;

procedure TFormHome.imgIniciarCarregamentoClick(Sender: TObject);
var
  controller:ThomeController;
  carregamento:TcarregamentoDto;
  aIdPedido, aIdCarregamento:integer;
  aStatus:String;
begin
  controller:=ThomeController.create;

  carregamento.idCarregamento := DTordensCarreg4Carreg.dataSet.FieldByName('id').AsInteger;
  aIdCarregamento := carregamento.idCarregamento;

  carregamento.idPedido := DTordensCarreg4Carreg.dataSet.FieldByName('idPedido').AsInteger;
  aIdPedido:= carregamento.IdPedido;

  carregamento.status := DTordensCarreg4Carreg.dataSet.FieldByName('status').asString;;
  aStatus:= carregamento.status;

  try
    controller.iniciarCarregamento(usuarioLogado.UserLogado.getIdTransportadora,aIdCarregamento,aIdPedido,aStatus);
    ordensCarregamento4Carregadores;
    atualizarDashBoards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.imgIniciarOrdemViagemClick(Sender: TObject);
var
  controller:ThomeController;
  viagem:TviagemDto;
  aIdcarregamento, aIdviagem:integer;
  aStatus:String;
begin
  controller:=ThomeController.create;

  viagem.idviagem := DTOrdensMinhasOrdensViagens.dataSet.FieldByName('id').AsInteger;
  aIdviagem:= viagem.idviagem;

  viagem.idCarregamento := DTOrdensMinhasOrdensViagens.dataSet.FieldByName('idCarregamento').AsInteger;
  aIdcarregamento := viagem.Idcarregamento;

  viagem.status := DTOrdensMinhasOrdensViagens.dataSet.FieldByName('status').asString;
  aStatus:= viagem.status;

  try
    controller.iniciarviagem(usuarioLogado.UserLogado.getIdTransportadora,aIdCarregamento,aIdviagem,aStatus);
    ordensViagens4Motoristas;
    atualizarDashBoards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.imgFimCarregamentoClick(Sender: TObject);
var
  controller:ThomeController;
  carregamento:TcarregamentoDto;
  aIdPedido, aIdCarregamento:integer;
  aStatus:String;
begin
  controller:=ThomeController.create;

  carregamento.idCarregamento := DTordensCarreg4Carreg.dataSet.FieldByName('id').AsInteger;
  aIdCarregamento := carregamento.idCarregamento;

  carregamento.idPedido := DTordensCarreg4Carreg.dataSet.FieldByName('idPedido').AsInteger;
  aIdPedido:= carregamento.IdPedido;

  carregamento.status := DTordensCarreg4Carreg.dataSet.FieldByName('status').asString;;
  aStatus:= carregamento.status;

  try
    controller.finalizarCarregamento(usuarioLogado.UserLogado.getIdTransportadora,aIdCarregamento,aIdPedido,aStatus);
    ordensCarregamento4Carregadores;
    atualizarDashBoards;
  finally
    controller.free;
  end;
end;

procedure TFormHome.imgFinalizarOrdemViagemClick(Sender: TObject);
var
  controller:ThomeController;
  viagem:TviagemDto;
  aIdcarregamento, aIdviagem:integer;
  aStatus:String;
begin
  controller:=ThomeController.create;

  viagem.idviagem := DTOrdensMinhasOrdensViagens.dataSet.FieldByName('id').AsInteger;
  aIdviagem:= viagem.idviagem;

  viagem.idCarregamento := DTOrdensMinhasOrdensViagens.dataSet.FieldByName('idCarregamento').AsInteger;
  aIdcarregamento := viagem.Idcarregamento;

  viagem.status := DTOrdensMinhasOrdensViagens.dataSet.FieldByName('status').asString;
  aStatus:= viagem.status;

  try
    controller.finalizarviagem(usuarioLogado.UserLogado.getIdTransportadora,aIdCarregamento,aIdviagem,aStatus);
    ordensViagens4Motoristas;
    atualizarDashBoards;
  finally
    controller.free;
  end;
end;

//============RELATORIOS =====
procedure TFormHome.lblBtnEmitirRelFaturamentoClick(Sender: TObject);
var
  controller: ThomeController;
  data: TDateTime;
  idCLiente: Integer;
  clienteTxt: string;
begin
  controller := ThomeController.Create;
  try

    clienteTxt := ComboBoxClienteFiltro.Text;
    if clienteTxt <> '' then
      idCLiente := StrToIntDef(Trim(Copy(clienteTxt, 1, Pos(' - ', clienteTxt) - 1)), 0)
    else
      idCLiente := 0;

    if DateTimePickerFiltro.Checked then
    begin
      data := DateTimePickerFiltro.Date;
    end
    else
    begin
      data := 0;
    end;
    controller.relatorioFaturamento(userLogado.getIdTransportadora, idCLiente, data);

  finally
    controller.Free;
  end;
end;

procedure TFormHome.lblBtnRelFaturamentoClick(Sender: TObject);
var
  controller: ThomeController;
  ListaClientes: TObjectList<Tcliente>;
  i: Integer;
  cliente: Tcliente;
begin
  pnlFiltroFaturamento.Visible := true;
  controller := ThomeController.Create;
  try
    listaClientes := controller.ListarCliente(userLogado.getIdTransportadora);
    ComboBoxClienteFiltro.Items.Clear;
    for i := 0 to ListaClientes.Count - 1 do
    begin
      cliente := ListaClientes[i];
      ComboBoxClienteFiltro.Items.Add(IntToStr(cliente.getId) + ' - ' + cliente.getNome);
    end;
  finally
    controller.Free;
    ListaClientes.Free;
  end;
end;

procedure TFormHome.imgFechaFIltroRelFatClick(Sender: TObject);
begin
pnlFiltroFaturamento.Visible:=false;
end;


end.
