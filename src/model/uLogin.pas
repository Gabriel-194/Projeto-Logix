unit uLogin;

interface
  type
    TLogin = class
    protected
    email : String;
    senha : String;
    public
    function getEmail: String;
    procedure setEmail(aEmail: string);

    function getSenha: String;
    procedure setSenha(aSenha: String);

  end;

implementation

{ TAdmin }



{ TAdmin }

function TLogin.getEmail: String;
begin
result := self.email;
end;

function TLogin.getSenha: String;
begin
result := self.senha;
end;

procedure TLogin.setEmail(aEmail: string);
begin
 self.email := aEmail;
end;

procedure Tlogin.setSenha(aSenha: String);
begin
 self.senha := aSenha;
end;

end.
