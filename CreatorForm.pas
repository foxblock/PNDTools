unit CreatorForm;

interface

uses
  Messages, Classes, Graphics, Controls, Forms, Dialogs, Spin, ComCtrls,
  StdCtrls, ExtCtrls, GraphicEx, Types, XMLDoc, XMLIntf,
  InputFilterFunctions;

type
  TfrmCreator = class(TForm)
    pgcMain: TPageControl;
    pgcMain3: TTabSheet;
    pgcMain4: TTabSheet;
    pgcMain1: TTabSheet;
    pgcMain6: TTabSheet;
    pgcMain5: TTabSheet;
    pgcMain2: TTabSheet;
    cobCategory: TComboBox;
    cobSubcategory: TComboBox;
    edtTitle: TEdit;
    lblCategory: TLabel;
    lblDescription: TLabel;
    lblExe: TLabel;
    lblSubcategory: TLabel;
    lblTitle: TLabel;
    memDescription: TMemo;
    pnlExe: TPanel;
    edtExe: TEdit;
    btnExe: TButton;
    edtMail: TEdit;
    edtName: TEdit;
    edtWebsite: TEdit;
    grbAppAuthor: TGroupBox;
    lblAppAuthor: TLabel;
    lblAppWebsite: TLabel;
    lblAppMail: TLabel;
    edtAppAuthor: TEdit;
    edtAppWebsite: TEdit;
    edtAppMail: TEdit;
    lblMail: TLabel;
    lblName: TLabel;
    lblWebsite: TLabel;
    memAuthorHelp: TMemo;
    grbLicense: TGroupBox;
    lblLicense: TLabel;
    lblLicenseURL: TLabel;
    lblSourceURL: TLabel;
    edtLicenseURL: TEdit;
    edtSourceURL: TEdit;
    memLicenseHelp: TMemo;
    cobLicense: TComboBox;
    pnlButtons: TPanel;
    btnNext: TButton;
    btnCancel: TButton;
    cbxPort: TCheckBox;
    memHello: TMemo;
    lblErrors: TLabel;
    redErrors: TRichEdit;
    grbScreenshots: TGroupBox;
    grbIcon: TGroupBox;
    pnlIcon: TPanel;
    lblIcon: TLabel;
    pnlIconPath: TPanel;
    edtIcon: TEdit;
    btnIcon: TButton;
    lblIconInfo: TLabel;
    memScreenshotsHelp: TMemo;
    opdIcon: TOpenDialog;
    scbScreenshots: TScrollBox;
    pnlScreenButtons: TPanel;
    btnScreenAdd: TButton;
    imgIcon: TImage;
    btnPrev: TButton;
    btnRemove: TButton;
    grbExeSettings: TGroupBox;
    cbxExeSettings: TCheckBox;
    lblStartdir: TLabel;
    edtArguments: TEdit;
    lblArguments: TLabel;
    grbVersion: TGroupBox;
    pnlVMajor: TPanel;
    lblVMajor: TLabel;
    spbVMajor: TSpinButton;
    edtVMajor: TEdit;
    pnlVMinor: TPanel;
    lblVMinor: TLabel;
    spbVMinor: TSpinButton;
    edtVMinor: TEdit;
    pnlVRelease: TPanel;
    lblVRelease: TLabel;
    spbVRelease: TSpinButton;
    edtVRelease: TEdit;
    pnlVBuild: TPanel;
    lblVBuild: TLabel;
    spbVBuild: TSpinButton;
    edtVBuild: TEdit;
    pnlVType: TPanel;
    lblVType: TLabel;
    cobVType: TComboBox;
    sadPXML: TSaveDialog;
    memDetailsHelp: TMemo;
    grbInfo: TGroupBox;
    lblInfoFile: TLabel;
    Panel1: TPanel;
    edtInfoFile: TEdit;
    btnInfoFile: TButton;
    lblInfoName: TLabel;
    edtInfoName: TEdit;
    grbAdvanced: TGroupBox;
    lblID: TLabel;
    lblAppdata: TLabel;
    edtID: TEdit;
    memAdvancedHelp: TMemo;
    cbxAdvanced: TCheckBox;
    memIDHelp: TMemo;
    edtAppdata: TEdit;
    memAppdataHelp: TMemo;
    memInfo: TMemo;
    pnlStartdir: TPanel;
    edtStartdir: TEdit;
    btnStartdir: TButton;
    procedure btnStartdirClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure cbxExeSettingsClick(Sender: TObject);
    procedure btnScreenAddClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnIconClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure edtIconExit(Sender: TObject);
    procedure cbxAdvancedClick(Sender: TObject);
    procedure cobLicenseChange(Sender: TObject);
    procedure spbVMajorUpClick(Sender: TObject);
    procedure spbVMajorDownClick(Sender: TObject);
    procedure cobCategoryChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbxPortClick(Sender: TObject);
  private
    procedure ChangeVersionNumber(Target: TCustomEdit; const Delta: Integer);
    procedure AddError(const TextToAdd : String; const Color: TColor = clBlack);
    procedure CheckForErrors;
    procedure SavePXMLFile(const Filename : String);
  public
    { Public declarations }
  end;

  TScreenshotPanel = class (TCustomPanel)
    imgScreenshot: TImage;
    pnlText: TPanel;
    pnlButtons: TPanel;
    lblPath: TLabel;
    lblSize: TLabel;
    btnRemove: TButton;
    btnMoveUp: TButton;
    btnMoveDown: TButton;
    procedure btnRemoveClick(Sender: TObject);
    procedure btnMoveUpClick(Sender: TObject);
    procedure btnMoveDownClick(Sender: TObject); 
  private
    pFilepath : String;
  public
    constructor Create(AOwner : TComponent); overload;
    constructor Create(const Filepath: String); overload;
    property Filepath : String read pFilepath;
  end;

  TStringPair = class
      S1 : String;
      S2 : String;
  end;

