object GotoLineForm: TGotoLineForm
  Left = 618
  Top = 352
  ActiveControl = Line
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #36716#21040#34892
  ClientHeight = 79
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 15
  object GotoLabel: TLabel
    Left = 11
    Top = 12
    Width = 27
    Height = 15
    Caption = #34892#21495':'
  end
  object Line: TSpinEdit
    Left = 12
    Top = 28
    Width = 137
    Height = 24
    MaxValue = 2147483647
    MinValue = 1
    TabOrder = 0
    Value = 1
    OnKeyDown = LineKeyDown
  end
  object BtnOK: TButton
    Left = 162
    Top = 12
    Width = 75
    Height = 25
    Caption = #30830#23450'(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object BtnCancel: TButton
    Left = 162
    Top = 45
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 2
  end
end
