object frmTftp: TfrmTftp
  Left = 215
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TFTP Server & Client'
  ClientHeight = 286
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 286
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object pcTftp: TPageControl
      Left = 2
      Top = 2
      Width = 496
      Height = 282
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TFTP Client'
        object Label5: TLabel
          Left = 25
          Top = 28
          Width = 27
          Height = 13
          Caption = 'Host'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 25
          Top = 68
          Width = 24
          Height = 13
          Caption = 'Port'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 24
          Top = 108
          Width = 67
          Height = 13
          Caption = 'File to send'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 22
          Top = 149
          Width = 83
          Height = 13
          Caption = 'Transfer Mode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edHost: TEdit
          Left = 25
          Top = 41
          Width = 137
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object edPort: TLMDMaskEdit
          Left = 25
          Top = 81
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
          Text = '69'
          DateTime = 0.000000000000000000
        end
        object DirLog: TLMDBrowseEdit
          Left = 24
          Top = 122
          Width = 321
          Height = 18
          Cursor = crIBeam
          Bevel.Mode = bmWindows
          Caret.BlinkRate = 530
          Caret.ImageIndex = 0
          Caret.ListIndex = 0
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
        end
        object cbTransferMode: TcxComboBox
          Left = 22
          Top = 162
          Width = 142
          Height = 21
          Cursor = crHandPoint
          Properties.DropDownListStyle = lsFixedList
          Properties.HideSelection = False
          Properties.ImmediateUpdateText = True
          Properties.ReadOnly = False
          TabOrder = 3
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TFTP Server'
        ImageIndex = 1
      end
    end
  end
  object TftpClient: TIdTrivialFTP
    Port = 69
    ReceiveTimeout = 4000
    Left = 320
    Top = 40
  end
  object IdTrivialFTPServer1: TIdTrivialFTPServer
    Bindings = <>
    DefaultPort = 69
    Left = 384
    Top = 40
  end
end
