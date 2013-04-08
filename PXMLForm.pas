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

unit PXMLForm;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, ExtCtrls, XMLDoc, XMLIntf, ComCtrls, Menus,
  ButtonGroup,
  InputFilterFunctions;

type
  { DataType for caching the schema file in an array for faster access to needed
    data (faster than searching the XML file every time) }
  PPXMLElement = ^rPXMLElement;
  rPXMLElement = record
    Tag : String; // Literal string of the XML tag
    Parent : PPXMLElement;
    XNode : IXMLNode; // Link to XML node
    Root : PPXMLElement;
    Display : String; // Displayed XML tag in PNDTools (includes root node)
  end;

  { DataType for the VirtualTree displaying nodes in the PXML }
  rXMLTreeData = record
    Node : IXMLNode;
    DisplayKey : String;
    SchemaLink : PPXMLElement;
  end;
  PXMLTreeData = ^rXMLTreeData;

  { DataType for the button group, link to cached XML schema file }
  TXMLGrpButtonItem = class(TGrpButtonItem)
  public
    Data : PPXMLElement;
  end;

  TfrmPXML = class(TForm)
    pnlButtons: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    sadPXML: TSaveDialog;
    pnlData: TPanel;
    scbValues: TScrollBox;
    lblValue: TLabel;
    lblAttr: TLabel;
    lblDescription: TLabel;
    lblNoValue: TLabel;
    lblNoAttr: TLabel;
    pnlValue: TPanel;
    edtValue: TEdit;
    pnlTree: TPanel;
    vstPXML: TVirtualStringTree;
    sptHor: TSplitter;
    redDescription: TRichEdit;
    pomPXML: TPopupMenu;
    pomPXMLDelete: TMenuItem;
    pnlElements: TPanel;
    bugElements: TButtonGroup;
    sptVert: TSplitter;
    pnlFilter: TPanel;
    lblFilter: TLabel;
    rabSelection: TRadioButton;
    rabPackage: TRadioButton;
    rabApplication: TRadioButton;
    pnlValueText: TPanel;
    memValue: TMemo;
    procedure FormShow(Sender: TObject);
    procedure vstPXMLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rabSelectionClick(Sender: TObject);
    procedure bugElementsButtonClicked(Sender: TObject; Index: Integer);
    procedure pomPXMLDeleteClick(Sender: TObject);
    procedure vstPXMLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    { Recursively adds XML Data to the VirtualTree starting with the passed node }
    procedure AddDataToTree(Tree : TBaseVirtualTree; Data : IXMLNode;
      Node : PVirtualNode);
    { Updates the XML Data in Doc with the values in the current attribute panels }
    procedure UpdateXMLData;
    { Clears the currently displayed attribute panels }
    procedure ResetPanels;
    { Adds attribute panels for the passed node (reads schema for missing attributes)
      and adds those, too }
    procedure AddPanels(Data : PXMLTreeData);
    { Search for a node by caption (element name), returns NULL on failure }
    function  FindNode(Tree : TBaseVirtualTree; const S : String;
      Base : PVirtualNode) : PVirtualNode; overload;
    function  FindNode(const S : String; Node : IXMLNode) : IXMLNode; overload;
    { Find a selected node with the passed caption, returns either the selected
      node, a parent of the selected node (if applicable) or NULL }
    function  FindSelectedNode(Tree: TBaseVirtualTree; const S: String) : PVirtualNode;
    { Counts occurences of nodes with the passed caption in child nodes of Base }
    function  CountNodes(Tree : TBaseVirtualTree; const S : String;
      Base : PVirtualNode) : Integer;
    { Show applicable element buttons for the current situation }
    procedure ShowElementButtons;
  public
    { Clears the whole Form, dispatches all Objects }
    procedure Clear;
    { Load a XML file to the Form }
    function  LoadFromFile(const FileName : String) : Boolean;
    { Create a new XML file (loads the default file) }
    function  CreateNewFile : String;
    { Adds a new XML node to the doc and tree }
    function  AddEmptyNode(Tree : TBaseVirtualTree; Element : PPXMLElement) : PVirtualNode;
    { Generates a list of PPXMLElements from the schema file }
    procedure GetElementNames(Node : IXMLNode; ParentElement : PPXMLElement;
      RootElement : PPXMLElement);
  end;

