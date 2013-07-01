unit PNDUtils;

interface

uses Types, Classes;

type
  rToolSettings = record  
    ProgMkSquash : String;
    ProgUnSquash : String;
    ProgChmod : String;
    Prog7zip : String;
    ParamMkSquash : String;
    ParamUnSquash : String;
    ParamChmod : String;
    Param7zip : String;
  end;

    const PXML_PATH : String = 'PXML.xml';
    const ICON_PATH : String = 'icon.png';
    const SOURCE_VAR : String        = '%source%';
    const TARGET_VAR : String        = '%target%';

procedure ExtractPNDToFolder(const FileName : String; const ExtractPath : String;
        const Tools : rToolSettings);

procedure SaveFolderToPND(const Path : String; const PXML : String; const Icon : String;
        const FileName : String; const Tools : rToolSettings);

procedure ExtractPNDMetaData(Stream : TFileStream; var PXML : String;
        var Icon : String);

implementation

uses FileUtils, SysUtils, ShellStuff;

procedure ExtractPNDToFolder(const FileName : String; const ExtractPath : String;
        const Tools : rToolSettings);
const
    TEMP_PATH : String = 'temp2'; // Relative path (from the .exe) to the temporary folder
    META_PATH : String = 'meta'; // Relative path to the meta folder (for PXML and Icon)
var
    Stream : TFileStream;
    Prog, Param, PXML, Icon : String;
    IsISO : Boolean;
begin
    PXML := ExtractPath + PXML_PATH;
    Icon := ExtractPath + ICON_PATH;
    // Detect ISO file system
    Stream := TFileStream.Create(FileName,fmOpenRead);
    IsISO := DetectIsoFormat(Stream);
    if IsISO then
        WriteLn('WARNING: ISO file format detected!');

    // extract PXML and Icon
    try
        ExtractPNDMetaData(Stream,PXML,Icon);
    finally
        Stream.Free;
    end;

    // Extract the PND 
    WriteLn('Extracting PND to ' + FileName + '... this might take a while');
    if IsISO then
    begin
        Prog := Tools.Prog7zip;
        Param := StringReplace(Tools.Param7zip,SOURCE_VAR,FileName,[rfReplaceAll]);
        Param := StringReplace(Param,TARGET_VAR,ExtractPath,[rfReplaceAll]);
    end else // squashFS
    begin
        Prog := Tools.ProgUnSquash;
        Param := StringReplace(Tools.ParamUnSquash,SOURCE_VAR,ConvertPath(FileName),[rfReplaceAll]);
        Param := StringReplace(Param,TARGET_VAR,ConvertPath(ExtractPath),[rfReplaceAll]);
    end;
    WriteLn('Calling program: ' + Prog + ' ' + Param);
    if not ExecuteProgram(Prog,Param) then
    begin
        WriteLn('ERROR: Encountered an error while extracting PND' + #13#10 +
            'Error code: ' + IntToStr(GetLastError));
        Exit;
    end;
end;

procedure SaveFolderToPND(const Path : String; const PXML : String; const Icon : String;
        const FileName : String; const Tools : rToolSettings);
const                      
    TEMP_PATH : String = 'temp'; // Relative path (from the .exe) to the temporary folder
var
    Prog, Param : String;
    PNDFile : TFileStream;
