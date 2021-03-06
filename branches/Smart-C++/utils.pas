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

unit utils;

interface

uses
    {$IFDEF WIN32}
    Windows, Classes, Sysutils, Dateutils, Forms, ShellAPI, Dialogs, SynEdit, SynEditHighlighter,
    Menus, Registry, Controls, ComCtrls;
{$ENDIF}
{$IFDEF LINUX}
Classes, Sysutils, QForms, QDialogs, QSynEditHighlighter,
QMenus, Types;
{$ENDIF}

type
    { File ID types }
    TExUnitType = (
        utcSrc, // c source file (.c)
        utcppSrc, // c++ source file (.cpp)
        utcHead, // c header (.h)
        utcppHead, // c++ header (.hpp)
        utresHead, // resouce header (.rh)
        utresComp, // resource compiled (.res)
        utresSrc, // resource source (.rc)
        utPrj, // project file (.dev)
        utOther // any others
        );

    TFilterSet = (ftOpen, ftPrj, ftSrc, ftAll);

    TErrFunc = procedure(const Msg: AnsiString) of object;
    TLineOutputFunc = procedure(const Line: AnsiString) of object;
    TCheckAbortFunc = procedure(var AbortThread: boolean) of object;

procedure FilesFromWildcard(Directory: AnsiString; const Mask: AnsiString; Files: TStringList; Subdirs, ShowDirs, Multitasking: Boolean);

function ExecuteFile(const FileName, Params, DefaultDir: AnsiString; ShowCmd: Integer): THandle;
function RunAndGetOutput(const Cmd, WorkDir: AnsiString; ErrFunc: TErrFunc; LineOutputFunc: TLineOutputFunc; CheckAbortFunc: TCheckAbortFunc; ShowReturnValue: Boolean = True): AnsiString;

function GetShortName(const FileName: AnsiString): AnsiString;

function CommaStrToStr(s: AnsiString; formatstr: AnsiString): AnsiString;
function IncludeQuoteIfSpaces(const s: AnsiString): AnsiString;
function IncludeQuoteIfNeeded(const s: AnsiString): AnsiString;

procedure MsgErr(const text: AnsiString; const caption: AnsiString = 'Error');
procedure MsgBox(const text: AnsiString; const caption: AnsiString = 'Message'); overload;
procedure MsgBox(textlist: TStrings; const caption: AnsiString = 'Message'); overload;
procedure MsgBox(text: integer; const caption: AnsiString = 'Message'); overload;

procedure LoadFilefromResource(const FileName: AnsiString; ms: TMemoryStream);

function ValidateFile(const FileName: AnsiString; const WorkPath: AnsiString; const CheckDirs: boolean = FALSE): AnsiString;

function BuildFilter(const Filters: array of AnsiString): AnsiString;

function CodeInstoStr(const s: AnsiString): AnsiString;
function StrtoCodeIns(const s: AnsiString): AnsiString;

procedure StrtoAttr(var Attr: TSynHighlighterAttributes; const Value: AnsiString);
function AttrtoStr(Attr: TSynHighlighterAttributes): AnsiString;

procedure StrtoPoint(var pt: TPoint; const value: AnsiString);
function PointtoStr(pt: TPoint): AnsiString;

function ListToStr(List: TStrings): AnsiString;
procedure StrToList(const s: AnsiString; List: TStrings; delimiter: char = ';');

function GetFileTyp(const FileName: AnsiString): TExUnitType;

procedure SetPath(const Add: AnsiString; UseOriginal: boolean = TRUE);
function ExpandFileto(const FileName, BasePath: AnsiString): AnsiString;
function FileSamePath(const FileName, TestPath: AnsiString): boolean;
procedure CloneMenu(FromMenu, ToMenu: TMenuItem);

function FindComplement(const s: AnsiString; fromtoken, totoken: char; var curpos: integer; increment: integer): boolean;

function FPos(const SubStr, S: AnsiString; start: integer): integer;

function RPos(const SubStr, S: AnsiString): integer; overload;
function RPos(const SubStr, S: AnsiString; start: integer): integer; overload;

function GenMakePath1(const FileName: AnsiString): AnsiString;
function GenMakePath2(const FileName: AnsiString): AnsiString;
function GenMakePath(const FileName: AnsiString; EscapeSpaces, EncloseInQuotes: Boolean): AnsiString; overload;

function GetRealPath(const BrokenFileName: AnsiString; const Directory: AnsiString = ''): AnsiString;

function GetVersionString(const FileName: AnsiString): AnsiString;

function CheckChangeDir(var Dir: AnsiString): boolean;

function GetAssociatedProgram(const Extension: AnsiString; var Filename, Description: AnsiString): boolean;

function IsNumeric(const s: AnsiString): boolean;

function CountChar(const s: AnsiString; c: Char): integer;

procedure OpenHelpFile;

function ProgramHasConsole(const path: AnsiString): boolean;

function GetBuildTime(const path: AnsiString): TDateTime;