// --- Panels ------------------------------------------------------------------

  EUnknownPanelType = class (Exception);

  TItemPanel = class(TCustomPanel)
    Attr : IXMLNode;
    Node : IXMLNode;
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode); reintroduce; virtual; 
    destructor Free; virtual; abstract;  
    { Set whether this panel represents an optional PXML node }
    procedure SetOptional(const Optional : Boolean); virtual; abstract;   
    { Set panel type specific data }
    procedure SetTypeData(const Arguments : TStrings); virtual; abstract;  
    { Updates the linked XML node with the data entered into the panel }
    procedure UpdateData; virtual; abstract;
  end;

  TStringItemPanel = class (TItemPanel)    
    lblKey: TLabel;
    edtValue: TEdit;
    chars: TStringList;
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode); override;
    destructor Free; override;
    procedure SetOptional(const Optional : Boolean); override;
    procedure SetTypeData(const Arguments : TStrings); override;
    procedure UpdateData; override;
  private     
    procedure GenericKeyPress(Sender: TObject; var Key: Char);
    // Additional KeyPress functions in InputFilterFunctions.pas
  end;

  TSetItemPanel = class (TItemPanel)
    lblKey: TLabel;
    cobValue: TComboBox;  
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode); override;
    destructor Free; override;
    procedure SetOptional(const Optional : Boolean); override;
    procedure SetTypeData(const Arguments : TStrings); override;
    procedure UpdateData; override;
  end;

  TBooleanItemPanel = class (TItemPanel)
    cbxValue: TCheckBox;
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode); override;
    destructor Free; override;
    procedure SetOptional(const Optional : Boolean); override;
    procedure SetTypeData(const Arguments : TStrings); override;
    procedure UpdateData; override;
  end;

  TCategoryItemPanel = class (TSetItemPanel)
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode); override;
    function  GetCategory() : String;
  end;

  TSubcategoryItemPanel = class (TSetItemPanel)
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode; Category : String); reintroduce;
  end;

const
  // Default data values
  NO_DESCRIPTION_LINE : String   = 'no description available for this element';
  DATA_MISSING_STR : String      = '--INSERT DATA HERE-';
  // Delimiter for list of values in schema nodes
  DELIMITER_STR : String         = ',';
  // Colours to paint lblKey TLabel components in TCustomPanel elements
  OPTIONAL_COLOR : TColor        = clGrayText;
  REQUIRED_COLOR : TColor        = clWindowText;
  // Attributes used in the schema file
  SCHEMA_ATTRIBUTES : Array [0..2] of String = ('elemdesc','min','max');
  // Names of elments with specific sub-elements
  ROOT_ELEMENT_NAMES : Array [0..2] of String = ('package','application','category');
  // Element with a full text value
  FULL_TEXT_ELEMENT : String     = 'description'; // hard-coded until better implemented in schema
  MAX_DEFAULT_VALUE : Integer    = 1;
  MIN_DEFAULT_VALUE : Integer    = 1;
  // Default "basic" PXML file (base for creating a new PXML)
  NEW_DEFAULT_FILE : String      = 'tools\PXML_default.xml';
  // Default path of file in which the freedesktop categories are stored
  CATEGORIES_FILE : String       = 'tools\Categories.txt';

var
  frmPXML: TfrmPXML;
  Doc : TXMLDocument;
  Schema : TXMLDocument;
  // Current set of visible panels representing nodes in the xml file
  CurrentPanels : Array of TItemPanel;
  // Array of nodes loaded from schema file
  PXMLElements : Array of PPXMLElement;
  // Currently selected node in the VirtualTree
  CurrentNode : PVirtualNode;
  IsExistingFile : Boolean;
  Successful : Boolean;
  // Loaded set of static KeyPress filter functions
  InputFilter : TInputFilters;

implementation

uses {$Ifdef Win32}ControlHideFix,{$Endif} MainForm, FormatUtils, Math;

{$R *.dfm}

    // DONE: Parse scheme file or some custom file to check for elements without text attribute
    // TODO: Validate PXML (using scheme) - check for files (binary, icons, pics)
    // DONE: Functionality to add and remove elements
    // DONE: Parse external file for descriptions
    // DONE: Validate strings using regex or something like that
    // DONE: Custom ItemPanel classes for special fields (dropDown, etc.)
    // DONE: Add info about multiple elements of the same kind to scheme and loading functionality here
    // TODO: Context-sensitive context menu for adding elements
    // DONE: Fill element dropDown (preferrebly from schema file)
    // TODO: Panel type for paths (tricky to do as relative from PND) -> copy from CreatorForm
    // DONE: Panel type for category and sub-category
    // DONE: Select added element
    // DONE: Get correct application element by selection in browser
    // DONE: Hotkey for deleting elements from the list


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
        if not (Data.ChildNodes[I].NodeType in [ntText,ntComment]) then
            AddDataToTree(Tree,Data.ChildNodes[I],Tree.AddChild(Node));
    end;
end;

procedure TfrmPXML.Clear;
var I : Integer;
begin
    Doc.Free;
    Schema.Free;
    Doc := nil;
    Schema := nil;
    CurrentNode := nil;
    vstPXML.Clear;       
    for I := 0 to bugElements.Items.Count - 1 do
        bugElements.Items[0].Free;
    bugElements.Items.Clear;
    for I := 0 to High(PXMLElements) do
        Dispose(PXMLElements[I]);
    Finalize(PXMLElements);
    ResetPanels;
end;

