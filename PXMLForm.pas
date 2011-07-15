unit PXMLForm;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, ExtCtrls, XMLDoc, XMLIntf, ComCtrls, Menus;

type
  rXMLTreeData = record
    Node : IXMLNode;
    DisplayKey : String;
  end;
  PXMLTreeData = ^rXMLTreeData;

  rPXMLElement = record
    Tag : String;
    Root : String;
    Display : String;
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
    cobElement: TComboBox;
    btnAdd: TButton;
    pomPXML: TPopupMenu;
    pomPXMLDelete: TMenuItem;
    procedure pomPXMLDeleteClick(Sender: TObject);
    procedure vstPXMLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddClick(Sender: TObject);
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
    procedure AddDataToTree(Tree : TBaseVirtualTree; Data : IXMLNode;
      Node : PVirtualNode);
    procedure UpdateXMLData;
    procedure ResetPanels;
    procedure AddPanels(Data : PXMLTreeData);
    function  FindNode(Tree : TBaseVirtualTree; const S : String;
      Base : PVirtualNode) : PVirtualNode; overload;
    function  FindNode(const S : String; Node : IXMLNode) : IXMLNode; overload;
  public
    procedure Clear;
    function  LoadFromFile(const FileName : String) : Boolean;
    function  AddEmptyNode(Tree : TBaseVirtualTree; const ElementName : String;
      const ParentRootElementName : String) : PVirtualNode;
    procedure GetElementNames(Node : IXMLNode; RootElementName : String);
  end;

  EUnknownPanelType = class (Exception);

  TItemPanel = class(TCustomPanel)
    Attr : IXMLNode;
    Node : IXMLNode;
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode); virtual;
    destructor Free; virtual; abstract;
    procedure SetOptional(const Optional : Boolean); virtual; abstract;
    procedure SetTypeData(const Arguments : TStrings); virtual; abstract;
    procedure UpdateData; virtual; abstract;
  end;

  TStringItemPanel = class (TItemPanel)    
    lblKey: TLabel;
    edtValue: TEdit;
    chars: TStringList;
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode);
    destructor Free; override;
    procedure SetOptional(const Optional : Boolean); override;
    procedure SetTypeData(const Arguments : TStrings); override;
    procedure UpdateData; override;
  private
    procedure GenericKeyPress(Sender: TObject; var Key: Char);
    procedure VersionKeyPress(Sender: TObject; var Key: Char);
    procedure EmailKeyPress(Sender: TObject; var Key: Char);
    procedure FolderKeyPress(Sender: TObject; var Key: Char);
    procedure LanguageKeyPress(Sender: TObject; var Key: Char);  
    procedure MimeKeyPress(Sender: TObject; var Key: Char);
    procedure IntegerKeyPress(Sender: TObject; var Key: Char);
    procedure IDKeyPress(Sender: TObject; var Key: Char);
    procedure DisregardKey(var Key: Char);
  end;

  TSetItemPanel = class (TItemPanel)
    lblKey: TLabel;
    cobValue: TComboBox;  
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode);
    destructor Free; override;
    procedure SetOptional(const Optional : Boolean); override;
    procedure SetTypeData(const Arguments : TStrings); override;
    procedure UpdateData; override;
  end;

  TBooleanItemPanel = class (TItemPanel)
    cbxValue: TCheckBox;
  public
    constructor Create(NewParent : TWinControl; AttrNode, ParentNode : IXMLNode);
    destructor Free; override;
    procedure SetOptional(const Optional : Boolean); override;
    procedure SetTypeData(const Arguments : TStrings); override;
    procedure UpdateData; override;
  end;

const
  NO_DESCRIPTION_LINE : String   = 'no description available for this element';
  DESCRIPTION_ATTRIBUTE : String = 'elemdesc';
  DELIMITER_STR : String         = ',';
  OPTIONAL_COLOR : TColor        = clGrayText;
  REQUIRED_COLOR : TColor        = clWindowText;
  ROOT_ELEMENT_NAMES : array [0..1] of String = ('package','application');

