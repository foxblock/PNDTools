{******************************************************************************}
{                                                                              }
{  Utility definitions for VirtualTree implementation                          }
{  The rTreeData data type is also defined here                                }
{  Not stand-alone, needs vars and controls of frmMain                         }
{                                                                              }
{  --------------------------------------------------------------------------  }
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

unit VSTUtils;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface
       
uses
  VirtualTrees, SysUtils, FileConflictForm, Classes;

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
        const Filename : String; var ConflictAction : TFileConflictResult;
        const Recursive : Boolean = true) : PVirtualNode; overload;
    function AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
        const Filename : String; const Recursive : Boolean = true) : PVirtualNode; overload;
    { Adds an item (file or folder) to the tree by SearchRec (see above) }
    function  AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
        const SR : TSearchRec; Directory : String; var ConflictAction : TFileConflictResult;
        const Recursive : Boolean = true) : PVirtualNode; overload;

    procedure AddItemList(Sender : TBaseVirtualTree; Parent : PVirtualNode;
        const FileList : TStrings; const Recursive : Boolean = true);

    { Adds the contents of a folder to the tree
      Node should be the node of the folder in the tree
      Directory is the dir to scan
      Recursive will recursively add other found folders to the list by calling AddItem
      All files will get added, also hidden ones }
    procedure AddFolder(Sender : TBaseVirtualTree; Node : PVirtualNode;
        Directory : String; const Recursive : Boolean = true;
        ConflictAction : TFileConflictResult = fcKeep);

    { Prepares all nodes in Tree (starting with Node as root) for a CopyFileEx
      operation by copying paths to Target and Source (used in said function)
      TargetPath is the new root path files and folders should be copied to }
    procedure CopyTreeData(Tree : TBaseVirtualTree; Node : PVirtualNode;
        TargetDir : String; var Source : String; var Target : String);

    { Checks whether a file (represented by the passed Value) is already present
      in the tree-level represented by Node (and siblings)
      Only pass filenames (without path) for Value
      Returns a Node if one with the same filename is found, nil otherwise
      Case-sensitive check on Linux, in-sensitive on Windows
      Use to make sure no file-conflics will be produced when actually copying files }
    function CheckForExistance(Tree : TBaseVirtualTree; Node : PVirtualNode;
        const Value : String) : PVirtualNode; overload;
    function CheckForExistance(Tree : TBaseVirtualTree; const Value : String) : PVirtualNode; overload;

    { Summs all file-data (stored in PFileTreeData) of the tree and returns it }
    function CalculateTotalSize(Tree : TBaseVirtualTree) : Int64;

    { Returns the filepath of the passed node relative from the root of the PND
      The path will be Linux formatted (forward slashes) }
    function GetFilepathInPND(Tree : TBaseVirtualTree; Node : PVirtualNode) : String;

implementation

    // TODO: Make this standalone and remove at least dependency of MainForm

uses Dialogs, Controls, MainForm, StrUtils, GraphicUtils,
    {$Ifdef Win32}
    VSTIcons_win;
    {$Else}
    VSTIcons_lin;
    {$Endif}

const LINUX_PATH_DELIMITER : String = '/';

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
    const Filename : String; var ConflictAction : TFileConflictResult;
    const Recursive : Boolean = true) : PVirtualNode;
var
    SR : TSearchRec;
begin
    FindFirst(Filename,$3F,SR);
    try
        Result := AddItem(Sender,Parent,SR,ExtractFilePath(Filename),ConflictAction,Recursive);
    finally
        FindClose(SR);
    end;
end;

function AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
    const Filename : String; const Recursive : Boolean = true) : PVirtualNode;
var
    SR : TSearchRec;
    foo : TFileConflictResult;
begin
    FindFirst(Filename,$3F,SR);
    foo := fcKeep;
    try
        Result := AddItem(Sender,Parent,SR,ExtractFilePath(Filename),foo,Recursive);
    finally
        FindClose(SR);
    end;
end;

