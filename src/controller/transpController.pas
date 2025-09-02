unit transpController;

interface
  uses
    System.SysUtils, System.Classes, FireDAC.Comp.Client;
   type TTranspController = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);


    procedure CadastrarTransportadora(ANome, ACnpj, ATelefone, AEmail, ACep: string);
  end;

implementation
uses
  transpService;

constructor TTranspController.Create(AConnection: TFDConnection);
begin
  inherited Create;
  // Apenas atribui a refer�ncia da conex�o recebida
  // Valida��o para garantir que a conex�o n�o seja nula
  if not Assigned(AConnection) then
    raise Exception.Create('A conex�o com o banco de dados n�o foi fornecida para o Controller.');

  FConnection := AConnection;
end;

procedure TTranspController.CadastrarTransportadora(ANome, ACnpj, ATelefone, AEmail, ACep: string);
var
  Service: TTranspService;
begin
  Service := TTranspService.Create(FConnection);
  try
    Service.CadastrarTransportadora(ANome, ACnpj, ATelefone, AEmail, ACep);
  finally
    Service.Free;
  end;
end;



end.
