{*******************************************************}
{                                                       }
{  Utility definitions for VirtualTree implementation   }
{  The rTreeData data type is also defined here         }        
{                                                       }
{*******************************************************}

unit VSTUtils;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface
       
uses
  VirtualTrees, SysUtils;

type
    rFileTreeData = record
        Name : String;
        Size : Int64;
        Attr : Integer;
        ExcludeAttr : Integer;
        Time : Integer;
        OpenIndex : Integer;
        ClosedIndex : Integer;
    end;
    PFileTreeData = ^rFileTreeData;

    { Returns whether an item (node) in the tree is a file }
    function  IsFile(Sender : TBaseVirtualTree; Node : PVirtualNode) : Boolean;

    { Adds an item (file or folder) to the tree by filename (or rather path)
      Sender is the tree to add the item to
      Parent is the parent node (nil for root)
      Recursive will add folders recursively (else just the top level will get added
      Checks for non-existance first and does not add if check fails }
    function  AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
        const Filename : String; const Recursive : Boolean = true) : PVirtualNode; overload;
    { Adds an item (file or folder) to the tree by SearchRec (see above) }
    function  AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
        const SR : TSearchRec; Directory : String;
        const Recursive : Boolean = true) : PVirtualNode; overload;

    { Adds the contents of a folder to the tree
      Node should be the node of the folder in the tree
      Directory is the dir to scan
      Recursive will recursively add other found folders to the list by calling AddItem
      All files will get added, also hidden ones }
    procedure AddFolder(Sender : TBaseVirtualTree; Node : PVirtualNode;
        Directory : String; const Recursive : Boolean = true);

    { Adds the file-data (in the associated PFileTreeData) of the passed node
      to two passed strings, which can be passed to CopyFileEx
      Checks whether Source and Target are identical to prevent errors
      TargetDir is the new path the file should be copied to }
    procedure CopyTreeData(Tree : TBaseVirtualTree; Node : PVirtualNode;
        TargetDir : String; var Source : String; var Target : String);

    { Checks whether a file (represented by the passed Value) is already present
      in the tree-level represented by Node (and siblings)
      Only pass filenames (without path) for Value
      Returns a Node if one with the same filename is found, nil otherwise
      Case-sensitive check on Linux, in-sensitive on Windows
      Use to make sure no file-conflics will be produces when actually copying files }
    function CheckForExistance(Tree : TBaseVirtualTree; Node : PVirtualNode;
        const Value : String) : PVirtualNode;

    { Summs all file-data (stored in PFileTreeData) of the tree and returns it }
    function CalculateTotalSize(Tree : TBaseVirtualTree) : Int64;


implementation

uses Dialogs, Controls, MainForm;

function IsFile(Sender : TBaseVirtualTree; Node: PVirtualNode) : Boolean;
var
  PData : PFileTreeData;
begin
  if Node = nil then
  begin
      Result := false;
      Exit;
  end;
  PData := Sender.GetNodeData(Node);
  Result := (PData.Attr and faDirectory = 0);
end;

function AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
    const Filename : String; const Recursive : Boolean = true) : PVirtualNode;
var
    SR : TSearchRec;
begin
    FindFirst(Filename,$3F,SR);
    try
        Result := AddItem(Sender,Parent,SR,ExtractFilePath(Filename),Recursive);
    finally
        FindClose(SR);
    end;
end;

function AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
    const SR : TSearchRec; Directory : String;
    const Recursive : Boolean = true) : PVirtualNode;
var
    PData : PFileTreeData;
    Node : PVirtualNode;
