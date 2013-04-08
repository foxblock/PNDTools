{******************************************************************************}
{                                                                              }
{  PNDTools is Copyright ©2011-2013 Janek Schäfer                              }
{                                                                              }
{  This file is part of PNDTools                                               }
{                                                                              }
{  PNDTools is free software: you can redistribute it and/or modify            }
{  it under the terms of the GNU General Public License as published by        }
{  the Free Software Foundation, either version 3 of the License, or           }
{  (at your option) any later version.                                         }
{                                                                              }
{  PNDTools is distributed in the hope that it will be useful,                 }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of              }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               }
{  GNU General Public License for more details.                                }
{                                                                              }
{  You should have received a copy of the GNU General Public License           }
{  along with this program.  If not, see <http://www.gnu.org/licenses/>.       }
{                                                                              }
{******************************************************************************}

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
    pnlFilter: TPanel;
    cbxFilter: TCheckBox;
    procedure cbxFilterClick(Sender: TObject);
    procedure vstFilesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
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
    FFileList : TStrings;
    FNodeList : TNodeArray;
    { Get data for the OriginalNode linked with Node, Tree is the tree Node is
      in, global OriginalTree variable will be used to get the data }
    function GetOriginalNodeData(Tree : TBaseVirtualTree; Node : PVirtualNode) : PFileTreeData;
    function GetMultiSelect : Boolean;
    procedure SetMultiSelect(NewValue : Boolean);
    function GetFileName : String;
    function GetFileNode : PVirtualNode;
    function FileExtInFilters(Data : PFileTreeData) : Boolean;
  public
    { Copies all nodes fron the passed Tree to the local one, sets up the link
      tree data and filter settings on each node, as well as OriginalTree var }
    procedure CopyTreeData(Tree : TBaseVirtualTree; sShowIcons : Boolean);
    { Apply the passed filter and set the form's title accordingly
      FilterString is a semicolon seperated list of file extensions with the
      leading dot, or the special FOLDER_WILDCARD
      e.g. ".png;.jpg;.gif" }
    procedure SetFilter(const FilterStr : String; const Title : String);
    function Execute : Boolean;
    // Enable selection of multiple files
    property MultiSelect : Boolean read GetMultiSelect write SetMultiSelect;
    // Local filename (in the PND) of the (first) selected item
    property Filename : String read GetFilename;
    // Node (tree on frmMain) of the (first) selected item
    property FileNode : PVirtualNode read GetFileNode;
    // Full list of filenames of selected items
    property FileList : TStrings read FFileList;
    // Full list of nodes of selected items
    property NodeList : TNodeArray read FNodeList;
    // Filter string for folder
    const FOLDER_WILDCARD : String = '[folder]';
  end;

  rFileMirrorTreeData = record
    OriginalNode : PVirtualNode; // Link to node in tree on frmMain
    IsFiltered : Boolean; // Flag whether the file succumbs to the current filter
  end;
  PFileMirrorTreeData = ^rFileMirrorTreeData;

var
  frmFileSelect: TfrmFileSelect;
  OriginalTree: TBaseVirtualTree; // Link to tree on frmMain
  Successful : Boolean;
  ShowIcons : Boolean;
  Filters : TStrings;

implementation

uses StrUtils,
{$Ifdef Win32}
    ControlHideFix, VSTIcons_win;
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

function TfrmFileSelect.GetFilename : String;
begin
    if FileList.Count > 0 then
        Result := FFileList[0]
    else
        Result := '';
end;

function TfrmFileSelect.GetFileNode : PVirtualNode;
begin
    if Length(NodeList) > 0 then
        Result := FNodeList[0]
    else
        Result := nil;
end;

function TfrmFileSelect.FileExtInFilters(Data : PFileTreeData) : Boolean;
var Ext : String;
    I : Integer;
begin
    Result := false;
    if Filters.Count = 0 then
    begin     
        Result := true;
        Exit;
    end;
    if (Data.Attr and faDirectory > 0) then
    begin
        if Filters[0] = FOLDER_WILDCARD then
            Result := true
        else
            Result := false;
    end else
    begin
        Ext := ExtractFileExt(Data.Name);
        for I := 0 to Filters.Count - 1 do
        begin
            if Filters[I] = Ext then
            begin
                Result := true;
                Exit;
            end;
        end;
    end;
end;

procedure TfrmFileSelect.CopyTreeData(Tree : TBaseVirtualTree; sShowIcons : Boolean);

    procedure CopyChildNodes(Tree : TBaseVirtualTree; Parent : PVirtualNode = nil;
        OriginalParent : PVirtualNode = nil);
    var PData : PFileMirrorTreeData;
        POrigData : PFileTreeData;
        Node, OriginalNode : PVirtualNode;
    begin
        OriginalNode := Tree.GetFirstChild(OriginalParent);
        while OriginalNode <> nil do
        begin
            POrigData := OriginalTree.GetNodeData(OriginalNode);
            Node := vstFiles.AddChild(Parent);
            PData := vstFiles.GetNodeData(Node);
            PData.OriginalNode := OriginalNode;
            PData.IsFiltered := true;
            if Tree.HasChildren[OriginalNode] then // folder
            begin
                PData.IsFiltered := false;
                CopyChildNodes(Tree,Node,OriginalNode);
            end else
            begin
                PData.IsFiltered := not FileExtInFilters(POrigData);
            end;
            if PData.IsFiltered then
            begin
                vstFiles.IsVisible[Node] := NOT cbxFilter.Checked;
                vstFiles.IsDisabled[Node] := cbxFilter.Checked;
            end;
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
var temp, S : String;
    I : Integer;
begin
    Filters.Clear;
    if FilterStr = FOLDER_WILDCARD then
    begin
        Filters.Add(FOLDER_WILDCARD);
        cbxFilter.Caption := 'Filter:   ' + Title;
    end else
    begin
        temp := Trim(FilterStr);
        if RightStr(temp,1) <> ';' then
            temp := temp + ';';
        while Pos(';',temp) <> 0 do
        begin
            Filters.Add(LeftStr(temp,Pos(';',temp)-1));
            temp := RightStr(temp,Length(temp)-Pos(';',temp));
        end;

        for I := 0 to Filters.Count - 1 do
            S := S + '*' + Filters[I] + ';';
        S := LeftStr(S,Length(S)-1);
        cbxFilter.Caption := 'Filter:   ' + Title + ' (' + S + ')';
    end;
end;

function TfrmFileSelect.Execute : Boolean;
begin
    Successful := false;
    FFileList.Clear;
    SetLength(FNodeList,0);
    vstFiles.ClearSelection;
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
var Node : PVirtualNode;
    PData : PFileMirrorTreeData;
begin
    Node := vstFiles.GetFirstSelected();
    while Node <> nil do
    begin
        PData := vstFiles.GetNodeData(Node);
        if IsFile(OriginalTree,PData.OriginalNode) OR (Filters.Count = 0) OR
            (Filters[0] = FOLDER_WILDCARD) then
        begin
            FFileList.Add(GetFilepathInPND(OriginalTree,PData.OriginalNode));
            SetLength(FNodeList,Length(FNodeList)+1);
            FNodeList[High(FNodeList)] := PData.OriginalNode;
        end;         
        Node := vstFiles.GetNextSelected(Node);
    end;    
    Successful := true;
    Close;
end;

procedure TfrmFileSelect.cbxFilterClick(Sender: TObject);
var Node : PVirtualNode;
    PData : PFileMirrorTreeData;
begin
    Node := vstFiles.GetFirst();
    while Node <> nil do
    begin
        PData := vstFiles.GetNodeData(Node);
        if PData.IsFiltered then
        begin
            vstFiles.IsVisible[Node] := NOT cbxFilter.Checked;
            vstFiles.IsDisabled[Node] := cbxFilter.Checked;
            if cbxFilter.Checked AND vstFiles.Selected[Node] then
                vstFiles.Selected[Node] := false;
        end;
        Node := vstFiles.GetNext(Node);
    end;
end;

procedure TfrmFileSelect.FormCreate(Sender: TObject);
var
    dummy : TButtonEvent;
begin
    {$Ifdef Win32}
    KeyPreview := true;
    dummy := TButtonEvent.Create;
    OnKeyDown := dummy.KeyDown;
    dummy.Free;
    {$Endif}
    vstFiles.NodeDataSize := sizeof(rFileMirrorTreeData);
    Filters := TStringList.Create;
    FFileList := TStringList.Create;
end;

procedure TfrmFileSelect.FormShow(Sender: TObject);
begin
    Successful := false;
end;

// --- Files Tree --------------------------------------------------------------

procedure TfrmFileSelect.vstFilesChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var PData : PFileMirrorTreeData;
    ValidSelectionCount : Integer;
begin
    Node := vstFiles.GetFirstSelected();
    ValidSelectionCount := 0;
    while Node <> nil do
    begin
        PData := vstFiles.GetNodeData(Node);
        if IsFile(OriginalTree,PData.OriginalNode) OR (Filters.Count = 0) OR (Filters[0] = FOLDER_WILDCARD) then
            Inc(ValidSelectionCount);
        Node := vstFiles.GetNextSelected(Node);
    end;
    btnOK.Enabled := (ValidSelectionCount > 0);
end;

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
