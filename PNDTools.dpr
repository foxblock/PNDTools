program PNDTools;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  VSTDragDrop in 'VSTDragDrop.pas',
  VSTUtils in 'VSTUtils.pas',
  FormatUtils in 'FormatUtils.pas',
  VSTIcons in 'VSTIcons.pas',
  ShellStuff in 'ShellStuff.pas',
  FileUtils in 'FileUtils.pas',
  OptionsForm in 'OptionsForm.pas' {frmOptions},
  ControlHideFix in 'ControlHideFix.pas',
  PXMLForm in 'PXMLForm.pas' {frmPXML},
  CreatorForm in 'CreatorForm.pas' {frmCreator},
  InputFilterFunctions in 'InputFilterFunctions.pas',
  FileSelectForm in 'FileSelectForm.pas' {frmFileSelect},
  GraphicUtils in 'GraphicUtils.pas',
  AboutForm in 'AboutForm.pas' {frmAbout},
  FileConflictForm in 'FileConflictForm.pas' {frmFileConflict},
  PNDUtils in 'PNDUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmPXML, frmPXML);
  Application.CreateForm(TfrmPXML, frmPXML);
  Application.CreateForm(TfrmFileSelect, frmFileSelect);
  Application.CreateForm(TfrmCreator, frmCreator);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmFileConflict, frmFileConflict);
  Application.Run;
end.
