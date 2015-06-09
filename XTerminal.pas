unit XTerminal;

interface

uses
  Windows, Messages,SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ShellAPI, StdCtrls, Buttons, ComCtrls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, IdBaseComponent, IdIntercept,
  ExtCtrls, Menus, LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit,
  LMDCustomFileEdit, LMDFileOpenEdit, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDGraphicControl, LMDCustomGraphicLabel, LMDGraphicLabel, jpeg,
  Clipbrd, ActnMan, ActnCtrls, ActnMenus, ToolWin, ActnList, XPStyleActnCtrls,
  SUIButton, OoMisc, AdPort, AdWnPort, ADTrmEmu, AdMdm, LMDCustomComponent, IniFiles;

CONST
  {Time to wait before stop looking the conection with de remote modem,
   20 seconds means 3 rings back.
  }
  WaitTime = 35;

type
  TfrmPrincipal = class(TForm)
    LMDPanelFill1: TLMDPanelFill;
    Estado: TStatusBar;
    Abre: TOpenDialog;
    Image1: TImage;
    Tiempo: TTimer;
    EstConexion: TPanel;
    acManager: TActionManager;
    Logs1: TAction;
    Puerto1: TAction;
    AditionalTerminal1: TAction;
    CoolBar1: TCoolBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    Salir3: TAction;
    Ver1: TAction;
    AcercaDe1: TAction;
    Panel1: TPanel;
    btSoftwareMode: TsuiButton;
    btIndependetTerminal: TsuiButton;
    MultipleTerminal: TAction;
    PnlAuth: TPanel;
    Timer2: TTimer;
    LMDGraphicLabel1: TLMDGraphicLabel;
    btEthernetMode: TsuiButton;
    btModemMode: TsuiButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EthernetPort: TApdWinsockPort;
    Puerto: TApdComPort;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure FormCreate(Sender: TObject);
    procedure TiempoTimer(Sender: TObject);
    procedure Logs1Execute(Sender: TObject);
    procedure Puerto1Execute(Sender: TObject);
    procedure AditionalTerminal1Execute(Sender: TObject);
    procedure Salir3Execute(Sender: TObject);
    procedure Ver1Execute(Sender: TObject);
    procedure AcercaDe1Execute(Sender: TObject);
    procedure btSoftwareModeClick(Sender: TObject);
    procedure btIndependetTerminalClick(Sender: TObject);
    procedure MultipleTerminalExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure EthernetPortTriggerAvail(CP: TObject; Count: Word);
    procedure PuertoTriggerAvail(CP: TObject; Count: Word);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Secs,Hours,Mins,Time : Integer;
    {BufferStat holds the status sent back by the modem, i.e,
     NO CARRIER, BUSY, NO DIALTONE, ERROR, etc.
    }
    Codigo,BufferStat: String;
    ModemOK,NoCarrier,ModemConnect,ModemBusy,NoDialTone,StopAuthCode : Boolean;
    {DCD Modem Trigger Variable}
    TriggerDCD : Word;
    Procedure SetLog(MultipleTerminal : Boolean);
    Procedure EnableMenu(OnOff : Boolean);
    Procedure ChooseModel;
    Procedure EnableButtons(OnOff : Boolean);
    Procedure SendAuthCode;
    Procedure SendCloseCode;
    Procedure CloseActivePort;
    Procedure OpenPort;
    Procedure setChar(Caracter : Char);
    Function getPortConnected : Boolean;
    Procedure setPortBreak(OnOff : Boolean);
    Procedure ClearBuffer;
    Procedure setString(Cadena : String);
    Procedure setOpen(OnOff : Boolean);
    Function getActivePort : TApdCustomComPort;
    Procedure SaveLog(Mode : String); {Pending}
    {set Back the status of the application in order to reconnect to the XT Device}
    Procedure setAllBack;
   {Set the status bar info depending on the mode specified}
    Procedure setStatusInfo(Mode : String);
    Procedure setIni;
    Procedure freeIni;
    Procedure setLabels(Sender : TsuiButton; strLabel : String; strDefault : String);
  end;

