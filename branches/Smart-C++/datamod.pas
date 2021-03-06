{
    This file is part of Dev-C++
    Copyright (c) 2004 Bloodshed Software

    Dev-C++ is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Dev-C++ is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dev-C++; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

unit datamod;

interface

uses
    {$IFDEF WIN32}
    SysUtils, Classes, Menus, Dialogs, ImgList, Controls,
    SynEditHighlighter, SynHighlighterCpp,
    CodeInsList, SynHighlighterRC,
    SynEditMiscClasses, SynEditSearch;
{$ENDIF}
{$IFDEF LINUX}
SysUtils, Classes, QMenus, QDialogs, QImgList, QControls,
QSynEditExport, QSynExportHTML, QSynExportRTF,
QSynEditHighlighter, QSynHighlighterCpp, QSynEditPrint,
CodeIns, QSynHighlighterRC, QSynCompletionProposal,
QSynEditMiscClasses, QSynEditSearch;
{$ENDIF}

type
    TdmMain = class(TDataModule)
        Cpp: TSynCppSyn;
        ProjectImage_Gnome: TImageList;
        MenuImages_Gnome: TImageList;
        Res: TSynRCSyn;
        MenuImages_NewLook: TImageList;
        ProjectImage_NewLook: TImageList;
        GutterImages: TImageList;
        MenuImages_Blue: TImageList;
        ProjectImage_Blue: TImageList;
        ClassImages: TImageList;
        procedure DataModuleCreate(Sender: TObject);
        procedure DataModuleDestroy(Sender: TObject);
    private
        fUnitCount: integer;
        fProjectCount: integer;
        fCodeList: TCodeInsList;
        fCodeMenu: TMenuItem;
        fCodePop: TMenuItem;
        fCodeEvent: TNotifyEvent;
        fCodeOffset: byte;
        procedure LoadCodeIns;
    public
        property CodeMenu: TMenuItem read fCodeMenu write fCodeMenu;
        property CodePop: TMenuItem read fCodePop write fCodePop;
        property CodeClick: TNotifyEvent read fCodeEvent write fCodeEvent;
        property CodeInserts: TCodeInsList read fCodeList write fCodeList;
        property CodeOffset: byte read fCodeOffset write fCodeOffset;

        { MRU List }
    private
        fMRU: TStringList;
        fMRUMenu: TMenuItem;
        fMRUMax: byte;
        fMRUOffset: integer;
        fMRUClick: TNotifyEvent;
        procedure LoadHistory;
        procedure SaveHistory;
        procedure RebuildMRU;
        function GetMRU(index: integer): AnsiString;
    public
        procedure AddtoHistory(const s: AnsiString);
        procedure RemoveFromHistory(const s: AnsiString);
        procedure ClearHistory;
        property MRU[index: integer]: AnsiString read GetMRU;
        property MRUMenu: TMenuItem read fMRUMenu write fMRUMenu;
        property MRUOffset: integer read fMRUOffset write fMRUOffset;
        property MRUMax: byte read fMRUMax write fMRUMax;
        property MRUClick: TNotifyEvent read fMRUClick write fMRUClick;

    public
        procedure LoadDataMod;
        function GetNewProjectNumber: integer;
        function GetNewFileNumber: integer;
        procedure InitHighlighterFirstTime(index: integer);
        procedure UpdateHighlighter;
        function GetHighlighter(const FileName: AnsiString): TSynCustomHighlighter;
    end;

var
    dmMain: TdmMain;

implementation

uses
    devcfg, IniFiles, utils, version, main, MultiLangSupport;

{$R *.dfm}

{ TdmMain }

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
    fMRU := TStringList.Create;
    fCodeList := TCodeInsList.Create;
end;

procedure TdmMain.DataModuleDestroy(Sender: TObject);
begin
    SaveHistory;
    fMRU.Free;
    fCodeList.Free;
end;

procedure TdmMain.InitHighlighterFirstTime(index: integer);
    procedure AddSpecial(AttrName: AnsiString; Offset: integer);
    var
        a: integer;
    begin
        a := devEditor.Syntax.IndexofName(AttrName);
        if a = -1 then
            devEditor.Syntax.Append(format('%s=%s', [AttrName, LoadStr(offset)]))
        else
            devEditor.Syntax.Values[AttrName] := LoadStr(offset);
    end;
var
    i, a, offset: integer;
    Attr: TSynHighlighterAttributes;
begin
    offset := index * 1000;
    for i := 0 to pred(cpp.AttrCount) do
    begin
        attr := TSynHighlighterAttributes.Create(cpp.Attribute[i].Name);
        try
            StrtoAttr(Attr, LoadStr(i + offset + 1));
            cpp.Attribute[i].Assign(Attr);
            a := devEditor.Syntax.IndexOfName(cpp.Attribute[i].Name);
            if a = -1 then
                devEditor.Syntax.Append(format('%s=%s', [cpp.Attribute[i].Name, AttrtoStr(Attr)]))
            else
                devEditor.Syntax.Values[cpp.Attribute[i].Name] := AttrtoStr(Attr);
        finally
            Attr.Free;
        end;
    end;
    AddSpecial(cBP, offset + 17); // breakpoint
    AddSpecial(cErr, offset + 18); // error line
    AddSpecial(cABP, offset + 19); // active breakpoint
    AddSpecial(cGut, offset + 20); // gutter
    AddSpecial(cSel, offset + 21); // selected text
    AddSpecial(cFld, offset + 22); // fold bar lines
end;

procedure TdmMain.UpdateHighlighter;
var
    Attr: TSynHighlighterAttributes;
    aName: AnsiString;
    a,
        idx: integer;
begin
    for idx := 0 to pred(cpp.AttrCount) do
    begin
        aName := cpp.Attribute[idx].Name;
        a := devEditor.Syntax.IndexOfName(aName);
        if a <> -1 then
        begin
            Attr := TSynHighlighterAttributes.Create(aName);
            try
                StrtoAttr(Attr, devEditor.Syntax.Values[aname]);
                cpp.Attribute[idx].Assign(attr);
            finally
                Attr.Free;
            end;
        end;
    end;
    // update res highlighter
    with Res do
    begin
        CommentAttri.Assign(cpp.CommentAttri);
        DirecAttri.Assign(cpp.DirecAttri);
        IdentifierAttri.Assign(cpp.IdentifierAttri);
        KeyAttri.Assign(cpp.KeyAttri);
        NumberAttri.Assign(cpp.NumberAttri);
        SpaceAttri.Assign(cpp.SpaceAttri);
        StringAttri.Assign(cpp.StringAttri);
        SymbolAttri.Assign(cpp.SymbolAttri);
    end;
end;

function TdmMain.GetHighlighter(const FileName: AnsiString): TSynCustomHighlighter;
var
    ext: AnsiString;
    idx: integer;
    tmp: TStrings;
begin
    UpdateHighlighter;
    result := nil;
    if devEditor.UseSyntax then begin
        if (FileName = '') or (Pos(Lang[ID_UNTITLED], FileName) = 1) then
            result := cpp
        else begin
            ext := ExtractFileExt(FileName);
            if CompareText(ext, RC_EXT) = 0 then
                result := Res
            else begin
                tmp := TStringList.Create;
                try
                    delete(ext, 1, 1);
                    tmp.Delimiter := ';';
                    tmp.DelimitedText := devEditor.SyntaxExt;
                    if tmp.Count > 0 then
                        for idx := 0 to pred(tmp.Count) do
                            if CompareText(Ext, tmp[idx]) = 0 then begin
                                result := cpp;
                                Exit;
                            end;
                finally
                    tmp.Free;
                end;
            end;
        end;
    end;
end;

function TdmMain.GetNewFileNumber: integer;
begin
    Inc(fUnitCount);
    result := fUnitCount;
end;

function TdmMain.GetNewProjectNumber: integer;
begin
    Inc(fProjectCount);
    result := fProjectCount;
end;

procedure TdmMain.LoadDataMod;
begin
    LoadHistory;
    LoadCodeIns;
    UpdateHighlighter;
end;

{ ---------- MRU ---------- }

procedure TdmMain.AddtoHistory(const s: AnsiString);
var
    I: integer;
begin
    if (s = '') then
        exit;

    // Don't add duplicates!
    for I := 0 to fMRU.Count - 1 do
        if SameText(s, fMRU.ValueFromIndex[i]) then
            Exit;

    // insert first
    fMRU.Insert(0, Format('%d=%s', [fMRU.Count, s]));
    RebuildMRU;
end;

procedure TdmMain.RemoveFromHistory(const s: AnsiString);
var
    I: integer;
begin

    // Remove one, duplicates simply aren't present
    for I := 0 to fMRU.Count - 1 do
        if SameText(s, fMRU.ValueFromIndex[i]) then begin
            fMRU.Delete(i);
            RebuildMRU;
            break;
        end;
end;

procedure TdmMain.ClearHistory;
begin
    fMRU.Clear;
    RebuildMRU;
end;

function TdmMain.GetMRU(index: integer): AnsiString;
begin
    result := fMRU.ValueFromIndex[index];
end;

procedure TdmMain.LoadHistory;
var
    I: integer;
begin
    ClearHistory;

    // Use already open file handle
    devData.ReadStrings('History', fMRU);

    // Delete files that don't exist anymore
    for I := fMRU.Count - 1 downto 0 do
        if not FileExists(fMRU.ValueFromIndex[I]) then
            fMRU.Delete(I);

    RebuildMRU;
end;

procedure TdmMain.SaveHistory;
begin
    if not assigned(fMRU) then exit;

    // Use already open file handle
    devData.WriteStrings('History', fMRU);
end;

procedure TdmMain.RebuildMRU;
// this function sorts the MRU by bringing the .dev files
// to the top of the list. It doesn't alter the order in
// other ways... The return value is the Index
// of the first non .dev file
    function SortMRU: integer;
    var
        I, C: integer;
        swp: AnsiString;
        Done: boolean;
    begin
        C := 0;
        repeat
            Done := True;
            for I := 0 to fMRU.Count - 2 do
                if (LowerCase(ExtractFileExt(fMRU[I])) <> '.dev') and
                    (LowerCase(ExtractFileExt(fMRU[I + 1])) = '.dev') then begin
                    swp := fMRU[I];
                    fMRU[I] := fMRU[I + 1];
                    fMRU[I + 1] := swp;
                    Done := False;
                end;
        until Done;
        for I := 0 to fMRU.Count - 1 do
            if LowerCase(ExtractFileExt(fMRU[I])) <> '.dev' then begin
                C := I;
                Break;
            end;
        Result := C;
    end;
var
    Stop,
        Counter,
        idx: integer;
    Item: TMenuItem;
    NonDev: integer;
    UpdMRU: TStringList;
begin
    if not assigned(fMRUMenu) then exit;
    for idx := pred(fMRUMenu.Count) downto fMRUOffset do
        fMRUMenu[idx].Free;

    // Initialize a new MRU...
    // We 'll be adding in this *only* the entries that
    // are going to fMRUMenu.
    // After that, we 'll replace the fMRU with UpdMRU.
    // That way the MRU is always up to date and does not contain
    // excess elements.
    UpdMRU := TStringList.Create;

    Counter := 0;

    // Build the .dev recent files entries (*.dev)
    NonDev := SortMRU;
    // 4 .devs max - make it configurable?
    if NonDev > 4 then
        Stop := 4
    else
        Stop := NonDev;

    for idx := 0 to pred(Stop) do
    begin
        UpdMRU.Add(Format('%d=%s', [UpdMRU.Count, fMRU.ValueFromIndex[idx]]));
        Item := TMenuItem.Create(fMRUMenu);
        Item.Caption := format('&%1x %s', [Counter, fMRU.ValueFromIndex[idx]]);
        Item.OnClick := fMRUClick;
        Item.Tag := UpdMRU.Count - 1;
        fMRUMenu.Add(Item);
        Inc(Counter);
    end;
    if (fMRUMenu.Count - fMRUOffset) > 0 then
        fMRUMenu.InsertNewLineAfter(fMRUMenu.Items[fMRUMenu.Count - 1]);


    // Now build the other recent files entries (*.cpp, *.h, etc)
    if (fMRU.Count - NonDev) > fMRUMax then
        Stop := NonDev + fMRUMax
    else
        Stop := fMRU.Count;

    for idx := NonDev to pred(Stop) do
    begin
        UpdMRU.Add(Format('%d=%s', [UpdMRU.Count, fMRU.ValueFromIndex[idx]]));
        Item := TMenuItem.Create(fMRUMenu);
        Item.Caption := format('&%1x %s', [Counter, fMRU.ValueFromIndex[idx]]);
        Item.OnClick := fMRUClick;
        Item.Tag := UpdMRU.Count - 1;
        fMRUMenu.Add(Item);
        Inc(Counter);
    end;
    fMRUMenu.Enabled := (fMRUMenu.Count - fMRUOffset) > 0;

    // update MRU
    fMRU.Assign(UpdMRU);
    UpdMRU.Free;
end;

{ ---------- Code Insert Methods ---------- }

// Loads code inserts, when sep value changes a separator is
// insert only if sep is a higher value then previous sep value.

procedure TdmMain.LoadCodeIns;
var
    cdx,
        idx: integer;
    Item: TMenuItem;
begin
    if not assigned(fCodeMenu) then exit;
    fCodeList.LoadCode;

    for idx := pred(fCodeMenu.Count) downto fCodeOffset do
        fCodeMenu[idx].Free;

    if assigned(fCodePop) then
        fCodePop.Clear;

    cdx := 0;
    for idx := 0 to pred(fCodeList.Count) do
    begin
        Item := TMenuItem.Create(fCodeMenu);
        Item.Caption := fCodeList[idx]^.Caption;
        Item.OnClick := fCodeEvent;
        Item.Tag := idx;
        if fCodeList[idx]^.Sep <= cdx then
            fCodeMenu.Add(Item)
        else
        begin
            cdx := fCodeList[idx]^.Sep;
            fCodeMenu.NewBottomLine;
            fCodeMenu.Add(Item);
        end;
    end;
    fCodeMenu.Visible := fCodeMenu.Count > 0;
    if assigned(fCodePop) then
        CloneMenu(fCodeMenu, fCodePop);
end;

end.