const                   
    LOG_ERROR_COLOR : TColor       = clRed;
    LOG_WARNING_COLOR : TColor     = $0000AAFF;
    LOG_SUCCESS_COLOR : TColor     = clGreen;
    CATEGORIES_FILE : String       = 'tools\Categories.txt';
    LICENSES_FILE   : String       = 'tools\Licenses.txt';
    PXML_NAMESPACE : String        = 'http://openpandora.org/namespaces/PXML';

var
  frmCreator: TfrmCreator;
  InputFilter: TInputFilters;

implementation

uses {$Ifdef Win32}ControlHideFix,{$Endif} MainForm, StrUtils, SysUtils;

{$R *.dfm}

procedure TfrmCreator.ChangeVersionNumber(Target: TCustomEdit; const Delta: Integer);
var temp : Integer;
begin
    // TODO: Extract numbers from Strings with letters also
    try
        temp := StrToInt(Target.Text);
    except
        Exit;
    end;
    if (temp > 0) OR ((Target.Text = '0') AND (Delta > 0)) then
        Target.Text := IntToStr(temp+Delta);
end;

procedure TfrmCreator.AddError(const TextToAdd : String; const Color: TColor = clBlack);
var
    Count : Integer;
begin
    Count := Length(redErrors.Text);
    redErrors.Lines.Add(TextToAdd);
    redErrors.SelStart := count;
    redErrors.SelLength := Length(redErrors.Text) - redErrors.SelStart;
    redErrors.SelAttributes.Color := Color;
    redErrors.ClearSelection;
end;

