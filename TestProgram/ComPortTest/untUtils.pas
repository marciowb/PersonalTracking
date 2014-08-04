unit untUtils;

interface
uses
  System, SysUtils;

type
  ByteArray=array of byte;

function ByteArrayToHex(var ary:array of byte;var str:String):Boolean;
function ConvertHex(Hex : string) : integer;
function HexToByte(hex : String): byte;
procedure HexStringToByteArray(const str: string; var BArray:ByteArray);

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

function ConvertHex(Hex : string) : integer;
begin;
  case lowercase(Hex) of
  'a': result := 10;
  'b': result := 11;
  'c': result := 12;
  'd': result := 13;
  'e': result := 14;
  'f': result := 15;
  end;
  if StrToIntDef(Hex,11) < 10 then Result := StrToInt(Hex);
end;

function HexToByte(hex : String): byte;
begin;
  Result:=0;

  Result:= Result + 16* ConvertHex(hex[1]);
  Result:=Result+ConvertHex(hex[2]);
end;

procedure HexStringToByteArray(const str: string; var BArray:ByteArray);
var
  i:integer;
begin
     SetLength(BArray, Length(str) div 2);

     for i:=0 to High(BArray) do
     begin
          BArray[i]:=HexToByte(str[i*2+1]+str[i*2+2]);
     end;
end;

end.
