unit formLoginTransportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Image2: TImage;
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    Shape1: TShape;
    Label12: TLabel;
    Panel6: TPanel;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel9: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Panel10: TPanel;
    Edit5: TEdit;
    Edit6: TEdit;
    Panel7: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Panel8: TPanel;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel5: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    Shape2: TShape;
    procedure FormResize(Sender: TObject);
    procedure Label12MouseEnter(Sender: TObject);
    procedure Label12MouseLeave(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormResize(Sender: TObject);
begin
  if (windowState = wsMaximized) then begin
//    CONFIGURA합ES PANEL3 max
    edit1.Margins.Left := 300;
    edit1.Margins.right := 300;

    edit2.Margins.Left := 300;
    edit2.Margins.right := 300;

    label1.Margins.Left := 350;
    label1.Margins.right := 350;

    label2.Margins.Left := 300;
    label2.Margins.right := 300;

    label3.Margins.Left := 300;
    label3.Margins.right := 300;
    label3.Margins.top:= 100;

    label4.Margins.Left := 450;
    label4.Margins.right := 300;

    button1.Margins.Left := 300;
    button1.Margins.right := 300;

    //  CONFIGURA합ES PANEL4 max
    label6.Margins.Top:= 100;
    label6.Margins.Left := 300;
    label6.Margins.right := 300;

    label12.Margins.Left := 470;
    label12.Margins.right := 470;

    //  CONFIGURA합ES PANEL5 max
    Panel5.Margins.left:=100;
    Panel5.Margins.right:=100;

    //  CONFIGURA합ES PANEL6 max
    Panel6.Margins.left:=100;
    Panel6.Margins.right:=100;

    //  CONFIGURA합ES PANEL7 max
    Panel7.Margins.left:=100;
    Panel7.Margins.right:=100;

    //  CONFIGURA합ES PANEL8 max
    Panel8.Margins.left:=100;
    Panel8.Margins.right:=100;

    //  CONFIGURA합ES PANEL9 max
    Panel9.Margins.left:=100;
    Panel9.Margins.right:=100;

    //  CONFIGURA합ES PANEL10 max
    Panel10.Margins.left:=100;
    Panel10.Margins.right:=100;
  end else begin
    //    CONFIGURA합ES PANEL3
    edit1.Margins.Left := 60;
    edit1.Margins.right := 60;

    edit2.Margins.Left := 60;
    edit2.Margins.right := 60;

    label1.Margins.Left := 180;
    label1.Margins.right := 180;

    label2.Margins.Left := 60;
    label2.Margins.right := 60;

    label3.Margins.Left := 60;
    label3.Margins.right := 60;
    label3.Margins.top:= 50;

    label4.Margins.Left := 250;
    label4.Margins.right := 250;

    button1.Margins.Left := 60;
    button1.Margins.right := 60;

    //  CONFIGURA합ES PANEL4
    label6.Margins.Top:= 20;
    label6.Margins.Left := 120;
    label6.Margins.right := 120;

    label12.Margins.Left := 320;
    label12.Margins.right := 320;
  end;
end;



procedure TForm1.Label12MouseEnter(Sender: TObject);
begin
   shape1.Visible:=true;
   Shape1.Left := Label12.Left -10;
   Shape1.Top :=  Label12.Top -5;
   shape1.Margins.Right := label12.Margins.right + 10;
   Shape1.Height := Label12.Height + 10;


end;

procedure TForm1.Label12MouseLeave(Sender: TObject);
begin
   shape1.Visible:=false;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  panel3.Visible:=false;
  panel4.Visible:=true;
end;

procedure TForm1.Label1MouseEnter(Sender: TObject);
begin
  shape2.Visible:=true;
   shape2.Visible:=true;
   Shape2.Left := Label1.Left -10;
   Shape2.Top :=  Label1.Top -5;
   shape2.Margins.Right := label1.Margins.right + 10;
   Shape2.Height := Label1.Height + 10;
end;

procedure TForm1.Label1MouseLeave(Sender: TObject);
begin
  shape2.Visible:=false;
end;

end.
