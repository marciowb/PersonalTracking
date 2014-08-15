unit untOutgoingData;

interface

uses DateUtils, sysutils, untUtils;

type
  OutgoingDataErrors=(ERROR_NoError=0);
  PByte=^Byte;


type
  TOutgoingData=class
    private
      bPilotSymbol:byte;
      bCommandLength:byte;
      wSubstationAddress:Word;
      bCommandType:byte;
      dtDateTime:TDateTime;
      wYear, wMonth, wDay, wHour, wMinute, wSecond, wMs:WORD;
      bolClearCommEquipment:boolean;
      bolClearIntterupt:boolean;
      bolOutgoingData:boolean;
      bolClearLastRecord:boolean;
      bMaxNumberPeople:byte;
      bAlarm:byte;
      bWarning:byte;
      bOtherCommands:byte;
      bHighRandomCode, bLowRandomCode:byte;
      bCRC16H:byte;
      bCRC16L:byte;
      bolTakeDateFromMe:boolean;
    public
      property PilotSymbol:byte read bPilotSymbol write bPilotSymbol;
      property CommandLength: byte read bCommandLength write bCommandLength;
      property SubStationAddress: Word read wSubstationAddress write wSubstationAddress;
      property CommandType:byte read bCommandType write bCommandType;
      property ClearCommunicationDevice: boolean read bolClearCommEquipment write bolClearCommEquipment;
      property ClearIntterupts: boolean read bolClearIntterupt write bolClearIntterupt;
      property OutgoingData: boolean read bolOutgoingData write bolOutgoingData;
      property ClearLastRecords: boolean read bolClearLastRecord write bolClearLastRecord;
      property MaxNumberPeopleReading: byte read bMaxNumberPeople write bMaxNumberPeople;
      property Alarm: byte read bAlarm write bAlarm;
      property Warning: byte read bWarning write bWarning;
      property OtherCommands: byte read bOtherCommands write bOtherCommands;
      property DateTime:TDateTime read dtDateTime write dtDateTime;
      property TakeDateTimeFromMe: boolean read bolTakeDateFromMe write bolTakeDateFromMe;

      constructor Create;
      function CreateFrame(var Buffer:ByteArray):OutgoingDataErrors;
  end;

implementation

{ TOutgoingData }

constructor TOutgoingData.Create;
begin
  bPilotSymbol:=$7E;
  bCommandType:=$46;
end;

function TOutgoingData.CreateFrame(var Buffer: ByteArray): OutgoingDataErrors;

var
  bDeviceSettings:byte;

begin
  if(bCommandType = $46 ) then
  begin

    if(bolTakeDateFromMe) then
      DecodeDateTime(dtDateTime, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMs)
    else
      DecodeDateTime(Now, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMs);

    bDeviceSettings:=0;

    if(bolClearCommEquipment) then bDeviceSettings:= bDeviceSettings or $01;
    if(bolClearIntterupt) then bDeviceSettings:=bDeviceSettings or $02;
    if (bolOutgoingData) then bDeviceSettings:=bDeviceSettings or $04;
    if (bolClearLastRecord) then bDeviceSettings:=bDeviceSettings or $80;

    SetLength(Buffer, 19);

    buffer[0]:=bPilotSymbol;
    buffer[1]:=$13;
    buffer[2]:=wSubstationAddress div 256;
    buffer[3]:=wSubstationAddress mod 256;
    buffer[4]:=bCommandType;
    buffer[5]:=wYear-2000;
    buffer[6]:=wMonth;
    buffer[7]:=wDay;
    buffer[8]:=wHour;
    buffer[9]:=wMinute;
    buffer[10]:=wSecond;
    buffer[11]:=bDeviceSettings;
    buffer[12]:=bMaxNumberPeople;
    buffer[13]:= bAlarm;
    buffer[14]:=bWarning;
    buffer[15]:=$00;
    buffer[16]:=$00;

    Crc16_ver(buffer);
  end;

end;

end.