function TfrmPXML.LoadFromFile(const FileName : String) : Boolean;
begin
    Clear;
    Doc := TXMLDocument.Create(frmPXML);
    Doc.Options := [doNodeAutoIndent];
    Doc.LoadFromFile(FileName);
    Schema := TXMLDocument.Create(frmPXML);
    if Length(ExtractFileDrive(frmMain.Settings.SchemaFile)) > 0 then // full path
        Schema.LoadFromFile(frmMain.Settings.SchemaFile)
    else
        Schema.LoadFromFile(ExtractFilePath(Application.ExeName) + frmMain.Settings.SchemaFile);
    GetElementNames(Schema.DocumentElement,nil,nil);
    AddDataToTree(vstPXML,Doc.DocumentElement,nil);
    vstPXML.FullExpand();  
    ShowElementButtons;
    IsExistingFile := true;
    ShowModal;
    Result := Successful;
end;

function TfrmPXML.CreateNewFile : String;
begin
    Clear;
    Doc := TXMLDocument.Create(frmPXML);
    Doc.Options := [doNodeAutoIndent];
    Doc.LoadFromFile(ExtractFilePath(Application.ExeName) + NEW_DEFAULT_FILE);
    Schema := TXMLDocument.Create(frmPXML);
    if Length(ExtractFileDrive(frmMain.Settings.SchemaFile)) > 0 then // full path
        Schema.LoadFromFile(frmMain.Settings.SchemaFile)
    else
        Schema.LoadFromFile(ExtractFilePath(Application.ExeName) + frmMain.Settings.SchemaFile);   
    GetElementNames(Schema.DocumentElement,nil,nil);  
    AddDataToTree(vstPXML,Doc.DocumentElement,nil);
    vstPXML.FullExpand();
    ShowElementButtons;
    IsExistingFile := false;
    ShowModal;
    if Successful then
        Result := sadPXML.FileName
    else
        Result := '';
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
        if pnlValue.Visible then
        begin
            if Length(edtValue.Text) = 0 then
                edtValue.Text := DATA_MISSING_STR;
            PData.Node.NodeValue := edtValue.Text;
        end else
        begin
            if memValue.Lines.Count = 0 then
                memValue.Lines.Add(DATA_MISSING_STR);
            PData.Node.NodeValue := memValue.Lines.Text;
        end;
    end;
end;

procedure TfrmPXML.ResetPanels;
var
    I : Integer;
begin
    for I := High(CurrentPanels) downto 0 do
    begin
        try
            CurrentPanels[I].Free;
        finally
            SetLength(CurrentPanels,High(CurrentPanels));
        end;
    end;
    lblNoValue.Visible := true;
    lblNoAttr.Visible := true;
    pnlValue.Visible := false;
    pnlValueText.Visible := false;
    redDescription.Clear;
    redDescription.Lines.Add(NO_DESCRIPTION_LINE);
end;

procedure TfrmPXML.AddPanels(Data: PXMLTreeData);
var
    temp : String;
    I,K : Integer;
    SchemaNode, AttrNode, SchAttrNode : IXMLNode;
    List : TStrings;
    Found : Boolean;
    PData : PXMLTreeData;
