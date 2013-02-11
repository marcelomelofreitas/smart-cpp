object WindowListForm: TWindowListForm
  Left = 415
  Top = 257
  Width = 616
  Height = 438
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 369
    Width = 608
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      608
      35)
    object OkBtn: TBitBtn
      Left = 412
      Top = 4
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
      Left = 503
      Top = 4
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
      NumGlyphs = 2
    end
  end
  object UnitList: TListView
    Left = 8
    Top = 5
    Width = 585
    Height = 358
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Name'
        Width = -1
        WidthType = (
          -1)
      end
      item
        Caption = 'Path'
        Width = -1
        WidthType = (
          -1)
      end>
    ReadOnly = True
    RowSelect = True
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
    OnColumnClick = UnitListColumnClick
    OnCompare = UnitListCompare
    OnDblClick = UnitListDblClick
    OnKeyDown = UnitListKeyDown
  end
end
