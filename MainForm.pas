unit MainForm;

interface

uses
  VirtualTrees,
  Types, Messages, Classes, Graphics, Controls, Forms, SysUtils,
  Dialogs, StdCtrls, ImgList, ExtCtrls, XPMan, FileCtrl, ComCtrls, Menus;

type
  TfrmMain = class(TForm)
    imlFileTree: TImageList;
    pnlButtons: TPanel;
    btnCreate: TButton;
    opdFileAny: TOpenDialog;
    opdPXML: TOpenDialog;
    opdIcon: TOpenDialog;
    sadPND: TSaveDialog;
    grbLog: TGroupBox;
    redLog: TRichEdit;
    opdPND: TOpenDialog;
    menMain: TMainMenu;
    menMainFile: TMenuItem;
    menMainHelp: TMenuItem;
    menMainHelpAbout: TMenuItem;
    menMainFileOpen: TMenuItem;
    pomFiles: TPopupMenu;
    pomFilesOpen: TMenuItem;
    N1: TMenuItem;
    menMainHelpPXML: TMenuItem;
    menMainHelpPND: TMenuItem;
    grbFiles: TGroupBox;
    vstFiles: TVirtualStringTree;
    pnlFilesButtons: TPanel;
    btnFilesClear: TButton;
    btnFilesFolder: TButton;
    btnFilesFile: TButton;
    cbxRecursive: TCheckBox;
    pnlFilesInfo: TPanel;
    lblFilesSizeLbl: TLabel;
    lblFilesSize: TLabel;
    grbIcon: TGroupBox;
    edtIcon: TEdit;
    btnIconLoad: TButton;
    grbPXML: TGroupBox;
    btnPXMLLoad: TButton;
    edtPXML: TEdit;
    procedure grbLogDblClick(Sender: TObject);
    procedure menMainHelpPNDClick(Sender: TObject);
    procedure menMainHelpPXMLClick(Sender: TObject);
    procedure menMainHelpAboutClick(Sender: TObject);
    procedure vstFilesNodeMoving(Sender: TBaseVirtualTree; Node,
      Target: PVirtualNode; var Allowed: Boolean);
    procedure vstFilesInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure pomFilesOpenClick(Sender: TObject);
    procedure vstFilesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure menMainFileOpenClick(Sender: TObject);
    procedure vstFilesStructureChange(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Reason: TChangeReason);
    procedure vstFilesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCreateClick(Sender: TObject);
    procedure btnFilesFolderClick(Sender: TObject);
    procedure btnFilesFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vstFilesGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure vstFilesHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure vstFilesCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure vstFilesGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vstFilesDragOver(Sender: TBaseVirtualTree;
      Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint;
      Mode: TDropMode; var Effect: Integer; var Accept: Boolean); 
    procedure btnIconLoadClick(Sender: TObject);
    procedure btnPXMLLoadClick(Sender: TObject);
    procedure btnFilesClearClick(Sender: TObject);
  private
    { Copies the tree file-data (represented by the nodes) to the passed folder
      Uses CopyFileEx internally }
    procedure CopyTreeToFolder(Tree : TBaseVirtualTree; const TargetDir : String);
    { Extracts PXML and Icon data (if found) from an already open PND file stream
      and saves them to the passed filenames. Filenames are changed to '' if
      no file has been saved }
    procedure ExtractPNDMetaData(Stream : TFileStream; var PXML : String;
        var Icon : String);
  public
    procedure LogLine(Component: TRichEdit; const TextToAdd : String;
      const Color: TColor = clBlack);
  end;

const
    VERSION : String = '0.1.3';
    BUILD_DATE : String = '01.06.2011';
    LOG_ERROR_COLOR : TColor = clRed;
    LOG_WARNING_COLOR : TColor = $0000AAFF;
    LOG_SUCCESS_COLOR : TColor = clGreen;

var
    frmMain: TfrmMain;

implementation

