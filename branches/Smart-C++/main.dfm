object MainForm: TMainForm
  Left = 234
  Top = 149
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AutoScroll = False
  Caption = 'Smart-C++'
  ClientHeight = 499
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnContextPopup = FormContextPopup
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterLeft: TSplitter
    Left = 193
    Top = 70
    Height = 223
    MinSize = 45
    ResizeStyle = rsUpdate
  end
  object SplitterBottom: TSplitter
    Left = 0
    Top = 293
    Width = 748
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ResizeStyle = rsUpdate
    OnMoved = SplitterBottomMoved
  end
  object MessageControl: TPageControl
    Left = 0
    Top = 316
    Width = 748
    Height = 183
    ActivePage = CompSheet
    Align = alBottom
    MultiLine = True
    PopupMenu = MessagePopup
    TabOrder = 0
    OnChange = MessageControlChange
    object CompSheet: TTabSheet
      Caption = #38169#35823#21015#34920
      ImageIndex = -1
      object CompilerOutput: TListView
        Left = 0
        Top = 0
        Width = 740
        Height = 155
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        Columns = <
          item
            Caption = #34892
            Width = 40
          end
          item
            Caption = #21015
            Width = 40
          end
          item
            Caption = #25991#20214
            Width = 320
          end
          item
            AutoSize = True
            Caption = #20449#24687
          end>
        ColumnClick = False
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDraw = CompilerOutputAdvancedCustomDraw
        OnAdvancedCustomDrawItem = CompilerOutputAdvancedCustomDrawItem
        OnDblClick = CompilerOutputDblClick
        OnKeyDown = CompilerOutputKeyDown
      end
    end
    object ResSheet: TTabSheet
      Caption = #36164#28304#21015#34920
      ImageIndex = -1
      object ResourceOutput: TListBox
        Left = 0
        Top = 0
        Width = 740
        Height = 155
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object LogSheet: TTabSheet
      Caption = #32534#35793#36755#20986
      ImageIndex = -1
      object InfoGroupBox: TPanel
        Left = 0
        Top = 0
        Width = 233
        Height = 154
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object ErrorLabel: TLabel
          Left = 8
          Top = 12
          Width = 39
          Height = 13
          Caption = #38169#35823#25968':'
        end
        object SizeOfOutput: TLabel
          Left = 8
          Top = 60
          Width = 75
          Height = 13
          Caption = #36755#20986#25991#20214#22823#23567':'
        end
        object btnAbortCompilation: TSpeedButton
          Left = 8
          Top = 88
          Width = 218
          Height = 30
          Action = actAbortCompilation
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object WarningLabel: TLabel
          Left = 8
          Top = 36
          Width = 39
          Height = 13
          Caption = #35686#21578#25968':'
        end
        object SizeFile: TEdit
          Left = 112
          Top = 56
          Width = 112
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Text = '0'
        end
        object TotalErrors: TEdit
          Left = 112
          Top = 8
          Width = 112
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object TotalWarnings: TEdit
          Left = 112
          Top = 32
          Width = 113
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object CompResGroupBox: TPanel
        Left = 233
        Top = 0
        Width = 507
        Height = 154
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LogOutput: TMemo
          Left = 0
          Top = 0
          Width = 507
          Height = 154
          Align = alClient
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
    end
    object DebugSheet: TTabSheet
      Caption = #35843#35797#31383#21475
      ImageIndex = -1
      object DebugSendPanel: TPanel
        Left = 471
        Top = 0
        Width = 269
        Height = 155
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          269
          155)
        object lblSendCommandGdb: TLabel
          Left = 8
          Top = 7
          Width = 121
          Height = 13
          AutoSize = False
          Caption = #21457#36865#21629#20196#21040' GDB :'
        end
        object edGdbCommand: TComboBox
          Left = 140
          Top = 3
          Width = 129
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          OnKeyPress = edGdbCommandKeyPress
        end
        object DebugOutput: TMemo
          Left = 0
          Top = 32
          Width = 269
          Height = 124
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object DebugStartPanel: TPanel
        Left = 0
        Top = 0
        Width = 471
        Height = 155
        Align = alLeft
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 1
        DesignSize = (
          471
          155)
        object DDebugBtn: TSpeedButton
          Left = 4
          Top = 8
          Width = 112
          Height = 25
          Action = actDebug
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF7BB500FF7BB50000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF9CC600FF9CC600FF7BB500FF7BB50000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            0000FF9CC600FF9CC600FF9CC600FF9CC600FF7BB500FF7BB50000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006B6B6B00FFB5
            D600FFB5D600FF9CC600FFCEE700FFCEE700FFB5D600FF9CC600FF7BB5000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFCE
            E700FFB5D600FFCEE7000000000000000000FFDEEF00FFB5D600FF9CC600FF7B
            B50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFCE
            E700FFCEE70000000000FF00FF00FF00FF0000000000FFDEEF00FFB5D600FF9C
            C600FF7BB50000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000F7F7
            F70000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000FFDEEF00FFB5
            D600FF9CC600FF7BB50000000000FF00FF00FF00FF00FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFDE
            EF00FFB5D600FF9CC600FF7BB50000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            0000FFDEEF00FFB5D600FF9CC600FF7BB50000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FFDEEF00FFB5D600FF9CC600FF7BB50000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFDEEF00FFB5D600FF7BB50000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FFDEEF00FF7BB50000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000000000FFC6DE0000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00}
        end
        object StopExecBtn: TSpeedButton
          Left = 4
          Top = 38
          Width = 112
          Height = 25
          Action = actStopExecute
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000000000A50000000000FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000A50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000FF000000D6000000A50000000000FF00FF00FF00FF000000
            00000000D6000000D6000000A50000000000FF00FF00FF00FF00FF00FF000000
            00007B7BFF006B6BFF000000FF000000D6000000A50000000000000000000000
            D6000000FF000000FF000000D6000000A50000000000FF00FF00FF00FF00FF00
            FF00000000007B7BFF006B6BFF000000FF000000D6000000FF000000FF000000
            FF000000FF000000FF000000D60000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000007B7BFF006B6BFF000000FF000000FF000000FF000000
            FF000000FF000000D60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
            FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000000000FF000000FF000000FF000000FF000000
            FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000006B6BFF000000FF000000FF000000FF000000FF000000
            FF000000D6000000A50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000006B6BFF000000FF000000FF000000FF000000FF000000FF006B6B
            FF000000FF000000D6000000A50000000000FF00FF00FF00FF00FF00FF000000
            00007B7BFF006B6BFF000000FF000000FF006B6BFF0000000000000000007B7B
            FF006B6BFF000000FF000000D6000000A50000000000FF00FF00FF00FF00FF00
            FF00000000007B7BFF006B6BFF006B6BFF0000000000FF00FF00FF00FF000000
            00007B7BFF006B6BFF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000007B7BFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00000000007B7BFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object lblEvaluate: TLabel
          Left = 9
          Top = 104
          Width = 45
          Height = 13
          Caption = 'Evaluate:'
        end
        object NextLineBtn: TButton
          Left = 236
          Top = 8
          Width = 112
          Height = 25
          Action = actNextLine
          TabOrder = 0
        end
        object StepOverBtn: TButton
          Left = 236
          Top = 68
          Width = 112
          Height = 25
          Action = actStepOver
          TabOrder = 1
        end
        object IntoLineBtn: TButton
          Left = 236
          Top = 38
          Width = 112
          Height = 25
          Action = actStepLine
          TabOrder = 2
        end
        object AddWatchBtn: TButton
          Left = 120
          Top = 8
          Width = 112
          Height = 25
          Action = actAddWatch
          TabOrder = 5
        end
        object RemoveWatchBtn: TButton
          Left = 120
          Top = 68
          Width = 112
          Height = 25
          Action = actRemoveWatch
          TabOrder = 3
        end
        object ViewCPUBtn: TButton
          Left = 4
          Top = 68
          Width = 112
          Height = 25
          Action = actViewCPU
          TabOrder = 4
        end
        object ModifyWatchBtn: TButton
          Left = 120
          Top = 38
          Width = 112
          Height = 25
          Action = actModifyWatch
          TabOrder = 6
        end
        object EvaluateInput: TComboBox
          Left = 64
          Top = 100
          Width = 400
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 7
          OnKeyPress = EvaluateInputKeyPress
        end
        object EvalOutput: TMemo
          Left = 7
          Top = 127
          Width = 457
          Height = 26
          Anchors = [akLeft, akTop, akBottom]
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 8
        end
        object SkipFuncBtn: TButton
          Left = 352
          Top = 68
          Width = 112
          Height = 25
          Action = actSkipFunction
          TabOrder = 9
        end
        object IntoInsBtn: TButton
          Left = 352
          Top = 38
          Width = 112
          Height = 25
          Action = actStepIns
          TabOrder = 10
        end
        object NextInsBtn: TButton
          Left = 352
          Top = 8
          Width = 112
          Height = 25
          Action = actNextIns
          TabOrder = 11
        end
      end
    end
    object FindSheet: TTabSheet
      Caption = #25628#32034#32467#26524
      ImageIndex = -1
      object FindOutput: TListView
        Left = 0
        Top = 0
        Width = 740
        Height = 155
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        Columns = <
          item
            Caption = #34892
            Width = 40
          end
          item
            Caption = #21015
            Width = 40
          end
          item
            Caption = #25991#20214
            Width = 320
          end
          item
            AutoSize = True
            Caption = #20449#24687
          end>
        ColumnClick = False
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDraw = FindOutputAdvancedCustomDraw
        OnAdvancedCustomDrawSubItem = FindOutputAdvancedCustomDrawSubItem
        OnDblClick = FindOutputDblClick
        OnKeyDown = FindOutputKeyDown
      end
    end
    object CloseSheet: TTabSheet
      Caption = #20851#38381
      ImageIndex = -1
    end
  end
  object Toolbar: TControlBar
    Left = 0
    Top = 16
    Width = 748
    Height = 54
    Align = alTop
    AutoDock = False
    AutoSize = True
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelKind = bkNone
    RowSize = 28
    TabOrder = 1
    OnContextPopup = ToolbarContextPopup
    object tbMain: TToolBar
      Left = 11
      Top = 2
      Width = 149
      Height = 22
      AutoSize = True
      Caption = 'Main'
      Constraints.MaxWidth = 149
      Constraints.MinWidth = 149
      DragKind = dkDock
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = dmMain.MenuImages_NewLook
      Images = dmMain.MenuImages_NewLook
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      object NewFileBtn: TToolButton
        Left = 0
        Top = 0
        Caption = '&Source File'
        ImageIndex = 1
        OnClick = NewFileBtnClick
      end
      object OpenBtn: TToolButton
        Left = 23
        Top = 0
        Action = actOpen
      end
      object SaveUnitBtn: TToolButton
        Left = 46
        Top = 0
        Action = actSave
      end
      object SaveAllBtn: TToolButton
        Left = 69
        Top = 0
        Action = actSaveAll
      end
      object CloseBtn: TToolButton
        Left = 92
        Top = 0
        Action = actClose
      end
      object ToolButton7: TToolButton
        Left = 115
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object PrintBtn: TToolButton
        Left = 123
        Top = 0
        Action = actPrint
      end
    end
    object tbCompile: TToolBar
      Left = 441
      Top = 2
      Width = 170
      Height = 22
      AutoSize = True
      Caption = 'Compile and Run'
      Constraints.MaxWidth = 170
      Constraints.MinWidth = 170
      DragKind = dkDock
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = dmMain.MenuImages_NewLook
      Images = dmMain.MenuImages_NewLook
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Wrapable = False
      object CompileBtn: TToolButton
        Left = 0
        Top = 0
        Action = actCompile
      end
      object RunBtn: TToolButton
        Left = 23
        Top = 0
        Action = actRun
      end
      object CompileAndRunBtn: TToolButton
        Left = 46
        Top = 0
        Action = actCompRun
      end
      object RebuildAllBtn: TToolButton
        Left = 69
        Top = 0
        Action = actRebuild
      end
      object ToolButton2: TToolButton
        Left = 92
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 33
        Style = tbsSeparator
      end
      object DebugBtn: TToolButton
        Left = 100
        Top = 0
        Action = actDebug
      end
      object ProfileBtn: TToolButton
        Left = 123
        Top = 0
        Action = actProfileProject
      end
      object ProfilingInforBtn: TToolButton
        Left = 146
        Top = 0
        Action = actDeleteProfileProject
      end
    end
    object tbProject: TToolBar
      Left = 350
      Top = 2
      Width = 78
      Height = 22
      AutoSize = True
      Caption = 'Project'
      Constraints.MaxWidth = 78
      Constraints.MinWidth = 78
      DragKind = dkDock
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = dmMain.MenuImages_NewLook
      Images = dmMain.MenuImages_NewLook
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Wrapable = False
      object AddToProjectBtn: TToolButton
        Left = 0
        Top = 0
        Action = actProjectAdd
      end
      object RemoveFromProjectBtn: TToolButton
        Left = 23
        Top = 0
        Action = actProjectRemove
      end
      object ToolButton20: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton20'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ProjectOptionsBtn: TToolButton
        Left = 54
        Top = 0
        Action = actProjectOptions
      end
    end
    object tbEdit: TToolBar
      Left = 173
      Top = 2
      Width = 47
      Height = 22
      AutoSize = True
      Caption = 'Edit'
      Constraints.MaxWidth = 47
      Constraints.MinWidth = 47
      DragKind = dkDock
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = dmMain.MenuImages_NewLook
      Images = dmMain.MenuImages_NewLook
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Wrapable = False
      object UndoBtn: TToolButton
        Left = 0
        Top = 0
        Action = actUndo
      end
      object RedoBtn: TToolButton
        Left = 23
        Top = 0
        Action = actRedo
      end
    end
    object tbSearch: TToolBar
      Left = 233
      Top = 2
      Width = 104
      Height = 22
      AutoSize = True
      Caption = 'Search'
      Constraints.MaxWidth = 104
      Constraints.MinWidth = 104
      DragKind = dkDock
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = dmMain.MenuImages_NewLook
      Images = dmMain.MenuImages_NewLook
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Wrapable = False
      object FindBtn: TToolButton
        Left = 0
        Top = 0
        Action = actFind
      end
      object ReplaceBtn: TToolButton
        Left = 23
        Top = 0
        Action = actReplace
      end
      object ToolButton1: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 25
        Style = tbsSeparator
      end
      object FindNextBtn: TToolButton
        Left = 54
        Top = 0
        Action = actGotoFunction
      end
      object GotoLineBtn: TToolButton
        Left = 77
        Top = 0
        Action = actGotoLine
      end
    end
    object tbSpecials: TToolBar
      Left = 624
      Top = 2
      Width = 71
      Height = 22
      AutoSize = True
      Caption = 'Specials'
      Constraints.MaxWidth = 71
      Constraints.MinWidth = 71
      DragKind = dkDock
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = dmMain.MenuImages_NewLook
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Transparent = False
      Wrapable = False
      object InsertBtn: TToolButton
        Left = 0
        Top = 0
        Action = actInsert
        ImageIndex = 1
      end
      object ToggleBtn: TToolButton
        Left = 23
        Top = 0
        Action = actToggle
        ImageIndex = 2
      end
      object GotoBtn: TToolButton
        Left = 46
        Top = 0
        Action = actGoto
        ImageIndex = 3
      end
    end
    object tbClasses: TToolBar
      Left = 11
      Top = 30
      Width = 700
      Height = 22
      AutoSize = True
      Caption = 'tbClasses'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = dmMain.MenuImages_NewLook
      Images = dmMain.MenuImages_NewLook
      TabOrder = 6
      Wrapable = False
      object cmbClasses: TComboBox
        Left = 0
        Top = 0
        Width = 350
        Height = 22
        Style = csDropDownList
        Ctl3D = True
        DropDownCount = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        Sorted = True
        TabOrder = 0
        Text = '(globals)'
        OnChange = cmbClassesChange
        Items.Strings = (
          '(globals)')
      end
      object cmbMembers: TComboBox
        Left = 350
        Top = 0
        Width = 350
        Height = 22
        Style = csDropDownList
        Ctl3D = True
        DropDownCount = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        Sorted = True
        TabOrder = 1
        OnChange = cmbMembersChange
        OnDropDown = cmbMembersDropDown
      end
    end
  end
  object Statusbar: TStatusBar
    Left = 0
    Top = 296
    Width = 748
    Height = 20
    Panels = <
      item
        Width = 480
      end
      item
        Width = 80
      end
      item
        Width = 80
      end>
    ParentFont = True
    UseSystemFont = False
  end
  object PageControl: TPageControl
    Left = 196
    Top = 70
    Width = 552
    Height = 223
    Align = alClient
    HotTrack = True
    MultiLine = True
    PopupMenu = PageControlEditorPopupMenu
    TabOrder = 3
    Visible = False
    OnChange = PageControlChange
    OnDragDrop = PageControlDragDrop
    OnDragOver = PageControlDragOver
    OnMouseDown = PageControlMouseDown
    OnMouseMove = PageControlMouseMove
  end
  object pnlFull: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 16
    Align = alTop
    BevelOuter = bvNone
    Caption = 
      'Smart-C++ '#20840#23631#27169#24335#12290#25353' Alt+F12 '#36864#20986#20840#23631#27169#24335', '#25353' Alt+F10 '#26174#31034#26412#20449#24687', '#25353' Alt+F11 '#26174#31034#24037#20855 +
      #26639#12290
    TabOrder = 4
    Visible = False
    DesignSize = (
      748
      16)
    object btnFullScrRevert: TSpeedButton
      Left = 819
      Top = 0
      Width = 16
      Height = 16
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      Glyph.Data = {
        C6000000424DC60000000000000076000000280000000A0000000A0000000100
        0400000000005000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDD77
        7777D00DDDD00D777777D000DD000D777777DD000000DD777777DDD0000DDD77
        7777DDD0000DDD777777DD000000DD777777D000DD000D777777D00DDDD00D77
        7777DDDDDDDDDD777777}
      ParentFont = False
      OnClick = btnFullScrRevertClick
    end
  end
  object devFileMonitor: TdevFileMonitor
    Left = 112
    Top = 152
    Width = 0
    Height = 0
    Active = False
    OnNotifyChange = devFileMonitorNotifyChange
  end
  object LeftPageControl: TPageControl
    Left = 0
    Top = 70
    Width = 193
    Height = 223
    ActivePage = ProjectSheet
    Align = alLeft
    Images = dmMain.ProjectImage_NewLook
    TabOrder = 6
    object ProjectSheet: TTabSheet
      Caption = #24037#31243#31649#29702
      ImageIndex = -1
      object ProjectView: TTreeView
        Left = 0
        Top = 0
        Width = 185
        Height = 195
        Align = alClient
        Anchors = [akLeft, akTop, akBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ChangeDelay = 1
        DragMode = dmAutomatic
        HideSelection = False
        HotTrack = True
        Images = dmMain.ProjectImage_NewLook
        Indent = 19
        MultiSelect = True
        MultiSelectStyle = [msControlSelect, msShiftSelect]
        ReadOnly = True
        RightClickSelect = True
        SortType = stText
        TabOrder = 0
        OnClick = ProjectViewClick
        OnCompare = ProjectViewCompare
        OnContextPopup = ProjectViewContextPopup
        OnDblClick = ProjectViewDblClick
        OnDragDrop = ProjectViewDragDrop
        OnDragOver = ProjectViewDragOver
        OnKeyDown = ProjectViewKeyDown
        OnKeyPress = ProjectViewKeyPress
        OnMouseDown = ProjectViewMouseDown
      end
    end
    object ClassSheet: TTabSheet
      Caption = #31867#21015#34920
      ImageIndex = -1
      object ClassBrowser: TClassBrowser
        Left = 0
        Top = 0
        Width = 185
        Height = 195
        Align = alClient
        Images = dmMain.ClassImages
        ReadOnly = True
        Indent = 19
        TabOrder = 0
        PopupMenu = BrowserPopup
        BorderStyle = bsNone
        MultiSelectStyle = []
        ShowFilter = sfAll
        Parser = CppParser
        ItemImages.Globals = 0
        ItemImages.Classes = 1
        ItemImages.VariablePrivate = 2
        ItemImages.VariableProtected = 3
        ItemImages.VariablePublic = 4
        ItemImages.VariablePublished = 4
        ItemImages.MethodPrivate = 5
        ItemImages.MethodProtected = 6
        ItemImages.MethodPublic = 7
        ItemImages.MethodPublished = 7
        ItemImages.InheritedMethodProtected = 8
        ItemImages.InheritedMethodPublic = 10
        ItemImages.InheritedVariableProtected = 9
        ItemImages.InheritedVariablePublic = 11
        UseColors = True
        ShowInheritedMembers = False
      end
    end
    object DebugLeftSheet: TTabSheet
      Caption = #35843#35797
      ImageIndex = -1
      object DebugTree: TTreeView
        Left = 0
        Top = 0
        Width = 185
        Height = 195
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ChangeDelay = 1
        Indent = 19
        MultiSelectStyle = []
        PopupMenu = DebugVarsPopup
        ReadOnly = True
        RightClickSelect = True
        TabOrder = 0
        OnAdvancedCustomDrawItem = DebugTreeAdvancedCustomDrawItem
        OnKeyDown = DebugTreeKeyDown
      end
    end
  end
  object MainMenu: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 689
    Top = 214
    object FileMenu: TMenuItem
      Action = actFileMenu
      object mnuNew: TMenuItem
        Caption = #26032#24314'(&N)'
        object NewSourceFileItem: TMenuItem
          Tag = 2
          Action = actNewSource
          Caption = #28304#20195#30721'(&S)'
        end
        object NewprojectItem: TMenuItem
          Action = actNewProject
          Caption = #24037#31243'(&P)...'
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object NewTemplateItem: TMenuItem
          Action = actNewTemplate
          Caption = #24037#31243#27169#26495'(&T)...'
        end
        object N76: TMenuItem
          Caption = '-'
        end
        object NewresourcefileItem: TMenuItem
          Action = actNewRes
          Caption = #36164#28304#25991#20214'(&R)'
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object Class1: TMenuItem
          Action = actBrowserNewClass
          Caption = #31867'(&L)...'
        end
      end
      object N34: TMenuItem
        Caption = '-'
      end
      object OpenprojectItem: TMenuItem
        Tag = 1
        Action = actOpen
      end
      object ReOpenItem: TMenuItem
        AutoHotkeys = maManual
        Caption = #26368#36817#20351#29992#30340#25991#20214'(&R)'
        object ClearhistoryItem: TMenuItem
          Action = actHistoryClear
          Caption = #28165#31354#21382#21490#35760#24405'(&C)'
        end
        object N11: TMenuItem
          Caption = '-'
          Enabled = False
        end
      end
      object N12: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object SaveUnitItem: TMenuItem
        Tag = 3
        Action = actSave
      end
      object SaveUnitAsItem: TMenuItem
        Action = actSaveAs
      end
      object SaveprojectasItem: TMenuItem
        Action = actSaveProjectAs
      end
      object SaveallItem: TMenuItem
        Action = actSaveAll
      end
      object N33: TMenuItem
        Caption = '-'
      end
      object CloseItem: TMenuItem
        Tag = 4
        Action = actClose
      end
      object CloseAll2: TMenuItem
        Action = actCloseAll
      end
      object CloseprojectItem: TMenuItem
        Action = actCloseProject
      end
      object N35: TMenuItem
        Caption = '-'
      end
      object Properties1: TMenuItem
        Action = actFileProperties
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ImportItem: TMenuItem
        Caption = #23548#20837'(&I)'
        object ImportMSVisualCproject: TMenuItem
          Action = actImportMSVC
          Caption = 'Microsoft Visual C++ '#24037#31243
        end
        object ImportCBCproject: TMenuItem
          Caption = 'Code::Blocks '#24037#31243
          Enabled = False
          Visible = False
          OnClick = ImportCBCprojectClick
        end
      end
      object ExportItem: TMenuItem
        Caption = #23548#20986'(&E)'
        object HTMLItem: TMenuItem
          Action = actXHTML
          Caption = #23548#20986#24403#21069#28304#20195#30721#20026' HTML '#25991#20214
        end
        object RTFItem: TMenuItem
          Action = actXRTF
          Caption = #23548#20986#24403#21069#28304#20195#30721#20026' RTF '#25991#20214
        end
        object TEXItem: TMenuItem
          Action = actXTex
          AutoLineReduction = maManual
        end
        object N19: TMenuItem
          Caption = '-'
        end
        object ProjecttoHTMLItem: TMenuItem
          Action = actXProject
        end
      end
      object N43: TMenuItem
        Caption = '-'
      end
      object PrintItem: TMenuItem
        Tag = 5
        Action = actPrint
        Caption = #25171#21360'(&P)'
      end
      object PrinterSetupItem: TMenuItem
        Action = actPrintSU
        Caption = #25171#21360#26426#35774#32622'(&U)...'
      end
      object N3: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object ExitItem: TMenuItem
        Action = actExit
        Caption = #36864#20986' Smart-C++(&X)'
        GroupIndex = 9
      end
    end
    object EditMenu: TMenuItem
      Action = actEditMenu
      object UndoItem: TMenuItem
        Tag = 6
        Action = actUndo
      end
      object RedoItem: TMenuItem
        Action = actRedo
      end
      object N4: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object CutItem: TMenuItem
        Action = actCut
        AutoHotkeys = maAutomatic
        AutoLineReduction = maAutomatic
      end
      object CopyItem: TMenuItem
        Action = actCopy
      end
      object PasteItem: TMenuItem
        Action = actPaste
      end
      object SelectallItem: TMenuItem
        Action = actSelectAll
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object SearchMenu: TMenuItem
        Action = actSearchMenu
        object FindItem: TMenuItem
          Tag = 7
          Action = actFind
        end
        object ReplaceItem: TMenuItem
          Action = actReplace
        end
        object FindinallfilesItem: TMenuItem
          Action = actFindAll
        end
        object ReplaceAll1: TMenuItem
          Action = actReplaceAll
        end
        object N72: TMenuItem
          Caption = '-'
        end
        object IncrementalSearch1: TMenuItem
          Action = actIncremental
        end
        object N7: TMenuItem
          Caption = '-'
          Enabled = False
        end
        object Gotofunction1: TMenuItem
          Action = actGotoFunction
        end
        object GotolineItem: TMenuItem
          Action = actGotoLine
        end
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object Swapheadersource2: TMenuItem
        Action = actSwapHeaderSource
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object InsertItem: TMenuItem
        Caption = #25554#20837'(&I)'
        ImageIndex = 18
        object DateTimeMenuItem: TMenuItem
          Caption = #26085#26399'/'#26102#38388'(&D)'
          OnClick = DateTimeMenuItemClick
        end
        object CommentheaderMenuItem: TMenuItem
          Caption = #25991#20214#22836#27880#37322#27169#26495'(&O)'
          OnClick = CommentheaderMenuItemClick
        end
        object N999: TMenuItem
          Caption = '-'
        end
      end
      object ToggleBookmarksItem: TMenuItem
        Caption = #28155#21152#20070#31614'(&B)'
        ImageIndex = 19
      end
      object GotoBookmarksItem: TMenuItem
        Caption = #36716#21040#20070#31614'(&K)'
        ImageIndex = 20
      end
      object N26: TMenuItem
        Caption = '-'
      end
      object Comment1: TMenuItem
        Action = actComment
      end
      object Uncomment1: TMenuItem
        Action = actUncomment
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object Indent1: TMenuItem
        Action = actIndent
      end
      object Unindent1: TMenuItem
        Action = actUnindent
      end
      object N64: TMenuItem
        Caption = '-'
      end
      object CollapseAll: TMenuItem
        Action = actCollapse
      end
      object UncollapseAll: TMenuItem
        Action = actUnCollapse
      end
    end
    object ViewMenu: TMenuItem
      Action = actViewMenu
      object FullscreenmodeItem: TMenuItem
        Action = actFullScreen
        AutoCheck = True
      end
      object N75: TMenuItem
        Caption = '-'
      end
      object ProjectManagerItem: TMenuItem
        Action = actProjectManager
        AutoCheck = True
      end
      object StatusbarItem: TMenuItem
        Action = actStatusbar
        AutoCheck = True
      end
      object CompileroutputItem: TMenuItem
        Caption = #32534#35793#22120#36755#20986#20449#24687'(&C)'
        object AlwaysShowItem: TMenuItem
          Action = actCompOutput
          AutoCheck = True
          GroupIndex = 1
        end
        object N37: TMenuItem
          Caption = '-'
          GroupIndex = 1
        end
        object ShowonlywhenneededItem: TMenuItem
          Action = actCompOnNeed
          AutoCheck = True
          GroupIndex = 1
        end
      end
      object ToolbarsItem: TMenuItem
        Caption = #24037#20855#26639'(&T)'
        ImageIndex = 44
        object ToolMainItem: TMenuItem
          AutoCheck = True
          Caption = #22522#26412'(&N)'
          Checked = True
          OnClick = ToolbarClick
        end
        object ToolEditItem: TMenuItem
          AutoCheck = True
          Caption = #32534#36753'(&E)'
          Checked = True
          OnClick = ToolbarClick
        end
        object ToolSearchItem: TMenuItem
          AutoCheck = True
          Caption = #25628#32034'(&S)'
          Checked = True
          OnClick = ToolbarClick
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object ToolCompileandRunItem: TMenuItem
          AutoCheck = True
          Caption = #32534#35793#21644#36816#34892'(&C)'
          Checked = True
          OnClick = ToolbarClick
        end
        object ToolProjectItem: TMenuItem
          AutoCheck = True
          Caption = #24037#31243'(&O)'
          Checked = True
          OnClick = ToolbarClick
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object ToolSpecialsItem: TMenuItem
          AutoCheck = True
          Caption = '&Specials'
          Checked = True
          OnClick = ToolbarClick
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object ToolClassesItem: TMenuItem
          AutoCheck = True
          Caption = #31867'(&L)'
          Checked = True
          OnClick = ToolbarClick
        end
      end
      object oDolist1: TMenuItem
        Action = actViewToDoList
      end
      object N63: TMenuItem
        Caption = '-'
      end
      object FloatingPojectManagerItem: TMenuItem
        Caption = #28014#21160#24037#31243#31649#29702#22120'(&F)'
        OnClick = FloatingPojectManagerItemClick
      end
      object FloatingReportwindowItem: TMenuItem
        Caption = #28014#21160#25253#21578#31383#21475'(&R)'
        OnClick = FloatingReportwindowItemClick
      end
      object N57: TMenuItem
        Caption = '-'
      end
      object GotoprojectmanagerItem: TMenuItem
        Caption = #36716#21040#24037#31243#31649#29702#22120'(&M)'
        ShortCut = 16497
        OnClick = actGotoProjectManagerExecute
      end
      object GoToClassBrowserItem: TMenuItem
        Caption = #36716#21040#31867#27983#35272#22120'(&B)'
        ShortCut = 16498
        OnClick = GoToClassBrowserItemClick
      end
    end
    object ProjectMenu: TMenuItem
      Action = actProjectMenu
      object NewunitinprojectItem: TMenuItem
        Tag = 2
        Action = actProjectNew
      end
      object AddtoprojectItem: TMenuItem
        Action = actProjectAdd
      end
      object RemovefromprojectItem: TMenuItem
        Action = actProjectRemove
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object ProjectoptionsItem: TMenuItem
        Action = actProjectOptions
      end
    end
    object ExecuteMenu: TMenuItem
      Action = actExecuteMenu
      object CompileItem: TMenuItem
        Tag = 8
        Action = actCompile
      end
      object Compilecurrentfile1: TMenuItem
        Action = actCompileCurrentFile
      end
      object RunItem: TMenuItem
        Tag = 9
        Action = actRun
      end
      object mnuExecParameters: TMenuItem
        Action = actExecParams
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object CompileandRunItem: TMenuItem
        Action = actCompRun
      end
      object RebuildallItem: TMenuItem
        Action = actRebuild
      end
      object SyntaxCheckItem: TMenuItem
        Action = actSyntaxCheck
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object CleanItem: TMenuItem
        Action = actClean
      end
      object N29: TMenuItem
        Caption = '-'
      end
      object Profileanalysis1: TMenuItem
        Action = actProfileProject
      end
      object DeleteProfilingInformation: TMenuItem
        Action = actDeleteProfileProject
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object Programreset1: TMenuItem
        Action = actProgramReset
      end
    end
    object DebugMenu: TMenuItem
      Action = actDebugMenu
      object DebugItem: TMenuItem
        Tag = 10
        Action = actDebug
      end
      object AttachtoprocessItem: TMenuItem
        Action = actAttachProcess
      end
      object StopExecution1: TMenuItem
        Action = actStopExecute
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object DbgNextItem: TMenuItem
        Action = actNextLine
      end
      object DbgSingleStep: TMenuItem
        Action = actStepLine
      end
      object N68: TMenuItem
        Caption = '-'
      end
      object actNextIns1: TMenuItem
        Action = actNextIns
      end
      object Intoinstruction1: TMenuItem
        Action = actStepIns
      end
      object N70: TMenuItem
        Caption = '-'
      end
      object StepoverItem: TMenuItem
        Action = actStepOver
      end
      object Skipfunction1: TMenuItem
        Action = actSkipFunction
      end
      object N69: TMenuItem
        Caption = '-'
      end
      object Abortcompilation1: TMenuItem
        Action = actAddWatch
      end
      object Modifywatch1: TMenuItem
        Action = actModifyWatch
      end
      object Removewatch1: TMenuItem
        Action = actRemoveWatch
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object ViewCPUItem: TMenuItem
        Action = actViewCPU
      end
    end
    object ToolsMenu: TMenuItem
      Action = actToolsMenu
      object CompileroptionsItem: TMenuItem
        Tag = 11
        Action = actCompOptions
      end
      object EnvironmentoptionsItem: TMenuItem
        Tag = 12
        Action = actEnviroOptions
      end
      object EditorOptions1: TMenuItem
        Action = actEditorOptions
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object ConfiguredevShortcuts1: TMenuItem
        Action = actConfigdevShortcuts
      end
      object ConfiguretoolsItem: TMenuItem
        Action = actConfigTools
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object CheckforupdatesItem: TMenuItem
        Action = actUpdateCheck
      end
      object mnuToolSep1: TMenuItem
        Caption = '-'
      end
      object PackageManagerItem: TMenuItem
        Caption = #38468#21152#21253#31649#29702#22120'(&P)'
        OnClick = PackageManagerItemClick
      end
    end
    object mnuCVS: TMenuItem
      Caption = '&CVS'
      OnClick = mnuCVSClick
      object mnuCVSCurrent: TMenuItem
        Caption = #24403#21069#25991#20214'(&U)'
        object mnuCVSUpdate: TMenuItem
          Tag = 3
          Action = actCVSUpdate
        end
        object mnuCVSDiff: TMenuItem
          Tag = 3
          Action = actCVSDiff
        end
        object N53: TMenuItem
          Caption = '-'
        end
        object mnuCVSCommit: TMenuItem
          Tag = 3
          Action = actCVSCommit
        end
        object N56: TMenuItem
          Caption = '-'
        end
        object mnuCVSLog: TMenuItem
          Tag = 3
          Action = actCVSLog
        end
        object N61: TMenuItem
          Caption = '-'
        end
        object mnuCVSAdd: TMenuItem
          Tag = 3
          Action = actCVSAdd
        end
        object mnuCVSRemove: TMenuItem
          Tag = 3
          Action = actCVSRemove
        end
      end
      object mnuCVSWhole: TMenuItem
        Caption = #25972#20010#24037#31243'(&J)'
        object mnuCVSUpdateP: TMenuItem
          Tag = 4
          Action = actCVSUpdate
        end
        object mnuCVSDiffP: TMenuItem
          Tag = 4
          Action = actCVSDiff
        end
        object N58: TMenuItem
          Caption = '-'
        end
        object Commit1: TMenuItem
          Tag = 4
          Action = actCVSCommit
        end
        object N46: TMenuItem
          Caption = '-'
        end
        object mnuCVSLogP: TMenuItem
          Tag = 4
          Action = actCVSLog
        end
      end
      object N65: TMenuItem
        Caption = '-'
      end
      object Login1: TMenuItem
        Action = actCVSLogin
        Caption = #30331#24405'(&L)'
      end
      object Logout1: TMenuItem
        Action = actCVSLogout
        Caption = #36864#20986'(&O)'
      end
      object N66: TMenuItem
        Caption = '-'
      end
      object mnuCVSImportP: TMenuItem
        Tag = 4
        Action = actCVSImport
        Caption = #23548#20837'(&I)...'
      end
      object mnuCVSCheckoutP: TMenuItem
        Tag = 4
        Action = actCVSCheckout
        Caption = #26816#20986'(&C)...'
      end
    end
    object WindowMenu: TMenuItem
      Action = actWindowMenu
      object CloseAllItem: TMenuItem
        Action = actCloseAll
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object NextItem: TMenuItem
        Action = actNext
      end
      object PreviousItem: TMenuItem
        Action = actPrev
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object ListItem: TMenuItem
        Caption = #31383#21475#21015#34920'(&L)...'
        OnClick = ListItemClick
      end
    end
    object HelpMenu: TMenuItem
      Action = actHelpMenu
      GroupIndex = 9
      object HelpMenuItem: TMenuItem
        Caption = #24110#21161#25991#26723'(&D)...'
        OnClick = HelpMenuItemClick
      end
      object ShowTipsItem: TMenuItem
        Action = actShowTips
        Caption = #27599#26085#25552#31034'(&I)...'
      end
      object AboutDevCppItem: TMenuItem
        Tag = 18
        Action = actAbout
        Caption = #20851#20110'(&A)...'
      end
    end
  end
  object EditorPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 689
    Top = 343
    object GotoDeclEditor: TMenuItem
      Action = actGotoDeclEditor
    end
    object GotoDefineEditor: TMenuItem
      Action = actGotoImplEditor
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object Close1: TMenuItem
      Action = actClose
    end
    object CloseAll1: TMenuItem
      Action = actCloseAll
    end
    object Closeallexceptthis1: TMenuItem
      Action = actCloseAllButThis
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object UndoPopItem: TMenuItem
      Action = actUndo
    end
    object RedoPopItem: TMenuItem
      Action = actRedo
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object CutPopItem: TMenuItem
      Action = actCut
    end
    object CopyPopItem: TMenuItem
      Action = actCopy
    end
    object PastePopItem: TMenuItem
      Action = actPaste
    end
    object SelectAllPopItem: TMenuItem
      Action = actSelectAll
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object Swapheadersource1: TMenuItem
      Action = actSwapHeaderSource
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object InsertPopItem: TMenuItem
      Caption = #25554#20837'(&I)'
      ImageIndex = 30
      object DateandtimePopItem: TMenuItem
        Caption = #26085#26399'/'#26102#38388'(&D)'
      end
      object CommentheaderPopItem: TMenuItem
        Caption = #25991#20214#22836#27880#37322#27169#26495'(&O)'
      end
      object MenuItem3: TMenuItem
        Caption = '-'
      end
    end
    object TogglebookmarksPopItem: TMenuItem
      Caption = #28155#21152#20070#31614'(&B)'
      ImageIndex = 31
    end
    object GotobookmarksPopItem: TMenuItem
      Caption = #36716#21040#20070#31614'(&G)'
      ImageIndex = 32
    end
    object N41: TMenuItem
      Caption = '-'
    end
    object ToggleBreakpointPopupItem: TMenuItem
      Action = actBreakPoint
    end
    object AddWatchPopupItem: TMenuItem
      Action = actAddWatch
    end
    object N38: TMenuItem
      Caption = '-'
    end
    object AddToDoitem1: TMenuItem
      Action = actAddToDo
    end
    object N45: TMenuItem
      Caption = '-'
    end
    object CVS1: TMenuItem
      Caption = 'C&VS'
      object mnuCVSUpdate3: TMenuItem
        Tag = 3
        Action = actCVSUpdate
      end
      object mnuCVSDiff3: TMenuItem
        Tag = 3
        Action = actCVSDiff
      end
      object N60: TMenuItem
        Caption = '-'
      end
      object mnuCVSCommit3: TMenuItem
        Tag = 3
        Action = actCVSCommit
      end
      object N47: TMenuItem
        Caption = '-'
      end
      object mnuCVSLog3: TMenuItem
        Tag = 3
        Action = actCVSLog
      end
    end
    object N50: TMenuItem
      Caption = '-'
    end
    object mnuFileProps: TMenuItem
      Action = actFileProperties
    end
  end
  object UnitPopup: TPopupMenu
    MenuAnimation = [maBottomToTop]
    Left = 23
    Top = 146
    object RemoveFilefromprojectPopItem: TMenuItem
      Action = actUnitRemove
    end
    object RenamefilePopItem: TMenuItem
      Action = actUnitRename
    end
    object N30: TMenuItem
      Caption = '-'
    end
    object OpenPopItem: TMenuItem
      Action = actUnitOpen
    end
    object mnuOpenWith: TMenuItem
      Caption = #25171#24320#26041#24335'(&W)'
      OnClick = mnuOpenWithClick
    end
    object ClosefilePopItem: TMenuItem
      Action = actUnitClose
    end
    object N40: TMenuItem
      Caption = '-'
    end
    object Addfile1: TMenuItem
      Action = actProjectAdd
    end
    object N44: TMenuItem
      Caption = '-'
    end
    object Addfolder1: TMenuItem
      Action = actProjectNewFolder
    end
    object Renamefolder1: TMenuItem
      Action = actProjectRenameFolder
    end
    object Removefolder1: TMenuItem
      Action = actProjectRemoveFolder
    end
    object N49: TMenuItem
      Caption = '-'
    end
    object CVS3: TMenuItem
      Caption = 'C&VS'
      object mnuCVSUpdate2: TMenuItem
        Tag = 2
        Action = actCVSUpdate
      end
      object mnuCVSDiff2: TMenuItem
        Tag = 2
        Action = actCVSDiff
      end
      object N52: TMenuItem
        Caption = '-'
      end
      object mnuCVSCommit2: TMenuItem
        Tag = 2
        Action = actCVSCommit
      end
      object N51: TMenuItem
        Caption = '-'
      end
      object mnuCVSLog2: TMenuItem
        Tag = 2
        Action = actCVSLog
      end
      object N62: TMenuItem
        Caption = '-'
      end
      object mnuCVSAdd2: TMenuItem
        Tag = 2
        Action = actCVSAdd
      end
      object mnuCVSRemove2: TMenuItem
        Tag = 2
        Action = actCVSRemove
      end
    end
    object N54: TMenuItem
      Caption = '-'
    end
    object mnuUnitProperties: TMenuItem
      Action = actFileProperties
    end
  end
  object ProjectPopup: TPopupMenu
    AutoHotkeys = maManual
    MenuAnimation = [maBottomToTop]
    Left = 23
    Top = 189
    object NewunitinprojectPopItem: TMenuItem
      Tag = 2
      Action = actProjectNew
    end
    object AddtoprojectPopItem: TMenuItem
      Action = actProjectAdd
    end
    object RemovefromprojectPopItem: TMenuItem
      Action = actProjectRemove
    end
    object N39: TMenuItem
      Caption = '-'
    end
    object Newfolder1: TMenuItem
      Action = actProjectNewFolder
    end
    object MenuItem18: TMenuItem
      Caption = '-'
    end
    object ProjectoptionsPopItem: TMenuItem
      Action = actProjectOptions
    end
    object N48: TMenuItem
      Caption = '-'
    end
    object CVS2: TMenuItem
      Caption = 'C&VS'
      object mnuCVSUpdate1: TMenuItem
        Tag = 1
        Action = actCVSUpdate
      end
      object mnuCVSDiff1: TMenuItem
        Tag = 1
        Action = actCVSDiff
      end
      object N59: TMenuItem
        Caption = '-'
      end
      object mnuCVSCommit1: TMenuItem
        Tag = 1
        Action = actCVSCommit
      end
      object N55: TMenuItem
        Caption = '-'
      end
      object mnuCVSLog1: TMenuItem
        Tag = 1
        Action = actCVSLog
      end
    end
  end
  object ActionList: TActionList
    Left = 689
    Top = 85
    object actViewCPU: TAction
      Category = 'Debug'
      Caption = #26597#30475'CPU'#31383#21475'(&V)'
      OnExecute = ViewCPUItemClick
      OnUpdate = actUpdateDebuggerRunningCPU
    end
    object actNewSource: TAction
      Tag = 1
      Category = 'File'
      Caption = '&Source File'
      ImageIndex = 1
      ShortCut = 16462
      OnExecute = actNewSourceExecute
    end
    object actNewProject: TAction
      Tag = 2
      Category = 'File'
      Caption = '&Project...'
      ImageIndex = 0
      OnExecute = actNewProjectExecute
    end
    object actNewRes: TAction
      Tag = 3
      Category = 'File'
      Caption = '&Resource File'
      ImageIndex = 2
      OnExecute = actNewResExecute
    end
    object actNewTemplate: TAction
      Tag = 4
      Category = 'File'
      Caption = '&Template...'
      ImageIndex = 3
      OnExecute = actNewTemplateExecute
      OnUpdate = actNewTemplateUpdate
    end
    object actOpen: TAction
      Tag = 1
      Category = 'File'
      Caption = #25171#24320#24037#31243#25110#25991#20214'(&O)...'
      ImageIndex = 4
      ShortCut = 16463
      OnExecute = actOpenExecute
    end
    object actHistoryClear: TAction
      Tag = 2
      Category = 'File'
      Caption = '&Clear History'
      ImageIndex = 5
      OnExecute = actHistoryClearExecute
    end
    object actSave: TAction
      Tag = 3
      Category = 'File'
      Caption = #20445#23384'(&S)'
      ImageIndex = 6
      ShortCut = 16467
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actSaveAs: TAction
      Tag = 4
      Category = 'File'
      Caption = #21478#23384#20026'(&A)...'
      ImageIndex = 7
      ShortCut = 49235
      OnExecute = actSaveAsExecute
      OnUpdate = actSaveAsUpdate
    end
    object actSaveProjectAs: TAction
      Category = 'File'
      Caption = #21478#23384#24037#31243#20026'(&O)...'
      ImageIndex = 7
      OnExecute = actSaveProjectAsExecute
      OnUpdate = actUpdateProject
    end
    object actSaveAll: TAction
      Tag = 5
      Category = 'File'
      Caption = #20840#37096#20445#23384'(&L)'
      ImageIndex = 8
      OnExecute = actSaveAllExecute
      OnUpdate = actUpdatePageorProject
    end
    object actClose: TAction
      Tag = 7
      Category = 'File'
      Caption = #20851#38381#24403#21069#25991#20214'(&C)'
      ImageIndex = 9
      ShortCut = 16471
      OnExecute = actCloseExecute
      OnUpdate = actUpdatePageCount
    end
    object actCloseAll: TAction
      Tag = 11
      Category = 'File'
      Caption = #20840#37096#20851#38381'(&Z)'
      OnExecute = actCloseAllExecute
      OnUpdate = actUpdatePageCount
    end
    object actCloseProject: TAction
      Tag = 6
      Category = 'File'
      Caption = #20851#38381#24037#31243'(&J)'
      OnExecute = actCloseProjectExecute
      OnUpdate = actUpdateProject
    end
    object actXHTML: TAction
      Tag = 1
      Category = 'File'
      Caption = 'to &HTML'
      OnExecute = actXHTMLExecute
      OnUpdate = actUpdatePageCount
    end
    object actXRTF: TAction
      Tag = 2
      Category = 'File'
      Caption = 'to &RTF'
      OnExecute = actXRTFExecute
      OnUpdate = actUpdatePageCount
    end
    object actXTex: TAction
      Tag = 3
      Category = 'File'
      Caption = #23548#20986#24403#21069#28304#20195#30721#20026' TEX '#25991#20214
      OnExecute = actXTexExecute
      OnUpdate = actUpdatePageCount
    end
    object actXProject: TAction
      Tag = 3
      Category = 'File'
      Caption = #23548#20986#24403#21069#24037#31243#20026' HTML '#25991#20214
      OnExecute = actXProjectExecute
      OnUpdate = actUpdateProject
    end
    object actPrint: TAction
      Tag = 8
      Category = 'File'
      Caption = '&Print'
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = actPrintExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actPrintSU: TAction
      Tag = 9
      Category = 'File'
      Caption = 'Prin&ter Setup...'
      OnExecute = actPrintSUExecute
    end
    object actExit: TAction
      Tag = 10
      Category = 'File'
      Caption = 'E&xit Dev-C++'
      ImageIndex = 11
      ShortCut = 32883
      OnExecute = actExitExecute
    end
    object actUndo: TAction
      Tag = 1
      Category = 'Edit'
      Caption = #25764#38144'(&U)'
      ImageIndex = 13
      ShortCut = 16474
      OnExecute = actUndoExecute
      OnUpdate = actUndoUpdate
    end
    object actRedo: TAction
      Tag = 2
      Category = 'Edit'
      Caption = #24674#22797'(&R)'
      ImageIndex = 14
      ShortCut = 16473
      OnExecute = actRedoExecute
      OnUpdate = actRedoUpdate
    end
    object actCut: TAction
      Tag = 3
      Category = 'Edit'
      Caption = #21098#20999'(&T)'
      ImageIndex = 15
      ShortCut = 16472
      OnExecute = actCutExecute
      OnUpdate = actCutUpdate
    end
    object actCopy: TAction
      Tag = 4
      Category = 'Edit'
      Caption = #22797#21046'(&C)'
      ImageIndex = 16
      ShortCut = 16451
      OnExecute = actCopyExecute
      OnUpdate = actCopyUpdate
    end
    object actPaste: TAction
      Tag = 5
      Category = 'Edit'
      Caption = #31896#36148'(&P)'
      ImageIndex = 17
      ShortCut = 16470
      OnExecute = actPasteExecute
      OnUpdate = actPasteUpdate
    end
    object actSelectAll: TAction
      Tag = 6
      Category = 'Edit'
      Caption = #20840#36873'(&S)'
      ShortCut = 16449
      OnExecute = actSelectAllExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actFind: TAction
      Tag = 1
      Category = 'Search'
      Caption = #24555#36895#26597#25214'(&F)'
      ImageIndex = 21
      ShortCut = 16454
      OnExecute = actFindExecute
      OnUpdate = actUpdateEmptyEditorFindForm
    end
    object actFindAll: TAction
      Tag = 2
      Category = 'Search'
      Caption = #22312#25991#20214#20013#26597#25214'(&L)'
      ShortCut = 24646
      OnExecute = actFindAllExecute
      OnUpdate = actUpdateEmptyEditorFindForm
    end
    object actReplace: TAction
      Tag = 3
      Category = 'Search'
      Caption = #24555#36895#26367#25442'(&E)'
      ImageIndex = 22
      ShortCut = 16466
      OnExecute = actReplaceExecute
      OnUpdate = actUpdateEmptyEditorFindForm
    end
    object actReplaceAll: TAction
      Category = 'Search'
      Caption = #22312#25991#20214#20013#26367#25442'(&Z)'
      ShortCut = 24658
      OnExecute = actReplaceAllExecute
      OnUpdate = actUpdateEmptyEditorFindForm
    end
    object actIncremental: TAction
      Category = 'Search'
      Caption = #28176#36827#24335#25628#32034'(&H)'
      ShortCut = 16457
      OnExecute = actIncrementalExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actGotoLine: TAction
      Tag = 5
      Category = 'Search'
      Caption = #36716#21040#34892'(&G)...'
      ImageIndex = 24
      ShortCut = 16455
      OnExecute = actGotoLineExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actProjectManager: TAction
      Category = 'View'
      AutoCheck = True
      Caption = #24037#31243#31649#29702'(&P)'
      OnExecute = actProjectManagerExecute
    end
    object actStatusbar: TAction
      Category = 'View'
      AutoCheck = True
      Caption = #29366#24577#26639'(&S)'
      OnExecute = actStatusbarExecute
    end
    object actCompOutput: TAction
      Category = 'View'
      AutoCheck = True
      Caption = #24635#26159#26174#31034#32534#35793#22120#36755#20986#20449#24687'(&A)'
      GroupIndex = 2
      OnExecute = actCompOutputExecute
    end
    object actCompOnNeed: TAction
      Category = 'View'
      AutoCheck = True
      Caption = #20165#22312#38656#35201#26102#26174#31034'(&H)'
      GroupIndex = 2
      OnExecute = actCompOnNeedExecute
    end
    object actProjectNew: TAction
      Tag = 1
      Category = 'Project'
      Caption = #26032#24314#39033#30446'(&N)'
      ImageIndex = 1
      OnExecute = actProjectNewExecute
      OnUpdate = actUpdateProject
    end
    object actProjectAdd: TAction
      Tag = 2
      Category = 'Project'
      Caption = #28155#21152#25991#20214'(&A)...'
      ImageIndex = 25
      OnExecute = actProjectAddExecute
      OnUpdate = actUpdateProject
    end
    object actProjectRemove: TAction
      Tag = 3
      Category = 'Project'
      Caption = #31227#38500#25991#20214'(&R)'
      ImageIndex = 26
      OnExecute = actProjectRemoveExecute
      OnUpdate = actUpdateProject
    end
    object actProjectOptions: TAction
      Tag = 5
      Category = 'Project'
      Caption = #24037#31243#36873#39033'(&O)...'
      ImageIndex = 27
      ShortCut = 32848
      OnExecute = actProjectOptionsExecute
      OnUpdate = actUpdateProject
    end
    object actProjectMakeFile: TAction
      Category = 'Project'
      Caption = 'Edit &Makefile'
      OnExecute = actProjectMakeFileExecute
      OnUpdate = actUpdateProject
    end
    object actProjectSource: TAction
      Tag = 6
      Category = 'Project'
      Caption = 'Source'
      OnExecute = actProjectSourceExecute
      OnUpdate = actUpdateProject
    end
    object actCompile: TAction
      Tag = 1
      Category = 'Execute'
      Caption = #32534#35793'(&C)'
      ImageIndex = 28
      ShortCut = 120
      OnExecute = actCompileExecute
      OnUpdate = actCompileUpdate
    end
    object actRun: TAction
      Tag = 2
      Category = 'Execute'
      Caption = #36816#34892'(&R)'
      ImageIndex = 31
      ShortCut = 121
      OnExecute = actRunExecute
      OnUpdate = actRunUpdate
    end
    object actCompRun: TAction
      Tag = 3
      Category = 'Execute'
      Caption = #32534#35793#24182#36816#34892'(&A)'
      ImageIndex = 33
      ShortCut = 122
      OnExecute = actCompRunExecute
      OnUpdate = actRunUpdate
    end
    object actRebuild: TAction
      Tag = 4
      Category = 'Execute'
      Caption = #20840#37096#37325#24314'(&E)'
      ImageIndex = 30
      OnExecute = actRebuildExecute
      OnUpdate = actCompileUpdate
    end
    object actClean: TAction
      Tag = 5
      Category = 'Execute'
      Caption = #28165#38500'(&L)'
      OnExecute = actCleanExecute
      OnUpdate = actCompileUpdate
    end
    object actDebug: TAction
      Tag = 6
      Category = 'Debug'
      Caption = #24320#22987#35843#35797'(&E)'
      ImageIndex = 32
      ShortCut = 116
      OnExecute = actDebugExecute
      OnUpdate = actCompileUpdate
    end
    object actCompOptions: TAction
      Tag = 1
      Category = 'Tools'
      Caption = #32534#35793#22120#36873#39033'(&O)...'
      ImageIndex = 34
      OnExecute = actCompOptionsExecute
    end
    object actEnviroOptions: TAction
      Tag = 2
      Category = 'Tools'
      Caption = #29615#22659#36873#39033'(&N)...'
      ImageIndex = 35
      OnExecute = actEnviroOptionsExecute
    end
    object actEditorOptions: TAction
      Tag = 3
      Category = 'Tools'
      Caption = #32534#36753#22120#36873#39033'(&D)...'
      ImageIndex = 36
      OnExecute = actEditorOptionsExecute
    end
    object actConfigTools: TAction
      Tag = 4
      Category = 'Tools'
      Caption = #37197#32622#24037#20855'(&T)...'
      ImageIndex = 37
      OnExecute = actConfigToolsExecute
    end
    object actFullScreen: TAction
      Tag = 1
      Category = 'Window'
      AutoCheck = True
      Caption = #20840#23631#27169#24335'(&F)'
      ImageIndex = 38
      ShortCut = 32891
      OnExecute = actFullScreenExecute
    end
    object actNext: TAction
      Tag = 2
      Category = 'Window'
      Caption = #19979#19968#20010#31383#21475'(&N)'
      ImageIndex = 39
      ShortCut = 16393
      OnExecute = actNextExecute
    end
    object actPrev: TAction
      Tag = 3
      Category = 'Window'
      Caption = #21069#19968#20010#31383#21475'(&P)'
      ImageIndex = 40
      ShortCut = 24585
      OnExecute = actPrevExecute
    end
    object actUpdateCheck: TAction
      Category = 'Help'
      Caption = #26816#26597#26356#26032'(&C)...'
      ImageIndex = 41
      OnExecute = actUpdateCheckExecute
    end
    object actAbout: TAction
      Category = 'Help'
      Caption = 'About...'
      ImageIndex = 42
      OnExecute = actAboutExecute
    end
    object actUnitRemove: TAction
      Tag = 1
      Category = 'Project'
      Caption = #20174#24037#31243#20013#31227#38500'(&R)'
      OnExecute = actUnitRemoveExecute
      OnUpdate = actUpdateProject
    end
    object actUnitRename: TAction
      Tag = 2
      Category = 'Project'
      Caption = #37325#21629#21517#25991#20214'(&N)'
      OnExecute = actUnitRenameExecute
      OnUpdate = actUpdateProject
    end
    object actUnitHeader: TAction
      Tag = 5
      Category = 'Project'
      Caption = 'Open &Header'
      OnUpdate = actUpdateProject
    end
    object actUnitOpen: TAction
      Tag = 4
      Category = 'Project'
      Caption = #25171#24320'(&O)...'
      OnExecute = actUnitOpenExecute
      OnUpdate = actUpdateProject
    end
    object actUnitClose: TAction
      Tag = 3
      Category = 'Project'
      Caption = #20851#38381'(&C)'
      OnExecute = actUnitCloseExecute
      OnUpdate = actUpdateProject
    end
    object actShowBars: TAction
      Caption = 'Show Toolbars'
      ShortCut = 32890
      OnExecute = actShowBarsExecute
    end
    object actBreakPoint: TAction
      Category = 'Debug'
      Caption = #28155#21152#26029#28857'(&K)'
      ShortCut = 115
      OnExecute = actBreakPointExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actAddWatch: TAction
      Category = 'Debug'
      Caption = #28155#21152#26597#30475'(&A)'
      ImageIndex = 21
      OnExecute = actAddWatchExecute
      OnUpdate = actUpdatePageCount
    end
    object actEditWatch: TAction
      Category = 'Debug'
      Caption = '&Edit watch'
      ImageIndex = 36
    end
    object actStepOver: TAction
      Category = 'Debug'
      Caption = #32487#32493'(&C)'
      ImageIndex = 14
      OnExecute = actStepOverExecute
      OnUpdate = actUpdateDebuggerRunning
    end
    object actWatchItem: TAction
      Category = 'Debug'
      Caption = '&Watch variables'
      OnUpdate = actUpdatePageorProject
    end
    object actRemoveWatch: TAction
      Category = 'Debug'
      Caption = #31227#38500#26597#30475'(&R)'
      ImageIndex = 5
      OnExecute = actRemoveWatchExecute
      OnUpdate = actUpdateDeleteWatch
    end
    object actStopExecute: TAction
      Category = 'Debug'
      Caption = #20572#27490#36816#34892'(&S)'
      ImageIndex = 11
      ShortCut = 117
      OnExecute = actForceStopExecuteExecute
      OnUpdate = actUpdateDebuggerRunning
    end
    object actFileMenu: TAction
      Caption = #25991#20214'(&F)'
      OnExecute = actFileMenuExecute
    end
    object actEditMenu: TAction
      Caption = #32534#36753'(&E)'
      OnExecute = actFileMenuExecute
      OnUpdate = actEditMenuUpdate
    end
    object actSearchMenu: TAction
      Caption = #26597#25214#21644#26367#25442'(&S)'
      OnExecute = actFileMenuExecute
    end
    object actViewMenu: TAction
      Caption = #35270#22270'(&V)'
      OnExecute = actFileMenuExecute
    end
    object actProjectMenu: TAction
      Caption = #24037#31243'(&P)'
      OnExecute = actFileMenuExecute
    end
    object actExecuteMenu: TAction
      Caption = #36816#34892'(&R)'
      OnExecute = actFileMenuExecute
    end
    object actDebugMenu: TAction
      Caption = #35843#35797'(&D)'
      OnExecute = actFileMenuExecute
    end
    object actToolsMenu: TAction
      Caption = #24037#20855'(&T)'
      OnExecute = actToolsMenuExecute
    end
    object actWindowMenu: TAction
      Caption = #31383#21475'(&W)'
      OnExecute = actWindowMenuExecute
    end
    object actHelpMenu: TAction
      Caption = #24110#21161'(&H)'
      OnExecute = actFileMenuExecute
    end
    object actSwapHeaderSource: TAction
      Category = 'Edit'
      Caption = #20999#25442#22836'/'#28304#25991#20214'(&W)'
      ShortCut = 16465
      OnExecute = actSwapHeaderSourceExecute
      OnUpdate = actSwapHeaderSourceUpdate
    end
    object actSyntaxCheck: TAction
      Category = 'Execute'
      Caption = #35821#27861#26816#26597'(&S)'
      OnExecute = actSyntaxCheckExecute
      OnUpdate = actCompileUpdate
    end
    object actConfigdevShortcuts: TAction
      Category = 'Tools'
      Caption = #37197#32622#24555#25463#38190'(&S)...'
      ImageIndex = 31
      OnExecute = actConfigdevShortcutsExecute
    end
    object actProgramReset: TAction
      Category = 'Execute'
      Caption = #37325#26032#21551#21160#31243#24207'(&G)'
      ShortCut = 16452
      OnExecute = actProgramResetExecute
      OnUpdate = actProgramResetUpdate
    end
    object actComment: TAction
      Category = 'Edit'
      Caption = #27880#37322'(&M)'
      ShortCut = 16574
      OnExecute = actCommentExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actUncomment: TAction
      Category = 'Edit'
      Caption = #21462#28040#27880#37322'(&N)'
      ShortCut = 16572
      OnExecute = actUncommentExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actIndent: TAction
      Category = 'Edit'
      Caption = #32553#36827'(&D)'
      ShortCut = 9
      OnExecute = actIndentExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actUnindent: TAction
      Category = 'Edit'
      Caption = #21462#28040#32553#36827'(&Z)'
      ShortCut = 8201
      OnExecute = actUnindentExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actGotoFunction: TAction
      Category = 'Search'
      Caption = #36716#21040#20989#25968'(&O)'
      ImageIndex = 44
      ShortCut = 24647
      OnExecute = actGotoFunctionExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actBrowserGotoDecl: TAction
      Category = 'ClassBrowser'
      Caption = 'Goto declaration'
      OnExecute = actBrowserGotoDeclExecute
      OnUpdate = actBrowserGotoDeclUpdate
    end
    object actBrowserGotoImpl: TAction
      Category = 'ClassBrowser'
      Caption = 'Goto implementation'
      OnExecute = actBrowserGotoImplExecute
      OnUpdate = actBrowserGotoImplUpdate
    end
    object actBrowserNewClass: TAction
      Category = 'ClassBrowser'
      Caption = 'New class'
      OnExecute = actBrowserNewClassExecute
      OnUpdate = actBrowserNewClassUpdate
    end
    object actBrowserNewMember: TAction
      Category = 'ClassBrowser'
      Caption = 'New member function'
      OnExecute = actBrowserNewMemberExecute
      OnUpdate = actBrowserNewMemberUpdate
    end
    object actBrowserNewVar: TAction
      Category = 'ClassBrowser'
      Caption = 'New variable'
      OnExecute = actBrowserNewVarExecute
      OnUpdate = actBrowserNewVarUpdate
    end
    object actBrowserViewAll: TAction
      Category = 'ClassBrowser'
      Caption = 'All files'
      Checked = True
      OnExecute = actBrowserViewAllExecute
      OnUpdate = actBrowserViewAllUpdate
    end
    object actBrowserViewProject: TAction
      Category = 'ClassBrowser'
      Caption = 'Project files'
      OnExecute = actBrowserViewProjectExecute
      OnUpdate = actBrowserViewAllUpdate
    end
    object actBrowserViewCurrent: TAction
      Category = 'ClassBrowser'
      Caption = 'Current file'
      OnExecute = actBrowserViewCurrentExecute
      OnUpdate = actBrowserViewAllUpdate
    end
    object actProfileProject: TAction
      Category = 'Execute'
      Caption = #24615#33021#20998#26512'(&P)'
      ImageIndex = 43
      OnExecute = actProfileProjectExecute
      OnUpdate = actRunUpdate
    end
    object actBrowserAddFolder: TAction
      Category = 'ClassBrowser'
      Caption = 'Add folder'
      OnExecute = actBrowserAddFolderExecute
      OnUpdate = actBrowserAddFolderUpdate
    end
    object actBrowserRemoveFolder: TAction
      Category = 'ClassBrowser'
      Caption = 'Remove folder'
      OnExecute = actBrowserRemoveFolderExecute
      OnUpdate = actBrowserAddFolderUpdate
    end
    object actBrowserRenameFolder: TAction
      Category = 'ClassBrowser'
      Caption = 'Rename folder'
      OnExecute = actBrowserRenameFolderExecute
      OnUpdate = actBrowserAddFolderUpdate
    end
    object actCloseAllButThis: TAction
      Category = 'File'
      Caption = #20851#38381#20854#20182#31383#21475'(&E)'
      OnExecute = actCloseAllButThisExecute
    end
    object actFileProperties: TAction
      Category = 'File'
      Caption = #21442#25968'(&R)...'
      OnExecute = actFilePropertiesExecute
      OnUpdate = actUpdatePageCount
    end
    object actViewToDoList: TAction
      Category = 'View'
      Caption = 'To-Do '#21015#34920'...'
      OnExecute = actViewToDoListExecute
      OnUpdate = actUpdatePageorProject
    end
    object actAddToDo: TAction
      Category = 'Edit'
      Caption = #28155#21152' To-Do '#39033#30446'...'
      ShortCut = 16468
      OnExecute = actAddToDoExecute
      OnUpdate = actUpdatePageorProject
    end
    object actProjectNewFolder: TAction
      Category = 'Project'
      Caption = #28155#21152#25991#20214#22841'(&D)...'
      OnExecute = actProjectNewFolderExecute
      OnUpdate = actUpdateProject
    end
    object actProjectRemoveFolder: TAction
      Category = 'Project'
      Caption = #31227#38500#25991#20214#22841'(&M)'
      OnExecute = actProjectRemoveFolderExecute
      OnUpdate = actUpdateProject
    end
    object actProjectRenameFolder: TAction
      Category = 'Project'
      Caption = #37325#21629#21517#25991#20214#22841'(&E)'
      OnExecute = actProjectRenameFolderExecute
      OnUpdate = actUpdateProject
    end
    object actImportMSVC: TAction
      Category = 'File'
      Caption = 'MS Visual C++ project'
      OnExecute = actImportMSVCExecute
    end
    object actExecParams: TAction
      Category = 'Execute'
      Caption = #36816#34892#21442#25968'(&M)...'
      OnExecute = actExecParamsExecute
    end
    object actShowTips: TAction
      Category = 'Help'
      Caption = 'Tips'
      OnExecute = actShowTipsExecute
    end
    object actBrowserUseColors: TAction
      Category = 'ClassBrowser'
      Caption = 'Use colors'
      Checked = True
    end
    object actAbortCompilation: TAction
      Category = 'Execute'
      Caption = #20572#27490#32534#35793'(&A)'
      OnExecute = actAbortCompilationExecute
      OnUpdate = actAbortCompilationUpdate
    end
    object actCVSImport: TAction
      Category = 'CVS'
      Caption = 'Import'
      OnExecute = actCVSImportExecute
    end
    object actCVSCheckout: TAction
      Category = 'CVS'
      Caption = 'Checkout'
      OnExecute = actCVSCheckoutExecute
    end
    object actCVSUpdate: TAction
      Category = 'CVS'
      Caption = #26356#26032'(&U)'
      OnExecute = actCVSUpdateExecute
      OnUpdate = actUpdatePageorProject
    end
    object actCVSCommit: TAction
      Category = 'CVS'
      Caption = #25552#20132'(&C)'
      OnExecute = actCVSCommitExecute
      OnUpdate = actUpdatePageorProject
    end
    object actCVSDiff: TAction
      Category = 'CVS'
      Caption = #27604#36739'(&D)'
      OnExecute = actCVSDiffExecute
      OnUpdate = actUpdatePageorProject
    end
    object actCVSLog: TAction
      Category = 'CVS'
      Caption = #26085#24535'(&L)'
      OnExecute = actCVSLogExecute
      OnUpdate = actUpdatePageorProject
    end
    object actCVSAdd: TAction
      Category = 'CVS'
      Caption = #28155#21152'(&A)'
      OnExecute = actCVSAddExecute
      OnUpdate = actUpdatePageorProject
    end
    object actCVSRemove: TAction
      Category = 'CVS'
      Caption = #21024#38500'(&R)'
      OnExecute = actCVSRemoveExecute
      OnUpdate = actUpdatePageorProject
    end
    object actBrowserShowInherited: TAction
      Category = 'ClassBrowser'
      Caption = 'Show inherited members'
      OnExecute = actBrowserShowInheritedExecute
    end
    object actCVSLogin: TAction
      Category = 'CVS'
      Caption = 'Login'
      OnExecute = actCVSLoginExecute
    end
    object actCVSLogout: TAction
      Category = 'CVS'
      Caption = 'Logout'
      OnExecute = actCVSLogoutExecute
    end
    object actCompileCurrentFile: TAction
      Category = 'Execute'
      Caption = #32534#35793#24403#21069#25991#20214'(&U)'
      ImageIndex = 28
      ShortCut = 16504
      OnExecute = actCompileCurrentFileExecute
      OnUpdate = actCompileCurrentFileUpdate
    end
    object actAttachProcess: TAction
      Category = 'Debug'
      Caption = #38468#21152#21040#36827#31243'(&A)...'
      OnExecute = actAttachProcessExecute
      OnUpdate = actAttachProcessUpdate
    end
    object actModifyWatch: TAction
      Category = 'Debug'
      Caption = #20462#25913#26597#30475'(&M)'
      ImageIndex = 37
      OnExecute = actModifyWatchExecute
      OnUpdate = actModifyWatchUpdate
    end
    object actNextLine: TAction
      Category = 'Debug'
      Caption = #36880#36807#31243'(&N)'
      ImageIndex = 18
      ShortCut = 118
      OnExecute = actNextLineExecute
      OnUpdate = actUpdateDebuggerRunning
    end
    object actStepLine: TAction
      Category = 'Debug'
      Caption = #21333#27493#25191#34892'(&I)'
      ShortCut = 119
      OnExecute = actStepLineExecute
      OnUpdate = actUpdateDebuggerRunning
    end
    object actDeleteProfileProject: TAction
      Category = 'Execute'
      Caption = #21024#38500#24615#33021#20998#26512#20449#24687'(&D)'
      ImageIndex = 11
      OnExecute = actDeleteProfileProjectExecute
      OnUpdate = actRunUpdate
    end
    object actGotoDeclEditor: TAction
      Category = 'ClassBrowser'
      Caption = #36716#21040#23450#20041'(&D)'
      OnExecute = actGotoImplDeclEditorExecute
    end
    object actGotoImplEditor: TAction
      Category = 'ClassBrowser'
      Caption = #36716#21040#23454#29616'(&I)'
      OnExecute = actGotoImplDeclEditorExecute
    end
    object actHideFSBar: TAction
      Category = 'Window'
      Caption = 'actHideFSBar'
      ShortCut = 32889
      OnExecute = actHideFSBarExecute
    end
    object actCollapse: TAction
      Category = 'Edit'
      Caption = #20840#37096#25240#21472'(&A)'
      OnExecute = actCollapseExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actUnCollapse: TAction
      Category = 'Edit'
      Caption = #20840#37096#21462#28040#25240#21472'(&L)'
      OnExecute = actUnCollapseExecute
      OnUpdate = actUpdateEmptyEditor
    end
    object actInsert: TAction
      Category = 'Edit'
      Caption = 'Insert'
      ImageIndex = 18
      OnExecute = actInsertExecute
      OnUpdate = actUpdatePageCount
    end
    object actToggle: TAction
      Category = 'Edit'
      Caption = 'Toggle Bookmarks'
      ImageIndex = 19
      OnExecute = actToggleExecute
      OnUpdate = actUpdatePageCount
    end
    object actGoto: TAction
      Category = 'Edit'
      Caption = 'Goto Bookmark'
      ImageIndex = 20
      OnUpdate = actUpdatePageCount
    end
    object actNextIns: TAction
      Category = 'Debug'
      Caption = #36880#35821#21477'(&X)'
      OnExecute = actNextInsExecute
      OnUpdate = actUpdateDebuggerRunning
    end
    object actStepIns: TAction
      Category = 'Debug'
      Caption = #21333#27493#36827#20837'(&S)'
      OnExecute = actStepInsExecute
      OnUpdate = actUpdateDebuggerRunning
    end
    object actSkipFunction: TAction
      Category = 'Debug'
      Caption = #36339#36807#20989#25968'(&F)'
      OnExecute = actSkipFunctionExecute
      OnUpdate = actUpdateDebuggerRunning
    end
    object actMsgCut: TAction
      Caption = 'Cut'
      ShortCut = 16472
      OnExecute = actMsgCutExecute
    end
    object actMsgCopy: TAction
      Caption = 'Copy'
      ShortCut = 16451
      OnExecute = actMsgCopyExecute
    end
    object actMsgCopyAll: TAction
      Caption = 'Copy All'
      ShortCut = 24643
      OnExecute = actMsgCopyAllExecute
    end
    object actMsgPaste: TAction
      Caption = 'Paste'
      ShortCut = 16470
      OnExecute = actMsgPasteExecute
    end
    object actMsgSelAll: TAction
      Caption = 'Select All'
      ShortCut = 16449
      OnExecute = actMsgSelAllExecute
    end
    object actMsgSaveAll: TAction
      Caption = 'Save All'
      ShortCut = 16467
      OnExecute = actMsgSaveAllExecute
    end
    object actMsgClear: TAction
      Caption = 'Clear'
      OnExecute = actMsgClearExecute
    end
  end
  object MessagePopup: TPopupMenu
    Left = 689
    Top = 300
    object actMsgCut1: TMenuItem
      Action = actMsgCut
      Caption = #21098#20999'(&T)'
    end
    object MsgCopyItem: TMenuItem
      Action = actMsgCopy
      Caption = #22797#21046'(&C)'
    end
    object MsgCopyAllItem: TMenuItem
      Action = actMsgCopyAll
      Caption = #20840#37096#22797#21046'(&O)'
    end
    object MsgPasteItem: TMenuItem
      Action = actMsgPaste
      Caption = #31896#36148'(&P)'
    end
    object N74: TMenuItem
      Caption = '-'
    end
    object MsgSellAllItem: TMenuItem
      Action = actMsgSelAll
      Caption = #20840#36873'(&S)'
    end
    object N71: TMenuItem
      Caption = '-'
    end
    object MsgSaveAllItem: TMenuItem
      Action = actMsgSaveAll
      Caption = #20840#37096#20445#23384'(&A)'
    end
    object N73: TMenuItem
      Caption = '-'
    end
    object MsgClearItem: TMenuItem
      Action = actMsgClear
      Caption = #28165#38500'(&L)'
    end
  end
  object CppTokenizer: TCppTokenizer
    LogTokens = False
    Left = 109
    Top = 103
  end
  object CppParser: TCppParser
    Enabled = True
    OnTotalProgress = CppParserTotalProgress
    Tokenizer = CppTokenizer
    ParseLocalHeaders = False
    ParseGlobalHeaders = False
    LogStatements = False
    OnStartParsing = CppParserStartParsing
    OnEndParsing = CppParserEndParsing
    Left = 66
    Top = 103
  end
  object CodeCompletion: TCodeCompletion
    Parser = CppParser
    Color = clWhite
    Width = 320
    Height = 240
    Enabled = True
    MinWidth = 256
    MinHeight = 128
    MaxWidth = 0
    MaxHeight = 0
    OnResize = CodeCompletionResize
    OnlyGlobals = False
    CurrentClass = 0
    Left = 23
    Top = 103
  end
  object devShortcuts: TdevShortcuts
    Filename = 'devShortcuts.cfg'
    AlternateColor = 14737632
    Left = 689
    Top = 171
  end
  object BrowserPopup: TPopupMenu
    AutoHotkeys = maManual
    Left = 109
    Top = 146
    object mnuBrowserGotoDecl: TMenuItem
      Action = actBrowserGotoDecl
    end
    object mnuBrowserGotoImpl: TMenuItem
      Action = actBrowserGotoImpl
      Default = True
    end
    object mnuBrowserSep1: TMenuItem
      Caption = '-'
    end
    object mnuBrowserNewClass: TMenuItem
      Action = actBrowserNewClass
    end
    object mnuBrowserNewMember: TMenuItem
      Action = actBrowserNewMember
    end
    object mnuBrowserNewVariable: TMenuItem
      Action = actBrowserNewVar
    end
    object N31: TMenuItem
      Caption = '-'
    end
    object mnuBrowserAddFolder: TMenuItem
      Action = actBrowserAddFolder
    end
    object mnuBrowserRemoveFolder: TMenuItem
      Action = actBrowserRemoveFolder
    end
    object mnuBrowserRenameFolder: TMenuItem
      Action = actBrowserRenameFolder
    end
    object mnuBrowserSep3: TMenuItem
      Caption = '-'
    end
    object mnuBrowserViewMode: TMenuItem
      Caption = ' View mode'
      object mnuBrowserViewAll: TMenuItem
        Action = actBrowserViewAll
        RadioItem = True
      end
      object mnuBrowserViewProject: TMenuItem
        Action = actBrowserViewProject
      end
      object mnuBrowserViweCurrent: TMenuItem
        Action = actBrowserViewCurrent
        RadioItem = True
      end
      object N42: TMenuItem
        Caption = '-'
      end
      object Usecolors1: TMenuItem
        Action = actBrowserUseColors
      end
      object Showinheritedmembers1: TMenuItem
        Action = actBrowserShowInherited
      end
    end
  end
  object DebugVarsPopup: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = DebugVarsPopupPopup
    Left = 66
    Top = 146
    object AddwatchPop: TMenuItem
      Action = actAddWatch
    end
    object ModifyWatchPop: TMenuItem
      Action = actModifyWatch
    end
    object N67: TMenuItem
      Caption = '-'
    end
    object RemoveWatchPop: TMenuItem
      Action = actRemoveWatch
    end
    object ClearallWatchPop: TMenuItem
      Caption = #20840#37096#28165#38500'(&C)'
      OnClick = ClearallWatchPopClick
    end
  end
  object DevCppDDEServer: TDdeServerConv
    OnExecuteMacro = DevCppDDEServerExecuteMacro
    Left = 689
    Top = 128
  end
  object PageControlEditorPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 689
    Top = 257
    object mni3: TMenuItem
      Action = actClose
    end
    object mni4: TMenuItem
      Action = actCloseAll
    end
    object mni5: TMenuItem
      Action = actCloseAllButThis
    end
    object N77: TMenuItem
      Caption = '-'
    end
    object O1: TMenuItem
      Caption = #22797#21046#23436#25972#22320#22336'(&O)'
      OnClick = O1Click
    end
    object N78: TMenuItem
      Caption = '-'
    end
    object AStyleA1: TMenuItem
      Caption = #20351#29992' AStyle '#26684#24335#21270#28304#20195#30721'(&A)'
      object ANSIA1: TMenuItem
        Caption = 'ANSI '#39118#26684'(&A)'
        OnClick = ANSIA1Click
      end
      object JavaJ1: TMenuItem
        Caption = 'Java '#39118#26684'(&J)'
        OnClick = JavaJ1Click
      end
    end
  end
  object dlgOpenDialog: TOpenDialog
    Left = 648
    Top = 85
  end
  object dlgSaveDialog: TSaveDialog
    Left = 648
    Top = 128
  end
end
