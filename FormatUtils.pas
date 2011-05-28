unit FormatUtils;

interface

{ Converts a file-size in bytes into a string with either decimal or binary
  conversion and prefix, maximum is TB or TiB }
function  SizeToStr(const Size : Int64; const Binary : Boolean = false) : String;

implementation

uses SysUtils, Math;

function SizeToStr(const Size : Int64; const Binary : Boolean = false) : String;
const
    Overhang : Real = 0.10;
    MaxFactor : Byte = 5;
    SymbolsDec : Array [1..5] of String = ('Byte','kB','MB','GB','TB');
    SymbolsBin : Array [1..5] of String = ('Byte','KiB','MiB','GiB','TiB');
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

    while (Temp > Factor * (1 - Overhang)) AND (Count <= MaxFactor) do
    begin
        Temp := Temp / Factor;
        Inc(Count);
    end;
    
    if Count = 1 then
       Result := IntToStr(Size)
    else
        Result := Format('%.2f',[Temp]);
    if Binary then
        Result := Result + ' ' + SymbolsBin[Count]
    else
        Result := Result + ' ' + SymbolsDec[Count];
end;

end.
