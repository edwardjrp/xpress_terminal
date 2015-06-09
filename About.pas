unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, RXCtrls, StdCtrls, Buttons, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel,
  LMDCustomPanelFill, LMDPanelFill, LMDCustomComponent, LMDTimer,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl,
  LMDCustomGraphicLabel, LMDGraphicLabel, SUIButton;

type
  TfrmAbout = class(TForm)
    LMDPanelFill1: TLMDPanelFill;
    LMDHiTimer1: TLMDHiTimer;
    Image1: TImage;
    LMDGraphicLabel1: TLMDGraphicLabel;
    Panel: TSecretPanel;
    btClose: TsuiButton;
    procedure LMDHiTimer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.LMDHiTimer1Timer(Sender: TObject);
begin
if Panel.Active = false then
  Panel.Play;
end;

procedure TfrmAbout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key In [13,27] Then
  btClose.Click;
end;

procedure TfrmAbout.btCloseClick(Sender: TObject);
begin
  Close;
end;

end.
