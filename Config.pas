unit Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit,
  LMDBrowseEdit, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, SUIButton, LMDCustomParentPanel,
  LMDCustomGroupBox, LMDCustomButtonGroup, LMDCustomRadioGroup,
  LMDRadioGroup, LMDCustomComboBox, LMDComboBox, LMDCustomMaskEdit,
  LMDMaskEdit, AdSelCom, AdPort, Mask;

type
  TfrmConfig = class(TForm)
    cbPorts: TcxComboBox;
    btClose: TsuiButton;
    rgPortType: TLMDRadioGroup;
    pnTelnet: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    edHost: TEdit;
    pnComPorts: TPanel;
    Estado: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    cbBaudRate: TLMDComboBox;
    cbParity: TLMDComboBox;
    cbFlowControl: TLMDComboBox;
    cbStopBits: TLMDComboBox;
    pnModem: TPanel;
    Label9: TLabel;
    Bevel3: TBevel;
    Label11: TLabel;
    edPhone: TEdit;
    Label10: TLabel;
    cbModemPort: TcxComboBox;
    edPort: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgPortTypeChange(Sender: TObject; ButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure edHostChange(Sender: TObject);
    procedure edPhoneChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ShowCOMPorts;
  end;

var
  frmConfig: TfrmConfig;

implementation

uses XTerminal;

{$R *.dfm}

procedure TfrmConfig.FormActivate(Sender: TObject);
begin
cbPorts.Text := PortSelected;
cbModemPort.Text := PortSelected;
rgPortType.ItemIndex := 0;
rgPortTypeChange(Self,0);
edHost.Text := Host;
edPort.Text := EthePort;
edPhone.Text := PhoneNo;
end;

procedure TfrmConfig.btCloseClick(Sender: TObject);
begin
Case rgPortType.ItemIndex Of
  0 :
    Begin
      If TRIM(cbPorts.Text) <> '' Then
        PortSelected := cbPorts.Text
      Else
        PortSelected := 'COM1';
      frmPrincipal.setIni;
      If Not IniFile.SectionExists(SectionXT) Then
        Begin
          IniFile.WriteString(SectionXT,'Path',LogPath);
          IniFile.WriteString(SectionXT,'Port',PortSelected);
          IniFile.WriteString(SectionXT,'Count','0');
          IniFile.WriteString(SectionXT,'CountSec','0');
          IniFile.WriteString(SectionXT,'Host',Host);
          IniFile.WriteString(SectionXT,'EthePort',EthePort);
          IniFile.WriteString(SectionXT,'PhoneNo',PhoneNo);
          If Not (DirectoryExists(LogPath)) Then
            ForceDirectories(LogPath);
        End
      Else
        Begin
          {Writing values to IniFile}
          IniFile.WriteString(SectionXT,'Port',PortSelected);
        End;
      frmPrincipal.freeIni;
    End; {End-Case 0}
  1 :
    Begin
      Host := TRIM(edHost.Text);
      EthePort := TRIM(edPort.Text);
      frmPrincipal.setIni;
      If Not IniFile.SectionExists(SectionXT) Then
        Begin
          IniFile.WriteString(SectionXT,'Path',LogPath);
          IniFile.WriteString(SectionXT,'Port',PortSelected);
          IniFile.WriteString(SectionXT,'Count','0');
          IniFile.WriteString(SectionXT,'CountSec','0');
          IniFile.WriteString(SectionXT,'Host',Host);
          IniFile.WriteString(SectionXT,'EthePort',EthePort);
          IniFile.WriteString(SectionXT,'PhoneNo',PhoneNo);
          If Not (DirectoryExists(LogPath)) Then
            ForceDirectories(LogPath);
        End
      Else
        Begin
          IniFile.WriteString(SectionXT,'Host',Host);
          IniFile.WriteString(SectionXT,'EthePort',EthePort);
        End;
      frmPrincipal.freeIni;
    End; {End-Case 1}
  2 :
    Begin
      PhoneNo := TRIM(edPhone.Text);
      If TRIM(cbModemPort.Text) <> '' Then
        PortSelected := cbModemPort.Text
      Else
        PortSelected := 'COM1';

      frmPrincipal.setIni;
      If Not IniFile.SectionExists(SectionXT) Then
        Begin
          IniFile.WriteString(SectionXT,'Path',LogPath);
          IniFile.WriteString(SectionXT,'Port',PortSelected);
          IniFile.WriteString(SectionXT,'Count','0');
          IniFile.WriteString(SectionXT,'CountSec','0');
          IniFile.WriteString(SectionXT,'Host',Host);
          IniFile.WriteString(SectionXT,'EthePort',EthePort);
          IniFile.WriteString(SectionXT,'PhoneNo',PhoneNo);
          If Not (DirectoryExists(LogPath)) Then
            ForceDirectories(LogPath);
        End
      Else
        Begin
          IniFile.WriteString(SectionXT,'Port',PortSelected);
          IniFile.WriteString(SectionXT,'PhoneNo',PhoneNo);
        End;
      frmPrincipal.freeIni;
    End; {End-Case 2}
End; {Enc-Case}
Close;
end;

procedure TfrmConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = 13 Then
  btClose.Click;

If Key = 27 Then
  Close;
end;

procedure TfrmConfig.rgPortTypeChange(Sender: TObject;
  ButtonIndex: Integer);
begin
Case rgPortType.ItemIndex Of
  0 :
    Begin
      pnComPorts.Visible := True;
      pnTelnet.Visible := False;
      pnModem.Visible := False;
      cbPorts.SetFocus;
      btClose.Enabled := True;
    End;
  1 :
    Begin
      pnTelnet.Visible := True;
      pnComPorts.Visible := False;
      pnModem.Visible := False;
      edHost.SetFocus;
      btClose.Enabled := ((edHost.Text <> '') And (edPort.Text <> ''));
    End;
  2 :
    Begin
      pnModem.Visible := True;
      pnComPorts.Visible := False;
      pnTelnet.Visible := False;
      edPhone.SetFocus;
      btClose.Enabled := (edPhone.Text <> '');
    End;
End; {End-Case}
end;

{ Summary
  Show COM Ports method.
  
  Description
  This method look for the available and unused ports to add it
  to the COM Port combo box.                                    }
Procedure TfrmConfig.ShowCOMPorts;
Var
  Cont : Integer;
Begin
Screen.Cursor := crHourGlass;
ShowPortsInUse := False;
For Cont := 1 To 50 Do
  If IsPortAvailable(Cont) Then
    Begin
      cbPorts.Properties.Items.Add(ComName(Cont));
      cbModemPort.Properties.Items.Add(ComName(Cont));
    End;
Screen.Cursor := crDefault;
End;


procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  ShowCOMPorts;
end;

procedure TfrmConfig.edHostChange(Sender: TObject);
begin
If rgPortType.ItemIndex = 1 Then
  btClose.Enabled := ((edHost.Text <> '') And (edPort.Text <> ''));
end;

procedure TfrmConfig.edPhoneChange(Sender: TObject);
begin
If rgPortType.ItemIndex = 2 Then
  btClose.Enabled := (edPhone.Text <> '');
end;

end.