procedure TfrmCreator.CheckForErrors;
begin         
    redErrors.Clear;
    // Page 2
    if (Length(edtName.Text) = 0) then
        AddError('Invalid or no author name specified!',LOG_ERROR_COLOR);
    if (cbxPort.Checked) AND (Length(edtAppAuthor.Text) = 0) then
        AddError('Invalid or no name for the application author entered!',LOG_ERROR_COLOR);
    // Page 3
    if (Length(edtTitle.Text) = 0) then
        AddError('Invalid or no title set!',LOG_ERROR_COLOR);  
    if Length(edtExe.Text) = 0 then
        AddError('No executable specified!',LOG_ERROR_COLOR)
    else if not FileExists(edtExe.Text) then
        AddError('The selected executable does not exist!',LOG_ERROR_COLOR);
    if Length(cobCategory.Text) = 0 then
        AddError('No category specified!',LOG_ERROR_COLOR);
    if Length(cobSubcategory.Text) = 0 then
        AddError('No sub-category set!',LOG_ERROR_COLOR);
    // Page 4
    if Length(edtIcon.Text) = 0 then
        AddError('No icon specified!',LOG_ERROR_COLOR)
    else if not FileExists(edtIcon.Text) then
        AddError('The specified icon does not exist!',LOG_ERROR_COLOR); 
    // Page 5
    if Length(cobLicense.Text) = 0 then
        AddError('No license set!',LOG_ERROR_COLOR);
    if cbxAdvanced.Checked then
    begin
        if Length(edtID.Text) = 0 then
            AddError('Invalid ID entered!',LOG_ERROR_COLOR);
        if Length(edtAppdata.Text) = 0 then
            AddError('Invalid appdata directory entered!',LOG_ERROR_COLOR);
    end;
    

    if redErrors.Lines.Count = 0 then
    begin
        AddError('All valid, good job! The PXML can now be created by pressing the ''Finish'' button at the bottom.',LOG_SUCCESS_COLOR);
        btnNext.Enabled := true;
    end else
    begin  
        AddError('You need to go back and fix these errors before the PXML can be created.',LOG_ERROR_COLOR);
        btnNext.Enabled := false;
    end;
end;

procedure TfrmCreator.SavePXMLFile(const Filename: string);

    function CreateNode(Name : String; Parent : IXMLNode) : IXMLNode;
    begin
        Result := Parent.AddChild(Name,PXML_NAMESPACE);
    end;

    // A few "makros" for data used in both package and application nodes
    procedure SetAuthorInfo(Node : IXMLNode; const Name, Website, Mail : TCustomEdit);
    begin
        Node.Attributes['name'] := Name.Text;
        if Length(Website.Text) > 0 then
            Node.Attributes['website'] := Website.Text;
        if Length(Mail.Text) > 0 then
            Node.Attributes['email'] := Mail.Text;
    end;
    procedure SetVersionInfo(Node : IXMLNode);
    begin
        Node.Attributes['major'] := edtVMajor.Text;
        Node.Attributes['minor'] := edtVMinor.Text;
        Node.Attributes['release'] := edtVRelease.Text;
        Node.Attributes['build'] := edtVBuild.Text;
        if Length(cobVType.Text) > 0 then
            Node.Attributes['type'] := cobVType.Text;
    end;
    procedure SetTitleDescrInfo(Node : IXMLNode);
    var temp : IXMLNode;
    begin
        temp := CreateNode('title',CreateNode('titles',Node));
        temp.Attributes['lang'] := 'en_EN';
        temp.NodeValue := edtTitle.Text;
        temp := CreateNode('description',CreateNode('descriptions',Node));
        temp.Attributes['lang'] := 'en_EN';
        temp.NodeValue := memDescription.Text;
    end;

var Doc : IXMLDocument;
    temp, packNode, appNode, pxmlNode : IXMLNode;
    tempEdit : TCustomEdit;
    I : Integer;
