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

unit ImportCBFrm;

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
    TImportCBForm = class(TForm)
        lbSelect: TLabel;
        txtCB: TEdit;
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
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure btnBrowseClick(Sender: TObject);
        procedure txtDevChange(Sender: TObject);
        procedure btnBrowseDevClick(Sender: TObject);
        procedure btnImportClick(Sender: TObject);
        procedure SetDevName(Value: AnsiString);
        procedure WriteDev(Section, Key, Value: AnsiString);
        procedure SetFilename(Value: AnsiString);
        procedure WriteDefaultEntries;
    private
        { Private declarations }
        fSL: TStringList;
        fFilename: AnsiString;
        procedure ImportFile(Filename: AnsiString);
        procedure UpdateButtons;
    public
        { Public declarations }
        function GetFilename: AnsiString;
    end;

    //var
    //  ImportCBForm: TImportCBForm;

implementation

uses IniFiles, StrUtils, version, devcfg, utils;

{$R *.dfm}

{ TImportCBForm }

procedure TImportCBForm.UpdateButtons;
begin
    btnImport.Enabled := FileExists(txtCB.Text) and DirectoryExists(ExtractFilePath(txtDev.Text));
    cmbConf.Enabled := txtCB.Text <> '';
    txtDev.Enabled := txtCB.Text <> '';
    btnBrowseDev.Enabled := txtCB.Text <> '';
end;

procedure TImportCBForm.FormCreate(Sender: TObject);
begin
    fSL := TStringList.Create;
end;

procedure TImportCBForm.FormDestroy(Sender: TObject);
begin
    fSL.Free;
end;

procedure TImportCBForm.FormShow(Sender: TObject);
begin
    txtCB.Text := '';
    txtDev.Text := '';
    cmbConf.Clear;
    UpdateButtons;
end;

procedure TImportCBForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TImportCBForm.btnBrowseClick(Sender: TObject);
begin
    OpenDialog1.Filter := FLT_CBPROJECTS;
    OpenDialog1.Title := '打开 Code::Blocks 工程文件';
    if OpenDialog1.Execute then begin
        fFileName := StringReplace(OpenDialog1.FileName, ExtractFileExt(OpenDialog1.FileName), DEV_EXT, []);
        txtCB.Text := OpenDialog1.FileName;
        txtDev.Text := fFilename;
        ImportFile(OpenDialog1.FileName);
    end;
    UpdateButtons;
end;

procedure TImportCBForm.ImportFile(Filename: AnsiString);
begin
    SetPath(ExtractFilePath(FileName), false);
    fSL.LoadFromFile(Filename);
end;

function TImportCBForm.GetFilename: AnsiString;
begin
    Result := fFilename;
end;

procedure TImportCBForm.txtDevChange(Sender: TObject);
begin
    UpdateButtons;
end;

procedure TImportCBForm.btnBrowseDevClick(Sender: TObject);
begin
    { TODO 3 -oSXKDZ -cSmart-C++ 转换 : 翻译？ }
    SaveDialog1.Filter := FLT_PROJECTS;
    SaveDialog1.Title := '保存 Smart-C++ 工程文件';
    if SaveDialog1.Execute then
        txtDev.Text := SaveDialog1.Filename;
end;

procedure TImportCBForm.SetDevName(Value: AnsiString);
begin
    WriteDev('Project', 'Name', Value);
end;

procedure TImportCBForm.SetFilename(Value: AnsiString);
begin
    WriteDev('Project', 'FileName', Value);
    fFilename := Value;
end;

procedure TImportCBForm.WriteDefaultEntries;
begin
    WriteDev('Project', 'Ver', '2');
    WriteDev('Project', 'IsCpp', '1'); // all MSVC projects are C++ (correct me if I 'm wrong)
end;

procedure TImportCBForm.WriteDev(Section, Key, Value: AnsiString);
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

procedure TImportCBForm.btnImportClick(Sender: TObject);
var
    filepos: integer;
    ending: integer;
    i: integer;
    filestring: AnsiString;
begin
    if FileExists(fFilename) then begin
        if MessageDlg(fFilename + ' 已经存在。您确定要覆盖它吗？', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            Exit;
        DeleteFile(fFilename);
    end;

    // Defaults
    SetFilename(fFilename);
    SetDevName(StringReplace(ExtractFileName(fFilename), DEV_EXT, '', []));
    WriteDefaultEntries;

    // fSL.text now contains the file
    for i := 0 to fSL.Count - 1 do begin
        filepos := Pos('<Unit filename=', fSL.Strings[i]);

        // We've encountered: <Unit filename="foo.cpp" />
        if filepos > 0 then begin
            ending := GetLastPos('"', fSL.Strings[i]);
            filestring := Copy(fSL.Strings[i], 19, ending - 19);
            WriteDev('[Aap]', 'hoi', filestring);
        end;
    end;
end;

end.
