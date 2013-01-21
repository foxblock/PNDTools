{*******************************************************}
{                                                       }
{  Functions for VirtualTree Drag&Drop implementation   }
{                                                       }
{*******************************************************}

unit VSTDragDrop_win;

interface

uses
    VirtualTrees,
    vstUtils,
    ActiveX, ShellAPI, Classes, Types, Windows;

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

uses ComObj;

procedure TDragEvent.VSTDragDrop(Sender: TBaseVirtualTree;
    Source: TObject; DataObject: IDataObject; Formats: TFormatArray;
    Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
var
    I, j: Integer;
    MyList: TStringList;
begin
    MyList := TStringList.Create;
    Sender.BeginUpdate;
    try
        for i := 0 to High(formats) - 1 do
        begin
            if Formats[i] = CF_HDROP then // Explorer drop
            begin
                GetFileListFromObj(DataObject, MyList);

                //here we have all filenames
                for j:=0 to MyList.Count - 1 do
                begin
                    if Mode = dmOnNode then
                    begin
                        AddItem(Sender,Sender.DropTargetNode,MyList.Strings[j]);
                    end else
                    begin
                        AddItem(Sender,nil,MyList.Strings[j]);
                    end;
                end;
            end else
            if Formats[i] = CF_VIRTUALTREE then // VirtualTree drop
            begin
                case Mode of
                    dmNowhere: Sender.ProcessDrop(DataObject,nil,Effect,amAddChildLast);
                    dmAbove: Sender.ProcessDrop(DataObject,Sender.DropTargetNode,Effect,amInsertBefore);
                    dmOnNode:
                    begin
                        if not IsFile(Sender,Sender.DropTargetNode) then
                            Sender.ProcessDrop(DataObject,Sender.DropTargetNode,Effect,amAddChildLast);
                    end;
                    dmBelow: Sender.ProcessDrop(DataObject,Sender.DropTargetNode,Effect,amInsertAfter);
                end;                     
            end;
        end;
    finally
        MyList.Free;
        Sender.SortTree(0,sdAscending,true);
        Sender.EndUpdate;
    end;
end;

procedure TDragEvent.GetFileListFromObj(const DataObj: IDataObject;
    FileList: TStringList);
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

end.