begin
    if Data = nil then
        Exit;
    if (Data.Node.IsTextElement) OR (Data.Node.NodeType = ntComment) then
    begin
        try
            // fails on nodes without data
            temp := Data.Node.Text;
            if Data.Node.NodeName = FULL_TEXT_ELEMENT then
            begin
                memValue.Lines.Text := temp;
                pnlValueText.Visible := true;
            end else
            begin
                edtValue.Text := temp;
                pnlValue.Visible := true;
            end; 
            lblNoValue.Visible := false;
        except
            // suppress error
        end;
    end;

    // get root parent node of selected node (application or package, childs of PXML node)
    SchemaNode := Data.Node;
    while SchemaNode.ParentNode.NodeName <> Schema.DocumentElement.NodeName do
    begin
        SchemaNode := SchemaNode.ParentNode;
    end;        
    // get the equivalent of the selected node from the schema file
    SchemaNode := FindNode(Data.Node.NodeName,FindNode(SchemaNode.NodeName,Schema.DocumentElement));

    // not found
    if SchemaNode = nil then
    begin
        frmMain.LogLine('Node not found in schema file (caused either by an ' +
                        'outdated schema or invalid PXML file)',wlWarning);
        // display all found attributes (as default string panels)
        for I := 0 to Data.Node.AttributeNodes.Count - 1 do
        begin
            lblNoAttr.Visible := false;
            AttrNode := Data.Node.AttributeNodes.Get(I);
            SetLength(CurrentPanels,Length(CurrentPanels)+1);
            CurrentPanels[High(CurrentPanels)] := TStringItemPanel.Create(scbValues,AttrNode,Data.Node);
        end;
        Exit;
    end;

    // schema node was found
    List := TStringList.Create;
    for I := 0 to SchemaNode.AttributeNodes.Count - 1 do
    begin
        List.Clear;
        SchAttrNode := SchemaNode.AttributeNodes.Get(I);

        Found := false;
        for K := 0 to High(SCHEMA_ATTRIBUTES) do  // check for special schema attributes
        begin
            if SchAttrNode.NodeName = SCHEMA_ATTRIBUTES[K] then
            begin
                if K = 0 then // elemdesc
                begin
                    temp := ExtractFilePath(Application.ExeName) + SchAttrNode.Text;
                    if FileExists(temp) then
                    begin
                        redDescription.Clear;
                        redDescription.Lines.LoadFromFile(temp);
                    end;
                end;  
                Found := true;
                Break;
            end;
        end;

        if not Found then // any regular attribute
        begin
            // check whether already present (either load or clone from scheme)
            AttrNode := Data.Node.AttributeNodes.FindNode(SchAttrNode.NodeName);
            if AttrNode = nil then
            begin
                AttrNode := SchAttrNode.CloneNode(true);
                AttrNode.Text := '';
                Data.Node.AttributeNodes.Add(AttrNode);
            end;
            // now attribute is guaranteed to be present
            Tokenize(SchAttrNode.Text,DELIMITER_STR,List);

            // check for errors - add default panel   
            SetLength(CurrentPanels,Length(CurrentPanels)+1);
            CurrentPanels[High(CurrentPanels)] := nil;
            if List.Count < 2 then
            begin
                CurrentPanels[High(CurrentPanels)] := TStringItemPanel.Create(scbValues,AttrNode,Data.Node);
                Continue;
            end;

            // add panel for it
            try
                // create panel by type
                temp := List.Strings[1];
                if temp = 'string' then
                    CurrentPanels[High(CurrentPanels)] := TStringItemPanel.Create(scbValues,AttrNode,Data.Node)
                else if temp = 'set' then
                    CurrentPanels[High(CurrentPanels)] := TSetItemPanel.Create(scbValues,AttrNode,Data.Node)
                else if temp = 'boolean' then
                    CurrentPanels[High(CurrentPanels)] := TBooleanItemPanel.Create(scbValues,AttrNode,Data.Node)
                else if temp = 'category' then
                    CurrentPanels[High(CurrentPanels)] := TCategoryItemPanel.Create(scbValues,AttrNode,Data.Node)
                else if temp = 'subcategory' then
                begin
                    PData := vstPXML.GetNodeData(vstPXML.GetFirstSelected().Parent);
                    for K := 0 to PData.Node.AttributeNodes.Count - 1 do
                    begin
                        if PData.Node.AttributeNodes.Get(K).NodeName = 'name' then
                        begin
                            try
                                temp := PData.Node.AttributeNodes.Get(K).NodeValue;
                            except
                                temp := '';
                            end;
                            CurrentPanels[High(CurrentPanels)] := TSubcategoryItemPanel.Create(scbValues,AttrNode,Data.Node,temp);
                            Break;
                        end;
                    end;
                    if CurrentPanels[High(CurrentPanels)] = nil then
                    begin
                        CurrentPanels[High(CurrentPanels)] := TStringItemPanel.Create(scbValues,AttrNode,Data.Node);
                        Continue;
                    end;
                end
                else
                    raise EUnknownPanelType.Create('Unknown attribute type "' + temp + '"');
                // set optional flag
                CurrentPanels[High(CurrentPanels)].SetOptional(List.Strings[0] = 'optional');
                if List.Count > 2 then
                begin
                    List.Delete(0); // optional|required
                    List.Delete(0); // type
                    CurrentPanels[High(CurrentPanels)].SetTypeData(List);
                end;
            except
                on E : EUnknownPanelType do
                begin
                    MessageDlg(E.Message,mtError,[mbOK],0);
                    SetLength(CurrentPanels,High(CurrentPanels));
                end else
                begin
                    CurrentPanels[High(CurrentPanels)].Free; 
                    SetLength(CurrentPanels,High(CurrentPanels));
                end;
            end;
        end;
    end;
    List.Free;
    if Length(CurrentPanels) > 0 then
        lblNoAttr.Visible := false;
end;  

function TfrmPXML.FindNode(Tree: TBaseVirtualTree; const S: String;
    Base: PVirtualNode) : PVirtualNode;
var
    Node : PVirtualNode;
    PData : PXMLTreeData;
begin
    Node := Base;
    while Node <> nil do
    begin
        PData := Tree.GetNodeData(Node);
        if SameText(PData.DisplayKey,S) then
        begin
            Result := Node;
            Exit;
        end;
        Result := FindNode(Tree,S,Tree.GetFirstChild(Node));
        if Result <> nil then
            Exit;
        Node := Tree.GetNextSibling(Node);
    end;
    Result := nil;
end;

function TfrmPXML.FindSelectedNode(Tree: TBaseVirtualTree; const S: String) : PVirtualNode;
var
    Node : PVirtualNode;
    PData : PXMLTreeData;
