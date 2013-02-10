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

unit devShortcutsEditorForm;

interface

uses
{$IFDEF WIN32}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Menus;
{$ENDIF}
{$IFDEF LINUX}
  SysUtils, Variants, Classes, QGraphics, QControls, QForms,
  QDialogs, QExtCtrls, QComCtrls, QStdCtrls, QMenus;
{$ENDIF}

type
  TfrmShortcutsEditor = class(TForm)
    lvShortcuts: TListView;
    btnOk: TButton;
    btnCancel: TButton;
    procedure lvShortcutsKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure lvShortcutsCustomDrawItem(Sender: TCustomListView;Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvShortcutsExit(Sender: TObject);
  private
    { Private declarations }
    function GetItem(Index: integer): TMenuItem;
    function GetShortCut(Index: integer): TShortCut;
  public
    { Public declarations }
    AltColor: TColor;
    procedure AddShortcut(M: TMenuItem; MenuName:AnsiString);
    procedure Clear;
    function Count: integer;
    property Items[Index: integer]: TMenuItem read GetItem;
    property ShortCuts[Index: integer]: TShortCut read GetShortCut;
  end;

var
  frmShortcutsEditor: TfrmShortcutsEditor;

implementation

uses
	StrUtils;

{$R *.dfm}

procedure TfrmShortcutsEditor.AddShortcut(M: TMenuItem; MenuName:AnsiString);
begin
  If (M.Action<>nil) and (LeftStr(M.Action.Name,6)='dynact') then
    Exit;
  with lvShortcuts.Items.Add do begin
    Caption := StripHotkey(MenuName+':'+(M.Caption));
    SubItems.Add(ShortCutToText(M.ShortCut));
    Data := M;
  end;
end;

procedure TfrmShortcutsEditor.Clear;
begin
  lvShortcuts.Clear;
end;

function TfrmShortcutsEditor.Count: integer;
begin
  Result := lvShortcuts.Items.Count;
end;

function TfrmShortcutsEditor.GetItem(Index: integer): TMenuItem;
begin
  Result := TMenuItem(lvShortcuts.Items[Index].Data);
end;

function TfrmShortcutsEditor.GetShortCut(Index: integer): TShortCut;
begin
  Result := TextToShortCut(lvShortcuts.Items[Index].SubItems[0]);
end;

procedure TfrmShortcutsEditor.lvShortcutsKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
var
  I: integer;
  sct: AnsiString;
begin
  if lvShortcuts.Selected = nil then
    Exit;
  if (Key = 27) and (Shift = []) then begin // clear shortcut if Escape is pressed
    lvShortcuts.Selected.SubItems[0] := '';
    Exit;
  end;
  if (Key>27) and (Key<=90) and (Shift=[]) then // if "normal" key, expect a shiftstate
    Exit;
  if (Key < 27) then // control key by itself, but accept Tab
    Exit;

  sct:=ShortCutToText(ShortCut(Key, Shift));
  lvShortcuts.Selected.SubItems[0] := sct;

  // we do no more check for other entries by the same name, as we used to,
  // because we 've prepended the menu name so it should be unique...

  // search other entries using this shortcut, and clear them
  for I:=0 to lvShortcuts.Items.Count-1 do
    if lvShortcuts.Items[I]<>lvShortcuts.Selected then
      if lvShortcuts.Items[I].SubItems[0]=sct then
        lvShortcuts.Items[I].SubItems[0] := '';

  // don't let the keystroke propagate...
  Key:=0;
  Shift:=[];
end;

procedure TfrmShortcutsEditor.lvShortcutsCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  with Sender.Canvas do begin
    if not (cdsSelected in State) then begin
      if Item.Index mod 2 = 0 then
        Brush.Color := clWhite
      else
        Brush.Color := AltColor;
      Pen.Color := clBlack;
    end;
  end;
end;

// Don't let a tab keystroke make us lose focus, instead, assign tab to the selected item
procedure TfrmShortcutsEditor.lvShortcutsExit(Sender: TObject);
var
	I: integer;
	sct: AnsiString;
	shift : TShiftState;
	State : TKeyboardState;
begin
	// Handle tabs only
	GetKeyboardState(State);
	if ((State[vk_Tab] and 128) <> 0) then begin
		// Control / Alt / Shift on the manual
		if ((State[vk_Control] and 128) <> 0) then
			shift := shift + [ssCtrl];
		if ((State[vk_Menu] and 128) <> 0) then
			shift := shift + [ssAlt];
		if ((State[vk_Shift] and 128) <> 0) then
			shift := shift + [ssShift];

		// We know we pressed 9 (TAB), but get ctrl/alt/shift manually
		sct:=ShortCutToText(ShortCut(9, shift));
		lvShortcuts.Selected.SubItems[0] := sct;

		// we do no more check for other entries by the same name, as we used to,
		// because we 've prepended the menu name so it should be unique...

		// search other entries using this shortcut, and clear them
		for I:=0 to lvShortcuts.Items.Count-1 do
			if lvShortcuts.Items[I]<>lvShortcuts.Selected then
				if lvShortcuts.Items[I].SubItems[0]=sct then
					lvShortcuts.Items[I].SubItems[0] := '';

		// No focus changes bitte
		Abort;
	end;
end;

end.

