{ IAMC Corporation
  
  Software Engineering Team
  
  Copyright (c) 2004-2005
  
  Powered By Eng. Edward Rodriguez
  
  * ----------------------------------------------------- *
  Unit : Config.pas
  
  Task : This form is the ports configuration windows where the
  user can select COM Port or Telnet Connection.                }
unit AConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, SUIButton, ComCtrls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, CPort,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDCustomButtonGroup,
  LMDCustomRadioGroup, LMDRadioGroup, SUIEdit, IniFiles,
  LMDCustomComboBox, LMDComboBox, LMDBaseEdit, LMDCustomEdit,
  LMDCustomMaskEdit, LMDMaskEdit, AdSelCom, AdPort;

type
  { <TITLE Port Settings>
    <TITLEIMG frmConfig>
    <KEYWORDS Port Settings, Config, Ports>
    <VERSIONSPECIFIC =1.0>
    
    Summary
    Port settings window.
    
    Description
    This windows permits the user to configure COM ports and
    Telnet settings.                                         }
  TfrmAConfig = class(TForm)
    btClose: TsuiButton;
    PageControl1: TPageControl;
    tsComPorts: TTabSheet;
    pnComPorts: TPanel;
    pnTelnet: TPanel;
    Estado: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rgPortType: TLMDRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    Bevel2: TBevel;
    cbPorts: TLMDComboBox;
    cbBaudRate: TLMDComboBox;
    cbParity: TLMDComboBox;
    cbFlowControl: TLMDComboBox;
    cbStopBits: TLMDComboBox;
    edHost: TEdit;
    edPort: TLMDMaskEdit;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgPortTypeChange(Sender: TObject; ButtonIndex: Integer);
    procedure btCloseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edHostChange(Sender: TObject);
    procedure edPortEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Procedure ShowCOMPorts;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAConfig: TfrmAConfig;

implementation

uses UAdicional, DB, XTerminal;

{$R *.dfm}

{ Summary
  OnActivate event.
  
  Description
  This method load the values saved before in the visual
  controls for COM and Telnet connections.               }