begin
    Result := nil;
    Node := Tree.GetFirstSelected();
    while Node <> nil do
    begin
        PData := Tree.GetNodeData(Node);
        if (PData <> nil) AND SameText(PData.DisplayKey,S) then
        begin
            Result := Node;
            Exit;
        end;
        Node := Node.Parent;
    end;
end;

function TfrmPXML.FindNode(const S: string; Node: IXMLNode) : IXMLNode;
var
    I : Integer;
begin
    Result := nil;
    try
        if SameText(Node.NodeName,S) then
        begin
            Result := Node;
            Exit;
        end;
    except
        //
    end;
    for I := 0 to Node.ChildNodes.Count - 1 do
    begin
        if Node.ChildNodes[I].NodeType <> ntText then
            Result := FindNode(S,Node.ChildNodes[I]);
        if Result <> nil then
            Exit;
    end;
end;

function TfrmPXML.CountNodes(Tree : TBaseVirtualTree; const S : String;
    Base : PVirtualNode) : Integer;
var
    Node : PVirtualNode;
    PData : PXMLTreeData;
begin
    Result := 0;
    Node := Base;
    while Node <> nil do
    begin
        PData := Tree.GetNodeData(Node);
        if SameText(PData.DisplayKey,S) then
            Inc(Result);
        Inc(Result,CountNodes(Tree,S,Tree.GetFirstChild(Node)));
        Node := Tree.GetNextSibling(Node);
    end;
end;

function TfrmPXML.AddEmptyNode(Tree : TBaseVirtualTree; Element : PPXMLElement) : PVirtualNode;

// Copies a node from the schema to the active XML Doc, stripping all schema
// attributes and data (essentially creating a blank node)
function CreateNode(Tree : TBaseVirtualTree; const CopyData : PPXMLElement;
    const ParentTreeNode : PVirtualNode) : PVirtualNode;
var
    PData, PData2 : PXMLTreeData;
    temp : IXMLNode;
    I,K : Integer;
begin
    Result := Tree.AddChild(ParentTreeNode);
    PData := Tree.GetNodeData(Result);
    PData.Node := CopyData.XNode.CloneNode(false);
    PData.SchemaLink := CopyData;
    if ParentTreeNode = nil then
    begin
        Doc.DocumentElement.ChildNodes.Add(PData.Node);
    end else
    begin
        PData2 := Tree.GetNodeData(ParentTreeNode);
        PData2.Node.ChildNodes.Add(PData.Node);
    end;
    // strip schema data attributes from node
    I := 0;
    while I < PData.Node.AttributeNodes.Count do
    begin    
        PData.Node.AttributeNodes[I].Text := '';
        for K := 0 to High(SCHEMA_ATTRIBUTES) do
        begin
            if PData.Node.AttributeNodes[I].NodeName = SCHEMA_ATTRIBUTES[K] then
            begin
                PData.Node.AttributeNodes.Delete(I);
                Dec(I);
                Break;
            end;
        end;
        Inc(I);
    end;
    // add value node (which did not get copied) - if present in archetype
    for I := 0 to CopyData.XNode.ChildNodes.Count - 1 do
    begin
        if CopyData.XNode.ChildNodes[I].NodeType = ntText then
        begin
            temp := CopyData.XNode.ChildNodes[I].CloneNode(true);
            temp.NodeValue := '';
            PData.Node.ChildNodes.Add(temp);
        end;
    end;
    
end;

var
    ParentNode, RootParentNode : PVirtualNode;
    XNode, XRootParentNode : IXMLNode;
    I : Integer;
begin
    Result := nil;

    // get package or application element
    if Element.Root <> nil then
    begin
        XRootParentNode := Element.Root.XNode;
        RootParentNode := FindSelectedNode(Tree,Element.Root.Tag);
        if RootParentNode = nil then
        begin
            RootParentNode := FindNode(Tree,Element.Root.Tag,Tree.GetFirst());
            if RootParentNode = nil then
                RootParentNode := AddEmptyNode(Tree,Element.Root);
        end;
    end else
    begin
        XRootParentNode := Schema.DocumentElement; 
        RootParentNode := nil;
    end;
        
    // get archetype node from scheme
    XNode := Element.XNode;

    // check whether parents exist in tree and create it
    if (XNode.ParentNode <> XRootParentNode) AND (XNode.ParentNode <> Schema.DocumentElement) then
        ParentNode := AddEmptyNode(Tree,Element.Parent)
    else
        ParentNode := RootParentNode;

    // check whether node already exists or may exist multiple times
    Result := FindNode(Tree,Element.Tag,Tree.GetFirstChild(ParentNode));
    if Result <> nil then
    begin
        for I := 0 to XNode.AttributeNodes.Count - 1 do
        begin
            if XNode.AttributeNodes[I].NodeName = SCHEMA_ATTRIBUTES[2] then // max
            begin
                if (CountNodes(Tree,Element.Tag,Tree.GetFirstChild(ParentNode)) >= XNode.AttributeNodes[I].NodeValue) AND
                   (XNode.AttributeNodes[I].NodeValue > 0) then
                    Exit
                else // it's okay, we did not hit the limit yet
                begin
                    Result := nil;
                    Break;
                end;
            end;
        end;
        // max attribute not found
        if (Result <> nil) AND (CountNodes(Tree,Element.Tag,Tree.GetFirstChild(ParentNode)) >= MAX_DEFAULT_VALUE) then
            Exit;
    end;

    // create the actual node (finally!)
    Result := CreateNode(Tree,Element,ParentNode);