begin
    Result := nil;
    Directory := IncludeTrailingPathDelimiter(Directory);
    
    // Check for "special" files
    if frmMain.Settings.SmartAdd then
    begin
        if SameText(ExtractFileExt(SR.Name),frmMain.PND_EXT) then
        begin
            if MessageDlg('You are trying to add a PND file to a PND.' + #13#10 +
                      'Do you want to open and browse its contents instead?'+ #13#10#13#10 +
                      'The file in question is: ' + Directory + SR.Name,
                      mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
                frmMain.OpenPND(Directory + SR.Name);
                Exit;
            end;
        end
        else if SameText(SR.Name,frmMain.PXML_PATH) then
        begin
            if MessageDlg('To add PXML metadata to a PND it has to be appended, ' +
                      'not simply added to the PND''s contents.' + #13#10 +
                      'Therefore it needs to be specified separately.' + #13#10 +
                      'Do you want to do that?'+ #13#10#13#10 +
                      'The file in question is: ' + Directory + SR.Name,
                      mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
                frmMain.edtPXML.Text := Directory + SR.Name;
                Exit;
            end;
        end
        else if SameText(SR.Name,frmMain.ICON_PATH) then
        begin
            if MessageDlg('It seems like you are trying to add an icon to the PND.' + #13#10 +
                      'Do you want it to show up as the PND''s icon on the desktop ' +
                      'or the menu?' + #13#10#13#10 +
                      'The file in question is: ' + Directory + SR.Name,
                      mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
                frmMain.edtIcon.Text := Directory + SR.Name;
            end;
        end;
    end;

    // Check for existance
    Result := CheckForExistance(Sender,Sender.GetFirstChild(Parent),SR.Name);
    if Result <> nil then
        Exit;
    if IsFile(Sender,Parent) then
        Parent := nil;

    Node := Sender.AddChild(Parent);
    PData := Sender.GetNodeData(Node);
    PData.Name := Directory + SR.Name;
    PData.Attr := SR.Attr;
    PData.ExcludeAttr := SR.ExcludeAttr;
    PData.Time := SR.Time;
    // Icons are set in InitNode event of the virtual tree
    if (SR.Attr and faDirectory > 0) then
    begin
        PData.Size := 0;
        AddFolder(Sender,Node,PData.Name,Recursive);
    end else
    begin
        PData.Size := SR.Size;
    end;
    
    Result := Node;
end;

procedure AddFolder(Sender : TBaseVirtualTree; Node : PVirtualNode;
    Directory : String; const Recursive : Boolean = true);
var
    SR : TSearchRec;
begin
    try
        Directory := IncludeTrailingPathDelimiter(Directory);
        if FindFirst(Directory + '*', faAnyFile, SR) = 0 then
        begin
            repeat
                if (SR.Name = '.') OR (SR.Name = '..') then
                    Continue;
                
                if Recursive OR ((SR.Attr AND faDirectory) = 0) then
                    AddItem(Sender,Node,SR,Directory,Recursive);
            until (FindNext(SR) <> 0);
        end;
    finally
        FindClose(SR);
    end;
end;     

procedure CopyTreeData(Tree : TBaseVirtualTree; Node : PVirtualNode;
    TargetDir : String; var Source : String; var Target : String);
var
    PData : PFileTreeData;
begin
    while Node <> nil do
    begin
        PData := Tree.GetNodeData(Node);
        TargetDir := IncludeTrailingPathDelimiter(TargetDir);
        if (PData.Attr and faDirectory > 0) then
        begin
            CopyTreeData(Tree,Tree.GetFirstChild(Node),
                TargetDir + ExtractFileName(PData.Name),Source,Target);
        end else
        begin
            {$Ifdef Win32}
            if NOT AnsiSameText(PData.Name,TargetDir + ExtractFileName(PData.Name)) then
            {$Else}
            if NOT AnsiSameStr(PData.Name,TargetDir + ExtractFileName(PData.Name)) then
            {$EndIf}
            begin
                Source := Source + PData.Name + #0;
                Target := Target + TargetDir + ExtractFileName(PData.Name) + #0;
            end;
        end;
        Node := Tree.GetNextSibling(Node);
    end;
end;

function CheckForExistance(Tree : TBaseVirtualTree; Node : PVirtualNode;
    const Value : String) : PVirtualNode;
var
    PData : PFileTreeData;
begin
    Result := nil;
    while (Node <> nil) do
    begin
        PData := Tree.GetNodeData(Node);
        {$Ifdef Win32}
        if AnsiSameText(ExtractFileName(PData.Name),Value) then
        {$Else}
        if AnsiSameStr(ExtractFileName(PData.Name),Value) then
        {$EndIf}
        begin
            Result := Node;
            Exit;
        end;
        Node := Tree.GetNextSibling(Node);
    end;
end;

function CalculateTotalSize(Tree : TBaseVirtualTree) : Int64;
var
    Node : PVirtualNode;
    PData : PFileTreeData;
begin
    Result := 0;
    Node := Tree.GetFirst();
    while Node <> nil do
    begin
        PData := Tree.GetNodeData(Node);
        Result := Result + PData.Size;
        Node := Tree.GetNext(Node);
    end;
end;

end.
