{******************************************************************************}
{                                                                              }
{  Various utility functions regarding string formatting                       }
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

unit FormatUtils;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses Classes;

{ Converts a file-size in bytes into a string with either decimal or binary
  conversion and prefix, maximum is TB or TiB }
function  SizeToStr(const Size : Int64; const Binary : Boolean = false) : String;

{ Split a string into multiple parts at the specified delimiters }
procedure Tokenize(const S : String; const Delimiter : String; var List : TStrings);

implementation

uses SysUtils, StrUtils, Math;

function SizeToStr(const Size : Int64; const Binary : Boolean = false) : String;
const
    OVERHANG : Real = 0.10;
    SYMBOLSDEC : Array [1..5] of String = ('Byte','kB','MB','GB','TB');
    SYMBOLSBIN : Array [1..5] of String = ('Byte','KiB','MiB','GiB','TiB');
var
    Factor : Integer;
    Count : Integer;
    Temp : Extended;
begin
    if Binary then
        Factor := 1024
    else
        Factor := 1000;
    Count := 1;
    Temp := Size;

    while (Temp > Factor * (1 - OVERHANG)) AND (Count <= High(SYMBOLSDEC)) do
    begin
        Temp := Temp / Factor;
        Inc(Count);
    end;
    
    if Count = 1 then
       Result := IntToStr(Size)
    else
        Result := Format('%.2f',[Temp]);
    if Binary then
        Result := Result + ' ' + SYMBOLSBIN[Count]
    else
        Result := Result + ' ' + SYMBOLSDEC[Count];
end;

procedure Tokenize(const S : String; const Delimiter : String; var List : TStrings);
var
    pre, post : Integer;
begin
    pre := 1;
    post := Pos(Delimiter,S);
    while post > 0 do
    begin
        List.Add(MidStr(S,pre,post-pre));
        pre := post+1;
        post := PosEx(Delimiter,S,pre);
    end;
    List.Add(MidStr(S,pre,Length(S)-pre+1));
end;

end.
