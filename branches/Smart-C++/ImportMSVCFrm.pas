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

unit ImportMSVCFrm;

interface

uses
    {$IFDEF WIN32}
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, StdCtrls;
{$ENDIF}
{$IFDEF LINUX}
SysUtils, Variants, Classes, QGraphics, QControls, QForms,
QDialogs, QButtons, QStdCtrls;
{$ENDIF}

type
    TImportMSVCForm = class(TForm)
        lbSelect: TLabel;
        txtVC: TEdit;
        btnBrowse: TSpeedButton;
        gbOptions: TGroupBox;
        lbConf: TLabel;
        cmbConf: TComboBox;
        lbDev: TLabel;
        txtDev: TEdit;
        btnBrowseDev: TSpeedButton;
        btnImport: TButton;
        btnCancel: TButton;
        OpenDialog1: TOpenDialog;
        SaveDialog1: TSaveDialog;
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure btnImportClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure btnBrowseClick(Sender: TObject);
        procedure txtDevChange(Sender: TObject);
        procedure btnBrowseDevClick(Sender: TObject);
    private
        { Private declarations }
        fSL: TStringList;
        fFilename: AnsiString;
        fInvalidFiles: AnsiString;
        procedure WriteDev(Section, Key, Value: AnsiString);
        procedure ImportFile(Filename: AnsiString);
        procedure WriteDefaultEntries;
        procedure SetFilename(Value: AnsiString);
        procedure SetDevName(Value: AnsiString);
        function ReadTargets(Targets: TStringList): boolean;
        function LocateTarget(var StartAt, EndAt: integer): boolean;
        function LocateSourceTarget(var StartAt, EndAt: integer): boolean;
        function ReadCompilerOptions(StartAt, EndAt: integer): boolean;
        function ReadLinkerOptions(StartAt, EndAt: integer): boolean;
        procedure ReadSourceFiles(StartAt, EndAt: integer);
        procedure ReadProjectType;
        function GetLineValue(StartAt, EndAt: integer; StartsWith: AnsiString): AnsiString;
        function StripQuotesIfNecessary(s: AnsiString): AnsiString;
        procedure UpdateButtons;
        function CheckVersion: boolean;
    public
        { Public declarations }
        function GetFilename: AnsiString;
    end;

    //var
    //  ImportMSVCForm: TImportMSVCForm;

implementation

uses IniFiles, StrUtils, version, devcfg, utils;

{$R *.dfm}

{ TImportMSVCForm }

procedure TImportMSVCForm.UpdateButtons;
begin
    btnImport.Enabled := FileExists(txtVC.Text) and DirectoryExists(ExtractFilePath(txtDev.Text));
    cmbConf.Enabled := txtVC.Text <> '';
    txtDev.Enabled := txtVC.Text <> '';
    btnBrowseDev.Enabled := txtVC.Text <> '';
end;

procedure TImportMSVCForm.FormCreate(Sender: TObject);
begin
    fSL := TStringList.Create;
end;

procedure TImportMSVCForm.FormDestroy(Sender: TObject);
begin
    fSL.Free;
end;

procedure TImportMSVCForm.FormShow(Sender: TObject);
begin
    txtVC.Text := '';
    txtDev.Text := '';
    cmbConf.Clear;
    UpdateButtons;
end;

function TImportMSVCForm.GetLineValue(StartAt, EndAt: integer;
    StartsWith: AnsiString): AnsiString;
var
    I: integer;
begin
    Result := '';
    if EndAt > fSL.Count - 1 then
        EndAt := fSL.Count - 1;
    I := StartAt;
    while I <= EndAt do begin
        if StartsText(StartsWith, fSL[I]) then begin
            Result := StripQuotesIfNecessary(Trim(Copy(fSL[I], Length(StartsWith) + 1, Length(fSL[I]) - Length(StartsWith))));
            Break;
        end;
        Inc(I);
    end;
end;

procedure TImportMSVCForm.ImportFile(Filename: AnsiString);
var
    Targets: TStringList;
begin
    fSL.LoadFromFile(Filename);

    Targets := TStringList.Create;
    try
        // check file for version
        if not CheckVersion then
            Exit;

        // read targets
        if not ReadTargets(Targets) then
            Exit;

        // fill the targets combo
        cmbConf.Items.Assign(Targets);
        if cmbConf.Items.Count > 0 then begin
            cmbConf.ItemIndex := 0;
        end;
    finally
        Targets.Free;
    end;
