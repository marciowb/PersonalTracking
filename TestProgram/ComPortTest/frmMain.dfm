object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 504
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object txtSendData: TEdit
    Left = 24
    Top = 16
    Width = 578
    Height = 21
    TabOrder = 0
    Text = '7E130001460E0702121436000800000000BAC6'
  end
  object Button1: TButton
    Left = 608
    Top = 14
    Width = 75
    Height = 25
    Caption = 'G'#246'nder'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 608
    Top = 101
    Width = 75
    Height = 25
    Caption = 'CRC16'
    TabOrder = 2
    OnClick = Button2Click
  end
  object mmoIncomingData: TMemo
    Left = 24
    Top = 56
    Width = 578
    Height = 169
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object lbxCards: TListBox
    Left = 24
    Top = 231
    Width = 569
    Height = 265
    ItemHeight = 13
    TabOrder = 4
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 635
    Top = 184
  end
end