end;

procedure TfrmPXML.GetElementNames(Node : IXMLNode; ParentElement : PPXMLElement;
    RootElement : PPXMLElement);
var I,K : Integer;
    temp : PPXMLElement;
    IsRoot : Boolean;
begin
    for I := 0 to Node.ChildNodes.Count - 1 do
    begin
        if not (Node.ChildNodes[I].NodeType in [ntText,ntComment]) then
        begin
            New(temp);
            temp.Tag := Node.ChildNodes[I].NodeName;
            temp.Root := RootElement;
            temp.Parent := ParentElement;
            temp.XNode := Node.ChildNodes[I];
            if RootElement <> nil then
                temp.Display := Node.ChildNodes[I].NodeName + ' (' + RootElement.Tag + ')'
            else
                temp.Display := Node.ChildNodes[I].NodeName;

            SetLength(PXMLElements,Length(PXMLElements)+1);
            PXMLElements[High(PXMLElements)] := temp;

            IsRoot := false;
            for K := 0 to High(ROOT_ELEMENT_NAMES) do
                if temp.Tag = ROOT_ELEMENT_NAMES[K] then
                        IsRoot := true;

            if IsRoot then
                GetElementNames(Node.ChildNodes[I],temp,temp)
            else
                GetElementNames(Node.ChildNodes[I],temp,RootElement)
        end;
    end;
end;

procedure TfrmPXML.ShowElementButtons;
var I : Integer;
    temp : TXMLGrpButtonItem;
    S : String;
    PData : PXMLTreeData;
    Node : PVirtualNode;
begin
    for I := 0 to bugElements.Items.Count - 1 do
        bugElements.Items[0].Free;
    bugElements.Items.Clear;
    // determine what buttons to show
    S := '';
    if rabSelection.Checked then
    begin
        Node := vstPXML.GetFirstSelected();
        if Node = nil then
            Node := vstPXML.GetFirst();
        if Node = nil then // this should never happen (and probably won't)
            Exit;
        PData := vstPXML.GetNodeData(Node);
        // check whether element can have child elements (aka there are elements with this as parent)
        for I := 0 to High(PXMLElements) do
            if (PXMLElements[I].Parent <> nil) AND
               (PXMLElements[I].Parent.Tag = PData.DisplayKey) then
            begin
                S := PData.DisplayKey;
                Break;
            end;
        // else use parent element
        if Length(S) = 0 then
        begin
            Node := Node.Parent;
            PData := vstPXML.GetNodeData(Node);
            S := PData.DisplayKey;
        end;
    end else
    if rabPackage.Checked then
        S := 'package'
    else
    if rabApplication.Checked then
        S := 'application';

    for I := 0 to High(PXMLElements) do
    begin
        if ((Length(S) = 0) OR (PXMLElements[I].Parent = nil) OR
           (PXMLElements[I].Parent.Tag = S)) then
        begin
            temp := TXMLGrpButtonItem.Create(bugElements.Items);
            temp.Caption := PXMLElements[I].Tag;
            temp.Data := PXMLElements[I];
        end;
    end;
end;

// --- Tree --------------------------------------------------------------------

procedure TfrmPXML.vstPXMLChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
    UpdateXMLData;
    ResetPanels;
    CurrentNode := Sender.GetFirstSelected();
    AddPanels(Sender.GetNodeData(CurrentNode));
    if rabSelection.Checked then
        ShowElementButtons;
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
    XNode : IXMLNode;
    I : Integer;
begin
    PData := Sender.GetNodeData(Node);
    PData.DisplayKey := PData.Node.NodeName;
    XNode := PData.Node;
    while XNode.ParentNode <> Doc.DocumentElement do
        XNode := XNode.ParentNode;
    for I := 0 to High(PXMLElements) do
        if (PXMLElements[I].Tag = PData.DisplayKey) AND
           ((PXMLElements[I].Root = nil) OR (PXMLElements[I].Root.Tag = XNode.NodeName)) then
           PData.SchemaLink := PXMLElements[I];

end;

procedure TfrmPXML.vstPXMLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ((vstPXML.Focused) AND (Key = 46) AND (vstPXML.GetFirstSelected() <> nil)) then
        pomPXMLDeleteClick(Sender);  
end;

procedure TfrmPXML.vstPXMLMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    Node : PVirtualNode;
begin
    if Button = mbRight then
    begin
        Node := (Sender as TBaseVirtualTree).GetNodeAt(X,Y);
        if Node <> nil then
        begin
            (Sender as TBaseVirtualTree).ClearSelection;
            (Sender as TBaseVirtualTree).Selected[Node] := true;
            pomPXML.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        end;
    end;
