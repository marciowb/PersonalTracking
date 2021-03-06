unit untSendingData;

interface

type
  TSendingData=class
    private
      bPilotSymbol:byte;
      bCommandLength:byte;
      wSubstationAddress:Word;
      bCommandType:byte;
      bYear, bMonth, bDay, bHour, bMinute, bSecond:byte;
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

      constructor Create;
  end;

implementation

{ TSendingData }

constructor TSendingData.Create;
begin
  bPilotSymbol:=$7E;
  bCommandType:=$46;
end;

end.
