object frmConfig: TfrmConfig
  Left = 255
  Top = 189
  BorderStyle = bsDialog
  Caption = 'Port Setting'
  ClientHeight = 309
  ClientWidth = 319
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnModem: TPanel
    Left = 14
    Top = 66
    Width = 287
    Height = 190
    BevelInner = bvLowered
    TabOrder = 4
    Visible = False
    object Label9: TLabel
      Left = 38
      Top = 67
      Width = 53
      Height = 13
      Caption = 'Phone #:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel3: TBevel
      Left = 66
      Top = 27
      Width = 153
      Height = 9
      Style = bsRaised
    end
    object Label11: TLabel
      Left = 89
      Top = 7
      Width = 108
      Height = 13
      Caption = 'Modem Parameters'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 27
      Top = 96
      Width = 59
      Height = 13
      Caption = 'COM Port:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edPhone: TEdit
      Left = 93
      Top = 65
      Width = 137
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edPhoneChange
    end
    object cbModemPort: TcxComboBox
      Left = 91
      Top = 91
      Width = 142
      Height = 21
      Cursor = crHandPoint
      Properties.DropDownListStyle = lsFixedList
      Properties.HideSelection = False
      Properties.ImmediateUpdateText = True
      Properties.ReadOnly = False
      TabOrder = 1
    end
  end
  object pnComPorts: TPanel
    Left = 14
    Top = 66
    Width = 287
    Height = 190
    BevelInner = bvLowered
    TabOrder = 3
    TabStop = True
    Visible = False
    object Estado: TLabel
      Left = 53
      Top = 74
      Width = 65
      Height = 13
      Caption = 'Baud Rate:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 59
      Top = 48
      Width = 59
      Height = 13
      Caption = 'COM Port:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 81
      Top = 103
      Width = 37
      Height = 13
      Caption = 'Parity:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 62
      Top = 130
      Width = 56
      Height = 13
      Caption = 'Stop Bits:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 43
      Top = 157
      Width = 75
      Height = 13
      Caption = 'Flow Control:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 83
      Top = 7
      Width = 122
      Height = 13
      Caption = 'COM Port Parameters'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 67
      Top = 27
      Width = 153
      Height = 9
      Style = bsRaised
    end
    object cbBaudRate: TLMDComboBox
      Left = 123
      Top = 71
      Width = 121
      Height = 21
      Cursor = crHandPoint
      Ctl3D = True
      Enabled = False
      ItemHeight = 13
      ParentCtl3D = False
      Style = csDropDownList
      TabOrder = 0
    end
    object cbParity: TLMDComboBox
      Left = 123
      Top = 99
      Width = 121
      Height = 21
      Cursor = crHandPoint
      Enabled = False
      ItemHeight = 13
      Style = csDropDownList
      TabOrder = 1
    end
    object cbFlowControl: TLMDComboBox
      Left = 123
      Top = 153
      Width = 121
      Height = 21
      Cursor = crHandPoint
      Enabled = False
      ItemHeight = 13
      Style = csDropDownList
      TabOrder = 3
    end
    object cbStopBits: TLMDComboBox
      Left = 123
      Top = 126
      Width = 121
      Height = 21
      Cursor = crHandPoint
      Enabled = False
      ItemHeight = 13
      Style = csDropDownList
      TabOrder = 2
    end
    object cbPorts: TcxComboBox
      Left = 123
      Top = 43
      Width = 121
      Height = 21
      Cursor = crHandPoint
      Properties.DropDownListStyle = lsFixedList
      Properties.HideSelection = False
      Properties.ImmediateUpdateText = True
      Properties.ReadOnly = False
      TabOrder = 4
    end
  end
  object pnTelnet: TPanel
    Left = 14
    Top = 66
    Width = 287
    Height = 190
    BevelInner = bvLowered
    TabOrder = 2
    Visible = False
    object Label5: TLabel
      Left = 57
      Top = 67
      Width = 31
      Height = 13
      Caption = 'Host:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 60
      Top = 103
      Width = 28
      Height = 13
      Caption = 'Port:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 66
      Top = 27
      Width = 153
      Height = 9
      Style = bsRaised
    end
    object Label7: TLabel
      Left = 88
      Top = 7
      Width = 110
      Height = 13
      Caption = 'TCP/IP Parameters'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edHost: TEdit
      Left = 93
      Top = 65
      Width = 137
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edHostChange
    end
    object edPort: TMaskEdit
      Left = 93
      Top = 102
      Width = 35
      Height = 19
      Ctl3D = False
      EditMask = '#####;0; '
      MaxLength = 5
      ParentCtl3D = False
      TabOrder = 1
      Text = '23'
      OnChange = edHostChange
    end
  end
  object btClose: TsuiButton
    Left = 228
    Top = 268
    Width = 75
    Height = 29
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = '&Ok'
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
    OnClick = btCloseClick
    ResHandle = 0
  end
  object rgPortType: TLMDRadioGroup
    Left = 14
    Top = 13
    Width = 288
    Height = 41
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsFrameInset
    BtnAlignment.Alignment = agCenterLeft
    BtnAlignment.OffsetX = 8
    BtnAlignment.Spacing = 4
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = [fsBold]
    CaptionParentFont = False
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'COM PORTS'
      'TCP/IP'
      'MODEM')
    ItemHeight = 33
    ItemOffset = 5
    ParentFont = False
    TabOrder = 1
    OnChange = rgPortTypeChange
    ItemIndex = 0
  end
end