procedure TfrmAConfig.FormActivate(Sender: TObject);
begin
Try
  Screen.Cursor := crHourGlass;
  cbPorts.ItemIndex := cbPorts.Items.IndexOf(APortSelected);
  {InMemory significa que la app. se ejecuta desde un medio no grabable y el ini no se
  puede crear, por lo tanto los datos se manejaran en memoria como un dataset normal}
  If Not (InMemory) Then
    Begin
      frmAdicional.setIni;
      {Seccion de Puerto para COM Port Settings}
      If AIniFile.SectionExists('Puerto') Then
        Begin
          cbPorts.ItemIndex := cbPorts.Items.IndexOf(AIniFile.ReadString('Puerto','Port',''));
          cbBaudRate.ItemIndex := cbBaudRate.Items.IndexOf(AIniFile.ReadString('Puerto','BaudRate',''));
          cbParity.ItemIndex := cbParity.Items.IndexOf(AIniFile.ReadString('Puerto','Parity',''));
          cbStopBits.ItemIndex := cbStopBits.Items.IndexOf(AIniFile.ReadString('Puerto','StopBits',''));
          cbFlowControl.ItemIndex := cbFlowControl.Items.IndexOf(AIniFile.ReadString('Puerto','FlowControl',''));
        End
      Else
        Begin
          frmAdicional.Puerto.StoreSettings(stIniFile,strAIniFile);
          cbPorts.ItemIndex := cbPorts.Items.IndexOf(AIniFile.ReadString('Puerto','Port',''));
          cbBaudRate.ItemIndex := cbBaudRate.Items.IndexOf(AIniFile.ReadString('Puerto','BaudRate',''));
          cbParity.ItemIndex := cbParity.Items.IndexOf(AIniFile.ReadString('Puerto','Parity',''));
          cbStopBits.ItemIndex := cbStopBits.Items.IndexOf(AIniFile.ReadString('Puerto','StopBits',''));
          {If ReadString('Puerto','FlowControl','') = 'Custom' Then
            cbFlowControl.ItemIndex := cbFlowControl.Items.IndexOf(FlowControlToStr(fcNone))
          Else}
          cbFlowControl.ItemIndex := cbFlowControl.Items.IndexOf(AIniFile.ReadString('Puerto','FlowControl',''));
        End;

      {Seccion de XpressTerminal para TelnetSettings y otros}
      If AIniFile.SectionExists(SectionXT) Then
        Begin
          edHost.Text := AIniFile.ReadString(SectionXT,'Host','');
          edPort.Text := AIniFile.ReadString(SectionXT,'Port','');
        End
      Else
        Begin
          AIniFile.WriteString(SectionXT,'Count','0');
          AIniFile.WriteString(SectionXT,'CountSec','0');
          AIniFile.WriteString(SectionXT,'Path',LogPath);
          AIniFile.WriteString(SectionXT,'IfTelnet','False');
          AIniFile.WriteString(SectionXT,'Host','');
          AIniFile.WriteString(SectionXT,'Port','23');
          AIniFile.WriteString(SectionXT,'CountTelnet','0');
          AIniFile.WriteString(SectionXT,'ControlDTR','Enable');
          AIniFile.WriteString(SectionXT,'ControlRTS','Enable');
          edHost.Text := AIniFile.ReadString(SectionXT,'Host','');
          edPort.Text := AIniFile.ReadString(SectionXT,'Port','');
        End;
      frmAdicional.freeIni;
    End {End-If Not InMemory}
  Else
    Begin
      {Carga los comoboxes con los valores en memoria del COM Port Setting}
      cbPorts.ItemIndex := cbPorts.Items.IndexOf(frmAdicional.IniMemoryPort.Value);
      cbBaudRate.ItemIndex := cbBaudRate.Items.IndexOf(frmAdicional.IniMemoryBaudRate.Value);
      cbParity.ItemIndex := cbParity.Items.IndexOf(frmAdicional.IniMemoryParity.Value);
      cbStopBits.ItemIndex := cbStopBits.Items.IndexOf(frmAdicional.IniMemoryStopBits.Value);
      cbFlowControl.ItemIndex := cbFlowControl.Items.IndexOf(frmAdicional.IniMemoryFlowControl.Value);

      {Carga los valores en memoria para Telnet Setting }
      edHost.Text := frmAdicional.IniMemoryHost.Value;
      edPort.Text := frmAdicional.IniMemoryTelnetPort.Value;
    End; {End-InMemory}

  If Not(APortSelected = 'COMX') Then
    rgPortType.ItemIndex := 0
  Else
    rgPortType.ItemIndex := 1;
  rgPortTypeChange(Sender,0);
Finally
  Screen.Cursor := crDefault;
End;
end;

{ Summary
  Close button method
  
  Description
  This code save the configuration the user has chosen to the
  ini file or to the memory (in case of read only media).     }
