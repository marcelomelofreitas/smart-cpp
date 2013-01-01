object ViewToDoForm: TViewToDoForm
  Left = 523
  Top = 298
  Width = 604
  Height = 282
  BorderStyle = bsSizeToolWin
  Caption = 'To-Do '#21015#34920
  Color = clBtnFace
  Constraints.MinHeight = 136
  Constraints.MinWidth = 394
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    588
    244)
  PixelsPerInch = 96
  TextHeight = 15
  object lblFilter: TLabel
    Left = 8
    Top = 199
    Width = 27
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = #36807#28388':'
  end
  object lv: TListView
    Left = 0
    Top = 0
    Width = 589
    Height = 180
    Anchors = [akLeft, akTop, akRight, akBottom]
    Checkboxes = True
    Columns = <
      item
        Caption = #23436#25104
        Width = 42
      end
      item
        Caption = #20248#20808#32423
      end
      item
        Caption = #25551#36848
        Width = 263
      end
      item
        Caption = #25991#20214#21517
        Width = 144
      end
      item
        Caption = #29992#25143
        Width = 90
      end>
    ReadOnly = True
    RowSelect = True
    SortType = stBoth
    TabOrder = 0
    ViewStyle = vsReport
    OnColumnClick = lvColumnClick
    OnCompare = lvCompare
    OnCustomDrawItem = lvCustomDrawItem
    OnCustomDrawSubItem = lvCustomDrawSubItem
    OnDblClick = lvDblClick
    OnMouseDown = lvMouseDown
  end
  object btnClose: TButton
    Left = 502
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #20851#38381'(&C)'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object chkNoDone: TCheckBox
    Left = 8
    Top = 227
    Width = 289
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #19981#26174#31034#26631#35760#20026#24050#23436#25104#30340#26465#30446'(&D)'
    TabOrder = 2
    OnClick = chkNoDoneClick
  end
  object cmbFilter: TComboBox
    Left = 52
    Top = 195
    Width = 245
    Height = 23
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 15
    TabOrder = 3
    OnChange = cmbFilterChange
    Items.Strings = (
      #25152#26377#25991#20214
      #24050#32463#25171#24320#30340#25991#20214
      #25152#26377#24037#31243#25991#20214
      #24050#32463#25171#24320#30340#24037#31243#25991#20214
      #24050#32463#25171#24320#30340#38750#24037#31243#25991#20214
      #24403#21069#25991#20214)
  end
end