function IsEmpty(editor: TSynEdit): boolean;

function GetPrettyLine(hwnd: TListView; i: integer = -1): AnsiString; // removes #10 subitem delimiters

function CtrlDown: Boolean;

function GetInfoOfCompiler(const binfolder: AnsiString): AnsiString;

// Fast replacements of localized functions
function EndsStr(const subtext, text: AnsiString): boolean;
function EndsText(const subtext, text: AnsiString): boolean;

function ContainsStr(const text, subtext: AnsiString): boolean;
function ContainsText(const text, subtext: AnsiString): boolean;

function SameStr(const s1, s2: AnsiString): boolean;
function SameText(const s1, s2: AnsiString): boolean;

function NotSameStr(const s1, s2: AnsiString): boolean;
function NotSameText(const s1, s2: AnsiString): boolean;

function StartsStr(const subtext, text: AnsiString): boolean;
function StartsText(const subtext, text: AnsiString): boolean;

function ReplaceFirstStr(const S, OldPattern, NewPattern: AnsiString): AnsiString;
function ReplaceFirstText(const S, OldPattern, NewPattern: AnsiString): AnsiString;

function ReplaceLastStr(const S, OldPattern, NewPattern: AnsiString): AnsiString;
function ReplaceLastText(const S, OldPattern, NewPattern: AnsiString): AnsiString;

implementation

uses
    {$IFDEF WIN32}
    devcfg, version, Graphics, StrUtils, MultiLangSupport, main, editor;
{$ENDIF}
{$IFDEF LINUX}
devcfg, version, QGraphics, StrUtils, MultiLangSupport, main, editor;
{$ENDIF}

function GetInfoOfCompiler(const binfolder: AnsiString): AnsiString;
var
    gccoutput, gccversion, gcctype: AnsiString;
    start, stop: integer;
