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

unit version;

interface

//path delimiter
const
    {$IFDEF WIN32}
    pd = '\';
    {$ENDIF}
    {$IFDEF LINUX}
    pd = '/';
    {$ENDIF}

    // exe properties
    DEVCPP = 'Smart-C++';
    DEVCPP_VERSION = '1.1.0.34';
    DEVCPP_BUILDTIME = 'January 31 2013';

    // delimiters
    DEV_INTERNAL_OPEN = '$__DEV_INTERNAL_OPEN';

    // config file names
    DEV_COMPLETION_CACHE = 'cache.ccc';
    DEV_DEFAULTCODE_FILE = 'defaultcode.ini';
    DEV_SHORTCUTS_FILE = 'shortcuts.ini';
    DEV_CLASSFOLDERS_FILE = 'classfolders.ini';
    DEV_CODEINS_FILE = 'codeinsertion.ini';
    DEV_WEBMIRRORS_FILE = 'webmirrors.ini';
    DEV_TOOLS_FILE = 'tools.ini';

    // themes
    DEV_GNOME_THEME = 'Gnome';
    DEV_NEWLOOK_THEME = 'New Look';
    DEV_BLUE_THEME = 'Blue';
    DEV_INTERNAL_THEME = 'New Look';

    LANGUAGE_DIR = 'Lang' + pd;
    ICON_DIR = 'Icons' + pd;
    HELP_DIR = 'Help' + pd;
    TEMPLATE_DIR = 'Templates' + pd;
    THEME_DIR = 'Themes' + pd;
    PACKAGES_DIR = 'Packages' + pd;

    // file fxtensions
    LIB_EXT = '.a';
    OBJ_EXT = '.o';
    DLL_EXT = '.dll';
    EXE_EXT = '.exe';
    DEV_EXT = '.dev';
    HTML_EXT = '.html';
    RTF_EXT = '.rtf';
    TEX_EXT = '.tex';
    INI_EXT = '.ini';
    TEMPLATE_EXT = '.template';
    SYNTAX_EXT = '.syntax';
    C_EXT = '.c';
    CPP_EXT = '.cpp';
    CC_EXT = '.cc';
    CXX_EXT = '.cxx';
    CP2_EXT = '.c++';
    CP_EXT = '.cp';
    H_EXT = '.h';
    HPP_EXT = '.hpp';
    RC_EXT = '.rc';
    RES_EXT = '.res';
    RH_EXT = '.rh';

    // program defaults
    MAKE_PROGRAM = 'mingw32-make.exe';
    GCC_PROGRAM = 'gcc.exe';
    GPP_PROGRAM = 'g++.exe';
    GDB_PROGRAM = 'gdb.exe';
    GDB32_PROGRAM = 'gdb32.exe';
    WINDRES_PROGRAM = 'windres.exe';
    DLLWRAP_PROGRAM = 'dllwrap.exe';
    GPROF_PROGRAM = 'gprof.exe';
    PACKMAN_PROGRAM = 'packman.exe';

    // File dialog filters
	  FLT_TEXTS         = '�ı��ĵ� (*.txt)|*.txt';
    FLT_ALLFILES      = '�����ļ� (*.*)|*.*|';
    FLT_PROJECTS      = 'Dev-C++ �����ļ� (*.dev)|*.dev';
    FLT_HEADS         = 'ͷ�ļ� (*.h;*.hpp;*.rh;*.hh)|*.h;*.hpp;*.rh;*.hh';
    FLT_CS            = 'C Դ�����ļ� (*.c)|*.c';
    FLT_CPPS          = 'C++ Դ�����ļ� (*.cpp;*.cc;*.cxx;*.c++;*.cp)|*.cpp;*.cc;*.cxx;*.c++;*.cp';
    FLT_RES           = '��Դ�ļ� (*.rc)|*.rc';
    FLT_HELPS         = '�����ļ� (*.hlp;*.chm;*.col)|*.hlp;*.chm;*.col|HTML �ļ� (*.htm;*.html)|*.htm;*.html|Text �ļ� (*.doc;*.rtf;*.txt)|*.doc;*.rtf;*.txt|�����ļ� (*.*)|*.*';
    FLT_MSVCPROJECTS  = 'Microsoft Visual C++ �����ļ� (*.dsp)|*.dsp';
    FLT_CBPROJECTS    = 'Code::Blocks �����ļ� (*.cbp)|*.cbp';

    // Custom synedit style properties
    cBP = 'Breakpoints';
    cErr = 'Error line';
    cABP = 'Active breakpoints';
    cGut = 'Gutter';
    cSel = 'Selected text';
    cFld = 'Folding lines';

    // GPROF commands and displays
    GPROF_CHECKFILE = 'gmon.out';
    GPROF_CMD_GENFLAT = '-p';
    GPROF_CMD_GENMAP = '-q';

implementation

end.