function AddItem(Sender : TBaseVirtualTree; Parent : PVirtualNode;
    const SR : TSearchRec; Directory : String;
    var ConflictAction : TFileConflictResult;
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

    // TODO: Clean this mess up
    // Check for existance
    Result := CheckForExistance(Sender,Sender.GetFirstChild(Parent),SR.Name);
    if Result <> nil then // File conflict
    begin     
        PData := Sender.GetNodeData(Result);
        if (SR.Attr and faDirectory > 0) then // Skip folder conflicts
        begin      
            AddFolder(Sender,Result,Directory + SR.Name,Recursive,ConflictAction);
            Exit;
        end;
        if (ConflictAction = fcKeepAll) then
            Exit;
        if (ConflictAction <> fcKeepAll) AND (ConflictAction <> fcReplaceAll) then
        begin
            CenterControl(frmFileConflict,frmMain);
            if frmMain.Settings.ShowIcons then
                frmFileConflict.SetNewFile(Directory + SR.Name, SR.Size, SR.Time,
                    GetIconIndex(Directory + SR.Name,true))
            else
                frmFileConflict.SetNewFile(Directory + SR.Name, SR.Size, SR.Time,0);
            frmFileConflict.SetOldFile(PData.Name, PData.Size, PData.Time, PData.OpenIndex);
            frmFileConflict.Execute;
            ConflictAction := frmFileConflict.Action;
            if (ConflictAction = fcKeep) OR (ConflictAction = fcKeepAll) then
                Exit;
            if (ConflictAction = fcCancel) then
                begin
                Result := nil;
                Exit;
            end;
        end;
    end;
    if IsFile(Sender,Parent) then // Files may not be parent/not have children
        Parent := nil;

    if (Result = nil) OR ((ConflictAction <> fcReplace) AND (ConflictAction <> fcReplaceAll)) then
    begin
        Node := Sender.AddChild(Parent);
        PData := Sender.GetNodeData(Node);
    end;
    PData.Name := Directory + SR.Name;
    PData.Attr := SR.Attr;
    PData.ExcludeAttr := SR.ExcludeAttr;
    PData.Time := SR.Time;
    if (SR.Attr and faDirectory > 0) then // Adding folder with contents
    begin
        PData.Size := 0;
        AddFolder(Sender,Node,PData.Name,Recursive,ConflictAction);
    end else // adding file
    begin
        PData.Size := SR.Size;
    end;  
    // Icons are set in InitNode event of the virtual tree
    
    Result := Node;
end;

procedure AddItemList(Sender : TBaseVirtualTree; Parent : PVirtualNode;
    const FileList : TStrings; const Recursive : Boolean = true);
var
    I : Integer;
    temp : TFileConflictResult;
begin
    temp := fcKeep;
    for I := 0 to FileList.Count - 1 do
    begin
        AddItem(Sender,Parent,FileList[I],temp,Recursive);
        if (temp = fcCancel) then
            Exit;
    end;
end;

procedure AddFolder(Sender : TBaseVirtualTree; Node : PVirtualNode;
    Directory : String; const Recursive : Boolean = true;
    ConflictAction : TFileConflictResult = fcKeep);
var
    SR : TSearchRec;
    List : TStringList;
begin
    try
        Directory := IncludeTrailingPathDelimiter(Directory);
        List := TStringList.Create;
        if FindFirst(Directory + '*', faAnyFile, SR) = 0 then
        begin
            repeat
                if (SR.Name = '.') OR (SR.Name = '..') then
                    Continue;
                
                if Recursive OR ((SR.Attr AND faDirectory) = 0) then
                    List.Add(DIrectory + SR.Name);
            until (FindNext(SR) <> 0);
        end;
    finally
        FindClose(SR);
    end;
    AddItemList(Sender,Node,List,Recursive);
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

function CheckForExistance(Tree : TBaseVirtualTree; const Value : String) : PVirtualNode;
var temp : String;
begin
    Result := nil;
    if Length(Value) = 0 then
        Exit;
    temp := Trim(Value);
    Result := Tree.RootNode;
    if RightStr(temp,1) <> LINUX_PATH_DELIMITER then
        temp := temp + LINUX_PATH_DELIMITER;
    if LeftStr(temp,2) = './' then
        temp := RightStr(temp,Length(temp)-2);
    while (Pos(LINUX_PATH_DELIMITER,temp) <> 0) AND (Result <> nil) do
    begin
        Result := Tree.GetFirstChild(Result);
        Result := CheckForExistance(Tree,Result,LeftStr(temp,Pos(LINUX_PATH_DELIMITER,temp)-1));
        temp := RightStr(temp,Length(temp)-Pos(LINUX_PATH_DELIMITER,temp));
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

function GetFilepathInPND(Tree : TBaseVirtualTree; Node : PVirtualNode) : String;
var PData : PFileTreeData;
begin
    Result := '';
    while (Node <> nil) AND (Node <> Tree.RootNode) do
    begin
        PData := Tree.GetNodeData(Node);
        Result := LINUX_PATH_DELIMITER + ExtractFileName(PData.Name) + Result;
        Node := Node.Parent;
    end;
    Result := '.' + Result;
end;

end.
