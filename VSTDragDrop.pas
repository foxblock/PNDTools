{******************************************************************************}
{                                                                              }
{  Functions for VirtualTree Drag&Drop implementation                          }
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

unit VSTDragDrop;

interface

uses
    VirtualTrees,
    VSTUtils,
    Classes, Types, ActiveX,
    {$Ifdef Win32}
    ShellAPI, Windows
    {$Else}
    //
    {$Endif};

type
    { Implements the drag&drop functions called by the files tree in frmMain
      VSTDragDrop is called on dropping a file (or any content), identifies the
      dropped content and calles AddItem ultimately
      GetFileListFromObj is a helper function to transfer an IDataObject into
      filepath strings, which will get added to a passed StringList }
    TDragEvent = class
        procedure VSTDragDrop(Sender: TBaseVirtualTree;
            Source: TObject; DataObject: IDataObject; Formats: TFormatArray;
            Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);

        procedure GetFileListFromObj(const DataObj: IDataObject;
            FileList: TStringList);
    end;


implementation

uses ComObj, Dialogs;

procedure TDragEvent.VSTDragDrop(Sender: TBaseVirtualTree;
    Source: TObject; DataObject: IDataObject; Formats: TFormatArray;
    Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
{$Ifdef Win32}
var
    I : Integer;
    MyList : TStringList;
    Node : PVirtualNode;
begin
    MyList := TStringList.Create;
    Sender.BeginUpdate;
    try
        for I := 0 to High(formats) - 1 do
        begin
            if Formats[i] = CF_HDROP then // Explorer drop
            begin
                GetFileListFromObj(DataObject, MyList);

                //here we have all filenames
                if Mode = dmOnNode then
                begin
                    AddItemList(Sender,Sender.DropTargetNode,MyList,true);
                end else
                begin
                    AddItemList(Sender,nil,MyList,true);
                end;
            end else
            if Formats[I] = CF_VIRTUALTREE then // VirtualTree drop
            begin
                case Mode of
                    dmNowhere: Sender.ProcessDrop(DataObject,nil,Effect,amAddChildLast);
                    dmAbove:
                    begin
                        Node := Sender.GetPrevious(Sender.DropTargetNode,true);
                        if not IsFile(Sender,Node) then
                            Sender.ProcessDrop(DataObject,Node,Effect,amAddChildLast)
                        else
                            Sender.ProcessDrop(DataObject,Node.Parent,Effect,amAddChildLast)
                    end;
                    dmOnNode..dmBelow:
                    begin
                        if not IsFile(Sender,Sender.DropTargetNode) then
                            Sender.ProcessDrop(DataObject,Sender.DropTargetNode,Effect,amAddChildLast)
                        else
                            Sender.ProcessDrop(DataObject,Sender.DropTargetNode.Parent,Effect,amAddChildLast)
                    end;
                end;
            end;
        end;
    finally
        MyList.Free;
        Sender.SortTree(0,sdAscending,true);
        Sender.EndUpdate;
    end;
end;  
{$Else}
begin
    {$Message Error 'This function needs to be implemented for Linux!'}
end;
{$Endif}

procedure TDragEvent.GetFileListFromObj(const DataObj: IDataObject;
    FileList: TStringList);
{$Ifdef Win32}
var
    FmtEtc: TFormatEtc;                   // specifies required data format
    Medium: TStgMedium;                   // storage medium containing file list
    DroppedFileCount: Integer;            // number of dropped files
    I: Integer;                           // loops thru dropped files
    FileNameLength: Integer;              // length of a dropped file name
    FileName: String;                     // name of a dropped file
    Buffer: Array [0..MAX_PATH] of Char;
begin
    // Get required storage medium from data object
    FmtEtc.cfFormat := CF_HDROP;
    FmtEtc.ptd := nil;
    FmtEtc.dwAspect := DVASPECT_CONTENT;
    FmtEtc.lindex := -1;
    FmtEtc.tymed := TYMED_HGLOBAL;
    OleCheck(DataObj.GetData(FmtEtc, Medium));
    try
        try
            // Get count of files dropped
            DroppedFileCount := DragQueryFile(Medium.hGlobal, $FFFFFFFF, nil, 0);
            // Get name of each file dropped and process it
            for I := 0 to Pred(DroppedFileCount) do
            begin
                // get length of file name, then name itself
                FileNameLength := DragQueryFile(Medium.hGlobal, I, @buffer, sizeof(buffer));
                FileName := buffer;
                //SetLength(FileName, FileNameLength);
                //DragQueryFileW(Medium.hGlobal, I, PWideChar(FileName), FileNameLength + 1);
                // add file name to list
                FileList.Append(FileName);
            end;
        finally
            // Tidy up - release the drop handle
            // don't use DropH again after this
            DragFinish(Medium.hGlobal);
        end;
    finally
        ReleaseStgMedium(Medium);
    end;
end;   
{$Else}
begin
    {$Message Error 'This function needs to be implemented for Linux!'}
end;
{$Endif}

end.