begin
    try
        Doc := NewXMLDocument('1.0');
        if Doc.Active then
        begin     
            Doc.Encoding := 'UTF-8';
            Doc.Options := [doNodeAutoCreate,doNodeAutoIndent];
            pxmlNode := Doc.AddChild('PXML',PXML_NAMESPACE);

            // package
            packNode := CreateNode('package',pxmlNode);
            packNode.Attributes['id'] := edtID.Text;

            SetAuthorInfo(CreateNode('author',packNode),edtName,edtWebsite,edtMail);
            SetVersionInfo(CreateNode('version',packNode));
            SetTitleDescrInfo(packNode);
            temp := CreateNode('icon',packNode);
            temp.Attributes['src'] := edtIcon.Text;

            // application
            appNode := CreateNode('application',pxmlNode);
            appNode.Attributes['id'] := edtID.Text;
            if Length(edtAppdata.Text) > 0 then
                appNode.Attributes['appdata'] := edtAppdata.Text;
            temp := CreateNode('exec',appNode);
            temp.Attributes['command'] := edtExe.Text;
            if cbxExeSettings.Checked then
            begin
                if Length(edtArguments.Text) > 0 then
                    temp.Attributes['arguments'] := edtArguments.Text;
                if Length(edtStartdir.Text) > 0 then
                    temp.Attributes['startdir'] := edtStartdir.Text;
            end;
            temp := CreateNode('author',appNode);
            if cbxPort.Checked then
            begin
                SetAuthorInfo(temp,edtAppAuthor,edtAppWebsite,edtAppMail);
            end else
            begin
                SetAuthorInfo(temp,edtName,edtWebsite,edtMail);
            end;
            SetVersionInfo(CreateNode('version',appNode));
            SetTitleDescrInfo(appNode);
            temp := Doc.CreateNode('Extra block for compatibility with OS versions before HF6',ntComment);
            appNode.ChildNodes.Add(temp);
            temp := CreateNode('title',appNode);
            temp.Attributes['lang'] := 'en_EN';
            temp.NodeValue := edtTitle.Text;
            temp := CreateNode('description',appNode);
            temp.Attributes['lang'] := 'en_EN';
            temp.NodeValue := memDescription.Text;  
            temp := Doc.CreateNode('END Extra block',ntComment);
            appNode.ChildNodes.Add(temp);
            temp := CreateNode('icon',appNode);
            temp.Attributes['src'] := edtIcon.Text;
            temp := CreateNode('license',CreateNode('licenses',appNode));
            temp.Attributes['name'] := cobLicense.Text;
            if Length(edtLicenseURL.Text) > 0 then
                temp.Attributes['url'] := edtLicenseURL.Text;
            if Length(edtSourceURL.Text) > 0 then
                temp.Attributes['sourcecodeurl'] := edtSourceURL.Text;
            temp := CreateNode('previewpics',appNode);
            // TODO: Implement datastructure for ordered previewpics
            for I := 0 to scbScreenshots.ControlCount - 1 do
                CreateNode('previewpix',temp).Attributes['src'] :=
                    (scbScreenshots.Controls[I] as TScreenshotPanel).Filepath;
            if (Length(edtInfoFile.Text) > 0) AND (Length(edtInfoName.Text) > 0) then
            begin
                temp := CreateNode('info',appNode);
                temp.Attributes['name'] := edtInfoName.Text;
                if (ExtractFileExt(edtInfoFile.Text) = '.htm') OR (ExtractFileExt(edtInfoFile.Text) = '.html') then
                    temp.Attributes['type'] := 'text/html'
                else
                    temp.Attributes['type'] := 'text/plain';
                temp.Attributes['src'] := edtInfoFile.Text;
            end;
            temp := CreateNode('category',CreateNode('categories',appNode));
            temp.Attributes['name'] := cobCategory.Text;
            temp := CreateNode('subcategory',temp);
            temp.Attributes['name'] := cobSubcategory.Text;

            Doc.SaveToFile(Filename);
            Doc.Active := false;
        end else
            raise EReadError.Create('Failed loading the default PXML framework file, ' +
                'please reinstall the program.');
    except
        on E : Exception do
        begin
            frmMain.LogLine('Error creating the PXML file: ' + E.ClassName + ' - ' +
                E.Message, LOG_ERROR_COLOR);   
            Doc.Active := false;
        end;
    end;
end;

// --- Form --------------------------------------------------------------------

procedure TfrmCreator.FormCreate(Sender: TObject);
var dummy : TButtonEvent;
begin
    edtMail.OnKeyPress := InputFilter.EmailKeyPress;
    edtAppMail.OnKeyPress := InputFilter.EmailKeyPress;
    edtID.OnKeyPress := InputFilter.IDKeyPress;
    edtVMajor.OnKeyPress := InputFilter.VersionKeyPress;
    edtVMinor.OnKeyPress := InputFilter.VersionKeyPress;
    edtVRelease.OnKeyPress := InputFilter.VersionKeyPress;
    edtVBuild.OnKeyPress := InputFilter.VersionKeyPress;
    edtAppdata.OnKeyPress := InputFilter.FolderKeyPress;
    {$Ifdef Win32}  
    KeyPreview := true;
    OnKeyDown := dummy.KeyDown;
    {$Endif}
