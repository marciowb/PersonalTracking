unit untUtils;

interface

uses
SysUtils;

const
  CharHi:array[0..255] of byte=(
  $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
	$80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41,
  $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0,
	$80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40,
	$00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1,
	$81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41,
	$00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1,
	$81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41,
  $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
	$80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40,
	$01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1,
	$81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40,
	$00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
	$80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40,
  $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0,
	$80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40,
	$00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
	$80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41,
	$00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0,
	$80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41,
  $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0,
	$80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40,
	$01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1,
	$81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41,
	$00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0,
	$80, $41, $00, $C1, $81, $40);

  CharLo:array[0..255] of byte=(
  $00, $C0, $C1, $01, $C3, $03, $02, $C2, $C6, $06,
	$07, $C7, $05, $C5, $C4, $04, $CC, $0C, $0D, $CD,
	$0F, $CF, $CE, $0E, $0A, $CA, $CB, $0B, $C9, $09,
	$08, $C8, $D8, $18, $19, $D9, $1B, $DB, $DA, $1A,
	$1E, $DE, $DF, $1F, $DD, $1D, $1C, $DC, $14, $D4,
	$D5, $15, $D7, $17, $16, $D6, $D2, $12, $13, $D3,
	$11, $D1, $D0, $10, $F0, $30, $31, $F1, $33, $F3,
	$F2, $32, $36, $F6, $F7, $37, $F5, $35, $34, $F4,
	$3C, $FC, $FD, $3D, $FF, $3F, $3E, $FE, $FA, $3A,
	$3B, $FB, $39, $F9, $F8, $38, $28, $E8, $E9, $29,
	$EB, $2B, $2A, $EA, $EE, $2E, $2F, $EF, $2D, $ED,
	$EC, $2C, $E4, $24, $25, $E5, $27, $E7, $E6, $26,
	$22, $E2, $E3, $23, $E1, $21, $20, $E0, $A0, $60,
	$61, $A1, $63, $A3, $A2, $62, $66, $A6, $A7, $67,
	$A5, $65, $64, $A4, $6C, $AC, $AD, $6D, $AF, $6F,
	$6E, $AE, $AA, $6A, $6B, $AB, $69, $A9, $A8, $68,
	$78, $B8, $B9, $79, $BB, $7B, $7A, $BA, $BE, $7E,
	$7F, $BF, $7D, $BD, $BC, $7C, $B4, $74, $75, $B5,
	$77, $B7, $B6, $76, $72, $B2, $B3, $73, $B1, $71,
	$70, $B0, $50, $90, $91, $51, $93, $53, $52, $92,
	$96, $56, $57, $97, $55, $95, $94, $54, $9C, $5C,
	$5D, $9D, $5F, $9F, $9E, $5E, $5A, $9A, $9B, $5B,
	$99, $59, $58, $98, $88, $48, $49, $89, $4B, $8B,
	$8A, $4A, $4E, $8E, $8F, $4F, $8D, $4D, $4C, $8C,
	$44, $84, $85, $45, $87, $47, $46, $86, $82, $42,
  $43, $83, $41, $81, $80, $40);



type
  ByteArray=array of byte;

function ByteArrayToHex(var ary:array of byte;var str:String):Boolean;
function ConvertHex(Hex : char) : integer;
function HexToByte(hex : string): byte;
procedure HexStringToByteArray(const str: string; BArray:ByteArray);
function Crc16_chk(ptr:array of byte):byte;
function Crc16_ver(ptr:array of byte):byte;

implementation

function ByteArrayToHex(var ary:array of byte;var str:String):Boolean;
var
  i:integer;
begin
     str:='';
     for i:=low(ary) to High(ary) do
     begin
          if(Length(IntToHex(ary[i],1)) = 1) then
          begin
               str:=Str+'0'+ IntToHex(ary[i],1)+ '-';
          end
          else
          begin
               str:=Str+IntToHex(ary[i],1) + '-';
          end;
     end;

     Result:=true;
  end;

function ConvertHex(Hex : char) : integer;
begin;
  case Hex of
  'a': result := 10;
  'b': result := 11;
  'c': result := 12;
  'd': result := 13;
  'e': result := 14;
  'f': result := 15;
  end;
  if StrToIntDef(Hex,11) < 10 then Result := StrToInt(Hex);
  Result:=0;
end;

function HexToByte(hex : String): byte;
begin;
  Result:=0;

  Result:= Result + 16* ConvertHex(hex[1]);
  Result:=Result+ConvertHex(hex[2]);
end;

procedure HexStringToByteArray(const str: string; BArray:ByteArray);
var
  i:integer;
begin
     SetLength(BArray, Length(str) div 2);

     for i:=0 to High(BArray) do
     begin
          BArray[i]:=HexToByte(str[i*2+1]+str[i*2+2]);
     end;
end;

function Crc16_chk(ptr:array of byte):byte;
var
  bInval, bCrcHi, bCrcLo:byte;
  nArraySize:integer;
  i:integer;
begin
  bCrcHi:=$ff;
  bCrcLo:=$ff;
  nArraySize:=Length(ptr);

  if Length(ptr) =0  then
  begin
    Result:=0;
    exit;
  end;

  for i := Low(ptr) to High(ptr) do
  begin
    bInval:=bCrcHi xor ptr[i];
    bCrcHi:=bCrcLo xor CharHi[bInval];
    bCrcLo:=CharLo[bInval];
  end;

  if (bCrcHi<>0) or (bCrcLo <> 0)  then
  begin
    Result:=0;
    exit;
  end;

  Result:=1;
end;

function Crc16_ver(ptr:array of byte):byte;
var
  bInval, bCrcHi, bCrcLo:byte;
  i:integer;

begin
  bCrcHi:=$ff;
  bCrcLo:=$ff;

  if(Length(ptr) = 0) then
  begin
    Result:=0;
    exit;
  end;

  for i := Low(ptr) to High(ptr)-2 do
  begin
    bInval := bCrcHi xor ptr[i];
    bCrcHi:=bCrcLo xor CharHi[bInval];
    bCrcLo:=CharLo[bInval];
  end;

  ptr[High(ptr) -1]:=bCrcHi;
  ptr[High(ptr)]:=bCrcLo;

  Result:=1;
end;


end.
