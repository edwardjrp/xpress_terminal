object frmAdicional: TfrmAdicional
  Left = 196
  Top = 115
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Xpress Terminal (TM) - Freeware'
  ClientHeight = 566
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 547
    Width = 743
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 200
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 547
    Align = alClient
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 482
      Width = 741
      Height = 64
      Align = alBottom
      TabOrder = 0
      object ConnectionLed: TComLed
        Left = 613
        Top = 4
        Width = 25
        Height = 25
        Hint = 'Connected'
        ComPort = Puerto
        LedSignal = lsConn
        Kind = lkGreenLight
        ParentShowHint = False
        ShowHint = True
      end
      object Estado: TLabel
        Left = 637
        Top = 10
        Width = 79
        Height = 13
        Caption = 'Disconnected'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 634
        Top = 41
        Width = 18
        Height = 13
        Caption = 'RX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RXLed: TComLed
        Left = 613
        Top = 35
        Width = 25
        Height = 25
        Hint = 'Connected'
        ComPort = Puerto
        LedSignal = lsRx
        Kind = lkGreenLight
        ParentShowHint = False
        ShowHint = True
      end
      object Label6: TLabel
        Left = 699
        Top = 41
        Width = 17
        Height = 13
        Caption = 'TX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TXLed: TComLed
        Left = 678
        Top = 35
        Width = 25
        Height = 25
        Hint = 'Connected'
        ComPort = Puerto
        LedSignal = lsTx
        Kind = lkRedLight
        ParentShowHint = False
        ShowHint = True
      end
      object Bevel1: TBevel
        Left = 93
        Top = 4
        Width = 3
        Height = 25
        Style = bsRaised
      end
      object Bevel3: TBevel
        Left = 93
        Top = 35
        Width = 3
        Height = 25
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 357
        Top = 4
        Width = 3
        Height = 25
        Style = bsRaised
      end
      object Bevel4: TBevel
        Left = 357
        Top = 35
        Width = 3
        Height = 25
        Style = bsRaised
      end
      object Bevel5: TBevel
        Left = 600
        Top = 4
        Width = 3
        Height = 25
        Style = bsRaised
      end
      object Bevel6: TBevel
        Left = 600
        Top = 35
        Width = 3
        Height = 25
        Style = bsRaised
      end
      object btConnect: TsuiButton
        Left = 5
        Top = 4
        Width = 75
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Connect'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 0
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btConnectClick
        ResHandle = 0
      end
      object Fuentes: TsuiButton
        Left = 266
        Top = 4
        Width = 70
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Fonts'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 1
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = FuentesClick
        ResHandle = 0
      end
      object Settings: TsuiButton
        Left = 191
        Top = 4
        Width = 71
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Settings'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 2
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = SettingsClick
        ResHandle = 0
      end
      object Break: TsuiButton
        Left = 496
        Top = 35
        Width = 88
        Height = 28
        Cursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Send Break'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 3
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = BreakClick
        ResHandle = 0
      end
      object Script: TsuiButton
        Left = 385
        Top = 4
        Width = 107
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Generate Script'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 4
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = ScriptClick
        ResHandle = 0
      end
      object PScript: TsuiButton
        Left = 496
        Top = 4
        Width = 88
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Paste Script'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 5
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = PScriptClick
        ResHandle = 0
      end
      object btClose: TsuiButton
        Left = 5
        Top = 34
        Width = 75
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Close'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 6
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btCloseClick
        ResHandle = 0
      end
      object btViewLog: TsuiButton
        Left = 385
        Top = 35
        Width = 107
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'View Log'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 7
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btViewLogClick
        ResHandle = 0
      end
      object btLogs: TsuiButton
        Left = 151
        Top = 34
        Width = 70
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Logs'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 8
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btLogsClick
        ResHandle = 0
      end
      object btAbout: TsuiButton
        Left = 231
        Top = 34
        Width = 70
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'About'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 9
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btAboutClick
        ResHandle = 0
      end
      object btPorts: TsuiButton
        Left = 117
        Top = 4
        Width = 70
        Height = 28
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Caption = 'Ports'
        AutoSize = False
        ParentFont = False
        UIStyle = MacOS
        TabOrder = 10
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btPortsClick
        ResHandle = 0
      end
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 741
      Height = 481
      HorzScrollBar.Visible = False
      VertScrollBar.Position = 277
      Align = alClient
      TabOrder = 1
      DesignSize = (
        721
        477)
      object Terminal: TComTerminal
        Left = -1
        Top = -3
        Width = 723
        Height = 480
        Color = clWindowText
        Columns = 87
        ComPort = Puerto
        Emulation = teVT100orANSI
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -12
        Font.Name = 'Courier'
        Font.Style = []
        Rows = 35
        ScrollBars = ssVertical
        TabOrder = 1
        WrapLines = True
        Anchors = [akLeft, akTop, akRight]
        OnStrRecieved = TerminalStrRecieved
      end
      object Telnet_Terminal: TAdTerminal
        Left = -1
        Top = -3
        Width = 723
        Height = 482
        Cursor = crIBeam
        CaptureFile = 'APROTERM.CAP'
        Columns = 87
        ComPort = Telnet_Port
        HideScrollbars = True
        LazyByteDelay = 500
        LazyTimeDelay = 80
        Rows = 35
        Scrollback = False
        FreezeScrollBack = False
        Color = clBlack
        Ctl3D = False
        Emulator = AdVT100Emulator1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -12
        Font.Name = 'Courier'
        Font.Style = []
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object MTerminal: TMemo
        Left = 0
        Top = -277
        Width = 720
        Height = 272
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = [fsBold]
        Lines.Strings = (
          '')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object MTerminal_Telnet: TMemo
        Left = 0
        Top = -277
        Width = 721
        Height = 272
        Align = alTop
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = [fsBold]
        Lines.Strings = (
          '')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 3
      end
      object PnlAuth: TPanel
        Left = 205
        Top = 218
        Width = 310
        Height = 41
        Anchors = []
        Caption = 'Searching for remote host...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
    end
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
    FlowControl.ControlDTR = dtrEnable
    FlowControl.ControlRTS = rtsEnable
    FlowControl.XonXoffOut = True
    FlowControl.XonXoffIn = True
    OnAfterOpen = PuertoAfterOpen
    Left = 568
    Top = 48
  end
  object Tiempo: TTimer
    Enabled = False
    OnTimer = TiempoTimer
    Left = 528
    Top = 48
  end
  object Abre: TOpenDialog
    Filter = 'Log Files|*.TXT'
    InitialDir = 'C:\'
    Left = 492
    Top = 48
  end
  object Telnet_Port: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '10.0.1.40')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    AutoOpen = False
    DeviceLayer = dlWinsock
    TraceAllHex = True
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    LogHex = False
    TapiMode = tmOff
    UseMSRShadow = False
    OnWsConnect = Telnet_PortWsConnect
    OnWsDisconnect = Telnet_PortWsDisconnect
    OnTriggerAvail = Telnet_PortTriggerAvail
    Left = 449
    Top = 49
  end
  object IniMemory: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Port'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BaudRate'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'StopBits'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DataBits'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Parity'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FlowControl'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Count'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CountSec'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Path'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'IfTelnet'
        DataType = ftBoolean
      end
      item
        Name = 'Host'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TelnetPort'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CountTelnet'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ControlDTR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ControlRTS'
        DataType = ftString
        Size = 15
      end>
    Left = 361
    Top = 49
    object IniMemoryPort: TStringField
      FieldName = 'Port'
      Size = 10
    end
    object IniMemoryBaudRate: TStringField
      FieldName = 'BaudRate'
      Size = 15
    end
    object IniMemoryStopBits: TStringField
      FieldName = 'StopBits'
      Size = 5
    end
    object IniMemoryDataBits: TStringField
      FieldName = 'DataBits'
      Size = 5
    end
    object IniMemoryParity: TStringField
      FieldName = 'Parity'
      Size = 10
    end
    object IniMemoryFlowControl: TStringField
      FieldName = 'FlowControl'
      Size = 15
    end
    object IniMemoryCount: TStringField
      FieldName = 'Count'
      Size = 15
    end
    object IniMemoryCountSec: TStringField
      FieldName = 'CountSec'
      Size = 15
    end
    object IniMemoryPath: TStringField
      FieldName = 'Path'
      Size = 150
    end
    object IniMemoryIfTelnet: TBooleanField
      FieldName = 'IfTelnet'
    end
    object IniMemoryHost: TStringField
      FieldName = 'Host'
    end
    object IniMemoryTelnetPort: TStringField
      FieldName = 'TelnetPort'
      Size = 10
    end
    object IniMemoryCountTelnet: TStringField
      FieldName = 'CountTelnet'
      Size = 15
    end
    object IniMemoryControlDTR: TStringField
      FieldName = 'ControlDTR'
      Size = 15
    end
    object IniMemoryControlRTS: TStringField
      FieldName = 'ControlRTS'
      Size = 15
    end
  end
  object ttyEmulator: TAdTTYEmulator
    Left = 401
    Top = 49
  end
  object AdVT100Emulator1: TAdVT100Emulator
    Terminal = Telnet_Terminal
    Answerback = 'APROterm'
    DisplayUpperASCII = False
    Left = 425
    Top = 113
  end
end
