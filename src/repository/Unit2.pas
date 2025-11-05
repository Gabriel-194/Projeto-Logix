unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxSmartMemo, frxClass, frCoreClasses, frxDBSet;

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
    FDQueryFaturamentototal_faturado: TFMTBCDField;
    FDQueryFaturamentototal_geral: TFMTBCDField;
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