var
  frmPXML: TfrmPXML;
  Doc : TXMLDocument;
  Schema : TXMLDocument;
  CurrentPanels : Array of TItemPanel;
  PXMLElements : Array of rPXMLElement;
  CurrentNode : PVirtualNode;

implementation

uses {$Ifdef Win32}ControlHideFix,{$Endif} MainForm, FormatUtils, Math;

{$R *.dfm}

    // DONE: Parse scheme file or some custom file to check for elements without text attribute
    // TODO: Validate PXML (using scheme) - check for files (binary, icons, pics)
    // DONE: Functionality to add and remove elements
    // DONE: Parse external file for descriptions
    // DONE: Validate strings using regex or something like that
    // DONE: Custom ItemPanel classes for special fields (dropDown, etc.)
    // TODO: Add info about multiple elements of the same kind to scheme and loading functionality here
    // TODO: Context-sensitive context menu for adding elements
    // TODO: Wizard for PXML creation (creating a quick-and-dirty PXML)
    // TODO: Fill element dropDown (preferrebly from schema file)
    // TODO: Panel type for paths (tricky to do as relative from PND)
    // TODO: Panel type for category and sub-category
    // DONE: Select added element
    // TODO: Get correct application element by selection in browser


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
begin
    Doc.Free;
    Schema.Free;
    Doc := nil;
    Schema := nil;
    CurrentNode := nil;
    vstPXML.Clear;
    cobElement.Clear;
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
    GetElementNames(Schema.DocumentElement,'');
    AddDataToTree(vstPXML,Doc.DocumentElement,nil);
    vstPXML.FullExpand();
    Result := true;
end;

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
        try
            CurrentPanels[I].Free;
        finally
            SetLength(CurrentPanels,High(CurrentPanels));
        end;
    end;
    lblNoValue.Visible := true;
    lblNoAttr.Visible := true;
    pnlValue.Visible := false;
    redDescription.Clear;
    redDescription.Lines.Add(NO_DESCRIPTION_LINE);
end;

procedure TfrmPXML.AddPanels(Data: PXMLTreeData);
var
    temp : String;
    I : Integer;
    SchemaNode, AttrNode, SchAttrNode : IXMLNode;
    List : TStrings;
begin
    if Data = nil then
        Exit;
    if (Data.Node.IsTextElement) OR (Data.Node.NodeType = ntComment) then
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
                         
    // TODO: Search for nodes in parent nodes only, not document node
    // get the equivalent of the selected node from the schema file
    SchemaNode := FindNode(Data.Node.NodeName,Schema.DocumentElement);

    // not found
    // TODO: Spit out error here (not as popup though as that might generate 1000 on a bad file)
    if SchemaNode = nil then
    begin
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

        if (SchAttrNode.NodeName <> DESCRIPTION_ATTRIBUTE) then // any regular attribute
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
            if List.Count < 2 then
            begin
                CurrentPanels[High(CurrentPanels)] := TStringItemPanel.Create(scbValues,AttrNode,Data.Node);
                Continue;
            end;

            // add panel for it
            SetLength(CurrentPanels,Length(CurrentPanels)+1);
            try
                // create panel by type
                temp := List.Strings[1];
                if temp = 'string' then
                    CurrentPanels[High(CurrentPanels)] := TStringItemPanel.Create(scbValues,AttrNode,Data.Node)
                else if temp = 'set' then
                    CurrentPanels[High(CurrentPanels)] := TSetItemPanel.Create(scbValues,AttrNode,Data.Node)
                else if temp = 'boolean' then
                    CurrentPanels[High(CurrentPanels)] := TBooleanItemPanel.Create(scbValues,AttrNode,Data.Node) 
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
        end else
        begin
            temp := ExtractFilePath(Application.ExeName) + SchAttrNode.Text;
            if FileExists(temp) then
            begin
                redDescription.Clear;  
                redDescription.Lines.LoadFromFile(temp);
            end;
        end;
    end;
    List.Free;
    if Length(CurrentPanels) > 0 then
        lblNoAttr.Visible := false;
end;  

