unit transpController;

interface

uses
  System.SysUtils, transpService,uTransportadora,System.Generics.Collections;

type
  TTranspController = class
  public
    procedure CadastrarTransportadora(ATransp: TTransportadora);
    function atualizarTabela: TObjectList<TTransportadora>;
    procedure EditarTranportadora(ATransp: TTransportadora);
    procedure ExcluirTransportadora (ATransp: TTransportadora);
    function tabelaInativo: TObjectList<TTransportadora>;
    procedure recuperarTransportadora (ATransp: TTransportadora);
  end;

  var
    service : TTranspService;
implementation

{ TTranspController }



function TTranspController.atualizarTabela: TObjectList<TTransportadora>;
begin
  service := TTranspService.create;
  try
    result :=service.atualizarTabela;
  finally
    Service.Free;
  end;
end;

procedure TTranspController.CadastrarTransportadora(ATransp: TTransportadora);
begin
  service := TTranspService.create;
 try
    Service.CadastrarTransportadora(ATransp);
  finally
    Service.Free;
  end;
end;

procedure TTranspController.EditarTranportadora(ATransp: TTransportadora);
begin
  service := TTranspService.create;
  try
    service.EditarTransportadora(Atransp);
  finally
    service.Free;
  end;
end;

procedure TTranspController.ExcluirTransportadora(ATransp: TTransportadora);
begin
service := TTranspService.create;
  try
    service.ExcluirTransportadora(Atransp);
  finally
    service.free;
  end;
end;



procedure TTranspController.recuperarTransportadora(ATransp: TTransportadora);
begin
service := TTranspService.create;
  try
    service.RecuperarTransportadora(Atransp);
  finally
    service.free;
  end;
end;

function TTranspController.tabelaInativo: TObjectList<TTransportadora>;
begin
  service := TTranspService.create;
  try
    result :=service.tabelaInativo;
  finally
    Service.Free;
  end;
end;

end.

