unit transpRepository;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, uTransportadora, System.Generics.Collections, unit2,tipoCargaDto;

type
  TTranspRepository = class
  private
  var
    FDQuery : TFDquery;
  public
    procedure CadastrarTransportadora(ATransp: TTransportadora; aTiposCarga: TList<TTipoCargaDto>);
    function atualizarTabela: TObjectList<TTransportadora>;
    procedure EditarTransportadora(Atransp:TTransportadora; aTiposCarga: TList<TTipoCargaDto>);
    procedure ExcluirTransportadora (Atransp:TTransportadora);
    function tabelaInativo: TObjectList<TTransportadora>;
    procedure RecuperarTransportadora(Atransp:TTransportadora);
    procedure InserirTipoCarga(aTiposCarga: TList<TTipoCargaDto>);
  end;

implementation

{ TTranspRepository }


function TTranspRepository.atualizarTabela:TObjectList<TTransportadora>;
var
  Lista: TObjectList<TTransportadora>;
  Transp: TTransportadora;
  FDquery: TFDQuery;
begin
  Lista := TObjectList<TTransportadora>.Create(True);
  FDQuery := TFDquery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT id, nome, cnpj, telefone, email, cep FROM public.transportadora WHERE ativo = TRUE ORDER BY id';

    FDQuery.Open;
    while not FDQuery.Eof do
    begin
      Transp := TTransportadora.Create;
      Transp.setId(FDQuery.FieldByName('id').AsInteger);
      Transp.setNome(FDQuery.FieldByName('nome').AsString);
      Transp.setCNPJ(FDQuery.FieldByName('cnpj').AsString);
      Transp.setTelefone(FDQuery.FieldByName('telefone').AsString);
      Transp.setEmail(FDQuery.FieldByName('Email').AsString);
      Transp.setCep(FDQuery.FieldByName('cep').AsString);

      Lista.Add(Transp);
      FDQuery.Next;
    end;
    Result := Lista;
  finally
    FDQuery.free;
  end;
end;

procedure TTranspRepository.CadastrarTransportadora(ATransp: TTransportadora; aTiposCarga: TList<TTipoCargaDto>);
var
  FDquery: TFDQuery;
  SchemaName, Script: string;
  SQLFile: TStringList;
  NovoIdTransportadora: Integer;
  dto: TTipoCargaDto;
begin
  FDQuery := TFDQuery.Create(nil);
  SQLFile := TStringList.Create;
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    SchemaName := StringReplace(LowerCase(Atransp.getNome), ' ', '_', [rfReplaceAll]);

    FDQuery.SQL.Text :=
      'INSERT INTO public.transportadora (nome, cnpj, telefone, email, cep, ativo, schema_name) ' +
      'VALUES (:nome, :cnpj, :telefone, :email, :cep, TRUE, :schema_name)' +
        'RETURNING id';
    FDQuery.ParamByName('nome').AsString := ATransp.getNome;
    FDQuery.ParamByName('cnpj').AsString := ATransp.getCNPJ;
    FDQuery.ParamByName('telefone').AsString := ATransp.getTelefone;
    FDQuery.ParamByName('email').AsString := ATransp.getEmail;
    FDQuery.ParamByName('cep').AsString := ATransp.getCep;
    FDQuery.ParamByName('schema_name').AsString := SchemaName;

    FDQuery.Open;
    NovoIdTransportadora := FDQuery.FieldByName('id').AsInteger;

    // Criação do schema
    DataModule2.FDConnection1.ExecSQL('CREATE SCHEMA IF NOT EXISTS ' + SchemaName);

    SQLFile.LoadFromFile('C:\Users\gabriel kuchma\Documents\Embarcadero\Studio\Projects\Projeto-Logix\src\DataBase\schema_base.sql');
    Script := StringReplace(SQLFile.Text, '{schema}', SchemaName, [rfReplaceAll]);

    DataModule2.FDConnection1.ExecSQL(Script);

    FDQuery.SQL.Text := 'INSERT INTO ' + (SchemaName) + '.tipo_carga (tipo, preco_base_km, id_transportadora) ' +
                          'VALUES (:tipo, :preco_base_km, :id_transportadora)';

    for dto in aTiposCarga do
      begin
        FDQuery.ParamByName('tipo').AsString := dto.TipoCarga;
        FDQuery.ParamByName('preco_base_km').AsCurrency := dto.precoBaseKmCarga;
        FDQuery.ParamByName('id_transportadora').AsInteger := NovoIdTransportadora;
        FDQuery.ExecSQL;
      end;

  finally
    FDQuery.Free;
    SQLFile.Free;
  end;
