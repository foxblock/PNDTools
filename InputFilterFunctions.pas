{******************************************************************************}
{                                                                              }
{  Implementations for KeyPress filter functions for                           }
{  the TStringItemPanel in PXMLForm and CreatorForm                            }
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

unit InputFilterFunctions;

interface

uses Classes, StdCtrls, SysUtils;

type
  TInputFilters = class
    // OnKeyPress functions limiting the input for various hard coded types
    procedure VersionKeyPress(Sender: TObject; var Key: Char);
    procedure EmailKeyPress(Sender: TObject; var Key: Char);
    procedure FolderKeyPress(Sender: TObject; var Key: Char);
    procedure LanguageKeyPress(Sender: TObject; var Key: Char);
    procedure MimeKeyPress(Sender: TObject; var Key: Char);
    procedure IntegerKeyPress(Sender: TObject; var Key: Char);
    procedure IDKeyPress(Sender: TObject; var Key: Char);
    procedure DisregardKey(var Key: Char);
  end;

implementation

procedure TInputFilters.VersionKeyPress(Sender: TObject; var Key: Char);
begin
    // Process input normally if...
    if not (Key in ['0'..'9','a'..'z','A'..'Z',#8,'+','-']) then // is backspace or a number
        DisregardKey(Key);
end;

procedure TInputFilters.EmailKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key in ['(',')','[',']','\',';',':',',','<','>','|']) OR // non-allowed chars
       ((Key = '@') AND (Pos('@',(Sender as TCustomEdit).Text) <> 0)) then // only one @
        DisregardKey(Key);
end;

procedure TInputFilters.FolderKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key in [' ','-','/','\',':','?','*','<','>','|','"']) then
        DisregardKey(Key);
end;

procedure TInputFilters.LanguageKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['a'..'z','A'..'Z','_',#8]) OR
       ((Key = '_') AND (Pos('_',(Sender as TCustomEdit).Text) <> 0)) then
       DisregardKey(Key);
end;

procedure TInputFilters.MimeKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['a'..'z','A'..'Z','0'..'9','-','.','/',#8]) OR
       ((Key = '/') AND (Pos('/',(Sender as TCustomEdit).Text) <> 0)) then 
       DisregardKey(Key);    
end;

procedure TInputFilters.IntegerKeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in ['0'..'9',#8]) then
        DisregardKey(Key);
end;

procedure TInputFilters.IDKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in['a'..'z','A'..'Z','0'..'9','.','_','!','-','+',#8]) then
        DisregardKey(Key);
end;

procedure TInputFilters.DisregardKey(var Key: Char);
begin
    Key := #0;
    Beep;
end;

end.
