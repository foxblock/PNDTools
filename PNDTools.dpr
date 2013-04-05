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
  FileSelectForm in 'FileSelectForm.pas' {frmFileSelect},
  GraphicUtils in 'GraphicUtils.pas',
  AboutForm in 'AboutForm.pas' {frmAbout},
  FileConflictForm in 'FileConflictForm.pas' {frmFileConflict};

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