end;

procedure TfrmCreator.FormShow(Sender: TObject);
var F : TextFile;
    S : String;
    P : TStringPair;
begin
    // Fill Category drop-down
    cobCategory.Clear;
    try
        AssignFile(F,ExtractFilePath(Application.ExeName) + CATEGORIES_FILE);
        Reset(F);
        while not EOF(F) do
        begin
            P := TStringPair.Create;
            ReadLn(F,S);
            P.S1 := S;
            ReadLn(F,S); // Sub-categories
            P.S2 := S;
            cobCategory.Items.AddObject(P.S1,P);
        end;
    finally
        CloseFile(F);
    end;
    // Fill license preset drop-down
    cobLicense.Clear;
    try
        AssignFile(F,ExtractFilePath(Application.ExeName) + LICENSES_FILE);
        Reset(F);
        while not EOF(F) do
        begin
            P := TStringPair.Create;
            ReadLn(F,S);
            P.S1 := S;         
            ReadLn(F,S); // License URL
            P.S2 := S;
            cobLicense.Items.AddObject(P.S1,P);
        end;
    finally
        CloseFile(F);
    end;
end;

// --- Buttons -----------------------------------------------------------------

procedure TfrmCreator.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCreator.btnIconClick(Sender: TObject);
begin
    if opdIcon.Execute then
    begin
        edtIcon.Text := opdIcon.FileName;
        edtIconExit(Sender);
    end;
end;

procedure TfrmCreator.btnNextClick(Sender: TObject);
begin
    if pgcMain.ActivePageIndex < pgcMain.PageCount-1 then
    begin
        pgcMain.ActivePageIndex := pgcMain.ActivePageIndex + 1;
        pgcMainChange(Sender);
    end else
    begin
        if sadPXML.Execute then
            SavePXMLFile(sadPXML.Filename);
    end;
end;

procedure TfrmCreator.btnPrevClick(Sender: TObject);
begin
    if pgcMain.ActivePageIndex > 0 then
    begin
        pgcMain.ActivePageIndex := pgcMain.ActivePageIndex - 1;
        pgcMainChange(Sender);
    end;
end;

procedure TfrmCreator.btnRemoveClick(Sender: TObject);
begin
    while scbScreenshots.ControlCount > 0 do
    begin
        (scbScreenshots.Controls[0] as TScreenshotPanel).Free;
    end;
    btnRemove.Enabled := false;
end;

procedure TfrmCreator.btnScreenAddClick(Sender: TObject);
var temp : TScreenshotPanel;
begin
    if opdIcon.Execute then
    begin
        temp := TScreenshotPanel.Create(opdIcon.FileName);
        btnRemove.Enabled := true;
    end;
end;

procedure TfrmCreator.btnStartdirClick(Sender: TObject);
begin

end;

// --- Checkboxes --------------------------------------------------------------

procedure TfrmCreator.cbxAdvancedClick(Sender: TObject);
var I : Integer;
begin
    for I := 0 to grbAdvanced.ControlCount - 1 do
    begin
        if (not (grbAdvanced.Controls[I] is TMemo)) AND (grbAdvanced.Controls[I] <> Sender) then
            grbAdvanced.Controls[I].Enabled := (Sender as TCheckBox).Checked;
    end;
end;

procedure TfrmCreator.cbxPortClick(Sender: TObject);
var I : Integer;
begin
    for I := 0 to grbAppAuthor.ControlCount - 1 do
    begin
        grbAppAuthor.Controls[I].Enabled := (Sender as TCheckBox).Checked;
    end;
end; 

procedure TfrmCreator.cbxExeSettingsClick(Sender: TObject);
var I : Integer;
begin
    for I := 0 to grbExeSettings.ControlCount - 1 do
    begin
        grbExeSettings.Controls[I].Enabled := (Sender as TCheckBox).Checked;
    end;
end;

// --- PageControl -------------------------------------------------------------