begin
    result := '';

    if FileExists(binfolder + 'gcc.exe') then begin
        gccoutput := RunAndGetOutput(binfolder + 'gcc.exe -v', binfolder, nil, nil, nil, False);

        // Obtain version number and compiler distro
        start := Pos('gcc version ', gccoutput);
        if start > 0 then begin

            // Find version number
            Inc(start, Length('gcc version '));
            stop := start;
            while (not (gccoutput[stop] in [#0..#32])) do
                Inc(stop);

            gccversion := Copy(gccoutput, start, stop - start);

            // Find compiler builder
            start := stop;
            while (not (gccoutput[start] = '(')) do
                Inc(start);
            while (not (gccoutput[stop] = ')')) do
                Inc(stop);

            gcctype := Copy(gccoutput, start, stop - start + 1);

            // Assemble user friendly name
            if ContainsStr(gcctype, 'tdm64') then
                result := 'TDM-GCC ' + gccversion
            else if ContainsStr(gcctype, 'tdm') then
                result := 'TDM-GCC ' + gccversion
            else if ContainsStr(gcctype, 'GCC') then
                result := 'MinGW GCC ' + gccversion;
        end;
    end;
end;

function CtrlDown: Boolean;
var
    State: TKeyboardState;
begin
    GetKeyboardState(State);
    Result := ((State[VK_CONTROL] and 128) <> 0);
end;

function IsEmpty(editor: TSynEdit): boolean;
var
    i: integer;
begin
    Result := true;
    for i := 0 to editor.Lines.Count - 1 do begin
        if Length(editor.Lines[i]) > 0 then begin
            Result := false;
            break;
        end;
    end;
end;

function GetPrettyLine(hwnd: TListView; i: integer): AnsiString;
begin
    if (i = -1) then begin // selection
        if (hwnd.itemindex <> -1) then
            result := StringReplace(StringReplace(hwnd.Items[hwnd.itemindex].Caption + ' ' + hwnd.Items[hwnd.itemindex].SubItems.Text, #13#10, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll])
        else
            result := '';
    end else begin
        result := hwnd.Items[i].Caption + #10 + hwnd.Items[i].SubItems.Text;
        result := StringReplace(result, #10, #9, []);
        result := StringReplace(result, #13#10, #9, []);
        result := StringReplace(result, #13#10, #9, []);
    end;
end;

function EndsStr(const subtext, text: AnsiString): boolean;
var
    SubTextLocation: Integer;
begin
    SubTextLocation := Length(text) - Length(subtext) + 1;
    if (SubTextLocation > 0) and (subtext <> '') then
        Result := StrComp(Pointer(subtext), Pointer(@text[SubTextLocation])) = 0
    else
        Result := False;
end;

function EndsText(const subtext, text: AnsiString): boolean;
var
    SubTextLocation: Integer;
begin
    SubTextLocation := Length(text) - Length(subtext) + 1;
    if (SubTextLocation > 0) and (subtext <> '') then
        Result := StrIComp(Pointer(subtext), Pointer(@text[SubTextLocation])) = 0
    else
        Result := False;
end;

function ContainsStr(const text, subtext: AnsiString): boolean;
begin
    Result := Pos(subtext, text) > 0;
end;

function ContainsText(const text, subtext: AnsiString): boolean;
begin
    Result := Pos(UpperCase(subtext), UpperCase(text)) > 0;
end;

function SameStr(const s1, s2: AnsiString): boolean;
begin
    Result := (CompareStr(s1, s2) = 0);
end;

function SameText(const s1, s2: AnsiString): boolean;
begin
    Result := (CompareText(s1, s2) = 0);
end;

function NotSameStr(const s1, s2: AnsiString): boolean;
begin
    Result := (CompareStr(s1, s2) <> 0);
end;

function NotSameText(const s1, s2: AnsiString): boolean;
begin
    Result := (CompareText(s1, s2) <> 0);
end;

function StartsStr(const subtext, text: AnsiString): boolean;
begin
    Result := SameStr(subtext, Copy(text, 1, Length(subtext)));
end;

function StartsText(const subtext, text: AnsiString): boolean;
begin
    Result := SameText(subtext, Copy(text, 1, Length(subtext)));
end;

function ReplaceFirstStr(const S, OldPattern, NewPattern: AnsiString): AnsiString;
var
    Offset: Integer;
begin

    Offset := Pos(OldPattern, S);
    if Offset = 0 then begin
        Result := S;
    end else begin

        // Copy the preceding stuff, append the new part, append old stuff after old pattern
        Result := Copy(S, 1, Offset - 1) + NewPattern + Copy(S, Offset + Length(OldPattern), MaxInt);
    end;
end;

function ReplaceFirstText(const S, OldPattern, NewPattern: AnsiString): AnsiString;
var
    Offset: Integer;
    UpperS, UpperOldPattern: string;
begin
    UpperS := UpperCase(S);
    UpperOldPattern := UpperCase(OldPattern);

    Offset := Pos(UpperOldPattern, UpperS);
    if Offset = 0 then begin
        Result := S;
    end else begin

        // Copy the preceding stuff, append the new part, append old stuff after old pattern
        Result := Copy(S, 1, Offset - 1) + NewPattern + Copy(S, Offset + Length(UpperOldPattern), MaxInt);
    end;
end;

function ReplaceLastStr(const S, OldPattern, NewPattern: AnsiString): AnsiString;
var
    Offset: Integer;
begin

    Offset := RPos(OldPattern, S);
    if Offset = 0 then begin
        Result := S;
    end else begin

        // Copy the preceding stuff, append the new part, append old stuff after old pattern
        Result := Copy(S, 1, Offset - 1) + NewPattern + Copy(S, Offset + Length(OldPattern), MaxInt);
    end;
end;

function ReplaceLastText(const S, OldPattern, NewPattern: AnsiString): AnsiString;
var
    Offset: Integer;
    UpperS, UpperOldPattern: string;
begin
    UpperS := UpperCase(S);
    UpperOldPattern := UpperCase(OldPattern);

    Offset := RPos(UpperOldPattern, UpperS);
    if Offset = 0 then begin
        Result := S;
    end else begin

        // Copy the preceding stuff, append the new part, append old stuff after old pattern
        Result := Copy(S, 1, Offset - 1) + NewPattern + Copy(S, Offset + Length(UpperOldPattern), MaxInt);
    end;
end;

function ProgramHasConsole(const path: AnsiString): boolean;
var
    handle: Cardinal;
    bytesread: DWORD;
    signature: DWORD;
    dos_header: _IMAGE_DOS_HEADER;
    pe_header: _IMAGE_FILE_HEADER;
    opt_header: _IMAGE_OPTIONAL_HEADER;
begin
    handle := CreateFile(PAnsiChar(path), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if handle <> INVALID_HANDLE_VALUE then begin
        ReadFile(Handle, dos_header, sizeof(dos_header), bytesread, nil);
        SetFilePointer(Handle, dos_header._lfanew, nil, 0);
        ReadFile(Handle, signature, sizeof(signature), bytesread, nil);
        ReadFile(Handle, pe_header, sizeof(pe_header), bytesread, nil);
        ReadFile(Handle, opt_header, sizeof(opt_header), bytesread, nil);

        Result := (opt_header.Subsystem = IMAGE_SUBSYSTEM_WINDOWS_CUI);
    end else
        Result := false;

    CloseHandle(handle);
end;

// Delphi 7 doesn't write the PE header correctly, so we can't use this to create the timestamp...

function GetBuildTime(const path: AnsiString): TDateTime;
var
    handle: Cardinal;
    bytesread: DWORD;
    signature: DWORD;
    dos_header: _IMAGE_DOS_HEADER;
    pe_header: _IMAGE_FILE_HEADER;
begin
    handle := CreateFile(PAnsiChar(path), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if handle <> INVALID_HANDLE_VALUE then begin
        ReadFile(Handle, dos_header, sizeof(dos_header), bytesread, nil);
        SetFilePointer(Handle, dos_header._lfanew, nil, 0);
        ReadFile(Handle, signature, sizeof(signature), bytesread, nil);
        ReadFile(Handle, pe_header, sizeof(pe_header), bytesread, nil);

        Result := UnixToDateTime(pe_header.TimeDateStamp);
    end else
        Result := 0;

    CloseHandle(handle);
end;

// got tired of typing application.handle,PAnsiChar,PAnsiChar MB_OK, etc ;)

procedure MsgErr(const text, caption: AnsiString);
begin
    MessageBox(application.handle, PAnsiChar(text), PAnsiChar(caption), MB_ICONERROR);
end;

procedure MsgBox(const text, caption: AnsiString);
begin
    MessageBox(application.handle, PAnsiChar(text), PAnsiChar(caption), MB_OK);
end;

procedure MsgBox(textlist: TStrings; const caption: AnsiString);
var
    I: integer;
    final: AnsiString;
begin
    final := '';
    for I := 0 to textList.Count - 1 do
        final := final + inttostr(Succ(I)) + #9 + textList.Strings[i] + #13#10;
    MessageBox(application.handle, PAnsiChar(final), PAnsiChar(caption), MB_OK);
end;

procedure MsgBox(text: integer; const caption: AnsiString);
begin
    MessageBox(application.handle, PAnsiChar(inttostr(text)), PAnsiChar(caption), MB_OK);
end;

procedure OpenHelpFile;
var
    abshelp: AnsiString;
begin
    abshelp := ReplaceFirstStr(devDirs.Help, '%path%\', devDirs.Exec) + 'devcpp.htm';
    ShellExecute(GetDesktopWindow(), 'open', PAnsiChar(abshelp), nil, nil, SW_SHOWNORMAL);
end;

procedure FilesFromWildcard(Directory: AnsiString; const Mask: AnsiString; Files: TStringList; Subdirs, ShowDirs, Multitasking: Boolean);
var
    SearchRec: TSearchRec;
    Attr, Error: Integer;
begin
    Directory := IncludeTrailingPathDelimiter(Directory);

    // First, find the required file...
    Attr := faAnyFile;
    if ShowDirs = False then
        Attr := Attr - faDirectory;
    Error := FindFirst(Directory + Mask, Attr, SearchRec);
    if (Error = 0) then
    begin
        while (Error = 0) do
        begin
            // Found one!
            Files.Add(Directory + SearchRec.Name);
            Error := FindNext(SearchRec);
            if Multitasking then
                Application.ProcessMessages;
        end;
        FindClose(SearchRec);
    end;

    // Then walk through all subdirectories.
    if Subdirs then
    begin
        Error := FindFirst(Directory + '*.*', faAnyFile, SearchRec);
        if (Error = 0) then
        begin
            while (Error = 0) do
            begin
                // Found one!
                if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and
                    faDirectory <> 0) then
                    // We do this recursively!
                    FilesFromWildcard(Directory + SearchRec.Name, Mask, Files,
                        Subdirs, ShowDirs, Multitasking);
                Error := FindNext(SearchRec);
            end;
            FindClose(SearchRec);
        end;
    end;
end;

function ExecuteFile(const FileName, Params, DefaultDir: AnsiString; ShowCmd: Integer): THandle;
begin
    Result := ShellExecute(Application.MainForm.Handle, nil,
        PAnsiChar(FileName), PAnsiChar(Params),
        PAnsiChar(DefaultDir), ShowCmd);
end;

function RunAndGetOutput(const Cmd, WorkDir: AnsiString;
    ErrFunc: TErrFunc; LineOutputFunc: TLineOutputFunc;
    CheckAbortFunc: TCheckAbortFunc;
    ShowReturnValue: Boolean): AnsiString;
var
    tsi: TStartupInfo;
    tpi: TProcessInformation;
    nRead: DWORD;
    aBuf: array[0..101] of char;
    sa: TSecurityAttributes;
    hOutputReadTmp, hOutputRead, hOutputWrite, hInputWriteTmp, hInputRead,
        hInputWrite, hErrorWrite: THandle;
    FOutput: AnsiString;
    CurrentLine: AnsiString;
    bAbort: boolean;
begin
    FOutput := '';
    CurrentLine := '';
    sa.nLength := SizeOf(TSecurityAttributes);
    sa.lpSecurityDescriptor := nil;
    sa.bInheritHandle := True;

    CreatePipe(hOutputReadTmp, hOutputWrite, @sa, 0);
    DuplicateHandle(GetCurrentProcess(), hOutputWrite, GetCurrentProcess(),
        @hErrorWrite, 0, true, DUPLICATE_SAME_ACCESS);
    CreatePipe(hInputRead, hInputWriteTmp, @sa, 0);

    // Create new output read handle and the input write handle. Set
    // the inheritance properties to FALSE. Otherwise, the child inherits
    // the these handles; resulting in non-closeable handles to the pipes
    // being created.
    DuplicateHandle(GetCurrentProcess(), hOutputReadTmp, GetCurrentProcess(),
        @hOutputRead, 0, false, DUPLICATE_SAME_ACCESS);
    DuplicateHandle(GetCurrentProcess(), hInputWriteTmp, GetCurrentProcess(),
        @hInputWrite, 0, false, DUPLICATE_SAME_ACCESS);
    CloseHandle(hOutputReadTmp);
    CloseHandle(hInputWriteTmp);

    FillChar(tsi, SizeOf(TStartupInfo), 0);
    tsi.cb := SizeOf(TStartupInfo);
    tsi.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    tsi.hStdInput := hInputRead;
    tsi.hStdOutput := hOutputWrite;
    tsi.hStdError := hErrorWrite;

    if not CreateProcess(nil, PAnsiChar(Cmd), @sa, @sa, true, 0, nil, PAnsiChar(WorkDir),
        tsi, tpi) then begin
        result := 'Unable to run "' + Cmd + '": ' + SysErrorMessage(GetLastError);
        exit;
    end;
    CloseHandle(hOutputWrite);
    CloseHandle(hInputRead);
    CloseHandle(hErrorWrite);

    bAbort := False;
    repeat
        if Assigned(CheckAbortFunc) then
            CheckAbortFunc(bAbort);
        if bAbort then begin
            TerminateProcess(tpi.hProcess, 1);
            Break;
        end;
        if (not ReadFile(hOutputRead, aBuf, 16, nRead, nil)) or (nRead = 0) then
        begin
            if GetLastError = ERROR_BROKEN_PIPE then
                Break
            else
                ErrFunc('Pipe read error, could not execute file');
        end;
        aBuf[nRead] := #0;
        FOutput := FOutput + PAnsiChar(@aBuf[0]);

        if Assigned(LineOutputFunc) then
        begin
            CurrentLine := CurrentLine + PAnsiChar(@aBuf[0]);
            if CurrentLine[Length(CurrentLine)] = #10 then
            begin
                Delete(CurrentLine, Length(CurrentLine), 1);
                LineOutputFunc(CurrentLine);
                CurrentLine := '';
            end;
        end;
    until False;
    GetExitCodeProcess(tpi.hProcess, nRead);
    if ShowReturnValue then
        Result := FOutput + ' ' + inttostr(nread)
    else
        Result := FOutput;

    CloseHandle(hOutputRead);
    CloseHandle(hInputWrite);
    CloseHandle(tpi.hProcess);
    CloseHandle(tpi.hThread);

end;

procedure SetPath(const Add: AnsiString; UseOriginal: boolean = TRUE);
var
    OldPath: array[0..512] of char;
    NewPath: AnsiString;
begin
    NewPath := Add;

    if NewPath <> '' then
        if NewPath[length(NewPath)] <> ';' then
            NewPath := NewPath + ';';

    // PATH environment variable does *not* like quotes in paths...
    // Even if there are spaces in pathnames, it doesn't matter.
    // It splits them up by the ';'
    NewPath := StringReplace(NewPath, '"', '', [rfReplaceAll]);

    if UseOriginal then
        NewPath := NewPath + devDirs.OriginalPath
    else begin
        GetEnvironmentVariable(PAnsiChar('PATH'), @OldPath, 512);
        NewPath := NewPath + AnsiString(OldPath);
    end;

    SetEnvironmentVariable(PAnsiChar('PATH'), PAnsiChar(NewPath));
end;

function ValidateFile(const FileName: AnsiString; const WorkPath: AnsiString;
    const CheckDirs: boolean = FALSE): AnsiString;
var
    fName: AnsiString;
    tmp: TStrings;
    idx: integer;
begin
    fName := ExtractFileName(FileName);
    if FileExists(FileName) then
        result := FileName
    else if FileExists(WorkPath + fName) then
        result := WorkPath + fName
    else if FileExists(WorkPath + FileName) then
        result := FileName
    else if CheckDirs then begin
        if (devDirs.Default <> '') and FileExists(devDirs.Default + fName) then
            result := devDirs.Default + fName
        else if (devDirs.Exec <> '') and FileExists(devDirs.Exec + fName) then
            result := devDirs.Exec + fName
        else if (devDirs.Help <> '') and FileExists(devDirs.Help + fName) then
            result := devDirs.Help + fName
        else if (devDirs.Lang <> '') and FileExists(devDirs.Lang + fName) then
            result := devDirs.Lang + fName
        else if (devDirs.Icons <> '') then begin
            tmp := TStringList.Create;
            try
                StrtoList(devDirs.Icons, tmp);
                if tmp.Count > 0 then
                    for idx := 0 to pred(tmp.Count) do
                        if FileExists(IncludeTrailingPathDelimiter(tmp[idx]) + fName) then begin
                            result := IncludeTrailingPathDelimiter(tmp[idx]) + fName;
                            break;
                        end;
            finally
                tmp.Free;
            end;
        end;
    end else
        result := '';
end;

procedure LoadFilefromResource(const FileName: AnsiString; ms: TMemoryStream);
var
    HResInfo: HRSRC;
    hRes: THandle;
    Buffer: PAnsiChar;
    aName, Ext: AnsiString;
begin
    Ext := ExtractFileExt(FileName);
    Ext := copy(ext, 2, length(ext));
    aName := ChangeFileExt(ExtractFileName(FileName), '');
    HResInfo := FindResource(HInstance, PAnsiChar(aName), PAnsiChar(Ext));
    hres := LoadResource(HInstance, HResInfo);
    if HRes = 0 then
    begin
        MessageBox(Application.MainForm.Handle,
            PAnsiChar(Format(Lang[ID_ERR_RESOURCE], [FileName, aName, Ext])),
            PAnsiChar(Lang[ID_ERROR]), MB_OK or MB_ICONERROR);
        exit;
    end;

    Buffer := LockResource(HRes);
    ms.clear;
    ms.WriteBuffer(Buffer[0], SizeofResource(HInstance, HResInfo));
    ms.Seek(0, 0);
    UnlockResource(HRes);
    FreeResource(HRes);
end;

function GetShortName(const FileName: AnsiString): AnsiString;
var
    pFileName: array[0..2048] of char;
begin
    GetShortPathName(PAnsiChar(FileName), pFileName, 2048);
    result := strpas(pFileName);
end;

function BuildFilter(const Filters: array of AnsiString): AnsiString;
var
    I: integer;
begin
    result := FLT_ALLFILES;
    for I := 0 to high(Filters) do begin

        // Check a few things:
        // 1) result must end with | before appending
        if result[Length(result)] <> '|' then
            result := result + '|';

        result := result + Filters[I];
    end;
end;

function CodeInstoStr(const s: AnsiString): AnsiString;
begin
    result := StringReplace(s, #13#10, '$_', [rfReplaceAll]);
end;

function StrtoCodeIns(const s: AnsiString): AnsiString;
begin
    result := StringReplace(s, '$_', #13#10, [rfReplaceAll]);
end;

procedure StrtoPoint(var pt: TPoint; const value: AnsiString);
var
    tmp: TStringList;
begin
    tmp := TStringList.Create;
    try
        tmp.CommaText := value;
        if tmp.Count >= 2 then
            with pt do
            begin
                // x=foreground y=background
                x := StringToColor(tmp[1]);
                y := StringtoColor(tmp[0]);
            end;
    finally
        tmp.Free;
    end;
end;

function PointtoStr(pt: TPoint): AnsiString;
begin
    result := format('%d, %d', [pt.y, pt.x]);
end;

function AttrtoStr(Attr: TSynHighlighterAttributes): AnsiString;
begin
    result := format('%s, %s, %d, %d, %d',
        [ColortoString(Attr.Foreground),
        ColortoString(Attr.Background),
            ord(fsBold in Attr.Style),
            ord(fsItalic in Attr.Style),
            ord(fsUnderline in Attr.Style)]);
end;

procedure StrtoAttr(var Attr: TSynHighlighterAttributes; const Value: AnsiString);
var
    tmp: TStringList;
begin
    tmp := TStringList.Create;
    try
        tmp.commaText := Value;
        if tmp.count = 5 then
            with attr do
            begin
                Foreground := StringtoColor(tmp[0]);
                Background := StringtoColor(tmp[1]);
                style := [];
                if tmp[2] = '1' then
                    style := style + [fsbold]
                else
                    style := style - [fsbold];
                if tmp[3] = '1' then
                    style := style + [fsItalic]
                else
                    style := style - [fsItalic];
                if tmp[4] = '1' then
                    style := style + [fsUnderline]
                else
                    style := style - [fsUnderline];
            end;
    finally
        tmp.Free;
    end;
end;

function CommaStrToStr(s: AnsiString; formatstr: AnsiString): AnsiString;
var
    i: integer;
    tmp: AnsiString;
begin
    result := '';
    while pos(';', s) > 0 do begin
        i := pos(';', s);
        tmp := Copy(s, 1, i - 1);
        Delete(s, 1, i);
        result := format(formatstr, [result, tmp]);
    end;
    if s <> '' then
        result := format(formatstr, [result, s]);
end;

// fix without using StringList.DelimitedText:
// http://stackoverflow.com/questions/1335027/delphi-stringlist-delimiter-is-always-a-space-character-even-if-delimiter-is-se

procedure StrToList(const s: AnsiString; List: TStrings; delimiter: char);
begin
    List.Clear;
    ExtractStrings([delimiter], [], PChar(S), List);
end;

function ListtoStr(List: TStrings): AnsiString;
var
    i: integer;
begin
    result := '';
    for i := 0 to List.Count - 1 do begin
        if i = 0 then
            result := List.Strings[0]
        else
            result := result + ';' + List.Strings[i];
    end;
end;

function GetFileTyp(const FileName: AnsiString): TExUnitType;
var
    ext: AnsiString;
begin
    Ext := ExtractfileExt(FileName);
    if AnsiMatchText(Ext, ['.dev']) then
        result := utPrj
    else if AnsiMatchText(ext, ['.c']) then
        result := utcSrc
    else if AnsiMatchText(ext, ['.cpp', '.cc', '.cxx', '.c++', '.cp']) then
        result := utcppSrc
    else if AnsiMatchText(ext, ['.h']) then
        result := utcHead
    else if AnsiMatchText(ext, ['.hpp', '.rh', '.hh', '.hxx', '.inl']) then
        result := utcppHead
    else if AnsiMatchText(ext, ['.res', '.rc']) then
        result := utresSrc
    else if AnsiMatchText(ext, ['.rh']) then
        result := utresHead
    else
        result := utOther;
end;

// seems stupid now but I want to expand to account for .. chars
//in basepath and or filename

function ExpandFileto(const FileName, BasePath: AnsiString): AnsiString;
var
    oldPath: AnsiString;
begin
    oldPath := GetCurrentDir;
    try
        if DirectoryExists(BasePath) then begin
            chdir(BasePath);
            result := ExpandFileName(FileName);
        end
        else
            Result := Filename; // no luck...
    finally
        chdir(oldPath);
    end;
end;

function FileSamePath(const FileName, TestPath: AnsiString): boolean;
var
    s1, s2: AnsiString;
begin
    result := FALSE;
    s1 := ExtractFilePath(FileName);
    s2 := ExtractFilePath(TestPath);
    if (s1 = s2) then
        result := TRUE
    else
        if (s1 = '') then
            result := FileExists(s2 + FileName);
end;

procedure CloneMenu(FromMenu, ToMenu: TMenuItem);
var
    idx: integer;
    Item: TMenuItem;
begin
    ToMenu.Clear;
    if FromMenu.Count <= 0 then exit;
    for idx := 0 to pred(FromMenu.Count) do
    begin
        Item := TMenuItem.Create(ToMenu);
        with FromMenu.Items[idx] do
        begin
            Item.Caption := Caption;
            Item.OnClick := OnClick;
            Item.Tag := Tag;
            Item.AutoCheck := AutoCheck;
            Item.ShortCut := ShortCut;
        end;
        ToMenu.Add(Item);
    end;
    ToMenu.Visible := FromMenu.Visible;
end;

function FPos(const SubStr, S: AnsiString; start: integer): integer;
var
    i: Integer;
    pStr: PChar;
    pSub: PChar;
begin
    pSub := Pointer(SubStr);

    for i := start to Length(s) do begin
        pStr := @(s[i]);
        if (pStr^ = pSub^) then begin // compare char
            if CompareMem(pSub, pStr, Length(SubStr)) then begin // then compare whole string
                result := i;
                exit;
            end;
        end;
    end;

    result := 0;
end;

function RPos(const SubStr, s: AnsiString): integer;
begin
    result := RPos(SubStr, s, Length(s) - Length(SubStr) + 1);
end;

function RPos(const SubStr, S: AnsiString; start: integer): integer;
var
    i: Integer;
    pStr: PChar;
    pSub: PChar;
begin
    pSub := Pointer(SubStr);

    for i := start downto 1 do begin
        pStr := @(s[i]);
        if (pStr^ = pSub^) then begin // compare char
            if CompareMem(pSub, pStr, Length(SubStr)) then begin // then compare whole string
                result := i;
                exit;
            end;
        end;
    end;

    result := 0;
end;

function FindComplement(const s: AnsiString; fromtoken, totoken: char; var curpos: integer; increment: integer): boolean;
var
    level, curposbackup: integer;
begin
    curposbackup := curpos;
    level := 0;
    while (curpos <= Length(s)) and (curpos > 0) do begin
        if (s[curpos] = fromtoken) then begin
            Inc(level);
        end else if (s[curpos] = totoken) then begin
            Dec(level);
            if level = 0 then begin
                Result := true;
                Exit;
            end;
        end;
        Inc(curpos, increment);
    end;
    curpos := curposbackup;
    Result := false;
end;

{ GenMakePath: convert a filename to a format that can be used by make }

function GenMakePath1(const FileName: AnsiString): AnsiString;
begin
    Result := GenMakePath(FileName, False, True);
end;

function GenMakePath2(const FileName: AnsiString): AnsiString;
begin
    Result := GenMakePath(FileName, True, False);
end;

function GenMakePath(const FileName: AnsiString; EscapeSpaces, EncloseInQuotes: Boolean): AnsiString;
begin
    Result := FileName;

    { Convert backslashes to slashes }
    Result := StringReplace(Result, '\', '/', [rfReplaceAll]);

    if EscapeSpaces then
        Result := StringReplace(Result, ' ', '\ ', [rfReplaceAll]);

    if EncloseInQuotes then
        if (Pos(' ', Result) > 0) then
            Result := '"' + Result + '"';
end;

function GetRealPath(const BrokenFileName, Directory: AnsiString): AnsiString;
var
    e: TEditor;
begin
    Result := BrokenFileName;

    { There are 3 kinds of bad filenames:
      1: C:/Foo/Bar.txt              (must be backslashes)
      2: /C/WINDOWS/Desktop/foo.c    (WinUnix paths?)
      3: foo.c                       (not an absolute filename) }

    { First, check if this is a WinUnix path }
    if CompareText(Copy(Result, 1, 1), '/') = 0 then
    begin
        Delete(Result, 1, 2);
        Result[2] := ':';
        Insert('\', Result, 3);
    end;

    { Second, check if this is an absolute filename }
    if (Length(Result) < 4) or not ((LowerCase(Result)[1] in ['A'..'Z']) and (Result[2] = ':')) then
    begin
        { It's not. }
        if Length(Directory) = 0 then
        begin
            if Assigned(MainForm.fProject) then
                Result := ExpandFileTo(Result, MainForm.fProject.Directory)
            else begin
                e := MainForm.GetEditor;
                if (Assigned(e)) and (Length(ExtractFileDir(e.FileName)) > 0) then
                    Result := ExpandFileTo(Result, ExtractFileDir(e.FileName))
                else
                    Result := ExpandFileName(Result);
            end;
        end else
        begin
            Result := ExpandFileTo(Result, Directory);
        end;
    end;

    { Last, replace all slashes with backslahes }
    {$IFDEF WIN32}
    StringReplace(Result, '/', '\', [rfReplaceAll]);
    {$ENDIF}
end;

function IncludeQuoteIfSpaces(const s: AnsiString): AnsiString;
begin
    if pos(' ', s) > 0 then
        result := '"' + s + '"'
    else
        result := s;
end;

function IncludeQuoteIfNeeded(const s: AnsiString): AnsiString;
begin
    if pos('"', s) = 0 then
        result := '"' + s + '"'
    else
        result := s;
end;

// added by mandrav 13 Sep 2002
// returns the file version of the .exe specified by filename
// in the form x.x.x.x

function GetVersionString(const FileName: AnsiString): AnsiString;
var
    Buf: Pointer;
    i: cardinal;
    P: pointer;
    pSize: cardinal;
    ffi: TVSFixedFileInfo;
begin
    Result := '';
    i := GetFileVersionInfoSize(PAnsiChar(FileName), i);
    if i = 0 then
        Exit;

    Buf := AllocMem(i);
    try
        if not GetFileVersionInfo(PAnsiChar(FileName), 0, i, Buf) then
            Exit;

        pSize := SizeOf(P);
        VerQueryValue(Buf, '\', p, pSize);

        ffi := TVSFixedFileInfo(p^);
        Result := Format('%d.%d.%d.%d', [
            HiWord(ffi.dwFileVersionMS),
                LoWord(ffi.dwFileVersionMS),
                HiWord(ffi.dwFileVersionLS),
                LoWord(ffi.dwFileVersionLS)]);
    finally
        FreeMem(Buf);
    end;
end;

// tries to change the current directory to Dir.
// Returns True if succesfull, False otherwise.
// If it succeeds, the Dir variable, holds the old dir.

function CheckChangeDir(var Dir: AnsiString): boolean;
var
    Old: AnsiString;
begin
    Old := GetCurrentDir;
    Result := SetCurrentDir(Dir);
    if Result then
        Dir := Old;
end;

function GetAssociatedProgram(const Extension: AnsiString; var Filename, Description: AnsiString): boolean;
const
    NOVALUE = '$__NONE__$';
var
    R: TRegIniFile;
    Base, S: AnsiString;
begin
    Result := False;
    R := TRegIniFile.Create;
    try
        R.RootKey := HKEY_CLASSES_ROOT;
        Base := R.ReadString(Extension, '', NOVALUE);
        if S = NOVALUE then
            Exit;
        S := R.ReadString(Base + '\shell\open\command', '', NOVALUE);
        if S = NOVALUE then
            Exit;
        Filename := S; // filename probably contains args, e.g. Filename='"some where\my.exe" "%1"'

        Description := ExtractFilename(S);
        Result := True;
        S := R.ReadString(Base + '\shell\open\ddeexec\application', '', NOVALUE);
        if S = NOVALUE then
            Description := 'Default application'
        else
            Description := S;
        if S = 'DEVCPP' then // avoid extensions registered to DevCpp ;)
            Result := False;
    finally
        R.Free;
    end;
end;

function IsNumeric(const s: AnsiString): boolean;
var
    i: integer;
begin
    result := true;
    for i := 1 to length(s) do
        if not (s[i] in ['0'..'9']) then begin
            result := false;
            exit;
        end;
end;

function CountChar(const s: AnsiString; c: char): integer;
var
    i: integer;
begin
    result := 0;
    for i := 1 to length(s) do
        if s[i] = c then
            Inc(result);
end;


end.
