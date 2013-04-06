unit FileConflictForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFileConflictResult = (fcCancel, fcReplace, fcKeep, fcReplaceAll, fcKeepAll);
  TfrmFileConflict = class(TForm)
    lblTitle: TLabel;
    lblSubtitle: TLabel;
    pnlNew: TPanel;
    pnlButtons: TPanel;
    btnCancel: TButton;
    lblNewCaption: TLabel;
    pnlLabelsNew: TPanel;
    lblSizeNewLabel: TLabel;
    lblChangedNewLabel: TLabel;
    lblPathNewLabel: TLabel;
    pnlDataNew: TPanel;
    lblChangedNew: TLabel;
    lblSizeNew: TLabel;
    lblPathNew: TLabel;
    pnlOld: TPanel;
    lblOldCaption: TLabel;
    pnlLabelOld: TPanel;
    lblSizeOldLabel: TLabel;
    lblChangedOldLabel: TLabel;
    lblPathOldLabel: TLabel;
    pnlDataOld: TPanel;
    lblChangedOld: TLabel;
    lblSizeOld: TLabel;
    lblPathOld: TLabel;
    cbxRemember: TCheckBox;
    imgNew: TImage;
    imgOld: TImage;
    procedure btnCancelClick(Sender: TObject);
    procedure pnlOldClick(Sender: TObject);
    procedure pnlNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private                 
    pAction : TFileConflictResult;
    procedure MessageHandler(var Msg: TMsg; var Handled: Boolean);
  public
    property Action : TFileConflictResult read pAction;
    function Execute : Boolean;        
    procedure SetNewFile(Path : String; Size : Int64; Time : Integer; IconIndex : Integer);
    procedure SetOldFile(Path : String; Size : Int64; Time : Integer; IconIndex : Integer);
  end;

var
  frmFileConflict: TfrmFileConflict;
  Successful : Boolean;

implementation

{$R *.dfm}

uses MainForm, FormatUtils, {$Ifdef Win32}ControlHideFix,{$Endif} FileCtrl;

// --- Functions ---------------------------------------------------------------

procedure TfrmFileConflict.MessageHandler(var Msg: TMsg; var Handled: Boolean);

    procedure MouseOverPanel(Panel : TPanel; P : TPoint; M : UINT);
    begin
        if (P.X >= Panel.Left) AND (P.X <= Panel.Left + Panel.Width) AND
            (P.Y >= Panel.Top) AND (P.Y <= Panel.Top + Panel.Height) then
        begin
            Panel.Color := clHighlight;
            if M = WM_LBUTTONDOWN then
                Panel.BevelOuter := bvLowered
            else if (M = WM_LBUTTONUP) AND (Panel.BevelOuter = bvLowered) then
            begin
                Panel.OnClick(Panel);
                Handled := true;
            end
        end else
        begin
            if Panel.Color <> clBtnFace then
                Panel.Color := clBtnFace;  
            if  Panel.BevelOuter <> bvRaised then
                Panel.BevelOuter := bvRaised;
        end;
    end;

var
  P : TPoint;
begin
    Handled := false;
    if NOT frmFileConflict.Active OR
        ((Msg.message <> WM_LBUTTONDOWN) AND
        (Msg.message <> WM_LBUTTONUP) AND
        (Msg.message <> WM_MOUSEMOVE)) then
        Exit;
    P := frmFileConflict.ScreenToClient(Msg.pt);
    MouseOverPanel(pnlNew,P,Msg.message);
    MouseOverPanel(pnlOld,P,Msg.message);
end;

function TfrmFileConflict.Execute : Boolean;
begin
    Successful := false;
    pAction := fcCancel;
    ShowModal;
    Result := Successful;
end;

procedure TfrmFileConflict.SetNewFile(Path: string; Size: Int64; Time: Integer;
    IconIndex: Integer);
var temp : TDateTime;
begin
    lblPathNew.Caption := MinimizeName(Path,lblPathNew.Canvas,lblPathNew.Width);
    lblSizeNew.Caption := SizeToStr(Size,frmMain.Settings.SizeBinary);
    temp := FileDateToDateTime(Time);
    lblChangedNew.Caption := DateToStr(temp) + ' ' + TimeToStr(temp);
    imgNew.Transparent := false;
    frmMain.imlFileTree.GetBitmap(IconIndex,imgNew.Picture.Bitmap);
    imgNew.Transparent := true;
end;

procedure TfrmFileConflict.SetOldFile(Path: string; Size: Int64; Time: Integer;
    IconIndex: Integer);
var temp : TDateTime;
begin
    lblPathOld.Caption := MinimizeName(Path,lblPathOld.Canvas,lblPathOld.Width);
    lblSizeOld.Caption := SizeToStr(Size,frmMain.Settings.SizeBinary);
    temp := FileDateToDateTime(Time);
    lblChangedOld.Caption := DateToStr(temp) + ' ' + TimeToStr(temp);
    imgOld.Transparent := false;
    frmMain.imlFileTree.GetBitmap(IconIndex,imgOld.Picture.Bitmap);
    imgOld.Transparent := true;
end;

// --- Other stuff -------------------------------------------------------------

procedure TfrmFileConflict.pnlNewClick(Sender: TObject);
begin
    if cbxRemember.Checked then
        pAction := fcReplaceAll
    else
        pAction := fcReplace;
    Successful := true;
    Close;
end;

procedure TfrmFileConflict.pnlOldClick(Sender: TObject);
begin        
    if cbxRemember.Checked then
        pAction := fcKeepAll
    else
        pAction := fcKeep;  
    Successful := true;
    Close;
end;

procedure TfrmFileConflict.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmFileConflict.FormCreate(Sender: TObject);
var
    dummy : TButtonEvent;
begin
    Application.OnMessage := MessageHandler;
    {$Ifdef Win32}
    KeyPreview := true;
    dummy := TButtonEvent.Create;
    OnKeyDown := dummy.KeyDown;
    dummy.Free;
    {$Endif}
end;

end.