procedure TfrmCreator.pgcMainChange(Sender: TObject);

    function IDFormatString(const S : String) : String;
    var I : Integer;
    begin
        Result := S;
        I := 1;
        while I <= Length(Result) do
        begin
            if NOT (Result[I] in ['a'..'z','A'..'Z','0'..'9','-','.','/']) then
                Result := LeftStr(Result,I-1) + RightStr(Result,Length(Result)-I)
            else
                Inc(I);
        end;
    end;

begin
    if pgcMain.ActivePageIndex = 0 then
        btnPrev.Enabled := false
    else
        btnPrev.Enabled := true;
    if pgcMain.ActivePageIndex = 5 then
    begin
        if (Length(edtTitle.Text) > 0) AND (Length(edtName.Text) > 0) AND NOT cbxAdvanced.Checked then
        begin
            edtID.Text := IDFormatString(edtTitle.Text) + '.' + IDFormatString(edtName.Text);
        end;
    end;
    if pgcMain.ActivePageIndex = pgcMain.PageCount-1 then // Finish tab
       btnNext.Caption := 'Finish...'
    else
        begin
        btnNext.Caption := 'Next ->';
        btnNext.Enabled := true;
        Exit;
        end;
                      
    CheckForErrors;
end;

// --- License -----------------------------------------------------------------

procedure TfrmCreator.cobLicenseChange(Sender: TObject);
var S : String;
begin
    edtLicenseURL.Clear;
    if cobLicense.ItemIndex >= 0 then
        S := (cobLicense.Items.Objects[cobLicense.ItemIndex] as TStringPair).S2
    else
        S := '';
    edtLicenseURL.Text := S;
end;

// --- Icon --------------------------------------------------------------------

procedure TfrmCreator.edtIconExit(Sender: TObject);
var temp : TPicture;
begin
    try
        temp := TPicture.Create;
        temp.LoadFromFile(edtIcon.Text);
        imgIcon.Canvas.StretchDraw(Rect(0,0,imgIcon.Width,imgIcon.Height),temp.Graphic);
        lblIconInfo.Caption := UpperCase(ExtractFileExt(edtIcon.Text)) + ', ' +
                               IntToStr(temp.Width) + 'x' + IntToStr(temp.Height);
        temp.Free;
    except
        lblIconInfo.Caption := 'No icon loaded';
        temp.Free;
    end;
end;

// --- Category ----------------------------------------------------------------

procedure TfrmCreator.cobCategoryChange(Sender: TObject);
var S,temp : String;
    L : TStrings;
begin
    temp := cobSubcategory.Text;
    cobSubcategory.Clear;
    // Fill Sub-category drop-down dependant on what Category shows
    if cobCategory.ItemIndex >= 0 then
        S := (cobCategory.Items.Objects[cobCategory.ItemIndex] as TStringPair).S2
    else
        S := '';
    L := TStringList.Create;
    L.Delimiter := '|';
    L.DelimitedText := S;
    cobSubcategory.Items.AddStrings(L);
    cobSubcategory.Text := temp;
end;

// --- Version -----------------------------------------------------------------

procedure TfrmCreator.spbVMajorDownClick(Sender: TObject);
var I : Integer;
begin
    for I := 0 to (Sender as TControl).Parent.ControlCount - 1 do
    begin
        if (Sender as TControl).Parent.Controls[I] is TCustomEdit then
            ChangeVersionNumber(((Sender as TControl).Parent.Controls[I] as TCustomEdit),-1);
    end;
end;

procedure TfrmCreator.spbVMajorUpClick(Sender: TObject);
var I : Integer;
begin
    for I := 0 to (Sender as TControl).Parent.ControlCount - 1 do
    begin
        if (Sender as TControl).Parent.Controls[I] is TCustomEdit then
            ChangeVersionNumber(((Sender as TControl).Parent.Controls[I] as TCustomEdit),1);
    end;
end;

// --- ScreenshotPanel ---------------------------------------------------------

constructor TScreenshotPanel.Create(AOwner : TComponent);
begin
    inherited;
end;