{$R *.dfm}


    // TODO: Parse PXML, check whether binaries can be found and warn otherwise
    // TODO: Graphical browser and editor for the PXML
    // TODO: Display icon
    // TODO: Ask for overwrite on copy
    // DONE: Open PND
    // DONE: Show total uncompressed size
    // DONE: Clear temp folder on exit and start
    // DONE: Check for write access on start
    // TODO: Function for proper conversion from Windows to Cygwin POSIX path

    // NOTE: PND creation code is in btnCreateClick
    // NOTE: PND read and extraction code is in menMainFileOpenClick

uses
    VSTUtils, FormatUtils, FileUtils,
    {$Ifdef MSWINDOWS}
    VSTDragDrop_win, VSTIcons_win, ShellStuff_win;
    {$Else}
    VSTDragDrop_lin, VSTIcons_lin, ShellStuff_lin;
    {$Endif}

// --- Functions ---------------------------------------------------------------

procedure TfrmMain.CopyTreeToFolder(Tree : TBaseVirtualTree; const TargetDir : String);
var
    Source : String;
    Destination : String;
begin
    CopyTreeData(Tree,Tree.GetFirst(),TargetDir,Source,Destination);
    if CopyFileEx(Source,Destination,false) then
        begin
        LogLine(redLog,'Copied all files to temporary directory '#13#10 + TargetDir,
            LOG_SUCCESS_COLOR);
        end
    else
        begin 
        LogLine(redLog,'An error occurred when copying the files to the temporary ' +
                       'folder ' + #13#10 + TargetDir + #13#10 +
                       'Check whether you have right access to it and no file is ' +
                       'currently in use by another application.' + #13#10 +
                       'The error code was: ' + IntToStr(GetLastError()),
                       LOG_ERROR_COLOR);
        end;
end;

procedure TfrmMain.ExtractPNDMetaData(Stream : TFileStream; var PXML : String;
    var Icon : String);
const
    Header : String = '<?xml';
    FallbackHeader : String = '<PXML';
    Footer : String = '</PXML>';
var
    OutputStream : TFileStream;
    Pos : Int64; 
    NumRead, NumWrite : Word;
    Buffer : Array [Word] of Byte;
begin
    // find PXML data
    LogLine(redLog,'Looking for PXML data...');
    Pos := FindStringDataInStream(Header,Stream,0,true);
    if Pos = -1 then
    begin
        Pos := FindStringDataInStream(FallbackHeader,Stream,0,true);
        if Pos = -1 then
        begin
            LogLine(redLog,'No PXML data found!',LOG_ERROR_COLOR);
            PXML := '';
            Icon := '';
            Exit;
        end else
            LogLine(redLog,'PXML file missing proper xml header, you should fix ' +
                           'that, check the PXML specification for details',
                LOG_WARNING_COLOR);
    end;
    // write PXML data to a file
    LogLine(redLog,'PXML data found, writing to file ' + PXML);
    OutputStream := TFileStream.Create(PXML,fmCreate);
    try
        Pos := FindStringDataInStream(Footer,Stream,Pos,false,OutputStream);
    finally
        OutputStream.Free;
    end;

    // search for PNG header and extract PND data
    // TODO: Search for other image types, too
    Pos := FindStringDataInStream(Chr(137) + 'PNG',Stream,Pos);
    if Pos <> -1 then
    begin
        LogLine(redLog,'Icon data found, writing to file ' + Icon);
        OutputStream := TFileStream.Create(Icon,fmCreate);
        try
            Stream.Seek(Pos,soFromBeginning);
            repeat
                NumRead := Stream.Read(Buffer,SizeOf(Buffer));
                NumWrite := OutputStream.Write(Buffer,NumRead);
            until (NumRead = 0) OR (NumRead <> NumWrite);
        finally
            OutputStream.Free;
        end;
    end else
    begin
        LogLine(redLog,'No icon data found in PND',LOG_WARNING_COLOR);
        Icon := '';
    end;

    LogLine(redLog,'PND metadata successfully extracted',LOG_SUCCESS_COLOR);
end;

procedure TfrmMain.LogLine(Component: TRichEdit; const TextToAdd : String;
    const Color: TColor = clBlack);
