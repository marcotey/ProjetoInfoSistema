unit uEnvioEmail;

interface

uses System.Classes, uEmail;

type
   TEnvioEmail = class
      private
         class function FValidaCampos(pEmail: TEmail): Boolean;
      public
         class function FEnviaEmail(pEmail: TEmail): Boolean;
   end;

implementation

uses IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdExplicitTLSClientServerBase,
     IdAttachmentFile, System.SysUtils, System.UITypes, Vcl.Dialogs;

{ TEnvioEmail }

class function TEnvioEmail.FEnviaEmail(pEmail: TEmail): Boolean;
var
   IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
   IdSMTP: TIdSMTP;
   IdMessage: TIdMessage;
   IdText: TIdText;
   vAnexo: string;
   vDestinatario: string;
   I: Integer;
begin
   Result := False;
   if not FValidaCampos(pEmail) then
      Exit;
   IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
   IdSMTP := TIdSMTP.Create(nil);
   IdMessage := TIdMessage.Create(nil);
   try
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.AuthType := satDefault;
      IdSMTP.Port := pEmail.Porta;// 465;
      IdSMTP.Host := pEmail.Host.ToLower;// 'smtp.gmail.com';
      IdSMTP.Username := pEmail.UsuarioEmail.ToLower;// 'usuario@gmail.com';
      IdSMTP.Password := pEmail.SenhaEmail;// 'senha';

      IdMessage.From.Address := pEmail.Remetente.ToLower;// 'remetente@gmail.com';
      IdMessage.From.Name := pEmail.NomeRemetente;// 'Nome do Remetente';
      IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;

      for I := 0 to pEmail.Destinatarios.Count - 1 do
      begin
         vDestinatario := pEmail.Destinatarios[I];
         IdMessage.Recipients.Add.Text := vDestinatario.ToLower;// 'destinatario1@email.com';
      end;
      IdMessage.Subject := pEmail.Assunto;// 'Assunto do e-mail';
      IdMessage.Encoding := meMIME;

      IdText := TIdText.Create(IdMessage.MessageParts);
      try
         IdText.Body.Add(pEmail.CorpoEmail.Text);
         IdText.ContentType := pEmail.TipoConteudo;// 'text/plain; charset=iso-8859-1';

         for I := 0 to pEmail.CaminhosAnexos.Count - 1 do
         begin
            vAnexo := pEmail.CaminhosAnexos[I];
            TIdAttachmentFile.Create(IdMessage.MessageParts, vAnexo);
         end;

         try
            IdSMTP.Connect;
            IdSMTP.Authenticate;
         except
            on E:Exception do
            begin
               MessageDlg('Erro na conex�o ou autentica��o.' + #13 +
                          'Motivo: ' + E.Message, mtWarning, [mbOK], 0);
               pEmail.DescErro := E.Message;
               Exit;
            end;
         end;

         try
            IdSMTP.Send(IdMessage);
         except
            on E:Exception do
            begin
              MessageDlg('Erro ao enviar a mensagem.' + #13 +
                         'Motivo: ' + E.Message, mtWarning, [mbOK], 0);
              pEmail.DescErro := E.Message;
              Exit;
            end;
         end;
      finally
         IdText.Free;
      end;
   finally
      IdSMTP.Disconnect;
      UnLoadOpenSSLLibrary;
      IdMessage.Free;
      IdSSLIOHandlerSocket.Free;
      IdSMTP.Free;
   end;
   Result := True;
end;

class function TEnvioEmail.FValidaCampos(pEmail: TEmail): Boolean;
begin
   Result := False;
   if pEmail.Porta = 0 then
   begin
      MessageDlg('Porta n�o foi informada na configura��o do servidor SMTP.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.Host.Equals('') then
   begin
      MessageDlg('Host n�o foi informado na configura��o do servidor SMTP.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.UsuarioEmail.Equals('') then
   begin
      MessageDlg('Usu�rio n�o foi informado na configura��o do servidor SMTP.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.SenhaEmail.Equals('') then
   begin
      MessageDlg('Senha n�o foi informada na configura��o do servidor SMTP.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.Remetente.Equals('') then
   begin
      MessageDlg('Remetente n�o foi informado na configura��o da mensagem.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.NomeRemetente.Equals('') then
   begin
      MessageDlg('Nome do remetente n�o foi informado na configura��o da mensagem.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.Destinatarios.Text.Equals('') then
   begin
      MessageDlg('Destinat�rio n�o foi informado na configura��o da mensagem.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.Assunto.Equals('') then
   begin
      MessageDlg('Assunto n�o foi informado na configura��o da mensagem.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.CorpoEmail.Text.Equals('') then
   begin
      MessageDlg('Corpo do e-mail n�o foi informado na configura��o do corpo do e-mail.', mtInformation, [mbOK], 0);
      Exit;
   end;
   if pEmail.TipoConteudo.Equals('') then
   begin
      MessageDlg('Tipo de conte�do n�o foi informado na configura��o do corpo do e-mail.', mtInformation, [mbOK], 0);
      Exit;
   end;
   Result := True;
end;

end.