constructor TScreenshotPanel.Create(const Filepath: String);
var temp : TPicture;
begin
    Create(frmCreator);
    pFilepath := Filepath;
    Parent := frmCreator.scbScreenshots;
    Align := alTop;
    Height := 100;
    Caption := '';
    ParentBackground := false;
    imgScreenshot := TImage.Create(Self);
    with imgScreenshot do
    begin
        Align := alLeft;
        AlignWithMargins := true;
        with Margins do
        begin
            Bottom := 4;
            Left := 4;
            Right := 4;
            Top := 4;
        end;
        Width := 150;
        Parent := Self;
    end;
    pnlText := TPanel.Create(Self);
    with pnlText do
    begin
        Align := alClient;
        AlignWithMargins := true; 
        with Margins do
        begin
            Bottom := 0;
            Left := 4;
            Right := 0;
            Top := 0;
        end;
        BevelOuter := bvNone;
        Caption := '';
        ParentColor := true;
        Parent := Self;
    end;
    pnlButtons := TPanel.Create(Self);
    with pnlButtons do
    begin
        Align := alRight;
        BevelOuter := bvNone;
        Caption := '';
        ParentColor := true;
        Parent := Self;
        Width := 33;
    end;
    lblPath := TLabel.Create(Self);
    with lblPath do
    begin
        Parent := pnlText;
        Align := alTop;
        AlignWithMargins := true;
        Caption := Filepath;
        with Margins do
        begin
            Bottom := 0;
            Left := 0;
            Right := 0;
            Top := 34;
        end;
        Font.Style := [];
    end;
    lblSize := TLabel.Create(Self);
    with lblSize do
    begin
        Parent := pnlText;
        Align := alTop;
        AlignWithMargins := true;
        Caption := 'size';
        with Margins do
        begin
            Bottom := 0;
            Left := 0;
            Right := 0;
            Top := 4;
        end;
        Top := 51; 
        Font.Style := [];
    end;
    btnRemove := TButton.Create(Self);
    with btnRemove do
    begin
        Parent := pnlButtons;
        Align := alTop;
        AlignWithMargins := true;
        Caption := 'X';
        Height := 25;
        with Margins do
        begin
            Bottom := 4;
            Left := 4;
            Right := 4;
            Top := 4;
        end;
        TabOrder := 0;
        OnClick := btnRemoveClick;   
        Font.Style := [];
    end;     
    btnMoveDown := TButton.Create(Self);
    with btnMoveDown do
    begin
        Parent := pnlButtons;
        Align := alBottom;
        AlignWithMargins := true;
        Caption := 'v';
        Height := 25;
        with Margins do
        begin
            Bottom := 4;
            Left := 4;
            Right := 4;
            Top := 0;
        end;    
        TabOrder := 2;
        OnClick := btnMoveDownClick;   
        Font.Style := [];
    end;
    btnMoveUp := TButton.Create(Self);
    with btnMoveUp do
    begin
        Parent := pnlButtons;
        Align := alBottom;
        AlignWithMargins := true;
        Caption := '^';
        Height := 25;
        with Margins do
        begin
            Bottom := 0;
            Left := 4;
            Right := 4;
            Top := 4;
        end;     
        TabOrder := 1;
        OnClick := btnMoveUpClick;    
        Font.Style := [];
    end;

    try
        temp := TPicture.Create;
        temp.LoadFromFile(Filepath);
        imgScreenshot.Canvas.StretchDraw(Rect(0,0,imgScreenshot.Width,imgScreenshot.Height),temp.Graphic);
        lblSize.Caption := UpperCase(ExtractFileExt(Filepath)) + ', ' +
                            IntToStr(temp.Width) + 'x' + IntToStr(temp.Height);
        temp.Free;
    except
        lblSize.Caption := 'No icon loaded';
        temp.Free;
    end;
end;

procedure TScreenshotPanel.btnRemoveClick(Sender: TObject);
begin
    if frmCreator.scbScreenshots.ControlCount = 1 then
        frmCreator.btnRemove.Enabled := false;
    Self.Free;
end;

procedure TScreenshotPanel.btnMoveUpClick(Sender: TObject);
begin
    Self.Top := Self.Top - Self.Height;
end;

procedure TScreenshotPanel.btnMoveDownClick(Sender: TObject);
begin
    Self.Top := Self.Top + Self.Height + 1;
end;


end.
