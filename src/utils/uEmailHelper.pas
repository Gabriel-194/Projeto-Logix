unit uEmailHelper;

interface

uses
  System.SysUtils, IdSMTP, IdMessage, IdSSLOpenSSL, IdExplicitTLSClientServerBase;

type
  TEmailHelper = class
  public
    class procedure EnviarEmailRecuperacao(Destinatario, Token: string);
  end;

implementation

class procedure TEmailHelper.EnviarEmailRecuperacao(Destinatario, Token: string);
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  Texto: string;
begin
  Msg := TIdMessage.Create(nil);
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  SMTP := TIdSMTP.Create(nil);

  try
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    Msg.From.Address := 'logix0203s@gmail.com';
    Msg.From.Name := 'Suporte Logix';
    Msg.Recipients.EMailAddresses := Destinatario;
    Msg.ContentType := 'text/html;charset=utf-8';
    Msg.Subject := 'Recuperação de Senha - Logix';

    Texto := 'Olá!<br><br>Para redefinir a sua senha, utilize o código abaixo:<br><br>';
    Texto := Texto + '<h1><b>' + Token + '</b></h1><br><br>';
    Texto := Texto + 'Se você não solicitou, ignore este e-mail.';
    Msg.Body.Text := Texto;

    SMTP.IOHandler := IdSSLIOHandlerSocket;
    SMTP.Host := 'smtp.gmail.com';
    SMTP.Port := 587;
    SMTP.AuthType := satDefault;
    SMTP.UseTLS := utUseImplicitTLS;
    SMTP.Username := 'logix0203@gmail.com';
    SMTP.Password := 'ewdl wpqr mmpj vapd';

    SMTP.Connect;
    try
      SMTP.Send(Msg);
    finally
      SMTP.Disconnect;
    end;
  finally
    SMTP.Free;
    IdSSLIOHandlerSocket.Free;
    Msg.Free;
  end;
end;

end.