begin
    // set corrent file flags to work on the Pandora
    Prog := Tools.ProgChmod;
    Param := StringReplace(Tools.ParamChmod,SOURCE_VAR,ConvertPath(TEMP_PATH),[rfReplaceAll]);
    WriteLn('Calling program: ' + Prog + ' ' + Param);
    if not ExecuteProgram(Prog,Param) then
    begin
        WriteLn('ERROR: Encountered an error while trying to set file flags' + #13#10 +
            'Error code: ' + IntToStr(GetLastError));
        Exit;
    end;

    // Make the squashFS filesystem from the temporary files
    Prog := Tools.ProgMkSquash;
    Param := StringReplace(Tools.ParamMkSquash,SOURCE_VAR,ConvertPath(Path),[rfReplaceAll]);
    Param := StringReplace(Param,TARGET_VAR,ConvertPath(FileName),[rfReplaceAll]);
    WriteLn('Calling program: ' + Prog + ' ' + Param);
    if not ExecuteProgram(Prog,Param) then
    begin
        WriteLn('ERROR: Encountered an error while creating SquashFS archive' + #13#10 +
            'Error code: ' + IntToStr(GetLastError));
        Exit;
    end;

    // append PXML and icon
    WriteLn('Appending icon and PXML data (if found).');
    PNDFile := TFileStream.Create(FileName,fmOpenReadWrite);
    try
        AppendDataToFileStream(PNDFile,PXML);
        if (Icon <> '') AND FileExists(Icon) then
            AppendDataToFileStream(PNDFile,Icon)
        else
            WriteLn('WARNING: No icon found or icon could not be accessed');
    finally
        PNDFile.Free;
    end;
    WriteLn('SUCCESS: PND created successfully: ' + FileName);
end;

procedure ExtractPNDMetaData(Stream : TFileStream; var PXML : String;
        var Icon : String);
const
    PXML_HEADER : String = '<?xml';
    PXML_HEADER_FALLBACK : String = '<PXML';
    PXML_FOOTER : String = '</PXML>';
var
    OutputStream : TFileStream;
    Pos : Int64; 
    NumRead, NumWrite : Integer;
    Buffer : Array [Word] of Byte;
    Headers : Array [0..4] of String;
    ImageIndex : Integer;
begin     
    // File signatures taken from: http://www.garykessler.net/library/file_sigs.html
    Headers[0] := Chr(137) + 'PNG' + Chr(13) + Chr(10) + Chr(26) + Chr(10); // PNG
    Headers[1] := Chr(255) + Chr(216) + Chr(255); // JPG
    Headers[2] := 'GIF8'; // GIF
    Headers[3] := 'BM'; // BMP
    Headers[4] := Chr(0) + Chr(0) + Chr(1) + Chr(0); // ICO
    // find PXML data
    WriteLn('Looking for PXML data...');
    Pos := FindStringDataInStream(PXML_HEADER,Stream,0,true);
    if Pos = -1 then
    begin
        Pos := FindStringDataInStream(PXML_HEADER_FALLBACK,Stream,0,true);
        if Pos = -1 then
        begin
            WriteLn('ERROR: No PXML data found!');
            PXML := '';
            Icon := '';
            Exit;
        end else
            WriteLn('WARNING: PXML file missing proper xml header, you should fix ' +
                    'that, check the PXML specification for details');
    end;
    // write PXML data to a file
    WriteLn('PXML data found, writing to file ' + PXML);
    OutputStream := TFileStream.Create(PXML,fmCreate);
    try
        Pos := FindStringDataInStream(PXML_FOOTER,Stream,Pos,false,OutputStream);
    finally
        OutputStream.Free;
    end;

    // search for icon header and extract icon data
    ImageIndex := Low(Headers);
    while (Pos = -1) AND (ImageIndex <= High(Headers)) do
    begin
        Pos := FindStringDataInStream(Headers[ImageIndex],Stream,Pos);
        Inc(ImageIndex);
    end;

    if Pos <> -1 then
    begin
        case ImageIndex of
            1: ChangeFileExt(Icon,'.png');  
            2: ChangeFileExt(Icon,'.jpg');
            3: ChangeFileExt(Icon,'.gif');
            4: ChangeFileExt(Icon,'.bmp');
            5: ChangeFileExt(Icon,'.ico');
        end;
        WriteLn('Icon data found, writing to file ' + Icon);
        OutputStream := TFileStream.Create(Icon,fmCreate);
        try
            Stream.Seek(Pos,soFromBeginning);
            repeat
                NumRead := Stream.Read(Buffer,SizeOf(Buffer));
                NumWrite := OutputStream.Write(Buffer,NumRead);
            until (NumRead = 0) OR (NumRead <> NumWrite);
        finally
            OutputStream.Free;
        end;
    end else
    begin
        WriteLn('WARNING: No icon data found in PND');
        Icon := '';
    end;

    WriteLn('SUCCESS: PND metadata successfully extracted');
end;

end.