function TfrmPXML.FindNode(Tree: TBaseVirtualTree; const S: string;
    Base: PVirtualNode) : PVirtualNode;
var
    Node : PVirtualNode;
    PData : PXMLTreeData;
begin
    Node := Base;
    if Node = nil then
        Node := Tree.GetFirst();
    while Node <> nil do
    begin
        PData := Tree.GetNodeData(Node);
        if SameText(PData.DisplayKey,S) then
        begin
            Result := Node;
            Exit;
        end;
        Node := Tree.GetNext(Node);
    end;
    Result := nil;
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

function TfrmPXML.AddEmptyNode(Tree : TBaseVirtualTree; const ElementName : String;
    const ParentRootElementName : String) : PVirtualNode;

function CreateNode(Tree : TBaseVirtualTree; const CopyNode : IXMLNode;
    const ParentTreeNode : PVirtualNode) : PVirtualNode;
var
    PData, PData2 : PXMLTreeData;
    temp : IXMLNode;
    I : Integer;
begin
    Result := Tree.AddChild(ParentTreeNode);
    PData := Tree.GetNodeData(Result);
    PData.Node := CopyNode.CloneNode(false);
    if ParentTreeNode = nil then
    begin
        Doc.DocumentElement.ChildNodes.Add(PData.Node);
    end else
    begin
        PData2 := Tree.GetNodeData(ParentTreeNode);
        PData2.Node.ChildNodes.Add(PData.Node);
    end;
    // strip schema data attributes from node
    for I := 0 to PData.Node.AttributeNodes.Count - 1 do
    begin
        if PData.Node.AttributeNodes[I].NodeName = DESCRIPTION_ATTRIBUTE then
            temp := PData.Node.AttributeNodes[I];
        PData.Node.AttributeNodes[I].Text := '';
    end;
    PData.Node.AttributeNodes.Remove(temp);
    // add value node (which did not get copied) - if present in archetype
    for I := 0 to CopyNode.ChildNodes.Count - 1 do
    begin
        if CopyNode.ChildNodes[I].NodeType = ntText then
        begin
            temp := CopyNode.ChildNodes[I].CloneNode(true);
            temp.NodeValue := 'TEXT HERE';
            PData.Node.ChildNodes.Add(temp);
        end;
    end;
    
end;

var
    ParentNode, RootParentNode : PVirtualNode;
    XNode, XRootParentNode : IXMLNode;
begin
    // get package or application element  
    XRootParentNode := FindNode(ParentRootElementName,Schema.DocumentElement);
    if Length(ParentRootElementName) > 0 then
    begin
        RootParentNode := FindNode(Tree,ParentRootElementName,nil);
        if RootParentNode = nil then
            RootParentNode := CreateNode(Tree,XRootParentNode,nil);
    end
    else
        RootParentNode := Tree.RootNode;

    // check whether node already exists
    Result := FindNode(Tree,ElementName,RootParentNode);
    if Result <> nil then
        Exit;

    // get archetype node from scheme
    XNode := FindNode(ElementName,XRootParentNode);
    if XNode = nil then
    begin
        // TODO: Spit out error here
        Exit;
    end;

    // check whether parents exist in tree and create them
    if (XNode.ParentNode <> XRootParentNode) AND (XNode.ParentNode <> Schema.DocumentElement) then
        ParentNode := AddEmptyNode(Tree,XNode.ParentNode.NodeName,ParentRootElementName)
    else
        ParentNode := RootParentNode;

    // create the actual node (finally!)
    Result := CreateNode(Tree,XNode,ParentNode);
end;

