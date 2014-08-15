unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, untSerialPortHelper,
  untUtils,  untSerialPortNativeThread, untIncomingData;

type
  TForm1 = class(TForm)
    txtSendData: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    //SerialPort:TSerialPortHelper;
    SerialPort:TSerialPortNativeThread;

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
begin
  SetLength(Buffer, 1024);
  HexStringToByteArray(txtSendData.Text, ByteArray(Buffer));
  SerialPort.Write(Buffer);
  Sleep(100);
{
    SetLength(Buffer, 1024);
    if (SerialPort.Read(Buffer) <> 0) then
    begin
      ByteArrayToHex(Buffer, str);
      ShowMessage(str);
    end;
}
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
  SerialPort:=TSerialPortNativeThread.Create(false, 'COM1', 9600);
  SerialPort.OnReceivedData:=SeriaPortOnDataReceived;
end;

procedure TForm1.SeriaPortOnDataReceived(Buffer: ByteArray);
var
  str:string;
  IncomingData:TIncomingData;
begin
  ByteArrayToHex(Buffer, str);
  MessageBox(self.Handle, PWideChar(str), '', MB_OK);

  IncomingData:=TIncomingData.Create;
  IncomingData.Analyze(buffer);

  ShowMessage( DateTimeToStr(IncomingData.DateTime));

  //ShowMessage(str);
end;

end.
