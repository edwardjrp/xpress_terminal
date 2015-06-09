{ IAMC Corporation
  
  Software Engineering Team
  
  Copyright (c) 2004-2005
  
  Powered By Eng. Edward Rodriguez
  
  * ----------------------------------------------------- *
  Unit : UAdicional.pas
  
  Task : This form is the main form for the free version of the
  XT Software where take place all the processes to interact
  with the XT device.                                           }

unit UAdicional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPortCtl, ComCtrls, CPort, ExtCtrls, Menus,Clipbrd,
  SUIButton, AdPort, AdWnPort, OoMisc, ADTrmEmu, IniFiles, DB,
  RxMemDS, AdMdm, AdStMach, AppEvnts, AdStatLt;

Const
  { Summary
    The C1 Constant is used in the Encriptar, Desencriptar
    functions used the encript and decript data.
    
    
    
    This two functions are not used for now.               }
  C1 = 1;
  { Summary
    The C2 Constant is used in the Encriptar, Desencriptar
    functions used the encript and decript data.
    
    
    
    This two functions are not used for now.               }
  C2 = 2;
  
type
  { <TITLE Main Form>
    <TITLEIMG frmAdicional>
    <KEYWORDS Main Form>
    <VERSIONSPECIFIC 1.0>
    
    Summary
    Application main form.
    
    Description
    This is the main form which contain most of the processes,
    methods and functions used to perform the comunications
    between the COM Ports and Telnet Port respectively.        }
  TfrmAdicional = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Puerto: TComPort;
    Panel2: TPanel;
    ConnectionLed: TComLed;
    Estado: TLabel;
    Tiempo: TTimer;
    Label5: TLabel;
    RXLed: TComLed;
    Label6: TLabel;
    TXLed: TComLed;
    ScrollBox1: TScrollBox;
    MTerminal: TMemo;
    Terminal: TComTerminal;
    btConnect: TsuiButton;
    Fuentes: TsuiButton;
    Settings: TsuiButton;
    Break: TsuiButton;
    Script: TsuiButton;
    PScript: TsuiButton;
    btClose: TsuiButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    btViewLog: TsuiButton;
    Abre: TOpenDialog;
    btLogs: TsuiButton;
    btAbout: TsuiButton;
    btPorts: TsuiButton;
    Telnet_Terminal: TAdTerminal;
    Telnet_Port: TApdWinsockPort;
    MTerminal_Telnet: TMemo;
    IniMemory: TRxMemoryData;
    IniMemoryPort: TStringField;
    IniMemoryBaudRate: TStringField;
    IniMemoryStopBits: TStringField;
    IniMemoryDataBits: TStringField;
    IniMemoryParity: TStringField;
    IniMemoryFlowControl: TStringField;
    IniMemoryCount: TStringField;
    IniMemoryCountSec: TStringField;
    IniMemoryPath: TStringField;
    IniMemoryIfTelnet: TBooleanField;
    IniMemoryHost: TStringField;
    IniMemoryTelnetPort: TStringField;
    IniMemoryCountTelnet: TStringField;
    ttyEmulator: TAdTTYEmulator;
    IniMemoryControlDTR: TStringField;
    IniMemoryControlRTS: TStringField;
    PnlAuth: TPanel;
    AdVT100Emulator1: TAdVT100Emulator;
    procedure TerminalStrRecieved(Sender: TObject; var Str: String);
    procedure TiempoTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure PuertoAfterOpen(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btConnectClick(Sender: TObject);
    procedure FuentesClick(Sender: TObject);
    procedure SettingsClick(Sender: TObject);
    procedure BreakClick(Sender: TObject);
    procedure ScriptClick(Sender: TObject);
    procedure PScriptClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btViewLogClick(Sender: TObject);
    procedure btLogsClick(Sender: TObject);
    procedure btAboutClick(Sender: TObject);
    procedure btPortsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Telnet_PortWsDisconnect(Sender: TObject);
    procedure Telnet_PortWsConnect(Sender: TObject);
    procedure Telnet_PortTriggerAvail(CP: TObject; Count: Word);
  private
    {Summary
     Hour, minutes and seconds variables.

     Description
     This variables represent the hours,minutes and seconds for
     a specific connection.
    }
    Secs,Hours, Mins : integer;
    {Summary
     CloseButton variable.

     Description
     CloseButton boolean variable is used to identify when the user
     close the window with the close button or the standard windows
     close button.
     }
    CloseButton : Boolean;
    TelnetConnected : Boolean;
    ConnectionSecs : Integer;
    { Summary
      Tab key catch method.

      Description
      This method catch the tab key when pressed.



      At this point the method is disabled, but at the beginning it
      was used the send the tab key character to the device
      connected, normally this key is used for autocomplete code
      purpose.                                                      }
    Procedure CMDialogKey(var Msg:TCMDialogKey);
    Message CM_DialogKey;
    procedure DisableComponents;
    procedure EnableComponents;
    Procedure SaveLog;
    Procedure TelnetFont;
    { Summary
      Minimize / Restore method.

      Description
      This method is used to catch the minimize and restore event
      when the user pressed the minimize or restore button.       }
    Procedure WMSysCommand(Var Msg : TWMSysCommand);
    Message WM_SysCommand;
    { Private declarations }
  public
    Procedure SetLog(MultipleTerminal : Boolean);
    Function GetFileLog(LogMode : String) : String;
    Procedure SetCOMLed(setCOM : Boolean);
    Procedure setIni;
    Procedure freeIni;
    { Public declarations }
  end;

var
  {Global variables}
  frmAdicional: TfrmAdicional;
  strAIniFile : String;
  AIniFile : TIniFile;
  APortSelected,AHost,AEthePort,ACountTelnet,ACount,ACountSec : String;
  { Summary
    The host variable, holds the remote host where the connection
    will take place when using telnet connections.
    The IniRoute variable holds the route of the ini file.
    The LastPort variable holds the last port used by the user.
    The PortSelected variable holds the port the user is actually
    working.
    The TelnetPort variable holds the port where the user want to
    connect remotly, mostly the common telnet port 23.            }
   LastPort,TelnetPort : String;
  { Summary
    Count,CountSec,Count holds a tracking number for every
    execution of the application. This generated number is saved
    in the ini file and is used to control de name of the file
    log generated.



    The Count variable is just used for the full vesion when the
    user is working in software mode.



    The CountSec variable is just used for manual mode connection
    to serial devices when the user is working in manual mode or
    using the freeware version of the software.



    The CountSec variable is just used for manual mode connection
    to remote equipments via telnet when the user is working in
    manual mode or using the freeware version of the software.



    The Directorio variable, holds the directory where the log
    files will be saved.                                          }
  Fecha : String;
  {InMemory if true, means the user is working from a read-only device such as, CD-ROM, dvd's, etc.
   NoTerminalLog means if the user will save any log or not when working inMemory Mode.
  }
  InMemory : Boolean = False;
  { Summary
    This variable indicates when the user is working in memory
    mode and the user don't need to generate any log data. If
    True the software won't save any log. If False, the software
    will ask the user for a new path to save the log data into
    files.



    InMemory modes means when the user is executing the
    application from a read only media like CD-Roms.             }
  NoTerminalLog : Boolean = False;

implementation

uses Ruta, About, Config, TerminalSettings, XTerminal, AConfig;

{$R *.dfm}

{ Summary
  Set Log method

  Description
  This method set the log sequence for manual and telnet mode,
  for both ini file working mode and in memory working mode.   }
Procedure TfrmAdicional.SetLog(MultipleTerminal : Boolean);
Var
  Cantidad,CantidadInd,CantidadTelnet : Integer;
  Secuencia,SecuenciaInd,SecuenciaTelnet : String;
begin
{InMemory means that the app. it's being executed from a read-only media and the
 ini config file can't be created, thereby the ini config settings will be
 in memory like a normal dataset.
}
If Not (InMemory) Then
  Begin
    setIni;
    {Verify if this section already exist in the ini file.
     If the section doesn't exist then the whole ini is created.
    }
    If Not (AIniFile.SectionExists(SectionXT)) Then
      Begin
        If Not (AIniFile.SectionExists('Puerto')) Then
          Puerto.StoreSettings(stIniFile,strAIniFile);
        AIniFile.WriteString(SectionXT,'Path',LogPath);
        AIniFile.WriteString(SectionXT,'IfTelnet','False');
        AIniFile.WriteString(SectionXT,'Host','');
        AIniFile.WriteString(SectionXT,'Port','23');
        AIniFile.WriteString(SectionXT,'ControlDTR','Enable');
        AIniFile.WriteString(SectionXT,'ControlRTS','Enable');

        {Telnet Sequence}
        AIniFile.WriteString(SectionXT,'CountTelnet','0');
        ACountTelnet := '0';
        If MultipleTerminal Then
          Begin
            AIniFile.WriteString(SectionXT,'Count','1');
            AIniFile.WriteString(SectionXT,'CountSec','0');
          End
        Else
          Begin
            AIniFile.WriteString(SectionXT,'Count','0');
            AIniFile.WriteString(SectionXT,'CountSec','1');
          End;


        If Not (DirectoryExists(LogPath)) Then
          ForceDirectories(LogPath);

        If MultipleTerminal Then
          Begin
            ACount := '1';
            ACountSec := '0';
          End
        Else
          Begin
            ACount := '0';
            ACountSec := '1';
          End;
      End {End-If If exist then the sequence for the log purpose is generated.}
    Else
      Begin
        {MutipleTerminal work just for Software Mode, in the free version this
         feature is not included.
        }
        If MultipleTerminal Then
          Begin
            Secuencia := AIniFile.ReadString(SectionXT,'Count','');
            Cantidad := StrToInt(Secuencia);
            Inc(Cantidad);
            AIniFile.WriteString(SectionXT,'Count',IntToStr(Cantidad));
            ACount := AIniFile.ReadString(SectionXT,'Count','');
          End
        Else
          Begin
            {This code snippet read the actual sequence for manual and
             telnet mode after that is converted to integer value and increased
             to the next sequence and written back to the ini file.
            }
            SecuenciaInd := AIniFile.ReadString(SectionXT,'CountSec','');
            CantidadInd := StrToInt(SecuenciaInd);
            Inc(CantidadInd);
            AIniFile.WriteString(SectionXT,'CountSec',IntToStr(CantidadInd));
            ACountSec := AIniFile.ReadString(SectionXT,'CountSec','');

            {Telnet Sequence}
            SecuenciaTelnet := AIniFile.ReadString(SectionXT,'CountTelnet','');
            CantidadTelnet := StrToInt(SecuenciaTelnet);
            Inc(CantidadTelnet);
            AIniFile.WriteString(SectionXT,'CountTelnet',IntToStr(CantidadTelnet));
            ACountTelnet := AIniFile.ReadString(SectionXT,'CountTelnet','');
          End;
        LogPath := AIniFile.ReadString(SectionXT,'Path','');
      End;
    freeIni;
  End {End-Not InMemory}
Else
  Begin
    {This code snippet read the actual sequence for manual and
     telnet mode after that is converted to integer value and increased
     to the next sequence and written back to the memory values.
     This part of this method works when the user is working from
     a read-only media.
    }
    If MultipleTerminal Then
      Begin
        Secuencia := IniMemoryCount.Value;
        Cantidad := StrToInt(Secuencia);
        Inc(Cantidad);
        IniMemory.Edit;
        IniMemoryCount.Value := IntToStr(Cantidad);
        IniMemory.Post;
        ACount := IniMemoryCount.Value;
      End
    Else
      Begin
        SecuenciaInd := IniMemoryCountSec.Value;
        CantidadInd := StrToInt(SecuenciaInd);
        Inc(CantidadInd);
        IniMemory.Edit;
        IniMemoryCountSec.Value := IntToStr(CantidadInd);
        IniMemory.Post;
        ACountSec := IniMemoryCountSec.Value;

        {Telnet Sequence}
        SecuenciaTelnet := IniMemoryCountTelnet.Value;
        CantidadTelnet := StrToInt(SecuenciaTelnet);
        Inc(CantidadTelnet);
        IniMemory.Edit;
        IniMemoryCountTelnet.Value := IntToStr(CantidadTelnet);
        IniMemory.Post;
        ACountTelnet := IniMemoryCountTelnet.Value;
      End;
    LogPath := IniMemoryPath.Value;
  End;{End-InMemory}
End;

{ Summary
  COM Port teminal strings received method.
  
  Description
  This method triggers up when the device connected to the COM
  port returns any character or string and save that text to
  the log file.                                                }
procedure TfrmAdicional.TerminalStrRecieved(Sender: TObject;
  var Str: String);
begin
  MTerminal.Text := MTerminal.Text + Str;
  SaveLog;
end;

{ Summary
  Timer method [Deprecated].
  
  Description
  This method was used to track the time connected with a
  terminal. Now is deprecated for this version of the software. }
procedure TfrmAdicional.TiempoTimer(Sender: TObject);
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

{Summary
 Check if the specified host is found or not in the tcp/ip connection.

 Description
 This code snippet check if within 10 seconds the application don't get connected
 to the remote host, in the case the host can't be found then the connection is closed.
}
If APortSelected = 'COMX' Then
  Begin
    If Not (TelnetConnected) Then
      Inc(ConnectionSecs);

    If ((ConnectionSecs = 10) And Not (TelnetConnected)) Then
      Begin
        Telnet_PortWsDisconnect(Self);
        Hours := 0;
        Mins := Hours;
        Secs := Hours;
        ConnectionSecs := Hours;
        Application.MessageBox('The host specified cannot be found.','Connection Error',MB_ICONERROR);
      End;
  End;
StatusBar1.Panels[4].Text := 'Connection Time : '+ IntToStr(Hours)+':'+IntToStr(Mins)+':'+IntToStr(Secs);
end;


{ Summary
  On Char method.
  
  Description
  This method occurs when there's any character or string
  available from the COM port terminals
                                                          }
{ Summary
  On Form Close Query Method
  
  Description
  This method ask for closing confirmation, at the same time
  check if there's any port open and close it.
  
  
  
  The CloseButton variable check if the user pressed the close
  button or the windows standard close button to close the
  current window.                                              }
procedure TfrmAdicional.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
If Not (CloseButton) Then
  Begin
    If MessageDlg('Do you want to close this window?.',mtConfirmation,mbOKCancel,0) = mrOK Then
      Begin
        //CanClose := True;
        If Puerto.Connected = True Then
          Puerto.Connected := False;

        If Telnet_Port.Open Then
          Telnet_Port.Open := False;
      End
    Else
      Begin
        CanClose := False;
        CloseButton := False;
      End;
  End;
{Else
  CanClose := True;}
end;

procedure TfrmAdicional.CMDialogKey(var Msg: TCMDialogKey);
begin
 {if Msg.CharCode = VK_TAB then
    Begin
     If (Puerto.Connected) then
      begin
       // Puerto.ClearBuffer(true,true);
        Puerto.TransmitChar(#9);
      end  
    End;}  
end;
{ Summary
  On Active form method.
  
  Description
  This method is triggered when the window become active. The
  code inside assign the today date, excute the
  DisableComponents method, assign to the status bar the port
  selected and call SetLog() method to execute the code that
  prepair the sequences and path used for log purpose in the
  whole application.                                          }
procedure TfrmAdicional.FormActivate(Sender: TObject);
begin
Fecha := FormatDateTime('yyyymmdd',Date); {Contiene la fecha global del sistema}
DisableComponents;
{Status bar values may vary based upon the value of PortSelected Variable}
If APortSelected <> 'COMX' Then
  Begin
    {Display options for COM Ports}
    StatusBar1.Panels[0].Text := ' Port : '+APortSelected;
    StatusBar1.Panels[1].Text := ' Baud Rate : '+BaudRateToStr(Puerto.BaudRate);
    StatusBar1.Panels[2].Text := ' Parity : '+ParityToStr(Puerto.Parity.Bits);
    StatusBar1.Panels[3].Text := ' Flow Control : '+FlowControlToStr(Puerto.FlowControl.FlowControl);
  End
Else
  Begin
    {Display options for Telnet Connections}
    StatusBar1.Panels[0].Text := ' Port : '+TelnetPort;
    StatusBar1.Panels[1].Text := ' Remote Host : '+AHost;
    StatusBar1.Panels[2].Text := EmptyStr;
    StatusBar1.Panels[3].Text := EmptyStr;
  End;
SetLog(False);
{The Port Setting is shown  when the user choose TCP/IP Terminal Emulator}
If TCPIPEmulator Then
  Begin
    Self.Caption := 'Xpress Terminal (TM) - TCP/IP Terminal Emulator';
    btPorts.Click;
  End
Else
  If SimpleEmulator Then
    Self.Caption := 'Xpress Terminal (TM) - Simple Terminal Emulator'
  Else
    Self.Caption := 'Xpress Terminal (TM) - Manual Mode';  
end;

{ Summary
  After Open method.
  
  Description
  This method enable the necessary components and send an enter
  key to the connected device.                                  }
procedure TfrmAdicional.PuertoAfterOpen(Sender: TObject);
begin
  EnableComponents;
end;

{ Summary
  Disable Components method.
  
  Description
  This method disable some of the components visually
  accessible for the user. Basically this method is called when
  the user is not connected to any device.                      }
procedure TfrmAdicional.DisableComponents;
begin
//Puertos.Enabled  := false;
Script.Enabled   := False;
PScript.Enabled  := False;
Settings.Enabled := False;
Fuentes.Enabled  := False;
Break.Enabled := False;
btPorts.Enabled := True;
end;

{ Summary
  Enable Components method.
  
  Description
  This method enable some of the components visually accessible
  for the user. Basically this method is called when the user
  is connected to a device.                                     }
procedure TfrmAdicional.EnableComponents;
begin
// Puertos.Enabled  := True;
Script.Enabled   := True;
PScript.Enabled  := True;
Settings.Enabled := True;
Fuentes.Enabled  := True;
Break.Enabled    := True;
btPorts.Enabled := False;
end;

{ Summary
  On Key Down method.
  
  Description
  This method triggers up when any key is pressed. }
procedure TfrmAdicional.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{This line execute the Paste Script button if the user press
 the Ctrl key + V key.
}
If ((ssCtrl In Shift) And (Key = 86)) Then
  PScript.Click;

{This line execute the Generate script button if the user press
 the Ctrl key + G key.
}
If ((ssCtrl In Shift) And (Key = 71)) Then
  Script.Click;

{This code snippet send a break signal to the active terminal,
 basically when the user press the break(19) key the Send Break
 method is executed.
}
If Key = 19 Then
  Break.Click;
end;

{ Summary
  Save Log method.
  
  Description
  This method save the log for the manual and telnet mode. }
Procedure TfrmAdicional.SaveLog;
begin
{If the path is not created then the force directory function create
 the whole complete path.
}
If Not (DirectoryExists(LogPath)) Then
  ForceDirectories(LogPath);

Try
  {If NoTerminalog is True then the log operation doesn't take effect.}
  If Not (NoTerminalLog) Then
    Begin
      {Save log for the manual mode.}
      If MTerminal.Visible Then
        MTerminal.Lines.SaveToFile(GetFileLog('Manual'));

      {Save log for the telnet mode.}
      If MTerminal_Telnet.Visible Then
        MTerminal_Telnet.Lines.SaveToFile(GetFileLog('Telnet'));
    End;
Except
{If there's some error normally is because the user is working from a read-only media
 and the software ask for an alternative log path. If the user doesn't specify a path not
 operation log will happen. Basically the global variable NoTemrinalLog is true if the user
 choose not make any file log.
}
  If Application.MessageBox('There is not a path specified for log purpose, Do you want to set a valid log path ?','Confirm log operation.',MB_OkCancel+MB_ICONQUESTION) = mrOk Then
    Begin
      With TfrmRuta.Create(Self) Do
        Begin
          ShowModal;
          Free;
        End;
    End
  Else
    NoTerminalLog := True;
End;

End;

{ Summary
  Connect method.
  
  Description
  This method connects or disconnect the actual terminal. This
  code basically works for both COM connections and Telnet
  connections.                                                 }
procedure TfrmAdicional.btConnectClick(Sender: TObject);
begin
{Based in the connect caption the code connect or disconnect
 the actual terminal.
}
If (Sender As TsuiButton).Caption = 'Connect' Then
  Begin
    {If PortSelected is COMX then the telnet mode is active}
    If APortSelected = 'COMX' Then
      Begin
        Try
          If (AHost <> '') And (TelnetPort <> '') Then
            Begin
              If LastPort <> '' Then
                If Not (APortSelected = LastPort) Then
                  Begin
                    Telnet_Terminal.Clear;
                    Secs := 0;
                    Hours := 0;
                    Mins := 0;
                  End;
              Telnet_Terminal.Clear;
              MTerminal.Visible := False;
              MTerminal_Telnet.Visible := True;
              Telnet_Port.WsAddress := AHost;
              Telnet_Port.WsPort := TelnetPort;
              SetCOMLed(False); {Unset the COM port to the leds.}
              PnlAuth.Visible := True;
              btPorts.Enabled := False; {Disable Port button while searching for remote host}
              Refresh;
              Telnet_Port.Open := True;
//              EnableCompdonents;
              
              ConnectionLed.State := lsOn; {Set the connection led to ON}
              Tiempo.Enabled := True;
              LastPort := APortSelected;
              Telnet_Terminal.Visible := True;
              Telnet_Terminal.SetFocus;
              Terminal.Visible := False;
              (Sender as TsuiButton).Caption := 'Disconnect';
              Estado.Caption := 'Connected';
          End
        Else
          Application.MessageBox('You must choose a host and a port to connect using telnet','Parameter Error',MB_ICONSTOP);
        Except
          Estado.Caption := 'Disconnected';
          btPorts.Enabled := True;
          Application.MessageBox('Cannot find the host specified.','Connection Error',MB_ICONERROR);
        End;
      End
    Else
      Begin
        Try
          {If the PortSelected is other that COMX then the the manual terminal mode is ative}
          MTerminal.Visible := True;
          MTerminal_Telnet.Visible := False;

          If LastPort <> '' Then
            If Not (APortSelected = LastPort) Then
              Begin
                Terminal.ClearScreen;
                Secs := 0;
                Hours := 0;
                Mins := 0;
              End;

          Puerto.Port := APortSelected;
          Tiempo.Enabled := True;
          Terminal.Visible := True;
          Terminal.SetFocus;
          Telnet_Terminal.Visible := False;
          SetCOMLed(True); {Set the COM port component to the leds.}
          Puerto.Connected := True;
          LastPort := APortSelected;
          Estado.Caption := 'Connected';
          (Sender as TsuiButton).Caption := 'Disconnect';
        Except
          Estado.Caption := 'Disconnected';
          Application.MessageBox('Cannot open the selected COM port.','Connection Error',MB_ICONERROR);
        End;
      End;
  End {End-If}
Else
  Begin
    If APortSelected = 'COMX' Then
      Begin
 //       Telnet_Terminal.Clear;
        Telnet_Port.Open := False;
        PnlAuth.Visible := False;
        btPorts.Enabled := True; {Disable Port button while searching for remote host}
        ConnectionLed.State := lsOff; {Set the connection led to OFF}
        Tiempo.Enabled := False;
        DisableComponents;
        (Sender as TsuiButton).Caption := 'Connect';
        Estado.Caption := 'Disconnected';
      End
    Else
      Begin
//        Terminal.ClearScreen;
        Puerto.Connected := False;
        Tiempo.Enabled := False;
        DisableComponents;
        Estado.Caption := 'Disconnected';
        (Sender As TsuiButton).Caption := 'Connect';
      End;
  End;
end;

{ Summary
  Font Config method.
  
  Description
  This method call the SetFocus window to config the terminal
  fonts available.                                            }
procedure TfrmAdicional.FuentesClick(Sender: TObject);
begin
If Terminal.Visible Then
  Begin
    Terminal.SelectFont;
    Terminal.SetFocus;
  End;

If Telnet_Terminal.Visible Then
  Begin
    TelnetFont;
    Telnet_Terminal.SetFocus;
  End;
end;

{ Summary
  Show Settings for the COM port terminal.
  
  Description
  This method call the setup dialog for the COM port terminal. }

procedure TfrmAdicional.SettingsClick(Sender: TObject);
begin
If Terminal.Visible Then
  Begin
    Terminal.ShowSetupDialog;
    Terminal.SetFocus;
  End;

If Telnet_Terminal.Visible Then
  Begin
    With TfrmSettings.Create(Self) Do
      Begin
        edColumns.Text := IntToStr(Telnet_Terminal.Columns);
        edRows.Text := IntToStr(Telnet_Terminal.Rows);
        Case Telnet_Terminal.CursorType Of
          ctBlock : cbCursorType.ItemIndex := 0;
          ctUnderline : cbCursorType.ItemIndex := 1;
          ctNone : cbCursorType.ItemIndex := 2;
        End;
        ShowModal;
        SetSettings(Telnet_Terminal);
        Free;
      End;
    Telnet_Terminal.SetFocus;  
  End;
end;

{ Summary
  Break button method.
  
  Description
  This method send a break signal to the terminal connected.
  First checks what terminal is visible, then check if the port
  is connected and send the break, wait for 1000 milliseconds
  and stop sending the break signal after that.
                                                                }
procedure TfrmAdicional.BreakClick(Sender: TObject);
begin
If Terminal.Visible Then
  Begin
    If Puerto.Connected = True Then
      Begin
        Puerto.SetBreak(True);
        sleep(1000);
        Puerto.SetBreak(False);
      End;
    Terminal.SetFocus;
  End;

If Telnet_Terminal.Visible Then
  Begin
    If Telnet_Port.Open Then
      Begin
        Telnet_Port.SetBreak(True);
        Sleep(1000);
        Telnet_Port.SetBreak(False);
      End;
    Telnet_Terminal.SetFocus;  
  End;
end;

{ Summary
  Genarate Script method.
  
  Description
  This method call the notepad so the user can build their own
  scripts and paste it to the terminal.                        }
procedure TfrmAdicional.ScriptClick(Sender: TObject);
begin
If FileExists('C:\WINNT\NOTEPAD.EXE') Then
  WinExec('C:\WINNT\NOTEPAD.EXE ',SW_Normal)
Else
  If FileExists('C:\WINDOWS\NOTEPAD.EXE') Then
    WinExec('C:\WINDOWS\NOTEPAD.EXE',SW_Normal);

If Terminal.Visible Then
  Terminal.SetFocus;

If Telnet_Terminal.Visible Then
  Telnet_Terminal.SetFocus;  
end;

{ Summary
  Paste Script method.
  
  Description
  This method take the clipboard text and paste it to the
  terminal.
  
  The code verify that the terminal and port are actived.
  
  The loop send character by character the clipboard text to
  the port.
  
  
  
  This code do the same for the normal terminal and the telnet
  terminal.                                                    }
procedure TfrmAdicional.PScriptClick(Sender: TObject);
Var
  ClipBoardText : String;
  Cont : Integer;
begin
If Terminal.Visible Then
  Begin
    If Puerto.Connected Then
      Begin
        ClipBoardText := ClipBoard.AsText;
        For Cont := 1 To Length(ClipBoardText) Do
          Begin
            Puerto.WriteStr(ClipBoardText[Cont]);
    //        Sleep(2);
          End;
      End;
    Terminal.SetFocus;  
  End;

If Telnet_Terminal.Visible Then
  Begin
    If Telnet_Port.Open Then
      Begin
        ClipBoardText := ClipBoard.AsText;
//        For Cont := 1 To Length(ClipBoardText) Do
          Telnet_Port.PutString(ClipBoardText);
      End;
    Telnet_Terminal.SetFocus;  
  End;
end;

{ Summary
  Close method.
  
  Description
  This method close the application. The CloseButton boolean
  variable handles the window when closing with the standard
  window close button.                                       }
procedure TfrmAdicional.btCloseClick(Sender: TObject);
begin
If MessageDlg('Do you want to close this window?.',mtConfirmation,mbOKCancel,0) = mrOK Then
  Begin
    CloseButton := True;
    If Puerto.Connected = True Then
      Puerto.Connected := False;

    If Telnet_Port.Open Then
      Telnet_Port.Open := False;

    Close;
  End
Else
  Begin
    CloseButton := False;
    If Terminal.Visible Then
      Terminal.SetFocus;

    If Telnet_Terminal.Visible Then
      Telnet_Terminal.SetFocus;
  End;
end;

{ Summary
  View log button method.
  
  Description
  The view log method execute the common Window open dialog to
  select the file and open notepad to view the content of the
  file.                                                        }
procedure TfrmAdicional.btViewLogClick(Sender: TObject);
Var
  Archivo : String;
begin
Abre.InitialDir := LogPath;
If Abre.Execute Then
  Begin
    Archivo := Abre.FileName;
    If FileExists('C:\WINNT\NOTEPAD.EXE') Then
      Winexec(PChar('C:\WINNT\NOTEPAD.EXE '+Archivo),SW_NORMAL)
    Else
      If FileExists('C:\WINDOWS\NOTEPAD.EXE') Then
        Winexec(PChar('C:\WINDOWS\NOTEPAD.EXE '+Archivo),SW_NORMAL);
  End;

If Terminal.Visible Then
  Terminal.SetFocus;

If Telnet_Terminal.Visible Then
  Telnet_Terminal.SetFocus;
end;


Procedure TfrmAdicional.WMSysCommand(var Msg: TWMSysCommand);
Begin
If (Msg.CmdType = SC_MINIMIZE) Then
  Application.Minimize;

If (Msg.CmdType = SC_RESTORE) Then
  Application.Restore;

DefaultHandler(Msg);
End;

{ Summary
  Log button method
  
  Description
  This method call the log window path configuration, where the
  user browse for a folder to save the XpressTerminal Logs.     }
procedure TfrmAdicional.btLogsClick(Sender: TObject);
begin
With TfrmRuta.Create(Self) Do
  Begin
    ShowModal;
    Free;
  End;

If Terminal.Visible Then
  Terminal.SetFocus;

If Telnet_Terminal.Visible Then
  Telnet_Terminal.SetFocus;
end;

{ Summary
  About button.
  
  Description
  This method show up the about form of the application. }
procedure TfrmAdicional.btAboutClick(Sender: TObject);
begin
With TfrmAbout.Create(Self) Do
  Begin
    ShowModal;
    Free;
  End;

If Terminal.Visible Then
  Terminal.SetFocus;

If Telnet_Terminal.Visible Then
  Telnet_Terminal.SetFocus;
end;

{ Summary
  Port Configuration method.
  
  Description
  This method call the frmConfig window which holds the COM
  ports and telnet configuration and set all comboboxes with
  the correct values.                                        }
procedure TfrmAdicional.btPortsClick(Sender: TObject);
begin
With TfrmAConfig.Create(Self) Do
  Begin
    {Asigna los puertos COM disponibles}
    {Asigna todos los baud rates disponibles}
    cbBaudRate.Items.Add(BaudRateToStr(br110));
    cbBaudRate.Items.Add(BaudRateToStr(br300));
    cbBaudRate.Items.Add(BaudRateToStr(br600));
    cbBaudRate.Items.Add(BaudRateToStr(br1200));
    cbBaudRate.Items.Add(BaudRateToStr(br2400));
    cbBaudRate.Items.Add(BaudRateToStr(br4800));
    cbBaudRate.Items.Add(BaudRateToStr(br9600));
    cbBaudRate.Items.Add(BaudRateToStr(br14400));
    cbBaudRate.Items.Add(BaudRateToStr(br19200));
    cbBaudRate.Items.Add(BaudRateToStr(br38400));
    cbBaudRate.Items.Add(BaudRateToStr(br56000));
    cbBaudRate.Items.Add(BaudRateToStr(br57600));
    cbBaudRate.Items.Add(BaudRateToStr(br115200));
    cbBaudRate.Items.Add(BaudRateToStr(br128000));
    cbBaudRate.Items.Add(BaudRateToStr(br256000));

    {Asigna las paridades disponibles}
    cbParity.Items.Add(ParityToStr(prNone));
    cbParity.Items.Add(ParityToStr(prOdd));
    cbParity.Items.Add(ParityToStr(prEven));
    cbParity.Items.Add(ParityToStr(prMark));
    cbParity.Items.Add(ParityToStr(prSpace));

    {Asigna los stop bits disponibles}
    cbStopBits.Items.Add(StopBitsToStr(sbOneStopBit));
    cbStopBits.Items.Add(StopBitsToStr(sbOne5StopBits));
    cbStopBits.Items.Add(StopBitsToStr(sbTwoStopBits));

    {Asigna los flow controls disponibles}
    cbFlowControl.Items.Add(FlowControlToStr(fcHardware));
    cbFlowControl.Items.Add(FlowControlToStr(fcSoftware));
    cbFlowControl.Items.Add(FlowControlToStr(fcCustom));
    cbFlowControl.Items.Add(FlowControlToStr(fcNone));

    ShowModal;
    Free;
    {Status bar values may vary based upon the value of PortSelected Variable}
    If APortSelected <> 'COMX' Then
      Begin
        {Display options for COM Ports}
        StatusBar1.Panels[0].Text := ' Port : '+APortSelected;
        StatusBar1.Panels[1].Text := ' Baud Rate : '+BaudRateToStr(Puerto.BaudRate);
        StatusBar1.Panels[2].Text := ' Parity : '+ParityToStr(Puerto.Parity.Bits);
        StatusBar1.Panels[3].Text := ' Flow Control : '+FlowControlToStr(Puerto.FlowControl.FlowControl);
      End
    Else
      Begin
        {Display options for Telnet Connections}
        StatusBar1.Panels[0].Text := ' Port : '+TelnetPort;
        StatusBar1.Panels[1].Text := ' Remote Host : '+AHost;
        StatusBar1.Panels[2].Text := EmptyStr;
        StatusBar1.Panels[3].Text := EmptyStr;
      End;
  End;
end;

{ Summary
  On Form Create method.
  
  Description
  This method triggers up when the main form is created.
  
  
  
  IniFile local variable has the exact route of the ini config
  file.

  IniRoute global variable has same route as iniFile, but this
  make the value available for any unit inside the project.
                                                               }
procedure TfrmAdicional.FormCreate(Sender: TObject);
Var
  IfTelnet : Boolean;
begin
strAIniFile := ExtractFilePath(Application.ExeName)+'xta.ini';
Try
  setIni;
  {Verify if this section already exist in the ini file}
  If AIniFile.SectionExists(SectionXT) Then
    Begin
      {The value for IfTelnet identify if the connection telnet was used last time,
      if true then PortSelected will be COMX value, and Host = to the last host connected
      and the Port used,else if the las connection was through COM Port then, the
      loadsetting load the saved configuration for COM port connection.
      }
      IfTelnet := StrToBool(AIniFile.ReadString(SectionXT,'IfTelnet',''));
      If IfTelnet Then
        Begin
          APortSelected := 'COMX';
          AHost := AIniFile.ReadString(SectionXT,'Host','');
          TelnetPort := AIniFile.ReadString(SectionXT,'Port','')
        End
      Else
        Begin
          Puerto.LoadSettings(stIniFile,strAIniFile);

          If AIniFile.ReadString('Puerto','FlowControl','') = 'Custom' Then
            Begin
              {Control DTR values in memory}
              If AIniFile.ReadString(SectionXT,'ControlDTR','') = 'Disable' Then
                Puerto.FlowControl.ControlDTR := dtrDisable;

              If AIniFile.ReadString(SectionXT,'ControlDTR','') = 'Enable' Then
                Puerto.FlowControl.ControlDTR := dtrEnable;

              If AIniFile.ReadString(SectionXT,'ControlDTR','') = 'Handshake' Then
                Puerto.FlowControl.ControlDTR := dtrHandshake;

              {Control RTS values in memory}
              If AIniFile.ReadString(SectionXT,'ControlRTS','') = 'Disable' Then
                Puerto.FlowControl.ControlRTS := rtsDisable;

              If AIniFile.ReadString(SectionXT,'ControlRTS','') = 'Enable' Then
                Puerto.FlowControl.ControlRTS := rtsEnable;

              If AIniFile.ReadString(SectionXT,'ControlRTS','') = 'Handshake' Then
                Puerto.FlowControl.ControlRTS := rtsHandshake;
            End;
          APortSelected := Puerto.Port;
        End;
    End {End-SectionExists}
  Else {Sino existe entonces se crea la estructura completa del ini}
    Begin
      Puerto.StoreSettings(stIniFile,strAIniFile);
      AIniFile.WriteString(SectionXT,'Count','0');
      AIniFile.WriteString(SectionXT,'CountSec','0');
      AIniFile.WriteString(SectionXT,'Path',LogPath);
      AIniFile.WriteString(SectionXT,'IfTelnet','False');
      AIniFile.WriteString(SectionXT,'Host','');
      AIniFile.WriteString(SectionXT,'Port','23');
      AIniFile.WriteString(SectionXT,'CountTelnet','0');
      AIniFile.WriteString(SectionXT,'ControlDTR','Enable');
      AIniFile.WriteString(SectionXT,'ControlRTS','Enable');
      APortSelected := Puerto.Port;
    End;

  {If the Port section is not created in the ini file then, StoreSettings recreate it again}
  If Not (AIniFile.SectionExists('Puerto')) Then
    Puerto.StoreSettings(stIniFile,strAIniFile);
freeIni;
{This line set the hidden attribute to the ini file}
FileSetAttr(strAIniFile,faHidden);
Except
  {This section works only when the user work from read-only devices such as
   CD-Rom's, DVD's and non-writeable units, the code below load all the necessary settings for
   the ports configuration in memory. The values for every configuration is treated in memory as
   a normal database dataset but in memory.
  }
  InMemory := True;
  If Not(IniMemory.Active) Then
    IniMemory.Open;
  {IniMemory is the components who save the config setting for connections in memory}
  With IniMemory Do                                                 
    Begin
      Insert;
      FieldByName('Port').Value := 'COM1';
      FieldByName('BaudRate').Value := '9600';
      FieldByName('StopBits').Value := '1';
      FieldByName('DataBits').Value := '8';
      FieldByName('Parity').Value := 'None';
      FieldByName('FlowControl').Value := 'Custom';
      FieldByName('Count').Value := '0';
      FieldByName('CountSec').Value := '0';
      FieldByName('Path').Value := LogPath;
      FieldByName('IfTelnet').Value := False;
      FieldByName('Host').Value := '';
      FieldByName('TelnetPort').Value := '23';
      FieldByName('CountTelnet').Value := '0';
      FieldByName('ControlDTR').Value := 'Enable';
      FieldByName('ControlRTS').Value := 'Enable';
      Post;
      If Puerto.Connected Then
        Puerto.Connected := False;
      APortSelected := IniMemoryPort.Value;
      Puerto.Port := APortSelected;
      Puerto.BaudRate := StrToBaudRate(IniMemoryBaudRate.Value);
      Puerto.StopBits := StrToStopBits(IniMemoryStopBits.Value);
      Puerto.DataBits := StrToDataBits(IniMemoryDataBits.Value);
      Puerto.Parity.Bits := StrToParity(IniMemoryParity.Value);

      If IniMemoryFlowControl.Value = 'Custom' Then
        Begin
          {Control DTR values in memory}
          If IniMemoryControlDTR.Value = 'Disable' Then
            Puerto.FlowControl.ControlDTR := dtrDisable;

          If IniMemoryControlDTR.Value = 'Enable' Then
            Puerto.FlowControl.ControlDTR := dtrEnable;

          If IniMemoryControlDTR.Value = 'Handshake' Then
            Puerto.FlowControl.ControlDTR := dtrHandshake;

          {Control RTS values in memory}
          If IniMemoryControlRTS.Value = 'Disable' Then
            Puerto.FlowControl.ControlRTS := rtsDisable;

          If IniMemoryControlRTS.Value = 'Enable' Then
            Puerto.FlowControl.ControlRTS := rtsEnable;

          If IniMemoryControlRTS.Value = 'Handshake' Then
            Puerto.FlowControl.ControlRTS := rtsHandshake;
        End;
      Puerto.FlowControl.FlowControl := StrToFlowControl(IniMemoryFlowControl.Value);

      IfTelnet := IniMemoryIfTelnet.Value;
      If IfTelnet Then
        Begin
          APortSelected := 'COMX';
          AHost := IniMemoryHost.Value;
          TelnetPort := IniMemoryTelnetPort.Value;
        End
      Else
        APortSelected := IniMemoryPort.Value;
    End;
End; {End-Try-Except}
end;

{ Summary
  On Resize method.
  
  Description
  Here the application set the Telnet Terminal to the same size
  as the COM Terminal component.                                }
procedure TfrmAdicional.FormResize(Sender: TObject);
begin
  Telnet_Terminal.Width := Terminal.Width;
  Telnet_Terminal.Height:= Terminal.Height;
end;

{ Summary
  Telnet teminal disconnect method.
  
  Description
  This method triggers up when the telnet port disconnect from
  the remote host.                                             }
procedure TfrmAdicional.Telnet_PortWsDisconnect(Sender: TObject);
begin
  btConnect.Click;
  PnlAuth.Visible := False;
  btPorts.Enabled := True; {Disable Port button while searching for remote host}
//  Settings.Enabled := True;
  TelnetConnected := False;
  ConnectionSecs := 0;
  ConnectionLed.State := lsOff; {Set the connection led to OFF}
//  Fuentes.Enabled := True;
end;

{ Summary
  Telnet terminal connect method.
  
  Description
  This methos triggers up when the telnet terminal and port are
  connected so the application enable the necessary componentes
  and disable others for this type of connection.
                                                                }
procedure TfrmAdicional.Telnet_PortWsConnect(Sender: TObject);
begin
  EnableComponents;
  PnlAuth.Visible := False;
//  Settings.Enabled := False;
  TelnetConnected := True;
  ConnectionSecs := 0; {Telnet Connection seconds}
  ConnectionLed.State := lsOn; {Set the connection led to ON}
//  Fuentes.Enabled := False;
end;

{ Summary
  Telnet teminal strings received method.
  
  Description
  This method triggers up when the telnet terminal is connected
  to a remote host and it returns any character or string so
  it's save that text to the log file.                          }
procedure TfrmAdicional.Telnet_PortTriggerAvail(CP: TObject; Count: Word);
Var
  Cont : Integer;
begin
For Cont := 1 To Count Do
  MTerminal_Telnet.Text := MTerminal_Telnet.Text + Telnet_Port.GetChar;
SaveLog;
//RxLed.State := lsOff;
end;

{ Summary
  Get File Log method.
  
  Description
  This method returns the full path and name of the file log.
  
  The LogMode parameter specify two values.
      * Manual which return the name and path of the file when
        working in Manual Mode.
      * Telnet which return the name and path of the file when
        working in telnet mode for remote access to any host.  }
Function TfrmAdicional.GetFileLog(LogMode : String) : String;
Begin
If LogMode = 'Manual' Then
  Result := LogPath+'ManualMode'+Fecha+'_'+ACountSec+'.txt';

If LogMode = 'Telnet' Then
  Result := LogPath+'TCPIPManualMode'+Fecha+'_'+ACountTelnet+'.txt';
End;

{ Summary
  Telnet font method.
  
  Description
  This procedures create a font dialog so the user can choose
  the font and styles for the telnet terminal.                }
Procedure TfrmAdicional.TelnetFont;
Begin
With TFontDialog.Create(Application) Do
  begin
    Options := Options + [fdFixedPitchOnly];
    Font := Telnet_Terminal.Font;
    If Execute Then
      Telnet_Terminal.Font := Font;
    Free;
  End;
Telnet_Terminal.SetFocus;
End;

{Summary
 Set or Remove the COM Port to the leds.

 Description
 This method set or remove the COM port to the indicator leds in a way
 to use the same leds for telnet and COM ports connections.
}

procedure TfrmAdicional.SetCOMLed(setCOM: Boolean);
begin
If setCOM Then
  Begin
    ConnectionLed.ComPort := Puerto;
    RXLed.ComPort := Puerto;
    TXLed.ComPort := Puerto;
  End
Else
  Begin
    ConnectionLed.ComPort := Nil;
    RXLed.ComPort := Nil;
    TXLed.ComPort := Nil;
  End;
end;

Procedure TfrmAdicional.setIni;
Begin
  AIniFile := TIniFile.Create(strAIniFile);
End;

Procedure TfrmAdicional.freeIni;
Begin
  AIniFile.Free;
End;

end.
