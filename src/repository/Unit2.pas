unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxSmartMemo, frxClass, frCoreClasses, frxDBSet,
  frxExportBaseDialog, frxExportPDF;

    type
  TDataModule2 = class(TDataModule)
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    frxReportFaturamento: TfrxReport;
    FDConnection1: TFDConnection;
    FDQueryFaturamento: TFDQuery;
    frxDBDatasetFaturamento: TfrxDBDataset;
    FDQueryFaturamentoid_cliente: TIntegerField;
    FDQueryFaturamentonome: TWideStringField;
    FDQueryFaturamentocpf: TWideStringField;
    FDQueryFaturamentoemail: TWideStringField;
    FDQueryFaturamentototal_geral: TFMTBCDField;
    FDQueryFaturamentoid_pedido: TIntegerField;
    FDQueryFaturamentovalor_pedido: TFMTBCDField;
    FDQueryTimeCarreg: TFDQuery;
    frxDBDatasetTimeCarreg: TfrxDBDataset;
    FDQueryTimeCarregid_carregador: TIntegerField;
    FDQueryTimeCarregnome_carregador: TWideStringField;
    FDQueryTimeCarregid_carregamento: TIntegerField;
    FDQueryTimeCarregdata_hora_inicio: TSQLTimeStampField;
    FDQueryTimeCarregdata_hora_fim: TSQLTimeStampField;
    FDQueryTimeCarregtempo_hh_mm: TWideMemoField;
    FDQueryTimeCarregmedia_geral_hh_mm: TWideMemoField;
    frxReportTimecarreg: TfrxReport;
    FDQueryTimeViagem: TFDQuery;
    frxDBDatasetTimeViagem: TfrxDBDataset;
    frxReportTimeViagem: TfrxReport;
    FDQueryTimeViagemid_motorista: TIntegerField;
    FDQueryTimeViagemnome_motorista: TWideStringField;
    FDQueryTimeViagemid_viagem: TIntegerField;
    FDQueryTimeViagemdata_saida_cd: TSQLTimeStampField;
    FDQueryTimeViagemdata_chegada: TSQLTimeStampField;
    FDQueryTimeViagemtempo_hh_mm: TWideMemoField;
    FDQueryTimeViagemmedia_geral_hh_mm: TWideMemoField;
    FDQueryRelCliente: TFDQuery;
    FDQueryRelClientenspname: TWideStringField;
    FDQueryRelClienteid: TIntegerField;
    FDQueryRelClientenome: TWideStringField;
    FDQueryRelClientetotal_pedidos: TLargeintField;
    FDQueryRelClienteid_pedido: TIntegerField;
    FDQueryRelClientestatus: TWideStringField;
    FDQueryRelClientedata_pedido: TSQLTimeStampField;
    FDQueryRelClientetransportadora_id: TIntegerField;
    FDQueryRelClientetransportadora_nome: TWideStringField;
    frxDBDatasetRelCliente: TfrxDBDataset;
    FDQueryRelClientecliente_nome: TWideStringField;
    frxReportRelCliente: TfrxReport;
    frxPDFExportRelCliente: TfrxPDFExport;
    frxPDFExportFaturamento: TfrxPDFExport;
    frxPDFExportTimeCarreg: TfrxPDFExport;
    frxPDFExportTimeViagem: TfrxPDFExport;
    procedure DataModuleCreate(Sender: TObject);
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  FDPhysPgDriverLink1.VendorLib:= expandFileName(extractFilePath(paramStr(0))+ '..\..\lib\libpq.dll');
end;

end.
