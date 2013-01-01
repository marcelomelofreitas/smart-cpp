object ImportCBForm: TImportCBForm
  Left = 464
  Top = 299
  BorderStyle = bsDialog
  Caption = #23548#20837' Code::Blocks '#24037#31243
  ClientHeight = 221
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbSelect: TLabel
    Left = 8
    Top = 8
    Width = 161
    Height = 17
    AutoSize = False
    Caption = #36873#25321' Code::Blocks '#24037#31243#25991#20214':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
  end
  object btnBrowse: TSpeedButton
    Left = 336
    Top = 23
    Width = 23
    Height = 23
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    OnClick = btnBrowseClick
  end
  object txtCB: TEdit
    Left = 8
    Top = 24
    Width = 328
    Height = 21
    TabOrder = 0
    Text = 'txtCB'
    OnChange = txtDevChange
  end
  object gbOptions: TGroupBox
    Left = 8
    Top = 56
    Width = 349
    Height = 121
    Caption = #23548#20837#36873#39033' '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbConf: TLabel
      Left = 16
      Top = 20
      Width = 51
      Height = 17
      Caption = #23548#20837#37197#32622':'
    end
    object lbDev: TLabel
      Left = 16
      Top = 68
      Width = 108
      Height = 17
      Caption = 'Dev-C++ '#24037#31243#25991#20214':'
    end
    object btnBrowseDev: TSpeedButton
      Left = 314
      Top = 83
      Width = 23
      Height = 23
      Caption = '...'
      OnClick = btnBrowseDevClick
    end
    object cmbConf: TComboBox
      Left = 16
      Top = 36
      Width = 321
      Height = 25
      Style = csDropDownList
      ItemHeight = 17
      TabOrder = 0
    end
    object txtDev: TEdit
      Left = 16
      Top = 84
      Width = 297
      Height = 25
      TabOrder = 1
      Text = 'txtDev'
      OnChange = txtDevChange
    end
  end
  object btnImport: TButton
    Left = 103
    Top = 188
    Width = 75
    Height = 25
    Caption = #23548#20837'(&I)'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnImportClick
  end
  object btnCancel: TButton
    Left = 187
    Top = 188
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Code::Blocks project files|*.cbp'
    Left = 212
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 268
    Top = 124
  end
end
