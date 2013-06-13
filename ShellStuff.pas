{******************************************************************************}
{                                                                              }
{  Shell and file interaction functions                                        }
{                                                                              }
{  --------------------------------------------------------------------------  }
{                                                                              }
{  PNDTools is Copyright ©2011-2013 Janek Schäfer                              }
{                                                                              }
{  This file is part of PNDTools                                               }
{                                                                              }
{  PNDTools is free software: you can redistribute it and/or modify            }
{  it under the terms of the GNU General Public License as published by        }
{  the Free Software Foundation, either version 3 of the License, or           }
{  (at your option) any later version.                                         }
{                                                                              }
{  PNDTools is distributed in the hope that it will be useful,                 }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of              }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               }
{  GNU General Public License for more details.                                }
{                                                                              }
{  You should have received a copy of the GNU General Public License           }
{  along with this program.  If not, see <http://www.gnu.org/licenses/>.       }
{                                                                              }
{******************************************************************************}

unit ShellStuff;

interface

{$Ifdef Win32}
uses Windows;
{$Else}
//
{$Endif}

{ Copies a list of files (separated by #0) from ASource to ADest, both strings
  must contain the same number of files
  Will rename the copied file if ARenameCheck is true, replace otherwise
  Will never ask for rename or rewrite action
  Creates new directories if necessary
  Displays the OS copy dialogue
  Returns true on success, false otherwuse, use GetLastError for details in the
  latter case }
function  ShellCopyFile(const ASource, ADest:  String; ARenameCheck: Boolean = false): Boolean;

{ Deletes a file, a folder or a list of both (separated by #0)
  Is silent (does not display OS delete dialogue) and does not move to trash
  Returns true on success, false otherwuse, use GetLastError for details in the
  latter case }
function  ShellDeleteFile(FileName : String): Boolean;

{ Executes program FileName in ExeDir and passes parameters Params
  ExeDir defaults to the directory this application is in
  Verb can be changed for non-binary files to 'open' or 'explore' for example,
  see the ShellAPI documentation for more info
  If WaitForFinish is true the function will not return until the executed
  process has been terminated (is finished)
  Returns true on success, false otherwise, use GetLastError for details in the
  latter case }
function  ExecuteProgram(const FileName : String; const Params : String;
    const ExecDir : String = ''; const Verb : String = 'runas';
    const WaitForFinish : Boolean = true) : Boolean;     

{ Tries to convert a DOS path into a POSIX path used by Cygwin applications
  The Linux version will simply return Path while converting any '\' to '/' }
function ConvertPath(const Path : String) : String;

implementation

uses Forms, SysUtils,
    {$Ifdef Win32}
    ShellAPI
    {$Else}
    //
    {$Endif};

function ShellCopyFile(const ASource, ADest: String; ARenameCheck: Boolean = false): Boolean;
{$Ifdef Win32}
var
    sh: TSHFileOpStruct;
begin
    sh.Wnd := Application.Handle;
    sh.wFunc := FO_COPY;
    // String has to be terminated with #0#0
    sh.pFrom := PChar(ASource + #0);
    sh.pTo := PChar(ADest + #0);
    sh.fFlags := FOF_MULTIDESTFILES or FOF_NOCONFIRMATION or FOF_NOCONFIRMMKDIR;
    if ARenameCheck then
        sh.fFlags := sh.fFlags or FOF_RENAMEONCOLLISION;
    Result := (ShFileOperation(sh) = 0);
end;
{$Else}
begin
    {$Message Error 'This function needs to be implemented for Linux!'}
end;
{$Endif}

function ShellDeleteFile(FileName : String): Boolean;
{$Ifdef Win32}
var
    sh: TSHFileOpStruct;
begin
    sh.Wnd := Application.Handle;
    sh.wFunc := FO_DELETE;
    sh.fFlags := FOF_SILENT OR FOF_NOCONFIRMATION;
    sh.pFrom := PChar(FileName + #0);
    sh.pTo := #0;
    Result := (ShFileOperation(sh) = 0);
end;
{$Else}
begin
    {$Message Error 'This function needs to be implemented for Linux!'}
end;
{$Endif}

function  ExecuteProgram(const FileName : String; const Params : String;
    const ExecDir : String = ''; const Verb : String = 'runas';
    const WaitForFinish : Boolean = true) : Boolean;
{$Ifdef Win32}
var
    ShExecInfo : SHELLEXECUTEINFO;
    ExitCode : Cardinal;
    OSInfo : OSVERSIONINFO;
begin
    // Get Windows version to switch between 'runas' and 'open' verb
    GetVersionEx(OSInfo);

    ShExecInfo.Wnd          := Application.Handle;
    ShExecInfo.fMask        := SEE_MASK_NOCLOSEPROCESS;
    ShExecInfo.cbSize       := SizeOf(SHELLEXECUTEINFOW);
    if (Verb = 'runas') AND ((OSInfo.dwMajorVersion < 6) // XP and older
        OR (ExtractFileExt(FileName) <> 'exe')) then // only use 'runas' on .exe (won't work for .bat)
        ShExecInfo.lpVerb   := PChar('open')
    else
        ShExecInfo.lpVerb   := PChar(Verb);
    ShExecInfo.lpFile       := PChar(FileName);
    ShExecInfo.lpParameters := PChar(Params);
    if ExecDir = '' then
        ShExecInfo.lpDirectory := PChar(ExtractFileDir(Application.ExeName))
    else
        ShExecInfo.lpDirectory := PChar(ExecDir);
    ShExecInfo.nShow        := SW_SHOW;
    Result := ShellExecuteEx(@ShExecInfo);

    if WaitForFinish AND Result then
    begin
        ExitCode := STILL_ACTIVE;
        repeat
            GetExitCodeProcess(ShExecInfo.hProcess,ExitCode); //while the process is running
        until (ExitCode <> STILL_ACTIVE);
    end;
end;
{$Else}
begin
    {$Message Error 'This function needs to be implemented for Linux!'}
end;
{$Endif}

function ConvertPath(const Path : String) : String;
{$Ifdef Win32}
var
    Drive : String;
begin
    Drive := ExtractFileDrive(Path);
    Result := Path;
    if Length(Drive) > 1 then
    begin
        Result := StringReplace(Result,Drive,'',[]);
        Result := 'cygdrive/' + Drive[1] + Result;
    end;
    Result := StringReplace(Result,'\','/',[rfReplaceAll]);
end;     
{$Else}
begin
    Result := StringReplace(Result,'\','/',[rfReplaceAll]);
end;
{$Endif}

end.
