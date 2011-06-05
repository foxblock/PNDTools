{*******************************************************}
{                                                       }
{ Fixing an annoying bug in Win Vista and later, where  }
{ Controls (like Buttons) are disappearing when the ALT }
{ key is pressed.                                       }
{                                                       }
{*******************************************************}

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
