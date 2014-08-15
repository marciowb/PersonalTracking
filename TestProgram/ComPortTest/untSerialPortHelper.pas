unit untSerialPortHelper;

interface

uses
  CPort, untUtils, Classes;

type
  TSerialPortErrors = (speNoError = 0);

type
  TDataReceived = procedure(Buffer: ByteArray) of object;

type
  TSerialPortHelper = class
  private
    ComPort: TComPort;
    strComPort: string;
    brBaundRate: TBaudRate;
    EvtDataReceived: TDataReceived;
  public
    property OnDataReceived: TDataReceived read EvtDataReceived
      write EvtDataReceived;

    constructor Create(Port: string; BaundRate: integer);
    function Send(Buffer: ByteArray): TSerialPortErrors;
    function Read(var Buffer: ByteArray): TSerialPortErrors;
    procedure ComPortOnRxBuf(Sender: TObject; const Buffer; Count: integer);

  end;

implementation

{ TSerialPortHelper }

procedure TSerialPortHelper.ComPortOnRxBuf(Sender: TObject; const Buffer;
  Count: integer);
begin
  // ComPort.Read(Buffer, Length(Buffer));

  if (Assigned(EvtDataReceived)) then
    EvtDataReceived(ByteArray(Buffer));
end;

constructor TSerialPortHelper.Create(Port: string; BaundRate: integer);
begin
  strComPort := Port;

  case BaundRate of
    9600:
      brBaundRate := TBaudRate.br9600;
    2400:
      brBaundRate := TBaudRate.br2400;
  end;

  ComPort := TComPort.Create(nil);
  ComPort.Port := Port;

  ComPort.Open;

  ComPort.OnRxBuf := ComPortOnRxBuf;

end;

function TSerialPortHelper.Read(var Buffer: ByteArray)
  : TSerialPortErrors;
begin
  if not ComPort.Connected then
    ComPort.Open;

  ComPort.Read(Buffer, Length(Buffer));

  Result := TSerialPortErrors.speNoError;

end;

function TSerialPortHelper.Send(Buffer: ByteArray): TSerialPortErrors;
begin
  if not ComPort.Connected then
    ComPort.Open;

  ComPort.Write(Buffer, Length(Buffer));

  Result := TSerialPortErrors.speNoError;
end;

end.
