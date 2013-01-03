object WindowListForm: TWindowListForm
  Left = 462
  Top = 283
  Width = 354
  Height = 317
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #31383#21475#21015#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 338
    Height = 6
    Align = alTop
    AutoSize = False
  end
  object Label2: TLabel
    Left = 0
    Top = 6
    Width = 6
    Height = 232
    Align = alLeft
    AutoSize = False
  end
  object Label3: TLabel
    Left = 332
    Top = 6
    Width = 6
    Height = 232
    Align = alRight
    AutoSize = False
  end
  object Panel: TPanel
    Left = 0
    Top = 238
    Width = 338
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      338
      41)
    object OkBtn: TBitBtn
      Left = 150
      Top = 10
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #30830#23450'(&O)'
      Default = True
      ModalResult = 1
      TabOrder = 0
      NumGlyphs = 2
    end
    object CancelBtn: TBitBtn
      Left = 241
      Top = 10
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #21462#28040'(&C)'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object GroupBox: TGroupBox
    Left = 6
    Top = 6
    Width = 326
    Height = 232
    Align = alClient
    Caption = #36873#25321#35201#32534#36753#30340#31383#21475
    TabOrder = 1
    object Label4: TLabel
      Left = 2
      Top = 15
      Width = 322
      Height = 3
      Align = alTop
      AutoSize = False
    end
    object Label5: TLabel
      Left = 2
      Top = 18
      Width = 6
      Height = 206
      Align = alLeft
      AutoSize = False
    end
    object Label6: TLabel
      Left = 318
      Top = 18
      Width = 6
      Height = 206
      Align = alRight
      AutoSize = False
    end
    object Label7: TLabel
      Left = 2
      Top = 224
      Width = 322
      Height = 6
      Align = alBottom
      AutoSize = False
    end
    object UnitList: TListBox
      Left = 8
      Top = 18
      Width = 310
      Height = 199
      Align = alClient
      IntegralHeight = True
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = UnitListDblClick
      OnKeyDown = UnitListKeyDown
    end
  end
end
