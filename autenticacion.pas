unit autenticacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CPortCtl, CPort, SUIButton;

type
  TfrmAutentica = class(TForm)
    Letrero: TLabel;
    Timer1: TTimer;
    Autentication: TComTerminal;
    Puerto: TComPort;
    Cerrar: TsuiButton;
    Bevel1: TBevel;
    procedure Timer1Timer(Sender: TObject);
    procedure AutenticationStrRecieved(Sender: TObject; var Str: String);
    procedure FormActivate(Sender: TObject);
    procedure CerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  Cadena = 'Searching for Devices...';
var
  frmAutentica: TfrmAutentica;
  ch :char;
  S :string;
  i : integer;
  
implementation

uses UGlobalMode4, XTerminal, UGlobalMode, UAdicional;

{$R *.dfm}

procedure TfrmAutentica.Timer1Timer(Sender: TObject);
begin
 i := i + 1;
  if i > 15 then
   begin
    letrero.Font.Color := clRed;
    Letrero.Caption := '       Equipments were not Found.';
    Timer1.Enabled := false;
    Cerrar.Visible := True;
   end; 
     
end;

procedure TfrmAutentica.AutenticationStrRecieved(Sender: TObject;
  var Str: String);
Var
  Codigo, Variable : string;
  Cont : integer;
begin
Variable := Str;
If (Variable = #28#20#28#20) Then
  Begin
    Puerto.ClearBuffer(true, true);
    Puerto.WriteStr(#25#19#31#11);
    {Estado.Panels[1].Text := 'Connected.';NewCode}
    Autentication.ClearScreen;
   End;

{El codigo de recibido aqui identifica el modelo del equipo en este caso
los codigo son del modelo de 8 puertos}
if (Variable = #20#28#20#28) then
  begin
    Conectado := true;
    Puerto.ClearBuffer(true, true);
    Autentication.ClearScreen;
    Modelo := 8;
    Sleep(100);
    ModalResult := mrOk;
  end;
  
if (Variable = #20#28#28#20) then   //4 puertos. 
  begin
    Conectado := true;
    Puerto.ClearBuffer(true, true);
    Autentication.ClearScreen;
    Modelo := 4;
    Sleep(100);
    ModalResult := mrOk;
  end;
  
if (Variable = #20#20#28#28) then   //2 puertos.
  begin
    Conectado := true;
    Puerto.ClearBuffer(true, true);
    Autentication.ClearScreen;
    Modelo := 2;
    Sleep(100);
    ModalResult := mrOk;
  end;
   
if (Variable = #28#20#20#28) then  //12 puertos.
  begin
    Conectado := true;
    Puerto.ClearBuffer(true, true);
    Autentication.ClearScreen;
    Modelo := 12;
    Sleep(100);
    ModalResult := mrOk;
  end;   
end;
procedure TfrmAutentica.FormActivate(Sender: TObject);
begin
    letrero.Font.Color := clLime;
    Cerrar.Visible := false;
    i := 0;
end;

procedure TfrmAutentica.CerrarClick(Sender: TObject);
begin
Close;
end;

end.
