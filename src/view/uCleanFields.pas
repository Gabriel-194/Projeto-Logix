unit uCleanFields;

interface

uses
  Vcl.Controls, Vcl.StdCtrls, Vcl.Mask;

procedure CleanFields(Container: TWinControl);

implementation

procedure CleanFields(Container: TWinControl);
var
  i: Integer;
begin
  for i := 0 to Container.ControlCount - 1 do
  begin
    // TEdit
    if Container.Controls[i] is TEdit then
      TEdit(Container.Controls[i]).Clear

    // TMaskEdit
    else if Container.Controls[i] is TMaskEdit then
      TMaskEdit(Container.Controls[i]).Clear

    // TComboBox
    else if Container.Controls[i] is TComboBox then
      TComboBox(Container.Controls[i]).ItemIndex := -1;

    // Recursivo: Limpa GroupBox, Panel, Frame, etc
    if Container.Controls[i] is TWinControl then
      CleanFields(TWinControl(Container.Controls[i]));
  end;
end;

end.
