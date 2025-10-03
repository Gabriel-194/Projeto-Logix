unit uVeiculo;

interface

uses
  System.SysUtils;

type
  TVeiculo = class
  protected
    id_veiculo: Integer;
    placa: String;
    modelo: String;
    ano: Integer;
    tipo_carga: String;
    capacidade: integer;
    unidade_medida: String;
    id_motorista: Integer;
    idTransportadora :Integer;

  public
    procedure setId_veiculo(aId: Integer);
    function getId_veiculo: Integer;

    procedure setPlaca(aPlaca: String);
    function getPlaca: String;

    procedure setModelo(aModelo: String);
    function getModelo: String;

    procedure setAno(aAno: Integer);
    function getAno: Integer;

    procedure setTipo_carga(aTipoCarga: String);
    function getTipo_carga: String;

    procedure setCapacidade(aCapacidade: integer);
    function getCapacidade: integer;

    procedure setUnidade_medida(aUnidade: String);
    function getUnidade_medida: String;

    procedure setId_motorista(aIdMotorista: Integer);
    function getId_motorista: Integer;

    procedure SetIdTransportadora(aIdTransportadora :Integer);
    function getIdTransportadora : Integer;
  end;

implementation

{ TVeiculo }

function TVeiculo.getAno: Integer;
begin
  Result := Self.ano;
end;

function TVeiculo.getCapacidade: integer;
begin
  Result := Self.capacidade;
end;

function TVeiculo.getIdTransportadora: Integer;
begin
result := Self.idTransportadora;
end;

function TVeiculo.getId_motorista: Integer;
begin
  Result := Self.id_motorista;
end;

function TVeiculo.getId_veiculo: Integer;
begin
  Result := Self.id_veiculo;
end;

function TVeiculo.getModelo: String;
begin
  Result := Self.modelo;
end;

function TVeiculo.getPlaca: String;
begin
  Result := Self.placa;
end;

function TVeiculo.getTipo_carga: String;
begin
  Result := Self.tipo_carga;
end;

function TVeiculo.getUnidade_medida: String;
begin
  Result := Self.unidade_medida;
end;

procedure TVeiculo.setAno(aAno: Integer);
begin
  Self.ano := aAno;
end;

procedure TVeiculo.setCapacidade(aCapacidade: integer);
begin
  Self.capacidade := aCapacidade;
end;

procedure TVeiculo.SetIdTransportadora(aIdTransportadora: Integer);
begin
Self.IdTransportadora := aIdTransportadora;
end;

procedure TVeiculo.setId_motorista(aIdMotorista: Integer);
begin
  Self.id_motorista := aIdMotorista;
end;

procedure TVeiculo.setId_veiculo(aId: Integer);
begin
  Self.id_veiculo := aId;
end;

procedure TVeiculo.setModelo(aModelo: String);
begin
  Self.modelo := aModelo;
end;

procedure TVeiculo.setPlaca(aPlaca: String);
begin
  Self.placa := aPlaca;
end;

procedure TVeiculo.setTipo_carga(aTipoCarga: String);
begin
  Self.tipo_carga := aTipoCarga;
end;

procedure TVeiculo.setUnidade_medida(aUnidade: String);
begin
  Self.unidade_medida := aUnidade;
end;

end.
