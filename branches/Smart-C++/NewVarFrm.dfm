object NewVarForm: TNewVarForm
  Left = 779
  Top = 259
  BorderStyle = bsDialog
  Caption = #26032#24314#21464#37327
  ClientHeight = 449
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 51
    Height = 13
    Caption = #36820#22238#31867#22411':'
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 39
    Height = 13
    Caption = #21464#37327#21517':'
  end
  object Label3: TLabel
    Left = 76
    Top = 172
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Name:'
  end
  object Label4: TLabel
    Left = 76
    Top = 224
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Name:'
  end
  object Label6: TLabel
    Left = 8
    Top = 68
    Width = 39
    Height = 13
    Caption = #23454#29616#22312':'
  end
  object rgScope: TRadioGroup
    Left = 8
    Top = 96
    Width = 333
    Height = 41
    Caption = #35775#38382#26435#38480
    Columns = 4
    Items.Strings = (
      'Private'
      'Protected'
      'Public'
      'Published')
    TabOrder = 3
  end
  object cmbType: TComboBox
    Left = 88
    Top = 8
    Width = 253
    Height = 21
    AutoDropDown = True
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    Text = 'cmbType'
    OnChange = cmbTypeChange
    Items.Strings = (
      'bool'
      'double'
      'float'
      'int')
  end
  object txtName: TEdit
    Left = 88
    Top = 32
    Width = 253
    Height = 21
    TabOrder = 1
    Text = 'txtName'
    OnChange = cmbTypeChange
  end
  object chkReadFunc: TCheckBox
    Left = 8
    Top = 148
    Width = 333
    Height = 17
    Caption = #21019#24314#35835#21462#35813#21464#37327#30340#25104#21592#20989#25968
    TabOrder = 4
    OnClick = chkReadFuncClick
  end
  object chkWriteFunc: TCheckBox
    Left = 8
    Top = 200
    Width = 333
    Height = 17
    Caption = #21019#24314#20889#20837#35813#21464#37327#30340#25104#21592#20989#25968
    TabOrder = 7
    OnClick = chkWriteFuncClick
  end
  object txtReadFunc: TEdit
    Left = 112
    Top = 168
    Width = 229
    Height = 21
    TabOrder = 6
    Text = 'txtReadFunc'
    OnChange = cmbTypeChange
  end
  object txtWriteFunc: TEdit
    Left = 112
    Top = 220
    Width = 229
    Height = 21
    TabOrder = 9
    Text = 'txtWriteFunc'
    OnChange = cmbTypeChange
  end
  object btnCreate: TButton
    Left = 95
    Top = 416
    Width = 75
    Height = 25
    Caption = #26032#24314'(&N)'
    Default = True
    ModalResult = 1
    TabOrder = 11
    OnClick = btnCreateClick
  end
  object btnCancel: TButton
    Left = 179
    Top = 416
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 12
  end
  object cmbClass: TComboBox
    Left = 88
    Top = 64
    Width = 253
    Height = 21
    AutoDropDown = True
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    Text = 'cmbClass'
    Items.Strings = (
      'bool'
      'double'
      'float'
      'int'
      'void')
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 252
    Width = 333
    Height = 153
    Caption = #27880#37322
    TabOrder = 10
    object Label5: TLabel
      Left = 8
      Top = 20
      Width = 27
      Height = 13
      Caption = #25551#36848':'
    end
    object Label7: TLabel
      Left = 8
      Top = 128
      Width = 27
      Height = 13
      Caption = #39118#26684':'
    end
    object memDescr: TMemo
      Left = 16
      Top = 36
      Width = 309
      Height = 81
      Lines.Strings = (
        'memDescr')
      ScrollBars = ssBoth
      TabOrder = 0
      OnChange = memDescrChange
    end
    object cmbComment: TComboBox
      Left = 40
      Top = 124
      Width = 205
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '/** '#24378#35843#27880#37322' */'
      Items.Strings = (
        '/** '#24378#35843#27880#37322' */'
        '/* C '#39118#26684#27880#37322' */'
        '// C++ '#39118#26684#27880#37322)
    end
  end
  object chkInlineR: TCheckBox
    Left = 8
    Top = 172
    Width = 53
    Height = 17
    Caption = 'Inline'
    Enabled = False
    TabOrder = 5
  end
  object chkInlineW: TCheckBox
    Left = 8
    Top = 224
    Width = 53
    Height = 17
    Caption = 'Inline'
    Enabled = False
    TabOrder = 8
  end
end
