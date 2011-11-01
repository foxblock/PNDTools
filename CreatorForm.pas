unit CreatorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TfrmCreator = class(TForm)
    grbApp: TGroupBox;
    pnlRight: TPanel;
    grbLicense: TGroupBox;
    grbAuthor: TGroupBox;
    grbAdvanced: TGroupBox;
    pnlButtons: TPanel;
    Button1: TButton;
    Button2: TButton;
    edtTitle: TEdit;
    lblTitle: TLabel;
    lblDescription: TLabel;
    memDescription: TMemo;
    pnlVersion: TPanel;
    lblVersion: TLabel;
    pnlVBuild: TPanel;
    spbVBuild: TSpinButton;
    edtVBuild: TEdit;
    lblVBuild: TLabel;
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
    lblCategory: TLabel;
    cobCategory: TComboBox;
    lblSubcategory: TLabel;
    cobSubcategory: TComboBox;
    lblName: TLabel;
    edtName: TEdit;
    lblWebsite: TLabel;
    lblMail: TLabel;
    edtWebsite: TEdit;
    edtMail: TEdit;
    grbAppAuthor: TGroupBox;
    cbxPort: TCheckBox;
    lblAppAuthor: TLabel;
    edtAppAuthor: TEdit;
    lblAppWebsite: TLabel;
    edtAppWebsite: TEdit;
    lblAppMail: TLabel;
    edtAppMail: TEdit;
    memAuthorHelp: TMemo;
    lblExe: TLabel;
    Panel1: TPanel;
    edtExe: TEdit;
    btnExe: TButton;
    lblLicense: TLabel;
    lblLicenseURL: TLabel;
    edtLicenseURL: TEdit;
    lblSourceURL: TLabel;
    edtSourceURL: TEdit;
    memLicenseHelp: TMemo;
    cbxLicense: TComboBox;
    lblID: TLabel;
    edtID: TEdit;
    lblVType: TLabel;
    cbxVType: TComboBox;
    memAdvancedHelp: TMemo;
    cbxAdvanced: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreator: TfrmCreator;

implementation

{$R *.dfm}

end.
