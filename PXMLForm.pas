unit PXMLForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, ExtCtrls, XMLDoc, XMLIntf;

type
  rXMLTreeData = record
      Key : String;
      Value : String;
      Attributes : String;
      Description : String;
  end;
  PXMLTreeData = ^rXMLTreeData;

  TfrmPXML = class(TForm)
    pnlButtons: TPanel;
    pnlTree: TPanel;
    vstPXML: TVirtualStringTree;
    btnCancel: TButton;
    btnOK: TButton;
    procedure FormCreate(Sender: TObject);
    procedure vstPXMLGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure AddDataToTree(Tree : TBaseVirtualTree; Data : IXMLNode; Node : PVirtualNode);
  public
    function  LoadFromFile(const FileName : String) : Boolean;
  end;

var
  frmPXML: TfrmPXML;
  Data : TXMLDocument;

implementation

{$R *.dfm}

// --- Functions ---------------------------------------------------------------

procedure TfrmPXML.AddDataToTree(Tree : TBaseVirtualTree; Data: IXMLNode; Node: PVirtualNode);
var
    I : Integer;
    PData : PXMLTreeData;
begin
    if (Node <> nil) then
    begin
        PData := Tree.GetNodeData(Node);
        PData.Key := Data.NodeName;
        try
            PData.Value := Data.NodeValue;
        except

        end;
        try
        for I := 0 to Data.AttributeNodes.Count - 1 do
            PData.Attributes := PData.Attributes + Data.AttributeNodes[I].NodeName +
                '=' + Data.AttributeNodes[I].NodeValue + ' ';
        except

        end;
    end;
    for I := 0 to Data.ChildNodes.Count - 1 do
    begin
        if Data.ChildNodes[I].NodeType <> ntText then
            AddDataToTree(Tree,Data.ChildNodes[I],Tree.AddChild(Node));
    end;
end;

function TfrmPXML.LoadFromFile(const FileName : String) : Boolean;
begin
    Data.Free;
    Data := TXMLDocument.Create(frmPXML);
    Data.LoadFromFile(FileName);
    vstPXML.Clear;
    AddDataToTree(vstPXML,Data.DocumentElement,nil);
    Result := true;
end;

procedure TfrmPXML.vstPXMLGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var
    PData : PXMLTreeData;
begin
    PData := vstPXML.GetNodeData(Node);
    case Column of
        0 : CellText := PData.Key;
        1 : CellText := PData.Value;
        2 : CellText := PData.Attributes;
    end;
end;

// --- Buttons -----------------------------------------------------------------

procedure TfrmPXML.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPXML.btnOKClick(Sender: TObject);
begin
    Close; // and save
end;

procedure TfrmPXML.FormCreate(Sender: TObject);
begin
    vstPXML.NodeDataSize := SizeOf(rXMLTreeData);
end;

end.
