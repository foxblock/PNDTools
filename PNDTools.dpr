program PNDTools;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  VSTDragDrop_win in 'VSTDragDrop_win.pas',
  VSTUtils in 'VSTUtils.pas',
  FormatUtils in 'FormatUtils.pas',
  VSTIcons_win in 'VSTIcons_win.pas',
  ShellStuff_win in 'ShellStuff_win.pas',
  FileUtils in 'FileUtils.pas',
  OptionsForm in 'OptionsForm.pas' {frmOptions},
  ControlHideFix in 'ControlHideFix.pas',
  PXMLForm in 'PXMLForm.pas' {frmPXML},
  CreatorForm in 'CreatorForm.pas' {frmCreator},
  InputFilterFunctions in 'InputFilterFunctions.pas',
  FileSelectForm in 'FileSelectForm.pas' {frmFileSelect};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmPXML, frmPXML);
  Application.CreateForm(TfrmPXML, frmPXML);
  Application.CreateForm(TfrmCreator, frmCreator);
  Application.CreateForm(TfrmFileSelect, frmFileSelect);
  Application.Run;
end.