end;

// --- Buttons -----------------------------------------------------------------

procedure TfrmPXML.btnCancelClick(Sender: TObject);
begin 
    Successful := false;
    Close;
end;

procedure TfrmPXML.btnOKClick(Sender: TObject);
begin        
    UpdateXMLData;
    ResetPanels;
    Successful := true;
    if IsExistingFile then
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

procedure TfrmPXML.bugElementsButtonClicked(Sender: TObject; Index: Integer);
var temp : PPXMLElement;
begin
    temp := (bugElements.Items[Index] as TXMLGrpButtonItem).Data;
    vstPXML.Selected[AddEmptyNode(vstPXML,temp)] := true;
end;

// --- Context Menu ------------------------------------------------------------

procedure TfrmPXML.pomPXMLDeleteClick(Sender: TObject);
var
    Node : PVirtualNode;
    PData : PXMLTreeData;
begin
    ResetPanels;
    CurrentNode := nil;
    Node := vstPXML.GetFirstSelected();
    PData := vstPXML.GetNodeData(Node);
    PData.Node.ParentNode.ChildNodes.Remove(PData.Node);
    vstPXML.DeleteSelectedNodes;
end;

procedure TfrmPXML.rabSelectionClick(Sender: TObject);
begin
    ShowElementButtons;
end;

// --- Form --------------------------------------------------------------------

procedure TfrmPXML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ResetPanels;
    Clear;
end;

procedure TfrmPXML.FormCreate(Sender: TObject);  
var
    dummy : TButtonEvent;
begin
    vstPXML.NodeDataSize := SizeOf(rXMLTreeData);
    CurrentNode := nil;
    Doc := nil;
    Schema := nil;
    {$Ifdef Win32}
    KeyPreview := true;
    dummy := TButtonEvent.Create;
    OnKeyDown := dummy.KeyDown; 
    dummy.Free;
    {$Endif}
    SetLength(TrueBoolStrs,2);
    TrueBoolStrs[0] := 'true';
    TrueBoolStrs[1] := '1';
    SetLength(FalseBoolStrs,2);
    FalseBoolStrs[0] := 'false';
    FalseBoolStrs[1] := '0';
end;

procedure TfrmPXML.FormShow(Sender: TObject);
begin
    if not IsExistingFile then
        MessageDlg('The necessary structure for a valid PXML file will be auto-generated.'#13#10 +
                   'You must enter valid data to all those nodes (execpt where optional).'#13#10 +
                   'It is also recommended you add optional data such as an icon to make your PND'#13#10 +
                   'more recognizable. You can do so with the buttons at the bottom of the window.'#13#10 +
                   'Click on nodes in the structure on the left to show input fields to their values.'#13#10 +
                   'Don''t forget to update mandatory package information, such as id and name, on'#13#10 +
                   'the application and package tags!',
                   mtInformation,[mbOK],0);
end;

// --- TItemPanel --------------------------------------------------------------

constructor TItemPanel.Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode);
begin
    inherited Create(NewParent);
    Parent := NewParent;
    Align := alTop;
    AlignWithMargins := true;
    Height := 21;
    Top := frmPXML.lblDescription.Top - Height;
    BevelOuter := bvNone;
    Caption := '';
    Attr := AttrNode;
    Node := ParentNode;
end;

// --- TStringItemPanel --------------------------------------------------------

constructor TStringItemPanel.Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode);
begin
    inherited Create(NewParent,AttrNode,ParentNode);

    chars := nil;
    lblKey := TLabel.Create(self);
    with lblKey do
    begin
        Caption := Attr.NodeName + '=';
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
        Text := Attr.Text;
    end;
end;

destructor TStringItemPanel.Free;
begin
    if Length(edtValue.Text) = 0 then
        Node.AttributeNodes.Delete(Attr.NodeName);
    lblKey.Free;
    edtValue.Free;
    chars.Free;
    inherited Destroy;
end;

procedure TStringItemPanel.SetOptional(const Optional: Boolean);
begin
    if Optional then
        lblKey.Font.Color := OPTIONAL_COLOR
    else
        lblKey.Font.Color := REQUIRED_COLOR;
end;

procedure TStringItemPanel.SetTypeData(const Arguments: TStrings);
var
    temp : String;
    I : Integer;
