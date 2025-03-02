unit Image;

{$mode delphi}

interface

{ TImageBits is a simple type that allows for easy loading and saving of png and
	jpg image data. Bits are a pointer to tightly packed array of RGBA bytes
  of length width * height * 4.

  If you manually populate bits and width and height with the intent of
  saving an image to a file or callback, do not unload the image. }

type
  TImageKind = (imagePng, imageJpg);
  TImageSaveProc = procedure(const Buffer; BufferSize: Integer; UserData: Pointer);

  TImageBits = record
    { Pointer to a tightly packed array of RGBA bytes }
    Bits: Pointer;
    Width: Integer;
    Height: Integer;
    { Load bits from a file }
    procedure Load(const FileName: string); overload;
    { Load bits from a memory buffer }
		procedure Load(const Buffer; BufferSize: Integer); overload;
    { Unload previously loaded bits }
    procedure Unload;
    { Save to a file }
    procedure Save(Kind: TImageKind; const FileName: string); overload;
    { Save to a callback with user data }
		procedure Save(Kind: TImageKind; Proc: TImageSaveProc; UserData: Pointer); overload;
  end;

implementation

{$linklib image}
{$linklib m}

type
  TWriteCallback = procedure(userdata, data: Pointer; size: Integer); cdecl;

function load_image(filename: PChar; out width, height: Integer): Pointer; cdecl; external;
function load_image_from_memory(const buffer; len: Integer; out width, height: Integer): Pointer; cdecl; external;
procedure free_image(image: Pointer); cdecl; external;
procedure save_image(image: Pointer; width, height, kind: Integer; const filename: PChar); cdecl; external;
procedure save_image_callback(image: Pointer; width, height, kind: Integer; callback: TWriteCallback; userdata: Pointer); cdecl; external;

{ TImageBits }

procedure TImageBits.Load(const FileName: string);
begin
  Bits := load_image(PChar(FileName), Width, Height);
end;

procedure TImageBits.Load(const Buffer; BufferSize: Integer);
begin
  Bits := load_image_from_memory(PChar(Buffer), BufferSize, Width, Height);
end;

procedure TImageBits.Unload;
var
  B: Pointer;
begin
  if Bits <> nil then
	begin
    B := Bits;
    Bits := nil;
		free_image(B);
  end;
  Width := 0;
  Height := 0;
end;

procedure TImageBits.Save(Kind: TImageKind; const FileName: string);
begin
	save_image(Bits, Width, Height, Ord(Kind), PChar(FileName));
end;

type
	TCallbackData = record
    Proc: TImageSaveProc;
    UserData: Pointer;
	end;
  PCallbackData = ^TCallbackData;

procedure ImageWrite(userdata, data: Pointer; size: Integer); cdecl;
var
  CallbackData: PCallbackData absolute userdata;
begin
	CallbackData.Proc(data^, size, CallbackData.UserData);
end;

procedure TImageBits.Save(Kind: TImageKind; Proc: TImageSaveProc; UserData: Pointer);
var
	C: TCallbackData;
begin
  C.Proc := Proc;
  C.UserData := UserData;
	save_image_callback(Bits, Width, Height, Ord(Kind), ImageWrite, @C);
end;

end.

