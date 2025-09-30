unit homeRepository;

interface
uses
data.DB,System.SysUtils, FireDAC.Comp.Client, unit2,System.Generics.Collections;
type ThomeRepository = class
  function mostrarPermissoes : TDataSet;
  function ContarUsuariosPorCargo(const aCargo: string): Integer;
end;

implementation

{ ThomeRepository }

function ThomeRepository.ContarUsuariosPorCargo(const aCargo: string): Integer;
var
  FDQuery: TFDQuery;
begin
  Result := 0;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT COUNT(id_usuario) FROM public.usuarios ' +
                        'WHERE ativo = TRUE AND cargo_descricao = :cargo';

    FDQuery.ParamByName('cargo').AsString := aCargo;

    FDQuery.Open;

    if not FDQuery.IsEmpty then
      Result := FDQuery.Fields[0].AsInteger;

  finally
    FDQuery.Free;
  end;
end;

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
