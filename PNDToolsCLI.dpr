program PNDToolsCLI;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  FileUtils in 'FileUtils.pas',
  PNDUtils in 'PNDUtils.pas',
  ShellStuff in 'ShellStuff.pas';

procedure ShowHelp;
begin
    WriteLn('Insert help here!'); 
end;
        
var I : Integer;

begin
    I := 0;

    if ParamCount = 0 then
    begin
        ShowHelp;
        Exit;
    end;

    while I < ParamCount do
    begin
        ParamStr(I);
        Inc(I);
    end;
end.
