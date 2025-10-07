unit uFormHomeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask,HomeClienteController,enderecoDto;

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
    lblBtnCalcularFrete: TLabel;
    Panel49: TPanel;
    Label12: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Panel41: TPanel;
    Panel42: TPanel;
    Shape52: TShape;
    edtMunicipioOrigem: TEdit;
    Panel43: TPanel;
    Shape53: TShape;
    MaskEditCepOrigem: TMaskEdit;
    Panel44: TPanel;
    Shape54: TShape;
    imgBuscaCepOrigem: TImage;
    Panel45: TPanel;
    Shape55: TShape;
    edtEstadoOrigem: TEdit;
    Panel46: TPanel;
    Shape56: TShape;
    edtEnderecoOrigem: TEdit;
    lblEndOrigem: TLabel;
    Panel13: TPanel;
    Shape41: TShape;
    edtNumeroEnderecoOrigem: TEdit;
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
    edtMunicipioDestino: TEdit;
    Panel4: TPanel;
    Shape4: TShape;
    MaskEditCepDestino: TMaskEdit;
    Panel5: TPanel;
    Shape9: TShape;
    imgCepDestino: TImage;
    Panel6: TPanel;
    Shape10: TShape;
    edtEstadoDestino: TEdit;
    Panel7: TPanel;
    Shape11: TShape;
    edtEnderecoDestino: TEdit;
    Panel8: TPanel;
    Shape13: TShape;
    edtNumeroEnderecoDestino: TEdit;
    cbUnidadeMedida: TComboBox;
    cbTransp4Admin: TComboBox;
    Panel9: TPanel;
    Label3: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel10: TPanel;
    Shape14: TShape;
    edtPrecoFinal: TEdit;
    pnlConfPedido: TPanel;
    Shape15: TShape;
    Label16: TLabel;
    procedure Image8Click(Sender: TObject);
    procedure imgFecharPanelCadastroClienteClick(Sender: TObject);
    procedure imgBuscaCepOrigemClick(Sender: TObject);
    procedure imgCepDestinoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHomeCliente: TFormHomeCliente;

implementation

{$R *.dfm}

procedure TFormHomeCliente.imgBuscaCepOrigemClick(Sender: TObject);
var
  Controller: ThomeClientecontroller;
  Endereco: TEndereco;
begin
  Controller := ThomeClientecontroller.Create;
  try
    Endereco := Controller.getByCep(MaskEditCepOrigem.text);

    edtEstadoOrigem.Text := Endereco.endereco;
    edtMunicipioOrigem.Text := Endereco.municipio;
    edtEnderecoOrigem.Text := Endereco.estado;
  finally
    Controller.Free;
  end;
end;

procedure TFormHomeCliente.imgCepDestinoClick(Sender: TObject);
var
  Controller: ThomeClientecontroller;
  Endereco: TEndereco;
begin
  Controller := ThomeClientecontroller.Create;
  try
    Endereco := Controller.getByCep(MaskEditCepDestino.text);

    edtEstadoDestino.Text := Endereco.endereco;
    edtMunicipioDestino.Text := Endereco.municipio;
    edtEnderecoDestino.Text := Endereco.estado;

  finally
    Controller.Free;
  end;
end;

procedure TFormHomeCliente.Image8Click(Sender: TObject);
begin
close;
end;

procedure TFormHomeCliente.imgFecharPanelCadastroClienteClick(Sender: TObject);
begin
PageControlPedidos.visible:= false;
end;

end.
