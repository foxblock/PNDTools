unit CreatorForm;

interface

uses
  Messages, Classes, Graphics, Controls, Forms, Dialogs, Spin, ComCtrls,
  StdCtrls, ExtCtrls;

type
  Tfrm_easyprofile = class(TForm)
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
    cbxLicense: TComboBox;
    grbAdvanced: TGroupBox;
    lblID: TLabel;
    edtID: TEdit;
    memAdvancedHelp: TMemo;
    cbxAdvanced: TCheckBox;
    pnlButtons: TPanel;
    Button1: TButton;
    Button2: TButton;
    cbxPort: TCheckBox;
    pnlVType: TPanel;
    lblVType: TLabel;
    cbxVType: TComboBox;
    memHello: TMemo;
    Label1: TLabel;
    redErrors: TRichEdit;
    grbScreenshots: TGroupBox;
    GroupBox1: TGroupBox;
    procedure Button2Click(Sender: TObject);
    procedure cbxPortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_easyprofile: Tfrm_easyprofile;

implementation

{$R *.dfm}

procedure Tfrm_easyprofile.Button2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_easyprofile.cbxPortClick(Sender: TObject);
var I : Integer;
begin
    for I := 0 to grbAppAuthor.ControlCount - 1 do
    begin
        grbAppAuthor.Controls[I].Enabled := (Sender as TCheckBox).Checked;
    end;
end;

end.
