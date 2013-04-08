{******************************************************************************}
{                                                                              }
{  Fixing an annoying bug in Win Vista and later, where                        }
{  Controls (like Buttons) are disappearing when the ALT                       }
{  key is pressed.                                                             }
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

unit ControlHideFix;

interface

uses Classes, Controls;

type
  TButtonEvent = class
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

procedure RepaintControls(C: TComponent);

implementation

procedure TButtonEvent.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 18 then // alt
        RepaintControls((Sender as TComponent));
end;

procedure RepaintControls(C: TComponent);
var
    I : Integer;
begin
    try
        (C as TControl).Invalidate;
    except
         //
    end;
    for I := 0 to C.ComponentCount - 1 do
        RepaintControls(C.Components[I]);
end;

end.
