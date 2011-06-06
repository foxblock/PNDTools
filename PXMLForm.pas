unit PXMLForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, ExtCtrls, XMLDoc, XMLIntf;

type
  rXMLTreeData = record
      Node : IXMLNode;
      DisplayKey : String;
  end;
  PXMLTreeData = ^rXMLTreeData;

  TfrmPXML = class(TForm)
    pnlButtons: TPanel;
    pnlTree: TPanel;
    vstPXML: TVirtualStringTree;
    btnCancel: TButton;
    btnOK: TButton;
    sptHor: TSplitter;
    pnlData: TPanel;
    scbValues: TScrollBox;
    lblValue: TLabel;
    lblAttr: TLabel;
    lblDescription: TLabel;
    pnlValue: TPanel;
    edtValue: TEdit;
    lblNoValue: TLabel;
    lblNoAttr: TLabel;
    memDescription: TMemo;
    sadPXML: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vstPXMLChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vstPXMLInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure FormCreate(Sender: TObject);
    procedure vstPXMLGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure AddDataToTree(Tree : TBaseVirtualTree; Data : IXMLNode; Node : PVirtualNode);
    procedure UpdateXMLData;
    procedure ResetPanels;
    procedure AddPanels(Data : PXMLTreeData);
  public
    procedure Clear;
    function  LoadFromFile(const FileName : String) : Boolean;
  end;

  TItemPanel = class(TCustomPanel)
    lblKey: TLabel;
    edtValue: TEdit;
    Link : IXMLNode;
  public
    constructor Create(NewParent : TWinControl; Node : IXMLNode);
    destructor Free;
    function GetValue() : String; virtual;
    procedure UpdateData;
  end;

const
  NO_DESCRIPTION_LINE : String = 'no description available for this element';

var
  frmPXML: TfrmPXML;
  Doc : TXMLDocument;
  CurrentPanels : Array of TItemPanel;
  CurrentNode : PVirtualNode;

implementation

{$R *.dfm}

    // DONE: Parse scheme file or some custom file to check for elements without text attribute
    // TODO: Validate PXML (using scheme) - check for files (binary, icons, pics)
    // TODO: Functionality to add and remove elements
    // TODO: Parse external file for descriptions
    // TODO: Custom ItemPanel classes for special fields (dropDown, etc.)


// --- Functions ---------------------------------------------------------------

procedure TfrmPXML.AddDataToTree(Tree : TBaseVirtualTree; Data: IXMLNode; Node: PVirtualNode);
var
    I : Integer;
    PData : PXMLTreeData;
begin
    if (Node <> nil) then
    begin
        PData := Tree.GetNodeData(Node);
        PData.Node := Data;
    end;
    for I := 0 to Data.ChildNodes.Count - 1 do
    begin
        if Data.ChildNodes[I].NodeType <> ntText then
            AddDataToTree(Tree,Data.ChildNodes[I],Tree.AddChild(Node));
    end;
end;

procedure TfrmPXML.Clear;
begin
    Doc.Free;
    Doc := nil;
    CurrentNode := nil;
    vstPXML.Clear;
    ResetPanels;
end;

function TfrmPXML.LoadFromFile(const FileName : String) : Boolean;
begin
    Clear;
    Doc := TXMLDocument.Create(frmPXML);
    Doc.LoadFromFile(FileName);
    AddDataToTree(vstPXML,Doc.DocumentElement,nil);
    Result := true;
end;

procedure TfrmPXML.UpdateXMLData;
var
    I : Integer;
    PData : PXMLTreeData;
begin
    if CurrentNode = nil then
        Exit;

    for I := 0 to High(CurrentPanels) do
    begin
        CurrentPanels[I].UpdateData;
    end;      
    PData := vstPXML.GetNodeData(CurrentNode);
    if PData.Node.IsTextElement then
    begin
        if Length(edtValue.Text) = 0 then
            edtValue.Text := 'data missing';
        PData.Node.NodeValue := edtValue.Text;
    end;
end;