procedure TfrmAConfig.btCloseClick(Sender: TObject);
begin
Case rgPortType.ItemIndex Of
  0 :
    Begin
      If cbPorts.Text <> '' Then
        APortSelected := cbPorts.Text
      Else
        APortSelected := 'COM1';
      {InMemory significa que la app. se ejecuta desde un medio no grabable y el ini no se
      puede crear, por lo tanto los datos se manejaran en memoria como un dataset normal}
      If Not (InMemory) Then
        Begin
          frmAdicional.setIni;
          If Not (AIniFile.SectionExists('Puerto')) Then
            frmAdicional.Puerto.StoreSettings(stIniFile,strAIniFile);

          If Not (AIniFile.SectionExists(SectionXT)) Then
            Begin
              AIniFile.WriteString(SectionXT,'Count','0');
              AIniFile.WriteString(SectionXT,'CountSec','0');
              AIniFile.WriteString(SectionXT,'Path',LogPath);
              AIniFile.WriteString(SectionXT,'IfTelnet','False');
              AIniFile.WriteString(SectionXT,'Host','');
              AIniFile.WriteString(SectionXT,'Port','23');
              AIniFile.WriteString(SectionXT,'CountTelnet','0');
              AIniFile.WriteString(SectionXT,'ControlDTR','Enable');
              AIniFile.WriteString(SectionXT,'ControlRTS','Enable');
            End;
          AIniFile.WriteString(SectionXT,'IfTelnet','False'); {Turn off telnet mode}
          {Asigna los valores para enviarlos al ini file}

          With frmAdicional Do
            Begin
              Puerto.Port := cbPorts.Text;
              Puerto.BaudRate := StrToBaudRate(cbBaudRate.Text);
              Puerto.Parity.Bits := StrToParity(cbParity.Text);
              Puerto.StopBits := StrToStopBits(cbStopBits.Text);
              Puerto.FlowControl.FlowControl := StrToFlowControl(cbFlowControl.Text);

              {Update Control DTR and RTS Settings}
              If cbFlowControl.Text = 'Custom' Then
                Begin
                  {Values for Control DTR and RTS}
                  Puerto.FlowControl.ControlDTR := dtrEnable; {When Enable}
                  Puerto.FlowControl.ControlRTS := rtsEnable; {When Enable}
                End;

              AIniFile.WriteString(SectionXT,'ControlDTR','Enable');
              AIniFile.WriteString(SectionXT,'ControlRTS','Enable');

              Puerto.StoreSettings(stIniFile,strAIniFile);
            End; {End-with}
          frmAdicional.freeIni;
        End {End-If Not InMemory}
      Else
        Begin
          With frmAdicional Do
            Begin
              Puerto.Port := cbPorts.Text;
              Puerto.BaudRate := StrToBaudRate(cbBaudRate.Text);
              Puerto.Parity.Bits := StrToParity(cbParity.Text);
              Puerto.StopBits := StrToStopBits(cbStopBits.Text);
              Puerto.FlowControl.FlowControl := StrToFlowControl(cbFlowControl.Text);
              {Update Control DTR and RTS Settings}
              If cbFlowControl.Text = 'Custom' Then
                Begin
                  {Values for Control DTR and RTS}
                  Puerto.FlowControl.ControlDTR := dtrEnable; {When Enable}
                  Puerto.FlowControl.ControlRTS := rtsEnable; {When Enable}
                End;

              IniMemory.Edit;
              IniMemoryIfTelnet.Value := False;
              IniMemoryPort.Value := cbPorts.Text;
              IniMemoryBaudRate.Value := cbBaudRate.Text;
              IniMemoryParity.Value := cbParity.Text;
              IniMemoryStopBits.Value := cbStopBits.Text;
              IniMemoryFlowControl.Value := cbFlowControl.Text;
              IniMemoryControlDTR.Value := 'Enable';
              IniMemoryControlRTS.Value := 'Enable';
              IniMemory.Post;
            End; {End-With}
        End; {End-InMemomy}
    End; {End 1er. Case}
  1 :
    Begin
      APortSelected := 'COMX';
      If Not (InMemory) Then
        Begin
          frmAdicional.setIni;
          If Not (AIniFile.SectionExists('Puerto')) Then
            frmAdicional.Puerto.StoreSettings(stIniFile,strAIniFile);

          If Not (AIniFile.SectionExists(SectionXT)) Then
            Begin
              AIniFile.WriteString(SectionXT,'Count','0');
              AIniFile.WriteString(SectionXT,'CountSec','0');
              AIniFile.WriteString(SectionXT,'Path',LogPath);
              AIniFile.WriteString(SectionXT,'IfTelnet','True');
              AIniFile.WriteString(SectionXT,'Host',edHost.Text);
              AIniFile.WriteString(SectionXT,'Port',edPort.Text);
              AIniFile.WriteString(SectionXT,'CountTelnet','0');
              AIniFile.WriteString(SectionXT,'ControlDTR','Enable');
              AIniFile.WriteString(SectionXT,'ControlRTS','Enable');
            End
          Else
            Begin
              AIniFile.WriteString(SectionXT,'IfTelnet','True');
              AIniFile.WriteString(SectionXT,'Host',edHost.Text);
              AIniFile.WriteString(SectionXT,'Port',edPort.Text);
            End;
          AHost := edHost.Text;
          TelnetPort := edPort.Text;
          frmAdicional.freeIni;
        End {End-If Not InMemory}
      Else
        Begin
          With frmAdicional Do
            Begin
              IniMemory.Edit;
              IniMemoryIfTelnet.Value := True;
              IniMemoryHost.Value := edHost.Text;
              IniMemoryTelnetPort.Value := edPort.Text;
              IniMemory.Post;
              AHost := edHost.Text;
              TelnetPort := edPort.Text;
            End; {End-With}
        End; {End-InMemory}
    End; {End 2do. Case}
