object AddToDoForm: TAddToDoForm
  Left = 855
  Top = 321
  BorderStyle = bsToolWindow
  Caption = #28155#21152' To-Do '#39033#30446
  ClientHeight = 205
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 27
    Height = 15
    Caption = #25551#36848':'
  end
  object Label2: TLabel
    Left = 8
    Top = 124
    Width = 39
    Height = 15
    Caption = #20248#20808#32423':'
  end
  object Label3: TLabel
    Left = 132
    Top = 124
    Width = 27
    Height = 15
    Caption = #29992#25143':'
  end
  object memDescr: TMemo
    Left = 8
    Top = 24
    Width = 277
    Height = 89
    Lines.Strings = (
      'memDescr')
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = memDescrChange
  end
  object spnPri: TSpinEdit
    Left = 8
    Top = 140
    Width = 113
    Height = 24
    MaxLength = 1
    MaxValue = 9
    MinValue = 1
    TabOrder = 1
    Value = 1
  end
  object btnOK: TButton
    Left = 67
    Top = 172
    Width = 75
    Height = 25
    Caption = #30830#23450'(&O)'
    Default = True
    TabOrder = 3
    Visible = False
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 151
    Top = 172
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 4
  end
  object txtUser: TEdit
    Left = 132
    Top = 140
    Width = 153
    Height = 23
    TabOrder = 2
    Text = 'txtUser'
    OnKeyPress = txtUserKeyPress
  end
end
