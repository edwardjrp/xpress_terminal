object frmAConfig: TfrmAConfig
  Left = 277
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Port Setting'
  ClientHeight = 339
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 316
    Height = 339
    ActivePage = tsComPorts
    Align = alClient
    TabOrder = 0
    object tsComPorts: TTabSheet
      Caption = 'Port Setting'
      object pnTelnet: TPanel
        Left = 9
        Top = 64
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
        object edPort: TLMDMaskEdit
          Left = 93
          Top = 100
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
          OnEnter = edPortEnter
          MaxLength = 5
          CurrencySettings.SystemDefaults = cmSystem
          CurrencySettings.PositiveFormatStr = #164'1,1'
          CurrencySettings.NegativeFormatStr = '('#164'1,1)'
          CurrencySettings.Symbol = '$'
          CustomButtons = <>
          MaskType = meInteger
          Text = '23'
          DateTime = 0.000000000000000000
        end
      end
      object pnComPorts: TPanel
        Left = 9
        Top = 64
        Width = 287
        Height = 190
        BevelInner = bvLowered
        TabOrder = 1
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
        object cbPorts: TLMDComboBox
          Left = 123
          Top = 44
          Width = 121
          Height = 21
          Cursor = crHandPoint
          ItemHeight = 13
          Style = csDropDownList
          TabOrder = 0
        end
        object cbBaudRate: TLMDComboBox
          Left = 123
          Top = 71
          Width = 121
          Height = 21
          Cursor = crHandPoint
          ItemHeight = 13
          Style = csDropDownList
          TabOrder = 1
        end
        object cbParity: TLMDComboBox
          Left = 123
          Top = 99
          Width = 121
          Height = 21
          Cursor = crHandPoint
          ItemHeight = 13
          Style = csDropDownList
          TabOrder = 2
        end
        object cbFlowControl: TLMDComboBox
          Left = 123
          Top = 153
          Width = 121
          Height = 21
          Cursor = crHandPoint
          ItemHeight = 13
          Style = csDropDownList
          TabOrder = 4
        end
        object cbStopBits: TLMDComboBox
          Left = 123
          Top = 126
          Width = 121
          Height = 21
          Cursor = crHandPoint
          ItemHeight = 13
          Style = csDropDownList
          TabOrder = 3
        end
      end
      object btClose: TsuiButton
        Left = 221
        Top = 270
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
      object rgPortType: TLMDRadioGroup
        Left = 8
        Top = 13
        Width = 287
        Height = 41
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsFrameInset
        BtnAlignment.Alignment = agCenterLeft
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'MS Sans Serif'
        CaptionFont.Style = [fsBold]
        Columns = 2
        Items.Strings = (
          'COM PORTS'
          'TCP/IP')
        ItemOffset = 48
        TabOrder = 0
        OnChange = rgPortTypeChange
        ItemIndex = 0
      end
    end
  end
end
