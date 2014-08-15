unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, untSerialPortHelper,
  untUtils;

type
  TForm1 = class(TForm)
    txtSendData: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    SerialPort:TSerialPortHelper;

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
  CPDevice:TSerialPortHelper;
  Buffer:ByteArray;
  str:string;
begin
  HexStringToByteArray(txtSendData.Text, ByteArray(Buffer));
  SerialPort.Send(Buffer);
  Sleep(100);
  SerialPort.Read(Buffer);
  ByteArrayToHex(Buffer, str);
  ShowMessage(str);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SerialPort:=TSerialPortHelper.Create('Com4',9600);
  SerialPort.OnDataReceived:=SeriaPortOnDataReceived;
end;

procedure TForm1.SeriaPortOnDataReceived(Buffer: ByteArray);
var
  str:string;
begin
  ByteArrayToHex(Buffer, str);
  ShowMessage(str);
end;

end.
