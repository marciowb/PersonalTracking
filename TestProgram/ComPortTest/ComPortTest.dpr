program ComPortTest;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  untSerialPortHelper in 'untSerialPortHelper.pas',
  untUtils in 'untUtils.pas',
  untOutgoingData in 'untOutgoingData.pas',
  untIncomingData in 'untIncomingData.pas',
  untSerialPortNativeThread in 'untSerialPortNativeThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
