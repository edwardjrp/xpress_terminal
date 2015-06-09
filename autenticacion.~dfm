object frmAutentica: TfrmAutentica
  Left = 423
  Top = 300
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 69
  ClientWidth = 429
  Color = clDefault
  TransparentColor = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Letrero: TLabel
    Left = 16
    Top = 8
    Width = 345
    Height = 24
    Caption = '     Searching for Equipment Model...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 5
    Top = 2
    Width = 419
    Height = 65
    Cursor = crHandPoint
    Style = bsRaised
  end
  object Autentication: TComTerminal
    Left = 38
    Top = 20
    Width = 107
    Height = 29
    Color = clWindowText
    ComPort = Puerto
    Emulation = teVT100orANSI
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Fixedsys'
    Font.Style = []
    Force7Bit = True
    ScrollBars = ssBoth
    SendLF = True
    TabOrder = 0
    Visible = False
    WrapLines = True
    OnStrRecieved = AutenticationStrRecieved
  end
  object Cerrar: TsuiButton
    Left = 170
    Top = 39
    Width = 91
    Height = 24
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Close'
    AutoSize = False
    Visible = False
    ParentFont = False
    UIStyle = MacOS
    TabOrder = 1
    Transparent = True
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = CerrarClick
    ResHandle = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 200
    Top = 65528
  end
  object Puerto: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Left = 248
  end
end