end;

function TImportMSVCForm.LocateTarget(var StartAt,
    EndAt: integer): boolean;
var
    I: integer;
begin
    Result := False;
    I := 0;
    while I < fSL.Count do begin
        if (StartsStr('!IF ', fSL[I]) or StartsStr('!ELSEIF ', fSL[I])) and ContainsStr(fSL[I], cmbConf.Text) then begin
            Inc(I);
            StartAt := I;
            while not (StartsStr('!ENDIF', fSL[I]) or StartsStr('!ELSEIF', fSL[I])) and (I < fSL.Count) do
                Inc(I);
            EndAt := I - 1;
            Result := True;
            Break;
        end;
        Inc(I);
    end;
end;

function TImportMSVCForm.LocateSourceTarget(var StartAt,
    EndAt: integer): boolean;
var
    I: integer;
begin
    Result := False;
    I := 0;
    while I < fSL.Count do begin
        if (StartsStr('# Begin Target', fSL[I])) then begin
            Inc(I);
            StartAt := I;
            while not (StartsStr('# End Target', fSL[I])) do
                Inc(I);
            EndAt := I - 1;
            Result := True;
            Break;
        end;
        Inc(I);
    end;
end;

function TImportMSVCForm.ReadCompilerOptions(StartAt,
    EndAt: integer): boolean;
var
    I: integer;
    Options: TStringList;
    sCompiler: AnsiString;
    sDirs: AnsiString;
    S: AnsiString;
begin
    Result := False;
    sCompiler := '-D__GNUWIN32__ ';
    sDirs := '';
    Options := TStringList.Create;
    try
        Options.Delimiter := ' ';
        Options.DelimitedText := GetLineValue(StartAt, EndAt, '# ADD CPP');
        I := 0;
        while I < Options.Count do begin
            if CompareText('/D', Options[I]) = 0 then begin
                S := Format('-D%s ', [Options[I + 1]]);
                sCompiler := sCompiler + S;
                Inc(I);
            end
            else if CompareText('/U', Options[I]) = 0 then begin
                S := Format('-U%s ', [Options[I + 1]]);
                sCompiler := sCompiler + S;
                Inc(I);
            end
            else if CompareText('/I', Options[I]) = 0 then begin
                S := Options[I + 1];
                sDirs := sDirs + S + ';';
                Inc(I);
            end
            else if (CompareText('/W1', Options[I]) = 0) or
                (CompareText('/W2', Options[I]) = 0) or
                (CompareText('/W3', Options[I]) = 0) then begin // warning messages
                sCompiler := sCompiler + '-W ';
                Inc(I);
            end
            else if CompareText('/W4', Options[I]) = 0 then begin // all warning messages
                sCompiler := sCompiler + '-Wall ';
                Inc(I);
            end
            else if CompareText('/WX', Options[I]) = 0 then begin // warnings as errors
                sCompiler := sCompiler + '-Werror ';
                Inc(I);
            end
            else if CompareText('/GX', Options[I]) = 0 then begin // enable exception handling
                sCompiler := sCompiler + '-fexceptions ';
                Inc(I);
            end
            else if CompareText('/Ob0', Options[I]) = 0 then begin // disable inline expansion
                sCompiler := sCompiler + '-fno-inline ';
                Inc(I);
            end
            else if CompareText('/Ob2', Options[I]) = 0 then begin // auto inline function expansion
                sCompiler := sCompiler + '-finline-functions ';
                Inc(I);
            end
            else if CompareText('/Oy', Options[I]) = 0 then begin // frame pointer omission
                sCompiler := sCompiler + '-fomit-frame-pointer ';
                Inc(I);
            end
            else if CompareText('/GB', Options[I]) = 0 then begin // blend optimization
                sCompiler := sCompiler + '-mcpu=pentiumpro -D_M_IX86=500 ';
                Inc(I);
            end
            else if CompareText('/G6', Options[I]) = 0 then begin // pentium pro optimization
                sCompiler := sCompiler + '-mcpu=pentiumpro -D_M_IX86=600 ';
                Inc(I);
            end
            else if CompareText('/G5', Options[I]) = 0 then begin // pentium optimization
                sCompiler := sCompiler + '-mcpu=pentium -D_M_IX86=500 ';
                Inc(I);
            end
            else if CompareText('/G4', Options[I]) = 0 then begin // 486 optimization
                sCompiler := sCompiler + '-mcpu=i486 -D_M_IX86=400 ';
                Inc(I);
            end
            else if CompareText('/G3', Options[I]) = 0 then begin // 386 optimization
                sCompiler := sCompiler + '-mcpu=i386 -D_M_IX86=300 ';
                Inc(I);
            end
            else if CompareText('/Za', Options[I]) = 0 then begin // disable language extensions
                sCompiler := sCompiler + '-ansi ';
                Inc(I);
            end
            else if CompareText('/Zp1', Options[I]) = 0 then begin // pack structures
                sCompiler := sCompiler + '-fpack-struct ';
                Inc(I);
            end
            else if CompareText('/W0', Options[I]) = 0 then begin // no warning messages
                sCompiler := sCompiler + '-w ';
                Inc(I);
            end;
            Inc(I);
        end;
        WriteDev('Project', 'Compiler', sCompiler);
        WriteDev('Project', 'CppCompiler', sCompiler);
        if sDirs <> '' then
            sDirs := Copy(sDirs, 1, Length(sDirs) - 1);
        WriteDev('Project', 'Includes', sDirs);
    finally
        Options.Free;
    end;
