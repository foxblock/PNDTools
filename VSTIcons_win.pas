unit VSTIcons_win;

interface

uses ShellAPI, Controls;

{ Loads a pointer to the system icons into the passed ImageList
  No image is actually added until requested by GetIconIndex }
procedure LoadSystemIcons(Target : TImageList);
{ Loads the fileicon for the passed file from the system icon-list and returns
  an image index for any associated ImageList }
function  GetIconIndex(const Filename : String; const Open : Boolean) : Integer;

implementation

procedure LoadSystemIcons(Target : TImageList);
var
    SFI : TSHFileInfo;
begin
    Target.Handle := SHGetFileInfo('', 0, SFI, SizeOf(SFI),
        SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
    Target.ShareImages := True;
end;

function GetIconIndex(const Filename : String; const Open : Boolean) : Integer;
var
    SFI : TSHFileInfo;
    Flags : Cardinal;
begin
    Flags := SHGFI_SYSICONINDEX or SHGFI_SMALLICON;
    if Open then
        Flags := Flags or SHGFI_OPENICON;
    if SHGetFileInfo(PChar(Filename), 0, SFI, SizeOf(TSHFileInfo), Flags) = 0 then
        Result := -1
    else
        Result := SFI.iIcon;
end;

end.
