unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, untSerialPortHelper,
  untUtils;

type
  TForm1 = class(TForm)
    ComPort: TComPort;
    txtSendData: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    SerialPort:TSerialPortHelper;

    procedure SeriaPortOnDataReceived(Buffer:TSerialPortBuffer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  SerialPort:=TSerialPortHelper.Create('Com4');
  SerialPort.OnDataReceived:=@SeriaPortOnDataReceived;
end;

procedure TForm1.SeriaPortOnDataReceived(Buffer: TSerialPortBuffer);
begin

end;

end.