end;

procedure TTranspRepository.EditarTransportadora(Atransp: TTransportadora; aTiposCarga: TList<TTipoCargaDto>);
var
  FDquery: TFDQuery;
  SchemaName:String;
  dto: TTipoCargaDto;
begin
  FDQuery := TFDQuery.create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

    FDQuery.SQL.Text := 'UPDATE public.transportadora SET nome = :nome, cnpj = :cnpj, telefone = :telefone, email = :email, cep = :cep ' +
                    'WHERE id = :id';
    FDQuery.ParamByName('nome').AsString := ATransp.getNome;
    FDQuery.ParamByName('cnpj').AsString := ATransp.getCNPJ;
    FDQuery.ParamByName('telefone').AsString := ATransp.getTelefone;
    FDQuery.ParamByName('email').AsString := ATransp.getEmail;
    FDQuery.ParamByName('cep').AsString := ATransp.getCep;
    FDQuery.ParamByName('id').AsInteger := ATransp.getId;

    FDQuery.ExecSQL;

    FDQuery.SQL.Text := 'SELECT schema_name FROM public.transportadora WHERE id = :id';
      FDQuery.ParamByName('id').AsInteger := ATransp.getId;
      FDQuery.Open;

    SchemaName := FDQuery.FieldByName('schema_name').AsString;
    FDQuery.Close;

    FDQuery.SQL.Text := 'DELETE FROM ' + (SchemaName) + '.tipo_carga ' +
                          'WHERE id_transportadora = :id_transportadora';
      FDQuery.ParamByName('id_transportadora').AsInteger := ATransp.getId;
      FDQuery.ExecSQL;


      FDQuery.SQL.Text := 'INSERT INTO ' + (SchemaName) + '.tipo_carga (tipo, preco_base_km, id_transportadora) ' +
                          'VALUES (:tipo, :preco_base_km, :id_transportadora)';

      for dto in aTiposCarga do
      begin
        FDQuery.ParamByName('tipo').AsString := dto.TipoCarga;
        FDQuery.ParamByName('preco_base_km').AsCurrency := dto.precoBaseKmCarga;
        FDQuery.ParamByName('id_transportadora').AsInteger := ATransp.getId;
        FDQuery.ExecSQL;
      end;

  finally
    FDQuery.Free;
  end;

end;

procedure TTranspRepository.ExcluirTransportadora(Atransp: TTransportadora);
var
   FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.transportadora SET ativo = FALSE WHERE id = :id';
     FDQuery.ParamByName('id').AsInteger := ATransp.getId;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;


procedure TTranspRepository.InserirTipoCarga(aTiposCarga: TList<TTipoCargaDto>);
begin

end;

procedure TTranspRepository.RecuperarTransportadora(Atransp: TTransportadora);
var
  FDquery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := datamodule2.FDConnection1;

     FDQuery.SQL.Text := 'UPDATE public.transportadora SET ativo = True WHERE id = :id';
     FDQuery.ParamByName('id').AsInteger := ATransp.getId;

    FDQuery.ExecSQL;
  finally
    FDQuery.free;
  end;
end;

function TTranspRepository.tabelaInativo: TObjectList<TTransportadora>;
var
  Lista: TObjectList<TTransportadora>;
  Transp: TTransportadora;
  FDquery: TFDQuery;
begin
  Lista := TObjectList<TTransportadora>.Create(True);
  FDQuery := TFDquery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text := 'SELECT id, nome, cnpj, telefone, email, cep FROM public.transportadora WHERE ativo = false ORDER BY id';

    FDQuery.Open;
    while not FDQuery.Eof do
    begin
      Transp := TTransportadora.Create;
      Transp.setId(FDQuery.FieldByName('id').AsInteger);
      Transp.setNome(FDQuery.FieldByName('nome').AsString);
      Transp.setCNPJ(FDQuery.FieldByName('cnpj').AsString);
      Transp.setTelefone(FDQuery.FieldByName('telefone').AsString);
      Transp.setEmail(FDQuery.FieldByName('Email').AsString);
      Transp.setCep(FDQuery.FieldByName('cep').AsString);

      Lista.Add(Transp);
      FDQuery.Next;
    end;
    Result := Lista;
  finally
    FDQuery.free;
  end;
end;



end.

