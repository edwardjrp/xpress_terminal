unit UGlobalMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CPortCtl, ComCtrls, ExtCtrls, CPort, Clipbrd,
  ToolWin, Menus, LMDCustomComponent, LMDTimer, RXDice, cxButtons,
  SUIButton, SUIToolBar, Animate, GIFCtrl, jpeg, OoMisc, ADTrmEmu, AdPort,
  AdWnPort, RxMenus;

type
  TfrmGlobal = class(TForm)
    Panel1: TPanel;
    Estado: TStatusBar;
    Contenedor: TPageControl;
    Terminal1: TTabSheet;
    Terminal2: TTabSheet;
    Terminal3: TTabSheet;
    Terminal4: TTabSheet;
    Terminal5: TTabSheet;
    Terminal6: TTabSheet;
    Terminal7: TTabSheet;
    Terminal8: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    ToolBar2: TsuiToolBar;
    Disable: TToolButton;
    btSettings: TsuiButton;
    Fonts: TsuiButton;
    Script: TsuiButton;
    PasteScript: TsuiButton;
    SelectA: TsuiButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Barra1: TsuiToolBar;
    rt1: TToolButton;
    Barra2: TsuiToolBar;
    rt2: TToolButton;
    Barra3: TsuiToolBar;
    rt3: TToolButton;
    Barra4: TsuiToolBar;
    rt4: TToolButton;
    Barra5: TsuiToolBar;
    rt5: TToolButton;
    Barra6: TsuiToolBar;
    rt6: TToolButton;
    Barra7: TsuiToolBar;
    rt7: TToolButton;
    Barra8: TsuiToolBar;
    rt8: TToolButton;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Label5: TLabel;
    ComLed5: TComLed;
    ComLed6: TComLed;
    Label6: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    btnClose: TsuiButton;
    Break: TsuiButton;
    btViewLog: TsuiButton;
    Abre: TOpenDialog;
    Tiempo: TTimer;
    pnlCloseMessage: TPanel;
    btTerm1: TsuiButton;
    btTerm2: TsuiButton;
    btTerm3: TsuiButton;
    btTerm4: TsuiButton;
    btTerm5: TsuiButton;
    btTerm6: TsuiButton;
    btTerm7: TsuiButton;
    btTerm8: TsuiButton;
    btSimultaneos: TsuiButton;
    tbSelectAll: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Image1: TImage;
    Term1: TAdTerminal;
    Term2: TAdTerminal;
    Term3: TAdTerminal;
    Term4: TAdTerminal;
    Term5: TAdTerminal;
    Term6: TAdTerminal;
    Term7: TAdTerminal;
    Term8: TAdTerminal;
    tmpPuerto: TApdComPort;
    CursorTime: TTimer;
    Popup: TPopupMenu;
    Shortname1: TMenuItem;
    Fullname1: TMenuItem;
    btClear: TsuiButton;
    procedure rt1Click(Sender: TObject);
    procedure DisableClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnableControls(OnOff : Boolean);
    procedure BreakClick(Sender: TObject);
    procedure SelectAClick(Sender: TObject);
    procedure btSettingsClick(Sender: TObject);
    procedure FontsClick(Sender: TObject);
    procedure ScriptClick(Sender: TObject);
    procedure PasteScriptClick(Sender: TObject);
    procedure btViewLogClick(Sender: TObject);
    procedure TiempoTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure btTerm1Click(Sender: TObject);
    procedure btSimultaneosClick(Sender: TObject);
    procedure Term1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CursorTimeTimer(Sender: TObject);
    procedure btTerm1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shortname1Click(Sender: TObject);
    procedure btClearClick(Sender: TObject);

  private
//    vt100Emulators : Array Of TAdVT100Emulator;
    vtTTYEmulators : Array Of TAdTTYEmulator;
    Secs,Hours, Mins : integer;
    Procedure CMDialogKey(var Msg:TCMDialogKey);
    Message CM_DialogKey;
    { Private declarations }
  public
    SelectAll,RefCheck,Rt1Check,Rt2Check,Rt3Check,Rt4Check,Rt5Check,Rt6Check,Rt7Check,Rt8Check,
    SimRelease,IfCloseX,IfCloseN,IfClose : Boolean;
    SelectPlus,CheckSelected,ButtonIndexPopup : Integer; {ButtonIndexPopup is the index button that pops up the popup menu}
    aRow,aCol : Array Of Integer;
    Function GetMenor : Integer;
    Function CheckClean : Boolean;
    Function GetDown : Boolean;
    Function CheckDown : Boolean;
    Procedure SetFontMenor;
    {This procedure is used to optimize the SetFontMenor Procedure above
     Sets the bold style to the button and set the style to none to the rest of the buttons
    }
    Procedure SetFontMenorBold(Index : Integer);
    Procedure ChangeTerminal(Index : Integer);
    {Set Hint Disconnect to the buttons but the pressed by the user}
    Procedure setHintDisconnect(ButtonPressedTag : Integer);
    {Set Down to true/false to every button but the pressed by the user}
    Procedure setButtonDown(ButtonPressedTag : Integer; OnOff : Boolean);
    {Type B = Bar button color, F = Font color }
    Procedure setBarButtonColor(ButtonPressedTag : Integer; Color : TColor; opType : String);
    {Type C = Button Font Color, S = Button Font Style}
    Procedure setButtonFontColor(ButtonPressedTag : Integer; Color : TColor; opType : String); Overload;
    Procedure setTerminalFocus(ButtonPressedTag : Integer);
    {Set the RTxChec variables to true/false}
    Procedure setRtCheck(ButtonPressedTag : Integer; OnOff :  Boolean);
    {Get the RtxCheck Status bases on the button pressed}
    Function getRtCheck(ButtonPressedTag : Integer) : Boolean;
    {Get the RTx Button Down State based on the button pressed}
    Function getRtDown(ButtonPressedTag : Integer) : Boolean;
    {Set the bar font color}
    Procedure setBarraFontColor(ButtonPressedTag : Integer; Color : TColor);
    {Set the suiButton font color}
    Procedure setButtonFontColor(ButtonPressedTag : Integer; Color : TColor); Overload;
    {Set the suiButton font style}
    Procedure setButtonFontStyle(ButtonPressedTag : Integer; Style : TFontStyles);
    {Set the bar button color}
    Procedure setBarraButtonColor(ButtonPressedTag : Integer; Color : TColor);
    {Set true/false rt buttons}
    Procedure setRtDown(ButtonPressedTag : Integer; OnOff : Boolean);
    {Set the hint to the rt buttons}
    Procedure setRtHint(ButtonPressedTag : Integer; Hint : String);
    {Set the active Port to the index terminal}
    Procedure SetTerminalPort(Index : Integer; ActivePort : TApdCustomComPort);
    {Set the active port to the index terminal, and sets nill to the rest}
    Procedure SetTerminalNil(Index : Integer);
    Procedure SelectTermFont(Index : Integer);
    {Sets the terminals settings}
    Procedure DoTerminalSettings(Terminal : TAdTerminal);
