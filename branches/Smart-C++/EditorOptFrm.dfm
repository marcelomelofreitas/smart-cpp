object EditorOptForm: TEditorOptForm
  Left = 408
  Top = 182
  BorderStyle = bsDialog
  Caption = #32534#36753#22120#36873#39033
  ClientHeight = 462
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    484
    462)
  PixelsPerInch = 96
  TextHeight = 15
  object PagesMain: TPageControl
    Left = 0
    Top = 0
    Width = 484
    Height = 425
    ActivePage = tabGeneral
    TabOrder = 0
    object tabGeneral: TTabSheet
      Caption = #24120#35268
      object grpMargin: TGroupBox
        Left = 264
        Top = 204
        Width = 201
        Height = 90
        Caption = '  Right Margin  '
        TabOrder = 0
        object lblMarginWidth: TLabel
          Left = 8
          Top = 43
          Width = 32
          Height = 15
          Caption = 'Width'
        end
        object lblMarginColor: TLabel
          Left = 115
          Top = 43
          Width = 29
          Height = 15
          Caption = 'Color'
        end
        object cpMarginColor: TColorPickerButton
          Left = 115
          Top = 58
          Width = 70
          Height = 22
          DefaultText = 'default'
          PopupSpacing = 8
          ShowSystemColors = False
          OnDefaultSelect = cpMarginColorDefaultSelect
          OnHint = cpMarginColorHint
        end
        object cbMarginVis: TCheckBox
          Left = 8
          Top = 20
          Width = 75
          Height = 17
          Caption = 'Visible'
          TabOrder = 0
        end
        object edMarginWidth: TSpinEdit
          Left = 16
          Top = 59
          Width = 60
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
      object grpEditorOpts: TGroupBox
        Left = 9
        Top = 3
        Width = 456
        Height = 190
        Caption = #32534#36753#22120#36873#39033
        TabOrder = 2
        object cbFunctionHint: TCheckBox
          Left = 241
          Top = 166
          Width = 200
          Height = 17
          Caption = #26174#31034#20989#25968#25552#31034
          TabOrder = 0
        end
        object cbTrimTrailingSpaces: TCheckBox
          Left = 8
          Top = 166
          Width = 209
          Height = 17
          Caption = #21024#38500#34892#26411#31354#26684
          TabOrder = 1
        end
        object cbAutoIndent: TCheckBox
          Left = 8
          Top = 26
          Width = 209
          Height = 17
          Caption = #33258#21160#32553#36827
          TabOrder = 2
        end
        object cbDoubleLine: TCheckBox
          Left = 8
          Top = 66
          Width = 184
          Height = 17
          Caption = #21452#20987#36873#20013#24403#21069#34892
          TabOrder = 3
        end
        object cbDropFiles: TCheckBox
          Left = 8
          Top = 126
          Width = 209
          Height = 17
          Caption = 'Insert Dropped Files'
          TabOrder = 4
        end
        object cbEHomeKey: TCheckBox
          Left = 241
          Top = 26
          Width = 200
          Height = 17
          Caption = #22686#24378' Home '#38190#21151#33021
          TabOrder = 5
        end
        object cbInsertMode: TCheckBox
          Left = 8
          Top = 46
          Width = 145
          Height = 17
          Caption = #25554#20837#27169#24335
          TabOrder = 6
        end
        object cbParserHints: TCheckBox
          Left = 241
          Top = 146
          Width = 200
          Height = 17
          Caption = #40736#26631#31227#36807#26174#31034#32534#36753#22120#25552#31034
          TabOrder = 7
        end
        object cbHalfPage: TCheckBox
          Left = 241
          Top = 106
          Width = 200
          Height = 17
          Caption = 'Page Up/Down '#28378#21160#21322#23631
          TabOrder = 8
        end
        object cbGroupUndo: TCheckBox
          Left = 8
          Top = 106
          Width = 209
          Height = 17
          Caption = #21512#24182#30456#20284#25764#38144#25805#20316
          TabOrder = 9
        end
        object cbFindText: TCheckBox
          Left = 8
          Top = 86
          Width = 209
          Height = 17
          Caption = #40664#35748#25628#32034#20809#26631#22788#25991#20214
          TabOrder = 10
        end
        object cbPastEOL: TCheckBox
          Left = 241
          Top = 66
          Width = 200
          Height = 17
          Caption = 'Cursor Past EOL'
          TabOrder = 11
        end
        object cbPastEOF: TCheckBox
          Left = 241
          Top = 46
          Width = 200
          Height = 17
          Caption = 'Cursor Past EOF'
          TabOrder = 12
        end
        object cbScrollHint: TCheckBox
          Left = 241
          Top = 126
          Width = 200
          Height = 17
          Caption = 'Scroll Hint'
          TabOrder = 13
        end
        object cbSmartScroll: TCheckBox
          Left = 241
          Top = 86
          Width = 200
          Height = 17
          Caption = #38656#35201#26102#26174#31034#28378#21160#26465
          TabOrder = 14
        end
        object cbSpecialChars: TCheckBox
          Left = 8
          Top = 146
          Width = 209
          Height = 17
          Caption = #26174#31034#38544#34255#30340#22238#36710#31526
          TabOrder = 15
        end
      end
      object grpCaret: TGroupBox
        Left = 9
        Top = 204
        Width = 248
        Height = 90
        Caption = '  Caret  '
        TabOrder = 1
        object lblInsertCaret: TLabel
          Left = 8
          Top = 16
          Width = 61
          Height = 15
          Caption = 'Insert caret:'
        end
        object lblOverCaret: TLabel
          Left = 8
          Top = 39
          Width = 83
          Height = 15
          Caption = 'Overwrite caret:'
        end
        object cboInsertCaret: TComboBox
          Left = 136
          Top = 12
          Width = 100
          Height = 23
          Style = csDropDownList
          ItemHeight = 15
          TabOrder = 0
          Items.Strings = (
            'Vertical Line'
            'Horizontal Line'
            'Half Block'
            'Block')
        end
        object cboOverwriteCaret: TComboBox
          Left = 136
          Top = 36
          Width = 100
          Height = 23
          Style = csDropDownList
          ItemHeight = 15
          TabOrder = 1
          Items.Strings = (
            'Vertical Line'
            'Horizontal Line'
            'Half Block'
            'Block')
        end
        object cbMatch: TCheckBox
          Left = 8
          Top = 63
          Width = 225
          Height = 17
          Caption = 'Highlight matching symbols'
          TabOrder = 2
        end
      end
      object HighCurLineBox: TGroupBox
        Left = 264
        Top = 308
        Width = 201
        Height = 84
        Caption = 'Highlight current line'
        TabOrder = 3
        object cpHighColor: TColorPickerButton
          Left = 115
          Top = 51
          Width = 70
          Height = 22
          DefaultText = 'default'
          PopupSpacing = 8
          ShowSystemColors = False
          OnDefaultSelect = cpHighColorDefaultSelect
          OnHint = cpHighColorHint
        end
        object cbHighlightColor: TLabel
          Left = 115
          Top = 35
          Width = 29
          Height = 15
          Caption = 'Color'
        end
        object cbHighCurrLine: TCheckBox
          Left = 8
          Top = 20
          Width = 73
          Height = 17
          Caption = 'Enabled'
          TabOrder = 0
          OnClick = cbHighCurrLineClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 308
        Width = 248
        Height = 84
        Caption = '  Tabs  '
        TabOrder = 4
        object lblTabSize: TLabel
          Left = 176
          Top = 32
          Width = 46
          Height = 15
          Caption = 'Tab Size:'
        end
        object seTabSize: TSpinEdit
          Left = 176
          Top = 52
          Width = 57
          Height = 24
          MaxValue = 64
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object cbUseTabs: TCheckBox
          Left = 8
          Top = 20
          Width = 161
          Height = 17
          Caption = 'Use Tab Character'
          TabOrder = 1
        end
        object cbSmartTabs: TCheckBox
          Left = 8
          Top = 40
          Width = 161
          Height = 17
          Caption = 'Smart Tabs'
          TabOrder = 2
        end
      end
    end
    object tabDisplay: TTabSheet
      Caption = #26174#31034
      object ScrollHint: TLabel
        Left = 0
        Top = 352
        Width = 473
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'It is also possible to edit text size by using Control+Scroll, j' +
          'ust like in browsers!'
      end
      object grpGutter: TGroupBox
        Left = 9
        Top = 144
        Width = 456
        Height = 185
        Caption = '  Gutter  '
        TabOrder = 1
        DesignSize = (
          456
          185)
        object lblGutterFont: TLabel
          Left = 8
          Top = 91
          Width = 27
          Height = 15
          Anchors = [akLeft, akRight, akBottom]
          Caption = 'Font:'
        end
        object lblGutterWidth: TLabel
          Left = 360
          Top = 33
          Width = 89
          Height = 14
          Anchors = [akLeft, akRight, akBottom]
          AutoSize = False
          Caption = 'Gutter Width'
          WordWrap = True
        end
        object lblGutterFontSize: TLabel
          Left = 360
          Top = 91
          Width = 20
          Height = 15
          Anchors = [akLeft, akRight, akBottom]
          Caption = 'Size'
        end
        object cbLeadZero: TCheckBox
          Left = 175
          Top = 66
          Width = 162
          Height = 15
          Caption = 'Show Leading Zeros'
          TabOrder = 5
        end
        object cbFirstZero: TCheckBox
          Left = 175
          Top = 46
          Width = 162
          Height = 15
          Caption = 'Start at Zero'
          TabOrder = 4
        end
        object cbLineNum: TCheckBox
          Left = 175
          Top = 26
          Width = 162
          Height = 15
          Caption = 'Show Line Numbers'
          TabOrder = 3
          OnClick = cbLineNumClick
        end
        object cbGutterVis: TCheckBox
          Left = 8
          Top = 26
          Width = 145
          Height = 15
          Caption = 'Visible'
          TabOrder = 0
        end
        object cbGutterAuto: TCheckBox
          Left = 8
          Top = 46
          Width = 145
          Height = 15
          Caption = 'Auto Size'
          TabOrder = 1
        end
        object cbGutterFnt: TCheckBox
          Left = 8
          Top = 66
          Width = 145
          Height = 15
          Caption = 'Use Custom Font'
          TabOrder = 2
          OnClick = cbGutterFntClick
        end
        object cboGutterFont: TComboBox
          Left = 12
          Top = 107
          Width = 341
          Height = 66
          AutoComplete = False
          Style = csOwnerDrawVariable
          ItemHeight = 60
          Sorted = True
          TabOrder = 6
          OnDrawItem = cboGutterFontDrawItem
        end
        object edGutterSize: TSpinEdit
          Left = 360
          Top = 107
          Width = 80
          Height = 24
          MaxValue = 999
          MinValue = 1
          TabOrder = 7
          Value = 10
          OnChange = edGutterSizeChange
        end
        object edGutterWidth: TSpinEdit
          Left = 360
          Top = 49
          Width = 80
          Height = 24
          MaxValue = 999
          MinValue = 1
          TabOrder = 8
          Value = 32
        end
      end
      object grpEditorFont: TGroupBox
        Left = 9
        Top = 3
        Width = 456
        Height = 109
        Caption = '  Editor Font  '
        TabOrder = 0
        object lblEditorSize: TLabel
          Left = 360
          Top = 16
          Width = 23
          Height = 15
          Caption = 'Size:'
        end
        object lblEditorFont: TLabel
          Left = 8
          Top = 16
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object cboEditorFont: TComboBox
          Left = 12
          Top = 32
          Width = 341
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
          Left = 360
          Top = 32
          Width = 80
          Height = 24
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
        Left = 17
        Top = 167
        Width = 110
        Height = 22
        CustomText = 'Custom'
        DefaultText = 'Default'
        PopupSpacing = 8
        ShowSystemColors = True
        OnChange = StyleChange
        OnDefaultSelect = DefaultSelect
        OnHint = PickerHint
      end
      object cpBackground: TColorPickerButton
        Left = 17
        Top = 212
        Width = 110
        Height = 22
        CustomText = 'Custom'
        DefaultText = 'Default'
        PopupSpacing = 8
        ShowSystemColors = True
        OnChange = StyleChange
        OnDefaultSelect = DefaultSelect
        OnHint = PickerHint
      end
      object lblForeground: TLabel
        Left = 9
        Top = 152
        Width = 65
        Height = 15
        Caption = 'Foreground:'
      end
      object lblBackground: TLabel
        Left = 9
        Top = 198
        Width = 67
        Height = 15
        Caption = 'Background:'
      end
      object lblSpeed: TLabel
        Left = 9
        Top = 336
        Width = 111
        Height = 15
        Caption = #24555#36895#36873#25321#26032#33394#24425#20027#39064':'
      end
      object btnSaveSyntax: TSpeedButton
        Left = 128
        Top = 356
        Width = 21
        Height = 21
        Hint = 'Save custom syntax settings'
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
        Left = 144
        Top = 7
        Width = 329
        Height = 313
        Align = alCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        UseCodeFolding = False
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
        Left = 7
        Top = 7
        Width = 130
        Height = 139
        ImeName = 'CN'#177'??i(CN'#177'U)'
        IntegralHeight = True
        ItemHeight = 15
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
        Left = 15
        Top = 245
        Width = 110
        Height = 73
        Caption = '  Style:  '
        TabOrder = 2
        object cbBold: TCheckBox
          Left = 8
          Top = 15
          Width = 100
          Height = 17
          Caption = 'Bold'
          TabOrder = 0
          OnClick = StyleChange
        end
        object cbItalic: TCheckBox
          Left = 8
          Top = 32
          Width = 100
          Height = 17
          Caption = 'Italic'
          TabOrder = 1
          OnClick = StyleChange
        end
        object cbUnderlined: TCheckBox
          Left = 8
          Top = 50
          Width = 100
          Height = 17
          Caption = 'Underlined'
          TabOrder = 2
          OnClick = StyleChange
        end
      end
      object cboQuickColor: TComboBox
        Left = 8
        Top = 356
        Width = 117
        Height = 23
        Style = csDropDownList
        ItemHeight = 15
        TabOrder = 1
        OnSelect = cboQuickColorSelect
        Items.Strings = (
          #24576#26087#32463#20856
          #28145#36995#22812#26202
          'Notepad++'
          'Visual Studio'
          'Borland')
      end
      object edSyntaxExt: TEdit
        Left = 168
        Top = 356
        Width = 297
        Height = 23
        TabOrder = 4
      end
      object cbSyntaxHighlight: TCheckBox
        Left = 160
        Top = 330
        Width = 313
        Height = 17
        Caption = 'Use Syntax Highlighting'
        TabOrder = 5
        OnClick = cbSyntaxHighlightClick
      end
    end
    object tabCode: TTabSheet
      Caption = #20195#30721#24211
      object codepages: TPageControl
        Left = 0
        Top = 0
        Width = 476
        Height = 395
        ActivePage = tabCPInserts
        Align = alClient
        TabOrder = 0
        object tabCPInserts: TTabSheet
          Caption = 'Snippets'
          object btnAdd: TButton
            Left = 374
            Top = 21
            Width = 80
            Height = 24
            Caption = 'Add'
            TabOrder = 1
            OnClick = btnAddClick
          end
          object btnEdit: TButton
            Left = 374
            Top = 61
            Width = 80
            Height = 24
            Caption = 'Edit'
            TabOrder = 2
            OnClick = btnEditClick
          end
          object btnRemove: TButton
            Left = 374
            Top = 101
            Width = 80
            Height = 24
            Caption = 'Remove'
            TabOrder = 3
            OnClick = btnRemoveClick
          end
          object lvCodeins: TListView
            Left = 2
            Top = 8
            Width = 351
            Height = 129
            BevelOuter = bvRaised
            BevelKind = bkSoft
            BorderStyle = bsNone
            Columns = <
              item
                Caption = 'Menu text'
                Width = 125
              end
              item
                Caption = 'Section'
              end
              item
                Caption = 'Description'
                Width = 157
              end>
            ColumnClick = False
            GridLines = True
            HideSelection = False
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = lvCodeinsColumnClick
            OnCompare = lvCodeinsCompare
            OnSelectItem = lvCodeinsSelectItem
          end
          object CodeIns: TSynEdit
            Left = 0
            Top = 154
            Width = 468
            Height = 211
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 4
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
            UseCodeFolding = False
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
        object tabSymbols: TTabSheet
          Caption = 'Symbol completion'
          ImageIndex = 2
          object grpSpecific: TGroupBox
            Left = 16
            Top = 40
            Width = 273
            Height = 153
            Caption = 'Specific completion options'
            TabOrder = 0
            object cbParenth: TCheckBox
              Left = 16
              Top = 48
              Width = 240
              Height = 17
              Caption = 'Complete parentheses '#39'()'#39
              TabOrder = 0
            end
            object cbBraces: TCheckBox
              Left = 16
              Top = 24
              Width = 240
              Height = 17
              Caption = 'Complete braces '#39'{}'#39
              TabOrder = 1
            end
            object cbInclude: TCheckBox
              Left = 16
              Top = 72
              Width = 240
              Height = 17
              Caption = 'Complete includes '#39'<>'#39' ;  ""'
              TabOrder = 2
            end
            object cbComments: TCheckBox
              Left = 16
              Top = 120
              Width = 240
              Height = 17
              Caption = 'Complete multiline comments '#39'/**/'#39
              TabOrder = 3
            end
            object cbArray: TCheckBox
              Left = 16
              Top = 96
              Width = 240
              Height = 17
              Caption = 'Complete square braces '#39'[]'#39
              TabOrder = 4
            end
          end
          object cbSymbolComplete: TCheckBox
            Left = 8
            Top = 8
            Width = 241
            Height = 17
            Caption = 'Enable symbol completion'
            TabOrder = 1
            OnClick = cbSymbolCompleteClick
          end
        end
        object tabCPDefault: TTabSheet
          Caption = 'Default Source'
          object cbDefaultCode: TCheckBox
            Left = 4
            Top = 2
            Width = 461
            Height = 17
            Caption = 'Insert Default Code into Empty Projects'
            TabOrder = 0
          end
          object seDefault: TSynEdit
            Left = 0
            Top = 24
            Width = 468
            Height = 331
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
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
            UseCodeFolding = False
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
    object tabClassBrowsing: TTabSheet
      Caption = #31867#27983#35272#22120
      object chkEnableClassBrowser: TCheckBox
        Left = 8
        Top = 8
        Width = 361
        Height = 17
        Caption = 'Enable class browser'
        TabOrder = 0
        OnClick = chkEnableClassBrowserClick
      end
      object ClassCodePage: TPageControl
        Left = 0
        Top = 30
        Width = 476
        Height = 365
        ActivePage = tabCBBrowser
        TabOrder = 1
        OnChange = ClassCodePageChange
        object tabCBBrowser: TTabSheet
          Caption = 'Class browsing'
          object lblClassBrowserSample: TLabel
            Left = 32
            Top = 156
            Width = 42
            Height = 15
            Caption = 'Sample:'
          end
          object ClassBrowser: TClassBrowser
            Left = 84
            Top = 156
            Width = 333
            Height = 173
            Images = dmMain.ClassImages
            ReadOnly = True
            Indent = 19
            TabOrder = 2
            ShowFilter = sfAll
            ItemImages.Globals = -1
            ItemImages.Classes = 1
            ItemImages.VariablePrivate = 2
            ItemImages.VariableProtected = 3
            ItemImages.VariablePublic = 4
            ItemImages.VariablePublished = 4
            ItemImages.MethodPrivate = 5
            ItemImages.MethodProtected = 6
            ItemImages.MethodPublic = 7
            ItemImages.MethodPublished = 7
            ItemImages.InheritedMethodProtected = 0
            ItemImages.InheritedMethodPublic = 0
            ItemImages.InheritedVariableProtected = 0
            ItemImages.InheritedVariablePublic = 0
            UseColors = True
            ShowInheritedMembers = False
          end
          object gbCBEngine: TGroupBox
            Left = 8
            Top = 12
            Width = 457
            Height = 65
            Caption = 'Engine behaviour'
            TabOrder = 0
            object chkCBParseGlobalH: TCheckBox
              Left = 8
              Top = 40
              Width = 345
              Height = 17
              Caption = 'Scan global files referenced in #include'#39's'
              TabOrder = 1
            end
            object chkCBParseLocalH: TCheckBox
              Left = 8
              Top = 20
              Width = 345
              Height = 17
              Caption = 'Scan local files referenced in #include'#39's'
              TabOrder = 0
            end
          end
          object gbCBView: TGroupBox
            Left = 8
            Top = 84
            Width = 457
            Height = 65
            Caption = 'View options'
            TabOrder = 1
            object chkCBUseColors: TCheckBox
              Left = 8
              Top = 20
              Width = 345
              Height = 17
              Caption = 'Use colors'
              TabOrder = 0
              OnClick = chkCBUseColorsClick
            end
            object chkCBShowInherited: TCheckBox
              Left = 8
              Top = 40
              Width = 345
              Height = 17
              Caption = 'Show inherited members'
              TabOrder = 1
              OnClick = chkCBShowInheritedClick
            end
          end
        end
        object tabCBCompletion: TTabSheet
          Caption = 'Code completion'
          object lblCompletionDelay: TLabel
            Left = 8
            Top = 36
            Width = 59
            Height = 15
            Caption = 'Delay (ms):'
          end
          object cpCompletionBackground: TColorPickerButton
            Left = 341
            Top = 55
            Width = 112
            Height = 22
            CustomText = 'Custom'
            DefaultText = 'Default'
            PopupSpacing = 8
            ShowSystemColors = True
            OnChange = StyleChange
            OnDefaultSelect = DefaultSelect
            OnHint = PickerHint
          end
          object lblCompletionColor: TLabel
            Left = 328
            Top = 36
            Width = 97
            Height = 15
            Caption = 'Background color:'
          end
          object btnCCCnew: TSpeedButton
            Left = 8
            Top = 304
            Width = 101
            Height = 25
            Caption = 'Add files'
            OnClick = btnCCCnewClick
          end
          object btnCCCdelete: TSpeedButton
            Left = 112
            Top = 304
            Width = 101
            Height = 25
            Caption = 'Clear'
            OnClick = btnCCCdeleteClick
          end
          object tbCompletionDelay: TTrackBar
            Left = 16
            Top = 52
            Width = 297
            Height = 37
            Max = 10000
            Min = 1
            ParentShowHint = False
            Frequency = 500
            Position = 1000
            ShowHint = False
            TabOrder = 1
            TickMarks = tmBoth
            OnChange = tbCompletionDelayChange
          end
          object chkEnableCompletion: TCheckBox
            Left = 8
            Top = 12
            Width = 361
            Height = 17
            Caption = 'Enable code-completion'
            TabOrder = 0
            OnClick = chkEnableCompletionClick
          end
          object chkCCCache: TCheckBox
            Left = 8
            Top = 104
            Width = 433
            Height = 17
            Caption = 'Use code-completion cache'
            TabOrder = 2
            OnClick = chkCCCacheClick
          end
          object lbCCC: TListBox
            Left = 8
            Top = 124
            Width = 457
            Height = 173
            ItemHeight = 15
            ParentShowHint = False
            ShowHint = True
            Sorted = True
            TabOrder = 3
          end
          object pbCCCache: TProgressBar
            Left = 216
            Top = 304
            Width = 249
            Height = 25
            BorderWidth = 1
            TabOrder = 4
            Visible = False
          end
        end
      end
    end
    object tabAutosave: TTabSheet
      Caption = #33258#21160#20445#23384
      ImageIndex = 5
      object EnableDisableAutosave: TCheckBox
        Left = 8
        Top = 8
        Width = 385
        Height = 17
        Caption = 'Enable editor autosave'
        TabOrder = 0
        OnClick = EnableDisableAutosaveClick
      end
      object OptionsGroup: TGroupBox
        Left = 8
        Top = 32
        Width = 457
        Height = 297
        Caption = ' Options '
        TabOrder = 1
        object SaveInterval: TLabel
          Left = 16
          Top = 36
          Width = 51
          Height = 15
          Caption = #20445#23384#38388#38548':'
        end
        object MinutesDelay: TTrackBar
          Left = 144
          Top = 24
          Width = 297
          Height = 40
          Max = 60
          Min = 1
          PageSize = 1
          Position = 1
          TabOrder = 0
          TickMarks = tmBoth
          OnChange = MinutesDelayChange
        end
        object FileOptions: TRadioGroup
          Left = 18
          Top = 80
          Width = 239
          Height = 65
          Caption = 'Files'
          Items.Strings = (
            'Save the currently visible file'
            'Save all other open files too')
          TabOrder = 1
        end
      end
    end
  end
  object btnOk: TBitBtn
    Left = 210
    Top = 430
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #30830#23450'(&O)'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOkClick
    NumGlyphs = 2
  end
  object btnCancel: TBitBtn
    Left = 300
    Top = 430
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelClick
    NumGlyphs = 2
  end
  object btnHelp: TBitBtn
    Left = 390
    Top = 430
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #24110#21161'(&H)'
    Enabled = False
    TabOrder = 3
    OnClick = btnHelpClick
    NumGlyphs = 2
  end
  object cpp: TSynCppSyn
    DefaultFilter = 'C++ Files (*.c,*.cpp,*.h,*.hpp)|*.c;*.cpp;*.h;*.hpp'
    Left = 85
    Top = 422
  end
  object CppTokenizer: TCppTokenizer
    LogTokens = False
    Left = 52
    Top = 422
  end
  object CppParser: TCppParser
    Enabled = True
    OnTotalProgress = CppParser1TotalProgress
    Tokenizer = CppTokenizer
    ParseLocalHeaders = True
    ParseGlobalHeaders = True
    LogStatements = False
    OnStartParsing = CppParser1StartParsing
    OnEndParsing = CppParser1EndParsing
    Left = 19
    Top = 422
  end
end
