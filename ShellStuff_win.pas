unit ShellStuff_win;

interface

uses Windows;

{ Copies a list of files (separated by #0) from ASource to ADest, both strings
  must contain the same number of files
  Will rename the copied file if ARenameCheck is true, replace otherwise
  Will never ask for rename or rewrite action
  Creates new directories if necessary
  Displays the OS copy dialogue
  Returns true on success, false otherwuse, use GetLastError for details in the
  latter case }
function  CopyFileEx(const ASource, ADest:  String; ARenameCheck: Boolean = false): Boolean;

{ Deletes a file, a folder or a list of both (separated by #0)
  Is silent (does not display OS delete dialogue) and does not move to trash
  Returns true on success, false otherwuse, use GetLastError for details in the
  latter case }
function  DeleteFileEx(FileName : String): Boolean;

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

implementation

uses ShellAPI, Forms, SysUtils;

function CopyFileEx(const ASource, ADest: String; ARenameCheck: Boolean = false): Boolean;
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

function DeleteFileEx(FileName : String): Boolean;
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

function  ExecuteProgram(const FileName : String; const Params : String;
    const ExecDir : String = ''; const Verb : String = 'runas';
    const WaitForFinish : Boolean = true) : Boolean;
var
    ShExecInfo : SHELLEXECUTEINFO;
    ExitCode : Cardinal;
begin
    ShExecInfo.Wnd          := Application.Handle;
    ShExecInfo.fMask        := SEE_MASK_NOCLOSEPROCESS;
    ShExecInfo.cbSize       := SizeOf(SHELLEXECUTEINFOW);
    ShExecInfo.lpVerb       := PChar(Verb);
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

end.
