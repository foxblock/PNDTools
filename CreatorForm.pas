unit CreatorForm;

interface

uses
  Messages, Classes, Graphics, Controls, Forms, Dialogs, Spin, ComCtrls,
  StdCtrls, ExtCtrls, SysUtils, GraphicEx, Types,
  InputFilterFunctions;

type
  TfrmCreator = class(TForm)
    pgcMain: TPageControl;
    pgcMain3: TTabSheet;
    pgcMain4: TTabSheet;
    pgcMain1: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    pnlVersion: TPanel;
    lblVersion: TLabel;
    pnlVBuild: TPanel;
    lblVBuild: TLabel;
    spbVBuild: TSpinButton;
    edtVBuild: TEdit;
    pnlVRelease: TPanel;
    lblVRelease: TLabel;
    spbVRelease: TSpinButton;
    edtVRelease: TEdit;
    pnlVMinor: TPanel;
    lblVMinor: TLabel;
    spbVMinor: TSpinButton;
    edtVMinor: TEdit;
    pnlVMajor: TPanel;
    lblVMajor: TLabel;
    spbVMajor: TSpinButton;
    edtVMajor: TEdit;
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
    grbAdvanced: TGroupBox;
    lblID: TLabel;
    edtID: TEdit;
    memAdvancedHelp: TMemo;
    cbxAdvanced: TCheckBox;
    pnlButtons: TPanel;
    btnNext: TButton;
    btnCancel: TButton;
    cbxPort: TCheckBox;
    pnlVType: TPanel;
    lblVType: TLabel;
    cobVType: TComboBox;
    memHello: TMemo;
    Label1: TLabel;
    redErrors: TRichEdit;
    grbScreenshots: TGroupBox;
    grbIcon: TGroupBox;
    memID: TMemo;
    pnlIcon: TPanel;
    lblIcon: TLabel;
    pnlIconPath: TPanel;
    edtIcon: TEdit;
    btnIcon: TButton;
    lblIconInfo: TLabel;
    memScreenshots: TMemo;
    edtAppdata: TEdit;
    lblAppdata: TLabel;
    Memo1: TMemo;
    opdIcon: TOpenDialog;
    scbScreenshots: TScrollBox;
    pnlScreenButtons: TPanel;
    btnScreenAdd: TButton;
    imgIcon: TImage;
    btnPrev: TButton;
    Button1: TButton;
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
  public
    constructor Create(const Filepath: String); virtual;
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

var
  frmCreator: TfrmCreator;
  InputFilter: TInputFilters;

implementation

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
end;

// --- Form --------------------------------------------------------------------

procedure TfrmCreator.FormCreate(Sender: TObject);
begin
    edtMail.OnKeyPress := InputFilter.EmailKeyPress;
    edtAppMail.OnKeyPress := InputFilter.EmailKeyPress;
    edtID.OnKeyPress := InputFilter.IDKeyPress;
    edtVMajor.OnKeyPress := InputFilter.VersionKeyPress;
    edtVMinor.OnKeyPress := InputFilter.VersionKeyPress;
    edtVRelease.OnKeyPress := InputFilter.VersionKeyPress;
    edtVBuild.OnKeyPress := InputFilter.VersionKeyPress;
    edtAppdata.OnKeyPress := InputFilter.FolderKeyPress;
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

procedure TfrmCreator.pgcMainChange(Sender: TObject);
begin
    if pgcMain.ActivePageIndex = 0 then
        btnPrev.Enabled := false
    else
        btnPrev.Enabled := true;
    if pgcMain.ActivePageIndex = pgcMain.PageCount-1 then // Finish tab
       btnNext.Caption := 'Finish'
    else
        begin
        btnNext.Caption := 'Next ->';
        btnNext.Enabled := true;
        Exit;
        end;
    redErrors.Clear;     
    // Check for errors and display them
    if Length(edtIcon.Text) = 0 then
        AddError('No icon specified!',LOG_ERROR_COLOR)
    else if not FileExists(edtIcon.Text) then
        AddError('The specified icon does not exist!',LOG_ERROR_COLOR);
    // etc...

    if redErrors.Lines.Count = 0 then
    begin
        AddError('All valid, good job!',LOG_SUCCESS_COLOR);      
        btnNext.Enabled := true;
    end else
        btnNext.Enabled := false;
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
                    
constructor TScreenshotPanel.Create(const Filepath: String);
begin
    Align := alTop;
    Height := 100;
    Caption := '';
    ParentBackground := false;
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
    with pnlText do
    begin
        Align := alClient;
        BevelOuter := bvNone;
        Caption := '';
        ParentColor := true;
        Parent := Self;
    end;
    with pnlButtons do
    begin
        Align := alRight;
        BevelOuter := bvNone;
        Caption := '';
        ParentColor := true;
        Parent := Self;
        Width := 33;
    end;
    with lblPath do
    begin
        Parent := pnlText;
        Align := alTop;
        AlignWithMargins := true;
        Caption := 'C:\Path\here.filename';
        with Margins do
        begin
            Bottom := 0;
            Left := 0;
            Right := 0;
            Top := 34;
        end;
    end;
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
    end;
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
    end;
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
    end;
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
    end;
end;

procedure TScreenshotPanel.btnRemoveClick(Sender: TObject);
begin
    //
end;

procedure TScreenshotPanel.btnMoveUpClick(Sender: TObject);
begin
    //
end;

procedure TScreenshotPanel.btnMoveDownClick(Sender: TObject);
begin
    //
end;


end.