object TipOfTheDayForm: TTipOfTheDayForm
  Left = 534
  Top = 241
  BorderStyle = bsDialog
  Caption = #27599#26085#25552#31034
  ClientHeight = 263
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 317
    Height = 237
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWhite
    TabOrder = 5
    object lblTitle: TLabel
      Left = 116
      Top = 20
      Width = 80
      Height = 19
      Caption = #20320#30693#36947#21527'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 44
      Width = 292
      Height = 2
      Shape = bsBottomLine
    end
    object lblTip: TLabel
      Left = 20
      Top = 56
      Width = 285
      Height = 161
      AutoSize = False
      Caption = 'lblTip'
      WordWrap = True
    end
    object lblUrl: TLabel
      Left = 4
      Top = 216
      Width = 309
      Height = 13
      Cursor = crHandPoint
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblUrl'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = lblUrlClick
    end
  end
  object btnPrev: TButton
    Left = 328
    Top = 32
    Width = 89
    Height = 25
    Caption = #21069#19968#26465#25552#31034'(&C)'
    TabOrder = 1
    OnClick = btnPrevClick
  end
  object btnNext: TButton
    Left = 328
    Top = 4
    Width = 89
    Height = 25
    Caption = #19979#19968#26465#25552#31034'(&N)'
    TabOrder = 0
    OnClick = btnNextClick
  end
  object btnClose: TButton
    Left = 328
    Top = 231
    Width = 89
    Height = 25
    Cancel = True
    Caption = #20851#38381'(&C)'
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object chkNotAgain: TCheckBox
    Left = 4
    Top = 243
    Width = 317
    Height = 16
    Caption = #21551#21160#26102#19981#26174#31034#27599#26085#25552#31034'(&D)'
    TabOrder = 3
  end
  object btnRandom: TButton
    Left = 328
    Top = 60
    Width = 89
    Height = 25
    Caption = #38543#26426#25552#31034'(&R)'
    TabOrder = 2
    OnClick = btnRandomClick
  end
end
