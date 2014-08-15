unit untIncomingData;

interface

uses Sysutils, DateUtils, untUtils;

type
  TCard=record
    wCardDivision:Word;
    bSeconds:byte;
    wCardNumber:Word;
    byteReaderNo:byte;
    bolCarryFlag:Boolean;
    bolLowVoltage:boolean;
    bolGeneralAlarm:boolean;
    bolEmergencyAlarm:boolean;
  end;

  CardArray=array of TCard;

  IncomingDataErrors=(ERROR_NoError=0);

  PWORD=^WORD;

type
  TIncomingData=class
    private
      bCommandSymbol:byte;
      bCommandLength:byte;
      wSubstationID:Word;
      bCommandType:byte;
      bYear, bMonth, bDay, bHour, bMinute, bSecond:byte;
      dtDateTime: TDateTime;
      bHeaderStatus:byte;
      bolSubstationDCAC:boolean;
      bolInterruptArea:boolean;
      bolEventsRecord:boolean;
      bSentoutNumber:byte;
      tcaCards:CardArray;
      wRandomCode:Word;
      wCRC16:Word;

    public
      property SubsationID: word read wSubstationID;
      property CommandType: byte read bCommandType;
      property CommandLength: byte read bCommandLength;
      property HeaderStatus: byte read bHeaderStatus;
      property SubstationDCAC: Boolean read bolSubstationDCAC;
      property InterruptArea: Boolean read bolInterruptArea;
      property EventsRecord: boolean read bolEventsRecord;
      property SentoutNumber: byte read bSentoutNumber;
      property Cards: CardArray read tcaCards;
      property DateTime: TDateTime read dtDateTime;

      constructor Create;
      function Analyze(const Buffer:ByteArray):IncomingDataErrors;
  end;

implementation

{ TIncomingData }

function TIncomingData.Analyze(const Buffer: ByteArray): IncomingDataErrors;
var
  bCardCount:byte;
  i: Integer;

begin
  if Buffer[4] = $0F then
  begin
    bCommandLength:=Buffer[1];
    wSubstationID:= Buffer[2]*256 + Buffer[3];
    bYear:=Buffer[5];
    bMonth:=Buffer[6];
    bDay:=Buffer[7];
    bHour:=Buffer[8];
    bMinute:=Buffer[9];
    bSecond:=Buffer[10];
    dtDateTime:= EncodeDateTime(bYear+2000, bMonth, bDay, bHour, bMinute, bSecond, 0);
    bHeaderStatus:=buffer[11];
    bolSubstationDCAC:= Boolean( Buffer[12] and $01);
    bolInterruptArea:= Boolean(Buffer[12] and $02);
    bolEventsRecord:=Boolean(Buffer[12] and $04);
    bSentoutNumber:=Buffer[13];

    bCardCount:=(Buffer[1] - 18) div 6;

    SetLength(tcaCards, bCardCount);

    for i := 0 to bCardCount - 1 do
    begin
      tcaCards[i].wCardDivision:=PWORD(@Buffer[14+i*6])^;
      tcaCards[i].bSeconds:= Buffer[(14+i*6)+2];
      tcaCards[i].wCardNumber:=PWORD(@Buffer[(14+i*6)+3])^;
      tcaCards[i].byteReaderNo:=Buffer[(14+i*6)+5] and $0F;
      tcaCards[i].bolCarryFlag:=Boolean( Buffer[(14+i*6)+5] and $10);
      tcaCards[i].bolLowVoltage:=Boolean(Buffer[(14+i*6)+5] and $20);
      tcaCards[i].bolGeneralAlarm:=Boolean( Buffer[(14+i*6)+5] and $40);
      tcaCards[i].bolEmergencyAlarm:=Boolean(Buffer[(14+i*6)+5] and $80);
    end;

    wRandomCode:=PWORD(@Buffer[14+(bCardCount*6)])^;
    wCRC16:=PWORD(@Buffer[(14+bCardCount*6)+2])^;

  end;
end;

constructor TIncomingData.Create;
begin
  bCommandSymbol:=$7E;
  bCommandType:=$0F;
end;

end.