end;

function TImportMSVCForm.ReadLinkerOptions(StartAt,
    EndAt: integer): boolean;
var
    I: integer;
    Options: TStringList;
    sLibs: AnsiString;
    sDirs: AnsiString;
    S: AnsiString;
begin
    Result := False;
    sLibs := '';
    sDirs := '';
    Options := TStringList.Create;
    try
        Options.Delimiter := ' ';
        Options.DelimitedText := GetLineValue(StartAt, EndAt, '# ADD LINK32');
        for I := 0 to Options.Count - 1 do
            if (Options[I][1] <> '/') and EndsText('.lib', Options[I]) then begin
                S := Copy(Options[I], 1, Length(Options[I]) - 4);
                if ExtractFilePath(S) <> '' then
                    sDirs := sDirs + ExtractFilePath(S) + ';';
                S := Format('-l%s ', [ExtractFileName(S)]);
                sLibs := sLibs + S;
            end
            else if StartsText('/base:', Options[I]) then begin
                S := Copy(Options[I], 7, MaxInt);
                sLibs := sLibs + '--image-base ' + S + ' ';
            end
            else if StartsText('/implib:', Options[I]) then begin
                S := Copy(Options[I], 9, MaxInt);
                sLibs := sLibs + '--implib ' + S + ' ';
            end
            else if StartsText('/map:', Options[I]) then begin
                S := Copy(Options[I], 6, MaxInt);
                sLibs := sLibs + '-Map ' + S + '.map ';
            end
            else if StartsText('/subsystem:', Options[I]) then begin
                S := Copy(Options[I], 12, MaxInt);
                if S = 'windows' then
                    WriteDev('Project', 'Type', '0') // win32 gui
                else if S = 'console' then
                    WriteDev('Project', 'Type', '1'); // console app
                //        sLibs := sLibs + '-Wl --subsystem ' + S + ' ';
            end
            else if StartsText('/libpath:', Options[I]) then begin
                S := Copy(Options[I], 10, MaxInt);
                sDirs := sDirs + S + ';';
            end;
        WriteDev('Project', 'Linker', sLibs);
        if sDirs <> '' then
            sDirs := Copy(sDirs, 1, Length(sDirs) - 1);
        WriteDev('Project', 'Libs', sDirs);
    finally
        Options.Free;
    end;
end;

procedure TImportMSVCForm.ReadSourceFiles(StartAt,
    EndAt: integer);
var
    flds: TStringList;
    I, C: integer;
    UnitName: AnsiString;
    folder: AnsiString;
    folders: AnsiString;
