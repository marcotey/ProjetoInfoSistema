program PPrincipal;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UCliente in 'UCliente.pas',
  UEndereco in 'UEndereco.pas',
  UDMCliente in 'UDMCliente.pas' {DMCliente: TDataModule},
  UClienteControle in 'UClienteControle.pas',
  UClienteXML in 'UClienteXML.pas',
  uEmail in 'uEmail.pas',
  uEnvioEmail in 'uEnvioEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDMCliente, DMCliente);
  Application.Run;
end.
