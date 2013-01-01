object CompileProgressForm: TCompileProgressForm
  Left = 391
  Top = 345
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #32534#35793'...'
  ClientHeight = 195
  ClientWidth = 582
  Color = clBtnFace
  Constraints.MinHeight = 227
  Constraints.MinWidth = 284
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    582
    195)
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel5: TBevel
    Left = 70
    Top = 94
    Width = 60
    Height = 21
    Anchors = []
  end
  object Bevel6: TBevel
    Left = 260
    Top = 94
    Width = 60
    Height = 21
    Anchors = []
  end
  object Bevel3: TBevel
    Left = 70
    Top = 66
    Width = 250
    Height = 21
    Anchors = []
  end
  object Bevel2: TBevel
    Left = 70
    Top = 37
    Width = 250
    Height = 21
    Anchors = []
  end
  object Bevel1: TBevel
    Left = 70
    Top = 8
    Width = 250
    Height = 21
    Anchors = []
  end
  object infoCompiler: TLabel
    Left = 8
    Top = 12
    Width = 39
    Height = 15
    Anchors = []
    Caption = #32534#35793#22120':'
  end
  object lblCompiler: TLabel
    Left = 76
    Top = 12
    Width = 62
    Height = 15
    Anchors = []
    Caption = 'lblCompiler'
  end
  object infoStatus: TLabel
    Left = 8
    Top = 41
    Width = 27
    Height = 15
    Anchors = []
    Caption = #29366#24577':'
  end
  object lblStatus: TLabel
    Left = 76
    Top = 41
    Width = 45
    Height = 15
    Anchors = []
    Caption = 'lblStatus'
  end
  object infoFile: TLabel
    Left = 8
    Top = 70
    Width = 51
    Height = 15
    Anchors = []
    Caption = #24403#21069#25991#20214':'
  end
  object lblFile: TLabel
    Left = 76
    Top = 70
    Width = 31
    Height = 15
    Anchors = []
    Caption = 'lblFile'
  end
  object infoErrors: TLabel
    Left = 8
    Top = 98
    Width = 27
    Height = 15
    Anchors = []
    Caption = #38169#35823':'
  end
  object infoWarnings: TLabel
    Left = 192
    Top = 98
    Width = 27
    Height = 15
    Anchors = []
    Caption = #35686#21578':'
  end
  object lblErr: TLabel
    Left = 76
    Top = 98
    Width = 48
    Height = 15
    Alignment = taRightJustify
    Anchors = []
    AutoSize = False
    Caption = 'lblErr'
  end
  object lblWarn: TLabel
    Left = 266
    Top = 98
    Width = 48
    Height = 15
    Alignment = taRightJustify
    Anchors = []
    AutoSize = False
    Caption = 'lblWarn'
  end
  object btnClose: TButton
    Left = 202
    Top = 158
    Width = 200
    Height = 30
    Anchors = []
    Cancel = True
    Caption = #20572#27490#32534#35793'(&A)'
    Default = True
    TabOrder = 0
  end
  object pb: TProgressBar
    Left = 4
    Top = 125
    Width = 574
    Height = 24
    Anchors = []
    Step = 1
    TabOrder = 1
  end
  object memoMiniLog: TMemo
    Left = 328
    Top = 9
    Width = 249
    Height = 105
    Anchors = []
    Color = clBtnFace
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 2
    WantReturns = False
    WordWrap = False
  end
end
