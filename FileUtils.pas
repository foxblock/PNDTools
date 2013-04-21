﻿{******************************************************************************}
{                                                                              }
{  Functions for byte-level file interaction (looking for and                  }
{  appending data/bytes)                                                       }
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


unit FileUtils;

{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}

interface

uses Classes, SysUtils;

{ Appends the passed file (FileName) to the Stream, uses the current stream
  position if DontSeek is false (which may lead to overwrites), the end of the
  steam otherwise }
procedure AppendDataToFileStream(Stream : TFileStream; const FileName : String;
    const DontSeek : Boolean = false);

{ Searches for a Data string in the passed byte-stream (will convert the string
  to a byte array)
  StartPos is the postition to start searching from, pass negative values for
  a offset from the end of the stream (passing 0 and Backwards=true will start
  at the end)
  Backwards specifies the direction in which to search, independant of StartPos
  You can pass an optional OutputStream in which all data from StartPos to the
  final end of the String to find will be written (only when Backwards is false)
  Uses a "rolling" buffer to eliminate the problem of the string to be split into two
  Because of that only the first 512 bytes of Data are used for comparison

  Returns the starting position of the match (first byte in Data) or -1 if no
  match could be found }
function FindStringDataInStream(const Data : String; Stream : TFileStream;
    const StartPos : Int64 = 0; const Backwards : Boolean = false;
    OutputStream : TFileStream = nil) : Int64;
    
{ Looks for the ISO file header in the passed stream
  Returns true if found, false otherwise }
function DetectIsoFormat(Stream : TFileStream) : Boolean;

implementation

uses Math, Forms;

procedure AppendDataToFileStream(Stream : TFileStream; const FileName : String;
    const DontSeek : Boolean = false);
var
    Buffer : Array [Word] of Byte; //64KB
    NumRead, NumWrite : Integer;
    Other : TFileStream;
begin
    if NOT DontSeek then
        Stream.Seek(0,soFromEnd);
    Other := TFileStream.Create(FileName,fmOpenRead);
    try
        repeat
            NumRead := Other.Read(Buffer,SizeOf(Buffer));
            NumWrite := Stream.Write(Buffer,NumRead);
        until (NumRead = 0) OR (NumWrite <> NumRead);
    finally
        Other.Free;
    end;
end;

function FindStringDataInStream(const Data : String; Stream : TFileStream;
    const StartPos : Int64 = 0; const Backwards : Boolean = false;
    OutputStream : TFileStream = nil) : Int64;
var
    NumRead : Word;
    DataArray : Array [0..511] of Byte;
    Buffer : Array [0..1023] of Byte; // 1KB
    I,K : Word;
    Size : Word;
    Found : Boolean;
    Pos : Int64;
begin
    // convert string to byte array for comparison
    Size := Min(Length(Data) * SizeOf(Char),SizeOf(DataArray));
    Move(Data[1],DataArray,Size);

    // set-up stream correctly
    if StartPos < 0 then
        Stream.Seek(StartPos,soFromEnd)
    else if StartPos > 0 then
        Stream.Seek(StartPos,soFromBeginning)
    else
    begin
        if Backwards then
            Stream.Seek(0,soFromEnd)
        else
            Stream.Seek(0,soFromBeginning);
    end;
    if Backwards then
    begin
        // first seek here as we begin with a read operation
        Stream.Seek(-SizeOf(Buffer),soFromEnd); 
        // stream output only supported in forwards mode
        OutputStream := nil;
    end;

    Result := -1;
    repeat
        // save current position for loop check
        Pos := Stream.Position;
        NumRead := Stream.Read(Buffer,SizeOf(Buffer));
        // check buffer against data
        for I := 0 to SizeOf(Buffer) - Size - 1 do
        begin
            if Buffer[I] = DataArray[0] then
            begin
                Found := true;
                for K := 0 to Size - 1 do
                begin
                    if Buffer[I+K] <> DataArray[K] then
                    begin
                        Found := false;
                        Break;
                    end;
                end;
                if Found then
                begin
                    Result := Stream.Position - NumRead + I;
                    Break;
                end;
            end;
        end;
        // save buffer to output stream
        if OutputStream <> nil then
        begin
            if Result = -1 then // not found yet
                begin
                if NumRead < SizeOf(Buffer) then
                    OutputStream.Write(Buffer,NumRead)
                else
                    OutputStream.Write(Buffer,SizeOf(Buffer) div 2);
                end
            else
                OutputStream.Write(Buffer,Result + Size + NumRead - Stream.Position);  // I + Size
        end;
        // position found -> exit
        if Result <> -1 then
            Exit;

        // use a "rolling" buffer to work around data beeing split on two buffers
        // this also is the reason the data array is half the size of the buffer
        if Backwards then
            Stream.Seek(Max(-SizeOf(Buffer) * 3 div 2,-Stream.Position),soFromCurrent)
        else
            Stream.Seek(-SizeOf(Buffer) div 2,soFromCurrent);
    // forward: read less bytes than buffer means end of file
    // backward: seeking does not change position means beginning of file
    until (NumRead < SizeOf(Buffer)) OR (Stream.Position = Pos);
end;

function DetectIsoFormat(Stream : TFileStream) : Boolean;
const
    // Source: http://www.mactech.com/articles/develop/issue_03/high_sierra.html
    ISO_HEADER : Array [0..4] of Byte = (67,68,48,48,49); // CD001
    OFFSET_BYTES : Array [0..2] of Integer = (32769,34817,36865);
var
    Buffer : Array [Word] of Byte;
    I,K : Integer;
    Found : Boolean;
begin
    Result := false;
    for I := 0 to High(OFFSET_BYTES) do
    begin
        Stream.Seek(OFFSET_BYTES[I],soFromBeginning);
        Stream.Read(Buffer,Length(Buffer));
        Found := true;
        for K := 0 to High(ISO_HEADER) do
        begin
            if Buffer[K] <> ISO_HEADER[K] then
            begin
                Found := false;
                Break;
            end;
        end;
        if Found then
        begin
            Result := true;
            Exit;
        end;
    end;
end;

end.
