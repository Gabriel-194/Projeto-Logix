unit uFormHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormHome = class(TForm)
    PanelHeader: TPanel;
    lblLogix: TLabel;
    Image1: TImage;
    PanelPermissoes: TPanel;
    Shape1: TShape;
    lblPermissoesbtn: TLabel;
    Panel1: TPanel;
    Shape2: TShape;
    Label1: TLabel;
    Panel2: TPanel;
    Shape3: TShape;
    Label2: TLabel;
    Panel3: TPanel;
    Shape4: TShape;
    Label3: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

end.
