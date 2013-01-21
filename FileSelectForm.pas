unit FileSelectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, VirtualTrees, VSTUtils;

type
  TfrmFileSelect = class(TForm)
    vstFiles: TVirtualStringTree;
    pnlButtons: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure vstFilesGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure vstFilesHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure vstFilesCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure vstFilesGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString); 
    procedure vstFilesInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
  private
    function GetOriginalNodeData(Tree : TBaseVirtualTree; Node : PVirtualNode) : PFileTreeData;
    function GetMultiSelect : Boolean;
    procedure SetMultiSelect(NewValue : Boolean);
  public
    procedure CopyTreeData(Tree : TBaseVirtualTree; sShowIcons : Boolean);
    procedure SetFilter(const FilterStr : String; const Title : String);
    function Execute : Boolean;
    property MultiSelect : Boolean read GetMultiSelect write SetMultiSelect;
  end;

  rFileMirrorTreeData = record
    OriginalNode : PVirtualNode;
  end;
  PFileMirrorTreeData = ^rFileMirrorTreeData;

var
  frmFileSelect: TfrmFileSelect;
  OriginalTree: TBaseVirtualTree; 
  Successful : Boolean;
  ShowIcons : Boolean;

implementation

uses
{$Ifdef Win32}
    VSTIcons_win;
{$Else}
    VSTIcons_lin;
{$Endif}

{$R *.dfm}

function TfrmFileSelect.GetOriginalNodeData(Tree : TBaseVirtualTree; Node: PVirtualNode) : PFileTreeData;
var temp : PFileMirrorTreeData;
begin
    temp := Tree.GetNodeData(Node);
    Result := OriginalTree.GetNodeData(temp.OriginalNode)
end;

function TfrmFileSelect.GetMultiSelect : Boolean;
begin
    Result := (toMultiSelect in vstFiles.TreeOptions.SelectionOptions);
end;

procedure TfrmFileSelect.SetMultiSelect(NewValue : Boolean);
begin
    vstFiles.TreeOptions.SelectionOptions := vstFiles.TreeOptions.SelectionOptions + [toMultiSelect];
end;

procedure TfrmFileSelect.CopyTreeData(Tree : TBaseVirtualTree; sShowIcons : Boolean);

    procedure CopyChildNodes(Tree : TBaseVirtualTree; Parent : PVirtualNode = nil;
        OriginalParent : PVirtualNode = nil);
    var PData : PFileMirrorTreeData;
        Node, OriginalNode : PVirtualNode;
    begin
        OriginalNode := Tree.GetFirstChild(OriginalParent);
        while OriginalNode <> nil do
        begin
            Node := vstFiles.AddChild(Parent);
            PData := vstFiles.GetNodeData(Node);
            PData.OriginalNode := OriginalNode;
            if Tree.HasChildren[OriginalNode] then
                CopyChildNodes(Tree,Node,OriginalNode);
            OriginalNode := Tree.GetNextSibling(OriginalNode);
        end;
    end;

begin
    vstFiles.Clear; 
    OriginalTree := Tree;
    ShowIcons := sShowIcons;
    CopyChildNodes(Tree);
end;

procedure TfrmFileSelect.SetFilter(const FilterStr : String; const Title : String);
begin
    // TODO: Implement this
end;

function TfrmFileSelect.Execute;
begin
    ShowModal;
    Result := Successful;
end;

// --- Buttons -----------------------------------------------------------------

procedure TfrmFileSelect.btnCancelClick(Sender: TObject);
begin
    Successful := false;
    Close;
end;

procedure TfrmFileSelect.btnOKClick(Sender: TObject);
begin
    Successful := true;
    Close;
end;

procedure TfrmFileSelect.FormCreate(Sender: TObject);
begin
    vstFiles.NodeDataSize := sizeof(rFileMirrorTreeData);
end;

procedure TfrmFileSelect.FormShow(Sender: TObject);
begin
    Successful := false;
end;

// --- Files Tree --------------------------------------------------------------

procedure TfrmFileSelect.vstFilesCompareNodes(Sender: TBaseVirtualTree; Node1,
    Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
    PData1, PData2 : PFileTreeData;
begin
    PData1 := GetOriginalNodeData(Sender,Node1);
    PData2 := GetOriginalNodeData(Sender,Node2);
    if Column = 0 then
    begin
        if (PData1.Attr and faDirectory > 0) XOR (PData2.Attr and faDirectory > 0) then
        begin
            if (PData1.Attr and faDirectory > 0) then
                Result := -1
            else
                Result := 1;
        end else
        {$Ifdef Win32}
            Result := CompareText(ExtractFileName(PData1.Name), ExtractFileName(PData2.Name));
        {$Else}
            Result := CompareStr(ExtractFileName(PData1.Name), ExtractFileName(PData2.Name));
        {$Endif}
    end
end;

procedure TfrmFileSelect.vstFilesGetImageIndex(Sender: TBaseVirtualTree;
    Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
    var Ghosted: Boolean; var ImageIndex: Integer);
var
    PData : PFileTreeData;  
begin
    if (Column <> 0) OR (Kind = ikOverlay) then
        Exit;

    PData := GetOriginalNodeData(Sender,Node);
    if Sender.Expanded[Node] then
        ImageIndex := PData.OpenIndex
    else
        ImageIndex := PData.ClosedIndex;
end;

procedure TfrmFileSelect.vstFilesGetText(Sender: TBaseVirtualTree;
    Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
    var CellText: WideString);
var
    PData : PFileTreeData;
begin
    PData := GetOriginalNodeData(Sender,Node);
    case Column of
        0 : CellText := ExtractFileName(PData.Name);
    end;
end;

procedure TfrmFileSelect.vstFilesHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Sender.SortColumn = Column then
    begin
        if Sender.SortDirection=sdAscending then
            Sender.SortDirection:=sdDescending
        else
            Sender.SortDirection:=sdAscending;
    end else
        Sender.SortColumn := Column;
    Sender.Treeview.SortTree(Column,Sender.SortDirection,True);
end;

procedure TfrmFileSelect.vstFilesInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
    PData : PFileTreeData;
begin
    PData := GetOriginalNodeData(Sender,Node);
    if ShowIcons then
    begin
        PData.ClosedIndex := GetIconIndex(PData.Name,false);
        PData.OpenIndex := GetIconIndex(PData.Name,true);
    end else
    begin
        if (PData.Attr and faDirectory = 0) then
        begin
            PData.ClosedIndex := 0;
            PData.OpenIndex := 0;
        end else
        begin
            PData.ClosedIndex := 1;
            PData.OpenIndex := 1;
        end;
    end;
end;

end.
