unit transpController;

interface

uses
  System.SysUtils, transpService,uTransportadora;

type
  TTranspController = class
  public
    procedure CadastrarTransportadora(ATransp: TTransportadora);
  end;

implementation

{ TTranspController }



procedure TTranspController.CadastrarTransportadora(ATransp: TTransportadora);
var
 service : TTranspService;
begin
  service := TTranspService.create;

 try
    Service.CadastrarTransportadora(ATransp);
  finally
    Service.Free;
  end;
end;

end.