End; {End-Case}
Close;
end;

{ Summary
  OnKeyDown event.

  Description
  This method fires every time the user press any key checking
  if the enter key [13] and the escape key [27] are pressed.   }
procedure TfrmAConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = 13 Then
  PostMessage(Handle,WM_NEXTDLGCTL,0,0);

If Key = 27 Then
  Close;
end;

{ Summary
  OnChange event.
  
  Description
  This method brings the right panel based on the item selected
  \on the radio group object.

  There are two panels, one for the COM Ports settings and the
  \other for the TCP/IP (Telnet) settings.                      }
procedure TfrmAConfig.rgPortTypeChange(Sender: TObject;
  ButtonIndex: Integer);
begin
Case rgPortType.ItemIndex Of
  0 :
    Begin
      pnComPorts.Visible := True;
      pnTelnet.Visible := Not (pnComPorts.Visible);
      cbPorts.SetFocus;
      btClose.Enabled := True;
    End;
  1 :
    Begin
      pnComPorts.Visible := False;
      pnTelnet.Visible := Not (pnComPorts.Visible);
      edHost.SetFocus;
      btClose.Enabled := ((edHost.Text <> '') And (edPort.Text <> ''));
    End;
End; {End-Case}
end;

{ Summary
  OnKeyDown event.
  
  Description
  This event fires up when the user press any key and verify is
  the key pressed is the [ENTER] key so the close button click
  is executed.                                                  }
procedure TfrmAConfig.btCloseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = 13 Then
  btClose.Click;
end;

{ Summary
  OnChange event.
  
  Description
  This method ensure the user specify a host and an ip address
  when setting up the telnet connection.                       }
procedure TfrmAConfig.edHostChange(Sender: TObject);
begin
If rgPortType.ItemIndex = 1 Then
  btClose.Enabled := ((edHost.Text <> '') And (edPort.Text <> ''));
end;

{ Summary
  OnEnter event.
  
  Description
  This method select all the text in the edPort object. }
procedure TfrmAConfig.edPortEnter(Sender: TObject);
begin
  edPort.SelectAll;
end;

{ Summary
  Show COM Ports method.
  
  Description
  This method look for the available and unused ports to add it
  to the COM Port combo box.                                    }
Procedure TfrmAConfig.ShowCOMPorts;
Var
  Cont : Integer;
Begin
Screen.Cursor := crHourGlass;
ShowPortsInUse := False;
For Cont := 1 To 50 Do
  If IsPortAvailable(Cont) Then
    cbPorts.Items.Add(ComName(Cont));
Screen.Cursor := crDefault;
End;

{ Summary
  OnCreate event.
  
  Description
  This event call the ShowCOM port method which get all the COM
  ports unused available.                                       }
procedure TfrmAConfig.FormCreate(Sender: TObject);
begin
  ShowCOMPorts;
end;

end.
