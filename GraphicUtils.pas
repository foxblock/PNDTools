{***************************************************************}
{                                                               }
{  Various utility functions regarding graphics and rendering   }
{                                                               }
{***************************************************************}

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

procedure CenterControl(Target : TControl; const Source : TControl);

implementation

uses Math;

function GetStretchRect(const SrcWidth : Integer; const SrcHeight : Integer;
    const DestWidth : Integer; const DestHeight : Integer) : TRect;
var Factor : Real;
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