begin
    fInvalidFiles := '';
    C := 0;
    folders := '';
    flds := TStringList.Create;
    try
        flds.Delimiter := '/';
        for I := StartAt to EndAt do
            if StartsText('# Begin Group ', fSL[I]) then begin
                folder := StripQuotesIfNecessary(Copy(fSL[I], 15, MaxInt));
                flds.Add(folder);
                folders := folders + flds.DelimitedText + ',';
            end
            else if StartsText('# End Group', fSL[I]) then begin
                if flds.Count > 0 then
                    flds.Delete(flds.Count - 1);
            end
            else if StartsText('SOURCE=', fSL[I]) then begin
                UnitName := Copy(fSL[I], 8, Length(fSL[I]) - 7);
                if FileExists(UnitName) then begin
                    UnitName := StringReplace(UnitName, '\', '/', [rfReplaceAll]);
                    WriteDev('Unit' + IntToStr(C + 1), 'FileName', UnitName);
                    WriteDev('Unit' + IntToStr(C + 1), 'Folder', flds.DelimitedText);
                    case GetFileTyp(UnitName) of
                        utcSrc, utcppSrc, utcHead, utcppHead: begin
                                WriteDev('Unit' + IntToStr(C + 1), 'Compile', '1');
                                if SameText(ExtractFileExt(UnitName), '.c') then
                                    WriteDev('Unit' + IntToStr(C + 1), 'CompileCpp', '0')
                                else
                                    WriteDev('Unit' + IntToStr(C + 1), 'CompileCpp', '1');
                                WriteDev('Unit' + IntToStr(C + 1), 'Link', '1');
                            end;
                        utResSrc: begin
                                WriteDev('Unit' + IntToStr(C + 1), 'Compile', '1');
                                WriteDev('Unit' + IntToStr(C + 1), 'CompileCpp', '1');
                                WriteDev('Unit' + IntToStr(C + 1), 'Link', '0');
                            end;
                    else begin
                            WriteDev('Unit' + IntToStr(C + 1), 'Compile', '0');
                            WriteDev('Unit' + IntToStr(C + 1), 'CompileCpp', '0');
                            WriteDev('Unit' + IntToStr(C + 1), 'Link', '0');
                        end;
                    end;
                    WriteDev('Unit' + IntToStr(C + 1), 'Priority', '1000');
                    Inc(C);
                end
                else
                    fInvalidFiles := fInvalidFiles + UnitName + #13#10;
            end;
    finally
        flds.Free;
    end;

    if folders <> '' then
        Delete(folders, Length(folders), 1);
    WriteDev('Project', 'UnitCount', IntToStr(C));
    WriteDev('Project', 'Folders', folders);
end;

function TImportMSVCForm.ReadTargets(Targets: TStringList): boolean;
var
    I: integer;
    P: PAnsiChar;
begin
    Targets.Clear;
    Result := False;
    I := 0;
    while I < fSL.Count do begin
        if StartsText('# Begin Target', fSL[I]) then begin
            // got it
            Inc(I);
            repeat
                if StartsText('# Name', fSL[I]) then begin
                    P := PAnsiChar(Trim(Copy(fSL[I], 7, Length(fSL[I]) - 6)));
                    Targets.Add(AnsiExtractQuotedStr(P, '"'));
                    Result := True;
                end;
                Inc(I);
            until (I = fSL.Count) or StartsText('# Begin Source File', fSL[I]);
            Break;
        end;
        Inc(I);
    end;
end;

procedure TImportMSVCForm.SetDevName(Value: AnsiString);
begin
    WriteDev('Project', 'Name', Value);
end;

procedure TImportMSVCForm.SetFilename(Value: AnsiString);
begin
    WriteDev('Project', 'FileName', Value);
    fFilename := Value;
end;

function TImportMSVCForm.StripQuotesIfNecessary(s: AnsiString): AnsiString;
var
    P: PAnsiChar;
begin
    if StartsText('"', s) and EndsText('"', s) then begin
        P := PAnsiChar(S);
        Result := AnsiExtractQuotedStr(P, '"');
    end
    else
        Result := S;
end;

procedure TImportMSVCForm.WriteDefaultEntries;
begin
    WriteDev('Project', 'Ver', '2');
    WriteDev('Project', 'IsCpp', '1'); // all MSVC projects are C++ (correct me if I 'm wrong)
end;

procedure TImportMSVCForm.WriteDev(Section, Key, Value: AnsiString);
var
    fIni: TIniFile;
begin
    fIni := TIniFile.Create(fFilename);
    try
        fIni.WriteString(Section, Key, Value);
    finally
        fIni.Free;
    end;
end;

procedure TImportMSVCForm.btnImportClick(Sender: TObject);
var
    StartAt, EndAt: integer;
    SrcStartAt, SrcEndAt: integer;
    sMsg: AnsiString;
begin
    if FileExists(fFilename) then begin
        if MessageDlg(fFilename + ' 已经存在。您确定要覆盖它吗？', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            Exit;
        DeleteFile(fFilename);
    end;

    SetFilename(fFilename);
    SetDevName(StringReplace(ExtractFileName(fFilename), DEV_EXT, '', []));
    WriteDefaultEntries;

    // locate selected target
    if not LocateTarget(StartAt, EndAt) then begin
        sMsg := Format('无法定位 ''%s'' 配置, 这可能是由 Smart-C++ 的 Bug 造成', [cmbConf.Text]);
        MessageDlg(sMsg, mtError, [mbOK], 0);
        Exit;
    end;

    //  WriteDev('Project', 'Type', '0');
    ReadProjectType;
    ReadCompilerOptions(StartAt, EndAt);
    ReadLinkerOptions(StartAt, EndAt);
    LocateSourceTarget(SrcStartAt, SrcEndAt);
    ReadSourceFiles(SrcStartAt, SrcEndAt);
    { TODO 2 -oSXKDZ -cTranslation : 此处翻译值得斟酌 }
    if fInvalidFiles = '' then
        sMsg := 'Microsoft Visual C++ 工程文件导入并转换成功! 您希望现在就打开转换后的文件吗?'
    else
        sMsg := '一些属于工程的文件不能被定位, 请手动定位并将它们加入至工程中...'#13#10#13#10 +
            fInvalidFiles + #13#10'Microsoft Visual C++ 工程文件转换完成但存在错误, 您希望现在就打开转换后的文件吗?';
    if MessageDlg(sMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        ModalResult := mrOk
    else
        Close;
end;

procedure TImportMSVCForm.ReadProjectType();
var
    I: integer;
    P: PAnsiChar;
begin
    I := 0;
    while I < fSL.Count do begin
        if StartsText('# TARGTYPE', fSL[I]) then begin
            // got it
            P := PAnsiChar(Copy(fSL[I], Length(fSL[I]) - 5, 7));
            if (P = '0x0102') then // "Win32 (x86) Dynamic-Link Library"
                WriteDev('Project', 'Type', '3')
            else if (P = '0x0103') then // "Win32 (x86) Console Application"
                WriteDev('Project', 'Type', '1')
            else if (P = '0x0104') then // "Win32 (x86) Static Library"
                WriteDev('Project', 'Type', '2')
            else // unknown
                WriteDev('Project', 'Type', '0');
            Break;
        end;
        Inc(I);
    end;
end;

procedure TImportMSVCForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TImportMSVCForm.btnBrowseClick(Sender: TObject);
begin
    OpenDialog1.Filter := FLT_MSVCPROJECTS;
    OpenDialog1.Title := '打开 Microsoft Visual C++ 工程文件';
    if OpenDialog1.Execute then begin
        fFileName := StringReplace(OpenDialog1.FileName, ExtractFileExt(OpenDialog1.FileName), DEV_EXT, []);
        txtVC.Text := OpenDialog1.FileName;
        txtDev.Text := fFilename;
        ImportFile(OpenDialog1.FileName);
    end;
    UpdateButtons;
end;

function TImportMSVCForm.GetFilename: AnsiString;
begin
    Result := fFilename;
end;

procedure TImportMSVCForm.txtDevChange(Sender: TObject);
begin
    UpdateButtons;
end;

procedure TImportMSVCForm.btnBrowseDevClick(Sender: TObject);
begin
    SaveDialog1.Filter := FLT_PROJECTS;
    { TODO 2 -oSXKDZ -cTranslation : 此处“Dev-C++”需修改，窗体中也一样 }
    SaveDialog1.Title := '保存 Dev-C++ 工程文件';
    if SaveDialog1.Execute then
        txtDev.Text := SaveDialog1.Filename;
end;

function TImportMSVCForm.CheckVersion: boolean;
var
    I: integer;
begin
    Result := False;
    for I := 0 to fSL.Count - 1 do
        if ContainsStr(fSL[I], 'Format Version 6.00') then begin
            Result := True;
            Break;
        end;
    if not Result then
        MessageDlg('该文件的版本不被支持导入...', mtWarning, [mbOK], 0);
end;

end.
