unit CreatorForm;

interface

uses
  Messages, Classes, Graphics, Controls, Forms, Dialogs, Spin, ComCtrls,
  StdCtrls, ExtCtrls, SysUtils, GraphicEx;

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
    btnOK: TButton;
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
    imgIcon: TImage;
    pnlIcon: TPanel;
    lblIcon: TLabel;
    pnlIconPath: TPanel;
    edtIcon: TEdit;
    btnIcon: TButton;
    lblIconInfo: TLabel;
    Image1: TImage;
    memScreenshots: TMemo;
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
    if pgcMain.TabIndex <> 5 then // Finish tab
        Exit;
    redErrors.Clear;     
    // Check for errors and display them
    if Length(edtIcon.Text) = 0 then
        AddError('No icon specified!',LOG_ERROR_COLOR)
    else if not FileExists(edtIcon.Text) then
        AddError('The specified icon does not exist!',LOG_ERROR_COLOR);
    // etc...

    if redErrors.Lines.Count = 0 then
        AddError('All valid, good job!',LOG_SUCCESS_COLOR);
end;

// --- Buttons -----------------------------------------------------------------

procedure TfrmCreator.btnCancelClick(Sender: TObject);
begin
    Close;
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
        imgIcon.Canvas.Draw(0,0,temp.Graphic);
        lblIconInfo.Caption := UpperCase(ExtractFileExt(edtIcon.Text)) + ', ' +
                               IntToStr(temp.Width) + 'x' + IntToStr(temp.Height);
        temp.Free;
    except
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

end.
