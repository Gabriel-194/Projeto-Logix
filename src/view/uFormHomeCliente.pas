unit uFormHomeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, DBClient,uCleanFields,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask,HomeClienteController,enderecoDto,utransportadora,System.Generics.Collections,pedidoDto,usuarioLogado;

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
    lblCountPedidoFinalizados: TLabel;
    pedidosFeitos: TPanel;
    Shape8: TShape;
    Image3: TImage;
    Label5: TLabel;
    lblCountPedidos: TLabel;
    pedidoEmPreparo: TPanel;
    Shape2: TShape;
    Image4: TImage;
    Label1: TLabel;
    lblCountPedidoPreparando: TLabel;
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
    cbTipoCarga: TComboBox;
    cbTransp4Pedido: TComboBox;
    Label15: TLabel;
    pnlConfPedido: TPanel;
    Shape15: TShape;
    lblBtnConfirmarPedido: TLabel;
    Label14: TLabel;
    Panel11: TPanel;
    Shape16: TShape;
    edtDistanciaKm: TEdit;
    Panel10: TPanel;
    Shape14: TShape;
    edtPrecoFinal: TEdit;
    Panel14: TPanel;
    Shape18: TShape;
    lblBtnCalcularDistancia: TLabel;
    Label18: TLabel;
    Panel15: TPanel;
    Shape19: TShape;
    edtPesoPedido: TEdit;
    Label3: TLabel;
    pnlInstrucoesPedido: TPanel;
    Shape37: TShape;
    lblBtnInstrucoesPedido: TLabel;
    Panel9: TPanel;
    Shape20: TShape;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Image5: TImage;
    TabSheetMeusPedidos: TTabSheet;
    DBGridMeusPedidos: TDBGrid;
    DataSourcePedidos: TDataSource;
    Image6: TImage;
    imgAtualizarDashboard: TImage;
    procedure Image8Click(Sender: TObject);
    procedure imgFecharPanelCadastroClienteClick(Sender: TObject);
    procedure imgBuscaCepOrigemClick(Sender: TObject);
    procedure imgCepDestinoClick(Sender: TObject);
    procedure lblCadastrosBtnClick(Sender: TObject);
    procedure lblBtnCalcularDistanciaClick(Sender: TObject);
    procedure lblBtnCalcularFreteClick(Sender: TObject);
    procedure lblBtnConfirmarPedidoClick(Sender: TObject);
    procedure lblBtnInstrucoesPedidoMouseEnter(Sender: TObject);
    procedure lblBtnInstrucoesPedidoMouseLeave(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure lblBtnInstrucoesPedidoClick(Sender: TObject);
    procedure mostrarPedidos;
    procedure PageControlPedidosChange(Sender: TObject);
    procedure DBGridMeusPedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure atualizarDashBoards;
    procedure FormShow(Sender: TObject);
    procedure cbTipoCargaSelect(Sender: TObject);
    procedure imgAtualizarDashboardClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHomeCliente: TFormHomeCliente;

implementation

{$R *.dfm}

// ==================== on show do form==============================
procedure TFormHomeCliente.atualizarDashBoards;
var
controller : ThomeClienteController;
idCliente :integer;
begin
  controller := ThomeClienteController.create;
  idCliente := usuarioLogado.clienteLogado.getId;

  lblCountPedidos.caption := IntToStr(controller.ContarPedidos(idCliente,''));

  lblCountPedidoPreparando.caption := IntToStr(controller.ContarPedidos(idCliente,'Em preparo'));

  lblCountPedidoEmRota.caption := IntToStr(controller.ContarPedidos(idCliente,'Em rota'));

  lblCountPedidoFinalizados.caption := IntToStr(controller.ContarPedidos(idCliente,'Finalizado'));

end;

procedure TFormHomeCliente.FormShow(Sender: TObject);
begin
  atualizarDashboards;
end;

//================= mostrar pedidos ==================================

procedure TFormHomeCliente.mostrarPedidos;
var
  controller: THomeClienteController;
  pedidos: TList<TPedidoDto>;
  i: Integer;
  cds: TClientDataSet;
begin
  controller := THomeClienteController.Create;
  try
    pedidos := controller.BuscarPedidos(usuarioLogado.clienteLogado.getId);

    cds := TClientDataSet.Create(nil);
    try
      cds.FieldDefs.Add('idPedido', ftInteger);
      cds.FieldDefs.Add('cepOrigem', ftString, 12);
      cds.FieldDefs.Add('estadoOrigem', ftString, 20);
      cds.FieldDefs.Add('cepDestino', ftString, 12);
      cds.FieldDefs.Add('estadoDestino', ftString, 20);
      cds.FieldDefs.Add('transportadora', ftInteger);
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
        cds.FieldByName('cepOrigem').AsString      := pedidos[i].CepOrigem;
        cds.FieldByName('estadoOrigem').AsString   := pedidos[i].EstadoOrigem;
        cds.FieldByName('cepDestino').AsString     := pedidos[i].CepDestino;
        cds.FieldByName('estadoDestino').AsString  := pedidos[i].EstadoDestino;
        cds.FieldByName('transportadora').AsInteger := pedidos[i].idTransportadora;
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
//      cds.Free;
      pedidos.Free;
    end;
  finally
    controller.Free;
  end;
end;

procedure TFormHomeCliente.PageControlPedidosChange(Sender: TObject);
begin
 if PageControlPedidos.activePage = TabSheetMeusPedidos  then begin
   mostrarPedidos;
 end;
end;


procedure TFormHomeCliente.DBGridMeusPedidosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
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

// ================  criar pedido ====================================
procedure TFormHomeCliente.imgAtualizarDashboardClick(Sender: TObject);
begin
  atualizarDashBoards;
end;

procedure TFormHomeCliente.imgBuscaCepOrigemClick(Sender: TObject);
var
  Controller: ThomeClientecontroller;
  Endereco: TEndereco;
begin
  Controller := ThomeClientecontroller.Create;
  try
    Endereco := Controller.getByCep(MaskEditCepOrigem.text);

    edtEstadoOrigem.Text := Endereco.estado;
    edtMunicipioOrigem.Text := Endereco.municipio;
    edtEnderecoOrigem.Text := Endereco.endereco;
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

    edtEstadoDestino.Text := Endereco.estado;
    edtMunicipioDestino.Text := Endereco.municipio;
    edtEnderecoDestino.Text := Endereco.endereco;

  finally
    Controller.Free;
  end;
end;


procedure TFormHomeCliente.Image5Click(Sender: TObject);
begin
panel9.visible := false;
end;

procedure TFormHomeCliente.Image8Click(Sender: TObject);
begin
close;
end;

procedure TFormHomeCliente.imgFecharPanelCadastroClienteClick(Sender: TObject);
begin
pnlCriarPedido.visible := false;
PageControlPedidos.visible:= false;
end;


procedure TFormHomeCliente.lblBtnConfirmarPedidoClick(Sender: TObject);
var
  PedidoDto: TPedidoDto;
  Controller: THomeClienteController;
  nomeTransp :String;
  idxSeparador: Integer;
  schemaName :String;
begin

  PedidoDto.IdCliente := UsuarioLogado.clienteLogado.getId;
  PedidoDto.CepOrigem := maskEditCepOrigem.Text;
  PedidoDto.EstadoOrigem := edtEstadoOrigem.Text;
  PedidoDto.MunicipioOrigem := edtMunicipioOrigem.Text;
  PedidoDto.EnderecoOrigem := edtEnderecoOrigem.Text;
  PedidoDto.NumeroOrigem := edtNumeroEnderecoOrigem.Text;

  PedidoDto.CepDestino := maskEditCepDestino.Text;
  PedidoDto.EstadoDestino := edtEstadoDestino.Text;
  PedidoDto.MunicipioDestino := edtMunicipioDestino.Text;
  PedidoDto.EnderecoDestino := edtEnderecoDestino.Text;
  PedidoDto.NumeroDestino := edtNumeroEnderecoDestino.Text;


  PedidoDto.Peso := StrToFloatDef(edtPesoPedido.Text, 0);
  PedidoDto.DistanciaKm := StrToFloatDef(StringReplace(edtDistanciaKm.Text, 'km', '', [rfIgnoreCase, rfReplaceAll]), 0);

  PedidoDto.TipoCarga := cbTipoCarga.Text;

  nomeTransp := cbTransp4Pedido.Text;
  idxSeparador := Pos(' - ', nomeTransp);
  if idxSeparador > 0 then begin
    PedidoDto.IdTransportadora := StrToIntDef(Trim(Copy(nomeTransp, 1, idxSeparador - 1)), 0);
    nomeTransp := Copy(nomeTransp, idxSeparador + 3, Length(nomeTransp));
    schemaName := StringReplace(Trim(nomeTransp), ' ', '_', [rfReplaceAll]);

  end else
    PedidoDto.IdTransportadora := 0;


  PedidoDto.Preco := StrToFloatDef(edtPrecoFinal.Text, 0);
  PedidoDto.Status := 'Confirmado';

  Controller := THomeClienteController.Create;
  try
    controller.confirmarPedido(pedidoDto,schemaName);
    ShowMessage('Pedido confirmado com sucesso!');
    CleanFields(Self);
    atualizarDashboards;
  finally
    Controller.Free;
  end;
end;


procedure TFormHomeCliente.lblBtnInstrucoesPedidoClick(Sender: TObject);
begin
panel9.visible := true;
end;

procedure TFormHomeCliente.lblBtnInstrucoesPedidoMouseEnter(Sender: TObject);
begin
  shape37.pen.color := clBlue;
end;


procedure TFormHomeCliente.lblBtnInstrucoesPedidoMouseLeave(Sender: TObject);
begin
shape37.pen.color := clWhite;
end;

procedure TFormHomeCliente.lblBtnCalcularDistanciaClick(Sender: TObject);
var
  Controller: THomeClienteController;
  Distancia: Double;
  CepOrigem, CepDestino: string;
begin
  Controller := THomeClienteController.Create;
  try

    CepOrigem := MaskEditCepOrigem.Text;
    CepDestino := MaskEditCepDestino.Text;

    if (Trim(CepOrigem) = '') or (Trim(CepDestino) = '') then
    begin
      ShowMessage('Informe os dois CEPs para calcular a distância.');
      Exit;
    end;

    Distancia := Controller.CalcularDistanciaEntreCEPs(CepOrigem, CepDestino);

    edtDistanciaKm.Text := FormatFloat('0.'+'km', Distancia);

  except
    on E: Exception do
      ShowMessage('Erro ao calcular distância: ' + E.Message);
  end;

  Controller.Free;
end;

procedure TFormHomeCliente.lblBtnCalcularFreteClick(Sender: TObject);
var
  precoFinal: Double;
  controller: ThomeClienteController;
  schemaName: string;
  distancia: string;
  distanciaLimpa : double;
  nomeTransp : String;
  idxSeparador: Integer;
  tipo : String;
  pesoStr : string;
  pesoLimpo:double;
begin
  controller := ThomeClienteController.Create;
  try

     nomeTransp := cbTransp4Pedido.Text;
    idxSeparador := Pos(' - ', nomeTransp);
    if idxSeparador > 0 then
      nomeTransp := Copy(nomeTransp, idxSeparador + 3, Length(nomeTransp));

    schemaName := StringReplace(Trim(nomeTransp), ' ', '_', [rfReplaceAll]);
    tipo := cbTipoCarga.text;

    pesoStr := edtPesoPedido.text;
    pesoLimpo := strToFloat(StringReplace(pesoStr, '.', '', [rfIgnoreCase, rfReplaceAll]));

    distancia := edtDistanciaKm.Text;
    distanciaLimpa := strToFloat(StringReplace(distancia, 'km', '', [rfIgnoreCase, rfReplaceAll]));

    precoFinal := controller.CalcularFrete(schemaName, tipo, distanciaLimpa,pesoLimpo);

    edtPrecoFinal.Text := FormatFloat('0.00', precoFinal);
  finally
    controller.Free;
  end;
end;

procedure TFormHomeCliente.cbTipoCargaSelect(Sender: TObject);

var
  TipoCarga: string;
  ListaTransp: TList<TTransportadora>;
  Controller: THomeClienteController;
begin

  TipoCarga := cbTipoCarga.Text;

  Controller := THomeClienteController.Create;


  ListaTransp := Controller.BuscarTransportadorasPorTipoCarga(TipoCarga);

  cbTransp4Pedido.Items.Clear;
  for var Transp in ListaTransp do
    cbTransp4Pedido.Items.Add(Format('%d - %s', [Transp.getId, Transp.getNome]));

  cbTransp4Pedido.ItemIndex := 0;
  ListaTransp.Free;
end;

procedure TFormHomeCliente.lblCadastrosBtnClick(Sender: TObject);
var
  Controller: ThomeClientecontroller;
  Lista: TObjectList<TTransportadora>;
  Transp: TTransportadora;
begin
pnlCriarPedido.Visible := true;
PageControlPedidos.Visible := true;
Controller := ThomeClientecontroller.Create;
  try
    Lista := Controller.atualizarTabela;
    try
      cbTransp4Pedido.Items.Clear;

      for Transp in Lista do
        cbTransp4pedido.Items.Add(
          Transp.getId.ToString + ' - ' + Transp.getNome
        );
    finally
      Lista.Free;
    end;
  finally
    Controller.Free;
  end;
end;


end.
