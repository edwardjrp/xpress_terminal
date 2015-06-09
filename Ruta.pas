unit Ruta;

interface

uses
  Windows, Messages,SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit, LMDBrowseEdit, SUIButton;

type
  TfrmRuta = class(TForm)
    DirLog: TLMDBrowseEdit;
    Label1: TLabel;
    btOk: TsuiButton;
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRuta: TfrmRuta;

implementation

uses XTerminal, UAdicional;

{$R *.dfm}

procedure TfrmRuta.btOkClick(Sender: TObject);
begin
LogPath := TRIM(DirLog.Text);
If LogPath = '' Then
  LogPath := ExtractFilePath(Application.ExeName)+'Logs\'
Else
  Begin
    If LogPath[Length(LogPath)] <> '\' Then
      LogPath := LogPath + '\';
  End;
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
   {Writing the values to the IniFile}
   IniFile.WriteString(SectionXT,'Path',LogPath);
   {Write the log path in the manual mode ini file}
   frmAdicional.setIni;
   AIniFile.WriteString(SectionXT,'Path',LogPath);
   frmAdicional.freeIni;
 End;
frmPrincipal.freeIni;
end;

procedure TfrmRuta.FormActivate(Sender: TObject);
begin
frmPrincipal.setIni;
If IniFile.SectionExists(SectionXT) Then
  Begin
    {Getting the path value from the IniFile}
    DirLog.Text := IniFile.ReadString(SectionXT,'Path','');
  End;
frmPrincipal.freeIni;
end;

procedure TfrmRuta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = 27 Then
  Close;

If Key = 13 Then
  btOk.Click;
end;

end.