//    Procedure setTermCursor(Index : Integer; Terminal : Array Of TAdTTYEmulator);
    Procedure setTermCursor(Index : Integer);
    Procedure setTermCursorPos(Index : Integer; aRow : Integer; aCol : Integer);
    Procedure ExecCursorPos;
    Procedure setSleep;
    Procedure setClearAll;
    {Evento para atrapar al minimizar o restaurar la ventana}
    Procedure WMSysCommand(Var Msg : TWMSysCommand);
    Message WM_SysCommand;
    { Public declarations }
  end;

var
  frmGlobal: TfrmGlobal;

implementation

uses XTerminal, ADTrmBuf, TerminalSettings;

{$R *.dfm}

procedure TfrmGlobal.rt1Click(Sender: TObject);
Var
  Cont : Integer;
begin
If Disable.Down Then
  SelectAll := False;

If Not(Disable.Down) Then
  Begin
    {Set the button hint to disconnected to all the buttons not pressed by the user}
    setHintDisconnect((Sender As TToolButton).Tag);
    If (Sender As TToolButton).Hint = 'Disconnected' Then
      Begin
        (Sender As TToolButton).Down := True;
        (Sender As TToolButton).Hint := 'Connected';
      End
    Else
      Begin
        If (Selectall) Then
          Begin
            (Sender As TToolButton).Down := True;
            (Sender As TToolButton).Hint := 'Connected';
             SelectAll := False;
          End
        Else
          Begin
            If ( ((Sender As TToolButton).Hint = 'Connected') And (SimRelease)) Then
              Begin
                If GetDown Then
                  setRtCheck((Sender As TToolButton).Tag,False)
                Else {Else-If GetDown}
                  setRtCheck((Sender As TToolButton).Tag,True);
              End {End-Button connected and SimRelease}
            Else
              setRtCheck((Sender As TToolButton).Tag,False);
            SimRelease := False;
            (Sender As TToolButton).Down := False;
            (Sender As TToolButton).Hint := 'Disconnected';
          End; {End-Else}
      End; {End-Else Disconneted}
    {Set Down to true/false to every button but the pressed by the user}
    setButtonDown((Sender As TToolButton).Tag,False);
    {Button Color, opType B = Bar Button Color}
//    setBarButtonColor((Sender As TToolButton).Tag,clBtnFace,'B');
    {Font Color, opType F = Bar Font Color}
//    setBarButtonColor((Sender As TToolButton).Tag,clBlack,'F');
    {Font Color, opTypes: C = Font Color, S = Font Style}
    //setButtonFontColor((Sender As TToolButton).Tag,clBlack,'C');
    {This code snippet override the the overloaded method
     setButtonFontColor, setButtonFontStyle, setBarButtonColor(B,F) which sets
     the font color and style for suiButtons and Barra components.
     This code was replace because the below code is more accurate
     and flexible to be handled.
    }
    For Cont := 0 To 7 Do
      Begin
        If Not (Cont = (Sender As TToolButton).Tag) Then
          Begin
            setBarraButtonColor(Cont,clBtnFace);
            setBarraFontColor(Cont,clBlack);
            setButtonFontColor(Cont,clBlack);
            setButtonFontStyle(Cont,[]);
          End;
      End;
    {Font Color, opTypes: C = Font Color, S = Font Style}
    //setButtonFontColor((Sender As TToolButton).Tag,clBlack,'S');
//    frmPrincipal.ClearBuffer;
    ChangeTerminal((Sender As TToolButton).Tag);
    ActiveTerminal := (Sender As TToolButton).Tag;
  End
Else
  Begin
    ChangeTerminal(GetMenor);
    ActiveTerminal := GetMenor;
  End;

