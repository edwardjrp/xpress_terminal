object frmSettings: TfrmSettings
  Left = 378
  Top = 169
  Width = 242
  Height = 157
  BorderIcons = [biSystemMenu]
  Caption = 'Terminal Settings'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbColumns: TLabel
    Left = 29
    Top = 10
    Width = 52
    Height = 13
    Caption = 'Columns:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 136
    Top = 10
    Width = 36
    Height = 13
    Caption = 'Rows:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 39
    Width = 73
    Height = 13
    Caption = 'Cursor Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 47
    Top = 69
    Width = 34
    Height = 13
    Caption = 'Color:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbCursorType: TLMDComboBox
    Left = 83
    Top = 36
    Width = 134
    Height = 21
    Cursor = crHandPoint
    Ctl3D = True
    ItemHeight = 13
    Items.Strings = (
      'Block'
      'Underline'
      'None')
    ParentCtl3D = False
    Style = csDropDownList
    TabOrder = 2
  end
  object edColumns: TLMDMaskEdit
    Left = 83
    Top = 8
    Width = 44
    Height = 19
    Cursor = crIBeam
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    Caret.ImageIndex = 0
    Caret.ListIndex = 0
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    MaxLength = 5
    CurrencySettings.SystemDefaults = cmSystem
    CurrencySettings.PositiveFormatStr = #164'1,1'
    CurrencySettings.NegativeFormatStr = '('#164'1,1)'
    CurrencySettings.Symbol = '$'
    CustomButtons = <>
    MaskType = meInteger
    Text = '0'
    DateTime = 0.000000000000000000
  end
  object edRows: TLMDMaskEdit
    Left = 173
    Top = 8
    Width = 44
    Height = 19
    Cursor = crIBeam
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    Caret.ImageIndex = 0
    Caret.ListIndex = 0
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    MaxLength = 5
    CurrencySettings.SystemDefaults = cmSystem
    CurrencySettings.PositiveFormatStr = #164'1,1'
    CurrencySettings.NegativeFormatStr = '('#164'1,1)'
    CurrencySettings.Symbol = '$'
    CustomButtons = <>
    MaskType = meInteger
    Text = '0'
    DateTime = 0.000000000000000000
  end
  object btClose: TsuiButton
    Left = 142
    Top = 96
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
    TabOrder = 3
    Transparent = True
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = btCloseClick
    OnKeyDown = btCloseKeyDown
    ResHandle = 0
  end
  object ColorBox: TColorBox
    Left = 83
    Top = 65
    Width = 135
    Height = 22
    Ctl3D = True
    ItemHeight = 16
    ParentCtl3D = False
    TabOrder = 4
  end
end
