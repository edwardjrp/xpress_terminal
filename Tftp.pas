unit Tftp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdTrivialFTP, IdUDPServer, IdTrivialFTPServer, ComCtrls, StdCtrls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDMaskEdit, LMDCustomBrowseEdit,
  LMDBrowseEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit;

type
  TfrmTftp = class(TForm)
    TftpClient: TIdTrivialFTP;
    Panel1: TPanel;
    pcTftp: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    IdTrivialFTPServer1: TIdTrivialFTPServer;
    Label5: TLabel;
    edHost: TEdit;
    Label1: TLabel;
    edPort: TLMDMaskEdit;
    DirLog: TLMDBrowseEdit;
    Label2: TLabel;
    cbTransferMode: TcxComboBox;
    Label3: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTftp: TfrmTftp;

implementation

{$R *.dfm}

procedure TfrmTftp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = 27 Then
  Close;
end;

end.
