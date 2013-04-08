{******************************************************************************}
{                                                                              }
{  Various utility functions regarding graphics and rendering                  }
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

unit GraphicUtils;
    
{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses Types, Controls;

{ Returns a TRect of (ScrWidth,SrcHeight) stretched to (DestWidth,DestHeight)
  while keeping the original proportions }
function GetStretchRect(const SrcWidth : Integer; const SrcHeight : Integer;
    const DestWidth : Integer; const DestHeight : Integer) : TRect;
{ Centers a control (usually a form) on top of another control
  For example a popup dialog on top of a calling parent form
  Target is the control to be positioned
  Source is the control Target will be centered on }
procedure CenterControl(Target : TControl; const Source : TControl);

implementation

uses Math;

function GetStretchRect(const SrcWidth : Integer; const SrcHeight : Integer;
    const DestWidth : Integer; const DestHeight : Integer) : TRect;
var
    Factor : Real;
begin
    Factor := Min(DestWidth / SrcWidth, DestHeight / SrcHeight);
    Result.Left := Round((DestWidth - SrcWidth * Factor) / 2);
    Result.Right := Result.Left + Round(SrcWidth * Factor);
    Result.Top := Round((DestHeight - SrcHeight * Factor) / 2);
    Result.Bottom := Result.Top + Round(SrcHeight * Factor);
end;

procedure CenterControl(Target : TControl; const Source : TControl);
begin
    Target.Left := Source.Left + (Source.Width - Target.Width) div 2;
    Target.Top := Source.Top + (Source.Height - Target.Height) div 2;
end;

end.
