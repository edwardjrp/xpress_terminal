program Terminal;

{%ToDo 'Terminal.todo'}

uses
  Forms,
  SysUtils,
  XTerminal in 'XTerminal.pas' {frmPrincipal},
  Config in 'Config.pas' {frmConfig},
  About in 'About.pas' {frmAbout},
  Ruta in 'Ruta.pas' {frmRuta},
  Splass in 'Splass.pas' {frmSplash},
  UAdicional in 'UAdicional.pas' {frmAdicional},
  UGlobalMode in 'UGlobalMode.pas' {frmGlobal},
  TerminalSettings in 'TerminalSettings.pas' {frmSettings},
  AConfig in 'AConfig.pas' {frmAConfig},
  Tftp in 'Tftp.pas' {frmTftp};

{$R *.res}

begin
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSplash, frmSplash);
  frmSplash.show;
  frmSplash.Refresh;
  Application.Initialize;
  Sleep(1000);
  frmSplash.Free;
  Application.Title := 'Xpress Terminal';
  Application.Run;
end.