var
  frmPrincipal: TfrmPrincipal;
  ActiveTerminal : Integer;
  {SectionPort and SectionXT Variables holds the name for the ini sections}
  Count,CountSec,strIniFile,SectionPort,SectionXT : String;
  PortSelected,LogPath : String;
  Host : String;
  EthePort : String;
  PhoneNo : String;
  Modelo, Incremento : Integer;
  Conectado,TCPIPEmulator,SimpleEmulator : Boolean;
  IniFile : TIniFile;

  {
   Local Access :
   Manual mode (not used), Software mode (sm)

   Remote Access :
   Ethernet mode (em), Modem mode (mm)

   These are the modes available for the application
  }
  ModoOperacion : String;
  Memos : Array Of TMemo;

implementation

uses Config, About, Ruta, Math, UAdicional,
  UGlobalMode, Tftp;

{$R *.dfm}
procedure TfrmPrincipal.FormCreate(Sender: TObject);
Var
  Cont : Integer;
begin
{Modem AT response to false}
ModemOk := False;
NoCarrier :=  False;
ModemConnect := False;
ModemBusy := False;
NoDialTone := False;
StopAuthCode := False;
TCPIPEmulator := False; // Used to map the tcp/ip terminal emulator option in the main menu
SimpleEmulator := False; // Used to map the simple terminal emulator option in the main menu
strIniFile := ExtractFilePath(Application.ExeName)+'xtf.ini';
{Used in both full and aditional versions}
SectionXT := 'XpressTerminal';
Try
  setIni;
  If IniFile.SectionExists(SectionXT) Then
    Begin
      PortSelected := IniFile.ReadString(SectionXT,'Port','');
      Host := IniFile.ReadString(SectionXT,'Host','');
      EthePort := IniFile.ReadString(SectionXT,'EthePort','');
      PhoneNo := IniFile.ReadString(SectionXT,'PhoneNo','');
      LogPath := IniFile.ReadString(SectionXT,'Path','');
    End
  Else
    Begin
      PortSelected := 'COM1';
      Host := '10.0.0.200';
      EthePort := '9999';
      PhoneNo := '101';
      LogPath := ExtractFilePath(Application.ExeName)+'Logs\';
      IniFile.WriteString(SectionXT,'Port',PortSelected);
      IniFile.WriteString(SectionXT,'Host',Host);
      IniFile.WriteString(SectionXT,'EthePort',EthePort);
      IniFile.WriteString(SectionXT,'PhoneNo',PhoneNo);
      IniFile.WriteString(SectionXT,'Path',LogPath);
      IniFile.WriteString(SectionXT,'Count','0');
      IniFile.WriteString(SectionXT,'CountSec','0');
    End; {End-If SectionXT doesn't exist}
  freeIni;
  {This line set the hidden attribute to the ini file}
  FileSetAttr(strIniFile,faHidden);
Except
{InMemory Code here}
End; {End-Try}

Estado.Panels[0].Text := ' Default COM Port : '+PortSelected;
{Set Memos up Runtime memo array}
SetLength(Memos,8);
For Cont := 0 To 7 Do
  Memos[Cont] := TMemo.Create(Self);
end;

procedure TfrmPrincipal.TiempoTimer(Sender: TObject);
begin
Secs := Secs + 1;
If Secs >= 60 Then
  Begin
    Mins := Mins + 1;
    Secs := 0;
  End;

If Mins >= 60 Then
  Begin
    Hours := Hours + 1;
    Mins := 0;
  End;
end;

procedure TfrmPrincipal.Logs1Execute(Sender: TObject);
begin
With TfrmRuta.Create(Self) Do
  Begin
    ShowModal;
    Free;
  End;
end;

procedure TfrmPrincipal.Puerto1Execute(Sender: TObject);
begin
With TfrmConfig.Create(Self) Do
  Begin
    ShowModal;
    Free;
  End;
Estado.Panels[0].Text := ' Default COM Port : '+PortSelected;
end;

procedure TfrmPrincipal.AditionalTerminal1Execute(Sender: TObject);
begin
  btIndependetTerminal.Click;
end;

procedure TfrmPrincipal.Salir3Execute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.Ver1Execute(Sender: TObject);
Var
  Archivo : String;
begin
Abre.InitialDir := LogPath;
If Abre.Execute Then
  Begin
    Archivo := Abre.FileName;
    If FileExists('C:\WINNT\NOTEPAD.EXE') Then
      Winexec(PChar('C:\WINNT\NOTEPAD.EXE '+Archivo),sw_normal)
    Else
      If FileExists('C:\WINDOWS\NOTEPAD.EXE') Then
        Winexec(PChar('C:\WINDOWS\NOTEPAD.EXE '+Archivo),sw_normal)
  End;
end;

procedure TfrmPrincipal.AcercaDe1Execute(Sender: TObject);
begin
With TfrmAbout.Create(Self) Do
  Begin
    ShowModal;
    Free;
  End;  
end;

procedure TfrmPrincipal.btSoftwareModeClick(Sender: TObject);
begin
{Default Value for ActiveTerminal}
If ((Sender As TsuiButton) = btModemMode) Then
  ModoOperacion := 'mm' {mm = Modem Mode}
Else
 If ((Sender As TsuiButton) = btEthernetMode) Then
   ModoOperacion := 'em' {em = Ethernet Mode}
 Else
   ModoOperacion := 'sm';
{Set the status bar info depending on the mode selected}
setStatusInfo(ModoOperacion);
SetLog(True);
Time := 0;
Incremento := 0;
{Stop sending the auth code to the remote device via modem}
StopAuthCode := False;
{Enable or disable the 4 connection buttons}
EnableButtons(False);
{Deshabilita o habilita todas las opciones del menu principal}
EnableMenu(False);
{Set false to the conectado state variable}
Conectado := False;
{Open the port to be connected to - [Ethernet / Com Ports]}
OpenPort;
{Panel de informacion}
StopAuthCode := False; {Stop sending the auth code to the remote device via modem}
Tiempo.Enabled := True;
Timer2.Enabled := True;
PnlAuth.Visible := True;
PnlAuth.Caption := 'Detecting XT Series Model...';
PnlAuth.Font.Color := clBlue;

{ModemMode Op Codes}
If ModoOperacion = 'mm' Then
  Begin
    If Length(PhoneNo) > 0 Then
      Begin
        ModemOk := False;
        NoCarrier := False;
        ModemConnect := False;
        ModemBusy := False;
        NoDialTone := False;
        setString('AT'+#13);
        While Not (ModemOk) Do
          Begin
            Application.ProcessMessages;
            If (Time > WaitTime)  then
              Begin
                setAllBack;
                Application.MessageBox('THE MODEM IS NOT RESPONDING','CONNECT ERROR - [XT 1.1]',MB_ICONSTOP);
                Exit;
              End; {End-Time}
          End; {End-While}
        {Reset the timers variables}
        Time := 0;
        Incremento := 0;
        Timer2.Enabled := False;
        Timer2.Enabled := True;
        setString('atdt'+TRIM(PhoneNo)+#13);
        While Not (ModemConnect) Do
          Begin
            Application.ProcessMessages;
            If (ModemBusy) Then
              Begin
                setAllBack;
                Application.MessageBox('THE PHONE IS BUSY','CONNECT ERROR - [XT 1.1]',MB_ICONSTOP);
                Exit;
              End;

            If (NoCarrier) Then
              Begin
                setAllBack;
                Application.MessageBox('THERE IS NOT CARRIER','CONNECT ERROR - [XT 1.1]',MB_ICONSTOP);
                Exit;
              End;

            If (NoDialTone) Then
              Begin
                setAllBack;
                Application.MessageBox('THERE IS NOT DIALTONE','CONNECT ERROR - [XT 1.1]',MB_ICONSTOP);
                Exit;
              End;

            If (Time > WaitTime)  then
              Begin
                setAllBack;
                Application.MessageBox('THE MODEM IS NOT RESPONDING','CONNECT ERROR - [XT 1.1]',MB_ICONSTOP);
                Exit;
              End; {End-Time}
          End;
      End {If Length(PhoneNo) > 0}
    Else
      Begin
        Application.MessageBox('PHONE NUMBER NOT FOUND','CONFIG ERROR - [XT 1.1]',MB_ICONSTOP);
        setAllBack;
        Exit;
      End; {End-Else Length < 0}
  End; {If ModoOperacion = 'mm'}

{This code is just for testing purposes}
Tiempo.Enabled := True;
Timer2.Enabled := True;
PnlAuth.Visible := True;
PnlAuth.Caption := 'Detecting XT Series Model...';
PnlAuth.Font.Color := clBlue;

{Send the authentication code to the XT device}
While Not(Conectado) Do
  Begin
    Application.ProcessMessages;
    {True when connected to the device}
    If Conectado = True Then
      Begin
        Timer2.Enabled := False;
        Tiempo.Enabled := False;
        ChooseModel; {Llama la ventana del modelo del equipo correspondiente}
        {Close the active port}
        CloseActivePort;
        {Enable or disable the 4 connection buttons}
        EnableButtons(True);
        If PnlAuth.Visible Then
          PnlAuth.Visible := False;
        {Deshabilita todas las opciones del menu principal}
        EnableMenu(True);
        Exit;
      End;

    {Send the auth code to the device, wow poetry}
     If Not (StopAuthCode) Then
       SendAuthCode;
     Sleep(100);
     If Time > WaitTime Then
       Begin
         setAllBack;
         If (ModoOperacion = 'mm') Then
           Application.MessageBox('THE AUTHENTICATION TIME IS UP, PLEASE CHECK YOUR MODEM CONNECTION.','CONNECT ERROR - [XT 1.1]',MB_ICONSTOP)
         Else
           Application.MessageBox('THE AUTHENTICATION TIME IS UP, PLEASE CHECK YOUR CONNECTION.','CONNECT ERROR - [XT 1.1]',MB_ICONSTOP);
         Exit;
       End;
   End;
{Close the active port}
CloseActivePort;
Tiempo.Enabled := False;
Timer2.Enabled :=  False;
{Enable or disable the 4 connection buttons}
EnableButtons(True);
{Deshabilita todas las opciones del menu principal}
EnableMenu(True);
end;

procedure TfrmPrincipal.btIndependetTerminalClick(Sender: TObject); {Pending}
begin
PnlAuth.Visible := False;
frmAdicional := TfrmAdicional.Create(Application);
With frmAdicional Do
  Begin
    ShowModal;
    Free;
  End;
If TCPIPEmulator Then
  TCPIPEmulator := False;

If SimpleEmulator Then
  SimpleEmulator := False;
end;

Procedure TfrmPrincipal.SetLog(MultipleTerminal : Boolean);
Var
  Cantidad,CantidadInd : Integer;
  Secuencia,SecuenciaInd : String;
begin
Time := 0;
setIni;
If Not (IniFile.SectionExists(SectionXT)) Then
  Begin
    IniFile.WriteString(SectionXT,'Path',LogPath);
    IniFile.WriteString(SectionXT,'Port',PortSelected);
    IniFile.WriteString(SectionXT,'Host',Host);
    IniFile.WriteString(SectionXT,'EthePort',EthePort);
    IniFile.WriteString(SectionXT,'PhoneNo',PhoneNo);
    If MultipleTerminal Then
      Begin
        IniFile.WriteString(SectionXT,'Count','1');
        IniFile.WriteString(SectionXT,'CountSec','0');
      End
    Else
      Begin
        IniFile.WriteString(SectionXT,'Count','0');
        IniFile.WriteString(SectionXT,'CountSec','1');
      End;

    If Not (DirectoryExists(LogPath)) Then
      ForceDirectories(LogPath);

    If MultipleTerminal Then
      Begin
        Count := '1';
        CountSec := '0';
      End
    Else
      Begin
        Count := '0';
        CountSec := '1';
      End;
  End {End-if Not Existe XpressTerminal Section}
Else
  Begin
    If MultipleTerminal Then
      Begin
        Secuencia := IniFile.ReadString(SectionXT,'Count','');
        Cantidad := StrToInt(Secuencia);
        Inc(Cantidad);
        IniFile.WriteString(SectionXT,'Count',IntToStr(Cantidad));
        Count := IniFile.ReadString(SectionXT,'Count','');
      End
    Else
      Begin
        SecuenciaInd := IniFile.ReadString(SectionXT,'CountSec','');
        CantidadInd := StrToInt(SecuenciaInd);
        Inc(CantidadInd);
        IniFile.WriteString(SectionXT,'CountSec',IntToStr(CantidadInd));
        CountSec := IniFile.ReadString(SectionXT,'CountSec','');
      End;
  End; {End-Else if the section exist}
freeIni;
End;

procedure TfrmPrincipal.MultipleTerminalExecute(Sender: TObject);
begin
  btSoftwareMode.Click;
end;

procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
begin
Inc(Incremento);
Inc(Time);
If Incremento > WaitTime Then
  Begin
    PnlAuth.Font.Color := clRed;
    PnlAuth.Caption := 'XT Series Model Not Detected!';
    Timer2.Enabled := False;
    Tiempo.Enabled := False;
    Incremento := 0;
  End;
end;

Procedure TfrmPrincipal.ChooseModel;
Begin
Case Modelo Of
  2:
    Begin
      {Puerto.Connected := False;
      frmGlobal2 := TfrmGlobal2.Create(Application);
      frmGlobal2.Puerto.Port := PortSelected;
      frmGlobal2.Puerto.Connected := True;
      frmGlobal2.Puerto.ClearBuffer(True,True);
      frmGlobal2.Tiempo.Enabled := True;
      frmGlobal2.ShowModal;
      frmGlobal2.Free;          }
    End;
  4:
    Begin
      {Puerto.Connected := False;
      frmGlobal4 := TfrmGlobal4.Create(Application);
      frmGlobal4.Puerto.Port := PortSelected;
      frmGlobal4.Puerto.Connected := True;
      frmGlobal4.Puerto.ClearBuffer(True,True);
      frmGlobal4.Tiempo.Enabled := True;
      frmGlobal4.ShowModal;
      frmGlobal4.Free;}
    End;
  8:
    Begin
      frmGlobal := TfrmGlobal.Create(Application);
      frmGlobal.Tiempo.Enabled := True;
      setLabels(frmGlobal.btTerm1,'btTerm1','Terminal 1');
      setLabels(frmGlobal.btTerm2,'btTerm2','Terminal 2');
      setLabels(frmGlobal.btTerm3,'btTerm3','Terminal 3');
      setLabels(frmGlobal.btTerm4,'btTerm4','Terminal 4');
      setLabels(frmGlobal.btTerm5,'btTerm5','Terminal 5');
      setLabels(frmGlobal.btTerm6,'btTerm6','Terminal 6');
      setLabels(frmGlobal.btTerm7,'btTerm7','Terminal 7');
      setLabels(frmGlobal.btTerm8,'btTerm8','Terminal 8');
      frmGlobal.ShowModal;
      frmGlobal.Free;
    End;
  12:
    Begin
      {Puerto.Connected := False;
      frmGlobal12 := TfrmGlobal12.Create(Application);
      frmGlobal12.Puerto.Port := PortSelected;
      frmGlobal12.Puerto.Connected := True;
      frmGlobal12.Puerto.ClearBuffer(True,True);
      frmGlobal12.Tiempo.Enabled := True;
      frmGlobal12.ShowModal;
      frmGlobal12.Free;}
    End;
end; {End-Case}

End;

Procedure TfrmPrincipal.EnableMenu(OnOff : Boolean);
Begin
  Logs1.Enabled := OnOff;
  Puerto1.Enabled := Logs1.Enabled;
  AditionalTerminal1.Enabled := Logs1.Enabled;
  MultipleTerminal.Enabled := Logs1.Enabled;
  Salir3.Enabled := Logs1.Enabled;
  Ver1.Enabled := Logs1.Enabled;
  AcercaDe1.Enabled := Logs1.Enabled;
End;

procedure TfrmPrincipal.EthernetPortTriggerAvail(CP: TObject; Count: Word);
Var
  Cont : Integer;
  Variable : String;
begin
For Cont := 1 To Count Do
  Variable := Variable + EthernetPort.GetChar;

If Not (Conectado) Then
  Begin
    If (Variable = #28#20#28#20) Then
      Begin
        setString(#25);
        Sleep(1);
        setString(#19);
        Sleep(1);
        setString(#31);
        Sleep(1);
        setString(#11);
      End;

      {El codigo de recibido aqui identifica el modelo del equipo en este caso
    los codigo son del modelo de 8 puertos}
    If (Variable = #20#28#20#28) Then
      Begin
        Conectado := True;
        ClearBuffer;
        Modelo := 8;
        Sleep(100);
        PnlAuth.Visible := False;
      End;

    If (Variable = #20#28#28#20) Then   //4 puertos.
      Begin
        Conectado := True;
        ClearBuffer;
        Modelo := 4;
        Sleep(100);
        PnlAuth.Visible := False;
      End;

    If (Variable = #28#20#20#28) Then  //12 puertos.
      Begin
        Conectado := True;
        ClearBuffer;
        Modelo := 12;
        Sleep(100);
        PnlAuth.Visible := False;
      End;

  End {End-If not Conectado}
Else {Available data}
  Begin
    Memos[ActiveTerminal].Text := Memos[ActiveTerminal].Text + Variable;
    If ModoOperacion = 'sm' Then
      SaveLog('SoftwareMode') {Save data into a txt file}
    Else
      If ModoOperacion = 'mm' Then
        SaveLog('ModemMode') {Save data into a txt file}
      Else
        If ModoOperacion = 'em' Then
          SaveLog('EthernetMode'); {Save data into a txt file}
  End;
end;

procedure TfrmPrincipal.PuertoTriggerAvail(CP: TObject; Count: Word);
Var
  Variable,ModemStatus : String; {ModemStatus Holds the entire status received by BufferStat}
  Cont : Integer;
begin
For Cont := 1 To Count Do
  Variable := Variable + Puerto.GetChar;

{Modem Control Commands}
If ((ModoOperacion = 'mm') And Not(Conectado)) Then
  Begin
    BufferStat := BufferStat + Variable;
    If (BufferStat[Length(BufferStat)] = #10) And (BufferStat[Length(BufferStat)-1] = #13) Then
      Begin
        ModemStatus := BufferStat;
        BufferStat := '';
      End;

    If Pos('OK',ModemStatus) > 0 Then
      ModemOK := True;

    If Pos('NO CARRIER',ModemStatus) > 0 Then
        NoCarrier := True;

    If Puerto.DCD Then
      ModemConnect := True;

    If Pos('BUSY',ModemStatus) > 0 Then
      ModemBusy := True;

    If Pos('NO DIALTONE',ModemStatus) > 0 Then
      NoDialTone := True;
  End; {If ModoOperacion = 'mm'}

If Not (Conectado) Then
  Begin
    If (Variable = #28#20#28#20) Then
      Begin
        setString(#25);
        Sleep(1);
        setString(#19);
        Sleep(1);
        setString(#31);
        Sleep(1);
        setString(#11);
        StopAuthCode := True;
      End {If Auth-Code is asked}
    Else
      Begin
        {El codigo de recibido aqui identifica el modelo del equipo en este caso
        los codigo son del modelo de 8 puertos}
        If (Variable = #20#28#20#28) Then
          Begin
            Conectado := True;
            ClearBuffer;
            Modelo := 8;
            Sleep(100);
            PnlAuth.Visible := False;
          End;

        If (Variable = #20#28#28#20) Then   //4 puertos.
          Begin
            Conectado := True;
            ClearBuffer;
            Modelo := 4;
            Sleep(100);
            PnlAuth.Visible := False;
          End;

        If (Variable = #28#20#20#28) Then  //12 puertos.
          Begin
            Conectado := True;
            ClearBuffer;
            Modelo := 12;
            Sleep(100);
            PnlAuth.Visible := False;
          End;
      End; {End-Else if the auth code change}    
  End {End-If not Conectado}
Else {Available data}
  Begin
    Memos[ActiveTerminal].Text := Memos[ActiveTerminal].Text + Variable;
    If ModoOperacion = 'sm' Then
      SaveLog('SoftwareMode') {Save data into a txt file}
    Else
      If ModoOperacion = 'mm' Then
        SaveLog('ModemMode') {Save data into a txt file}
      Else
        If ModoOperacion = 'em' Then
          SaveLog('EthernetMode'); {Save data into a txt file}
  End;
end;

Procedure TfrmPrincipal.EnableButtons(OnOff: Boolean);
Begin
  btSoftwareMode.Enabled := OnOff;
  btIndependetTerminal.Enabled := btSoftwareMode.Enabled;
  btEthernetMode.Enabled := btSoftwareMode.Enabled;
  btModemMode.Enabled := btSoftwareMode.Enabled;
End;

{Send authentication code to the XT device}
Procedure TfrmPrincipal.SendAuthCode;
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Puerto.PutString(#28#20#28#20#30)
Else
  If ModoOperacion = 'em' Then
    EthernetPort.PutString(#28#20#28#20#30);
End;

{Send close code to the XT device}
Procedure TfrmPrincipal.SendCloseCode;
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Puerto.PutString(#28#20#28#20#31)
Else
  If ModoOperacion = 'em' Then
    EthernetPort.PutString(#28#20#28#20#31);
End;

Procedure TfrmPrincipal.CloseActivePort;
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Puerto.Open := False
Else
  If ModoOperacion = 'em' Then
    EthernetPort.Open := False;
End;

Procedure TfrmPrincipal.OpenPort;
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Begin
    Puerto.ComNumber := StrToInt(Copy(PortSelected,4,1)); {Choose the port number}
    Puerto.Open := True;
  End
Else
  If ModoOperacion = 'em' Then
    Begin
      {Ethernet Mode Code}
      EthernetPort.WsAddress := Host;
      EthernetPort.WsPort := EthePort;
      EthernetPort.Open := True;
    End;
End;

Procedure TfrmPrincipal.setChar(Caracter: Char);
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Puerto.PutChar(Caracter)
Else
  If ModoOperacion = 'em' Then
    EthernetPort.PutChar(Caracter);
End;

Function TfrmPrincipal.getPortConnected: Boolean;
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Result := Puerto.Open
Else
  If ModoOperacion = 'em' Then
    Result := EthernetPort.Open;  
End;

Procedure TfrmPrincipal.setPortBreak(OnOff: Boolean);
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Puerto.SetBreak(OnOff)
Else
  If ModoOperacion = 'em' Then
    EthernetPort.SetBreak(OnOff);
End;

Procedure TfrmPrincipal.ClearBuffer;
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Begin
    Puerto.FlushInBuffer;
    Puerto.FlushOutBuffer;
  End
Else
  If ModoOperacion = 'em' Then
    Begin
      EthernetPort.FlushInBuffer;
      EthernetPort.FlushOutBuffer;
    End;
End;

Procedure TfrmPrincipal.setString(Cadena : String);
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Puerto.PutString(Cadena)
Else
  If ModoOperacion = 'em' Then
    EthernetPort.PutString(Cadena);
End;

Procedure TfrmPrincipal.setOpen(OnOff: Boolean);
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Puerto.Open := OnOff
Else
  If ModoOperacion = 'em' Then
    EthernetPort.Open := OnOff;
End;

Function TfrmPrincipal.getActivePort: TApdCustomComPort;
Begin
If ((ModoOperacion = 'sm') Or (ModoOperacion = 'mm')) Then
  Result := Puerto
Else
  If ModoOperacion = 'em' Then
    Result := EthernetPort;
End;

Procedure TfrmPrincipal.SaveLog(Mode : String); {Pending}
Var
  Fecha : String;
Begin
Fecha := FormatDateTime('yyyymmdd',Date);
If Not (DirectoryExists(LogPath)) Then
  ForceDirectories(LogPath);
Memos[ActiveTerminal].Lines.SaveToFile(LogPath+'\'+Mode+IntToStr(ActiveTerminal+1)+'_'+Fecha+'_'+Count+'.txt');
End;

Procedure TfrmPrincipal.setAllBack;
Begin
  Timer2.Enabled := False;
  Tiempo.Enabled := False;
  {Enable or disable the 4 connection buttons}
  EnableButtons(True);
  {Deshabilita todas las opciones del menu principal}
  EnableMenu(True);
  {Send the close code to the XT device}
  SendCloseCode;
  CloseActivePort;
End;

Procedure TfrmPrincipal.setStatusInfo(Mode: String);
Begin
{Set the status bar info depending on the mode selected}
If Mode = 'mm' Then
  Estado.Panels[0].Text := 'Calling to: '+PhoneNo+' - Port: '+PortSelected;

If Mode = 'em' Then
  Estado.Panels[0].Text := 'Host: '+Host+' - Port: '+EthePort;

If Mode = 'sm' Then
  Estado.Panels[0].Text := ' Default COM Port : '+PortSelected;
End;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If ((ssCtrl In Shift) And (Key = Ord('P'))) Then
  Puerto1Execute(Self);

If ((ssCtrl In Shift) And (Key = Ord('L'))) Then
  Logs1Execute(Self);
end;

Procedure TfrmPrincipal.setIni;
Begin
  IniFile := TIniFile.Create(strIniFile);
End;

Procedure TfrmPrincipal.freeIni;
Begin
  IniFile.Free;
End;

Procedure TfrmPrincipal.setLabels(Sender : TsuiButton; strLabel,
  strDefault: String);
Begin
setIni;
If IniFile.ReadString(SectionXT,strLabel,'') <> '' Then
  Sender.Caption := IniFile.ReadString(SectionXT,strLabel,'')
Else
  Sender.Caption := strDefault;

If IniFile.ReadString(SectionXT,strLabel+'Hint','') <> '' Then
  Sender.Hint := IniFile.ReadString(SectionXT,strLabel+'Hint','')
Else
  Sender.Hint := strDefault;
freeIni;
End;

procedure TfrmPrincipal.Action2Execute(Sender: TObject);
begin
TCPIPEmulator := True;
btIndependetTerminal.Click;
end;

procedure TfrmPrincipal.Action3Execute(Sender: TObject);
begin
SimpleEmulator := True;
btIndependetTerminal.Click;
end;

procedure TfrmPrincipal.Action1Execute(Sender: TObject);
begin
With TfrmTftp.Create(Self) Do
  Begin
    ShowModal;
    Free;
  End;  
end;

end.
