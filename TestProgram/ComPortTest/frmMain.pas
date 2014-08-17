unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, untSerialPortHelper,
  untUtils,  untSerialPortNativeThread, untIncomingData, untOutgoingData,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    txtSendData: TEdit;
    Button1: TButton;
    Button2: TButton;
    mmoIncomingData: TMemo;
    lbxCards: TListBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    //SerialPort:TSerialPortHelper;
    SerialPort:TSerialPortNativeThread;
    bolClear:Boolean;

    procedure SeriaPortOnDataReceived(Buffer:ByteArray);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Buffer:ByteArray;
  str:string;
  OutgoingData:TOutgoingData;
begin
  //SetLength(Buffer, 1024);
  //HexStringToByteArray(txtSendData.Text, ByteArray(Buffer));
  //SerialPort.Write(Buffer);
  //Sleep(100);
{
    SetLength(Buffer, 1024);
    if (SerialPort.Read(Buffer) <> 0) then
    begin
      ByteArrayToHex(Buffer, str);
      ShowMessage(str);
    end;
}

  OutgoingData:=TOutgoingData.Create;
  OutgoingData.SubStationAddress:=255;
  OutgoingData.TakeDateTimeFromMe:=false;
  OutgoingData.ClearLastRecords:=false;
  OutgoingData.MaxNumberPeopleReading:=15;
  OutgoingData.Alarm:=0;
  OutgoingData.Warning:=0;
  OutgoingData.OtherCommands:=0;

  OutgoingData.CreateFrame(Buffer);

  ByteArrayToHex(Buffer, str);
  txtSendData.Text:=str;

  if (SerialPort.Connected) then SerialPort.Write(Buffer);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Buffer:ByteArray;
  str:string;
begin
  SetLength(Buffer, Length( txtSendData.Text) div 2);
  HexStringToByteArray(txtSendData.Text, ByteArray(Buffer));
  ShowMessage(IntToStr(Crc16_ver(Buffer)));

  ByteArrayToHex(Buffer, str);
  ShowMessage(str);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //SerialPort:=TSerialPortHelper.Create('Com1',9600);
  //SerialPort.OnDataReceived:=SeriaPortOnDataReceived;
  SerialPort:=TSerialPortNativeThread.Create(false, 'COM4', 9600);
  SerialPort.OnReceivedData:=SeriaPortOnDataReceived;
  if (not SerialPort.Connected) then ShowMessage('No Connection');
  bolClear:=true;

end;

procedure TForm1.SeriaPortOnDataReceived(Buffer: ByteArray);
var
  str:string;
  IncomingData:TIncomingData;
  i:integer;
begin
  ByteArrayToHex(Buffer, str);

  mmoIncomingData.Lines.Add(str);

  IncomingData:=TIncomingData.Create;
  IncomingData.Analyze(buffer);
  //lbxCards.Clear;

  //lbxCards.Items.Clear;

  str:=IntToStr(IncomingData.HeaderStatus) + ';' + BoolToStr(IncomingData.SubstationDCAC) + ';'+
        BoolToStr(IncomingData.InterruptArea) + ';' + BoolToStr(IncomingData.EventsRecord);

  lbxCards.Items.Add(str);

  for i := Low(IncomingData.Cards) to High(IncomingData.Cards) do
  begin
    str:= IntToStr(IncomingData.Cards[i].CardNumber)+';' +
      IntToStr(IncomingData.Cards[i].Seconds) +';' +
      IntToStr(IncomingData.Cards[i].CardDivision)+';' +
      IntToStr(IncomingData.Cards[i].CardNumberLo)+';' +
      IntToStr(IncomingData.Cards[i].CardNumberHi);;
    //if( lbxCards.Items.IndexOf(str) = -1) then lbxCards.Items.Add(str);

    lbxCards.Items.Add(str);

      if(IncomingData.Cards[i].EmergencyAlarm) then ShowMessage(str);

  end;

  //ShowMessage( DateTimeToStr(IncomingData.DateTime));

  //ShowMessage(str);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Buffer:ByteArray;
  str:string;
  OutgoingData:TOutgoingData;
begin
  OutgoingData:=TOutgoingData.Create;
  OutgoingData.SubStationAddress:=255;
  OutgoingData.TakeDateTimeFromMe:=false;
  OutgoingData.ClearLastRecords:=bolClear;
  OutgoingData.ClearCommunicationDevice:=false;
  OutgoingData.ClearIntterupts:=false;
  OutgoingData.MaxNumberPeopleReading:=15;
  OutgoingData.Alarm:=10;
  OutgoingData.Warning:=0;
  OutgoingData.OtherCommands:=0;

  OutgoingData.CreateFrame(Buffer);

  ByteArrayToHex(Buffer, str);
  txtSendData.Text:=str;

  if (SerialPort.Connected) then SerialPort.Write(Buffer);

  bolClear:=not bolClear;

end;

end.
