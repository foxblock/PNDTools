program PNDTools;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  VSTDragDrop_win in 'VSTDragDrop_win.pas',
  VSTUtils in 'VSTUtils.pas',
  FormatUtils in 'FormatUtils.pas',
  VSTIcons_win in 'VSTIcons_win.pas',
  ShellStuff_win in 'ShellStuff_win.pas',
  FileUtils in 'FileUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