procedure TfrmPXML.GetElementNames(Node : IXMLNode; RootElementName : String);
var I : Integer;
begin
    for I := 0 to High(ROOT_ELEMENT_NAMES) do
        if Node.NodeName = ROOT_ELEMENT_NAMES[I] then
            RootElementName := Node.NodeName;

    for I := 0 to Node.ChildNodes.Count - 1 do
    begin
        if not (Node.ChildNodes[I].NodeType in [ntText,ntComment]) then
        begin
            SetLength(PXMLElements,Length(PXMLElements)+1);
            PXMLElements[High(PXMLElements)].Tag := Node.ChildNodes[I].NodeName;
            PXMLElements[High(PXMLElements)].Root := RootElementName;
            if Length(RootElementName) > 0 then
                PXMLElements[High(PXMLElements)].Display := Node.ChildNodes[I].NodeName +
                    ' (' + RootElementName + ')'
            else
                PXMLElements[High(PXMLElements)].Display := Node.ChildNodes[I].NodeName;
            cobElement.Items.Add(PXMLElements[High(PXMLElements)].Display);
            GetElementNames(Node.ChildNodes[I],RootElementName);
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

procedure TfrmPXML.btnAddClick(Sender: TObject);
var I : Integer;
    Node : PVirtualNode;
begin
    I := cobElement.ItemIndex;
    Node := AddEmptyNode(vstPXML,PXMLElements[I].Tag,PXMLElements[I].Root);
    vstPXML.ClearSelection;
    vstPXML.Selected[Node] := true;
end;

procedure TfrmPXML.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPXML.btnOKClick(Sender: TObject);
begin
    ResetPanels;
    UpdateXMLData;
    if Assigned(Doc) then
    begin
        Doc.SaveToFile(Doc.FileName); 
        Close;
    end else
    begin
        if sadPXML.Execute then
        begin
            Doc := TXMLDocument.Create(frmPXML);
            Doc.SaveToFile(sadPXML.FileName);
            Close;
        end;
    end;
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
    OnKeyDown := dummy.KeyDown;
    {$Endif}
    SetLength(TrueBoolStrs,2);
    TrueBoolStrs[0] := 'true';
    TrueBoolStrs[1] := '1';
    SetLength(FalseBoolStrs,2);
    FalseBoolStrs[0] := 'false';
    FalseBoolStrs[1] := '0';
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
        edtValue.OnKeyPress := VersionKeyPress
    else if temp = 'email' then
        edtValue.OnKeyPress := EmailKeyPress
    else if temp = 'folder' then
        edtValue.OnKeyPress := FolderKeyPress
    else if temp = 'language' then
        edtValue.OnKeyPress := LanguageKeyPress
    else if temp = 'mime' then
        edtValue.OnKeyPress := MimeKeyPress
    else if temp = 'integer' then
        edtValue.OnKeyPress := IntegerKeyPress
    else if temp = 'id' then
        edtValue.OnKeyPress := IDKeyPress
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
        DisregardKey(Key);
end;

procedure TStringItemPanel.VersionKeyPress(Sender: TObject; var Key: Char);
begin
    // Process input normally if...
    if not (Key in ['0'..'9',#8,'+','-']) then // is backspace or a number
        DisregardKey(Key);
end;

procedure TStringItemPanel.EmailKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key in ['(',')','[',']','\',';',':',',','<','>','|']) OR // non-allowed chars
       ((Key = '@') AND (Pos('@',(Sender as TCustomEdit).Text) <> 0)) then // only one @
        DisregardKey(Key);
end;

procedure TStringItemPanel.FolderKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key in [' ','-','/','\',':','?','*','<','>','|','"']) then
        DisregardKey(Key);
end;

procedure TStringItemPanel.LanguageKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['a'..'z','A'..'Z',#8]) OR
       ((Key = '_') AND (Pos('_',(Sender as TCustomEdit).Text) <> 0)) then
       DisregardKey(Key);
end;

procedure TStringItemPanel.MimeKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['a'..'z','A'..'Z','0'..'9','-','.',#8]) OR
       ((Key = '/') AND (Pos('/',(Sender as TCustomEdit).Text) <> 0)) then 
       DisregardKey(Key);    
end;

procedure TStringItemPanel.IntegerKeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in ['0'..'9',#8]) then
        DisregardKey(Key);
end;

procedure TStringItemPanel.IDKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in['a'..'z','A'..'Z','0'..'9','.','_','!','-','+',#8]) then
        DisregardKey(Key);
end;

procedure TStringItemPanel.DisregardKey(var Key: Char);
begin
    Key := #0;
    Beep;
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

end.