var
    Count : Integer;
begin
    Count := Length(Component.Text);
    Component.Lines.Add(TextToAdd);
    Component.SelStart := count;
    Component.SelLength := Length(Component.Text) - Component.SelStart;
    Component.SelAttributes.Color := Color;
end;

// --- Menu --------------------------------------------------------------------

procedure TfrmMain.menMainFileOpenClick(Sender: TObject);
const
    TEMP_PATH : String = 'temp2'; // Relative path (from the .exe) to the temporary folder
    META_PATH : String = 'meta'; // Relative path to the meta folder (for PXML and Icon)
    UNSQUASHFS_PATH : String = 'tools\unsquashfs.exe';
    PXML_PATH : String = 'PXML.xml';
    ICON_PATH : String = 'icon.png';
var
    Stream : TFileStream;
    PXML, Icon, Prog, Param : String;
begin
    // error checking
    Prog := ExtractFilePath(Application.ExeName) + UNSQUASHFS_PATH;
    if not FileExists(Prog) then
    begin
        MessageDlg('The squashFS tools could not be found!'#13#10 +
        'Please make sure they are located in the ''tools'' folder next to the ' +
        'program executable.',mtError,[mbOK],0);
        Exit;
    end;
    if vstFiles.GetFirst <> nil then
    begin
        if MessageDlg('Opening a PND will clear your current file-tree. Proceed?',
           mtWarning,[mbYes,mbNo],0) = mrNo then
            Exit;
    end;

    if not opdPND.Execute then
        Exit;

    // clean-up
    vstFiles.Clear;
    edtPXML.Clear;
    edtIcon.Clear;     
    LogLine(redLog,'Deleting old temporary files');
    Param := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName) + META_PATH);
    PXML := Param + PXML_PATH;
    Icon := Param + ICON_PATH;
    DeleteFileEx(PXML);
    DeleteFileEx(Icon); 
    Param := ExtractFilePath(Application.ExeName) + TEMP_PATH;
    DeleteFileEx(Param);
    CreateDir(Param);
    CreateDir(ExtractFilePath(Application.ExeName) + META_PATH);

    // extract PXML and Icon
    Stream := TFileStream.Create(opdPND.FileName,fmOpenRead);
    try
        ExtractPNDMetaData(Stream,PXML,ICON);
    finally
        Stream.Free;
    end;

    // Unsquash the PND
    LogLine(redLog,'Extracting PND... this might take a while');
    Param := '-f -d "' + ConvertPath(TEMP_PATH) + '" "' + ConvertPath(opdPND.FileName) + '"';
    LogLine(redLog,'Calling program: ' + Prog + ' ' + Param);
    if not ExecuteProgram(Prog,Param) then
    begin
        MessageDlg('Encountered an error while extracting PND' + #13#10 +
            'Error code: ' + IntToStr(GetLastError),mtError,[mbOK],0);
        Exit;
    end;

    LogLine(redLog,'Adding files to tree, this might take a while...');

    // add files to tree
    vstFiles.BeginUpdate;
    try
        AddFolder(vstFiles,nil,ExtractFilePath(Application.ExeName) + TEMP_PATH,true);
    finally
        vstFiles.EndUpdate;
    end;
    vstFiles.SortTree(0,vstFiles.Header.SortDirection);
    edtPXML.Text := PXML;
    edtIcon.Text := Icon;
    if vstFiles.GetFirst = nil then
        LogLine(redLog,'No files have been added, this most likely is due to an ' +
                       'error while extracting the PND',LOG_ERROR_COLOR)
    else
        LogLine(redLog,'PND successfully extracted to ' +
            ExtractFilePath(Application.ExeName) + TEMP_PATH,LOG_SUCCESS_COLOR);
end;

procedure TfrmMain.menMainHelpAboutClick(Sender: TObject);
begin
    MessageDlg('PNDTools' + #13#10 +
               'Created by Janek Schäfer (foxblock)' + #13#10 +
               'Using Cygwin and SquashFStools',
               mtInformation,[mbOk],0);
