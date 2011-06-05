unit OptionsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MainForm;

type
  TfrmOptions = class(TForm)
    grbGeneral: TGroupBox;
    cbxSmartAdd: TCheckBox;
    cbxIcons: TCheckBox;
    grbPaths: TGroupBox;
    pnlProgMkSquash: TPanel;
    edtProgMkSquash: TEdit;
    btnMkSquash: TButton;
    lblProgMkSquash: TLabel;
    pnlProgUnSquash: TPanel;
    lblProgUnSquash: TLabel;
    edtProgUnSquash: TEdit;
    btnUnSquash: TButton;
    pnlProgChmod: TPanel;
    lblProgChmod: TLabel;
    edtProgChmod: TEdit;
    btnChmod: TButton;
    opdExeFile: TOpenDialog;
    grbParams: TGroupBox;
    memParams: TMemo;
    pnlParamMkSquash: TPanel;
    lblParamMkSquash: TLabel;
    edtParamMkSquash: TEdit;
    pnlParamChmod: TPanel;
    lblParamChmod: TLabel;
    edtParamChmod: TEdit;
    pnlParamUnSquash: TPanel;
    lblParamUnSquash: TLabel;
    edtParamUnSquash: TEdit;
    pnlButtons: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    cbxBinary: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnMkSquashClick(Sender: TObject);
    procedure btnUnSquashClick(Sender: TObject);
    procedure btnChmodClick(Sender: TObject);
  private
    { Private declarations }
  public               
    Settings : rSettings;
    function Execute(const S : rSettings) : Boolean;
  end;

var
  frmOptions: TfrmOptions;
  Successful : Boolean;

implementation

{$Ifdef MSWINDOWS}
uses ControlHideFix;
{$Endif}

{$R *.dfm}

function TfrmOptions.Execute(const S : rSettings) : Boolean;
begin
    with S do
    begin
        cbxSmartAdd.Checked := SmartAdd;
        cbxIcons.Checked := ShowIcons;
        cbxBinary.Checked := SizeBinary;
        edtProgMkSquash.Text := ProgMkSquash;
        edtProgUnSquash.Text := ProgUnSquash;
        edtProgChmod.Text := ProgChmod;
        edtParamMkSquash.Text := ParamMkSquash;
        edtParamUnSquash.Text := ParamUnSquash;
        edtParamChmod.Text := ParamChmod;
    end;
              
    Successful := false;
    ShowModal;
    Result := Successful;
end;

procedure TfrmOptions.FormCreate(Sender: TObject);
var
    dummy : TButtonEvent;
begin
    {$Ifdef MSWINDOWS}
    KeyPreview := true;
    OnKeyDown := dummy.KeyDown;
    {$Endif}
end;

procedure TfrmOptions.btnChmodClick(Sender: TObject);
begin
    if opdExeFile.Execute then
        edtProgChmod.Text := opdExeFile.FileName;
end;

procedure TfrmOptions.btnMkSquashClick(Sender: TObject);
begin
    if opdExeFile.Execute then
        edtProgMkSquash.Text := opdExeFile.FileName;
end;

procedure TfrmOptions.btnUnSquashClick(Sender: TObject);
begin
    if opdExeFile.Execute then
        edtProgUnSquash.Text := opdExeFile.FileName;
end;

procedure TfrmOptions.btnOKClick(Sender: TObject);
begin
    with Settings do
    begin
        SmartAdd := cbxSmartAdd.Checked;
        ShowIcons := cbxIcons.Checked;
        SizeBinary := cbxBinary.Checked;
        ShowIcons := cbxIcons.Checked; 
        ProgMkSquash := edtProgMkSquash.Text;
        ProgUnSquash := edtProgUnSquash.Text;
        ProgChmod := edtProgChmod.Text;
        ParamMkSquash := edtParamMkSquash.Text;
        ParamUnSquash := edtParamUnSquash.Text;
        ParamChmod := edtParamChmod.Text;
    end;

    Successful := true;
    Close;
end;      

procedure TfrmOptions.btnCancelClick(Sender: TObject);
begin
    Close;
end;

end.
