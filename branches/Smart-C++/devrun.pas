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

unit devrun;

interface

uses
    {$IFDEF WIN32}
    Classes, Windows, Dialogs, utils;
{$ENDIF}
{$IFDEF LINUX}
Classes, QDialogs, utils;
{$ENDIF}

type
    TLineOutputEvent = procedure(Sender: TObject; const Line: AnsiString) of object;

    TDevRun = class(TThread)
    private
        TheMsg: AnsiString;
        CurrentLine: AnsiString;
        FLineOutput: TLineOutputEvent;
        fCheckAbort: TCheckAbortFunc;
    protected
        procedure CallLineOutputEvent;
        procedure Execute; override;
        procedure LineOutput(const Line: AnsiString);
        procedure ShowError(const Msg: AnsiString);
        procedure ShowMsg;
    public
        Command: AnsiString;
        Directory: AnsiString;
        Output: AnsiString;
        property OnLineOutput: TLineOutputEvent read FLineOutput write FLineOutput;
        property OnCheckAbort: TCheckAbortFunc read FCheckAbort write FCheckAbort;
    end;

implementation

procedure TDevRun.ShowMsg;
begin
    MsgBox(TheMsg);
end;

procedure TDevRun.ShowError(const Msg: AnsiString);
begin
    TheMsg := Msg;
    Synchronize(ShowMsg);
end;

procedure TDevRun.CallLineOutputEvent;
begin
    FLineOutput(Self, CurrentLine);
end;

procedure TDevRun.LineOutput(const Line: AnsiString);
begin
    CurrentLine := Line;
    if Assigned(FLineOutput) then
        Synchronize(CallLineOutputEvent);
end;

procedure TDevRun.Execute;
begin
    Output := RunAndGetOutput(Command, Directory, Self.ShowError, LineOutput, FCheckAbort);
end;

end.
