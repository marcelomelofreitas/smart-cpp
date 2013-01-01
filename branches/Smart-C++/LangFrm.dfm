object LangForm: TLangForm
  Left = 439
  Top = 175
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Smart-C++ '#31532#19968#27425#36816#34892#37197#32622
  ClientHeight = 320
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object ThemeImage: TImage
    Left = 0
    Top = 0
    Width = 240
    Height = 320
    Center = True
  end
  object OkBtn: TBitBtn
    Left = 250
    Top = 280
    Width = 280
    Height = 30
    Caption = #19979#19968#27493'(&N)'
    Default = True
    TabOrder = 0
    OnClick = OkBtnClick
  end
  object FirstPanel: TPanel
    Left = 240
    Top = 0
    Width = 300
    Height = 275
    BevelOuter = bvNone
    TabOrder = 1
    object LanguageInfo: TLabel
      Left = 8
      Top = 222
      Width = 284
      Height = 48
      Alignment = taCenter
      AutoSize = False
      Caption = #24744#21487#20197#22312#65339#24037#20855#65341#33756#21333#20013#65339#32534#36753#22120#36873#39033#65341#30340#65339#33394#24425#65341#36873#39033#21345#20013#26356#25913#33394#24425#26679#24335#12290
      WordWrap = True
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 12
      Width = 268
      Height = 122
      Caption = 'Select your language:'
      TabOrder = 1
      object ListBox: TListBox
        Left = 8
        Top = 20
        Width = 250
        Height = 93
        ItemHeight = 15
        TabOrder = 0
      end
    end
    object ThemeGroupBox: TGroupBox
      Left = 16
      Top = 144
      Width = 268
      Height = 49
      Caption = #36873#25321' Smart-C++ '#20027#39064#26679#24335
      TabOrder = 0
      object EditorLbl: TLabel
        Left = 8
        Top = 20
        Width = 36
        Height = 15
        Caption = #32534#36753#22120
      end
      object EditorBox: TComboBox
        Left = 80
        Top = 18
        Width = 177
        Height = 23
        Style = csDropDownList
        ItemHeight = 15
        TabOrder = 0
        OnChange = ThemeChange
      end
    end
  end
  object FinishPanel: TPanel
    Left = 240
    Top = 0
    Width = 300
    Height = 275
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    object Finish2: TLabel
      Left = 8
      Top = 32
      Width = 273
      Height = 49
      AutoSize = False
      Caption = 
        #22914#26524#24744#38656#35201#24110#21161', '#35831#22312#65339#24110#21161#65341#33756#21333#20013#28857#20987' Smart-C++ '#30340#24110#21161#25991#26723', '#24744#20063#21487#20197#22312#20854#20013#38405#35835' Smart-C++ '#30340' FAQ ' +
        #25991#26723#12290
      WordWrap = True
    end
    object Finish3: TLabel
      Left = 8
      Top = 82
      Width = 284
      Height = 47
      AutoSize = False
      Caption = #24744#20063#36890#36807#35775#38382#65339#24037#20855#65341#33756#21333#20013#30340#65339#26816#26597#26356#26032#65341#26469#21319#32423#33267#26368#26032#29256#26412', '#25110#32773#19979#36733#38468#21152#21253' ('#22914#24211#25110#32773#24037#20855') '#21644' Smart-C++ '#19968#36215#20351#29992#12290
      WordWrap = True
    end
    object Finish1: TLabel
      Left = 8
      Top = 8
      Width = 284
      Height = 17
      AutoSize = False
      Caption = 'Smart-C++ '#24050#32463#25104#21151#37197#32622#12290
      WordWrap = True
    end
  end
  object CachePanel: TPanel
    Left = 240
    Top = 0
    Width = 300
    Height = 275
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object CacheInfo1: TLabel
      Left = 8
      Top = 8
      Width = 284
      Height = 33
      AutoSize = False
      Caption = #20026#20102#20248#21270#20195#30721#32534#36753', '#24314#35758#24744#20026#24120#29992#30340#22836#25991#20214#24314#31435#19968#20010#32531#23384#25991#20214#12290
      WordWrap = True
    end
    object CacheInfo2: TLabel
      Left = 8
      Top = 44
      Width = 284
      Height = 45
      AutoSize = False
      Caption = #20043#21518#24744#21516#26679#33021#22312#65339#24037#20855#65341#33756#21333#20013#30340#65339#32534#36753#22120#36873#39033#65341#30340#65339#31867#27983#35272#22120#65341#20013#65339#20195#30721#34917#20840#65341#36873#39033#21345#20013#21551#29992#22836#25991#20214#32531#23384#21151#33021#12290
      WordWrap = True
    end
    object ProgressPanel: TPanel
      Left = 0
      Top = 100
      Width = 300
      Height = 175
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object ParseLabel: TLabel
        Left = 8
        Top = 100
        Width = 284
        Height = 32
        AutoSize = False
        Caption = #22788#29702#20013'...'
        WordWrap = True
      end
      object pbCCCache: TProgressBar
        Left = 8
        Top = 136
        Width = 284
        Height = 30
        Smooth = True
        TabOrder = 0
      end
    end
    object BuildPanel: TPanel
      Left = 0
      Top = 100
      Width = 300
      Height = 175
      BevelOuter = bvNone
      TabOrder = 0
      object YesCache: TRadioButton
        Left = 16
        Top = 8
        Width = 268
        Height = 17
        Caption = #32531#23384#25152#26377#22836#25991#20214' ('#23558#20250#32791#36153#22823#37327#26102#38388')'
        TabOrder = 0
      end
      object NoCache: TRadioButton
        Left = 16
        Top = 152
        Width = 273
        Height = 17
        Caption = #19981#32531#23384#20219#20309#25991#20214
        TabOrder = 1
      end
      object AltCache: TRadioButton
        Left = 16
        Top = 32
        Width = 268
        Height = 17
        Caption = #21482#32531#23384#19979#21015#25991#20214':'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object AltFileList: TListBox
        Left = 8
        Top = 56
        Width = 201
        Height = 81
        Columns = 2
        ItemHeight = 15
        Items.Strings = (
          'assert.h'
          'complex.h'
          'ctype.h'
          'errno.h'
          'fenv.h'
          'float.h'
          'inttypes.h'
          'limits.h'
          'locale.h'
          'math.h'
          'setjmp.h'
          'signal.h'
          'stdarg.h'
          'stddef.h'
          'stdint.h'
          'stdio.h'
          'stdlib.h'
          'string.h'
          'time.h'
          'wchar.h'
          'wctype.h'
          'windows.h'
          'd3d9.h'
          'd3dx9.h')
        MultiSelect = True
        TabOrder = 3
      end
      object ButtonAddFile: TButton
        Left = 212
        Top = 56
        Width = 80
        Height = 23
        Caption = #28155#21152#25991#20214'(&A)'
        TabOrder = 4
        OnClick = ButtonAddFileClick
      end
      object ButtonRemove: TButton
        Left = 212
        Top = 112
        Width = 80
        Height = 23
        Caption = #31227#38500'(&R)'
        TabOrder = 5
        OnClick = ButtonRemoveClick
      end
      object ButtonAddFolder: TButton
        Left = 212
        Top = 84
        Width = 80
        Height = 23
        Caption = #28155#21152#25991#20214#22841'(&F)'
        TabOrder = 6
        OnClick = ButtonAddFolderClick
      end
    end
  end
  object SecondPanel: TPanel
    Left = 240
    Top = 0
    Width = 300
    Height = 275
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object ClassBrowserInfo1: TLabel
      Left = 8
      Top = 8
      Width = 284
      Height = 49
      AutoSize = False
      Caption = 'Smart-C++ '#33021#22815#20174#22836#25991#20214#20013#33719#21462#20449#24687', '#20197#29983#25104#19968#20010#31867#30340#27983#35272#22120#21644#19968#20221#20195#30721#34917#20840#21015#34920#26469#24110#21161#29992#25143#24555#36895#22320#23547#25214#20989#25968#12289#31867#21644#21464#37327#12290
      WordWrap = True
    end
    object ClassBrowserInfo2: TLabel
      Left = 8
      Top = 64
      Width = 284
      Height = 60
      AutoSize = False
      Caption = 
        #23613#31649#36825#20010#21151#33021#38750#24120#23454#29992', '#20294#26159#23427#38656#35201#26356#24555#30340'CPU'#21644#26356#22810#30340#20869#23384#25903#25345', '#20320#38656#35201#20351#29992#36825#39033#21151#33021#21527'? '#20320#21487#20197#36890#36807#35775#38382#65339#24037#20855#33756#21333#65341#20013#65339#32534#36753#22120#36873 +
        #39033#65341#30340#65339#31867#27983#35272#22120#65341#38543#26102#21551#29992#25110#32773#31105#29992#23427#12290
      WordWrap = True
    end
    object YesClassBrowser: TRadioButton
      Left = 16
      Top = 168
      Width = 268
      Height = 17
      Caption = #21551#29992#36825#39033#21151#33021
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object NoClassBrowser: TRadioButton
      Left = 16
      Top = 192
      Width = 268
      Height = 17
      Caption = #19981#21551#29992#36825#39033#21151#33021
      TabOrder = 1
    end
  end
end
