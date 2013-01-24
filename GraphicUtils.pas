unit GraphicUtils;
    
{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses Types;

function GetStretchRect(const SrcWidth : Integer; const SrcHeight : Integer;
    const DestWidth : Integer; const DestHeight : Integer) : TRect;

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

end.
