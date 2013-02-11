object EditorOptForm: TEditorOptForm
  Left = 482
  Top = 130
  BorderStyle = bsDialog
  Caption = #32534#36753#22120#36873#39033
  ClientHeight = 370
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    387
    370)
  PixelsPerInch = 96
  TextHeight = 12
  object PagesMain: TPageControl
    Left = 0
    Top = 0
    Width = 388
    Height = 340
    ActivePage = tabGeneral
    TabOrder = 0
    OnChange = PagesMainChange
    object tabGeneral: TTabSheet
      Caption = #22522#26412
      object grpMargin: TGroupBox
        Left = 211
        Top = 163
        Width = 161
        Height = 72
        Caption = #21491#36793#32536
        TabOrder = 0
        object lblMarginWidth: TLabel
          Left = 6
          Top = 34
          Width = 36
          Height = 12
          Caption = #23485#24230': '
        end
        object lblMarginColor: TLabel
          Left = 92
          Top = 34
          Width = 36
          Height = 12
          Caption = #39068#33394': '
        end
        object cpMarginColor: TColorPickerButton
          Left = 92
          Top = 46
          Width = 56
          Height = 18
          DefaultText = 'default'
          PopupSpacing = 8
          ShowSystemColors = False
          OnDefaultSelect = cpMarginColorDefaultSelect
          OnHint = cpMarginColorHint
        end
        object cbMarginVis: TCheckBox
          Left = 6
          Top = 16
          Width = 60
          Height = 14
          Caption = #21551#29992
          TabOrder = 0
        end
        object edMarginWidth: TSpinEdit
          Left = 13
          Top = 47
          Width = 48
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
      object grpEditorOpts: TGroupBox
        Left = 7
        Top = 2
        Width = 365
        Height = 152
        Caption = #26434#39033
        TabOrder = 2
        object cbFunctionHint: TCheckBox
          Left = 193
          Top = 133
          Width = 160
          Height = 13
          Caption = #26174#31034#20989#25968#25552#31034
          TabOrder = 0
        end
        object cbTrimTrailingSpaces: TCheckBox
          Left = 6
          Top = 133
          Width = 168
          Height = 13
          Caption = #21024#38500#34892#26411#22810#20313#31354#26684
          TabOrder = 1
        end
        object cbAutoIndent: TCheckBox
          Left = 6
          Top = 21
          Width = 168
          Height = 13
          Caption = '{}'#20013#25554#20837#32553#36827
          TabOrder = 2
        end
        object cbDoubleLine: TCheckBox
          Left = 6
          Top = 53
          Width = 148
          Height = 13
          Caption = #21452#20987#36873#20013#24403#21069#34892
          TabOrder = 3
        end
        object cbDropFiles: TCheckBox
          Left = 6
          Top = 101
          Width = 168
          Height = 13
          Caption = 'Insert Dropped Files'
          TabOrder = 4
        end
        object cbEHomeKey: TCheckBox
          Left = 193
          Top = 21
          Width = 160
          Height = 13
          Caption = 'Enhance home key'
          TabOrder = 5
        end
        object cbInsertMode: TCheckBox
          Left = 6
          Top = 37
          Width = 116
          Height = 13
          Caption = #40664#35748#35774#32622#25554#20837#27169#24335
          TabOrder = 6
        end
        object cbParserHints: TCheckBox
          Left = 193
          Top = 117
          Width = 160
          Height = 13
          Caption = #40736#26631#31227#36807#26174#31034#25552#31034
          TabOrder = 7
        end
        object cbHalfPage: TCheckBox
          Left = 193
          Top = 85
          Width = 160
          Height = 13
          Caption = 'Page Up/Down '#28378#21160#21322#23631
          TabOrder = 8
        end
        object cbGroupUndo: TCheckBox
          Left = 6
          Top = 85
          Width = 168
          Height = 13
          Caption = #21512#24182#30456#20284#25764#38144#25805#20316
          TabOrder = 9
        end
        object cbFindText: TCheckBox
          Left = 6
          Top = 69
          Width = 168
          Height = 13
          Caption = #40664#35748#25628#32034#20809#26631#22788#25991#20214
          TabOrder = 10
        end
        object cbPastEOL: TCheckBox
          Left = 193
          Top = 53
          Width = 160
          Height = 13
          Caption = 'Cursor Past EOL'
          TabOrder = 11
        end
        object cbPastEOF: TCheckBox
          Left = 193
          Top = 37
          Width = 160
          Height = 13
          Caption = 'Cursor Past EOF'
          TabOrder = 12
        end
        object cbScrollHint: TCheckBox
          Left = 193
          Top = 101
          Width = 160
          Height = 13
          Caption = #28378#21160#26102#26174#31034#34892#21495#25552#31034
          TabOrder = 13
        end
        object cbSmartScroll: TCheckBox
          Left = 193
          Top = 69
          Width = 160
          Height = 13
          Caption = #38656#35201#26102#26174#31034#28378#21160#26465
          TabOrder = 14
        end
        object cbSpecialChars: TCheckBox
          Left = 6
          Top = 117
          Width = 168
          Height = 13
          Caption = #26174#31034#38544#34255#30340#22238#36710#31526
          TabOrder = 15
        end
      end
      object grpCaret: TGroupBox
        Left = 7
        Top = 163
        Width = 199
        Height = 72
        Caption = #34917#23383#31526#21495
        TabOrder = 1
        object lblInsertCaret: TLabel
          Left = 6
          Top = 13
          Width = 150
          Height = 12
          Caption = #25554#20837#27169#24335#26102#26174#31034#30340#34917#23383#31526#21495':'
        end
        object lblOverCaret: TLabel
          Left = 6
          Top = 31
          Width = 150
          Height = 12
          Caption = #35206#30422#27169#24335#26102#26174#31034#30340#34917#23383#31526#21495':'
        end
        object cboInsertCaret: TComboBox
          Left = 128
          Top = 10
          Width = 61
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 0
          Items.Strings = (
            #22402#30452#32447
            #27700#24179#32447
            #21322#20010#26041#22359
            #26041#22359)
        end
        object cboOverwriteCaret: TComboBox
          Left = 128
          Top = 29
          Width = 61
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 1
          Items.Strings = (
            #22402#30452#32447
            #27700#24179#32447
            #21322#20010#26041#22359
            #26041#22359)
        end
        object cbMatch: TCheckBox
          Left = 6
          Top = 50
          Width = 180
          Height = 14
          Caption = #39640#20142#21305#37197#22823#25324#21495#25110#25324#21495
          TabOrder = 2
        end
      end
      object HighCurLineBox: TGroupBox
        Left = 211
        Top = 246
        Width = 161
        Height = 68
        Caption = #39640#20142#24403#21069#34892
        TabOrder = 3
        object cpHighColor: TColorPickerButton
          Left = 92
          Top = 41
          Width = 56
          Height = 17
          DefaultText = 'default'
          PopupSpacing = 8
          ShowSystemColors = False
          OnDefaultSelect = cpHighColorDefaultSelect
          OnHint = cpHighColorHint
        end
        object cbHighlightColor: TLabel
          Left = 92
          Top = 28
          Width = 36
          Height = 12
          Caption = #39068#33394': '
        end
        object cbHighCurrLine: TCheckBox
          Left = 6
          Top = 16
          Width = 59
          Height = 14
          Caption = #21551#29992
          TabOrder = 0
          OnClick = cbHighCurrLineClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 7
        Top = 246
        Width = 199
        Height = 68
        Caption = '  Tabs  '
        TabOrder = 4
        object lblTabSize: TLabel
          Left = 141
          Top = 26
          Width = 54
          Height = 12
          Caption = 'Tab '#22823#23567':'
        end
        object seTabSize: TSpinEdit
          Left = 141
          Top = 42
          Width = 45
          Height = 21
          MaxValue = 64
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object cbUseTabs: TCheckBox
          Left = 6
          Top = 16
          Width = 129
          Height = 14
          Caption = #20351#29992' Tab '#23383#31526
          TabOrder = 1
        end
        object cbSmartTabs: TCheckBox
          Left = 6
          Top = 32
          Width = 129
          Height = 14
          Caption = 'Tab '#33258#21160#32553#36827
          TabOrder = 2
        end
      end
    end
    object tabDisplay: TTabSheet
      Caption = #26174#31034
      object ScrollHint: TLabel
        Left = 0
        Top = 282
        Width = 378
        Height = 26
        Alignment = taCenter
        AutoSize = False
        Caption = #24744#20063#21487#20197#36890#36807#25353#19979' Control '#38190#24182#28378#21160#40736#26631#28378#36718#26469#32534#36753#25991#26412#30340#22823#23567#65292#23601#20687#22312#27983#35272#22120#20013#19968#26679#65281
      end
      object grpGutter: TGroupBox
        Left = 7
        Top = 115
        Width = 365
        Height = 148
        Caption = #35013#35746#32447
        TabOrder = 1
        DesignSize = (
          365
          148)
        object lblGutterFont: TLabel
          Left = 6
          Top = 73
          Width = 30
          Height = 12
          Anchors = [akLeft, akRight, akBottom]
          Caption = #23383#20307':'
        end
        object lblGutterWidth: TLabel
          Left = 288
          Top = 26
          Width = 71
          Height = 12
          Anchors = [akLeft, akRight, akBottom]
          AutoSize = False
          Caption = #35013#35746#32447#23485#24230':'
          WordWrap = True
        end
        object lblGutterFontSize: TLabel
          Left = 288
          Top = 73
          Width = 30
          Height = 12
          Anchors = [akLeft, akRight, akBottom]
          Caption = #22823#23567':'
        end
        object cbLeadZero: TCheckBox
          Left = 140
          Top = 53
          Width = 130
          Height = 12
          Caption = #26174#31034#21069#23548#38646
          TabOrder = 5
        end
        object cbFirstZero: TCheckBox
          Left = 140
          Top = 37
          Width = 130
          Height = 12
          Caption = #20174'0'#24320#22987
          TabOrder = 4
        end
        object cbLineNum: TCheckBox
          Left = 140
          Top = 21
          Width = 130
          Height = 12
          Caption = #26174#31034#34892#21495
          TabOrder = 3
          OnClick = cbLineNumClick
        end
        object cbGutterVis: TCheckBox
          Left = 6
          Top = 21
          Width = 116
          Height = 12
          Caption = #26174#31034
          TabOrder = 0
        end
        object cbGutterAuto: TCheckBox
          Left = 6
          Top = 37
          Width = 116
          Height = 12
          Caption = #33258#21160#35774#32622#22823#23567
          TabOrder = 1
        end
        object cbGutterFnt: TCheckBox
          Left = 6
          Top = 53
          Width = 116
          Height = 12
          Caption = #20351#29992#33258#23450#20041#23383#20307
          TabOrder = 2
          OnClick = cbGutterFntClick
        end
        object cboGutterFont: TComboBox
          Left = 10
          Top = 86
          Width = 272
          Height = 66
          AutoComplete = False
          Style = csOwnerDrawVariable
          ItemHeight = 60
          Sorted = True
          TabOrder = 6
          OnDrawItem = cboGutterFontDrawItem
        end
        object edGutterSize: TSpinEdit
          Left = 288
          Top = 86
          Width = 64
          Height = 21
          MaxValue = 999
          MinValue = 1
          TabOrder = 7
          Value = 10
          OnChange = edGutterSizeChange
        end
        object edGutterWidth: TSpinEdit
          Left = 288
          Top = 39
          Width = 64
          Height = 21
          MaxValue = 999
          MinValue = 1
          TabOrder = 8
          Value = 32
        end
      end
      object grpEditorFont: TGroupBox
        Left = 7
        Top = 2
        Width = 365
        Height = 88
        Caption = #32534#36753#22120
        TabOrder = 0
        object lblEditorSize: TLabel
          Left = 288
          Top = 13
          Width = 30
          Height = 12
          Caption = #22823#23567':'
        end
        object lblEditorFont: TLabel
          Left = 6
          Top = 13
          Width = 30
          Height = 12
          Caption = #23383#20307':'
        end
        object cboEditorFont: TComboBox
          Left = 10
          Top = 26
          Width = 272
          Height = 66
          AutoComplete = False
          Style = csOwnerDrawVariable
          ItemHeight = 60
          Sorted = True
          TabOrder = 0
          OnChange = cboEditorFontChange
          OnDrawItem = cboEditorFontDrawItem
        end
        object edEditorSize: TSpinEdit
          Left = 288
          Top = 26
          Width = 64
          Height = 21
          MaxValue = 999
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = edEditorSizeChange
        end
      end
    end
    object tabSyntax: TTabSheet
      Caption = #35821#27861#39118#26684
      object cpForeground: TColorPickerButton
        Left = 14
        Top = 134
        Width = 88
        Height = 17
        CustomText = 'Custom'
        DefaultText = 'Default'
        PopupSpacing = 8
        ShowSystemColors = True
        OnChange = StyleChange
        OnDefaultSelect = DefaultSelect
        OnHint = PickerHint
      end
      object cpBackground: TColorPickerButton
        Left = 14
        Top = 170
        Width = 88
        Height = 17
        CustomText = 'Custom'
        DefaultText = 'Default'
        PopupSpacing = 8
        ShowSystemColors = True
        OnChange = StyleChange
        OnDefaultSelect = DefaultSelect
        OnHint = PickerHint
      end
      object lblForeground: TLabel
        Left = 7
        Top = 122
        Width = 42
        Height = 12
        Caption = #21069#26223#33394':'
      end
      object lblBackground: TLabel
        Left = 7
        Top = 158
        Width = 42
        Height = 12
        Caption = #32972#26223#33394':'
      end
      object lblSpeed: TLabel
        Left = 7
        Top = 269
        Width = 102
        Height = 12
        Caption = #24555#36895#36873#25321#39044#32622#20027#39064':'
      end
      object btnSaveSyntax: TSpeedButton
        Left = 6
        Top = 287
        Width = 17
        Height = 17
        Hint = #20445#23384#33258#23450#20041#20027#39064
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000CE0E0000D80E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000000000000000000000000000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000666148A89F77DD
          DDDD9B9A8F00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF00000000A89F77A89F77E9E9E9B2B0A7D5D4D29392894848480000
          0000FF0000FF0000FF0000FF0000FF0000FF00000000B9B294A89F77756E534A
          473AACA47EDADAD5E0E0E0B4B4B476736500000000FF0000FF0000FF0000FF00
          00FF00000000A89F77A89F77756E53F3F3F3F1F1F1E7E7E7E1E1E1B4B2A96661
          48635E464A463400000000FF0000FF00000000B2AA87F0EFE8EBE9E0A89F7763
          5E46ADABA4EAEAEAE4E4E4646360A89F77A89F7700000000000000FF0000FF00
          000000EBE9E0FFFFFFFFFFFFF5F4F0A89F77A89F77635E465A574B787255A89F
          77A89F7700000000FF0000FF00000000B2AA87F2F1EBFFFFFFFFFFFFFFFFFFF5
          F4F0EBE9E0A89F77A89F77756E53756E5300000000000000FF0000FF00000000
          EBE9E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F2EBE9E0A89F77A89F
          7700000000FF0000FF000000008D8A78F2F1EBFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF0EFE800000000000000FF0000FF00000000B9B294
          DFDCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECE40000
          0000FF0000FF0000FF0000FF00000000000000C9C4AED5D1BFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F8F500000000000000FF0000FF0000FF0000FF0000FF00
          00FF00000000000000C9C4AED5D1BFD5D1BFFFFFFFF4F3EEA89F7700000000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000D5
          D1BFC5C1A8EDECE400000000000000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00000000000000A89F7700000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000000000000000FF0000FF0000FF0000FF0000FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSaveSyntaxClick
      end
      object CppEdit: TSynEdit
        Left = 115
        Top = 6
        Width = 263
        Height = 250
        Align = alCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 3
        Gutter.AutoSize = True
        Gutter.BorderStyle = gbsNone
        Gutter.DigitCount = 2
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -12
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.LeftOffset = 4
        Gutter.RightOffset = 21
        Gutter.ShowLineNumbers = True
        Gutter.Width = 32
        Gutter.GradientEndColor = clBackground
        HideSelection = True
        Highlighter = cpp
        Options = [eoAutoIndent, eoDisableScrollArrows, eoHideShowScrollbars, eoNoCaret, eoNoSelection, eoSmartTabs, eoTrimTrailingSpaces]
        ReadOnly = True
        RightEdge = 0
        ScrollHintFormat = shfTopToBottom
        TabWidth = 4
        WantTabs = True
        OnGutterClick = OnGutterClick
        OnSpecialLineColors = CppEditSpecialLineColors
        OnStatusChange = cppEditStatusChange
        RemovedKeystrokes = <
          item
            Command = ecDeleteLastChar
            ShortCut = 8200
          end
          item
            Command = ecLineBreak
            ShortCut = 8205
          end
          item
            Command = ecContextHelp
            ShortCut = 112
          end>
        AddedKeystrokes = <>
      end
      object ElementList: TListBox
        Left = 6
        Top = 6
        Width = 104
        Height = 100
        ImeName = 'CN'#177'??i(CN'#177'U)'
        IntegralHeight = True
        ItemHeight = 12
        Items.Strings = (
          'Comment'
          'Identifier'
          'Keyword'
          'Number'
          'Background'
          'String'
          'Symbol'
          'WhiteSpace'
          'Directives')
        TabOrder = 0
        OnClick = ElementListClick
      end
      object grpStyle: TGroupBox
        Left = 12
        Top = 196
        Width = 88
        Height = 58
        Caption = #26679#24335
        TabOrder = 2
        object cbBold: TCheckBox
          Left = 6
          Top = 12
          Width = 80
          Height = 14
          Caption = #31895#20307
          TabOrder = 0
          OnClick = StyleChange
        end
        object cbItalic: TCheckBox
          Left = 6
          Top = 26
          Width = 80
          Height = 13
          Caption = #26012#20307
          TabOrder = 1
          OnClick = StyleChange
        end
        object cbUnderlined: TCheckBox
          Left = 6
          Top = 40
          Width = 80
          Height = 14
          Caption = #19979#21010#32447
          TabOrder = 2
          OnClick = StyleChange
        end
      end
      object cboQuickColor: TComboBox
        Left = 26
        Top = 287
        Width = 93
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 1
        OnSelect = cboQuickColorSelect
        Items.Strings = (
          #24576#26087#32463#20856
          #28145#36995#22812#26202
          'Notepad++'
          'Visual Studio'
          'Borland Delphi')
      end
      object edSyntaxExt: TEdit
        Left = 134
        Top = 285
        Width = 238
        Height = 20
        TabOrder = 4
      end
      object cbSyntaxHighlight: TCheckBox
        Left = 128
        Top = 264
        Width = 250
        Height = 14
        Caption = #23545#19979#21015#25991#20214#26684#24335#20351#29992#20195#30721#39640#20142
        TabOrder = 5
        OnClick = cbSyntaxHighlightClick
      end
    end
    object tabCode: TTabSheet
      Caption = #20195#30721
      object codepages: TPageControl
        Left = 0
        Top = 0
        Width = 380
        Height = 313
        ActivePage = tabCPInserts
        Align = alClient
        TabOrder = 0
        object tabCPInserts: TTabSheet
          Caption = #39044#32622#20195#30721#24211
          object btnAdd: TButton
            Left = 299
            Top = 17
            Width = 64
            Height = 19
            Caption = #28155#21152'(&A)'
            TabOrder = 1
            OnClick = btnAddClick
          end
          object btnRemove: TButton
            Left = 299
            Top = 81
            Width = 64
            Height = 19
            Caption = #21024#38500'(&R)'
            TabOrder = 0
            OnClick = btnRemoveClick
          end
          object CodeIns: TSynEdit
            Left = 0
            Top = 117
            Width = 372
            Height = 169
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 2
            TabStop = False
            Gutter.AutoSize = True
            Gutter.BorderStyle = gbsNone
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -12
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.LeftOffset = 4
            Gutter.RightOffset = 21
            Gutter.ShowLineNumbers = True
            Highlighter = cpp
            Options = [eoAutoIndent, eoHideShowScrollbars, eoKeepCaretX, eoSmartTabs, eoTabIndent, eoTrimTrailingSpaces]
            TabWidth = 4
            WantTabs = True
            OnStatusChange = CodeInsStatusChange
            RemovedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 112
              end>
            AddedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 16496
              end>
          end
          object lvCodeIns: TStringGrid
            Left = 6
            Top = 6
            Width = 296
            Height = 110
            ColCount = 3
            DefaultColWidth = 115
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
            ScrollBars = ssVertical
            TabOrder = 3
            OnSelectCell = lvCodeInsSelectCell
          end
        end
        object tabSymbols: TTabSheet
          Caption = #31526#21495#34917#20840
          ImageIndex = 2
          object grpSpecific: TGroupBox
            Left = 13
            Top = 32
            Width = 218
            Height = 122
            Caption = #20855#20307#34917#20840#36873#39033
            TabOrder = 0
            object cbParenth: TCheckBox
              Left = 13
              Top = 38
              Width = 192
              Height = 14
              Caption = #34917#20840#23567#25324#21495' '#39'()'#39
              TabOrder = 0
            end
            object cbBraces: TCheckBox
              Left = 13
              Top = 19
              Width = 192
              Height = 14
              Caption = #34917#20840#22823#25324#21495' '#39'{}'#39
              TabOrder = 1
            end
            object cbInclude: TCheckBox
              Left = 13
              Top = 58
              Width = 192
              Height = 13
              Caption = #34917#20840' include '#31526#21495' '#39'<>'#39' ;  ""'
              TabOrder = 2
            end
            object cbComments: TCheckBox
              Left = 13
              Top = 96
              Width = 192
              Height = 14
              Caption = #34917#20840#22810#34892#27880#37322#31526#21495' '#39'/**/'#39
              TabOrder = 3
            end
            object cbArray: TCheckBox
              Left = 13
              Top = 77
              Width = 192
              Height = 13
              Caption = #34917#20840#26041#25324#21495' '#39'[]'#39
              TabOrder = 4
            end
          end
          object cbSymbolComplete: TCheckBox
            Left = 6
            Top = 6
            Width = 193
            Height = 14
            Caption = #21551#29992#31526#21495#34917#20840'(&E)'
            TabOrder = 1
            OnClick = cbSymbolCompleteClick
          end
        end
        object tabCPDefault: TTabSheet
          Caption = #32570#30465#28304#20195#30721
          object cbDefaultCode: TCheckBox
            Left = 3
            Top = 2
            Width = 369
            Height = 13
            Caption = #21521#27599#20010#31354#25991#20214#20013#21152#20837#19979#21015#20195#30721'(&D)'
            TabOrder = 0
          end
          object seDefault: TSynEdit
            Left = 0
            Top = 19
            Width = 374
            Height = 265
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            TabStop = False
            Gutter.AutoSize = True
            Gutter.BorderStyle = gbsNone
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -12
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.LeftOffset = 4
            Gutter.RightOffset = 21
            Gutter.ShowLineNumbers = True
            Highlighter = cpp
            Options = [eoAutoIndent, eoHideShowScrollbars, eoKeepCaretX, eoSmartTabs, eoTabIndent, eoTrimTrailingSpaces]
            TabWidth = 4
            WantTabs = True
            OnStatusChange = CodeInsStatusChange
            RemovedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 112
              end>
            AddedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 16496
              end>
          end
        end
      end
    end
    object tabCBCompletion: TTabSheet
      Caption = #31867#27983#35272#22120
      object lblCompletionDelay: TLabel
        Left = 6
        Top = 86
        Width = 72
        Height = 12
        Caption = #24310#26102' ('#27627#31186'):'
      end
      object cpCompletionBackground: TColorPickerButton
        Left = 266
        Top = 102
        Width = 90
        Height = 17
        CustomText = 'Custom'
        DefaultText = 'Default'
        PopupSpacing = 8
        ShowSystemColors = True
        OnChange = StyleChange
        OnDefaultSelect = DefaultSelect
        OnHint = PickerHint
      end
      object lblCompletionColor: TLabel
        Left = 262
        Top = 86
        Width = 54
        Height = 12
        Caption = #32972#26223#39068#33394':'
      end
      object btnCCCnew: TSpeedButton
        Left = 6
        Top = 274
        Width = 64
        Height = 20
        Caption = #28155#21152#25991#20214'(&A)'
        OnClick = btnCCCnewClick
      end
      object btnCCCdelete: TSpeedButton
        Left = 72
        Top = 274
        Width = 64
        Height = 20
        Caption = #28165#38500'(&C)'
        OnClick = btnCCCdeleteClick
      end
      object lblRefreshHint: TLabel
        Left = 230
        Top = 282
        Width = 131
        Height = 24
        Alignment = taCenter
        Caption = #35831#22312#21319#32423' Smart-C++ '#20043#21518#21047#26032#20195#30721#23436#25104#32531#23384
        WordWrap = True
      end
      object tbCompletionDelay: TTrackBar
        Left = 13
        Top = 106
        Width = 237
        Height = 29
        Max = 5000
        Min = 1
        ParentShowHint = False
        Frequency = 100
        Position = 1000
        ShowHint = False
        TabOrder = 1
        TickMarks = tmBoth
        OnChange = tbCompletionDelayChange
      end
      object chkEnableCompletion: TCheckBox
        Left = 6
        Top = 6
        Width = 366
        Height = 14
        Caption = #21551#29992#20195#30721#23436#25104#25552#31034'(&E)'
        TabOrder = 0
        OnClick = chkEnableCompletionClick
      end
      object chkCCCache: TCheckBox
        Left = 6
        Top = 141
        Width = 366
        Height = 13
        Caption = #20351#29992#20195#30721#23436#25104#25552#31034#32531#23384'(&U)'
        TabOrder = 2
        OnClick = chkCCCacheClick
      end
      object lbCCC: TListBox
        Left = 6
        Top = 160
        Width = 366
        Height = 110
        ItemHeight = 12
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 3
      end
      object pbCCCache: TProgressBar
        Left = 6
        Top = 296
        Width = 196
        Height = 16
        BorderWidth = 1
        TabOrder = 4
        Visible = False
      end
      object gbCBEngine: TGroupBox
        Left = 6
        Top = 29
        Width = 366
        Height = 52
        Caption = #24037#20855#36873#39033
        TabOrder = 5
        object chkCBParseGlobalH: TCheckBox
          Left = 6
          Top = 32
          Width = 276
          Height = 14
          Caption = #25195#25551#34987' #include '#24341#29992#30340#20840#23616#25991#20214
          TabOrder = 1
        end
        object chkCBParseLocalH: TCheckBox
          Left = 6
          Top = 16
          Width = 276
          Height = 14
          Caption = #25195#25551#34987' #include '#24341#29992#30340#26412#22320#25991#20214
          TabOrder = 0
        end
      end
      object btnCCCrefresh: TButton
        Left = 138
        Top = 274
        Width = 64
        Height = 20
        Caption = #21047#26032'(&R)'
        TabOrder = 6
        OnClick = btnCCCrefreshClick
      end
    end
    object tabAutosave: TTabSheet
      Caption = #33258#21160#20445#23384
      ImageIndex = 5
      object cbAutoSave: TCheckBox
        Left = 6
        Top = 6
        Width = 366
        Height = 14
        Caption = #21551#29992#32534#36753#22120#33258#21160#20445#23384'(&E)'
        TabOrder = 0
        OnClick = cbAutoSaveClick
      end
      object OptionsGroup: TGroupBox
        Left = 6
        Top = 26
        Width = 366
        Height = 282
        Caption = #36873#39033
        TabOrder = 1
        object SaveInterval: TLabel
          Left = 13
          Top = 29
          Width = 72
          Height = 12
          Caption = #38388#38548' ('#27627#31186'):'
        end
        object lblTimeStampExample: TLabel
          Left = 19
          Top = 237
          Width = 72
          Height = 12
          Caption = #26679#20363#25991#20214#21517': '
        end
        object MinutesDelay: TTrackBar
          Left = 115
          Top = 19
          Width = 238
          Height = 32
          Max = 60
          Min = 1
          PageSize = 1
          Position = 1
          TabOrder = 0
          TickMarks = tmBoth
          OnChange = MinutesDelayChange
        end
        object FileOptions: TRadioGroup
          Left = 13
          Top = 64
          Width = 191
          Height = 78
          Caption = #25991#20214
          Items.Strings = (
            #20165#20445#23384#24403#21069#25171#24320#30340#25991#20214
            #20445#23384#25152#26377#25991#20214
            #20445#23384#25152#26377#24037#31243#25991#20214)
          TabOrder = 1
        end
        object NameOptions: TRadioGroup
          Left = 13
          Top = 150
          Width = 191
          Height = 78
          Caption = #25991#20214#21517
          Items.Strings = (
            #35206#30422#25991#20214
            #36861#21152' UNIX '#26102#38388#25139
            #36861#21152#26684#24335#21270#30340#26102#38388#25139)
          TabOrder = 2
          OnClick = NameOptionsClick
        end
      end
    end
  end
  object btnOk: TBitBtn
    Left = 168
    Top = 344
    Width = 68
    Height = 20
    Anchors = [akRight, akBottom]
    Caption = #30830#23450'(&O)'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOkClick
    NumGlyphs = 2
  end
  object btnCancel: TBitBtn
    Left = 240
    Top = 344
    Width = 68
    Height = 20
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelClick
    NumGlyphs = 2
  end
  object btnHelp: TBitBtn
    Left = 312
    Top = 344
    Width = 68
    Height = 20
    Anchors = [akRight, akBottom]
    Caption = #24110#21161'(&H)'
    Enabled = False
    TabOrder = 3
    OnClick = btnHelpClick
    NumGlyphs = 2
  end
  object cpp: TSynCppSyn
    DefaultFilter = 'C++ Files (*.c,*.cpp,*.h,*.hpp)|*.c;*.cpp;*.h;*.hpp'
    Left = 5
    Top = 426
  end
  object CppParser: TCppParser
    BaseIndex = 0
    Enabled = True
    OnTotalProgress = CppParser1TotalProgress
    Tokenizer = MainForm.CppTokenizer
    ParseLocalHeaders = True
    ParseGlobalHeaders = True
    LogStatements = False
    OnStartParsing = CppParser1StartParsing
    OnEndParsing = CppParser1EndParsing
    Left = 40
    Top = 426
  end
end
