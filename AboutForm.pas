unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Classes, Controls, ExtCtrls, Forms;

type
  TfrmAbout = class(TForm)
    pnlButtons: TPanel;
    btnOK: TButton;
    memAbout: TMemo;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.btnOKClick(Sender: TObject);
begin
    Close;
end;

end.