begin
    temp := Arguments.Strings[0];
    if temp = 'version' then
        edtValue.OnKeyPress := InputFilter.VersionKeyPress
    else if temp = 'email' then
        edtValue.OnKeyPress := InputFilter.EmailKeyPress
    else if temp = 'folder' then
        edtValue.OnKeyPress := InputFilter.FolderKeyPress
    else if temp = 'language' then
        edtValue.OnKeyPress := InputFilter.LanguageKeyPress
    else if temp = 'mime' then
        edtValue.OnKeyPress := InputFilter.MimeKeyPress
    else if temp = 'integer' then
        edtValue.OnKeyPress := InputFilter.IntegerKeyPress
    else if temp = 'id' then
        edtValue.OnKeyPress := InputFilter.IDKeyPress
    else
    begin
        chars := TStringList.Create;
        for I := 0 to Arguments.Count - 1 do
            if Length(Arguments.Strings[I]) = 1 then // only add single chars
                chars.Add(Arguments.Strings[I]);
        if chars.Count > 0 then
            edtValue.OnKeyPress := GenericKeyPress
        else
            begin
            chars.Free;
            chars := nil;
            end;
    end;
end;

procedure TStringItemPanel.UpdateData;
begin
    Attr.NodeValue := edtValue.Text;
end;

procedure TStringItemPanel.GenericKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #8) OR (chars.IndexOf(Key) = -1) then
        InputFilter.DisregardKey(Key);
end;

// --- TBooleanItemPanel -------------------------------------------------------

constructor TBooleanItemPanel.Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode);
begin
    inherited Create(NewParent,AttrNode,ParentNode);

    cbxValue := TCheckBox.Create(self);
    with cbxValue do
    begin
        Caption := Attr.NodeName;
        Align := alClient;
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
        AllowGrayed := true;
        try
            Checked := StrToBool(Attr.Text);
        except // value faulty or not present
            State := cbGrayed;
        end;
    end;
end;

destructor TBooleanItemPanel.Free;
begin
    if cbxValue.State = cbGrayed then
       Node.AttributeNodes.Delete(Attr.NodeName);
    cbxValue.Free;
    inherited Destroy;
end;

procedure TBooleanItemPanel.SetOptional(const Optional: Boolean);
begin
    // Changing the colour of the text is not supported on newer versions of Windows
    if Optional then
        cbxValue.Caption := cbxValue.Caption + ' (optional)';
end;

procedure TBooleanItemPanel.SetTypeData(const Arguments: TStrings);
begin
    // no arguments taken
end;

procedure TBooleanItemPanel.UpdateData;
begin
    Attr.NodeValue := BoolToStr(cbxValue.Checked,true);
end;

// --- TSetItemPanel -----------------------------------------------------------

constructor TSetItemPanel.Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode);
begin
    inherited Create(NewParent,AttrNode,ParentNode);

    lblKey := TLabel.Create(self);
    with lblKey do
    begin
        Caption := Attr.NodeName + '=';
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

    cobValue := TComboBox.Create(self);
    with cobValue do
    begin
        Align := alClient;
        Parent := self;
        Text := Attr.Text;
    end;
end;

destructor TSetItemPanel.Free;
begin
    if Length(cobValue.Text) = 0 then
        Node.AttributeNodes.Delete(Attr.NodeName);
    lblKey.Free;
    cobValue.Free;
    inherited Destroy;
end;

procedure TSetItemPanel.SetOptional(const Optional: Boolean);
begin
    if Optional then
        lblKey.Font.Color := OPTIONAL_COLOR
    else
        lblKey.Font.Color := REQUIRED_COLOR;
end;

procedure TSetItemPanel.SetTypeData(const Arguments: TStrings);
begin
    cobValue.Items.AddStrings(Arguments);
end;

procedure TSetItemPanel.UpdateData;
begin
    Attr.NodeValue := cobValue.Text;
end;

// --- TCategoryItemPanel ------------------------------------------------------

constructor TCategoryItemPanel.Create(NewParent: TWinControl; AttrNode: IXMLNode;
    ParentNode: IXMLNode);
var F : TextFile;
    S : String;
begin
    inherited Create(NewParent,AttrNode,ParentNode);
    try
        AssignFile(F,ExtractFilePath(Application.ExeName) + CATEGORIES_FILE);
        Reset(F);
        while not EOF(F) do
        begin
            ReadLn(F,S);
            cobValue.Items.Add(S);
            ReadLn(F,S); // Skip sub-categories
        end;
    finally
        CloseFile(F);
    end;
end;

function TCategoryItemPanel.GetCategory : String;
begin
    Result := cobValue.Text;
end;

// --- TSubcategoryItemPanel ---------------------------------------------------

constructor TSubcategoryItemPanel.Create(NewParent : TWinControl;
    AttrNode, ParentNode : IXMLNode; Category : String);
var F : TextFile;
    S : String;
    L : TStrings;
begin    
    inherited Create(NewParent,AttrNode,ParentNode);
    try
        AssignFile(F,ExtractFilePath(Application.ExeName) + CATEGORIES_FILE);
        Reset(F);
        while not EOF(F) do
        begin
            ReadLn(F,S);
            if S = Category then
            begin             
                ReadLn(F,S);
                L := TStringList.Create;
                L.Delimiter := '|';
                L.DelimitedText := S;
                cobValue.Items.AddStrings(L);
                Break;
            end;
        end;
    finally
        CloseFile(F);
    end;
end;

end.
