object FilePropertiesForm: TFilePropertiesForm
  Left = 762
  Top = 224
  BorderStyle = bsDialog
  Caption = #21442#25968
  ClientHeight = 312
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PropertiesPop
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel7: TBevel
    Left = 8
    Top = 8
    Width = 393
    Height = 265
    Style = bsRaised
  end
  object Bevel8: TBevel
    Left = 208
    Top = 208
    Width = 185
    Height = 21
  end
  object Bevel2: TBevel
    Left = 208
    Top = 176
    Width = 185
    Height = 21
  end
  object Bevel3: TBevel
    Left = 16
    Top = 144
    Width = 185
    Height = 21
  end
  object Bevel4: TBevel
    Left = 16
    Top = 176
    Width = 185
    Height = 21
  end
  object Bevel6: TBevel
    Left = 208
    Top = 144
    Width = 185
    Height = 21
  end
  object Bevel5: TBevel
    Left = 16
    Top = 208
    Width = 185
    Height = 21
  end
  object Bevel1: TBevel
    Left = 16
    Top = 16
    Width = 377
    Height = 121
  end
  object lblFileName: TLabel
    Left = 24
    Top = 24
    Width = 41
    Height = 15
    Caption = #25991#20214'(&F):'
  end
  object lblProject: TLabel
    Left = 24
    Top = 54
    Width = 62
    Height = 15
    Caption = #23646#20110#24037#31243'(&I):'
  end
  object lblTotalLines: TLabel
    Left = 20
    Top = 148
    Width = 65
    Height = 15
    Caption = #25991#20214#34892#25968'(&L):'
  end
  object lblCodeLines: TLabel
    Left = 20
    Top = 180
    Width = 91
    Height = 15
    Caption = #23454#38469#20195#30721#34892#25968'(&C):'
  end
  object lblCommentLines: TLabel
    Left = 20
    Top = 212
    Width = 68
    Height = 15
    Caption = #27880#37322#34892#25968'(&O):'
  end
  object lblFileSize: TLabel
    Left = 212
    Top = 180
    Width = 65
    Height = 15
    Caption = #25991#20214#22823#23567'(&S):'
  end
  object lblEmptyLines: TLabel
    Left = 212
    Top = 148
    Width = 53
    Height = 15
    Caption = #31354#34892#25968'(&E):'
  end
  object lblIncludes: TLabel
    Left = 212
    Top = 212
    Width = 80
    Height = 15
    Caption = #21253#21547#25991#20214#25968'(&N):'
  end
  object lblAbsolute: TLabel
    Left = 24
    Top = 82
    Width = 67
    Height = 15
    Caption = #32477#23545#36335#24452'(&A):'
  end
  object lblRelative: TLabel
    Left = 24
    Top = 110
    Width = 53
    Height = 15
    Caption = #25991#20214#21517'(&F):'
  end
  object Bevel9: TBevel
    Left = 16
    Top = 240
    Width = 377
    Height = 21
  end
  object lblTimeStamp: TLabel
    Left = 20
    Top = 244
    Width = 39
    Height = 15
    Caption = #26102#38388#25139':'
  end
  object edFileSize: TEdit
    Left = 336
    Top = 180
    Width = 50
    Height = 23
    ReadOnly = True
    TabOrder = 11
  end
  object edTotalLines: TEdit
    Left = 144
    Top = 148
    Width = 50
    Height = 23
    ReadOnly = True
    TabOrder = 5
  end
  object edCodeLines: TEdit
    Left = 144
    Top = 180
    Width = 51
    Height = 23
    ReadOnly = True
    TabOrder = 6
  end
  object edCommentLines: TEdit
    Left = 144
    Top = 212
    Width = 51
    Height = 23
    ReadOnly = True
    TabOrder = 7
  end
  object edEmptyLines: TEdit
    Left = 336
    Top = 148
    Width = 51
    Height = 23
    ReadOnly = True
    TabOrder = 8
  end
  object edIncludes: TEdit
    Left = 336
    Top = 212
    Width = 51
    Height = 23
    ReadOnly = True
    TabOrder = 9
  end
  object edTimestamp: TEdit
    Left = 176
    Top = 244
    Width = 211
    Height = 23
    ReadOnly = True
    TabOrder = 10
  end
  object edProject: TEdit
    Left = 100
    Top = 50
    Width = 289
    Height = 23
    AutoSize = False
    ReadOnly = True
    TabOrder = 4
  end
  object edAbsolute: TEdit
    Left = 100
    Top = 78
    Width = 289
    Height = 23
    AutoSize = False
    ReadOnly = True
    TabOrder = 2
  end
  object edRelative: TEdit
    Left = 100
    Top = 106
    Width = 289
    Height = 23
    AutoSize = False
    ReadOnly = True
    TabOrder = 3
  end
  object btnOK: TButton
    Left = 167
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = #30830#23450'(&O)'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object cmbFiles: TComboBox
    Left = 100
    Top = 22
    Width = 289
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 0
    OnClick = cmbFilesClick
  end
  object PropertiesPop: TPopupMenu
    Left = 376
    Top = 280
    object PropertiesCopy: TMenuItem
      Caption = #22797#21046'(&C)'
      ShortCut = 16451
      OnClick = PropertiesCopyClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PropertiesSelAll: TMenuItem
      Caption = #20840#36873'(&S)'
      ShortCut = 16449
      OnClick = PropertiesSelAllClick
    end
  end
end
