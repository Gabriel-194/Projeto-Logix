unit motoristaDto;

interface
type TmotoristaDto = record
    IdUsuario: Integer;
    Nome: string;
    CPF: string;
    Telefone: string;
    Email: string;
    Senha: string;
    IdMotorista: Integer;
    NumeroCNH: string;
    CategoriaCNH: string;
    ValidadeCNH: TDate;
    cargo :string;
    idTransportadora:Integer;
end;

implementation

end.
