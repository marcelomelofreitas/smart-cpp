object NewTemplateForm: TNewTemplateForm
  Left = 647
  Top = 239
  BorderStyle = bsDialog
  Caption = #26032#24314#24037#31243#27169#26495
  ClientHeight = 321
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object devPages1: TPageControl
    Left = 0
    Top = 0
    Width = 358
    Height = 281
    ActivePage = pgExtras
    Align = alTop
    TabOrder = 0
    object pgTemplate: TTabSheet
      Caption = #27169#26495#20449#24687
      object lblName: TLabel
        Left = 8
        Top = 12
        Width = 95
        Height = 13
        Caption = #21517#31216':'
      end
      object lblDescr: TLabel
        Left = 8
        Top = 40
        Width = 95
        Height = 13
        Caption = #25551#36848':'
      end
      object lblCateg: TLabel
        Left = 8
        Top = 68
        Width = 95
        Height = 13
        Caption = #20998#31867':'
      end
      object lblProjName: TLabel
        Left = 8
        Top = 96
        Width = 95
        Height = 13
        Caption = #26032#24314#24037#31243#21517#31216':'
      end
      object txtDescr: TEdit
        Left = 112
        Top = 36
        Width = 225
        Height = 21
        TabOrder = 1
        Text = 'txtDescr'
      end
      object cmbCateg: TComboBox
        Left = 112
        Top = 64
        Width = 225
        Height = 21
        AutoDropDown = True
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
        Text = 'cmbCateg'
        OnChange = cmbNameChange
      end
      object txtProjName: TEdit
        Left = 112
        Top = 92
        Width = 225
        Height = 21
        TabOrder = 3
        Text = 'txtProjName'
      end
      object lblIcons: TGroupBox
        Left = 8
        Top = 128
        Width = 329
        Height = 118
        Caption = #22270#26631
        TabOrder = 4
        object lstIcons: TListBox
          Left = 12
          Top = 20
          Width = 181
          Height = 85
          Style = lbOwnerDrawFixed
          ExtendedSelect = False
          ItemHeight = 36
          TabOrder = 0
          OnClick = lstIconsClick
          OnDrawItem = lstIconsDrawItem
        end
        object btnLib: TBitBtn
          Left = 208
          Top = 17
          Width = 113
          Height = 24
          Hint = #20174' Smart-C++ '#22270#26631#24211#20013#36873#25321#19968#20010#22270#26631
          Caption = #24211'(&L)'
          TabOrder = 1
          OnClick = btnLibClick
          NumGlyphs = 2
        end
        object btnBrowse: TBitBtn
          Left = 208
          Top = 51
          Width = 113
          Height = 22
          Hint = #33258#23450#20041#22270#26631
          Caption = #27983#35272'(&B)...'
          TabOrder = 2
          OnClick = btnBrowseClick
          NumGlyphs = 2
        end
        object btnRemove: TBitBtn
          Left = 208
          Top = 83
          Width = 113
          Height = 22
          Hint = #20174#24037#31243#20013#31227#38500#19968#20010#22270#26631
          Caption = #31227#38500'(&R)'
          Enabled = False
          TabOrder = 3
          OnClick = btnRemoveClick
        end
      end
      object cmbName: TComboBox
        Left = 112
        Top = 8
        Width = 225
        Height = 21
        AutoDropDown = True
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        Text = 'cmbName'
        OnChange = cmbNameChange
      end
    end
    object pgFiles: TTabSheet
      Caption = #25991#20214
      object lblFiles: TLabel
        Left = 8
        Top = 12
        Width = 121
        Height = 13
        AutoSize = False
        Caption = #27169#26495#20013#21253#21547#30340#25991#20214':'
      end
      object lstFiles: TCheckListBox
        Left = 16
        Top = 28
        Width = 321
        Height = 213
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object pgExtras: TTabSheet
      Caption = #38468#21152
      object lblCompiler: TLabel
        Left = 8
        Top = 12
        Width = 90
        Height = 13
        Caption = #38468#21152#32534#35793#36873#39033':'
      end
      object lblLinker: TLabel
        Left = 244
        Top = 12
        Width = 90
        Height = 13
        Caption = #38468#21152#38142#25509#22120#36873#39033':'
      end
      object lblCppCompiler: TLabel
        Left = 128
        Top = 12
        Width = 90
        Height = 13
        Caption = 'C++ '#32534#35793#22120#36873#39033':'
      end
      object memCompiler: TMemo
        Left = 12
        Top = 28
        Width = 101
        Height = 149
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object memLinker: TMemo
        Left = 244
        Top = 29
        Width = 101
        Height = 148
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object memCppCompiler: TMemo
        Left = 128
        Top = 28
        Width = 101
        Height = 149
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object cbInclude: TCheckBox
        Left = 16
        Top = 192
        Width = 329
        Height = 17
        Caption = #20351#29992#24037#31243#21333#29420' include '#30446#24405
        TabOrder = 3
      end
      object cbLibrary: TCheckBox
        Left = 16
        Top = 208
        Width = 329
        Height = 17
        Caption = #20351#29992#24037#31243#21333#29420#24211#30446#24405
        TabOrder = 4
      end
      object cbRessource: TCheckBox
        Left = 16
        Top = 224
        Width = 329
        Height = 17
        Caption = #20351#29992#24037#31243#21333#29420#36164#28304#30446#24405
        TabOrder = 5
      end
    end
  end
  object btnCreate: TButton
    Left = 100
    Top = 290
    Width = 75
    Height = 25
    Caption = #26032#24314'(&N)'
    Default = True
    TabOrder = 1
    OnClick = btnCreateClick
  end
  object btnCancel: TButton
    Left = 184
    Top = 290
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object dlgPic: TOpenPictureDialog
    DefaultExt = 'ico'
    Filter = 'Icons (*.ico)|*.ico'
    Title = 'Open icon'
    Left = 295
    Top = 286
  end
end
