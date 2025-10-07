unit uFormHomeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask;

type
  TFormHomeCliente = class(TForm)
    PanelHeader: TPanel;
    lblLogix: TLabel;
    Image1: TImage;
    Image8: TImage;
    PanelPermissoes: TPanel;
    Shape1: TShape;
    lblPermissoesbtn: TLabel;
    PanelClientes: TPanel;
    Shape5: TShape;
    lblClientesBtn: TLabel;
    pnl: TPanel;
    Shape6: TShape;
    lblCadastrosBtn: TLabel;
    pnlDashboardPedidos: TPanel;
    lblDashBoards: TLabel;
    pedidoEntregados: TPanel;
    Shape12: TShape;
    Image7: TImage;
    Label13: TLabel;
    lblCountPedidoEntregado: TLabel;
    pedidosFeitos: TPanel;
    Shape8: TShape;
    Image3: TImage;
    Label5: TLabel;
    lblCountPedidos: TLabel;
    pedidoEmPreparo: TPanel;
    Shape2: TShape;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pedidoEmRota: TPanel;
    Shape7: TShape;
    Image2: TImage;
    Label4: TLabel;
    lblCountPedidoEmRota: TLabel;
    DBGrid1: TDBGrid;
    pnlAçõesRapidas: TPanel;
    pnlCriarPedido: TPanel;
    PageControlPedidos: TPageControl;
    TabSheetCriarPedido: TTabSheet;
    TabSheetEditarPedido: TTabSheet;
    pnlCriarPedidoConf: TPanel;
    Shape40: TShape;
    lblBtnCadastrarClienteConf: TLabel;
    Panel49: TPanel;
    Label12: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Panel41: TPanel;
    Panel42: TPanel;
    Shape52: TShape;
    Edit2: TEdit;
    Panel43: TPanel;
    Shape53: TShape;
    MaskEdit1: TMaskEdit;
    Panel44: TPanel;
    Shape54: TShape;
    Image5: TImage;
    Panel45: TPanel;
    Shape55: TShape;
    Edit3: TEdit;
    Panel46: TPanel;
    Shape56: TShape;
    Edit4: TEdit;
    lblEndOrigem: TLabel;
    Panel13: TPanel;
    Shape41: TShape;
    edtNumeroEnderecoCliente: TEdit;
    Label21: TLabel;
    Label6: TLabel;
    imgFecharPanelCadastroCliente: TImage;
    lblEndDestino: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Shape3: TShape;
    Edit1: TEdit;
    Panel4: TPanel;
    Shape4: TShape;
    MaskEdit2: TMaskEdit;
    Panel5: TPanel;
    Shape9: TShape;
    Image6: TImage;
    Panel6: TPanel;
    Shape10: TShape;
    Edit5: TEdit;
    Panel7: TPanel;
    Shape11: TShape;
    Edit6: TEdit;
    Panel8: TPanel;
    Shape13: TShape;
    Edit7: TEdit;
    cbUnidadeMedida: TComboBox;
    procedure Image8Click(Sender: TObject);
    procedure imgFecharPanelCadastroClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHomeCliente: TFormHomeCliente;

implementation

{$R *.dfm}

procedure TFormHomeCliente.Image8Click(Sender: TObject);
begin
close;
end;

procedure TFormHomeCliente.imgFecharPanelCadastroClienteClick(Sender: TObject);
begin
PageControlPedidos.visible:= false;
end;

end.
