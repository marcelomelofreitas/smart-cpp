object FunctionSearchForm: TFunctionSearchForm
  Left = 545
  Top = 213
  BorderStyle = bsDialog
  Caption = #36716#21040#20989#25968
  ClientHeight = 377
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    469
    377)
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 4
    Top = 8
    Width = 51
    Height = 15
    Caption = #26597#25214#21517#31216':'
  end
  object lvEntries: TListView
    Left = 0
    Top = 32
    Width = 469
    Height = 345
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Width = 30
      end
      item
        Caption = #31867#22411
      end
      item
        Caption = #20989#25968#21517
        Width = 300
      end
      item
        Caption = #34892
      end>
    HideSelection = False
    LargeImages = dmMain.ClassImages
    ReadOnly = True
    RowSelect = True
    SmallImages = dmMain.ClassImages
    StateImages = dmMain.ClassImages
    TabOrder = 0
    TabStop = False
    ViewStyle = vsReport
    OnCompare = lvEntriesCompare
    OnDblClick = lvEntriesDblClick
  end
  object txtSearch: TEdit
    Left = 84
    Top = 4
    Width = 379
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = txtSearchChange
    OnKeyDown = txtSearchKeyDown
    OnKeyPress = txtSearchKeyPress
  end
end