frmPrincipal.setString(#28#20#28#20+Chr((Sender As TToolButton).Tag+1) );
SelectPlus := 0;
{Get the RtxCheck status, if tru then button down and rtxcheck set to false}
If getRtCheck((Sender As TToolButton).Tag) Then
  Begin
    (Sender As TToolButton).Down := True;
    setRtCheck((Sender As TToolButton).Tag,False);
  End;

If (Sender As TToolButton).Down Then
  (Sender As TToolButton).Hint := 'Connected'
Else
  (Sender As TToolButton).Hint := 'Disconnected';

If CheckDown Then
  Begin
    SelectAll := True;
    SelectA.Caption := 'Unselect All';
    SelectA.Font.Color := clBlack;
    tbSelectAll.Color := clLime;
    Estado.Panels[2].Text := 'All Terminals are Selected.';
  End
Else
  Begin
    SelectAll := False;
    SelectA.Caption := 'Select All';
    SelectA.Font.Color := clBlack;
    tbSelectAll.Color := clBtnFace;
    Estado.Panels[2].Text := EmptyStr;
  End;

If getRtDown((Sender As TToolButton).Tag) Then
  Begin
    {Coloca el color rojo a la terminal menor y el resto color normal}
    If Disable.Down Then
      SetFontMenor
    Else
      Begin
        setBarraFontColor((Sender As TToolButton).Tag,clBlack);
        setButtonFontColor((Sender As TToolButton).Tag,clBlack);
        setButtonFontStyle((Sender As TToolButton).Tag,[fsBold]);
      End; {End-Else}
    setBarraButtonColor((Sender As TToolButton).Tag,clLime);
  End
Else
  Begin
    If Disable.Down Then
      SetFontMenor;
    setBarraButtonColor((Sender As TToolButton).Tag,clBtnFace);
    setBarraFontColor((Sender As TToolButton).Tag,clBlack);
    setButtonFontColor((Sender As TToolButton).Tag,clBlack);
    setButtonFontStyle((Sender As TToolButton).Tag,[]);
  End;
setTermCursor((Sender As TToolButton).Tag);
end;

procedure TfrmGlobal.DisableClick(Sender: TObject);
Var
 Cont,Check : Integer;
begin
If Disable.Down Then
  ToolBar2.ButtonColor := $000080FF
Else
  ToolBar2.ButtonColor := clBtnFace;
frmPrincipal.ClearBuffer;
SelectPlus := 0;
frmPrincipal.setString(#28#20#28#20#22);
frmPrincipal.ClearBuffer;
If Not (Disable.Down = False) Then
  Begin
    Check := 0;
    If RefCheck = False Then
      Begin
        For Cont := 1 To frmGlobal.ComponentCount - 1 Do
          Begin
            If frmGlobal.Components[Cont] Is TToolButton Then
              Begin
                If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
                  If (frmGlobal.Components[Cont] As TToolButton).Down = True Then
                    Inc(Check);
              End;
          End;
      End;

    If Not (RefCheck) Then
      Begin
        If (Check = 1) Then
          Begin
            For Cont := 0 To 7 Do
              Begin
                {Set true/false all rt buttons}
                setRtDown(Cont,False);
                {Set clBtnFace color to every  barra component}
                setBarraButtonColor(Cont,clBtnFace);
                {Set clBlack font color to every barra component}
                setBarraFontColor(Cont,clBlack);
                {Set all suiButton font color to clBtnFace}
                setButtonFontColor(Cont,clBlack);
                {Set all suiButton font style to null}
                setButtonFontStyle(Cont,[]);
              End; {End-For Cont 0 to 7}
          End; {End-If Check = 1 comparison}
      End; {End-If not RefCheck variable}
    RefCheck := False;
  End; {End-If not disable down = false}

frmPrincipal.ClearBuffer;
If Not (Disable.Down) Then
  SimRelease := True;
setTerminalFocus(GetMenor);
end;

procedure TfrmGlobal.EnableControls(OnOff : Boolean);
begin
  Script.Enabled      := OnOff;
  Fonts.Enabled       := OnOff;
  PasteScript.Enabled := OnOff;
  SelectA.Enabled     := OnOff;
  tbSelectAll.Enabled := SelectA.Enabled;
  Barra1.Enabled      := OnOff;
  Barra2.Enabled      := OnOff;
  Barra3.Enabled      := OnOff;
  Barra4.Enabled      := OnOff;
  Barra5.Enabled      := OnOff;
  Barra6.Enabled      := OnOff;
  Barra7.Enabled      := OnOff;
  Barra8.Enabled      := OnOff;
  {suiButton Enable}
  btTerm1.Enabled := Barra1.Enabled;
  btTerm2.Enabled := Barra2.Enabled;
  btTerm3.Enabled := Barra3.Enabled;
  btTerm4.Enabled := Barra4.Enabled;
  btTerm5.Enabled := Barra5.Enabled;
  btTerm6.Enabled := Barra6.Enabled;
  btTerm7.Enabled := Barra7.Enabled;
  btTerm8.Enabled := Barra8.Enabled;

  Disable.Enabled := OnOff;
  btSimultaneos.Enabled := Disable.Enabled;
  btSettings.Enabled := OnOff;
  btViewLog.Enabled := OnOff;
  Break.Enabled := OnOff;
end;

procedure TfrmGlobal.FormActivate(Sender: TObject);
Var
  Cont : Integer;
begin
Term1.ComPort := tmpPuerto;
Term2.ComPort := Term1.ComPort;
Term3.ComPort := Term1.ComPort;
Term4.ComPort := Term1.ComPort;
Term5.ComPort := Term1.ComPort;
Term6.ComPort := Term1.ComPort;
Term7.ComPort := Term1.ComPort;
Term8.ComPort := Term1.ComPort;
ChangeTerminal(0);
ActiveTerminal := 0;
EnableControls(True);
btSettings.SetFocus;
end;

procedure TfrmGlobal.FormCreate(Sender: TObject);
Var
  Cont : Integer;
begin
  Self.TabStop := True;
  SelectPlus := 0;
  CheckSelected := 0;
  IfCloseX := False;
  IfCloseN := False;
  IfClose := False;
{This code set the array length to 8
 an emulator for every terminal.
 Created on memory.
}
SetLength(aRow,8);
SetLength(aCol,8);
SetLength(vtTTYEmulators,8);
For Cont := 0 To 7 Do
  Begin
    vtTTYEmulators[Cont] := TAdTTYEmulator.Create(Self);
    //Initializing the rows and cols, seems there's a bug with the default values
    vtTTYEmulators[Cont].Buffer.Row := 0;
    vtTTYEmulators[Cont].Buffer.Col := 0;
  End;
Term1.Emulator := vtTTYEmulators[0];
Term2.Emulator := vtTTYEmulators[1];
Term3.Emulator := vtTTYEmulators[2];
Term4.Emulator := vtTTYEmulators[3];
Term5.Emulator := vtTTYEmulators[4];
Term6.Emulator := vtTTYEmulators[5];
Term7.Emulator := vtTTYEmulators[6];
Term8.Emulator := vtTTYEmulators[7];
end;

Function TfrmGlobal.GetMenor: Integer;
Var
  Down : String;
  Cont : Integer;
Begin
For Cont := 1 To frmGlobal.ComponentCount - 1 Do 
  Begin
    If frmGlobal.Components[Cont] Is TToolButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
          If (frmGlobal.Components[Cont] As TToolButton).Down = True Then
            Down := Down + IntToStr((frmGlobal.Components[Cont] As TToolButton).Tag); 
      End;
  End;
If Length(Down) > 0 Then
  Result := StrToInt(Down[1])
Else
  Result := 0;  
End;

Function TfrmGlobal.CheckClean : Boolean;
Var
  Cont, btDown : Integer;
Begin
btDown := 0;
For Cont := 1 To frmGlobal.ComponentCount - 1 Do 
  Begin
    If frmGlobal.Components[Cont] Is TToolButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
          If (frmGlobal.Components[Cont] As TToolButton).Down = False Then
            Inc(btDown);  
      End;
  End;
  
If (btDown) = 8 Then
  Result := True
Else
  Result := False;  
End;

procedure TfrmGlobal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If ((Key = VK_UP) And (Key <> 91)) Then
  frmPrincipal.setChar(#16);

If ((Key = VK_DOWN) And (Key <> 91)) Then
  frmPrincipal.setChar(#14);

If ((Key = VK_RIGHT) And (Key <> 91)) Then
  frmPrincipal.setChar(#17);

If ((Key = VK_LEFT) And (Key <> 91)) Then
  frmPrincipal.setChar(#18);

If ((ssCtrl In Shift) And (Key = 86)) Then
  PasteScript.Click;

If ((ssCtrl In Shift) And (Key = 71)) Then
  Script.Click;

If Key = 19 Then
  Break.Click;

If ((ssAlt In Shift) And (Key = VK_F4)) Then
  Key := 0;

If (Key = VK_F1) Then
  btTerm1.Click;

If (Key = VK_F2) Then
  btTerm2.Click;

If (Key = VK_F3) Then
  btTerm3.Click;

If (Key = VK_F4) Then
  btTerm4.Click;

If (Key = VK_F5) Then
  btTerm5.Click;

If (Key = VK_F6) Then
  btTerm6.Click;

If (Key = VK_F7) Then
  btTerm7.Click;

If (Key = VK_F8) Then
  btTerm8.Click;
end;

  procedure TfrmGlobal.CMDialogKey(var Msg: TCMDialogKey);
begin
If Msg.CharCode = VK_TAB Then
  frmPrincipal.setChar(#9);
end;

Function TfrmGlobal.GetDown: Boolean;
Var
  Cont,Down : Integer;
Begin
Down := 0;
For Cont := 1 To frmGlobal.ComponentCount - 1 Do
  Begin
    If frmGlobal.Components[Cont] Is TToolButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
          If (frmGlobal.Components[Cont] As TToolButton).Down = True Then
            Inc(Down);
      End;
  End;

If Down = 0 Then
  Result := True
Else
  Result := False;  
End;

procedure TfrmGlobal.BreakClick(Sender: TObject);
begin
If frmPrincipal.getPortConnected Then
  Begin
//    frmPrincipal.setPortBreak(True);
    frmPrincipal.setChar(#0);
    Sleep(1000);
//    frmPrincipal.setPortBreak(False);
  End;
setTerminalFocus(ActiveTerminal);
end;

procedure TfrmGlobal.SelectAClick(Sender: TObject);
var
  Cont, Check : Integer;
begin
If SelectA.Caption = 'Select All' Then
  Begin
    SelectA.Caption := 'Unselect All';
    SelectA.Font.Color := clBlack;
    tbSelectAll.Color := clLime;
  End
Else
  Begin
    SelectA.Caption := 'Select All';
    SelectA.Font.Color := clBlack;
    tbSelectall.Color := clBtnFace;
  End;
frmPrincipal.ClearBuffer;
Check := 0;
For Cont := 1 To frmGlobal.ComponentCount - 1 Do
  Begin
    If frmGlobal.Components[Cont] Is TToolButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
          If (frmGlobal.Components[Cont] As TToolButton).Down = True Then
            Inc(Check);
      End;
  End;
If ( (Disable.Down) And (Check >= 8) ) Then
  SelectAll := True
Else
  If ( (Disable.Down) And (Check < 8) ) Then
    SelectAll := False
  Else
    If ( (Not(Disable.Down)) And (Check < 8) ) Then
      SelectAll := False;

If ( (Not(Disable.Down)) And (Check = 0) ) Then
  SelectAll := False;

If (Not(Disable.Down) And (Check = 8)) Then
  SelectAll := True;

If Not(SelectAll) Then {If SellectAll = False}
  Begin
    Estado.Panels[2].Text := 'All Terminals are Selected.';
    frmPrincipal.setString(#28#20#28#20#29);

    For Cont := 0 To 7 Do
      Begin
        {Sets all the rt buttons down property to true}
        setRtDown(Cont,True);
        {Sets all the barra button color to clLime}
        setBarraButtonColor(Cont,clLime);
      End;
     {Font Color}
    SetFontMenor;
    For Cont := 0 To 7 Do
      setRtHint(Cont,'Connected');

    SelectAll := True;
    ChangeTerminal(0);
    ActiveTerminal := 0;
    Term1.SetFocus;
    If Disable.Down Then
      Begin
        Disable.Down := False;
        ToolBar2.ButtonColor := clBtnFace;
      End;
  End {End-Else if not SelectAll}
Else
  Begin
    Estado.Panels[2].Text := EmptyStr;
    If Disable.Down Then
      Begin
        Disable.Down := False;
        ToolBar2.ButtonColor := clBtnFace;
      End;
    frmPrincipal.setString(#28#20#28#20#29);
    For Cont := 0 To 7 Do
      Begin
        {Sets all the Rt buttons down property to false}
        setRtDown(Cont,False);
        {Sets all the barra button color to clBtnFace}
        setBarraButtonColor(Cont,clBtnFace);
        {Sets all barra Font Color to clBlack}
        setBarraFontColor(Cont,clBlack);
        {suiButton Color}
        setButtonFontColor(Cont,clBlack);
        {suiButton Font Style}
        setButtonFontStyle(Cont,[]);
        {Sets all rt buttons hints to Disconnected}
        setRtHint(Cont,'Disconnected');
      End;
    SelectAll := False;
  End;
ChangeTerminal(GetMenor);
ActiveTerminal := GetMenor;
frmPrincipal.ClearBuffer;
SimRelease := False;
setTermCursor(0);
setTerminalFocus(ActiveTerminal);
CursorTime.Enabled := True;
end;

procedure TfrmGlobal.btSettingsClick(Sender: TObject);
begin
{Sets Terminals Settings}
Case ActiveTerminal Of
  0 : DoTerminalSettings(Term1);
  1 : DoTerminalSettings(Term2);
  2 : DoTerminalSettings(Term3);
  3 : DoTerminalSettings(Term4);
  4 : DoTerminalSettings(Term5);
  5 : DoTerminalSettings(Term6);
  6 : DoTerminalSettings(Term7);
  7 : DoTerminalSettings(Term8);
End; {End-Case}
setTerminalFocus(ActiveTerminal);
setTermCursor(ActiveTerminal);
end;

procedure TfrmGlobal.FontsClick(Sender: TObject); {Pending}
begin
  SelectTermFont(ActiveTerminal);
  setTerminalFocus(ActiveTerminal);
  setTermCursor(ActiveTerminal);
end;

procedure TfrmGlobal.ScriptClick(Sender: TObject);
begin
{Crear inhouse notepad}
If FileExists('C:\WINNT\NOTEPAD.EXE') Then
  Winexec('C:\WINNT\NOTEPAD.EXE ',sw_normal)
Else
  If FileExists('C:\WINDOWS\NOTEPAD.EXE') Then
    Winexec('C:\WINDOWS\NOTEPAD.EXE',sw_normal);
setTerminalFocus(ActiveTerminal);
end;

procedure TfrmGlobal.PasteScriptClick(Sender: TObject);
Var
  ClipBoardText : String;
  Cont : Integer;
begin
If Conectado Then
  Begin
    frmPrincipal.ClearBuffer;
    ClipBoardText := ClipBoard.AsText;
    For Cont := 1 To Length(ClipBoardText) Do
      Begin
        frmPrincipal.setString(ClipBoardText[Cont]);
        setSleep;
      End;
    setTerminalFocus(ActiveTerminal);
  End;
end;

Function TfrmGlobal.CheckDown : Boolean;
Var
  Cont, btDown : Integer;
Begin
btDown := 0;
For Cont := 1 To frmGlobal.ComponentCount - 1 Do
  Begin
    If frmGlobal.Components[Cont] Is TToolButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
          If (frmGlobal.Components[Cont] As TToolButton).Down = True Then
            Inc(btDown);
      End;
  End;

If (btDown) = 8 Then
  Result := True
Else
  Result := False;
End;


Procedure TfrmGlobal.SetFontMenor;
Var
  Cont : Integer;
Begin
For Cont := 0 To 7 Do
  Begin
    {Color de las letras de las barras contenedoras}
    setBarraFontColor(Cont,clBlack);
    {Color de letras de los suiButtons}
    setButtonFontColor(Cont,clBlack);
  End;

Case GetMenor Of
  0 : SetFontMenorBold(0); {suiButton Font Style}
  1 : SetFontMenorBold(1);
  2 : SetFontMenorBold(2);
  3 : SetFontMenorBold(3);
  4 : SetFontMenorBold(4);
  5 : SetFontMenorBold(5);
  6 : SetFontMenorBold(6);
  7 : SetFontMenorBold(7);
  Else
    Exit;
End; {End del case}
End;

procedure TfrmGlobal.btViewLogClick(Sender: TObject); {Pending}
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
setTerminalFocus(ActiveTerminal);
end;

procedure TfrmGlobal.TiempoTimer(Sender: TObject);
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
Estado.Panels[1].Text := 'Connection Time : '+ IntToStr(Hours)+':'+IntToStr(Mins)+':'+IntToStr(Secs);
end;

procedure TfrmGlobal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
IfCloseX := True;
If Not (IfCloseN) Then
  btnClose.Click;
If IfClose Then
  Close;
end;

procedure TfrmGlobal.btnCloseClick(Sender: TObject);
Var
  Cont,Cont2 : Integer;
  Salida : String;
begin
  If MessageDlg('Do you want to close this window?.',mtConfirmation,mbOKCancel,0) = mrOK Then
  Begin
    Try
      IfClose := True;
      If IfCloseX Then
        IfCloseN := False
      Else
        IfCloseN := True;
      pnlCloseMessage.Visible := True;
      If Not (SelectAll) Then
        frmPrincipal.setString(#28#20#28#20#29);
      Salida := 'Exit'+#13;
      Sleep(300);
      For Cont2 := 1 To 3 Do
        Begin
          Application.ProcessMessages;
          For Cont := 1 To Length(Salida) Do
            Begin
              frmPrincipal.setString(Salida[Cont]);
              setSleep;
            End; {End-For}
          Sleep(750);
        End;
      frmPrincipal.setString(#28#20#28#20#31);
      Sleep(100);
//      frmPrincipal.ClearBuffer;
//      frmPrincipal.setOpen(False);
      Conectado := False;
      Tiempo.Enabled := False;
      IfCloseN := True;
      If IfCloseN Then
        Close;
    Except
      MessageDlg('THE PORT DOESN''T HAVE SIGNAL.',mtError,[mbOK],0);
      pnlCloseMessage.Visible := False;
      If IfCloseN Then
        Close;
    End;
  End
Else
  setTerminalFocus(ActiveTerminal);
end;

Procedure TfrmGlobal.WMSysCommand(var Msg: TWMSysCommand);
Begin
If (Msg.CmdType = SC_MINIMIZE) Then
  Application.Minimize;

If (Msg.CmdType = SC_RESTORE) Then
  Application.Restore;

DefaultHandler(Msg);
End;

procedure TfrmGlobal.btTerm1Click(Sender: TObject);
begin
{btTerm1}
If (Sender As TsuiButton) = btTerm1 Then
  Begin
    If rt1.Down Then
      Begin
        rt1.Down := False;
        rt1.Click;
      End
    Else
      Begin
        rt1.Down := True;
        rt1.Click;
      End;
//    ExecCursorPos;
    CursorTime.Enabled := True;
  End; {End-If btTerm1}

{btTerm2}
If (Sender As TsuiButton) = btTerm2 Then
  Begin
    If Rt2.Down Then
      Begin
        rt2.Down := False;
        rt2.Click;
      End
    Else
      Begin
        rt2.Down := True;
        rt2.Click;
      End;
//    ExecCursorPos;
    CursorTime.Enabled := True;
  End; {End-If btTerm2}

{btTerm3}
If (Sender As TsuiButton) = btTerm3 Then
  Begin
    If Rt3.Down Then
      Begin
        rt3.Down := False;
        rt3.Click;
      End
    Else
      Begin
        rt3.Down := True;
        rt3.Click;
      End;
    CursorTime.Enabled := True;
  End; {End-If btTerm3}

{btTerm4}
If (Sender As TsuiButton) = btTerm4 Then
  Begin
    If Rt4.Down Then
      Begin
        rt4.Down := False;
        rt4.Click;
      End
    Else
      Begin
        rt4.Down := True;
        rt4.Click;
      End;
    CursorTime.Enabled := True;
  End; {End-If btTerm4}

{btTerm5}
If (Sender As TsuiButton) = btTerm5 Then
  Begin
    If Rt5.Down Then
      Begin
        rt5.Down := False;
        rt5.Click;
      End
    Else
      Begin
        rt5.Down := True;
        rt5.Click;
      End;
    CursorTime.Enabled := True;
  End; {End-If btTerm5}

{btTerm6}
If (Sender As TsuiButton) = btTerm6 Then
  Begin
    If Rt6.Down Then
      Begin
        rt6.Down := False;
        rt6.Click;
      End
    Else
      Begin
        rt6.Down := True;
        rt6.Click;
      End;
    CursorTime.Enabled := True;
  End; {End-If btTerm6}

{btTerm7}
If (Sender As TsuiButton) = btTerm7 Then
  Begin
    If Rt7.Down Then
      Begin
        rt7.Down := False;
        rt7.Click;
      End
    Else
      Begin
        rt7.Down := True;
        rt7.Click;
      End;
    CursorTime.Enabled := True;
  End; {End-If btTerm7}

{btTerm8}
If (Sender As TsuiButton) = btTerm8 Then
  Begin
    If Rt8.Down Then
      Begin
        rt8.Down := False;
        rt8.Click;
      End
    Else
      Begin
        rt8.Down := True;
        rt8.Click;
      End;
    CursorTime.Enabled := True;
  End; {End-If btTerm8}
end;

procedure TfrmGlobal.btSimultaneosClick(Sender: TObject);
begin
If Disable.Down Then
  Begin
    Disable.Down := False;
    Disable.Click;
  End
Else
  Begin
    Disable.Down := True;
    Disable.Click;
  End;
end;

Procedure TfrmGlobal.ChangeTerminal(Index: Integer);
Begin
SetTerminalNil(Index);
Contenedor.ActivePageIndex := Index;
setTerminalFocus(Index);
End;

Procedure TfrmGlobal.setHintDisconnect(ButtonPressedTag : Integer);
Var
  Cont : Integer;
Begin
For Cont := 1 To frmGlobal.ComponentCount - 1 Do
  Begin
    If frmGlobal.Components[Cont] Is TToolButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
          If Not ((frmGlobal.Components[Cont] As TToolButton).Tag = ButtonPressedTag) Then
            (frmGlobal.Components[Cont] As TToolButton).Hint := 'Disconnected';
      End;
  End;
End;

Procedure TfrmGlobal.setButtonDown(ButtonPressedTag : Integer; OnOff : Boolean);
Var
  Cont : Integer;
Begin
For Cont := 1 To frmGlobal.ComponentCount - 1 Do
  Begin
    If frmGlobal.Components[Cont] Is TToolButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TToolButton).Name = 'Disable') Then
          If Not ((frmGlobal.Components[Cont] As TToolButton).Tag = ButtonPressedTag) Then
            (frmGlobal.Components[Cont] As TToolButton).Down := OnOff;
      End;
  End;
End;

{Type B = Bar button color, F = Font color }
Procedure TfrmGlobal.setBarButtonColor(ButtonPressedTag: Integer;
  Color: TColor; opType : String);
Var
  Cont : Integer;
Begin
For Cont := 1 To frmGlobal.ComponentCount - 1 Do
  Begin
    If frmGlobal.Components[Cont] Is TsuiToolBar Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TsuiToolBar).Name = 'ToolBar2') Then
          If Not ((frmGlobal.Components[Cont] As TsuiToolBar).Tag = ButtonPressedTag) Then
            If opType = 'B' Then
              (frmGlobal.Components[Cont] As TsuiToolBar).ButtonColor := Color
            Else
              If opType = 'F' Then
                (frmGlobal.Components[Cont] As TsuiToolBar).Font.Color := Color;
      End;
  End;
End;

{Type C = Button Font Color, S = Button Font Style}
Procedure TfrmGlobal.setButtonFontColor(ButtonPressedTag: Integer;
  Color: TColor; opType: String);
Var
  Cont : Integer;
Begin
For Cont := 0 To frmGlobal.ComponentCount - 1 Do
  Begin
    If frmGlobal.Components[Cont] Is TsuiButton Then
      Begin
        If Not ((frmGlobal.Components[Cont] As TsuiButton).Tag = 30) Then {Tag = 30, all suiButton that don't represent a terminal button}
          If Not ((frmGlobal.Components[Cont] As TsuiButton).Tag = ButtonPressedTag) Then
            If opType = 'C' Then
              (frmGlobal.Components[Cont] As TsuiButton).Font.Color := Color
            Else
              If opType = 'S' Then
                (frmGlobal.Components[Cont] As TsuiButton).Font.Style := [];
      End;
  End;

End;

Procedure TfrmGlobal.setTerminalFocus(ButtonPressedTag : Integer);
Begin
Case ButtonPressedTag Of
  0 : If Term1.CanFocus Then Term1.SetFocus;
  1 : If Term2.CanFocus Then Term2.SetFocus;
  2 : If Term3.CanFocus Then Term3.SetFocus;
  3 : If Term4.CanFocus Then Term4.SetFocus;
  4 : If Term5.CanFocus Then Term5.SetFocus;
  5 : If Term6.CanFocus Then Term6.SetFocus;
  6 : If Term7.CanFocus Then Term7.SetFocus;
  7 : If Term8.CanFocus Then Term8.SetFocus;
End; {End-Case Tag}
End;

Procedure TfrmGlobal.setRtCheck(ButtonPressedTag : Integer; OnOff :  Boolean);
Begin
Case ButtonPressedTag Of
  0 : Rt1Check := OnOff;
  1 : Rt2Check := OnOff;
  2 : Rt3Check := OnOff;
  3 : Rt4Check := OnOff;
  4 : Rt5Check := OnOff;
  5 : Rt6Check := OnOff;
  6 : Rt7Check := OnOff;
  7 : Rt8Check := OnOff;
End; {End-Case Tag}

End;

Function TfrmGlobal.getRtCheck(ButtonPressedTag: Integer): Boolean;
Begin
Case ButtonPressedTag Of
  0 : Result := Rt1Check;
  1 : Result := Rt2Check;
  2 : Result := Rt3Check;
  3 : Result := Rt4Check;
  4 : Result := Rt5Check;
  5 : Result := Rt6Check;
  6 : Result := Rt7Check;
  7 : Result := Rt8Check;
End; {End-Case Tag}
End;

{Get the RTx Button Down State based on the button pressed}
Function TfrmGlobal.getRtDown(ButtonPressedTag: Integer): Boolean;
Begin
Case ButtonPressedTag Of
  0 : Result := rt1.Down;
  1 : Result := rt2.Down;
  2 : Result := rt3.Down;
  3 : Result := rt4.Down;
  4 : Result := rt5.Down;
  5 : Result := rt6.Down;
  6 : Result := rt7.Down;
  7 : Result := rt8.Down;
End; {End-Case Tag}
End;

Procedure TfrmGlobal.setBarraFontColor(ButtonPressedTag: Integer;
  Color: TColor);
Begin
Case ButtonPressedTag Of
  0 : Barra1.Font.Color := Color;    
  1 : Barra2.Font.Color := Color;
  2 : Barra3.Font.Color := Color;
  3 : Barra4.Font.Color := Color;
  4 : Barra5.Font.Color := Color;
  5 : Barra6.Font.Color := Color;
  6 : Barra7.Font.Color := Color;
  7 : Barra8.Font.Color := Color;
End;

End;

Procedure TfrmGlobal.setButtonFontColor(ButtonPressedTag: Integer;
  Color: TColor);
Begin
Case ButtonPressedTag Of
  0 : btTerm1.Font.Color := Color;
  1 : btTerm2.Font.Color := Color;
  2 : btTerm3.Font.Color := Color;
  3 : btTerm4.Font.Color := Color;
  4 : btTerm5.Font.Color := Color;
  5 : btTerm6.Font.Color := Color;
  6 : btTerm7.Font.Color := Color;
  7 : btTerm8.Font.Color := Color;
End;

End;

Procedure TfrmGlobal.setButtonFontStyle(ButtonPressedTag: Integer;
  Style: TFontStyles);
Begin
Case ButtonPressedTag Of
  0 : btTerm1.Font.Style := Style;
  1 : btTerm2.Font.Style := Style;
  2 : btTerm3.Font.Style := Style;
  3 : btTerm4.Font.Style := Style;
  4 : btTerm5.Font.Style := Style;
  5 : btTerm6.Font.Style := Style;
  6 : btTerm7.Font.Style := Style;
  7 : btTerm8.Font.Style := Style;
End;
End;

procedure TfrmGlobal.setBarraButtonColor(ButtonPressedTag: Integer;
  Color: TColor);
Begin
Case ButtonPressedTag Of
  0 : Barra1.ButtonColor := Color;
  1 : Barra2.ButtonColor := Color;
  2 : Barra3.ButtonColor := Color;
  3 : Barra4.ButtonColor := Color;
  4 : Barra5.ButtonColor := Color;
  5 : Barra6.ButtonColor := Color;
  6 : Barra7.ButtonColor := Color;
  7 : Barra8.ButtonColor := Color;
End;
End;

{Set true/false rt buttons}
Procedure TfrmGlobal.setRtDown(ButtonPressedTag : Integer; OnOff : Boolean);
Begin
Case ButtonPressedTag Of
  0 : rt1.Down := OnOff;
  1 : rt2.Down := OnOff;
  2 : rt3.Down := OnOff;
  3 : rt4.Down := OnOff;
  4 : rt5.Down := OnOff;
  5 : rt6.Down := OnOff;
  6 : rt7.Down := OnOff;
  7 : rt8.Down := OnOff;
End;
End;

Procedure TfrmGlobal.setRtHint(ButtonPressedTag: Integer; Hint: String);
Begin
If Hint = '' Then
  Hint := 'Disconnected';
Case ButtonPressedTag Of
  0 : rt1.Hint := Hint;
  1 : rt2.Hint := Hint;
  2 : rt3.Hint := Hint;
  3 : rt4.Hint := Hint;
  4 : rt5.Hint := Hint;
  5 : rt6.Hint := Hint;
  6 : rt7.Hint := Hint;
  7 : rt8.Hint := Hint;
End;
End;

{This procedure is used to optimize the SetFontMenor Procedure
 Sets the bold style to the button and set the style to none to the rest of the buttons
}
Procedure TfrmGlobal.SetFontMenorBold(Index: Integer);
Var
  Cont : Integer;
Begin
{suiButton Font Style}
For Cont := 0 To 7 Do
  Begin
    If Cont = Index Then
      setButtonFontStyle(Cont,[fsBold])
    Else
      setButtonFontStyle(Cont,[]);
  End;
End;

{Set the active Port to the index terminal}
Procedure TfrmGlobal.SetTerminalPort(Index : Integer; ActivePort : TApdCustomComPort);
Begin
Case Index Of
  0 : Term1.ComPort := ActivePort;
  1 : Term2.ComPort := ActivePort;
  2 : Term3.ComPort := ActivePort;
  3 : Term4.ComPort := ActivePort;
  4 : Term5.ComPort := ActivePort;
  5 : Term6.ComPort := ActivePort;
  6 : Term7.ComPort := ActivePort;
  7 : Term8.ComPort := ActivePort;
End; {End-case}
End;

{Set the active port to the index terminal, and sets nill to the rest}
Procedure TfrmGlobal.SetTerminalNil(Index : Integer);
Var
  Cont : Integer;
Begin
{suiButton Font Style}
For Cont := 0 To 7 Do
  Begin
    If Cont = Index Then
      SetTerminalPort(Cont,frmPrincipal.getActivePort)
    Else
      SetTerminalPort(Cont,Nil);
  End;
End;


Procedure TfrmGlobal.SelectTermFont(Index: Integer);
Begin
With TFontDialog.Create(Application) Do
  Begin
    Try
    Options := Options + [fdFixedPitchOnly];
    Case Index Of
      0 : Font := Term1.Font;
      1 : Font := Term2.Font;
      2 : Font := Term3.Font;
      3 : Font := Term4.Font;
      4 : Font := Term5.Font;
      5 : Font := Term6.Font;
      6 : Font := Term7.Font;
      7 : Font := Term8.Font;
    End;
    //Font.Color := vtTTYEmulators[Index].Buffer.ForeColor; {Font Color}
    Execute;
    Case Index Of
      0 : Term1.Font := Font;
      1 : Term2.Font := Font;
      2 : Term3.Font := Font;
      3 : Term4.Font := Font;
      4 : Term5.Font := Font;
      5 : Term6.Font := Font;
      6 : Term7.Font := Font;                               
      7 : Term8.Font := Font;
    End;
    //vtTTYEmulators[Index].Buffer.ForeColor := Font.Color;
    Finally
      Free;
    End; {End-Finally}
  End;
End;

{Sets the terminals settings}
Procedure TfrmGlobal.DoTerminalSettings(Terminal : TAdTerminal);
Begin
With TfrmSettings.Create(Self) Do
  Begin
    edColumns.Text := IntToStr(Terminal.Columns);
    edRows.Text := IntToStr(Terminal.Rows);
    Case Terminal.CursorType Of
      ctBlock : cbCursorType.ItemIndex := 0;
      ctUnderline : cbCursorType.ItemIndex := 1;
      ctNone : cbCursorType.ItemIndex := 2;
    End;
    ColorBox.Selected := Terminal.Color;
    ShowModal;
    SetSettings(Terminal);
    Free;
  End;
End;

Procedure TfrmGlobal.setTermCursor(Index: Integer);
Begin
  aRow[Index] := vtTTYEmulators[Index].Buffer.Row;
  aCol[Index] := vtTTYEmulators[Index].Buffer.Col;
End;

procedure TfrmGlobal.Term1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  setTermCursor(ActiveTerminal);
end;

Procedure TfrmGlobal.setTermCursorPos(Index : Integer; aRow : Integer; aCol : Integer);
Begin
  setTerminalFocus(Index);
  vtTTYEmulators[Index].Buffer.SetCursorPosition(aRow,aCol);
End;

Procedure TfrmGlobal.ExecCursorPos;
Begin
  setTermCursorPos(ActiveTerminal,aRow[ActiveTerminal],aCol[ActiveTerminal]);
End;

procedure TfrmGlobal.CursorTimeTimer(Sender: TObject);
begin
  ExecCursorPos;
  CursorTime.Enabled := False;
end;

Procedure TfrmGlobal.setSleep;
Begin
If ModoOperacion = 'em' Then
  Sleep(50)
Else
  If ModoOperacion = 'sm' Then
    Sleep(20)
  Else
  If ModoOperacion = 'mm' Then
    Sleep(20);
End;

procedure TfrmGlobal.btTerm1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
If Button = mbRight Then
  ButtonIndexPopup := (Sender As TsuiButton).Tag;
end;

procedure TfrmGlobal.Shortname1Click(Sender: TObject);
Var
  ButtonName : String;
  tmpButton : TsuiButton;
begin
ButtonName := '';
Case ButtonIndexPopup Of
 0 : tmpButton := btTerm1;
 1 : tmpButton := btTerm2;
 2 : tmpButton := btTerm3;
 3 : tmpButton := btTerm4;
 4 : tmpButton := btTerm5;
 5 : tmpButton := btTerm6;
 6 : tmpButton := btTerm7;
 7 : tmpButton := btTerm8;
End; {End-Case}

If (Sender = Shortname1) Then {If the selection is the menu option shortmenu}
  Begin
    ButtonName := InputBox('Short Name,','Enter short name.',tmpButton.Caption);
    If TRIM(ButtonName) = '' Then
     ButtonName := tmpButton.Caption;
    tmpButton.Caption := ButtonName;
    frmPrincipal.setIni;
    IniFile.WriteString(SectionXT,tmpButton.Name,tmpButton.Caption);
    frmPrincipal.freeIni;
  End
Else
  If (Sender = Fullname1) Then {If the selection is the menu option fullname}
    Begin
      ButtonName := InputBox('Full Name,','Enter full name.',tmpButton.Hint);
      If TRIM(ButtonName) = '' Then
       ButtonName := tmpButton.Caption;
      tmpButton.Hint := ButtonName;
      frmPrincipal.setIni;
      IniFile.WriteString(SectionXT,tmpButton.Name+'Hint',tmpButton.Hint);
      frmPrincipal.freeIni;
    End;
end;

Procedure TfrmGlobal.setClearAll;
Begin
Case ActiveTerminal Of
  0 : If Term1.CanFocus Then Term1.ClearAll;
  1 : If Term2.CanFocus Then Term2.ClearAll;
  2 : If Term3.CanFocus Then Term3.ClearAll;
  3 : If Term4.CanFocus Then Term4.ClearAll;
  4 : If Term5.CanFocus Then Term5.ClearAll;
  5 : If Term6.CanFocus Then Term6.ClearAll;
  6 : If Term7.CanFocus Then Term7.ClearAll;
  7 : If Term8.CanFocus Then Term8.ClearAll;
End; {End-Case Tag}
End;

procedure TfrmGlobal.btClearClick(Sender: TObject);
begin
setClearAll;
frmPrincipal.setChar(#13);
setTerminalFocus(ActiveTerminal);
end;

end.
