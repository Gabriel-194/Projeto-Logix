unit adminRepository;

interface
uses
  System.SysUtils, FireDAC.Comp.Client, uUsuario, unit2,adminDto,uTransportadora, System.Generics.Collections;
type TadminRepository = class
  FDQuery : TFDquery;
  procedure cadastrarAdmin(AadminDto :TadminDto);


end;

implementation

{ TadminRepository }

procedure TadminRepository.cadastrarAdmin(AadminDto: TadminDto);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DataModule2.FDConnection1;

    FDQuery.SQL.Text :=
      'INSERT INTO public.usuarios ' +
      '(nome, cpf, telefone, email, senha_hash, cargo_descricao, ativo, status, data_cadastro, data_atualizacao, id_transportadora) ' +
      'VALUES (:nome, :cpf, :telefone, :email, :senha_hash, :cargo_descricao, TRUE, TRUE, NOW(), NOW(), :id_transportadora)';

    FDQuery.ParamByName('nome').AsString := AadminDto.nome;
    FDQuery.ParamByName('cpf').AsString := AadminDto.cpf;
    FDQuery.ParamByName('telefone').AsString := AadminDto.telefone;
    FDQuery.ParamByName('email').AsString := AadminDto.email;
    FDQuery.ParamByName('senha_hash').AsString := AadminDto.senha;
    FDQuery.ParamByName('cargo_descricao').AsString := 'ADMIN';
    FDQuery.ParamByName('id_transportadora').AsInteger := AadminDto.idTransportadora;

    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;
end;




end.
