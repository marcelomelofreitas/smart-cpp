object frmFind: TfrmFind
  Left = 672
  Top = 219
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #26597#25214#21644#26367#25442
  ClientHeight = 330
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PopupMenu = FindPopup
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    305
    330)
  PixelsPerInch = 96
  TextHeight = 13
  object btnFind: TButton
    Left = 8
    Top = 300
    Width = 100
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #26597#25214'(&F)'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnFindClick
  end
  object btnCancel: TButton
    Left = 197
    Top = 300
    Width = 100
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object FindTabs: TTabControl
    Left = 0
    Top = 0
    Width = 305
    Height = 295
    Align = alTop
    TabOrder = 2
    Tabs.Strings = (
      #24555#36895#26597#25214
      #22312#25991#20214#20013#26597#25214
      #24555#36895#26367#25442
      #22312#25991#20214#20013#26367#25442)
    TabIndex = 0
    OnChange = FindTabsChange
    object lblFind: TLabel
      Left = 8
      Top = 29
      Width = 80
      Height = 13
      AutoSize = False
      Caption = #26597#25214#20869#23481'(&N):'
      FocusControl = cboFindText
    end
    object lblReplace: TLabel
      Left = 8
      Top = 71
      Width = 80
      Height = 13
      AutoSize = False
      Caption = #26367#25442#20026'(&P):'
      FocusControl = cboFindText
    end
    object cboFindText: TComboBox
      Left = 8
      Top = 46
      Width = 289
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = cboFindTextChange
    end
    object grpOptions: TGroupBox
      Left = 8
      Top = 118
      Width = 140
      Height = 87
      Caption = #26597#25214#36873#39033
      TabOrder = 1
      object cbMatchCase: TCheckBox
        Left = 8
        Top = 16
        Width = 120
        Height = 17
        Caption = #21306#20998#22823#23567#20889'(&S)'
        TabOrder = 0
      end
      object cbWholeWord: TCheckBox
        Left = 8
        Top = 40
        Width = 121
        Height = 17
        Caption = #20840#23383#21305#37197'(&W)'
        TabOrder = 1
      end
      object cbPrompt: TCheckBox
        Left = 8
        Top = 64
        Width = 120
        Height = 17
        Caption = #26367#25442#26102#25552#31034'(&M)'
        TabOrder = 2
      end
    end
    object grpDirection: TGroupBox
      Left = 156
      Top = 118
      Width = 140
      Height = 70
      Caption = #26597#25214#26041#21521
      TabOrder = 2
      object rbBackward: TRadioButton
        Left = 8
        Top = 42
        Width = 121
        Height = 17
        Caption = #21521#21518#26597#25214'(&B)'
        TabOrder = 0
      end
      object rbForward: TRadioButton
        Left = 8
        Top = 18
        Width = 121
        Height = 17
        Caption = #21521#21069#26597#25214'(&D)'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
    object grpWhere: TGroupBox
      Left = 156
      Top = 118
      Width = 140
      Height = 87
      Caption = #26597#25214#33539#22260
      TabOrder = 3
      object rbProjectFiles: TRadioButton
        Left = 8
        Top = 18
        Width = 121
        Height = 17
        Caption = #25972#20010#24037#31243'(&H)'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbOpenFiles: TRadioButton
        Left = 8
        Top = 42
        Width = 121
        Height = 17
        Caption = #24050#25171#24320#30340#25991#20214'(&E)'
        TabOrder = 1
      end
      object rbCurFile: TRadioButton
        Left = 8
        Top = 64
        Width = 121
        Height = 17
        Caption = #24403#21069#25991#20214'(&L)'
        TabOrder = 2
      end
    end
    object grpScope: TGroupBox
      Left = 8
      Top = 212
      Width = 140
      Height = 70
      Caption = #26597#25214#21306#22495
      TabOrder = 4
      object rbGlobal: TRadioButton
        Left = 8
        Top = 18
        Width = 121
        Height = 17
        Caption = #26597#25214#20840#37096'(&G)'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbSelectedOnly: TRadioButton
        Left = 8
        Top = 42
        Width = 121
        Height = 17
        Caption = #26597#25214#36873#25321#21306#22495'(&S)'
        TabOrder = 1
      end
    end
    object grpOrigin: TGroupBox
      Left = 156
      Top = 212
      Width = 140
      Height = 70
      Caption = #26597#25214#36215#28857
      TabOrder = 5
      object rbFromCursor: TRadioButton
        Left = 8
        Top = 18
        Width = 121
        Height = 17
        Caption = #20174#20809#26631#22788#24320#22987'(&U)'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbEntireScope: TRadioButton
        Left = 8
        Top = 42
        Width = 121
        Height = 17
        Caption = #20174#22836#24320#22987'(&O)'
        TabOrder = 1
      end
    end
    object cboReplaceText: TComboBox
      Left = 8
      Top = 88
      Width = 289
      Height = 21
      ItemHeight = 13
      TabOrder = 6
    end
  end
  object FindPopup: TPopupMenu
    Left = 112
    Top = 296
    object FindCut: TMenuItem
      Caption = #21098#20999'(&T)'
      ShortCut = 16472
      OnClick = FindCutClick
    end
    object FindCopy: TMenuItem
      Caption = #22797#21046'(&C)'
      ShortCut = 16451
      OnClick = FindCopyClick
    end
    object FindPaste: TMenuItem
      Caption = #31896#36148'(&P)'
      ShortCut = 16470
      OnClick = FindPasteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object FindSelAll: TMenuItem
      Caption = #20840#36873'(&S)'
      ShortCut = 16449
      OnClick = FindSelAllClick
    end
  end
end
