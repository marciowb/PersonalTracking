unit untSerialPortHelper;

interface
uses
CPort;

type
  TSerialPortBuffer=array[0..1023] of byte;
  TDataReceived=procedure(Buffer:TSerialPortBuffer) of object;

type
  TSerialPortHelper=class
    private
      ComPort:TComPort;
      strComPort:string;
      brBaundRate:TBaudRate;
      EvtDataReceived:TDataReceived;
    public
      property OnDataReceived: TDataReceived read EvtDataReceived write EvtDataReceived;

      constructor Create(Port: string; BaundRate:integer);
      function Send(Buffer:TSerialPortBuffer):boolean;
      procedure ComPortOnRxBuf(Sender:TObject);

  end;

implementation

{ TSerialPortHelper }

procedure TSerialPortHelper.ComPortOnRxBuf(Sender: TObject);
var
  Buffer:TSerialPortBuffer;
begin
  ComPort.Read(Buffer, Length(Buffer));

  if(Assigned(EvtDataReceived)) then EvtDataReceived(Buffer);
end;

constructor TSerialPortHelper.Create(Port: string; BaundRate:integer);
begin
  inherited;

  strComPort:=Port;

  case BaundRate of
    9600:brBaundRate:=TBaudRate.br9600;
    2400:brBaundRate:=TBaudRate.br2400;
  end;

  ComPort:=TComPort.Create(nil);
  ComPort.Port:=Port;

  Comport.Open;

  ComPort.OnRxBuf:=@ComPortOnRxBuf;
  
end;

function TSerialPortHelper.Send(Buffer: TSerialPortBuffer): boolean;
begin
  if ComPort.Connected then
  begin
    ComPort.Write(Buffer, Length(Buffer));
  end;
end;



end.
