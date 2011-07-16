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
