unit homeRepository;

interface
uses
data.DB,System.SysUtils, FireDAC.Comp.Client, unit2,System.Generics.Collections;
type ThomeRepository = class
  function mostrarPermissoes : TDataSet;
end;

implementation

{ ThomeRepository }

function ThomeRepository.mostrarPermissoes: TDataSet;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;
    FDQuery.SQL.Text := 'SELECT id_permissao, nome, descricao, selecionado FROM public.permissao ORDER BY id_permissao';
    FDQuery.Open;
  finally

  Result := FDQuery;
  end;
end;

end.