procedure TfrmPXML.ResetPanels;
var
    I : Integer;
begin
    for I := High(CurrentPanels) downto 0 do
    begin
        CurrentPanels[I].Free;
        SetLength(CurrentPanels,High(CurrentPanels));
    end;
    lblNoValue.Visible := true;
    lblNoAttr.Visible := true;
    pnlValue.Visible := false;
    memDescription.Clear;
    memDescription.Lines.Add(NO_DESCRIPTION_LINE);
end;

procedure TfrmPXML.AddPanels(Data: PXMLTreeData);
var
    temp : String;
    I : Integer;
    Node : IXMLNode;
begin
    if Data = nil then
        Exit;
    if Data.Node.IsTextElement then
    begin
        try
            // fails on nodes without data
            temp := Data.Node.Text;
            edtValue.Text := temp;
            pnlValue.Visible := true;
            lblNoValue.Visible := false;
        except
            // suppress error
        end;
    end;
    for I := 0 to Data.Node.AttributeNodes.Count - 1 do
    begin
        lblNoAttr.Visible := false;
        Node := Data.Node.AttributeNodes.Get(I);
        SetLength(CurrentPanels,Length(CurrentPanels)+1);
        CurrentPanels[High(CurrentPanels)] := TItemPanel.Create(scbValues,Node);
    end;
end;

// --- Tree --------------------------------------------------------------------

procedure TfrmPXML.vstPXMLChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
    UpdateXMLData;
    ResetPanels;
    CurrentNode := Sender.GetFirstSelected();
    AddPanels(Sender.GetNodeData(CurrentNode));
end;

procedure TfrmPXML.vstPXMLGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var
    PData : PXMLTreeData;
begin
    PData := vstPXML.GetNodeData(Node);
    case Column of
        0 : CellText := PData.DisplayKey;
    end;
end;

procedure TfrmPXML.vstPXMLInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
    PData : PXMLTreeData;
begin
    PData := Sender.GetNodeData(Node);
    PData.DisplayKey := PData.Node.NodeName;
end;

// --- Buttons -----------------------------------------------------------------

procedure TfrmPXML.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPXML.btnOKClick(Sender: TObject);
begin             
    UpdateXMLData;
    if Assigned(Doc) then
    begin
        Doc.SaveToFile(Doc.FileName); 
        Close;
    end else
    begin
        if sadPXML.Execute then
        begin
            Doc.SaveToFile(sadPXML.FileName);
            Close;
        end;
    end;
end;

procedure TfrmPXML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ResetPanels;
    vstPXML.ClearSelection;
end;

procedure TfrmPXML.FormCreate(Sender: TObject);
begin
    vstPXML.NodeDataSize := SizeOf(rXMLTreeData);
    CurrentNode := nil;
    Doc := nil;
end;

// --- TItemPanel --------------------------------------------------------------

constructor TItemPanel.Create(NewParent : TWinControl; Node : IXMLNode);
begin
    inherited Create(NewParent);
    Parent := NewParent;   
    Align := alTop;
    AlignWithMargins := true;
    Height := 21;
    Top := frmPXML.lblDescription.Top - Height;
    BevelOuter := bvNone;
    Caption := '';
    Link := Node;   

    lblKey := TLabel.Create(self);
    with lblKey do
    begin
        Caption := Node.NodeName + '=';
        Align := alLeft;
        Left := 0;
        Parent := self;
        AlignWithMargins := true;
        with Margins do
        begin
            Left := 4;
            Right := 4;
            Top := 3;
            Bottom := 0;
        end;
    end;

    edtValue := TEdit.Create(self);
    with edtValue do
    begin
        Align := alClient;
        Parent := self;
        Text := Node.NodeValue;
    end;
end;

destructor TItemPanel.Free;
begin
    lblKey.Free;
    edtValue.Free;
    inherited Destroy;
end;

function TItemPanel.GetValue : String;
begin
    Result := edtValue.Text;
end;

procedure TItemPanel.UpdateData;
begin
    Link.NodeValue := edtValue.Text;
end;

end.