end;

procedure TfrmMain.menMainHelpPNDClick(Sender: TObject);
begin
    ExecuteProgram('http://pandorawiki.org/PND_quickstart','','','open',false);
end;

procedure TfrmMain.menMainHelpPXMLClick(Sender: TObject);
begin
    ExecuteProgram('http://pandorawiki.org/PXML_specification','','','open',false);
end;

// --- Popup Menu --------------------------------------------------------------

procedure TfrmMain.pomFilesOpenClick(Sender: TObject);
var
    Node : PVirtualNode;
    PData : PFileTreeData;
begin
    Node := vstFiles.GetFirstSelected();
    PData := vstFiles.GetNodeData(Node);
    if IsFile(vstFiles,Node) then
        ExecuteProgram(PData.Name,'','','open',false)
    else                                             
        ExecuteProgram(PData.Name,'','','explore',false);
end;

// --- Form --------------------------------------------------------------------

procedure TfrmMain.FormCreate(Sender: TObject);
const
    TEST_FILE_NAME : String = 'asdftestxyz.txt';
var
    dummy : TDragEvent;
    F : File;
begin
    // Check for write access by writing dummy file
    try
        AssignFile(F,TEST_FILE_NAME);
        ReWrite(F);
        CloseFile(F);
        DeleteFileEx(TEST_FILE_NAME);
    except
        on E : Exception do
        begin
            MessageDlg('You do not have permission to write files in the folder ' +
                       'the program is located in'#13#10 +
                       'This functionality is mandatory for the program to work ' +
                       'properly'#13#10#13#10 +
                       'You can either move the program to a directory you have ' +
                       'write-access to (any except for the Programs, ' +
                       'Windows and User-folder should work) or run the program ' +
                       'as Administrator (Right-click -> Run as Administrator).' +
                       #13#10#13#10 + 'The Program will now exit.',mtError,[mbOk],1);
            Application.Terminate;
        end;
    end;

    vstFiles.NodeDataSize := sizeof(rFileTreeData);
    vstFiles.OnDragDrop := dummy.VSTDragDrop;
    LoadSystemIcons(imlFileTree);
    Caption := Caption + ' [Version ' + VERSION + ' built ' + BUILD_DATE + ']';
end;

procedure TfrmMain.grbLogDblClick(Sender: TObject);
var
    C : TControl;
begin
    C := (Sender as TControl);
    if C.Height = C.Constraints.MinHeight then
        C.Height := C.Constraints.MaxHeight
    else
        C.Height := C.Constraints.MinHeight;
    C.Top := pnlButtons.Top - C.Height;
end;

// --- Files Tree --------------------------------------------------------------

procedure TfrmMain.vstFilesCompareNodes(Sender: TBaseVirtualTree; Node1,
    Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
    PData1, PData2 : PFileTreeData;
begin
    PData1 := Sender.GetNodeData(Node1);
    PData2 := Sender.GetNodeData(Node2);
    if Column = 0 then
    begin
        if (PData1.Attr and faDirectory > 0) XOR (PData2.Attr and faDirectory > 0) then
        begin
            if (PData1.Attr and faDirectory > 0) then
                Result := -1
            else
                Result := 1;
        end else
        {$Ifdef MSWINDOWS}
            Result := CompareText(ExtractFileName(PData1.Name), ExtractFileName(PData2.Name));
        {$Else}
            Result := CompareStr(ExtractFileName(PData1.Name), ExtractFileName(PData2.Name));
        {$Endif}
    end else
    if Column = 1 then
    begin
        if PData1.Size > PData2.Size then
            Result := 1
        else
            Result := -1
    end;
end;

procedure TfrmMain.vstFilesDragOver(Sender: TBaseVirtualTree;
    Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint;
    Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
begin
     Accept := true;
end;

procedure TfrmMain.vstFilesGetImageIndex(Sender: TBaseVirtualTree;
    Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
    var Ghosted: Boolean; var ImageIndex: Integer);
var
    PData : PFileTreeData;  
begin
    if (Column <> 0) OR (Kind = ikOverlay) then
        Exit;
               
    PData := Sender.GetNodeData(Node);
    if Sender.Expanded[Node] then
        ImageIndex := PData.OpenIndex
    else
        ImageIndex := PData.ClosedIndex;
end;

procedure TfrmMain.vstFilesGetText(Sender: TBaseVirtualTree;
    Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
    var CellText: WideString);
var
    PData : PFileTreeData;
begin
    PData := Sender.GetNodeData(Node);
    case Column of
        0 : CellText := ExtractFileName(PData.Name);
        1 : begin
            if (PData.Attr and faDirectory = 0) then
                CellText := SizeToStr(PData.Size)
            else
                CellText := '';
            end;
        2 : CellText := PData.Name;
    end;
end;

procedure TfrmMain.vstFilesHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Sender.SortColumn = Column then
    begin
        if Sender.SortDirection=sdAscending then
            Sender.SortDirection:=sdDescending
        else
            Sender.SortDirection:=sdAscending;
    end else
        Sender.SortColumn := Column;
    Sender.Treeview.SortTree(Column,Sender.SortDirection,True);
end;

procedure TfrmMain.vstFilesInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
    PData : PFileTreeData;
begin
    PData := Sender.GetNodeData(Node);
    PData.ClosedIndex := GetIconIndex(PData.Name,false);
    PData.OpenIndex := GetIconIndex(PData.Name,true);
end;

procedure TfrmMain.vstFilesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        46 : // Entf
        begin
            vstFiles.DeleteSelectedNodes;
        end;    
    end;
end;

procedure TfrmMain.vstFilesMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Node : PVirtualNode;
begin
    if Button = mbRight then
    begin
        Node := (Sender as TBaseVirtualTree).GetNodeAt(X,Y);
        if Node <> nil then
        begin
            (Sender as TBaseVirtualTree).ClearSelection;
            (Sender as TBaseVirtualTree).Selected[Node] := true;
            pomFiles.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        end;
    end;
end;

procedure TfrmMain.vstFilesNodeMoving(Sender: TBaseVirtualTree; Node,
  Target: PVirtualNode; var Allowed: Boolean);
var
    PData : PFileTreeData;
begin
    PData := Sender.GetNodeData(Node);
    Allowed := (CheckForExistance(Sender,Sender.GetFirstChild(Target),
        ExtractFileName(PData.Name)) = nil);
end;

procedure TfrmMain.vstFilesStructureChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Reason: TChangeReason);
begin
    lblFilesSize.Caption := SizeToStr(CalculateTotalSize(vstFiles));
end;

// --- Buttons -----------------------------------------------------------------

procedure TfrmMain.btnCreateClick(Sender: TObject);
const                      
    TEMP_PATH : String = 'temp'; // Relative path (from the .exe) to the temporary folder
    MKSQUASH_PATH : String = 'tools\mksquashfs.exe'; // Path to mkquashfs
    CHMOD_PATH : String =    'tools\chmod.exe';      // Path to cygwin's chmod
var
    Prog, Param : String;
    PNDFile : TFileStream;
    Return : Integer;
    NoPXML : Boolean;
begin
    // error checking
    if not FileExists(ExtractFilePath(Application.ExeName) + MKSQUASH_PATH) OR
        not FileExists(ExtractFilePath(Application.ExeName) + CHMOD_PATH) then
    begin
        MessageDlg('The squashFS or chmod tools could not be found!'#13#10 +
        'Please make sure they are located in the ''tools'' folder next to the ' +
        'program executable.',mtError,[mbOK],0);
        Exit;
    end;
    if vstFiles.GetFirst() = nil then
    begin
        MessageDlg('No files added to the PND!',mtError,[mbOK],0);
        Exit;
    end;
    NoPXML := false;
    if (edtPXML.Text = '') OR (not FileExists(edtPXML.Text)) then
    begin
        Return := MessageDlg('No PXML file was specified or the entered filename ' +
            'could not be loaded!'#13#10 +
            'This file is mandatory for the PND to work!',
            mtWarning,[mbAbort,mbIgnore],0);
        if Return = mrAbort then
            Exit;
        NoPXML := true;
    end;
    if not sadPND.Execute then
        Exit;

    // temporary data handling
    Param := ExtractFilePath(Application.ExeName) + TEMP_PATH;
    LogLine(redLog,'Deleting old temporary files');
    DeleteFileEx(Param);  // clean-up
    LogLine(redLog,'Copying new temporary files to folder ' + Param + ' - This may ' +
                   'take a while.');
    CopyTreeToFolder(vstFiles,Param);

    // set corrent file flags to work on the Pandora
    Prog := ExtractFilePath(Application.ExeName) + CHMOD_PATH;
    Param := '-R 755 "' + ConvertPath(TEMP_PATH) + '/"';
    LogLine(redLog,'Calling program: ' + Prog + ' ' + Param);
    if not ExecuteProgram(Prog,Param) then
    begin
        MessageDlg('Encountered an error while trying to set file flags' + #13#10 +
            'Error code: ' + IntToStr(GetLastError),mtError,[mbOK],0);
        Exit;
    end;

    // Make the squashFS filesystem from the temporary files
    Prog := ExtractFilePath(Application.ExeName) + MKSQUASH_PATH;
    Param := '"' + ConvertPath(TEMP_PATH) + '" "' + ConvertPath(sadPND.FileName) + '" -noappend';
    LogLine(redLog,'Calling program: ' + Prog + ' ' + Param);
    if not ExecuteProgram(Prog,Param) then
    begin
        MessageDlg('Encountered an error while creating SquashFS archive' + #13#10 +
            'Error code: ' + IntToStr(GetLastError),mtError,[mbOK],0);
        Exit;
    end;

    // append PXML and icon
    LogLine(redLog,'Appending icon and PXML data (if found).');
    PNDFile := TFileStream.Create(sadPND.FileName,fmOpenReadWrite);
    try
        if not NoPXML then  
            AppendDataToFileStream(PNDFile,edtPXML.Text)
        else
            LogLine(redLog,'Creating PND without PXML data (you should not do this!)',
                LOG_WARNING_COLOR); 
        if (edtIcon.Text <> '') AND FileExists(edtIcon.Text) then
            AppendDataToFileStream(PNDFile,edtIcon.Text)
        else
            LogLine(redLog,'No icon found or icon could not be accessed',
                LOG_WARNING_COLOR);
    finally
        PNDFile.Free;
    end;
    LogLine(redLog,'PND created successfully: ' + sadPND.FileName,LOG_SUCCESS_COLOR);
end;

procedure TfrmMain.btnFilesClearClick(Sender: TObject);
begin
    vstFiles.Clear; 
end;

procedure TfrmMain.btnFilesFileClick(Sender: TObject);
var
    I : Integer;
begin
    if opdFileAny.Execute then
    begin
        for I := 0 to opdFileAny.Files.Count - 1 do
            AddItem(vstFiles,vstFiles.GetFirstSelected(false),opdFileAny.Files[I]);
        vstFiles.SortTree(0,vstFiles.Header.SortDirection);
    end;
end;

procedure TfrmMain.btnFilesFolderClick(Sender: TObject);
var
    Dir : String;
begin
    // TODO: Yeah I guess this is not exactly cross-platform safe...
    SelectDirectory('Select a directory to add','',Dir);
    if Dir <> '' then
    begin
        vstFiles.BeginUpdate;
        try
            AddItem(vstFiles,vstFiles.GetFirstSelected(),Dir,cbxRecursive.Checked);
        finally
            vstFiles.EndUpdate;
        end;
        vstFiles.SortTree(0,vstFiles.Header.SortDirection);
    end;
end;

procedure TfrmMain.btnIconLoadClick(Sender: TObject);
begin
    if opdIcon.Execute then
        edtIcon.Text := opdIcon.FileName;
end;

procedure TfrmMain.btnPXMLLoadClick(Sender: TObject);
begin
    if opdPXML.Execute then
        edtPXML.Text := opdPXML.FileName;
end;

end.
