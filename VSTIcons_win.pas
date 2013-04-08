{******************************************************************************}
{                                                                              }
{  Functions for VirtualTree (system) file icon loading                        }
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
