object frmIncremental: TfrmIncremental
  Left = 861
  Top = 494
  Anchors = []
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #28176#36827#24335#25628#32034
  ClientHeight = 25
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = IncrementalPop
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnNext: TButton
    Left = 257
    Top = 0
    Width = 25
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnNextClick
  end
  object btnPrev: TButton
    Left = 232
    Top = 0
    Width = 25
    Height = 25
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnPrevClick
  end
  object Edit: TEdit
    Left = 0
    Top = 0
    Width = 233
    Height = 24
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = EditChange
  end
  object IncrementalPop: TPopupMenu
    Left = 184
    object IncrementalUndo: TMenuItem
      Caption = #25764#38144'(&U)'
      ShortCut = 16474
      OnClick = IncrementalUndoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object IncrementalCut: TMenuItem
      Caption = #21098#20999'(&T)'
      ShortCut = 16472
      OnClick = IncrementalCutClick
    end
    object IncrementalCopy: TMenuItem
      Caption = #22797#21046'(&C)'
      ShortCut = 16451
      OnClick = IncrementalCopyClick
    end
    object IncrementalPaste: TMenuItem
      Caption = #31896#36148'(&P)'
      ShortCut = 16470
      OnClick = IncrementalPasteClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object IncrementalSelAll: TMenuItem
      Caption = #20840#36873'(&S)'
      ShortCut = 16449
      OnClick = IncrementalSelAllClick
    end
  end
end
