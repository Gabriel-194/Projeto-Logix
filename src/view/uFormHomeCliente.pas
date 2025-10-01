unit uFormHomeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
